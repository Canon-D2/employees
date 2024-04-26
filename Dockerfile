# Sử dụng image chính thức của ASP.NET Core 8
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

# Sử dụng image SDK của .NET Core để build ứng dụng
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["CRUD-BASE-SGU/CRUD-BASE-SGU.csproj", "CRUD-BASE-SGU/"]
RUN dotnet restore "CRUD-BASE-SGU/CRUD-BASE-SGU.csproj"
COPY . .
WORKDIR "/src/CRUD-BASE-SGU"
RUN dotnet build "CRUD-BASE-SGU.csproj" -c Release -o /app/build

# Publish ứng dụng
FROM build AS publish
RUN dotnet publish "CRUD-BASE-SGU.csproj" -c Release -o /app/publish

# Chạy ứng dụng
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CRUD-BASE-SGU.dll"]
