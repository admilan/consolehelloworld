FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

COPY . .
RUN ls
RUN dotnet build "*.sln" -c Release -o /app
    
RUN addgroup --system --gid 1000 customgroup \
    && adduser --system --uid 1000 --ingroup customgroup --shell /bin/sh customuser

RUN chown -R customuser /app
RUN chown -R customuser /root

USER customuser