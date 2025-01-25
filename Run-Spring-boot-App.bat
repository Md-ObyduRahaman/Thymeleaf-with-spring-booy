@echo off
REM Step 1: Start Docker (if not already running)
echo Starting Docker...
start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"
echo Waiting for Docker to start...
timeout /t 10 > nul

REM Step 2: Restart the MySQL Docker container
echo Restarting MySQL Docker container...
docker start 1fc79b830e8b63f4d1229d4f9658fb504e1512900fa51e9a79a6033c2633afaf
if errorlevel 1 (
    echo Failed to start the container. Make sure Docker is running.
    pause
    exit /b
)
echo MySQL container started successfully.

REM Step 3: Navigate to your Spring Boot project directory
cd /d "C:\Users\Regis\Desktop\dd\springboot-blog-webapp"

REM Step 4: Run the Spring Boot application using Maven wrapper
echo Starting Spring Boot application...
call mvnw spring-boot:run

REM Step 5: Pause to keep the terminal open
pause

