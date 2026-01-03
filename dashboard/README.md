# Course Website Dashboard

A web-based dashboard for managing your Jekyll course website content without manually editing YAML files.

## Features

- **Schedule Management**: Add lectures, manage weekly content, and attach materials
- **People Management**: Add instructors and teaching assistants
- **Site Configuration**: Update course information and settings
- **User-Friendly Interface**: Modern web interface with responsive design
- **Real-time Updates**: Changes are immediately reflected in your Jekyll site files

## Quick Start

### Local Development

1. **Navigate to the dashboard directory**:
   ```bash
   cd dashboard
   ```

2. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

3. **Run the dashboard**:
   ```bash
   python run.py
   ```
   
   Or simply:
   ```bash
   python app.py
   ```

4. **Access the dashboard**:
   - Open your browser and go to `http://localhost:5000`
   - Default password: `admin123`

### Remote Deployment

#### Option 1: Simple Server Deployment

1. **Upload the dashboard folder to your server**
2. **Install Python and dependencies**:
   ```bash
   pip install -r requirements.txt
   ```
3. **Run with external access**:
   ```bash
   python app.py
   ```
   The dashboard will be available at `http://your-server-ip:5000`

#### Option 2: Using a Web Server (Recommended for Production)

1. **Install Gunicorn**:
   ```bash
   pip install gunicorn
   ```

2. **Run with Gunicorn**:
   ```bash
   gunicorn -w 4 -b 0.0.0.0:5000 app:app
   ```

3. **Use a reverse proxy** (nginx/Apache) for HTTPS and better performance

#### Option 3: Docker Deployment

Create a `Dockerfile`:
```dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["python", "app.py"]
```

Build and run:
```bash
docker build -t course-dashboard .
docker run -p 5000:5000 -v /path/to/your/site:/app/site course-dashboard
```

## Security Configuration

**⚠️ Important: Change the default password before deployment!**

Edit `app.py` and modify these lines:
```python
app.secret_key = 'your-secret-key-change-this'  # Change this!
ADMIN_PASSWORD = "admin123"  # Change this!
```

For production:
1. Use environment variables for sensitive configuration
2. Implement proper authentication (consider OAuth, LDAP, etc.)
3. Use HTTPS
4. Restrict access by IP if needed

## File Structure

```
dashboard/
├── app.py              # Main Flask application
├── run.py              # Launcher script
├── requirements.txt    # Python dependencies
├── README.md          # This file
└── templates/         # HTML templates
    ├── base.html      # Base template
    ├── index.html     # Dashboard home
    ├── login.html     # Login page
    ├── schedule.html  # Schedule management
    ├── people.html    # People management
    └── config.html    # Configuration
```

## How It Works

The dashboard directly modifies your Jekyll site's YAML data files:

- `_data/course_schedule.yml` - Course schedule and lectures
- `_data/people.yml` - Instructors and teaching assistants  
- `_config.yml` - Site configuration

Changes are immediately saved to these files. After making changes:

1. **For GitHub Pages**: Commit and push the changes to trigger a rebuild
2. **For local Jekyll**: Run `bundle exec jekyll serve` to see changes
3. **For other hosting**: Follow your hosting provider's rebuild process

## Supported Operations

### Schedule Management
- Add new lectures by week and day
- Add materials (slides, readings, etc.) to lectures
- Delete existing lectures
- View complete course schedule

### People Management
- Add instructors with full profile information
- Add teaching assistants
- Manage contact information and office hours

### Site Configuration
- Update course name and description
- Modify semester information
- Change school and URL settings

## Troubleshooting

### Common Issues

1. **Permission Errors**: Ensure the dashboard has write access to the `_data` directory
2. **Port Already in Use**: Change the port in `app.py` or kill the process using port 5000
3. **Import Errors**: Install missing dependencies with `pip install -r requirements.txt`

### Logs and Debugging

Run with debug mode for detailed error messages:
```python
app.run(debug=True, host='0.0.0.0', port=5000)
```

## Customization

### Adding New Features

1. **New Data Types**: Create new routes in `app.py`
2. **New Templates**: Add HTML templates in the `templates/` directory
3. **Styling**: Modify the CSS in `templates/base.html`

### Integration with Other Tools

- **Git Hooks**: Add automatic commits after changes
- **Slack/Email Notifications**: Notify when content is updated
- **Backup System**: Automatically backup YAML files

## Contributing

Feel free to extend this dashboard with additional features:
- Assignment management
- Announcement system
- Student roster management
- Grade book integration
- Analytics and reporting

## Support

For issues or questions:
1. Check the troubleshooting section
2. Review Flask and YAML documentation
3. Open an issue in the repository