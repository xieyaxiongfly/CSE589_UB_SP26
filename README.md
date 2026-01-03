# CSE610 Special Topics on Mobile Sensing & Mobile Networks - Fall 2025

Course website for CSE610 at University at Buffalo, SUNY.

## Course Information

**Instructor:** Yaxiong Xie  
**Email:** yaxiongx@buffalo.edu  
**Office:** Davis Hall 321  
**Office Hours:** By appointment - please email to schedule  

**Lecture Time:** Tuesday, 3:00 PM - 6:20 PM  
**Location:** Baldy Hall 108, North Campus  
**Semester:** Fall 2025  

## Course Description

This course focuses on wireless technologies, mobile networking, and mobile sensing with applications in IoT, signal processing, and human-computer interaction. Students will explore cutting-edge research in mobile computing systems and engage with state-of-the-art technologies.

## Website Features

- 📅 **Smart Schedule System**: Automatically generates class dates based on semester start and configured class days
- 📚 **Course Materials**: Organized lectures, assignments, and project information
- 👥 **Staff Information**: Detailed instructor information with flexible TA support
- 📱 **Responsive Design**: Works seamlessly on desktop and mobile devices
- 🎨 **Professional Styling**: Clean, minimalist black and white theme
- 🔧 **Easy Maintenance**: YAML-based configuration for easy updates
- 🎛️ **Web Dashboard**: Intuitive web interface for content management without editing files

## Technical Details

This website is built using Jekyll and hosted on GitHub Pages, with a Flask-based dashboard for content management. Key features include:

- **Automatic Schedule Generation**: Calculates all class dates based on semester start date and class days
- **Flexible Content Management**: Easy-to-update YAML files for course data
- **Web Dashboard**: Flask-based interface for non-technical content management
- **Responsive Layout**: Optimized for all screen sizes
- **Black & White Theme**: Minimalist, professional design with configurable logo
- **Real-time Updates**: Dashboard changes are immediately reflected in Jekyll site files

## Repository Structure

```
├── _config.yml                 # Site configuration (includes logo settings)
├── _data/
│   ├── people.yml              # Instructor and TA information
│   ├── course_schedule.yml     # Course schedule and lecture topics
│   └── additional_events.yml   # Exams, assignments, presentations
├── _layouts/                   # Page templates
├── _sass/                      # Styling files (black and white theme)
├── _includes/                  # Reusable components
├── _images/                    # Logo and profile pictures
├── dashboard/                  # Web-based content management system
│   ├── app.py                  # Flask application
│   ├── templates/              # Dashboard HTML templates
│   ├── requirements.txt        # Python dependencies
│   └── README.md              # Dashboard documentation
└── static_files/              # Course materials and resources
```

## Local Development

To run this website locally:

1. Install Jekyll: `gem install jekyll bundler`
2. Clone the repository
3. Run: `bundle install`
4. Start local server: `bundle exec jekyll serve`
5. Visit: `http://localhost:4000/CSE610_UB_fall25/`

## Updating Course Content

### Method 1: Web Dashboard (Recommended)

The easiest way to manage course content is through the web dashboard:

1. **Start the dashboard**:
   ```bash
   cd dashboard
   python run.py
   ```

2. **Access the interface**: Open `http://localhost:8080` in your browser
3. **Login**: Use password `admin123` (change this in production!)
4. **Manage content**:
   - **Schedule**: Add lectures, materials, and manage weekly content
   - **People**: Add/modify instructor and TA information
   - **Configuration**: Update course details, logo, and site settings

### Method 2: Manual File Editing

For advanced users, you can directly edit the YAML files:

- **Lectures**: Edit `_data/course_schedule.yml`
- **Staff**: Update `_data/people.yml`
- **Events**: Edit `_data/additional_events.yml`
- **Course Info**: Update `_config.yml` and `index.md`
- **Logo**: Configure logo path and size in `_config.yml`

## Deployment

The website is automatically deployed to GitHub Pages when changes are pushed to the main branch.

**Live URL:** https://xieyaxiongfly.github.io/CSE610_UB_fall25/

## Key Customizations

This website includes several major enhancements:

- **Web Dashboard**: Complete Flask-based content management system
- **Black & White Theme**: Professional minimalist design
- **Configurable Logo**: Logo path and size configurable via dashboard or YAML
- **Enhanced Styling**: Improved responsive design and typography
- **Better UX**: Streamlined navigation and content organization

## Template Credit

This website is based on the [Jekyll Course Website Template](https://github.com/kazemnejad/jekyll-course-website-template) with extensive customizations for CSE610.

---

*University at Buffalo, SUNY - Computer Science and Engineering*