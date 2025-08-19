@echo off
echo Building the application...
call mvn clean package -DskipTests

if %ERRORLEVEL% == 0 (
    echo ✅ Build successful!
    echo 📦 JAR file location: target\authdemo-0.0.1-SNAPSHOT.jar
    echo.
    echo 🚀 Ready for deployment to Render!
    echo.
    echo Next steps:
    echo 1. Push your code to GitHub
    echo 2. Connect your GitHub repo to Render
    echo 3. Set the following environment variables in Render:
    echo    - DATABASE_URL: ^(from your PostgreSQL database^)
    echo    - DB_USERNAME: ^(from your PostgreSQL database^)
    echo    - DB_PASSWORD: ^(from your PostgreSQL database^)
    echo    - SPRING_PROFILES_ACTIVE: production
    echo.
    echo 4. Render build command: mvn clean package -DskipTests
    echo 5. Render start command: java -Dspring.profiles.active=production -jar target/authdemo-0.0.1-SNAPSHOT.jar
) else (
    echo ❌ Build failed! Please check the errors above.
)
pause
