using System;
using System.Net;
using System.Text.Json;
using System.Threading.Tasks;
// using LMSystem.Application.Errors;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;

namespace LMSystem.Middleware
{
    public class ErrorHandlingMiddleware
    {
        private readonly RequestDelegate _next;
     
        public ErrorHandlingMiddleware(RequestDelegate next)
        {
            _next = next;

        }

        public async Task Invoke(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (Exception e)
            {
                await HadlerExceptionAsync(context, e);
            }
        }

        private async Task HadlerExceptionAsync(HttpContext context, Exception ex)
        {
            object errors = null;

            switch (ex)
            {
               
                case Exception e:
                    // logger.LogError(ex, "SERVER ERROR");
                    errors = string.IsNullOrWhiteSpace(e.Message) ? "Error" : e.Message;
                    context.Response.StatusCode = (int) HttpStatusCode.InternalServerError;
                    break;
            }

            context.Response.ContentType = "applicatoin/json";
            if (errors != null)
            {
                var result = JsonSerializer.Serialize(new {errors});

            await context.Response.WriteAsync(result);

            }

        }
    }
}