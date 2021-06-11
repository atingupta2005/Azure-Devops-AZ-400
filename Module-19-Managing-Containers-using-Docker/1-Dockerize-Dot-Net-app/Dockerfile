FROM mcr.microsoft.com/dotnet/core/sdk:3.1
WORKDIR /app
COPY  . .
ENV ASPNETCORE_URLS http://*:80
EXPOSE 80
ENTRYPOINT ["dotnet", "core-web-app-docker.dll"]
