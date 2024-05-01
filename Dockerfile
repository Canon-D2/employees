# Sử dụng image chính thức của ASP.NET Core 8
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080

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
ENV CONNECTION_STRING="Server=gateway01.ap-southeast-1.prod.aws.tidbcloud.com;Port=4000;Database=EMPLOYEES;Uid=2VnVXK5gW49FXpR.root;Pwd=ng5t4JNP7v51MAjK;"
ENTRYPOINT ["dotnet", "CRUD-BASE-SGU.dll"]
