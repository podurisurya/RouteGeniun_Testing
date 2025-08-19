# RouteGenius - Deployment Guide

## 🚀 Deploying to Render

### Prerequisites
- GitHub account
- Render account
- PostgreSQL database created on Render

### Step 1: Prepare Your Database Connection

From your Render PostgreSQL database, you'll need these details:
- **External Database URL** (this will be your DATABASE_URL)
- **Username**
- **Password**
- **Database Name**

### Step 2: Push to GitHub

1. Make sure all your changes are committed:
   ```bash
   git add .
   git commit -m "Prepare for Render deployment"
   git push origin main
   ```

### Step 3: Deploy on Render

#### Option A: Using render.yaml (Recommended)
1. Go to Render Dashboard
2. Click "New" → "Blueprint"
3. Connect your GitHub repository
4. Render will automatically detect the `render.yaml` file
5. The database will be automatically connected

#### Option B: Manual Deployment
1. Go to Render Dashboard
2. Click "New" → "Web Service"
3. Connect your GitHub repository
4. Configure the following settings:

**Build Settings:**
- **Build Command:** `mvn clean package -DskipTests`
- **Start Command:** `java -Dspring.profiles.active=production -jar target/authdemo-0.0.1-SNAPSHOT.jar`

**Environment Variables:**
- `DATABASE_URL`: Your PostgreSQL External Database URL
- `DB_USERNAME`: Your PostgreSQL username
- `DB_PASSWORD`: Your PostgreSQL password
- `SPRING_PROFILES_ACTIVE`: `production`
- `MAIL_USERNAME`: `teamroutemax@gmail.com`
- `MAIL_PASSWORD`: `cbfn tlwn keil eimk`

### Step 4: Verify Deployment

1. Wait for the build to complete
2. Check the deployment logs for any errors
3. Access your application using the Render-provided URL
4. Test database connectivity by registering a new user

## 🔧 Local Development

### Running Locally
```bash
# Using Maven
mvn spring-boot:run

# Using JAR
mvn clean package -DskipTests
java -jar target/authdemo-0.0.1-SNAPSHOT.jar
```

### Database Configuration
- **Development:** MySQL (localhost:3306)
- **Production:** PostgreSQL (Render)

The application automatically switches between databases based on the active profile.

## 📝 Configuration Files

- `application.properties`: Default configuration (MySQL for local)
- `application-production.properties`: Production configuration (PostgreSQL)
- `render.yaml`: Render deployment blueprint
- `Dockerfile`: Docker containerization (multi-stage build)

## 🛠️ Technologies Used

- **Backend:** Spring Boot 3.3.2
- **Database:** PostgreSQL (Production), MySQL (Development)
- **Security:** Spring Security
- **Email:** Spring Mail with Gmail SMTP
- **WebSocket:** Spring WebSocket
- **Build Tool:** Maven

## 📊 Database Schema

The application uses JPA with `hibernate.ddl-auto=update` to automatically create and update database tables.

## 🔍 Troubleshooting

### Common Issues:

1. **Database Connection Failed**
   - Check if DATABASE_URL is correctly set
   - Verify PostgreSQL credentials
   - Ensure database is running

2. **Build Failed**
   - Check Java version (requires Java 17)
   - Verify Maven dependencies
   - Run `mvn clean package` locally first

3. **Application Won't Start**
   - Check environment variables
   - Verify active profile is set to 'production'
   - Review application logs

### Logs and Monitoring
- Check Render deployment logs
- Monitor application performance
- Database connection pool metrics

## 📧 Support

For issues or questions, please check:
- Render documentation
- Spring Boot guides
- PostgreSQL documentation

---
**Note:** Make sure to never commit sensitive information like database passwords to your repository. Always use environment variables for production credentials.
