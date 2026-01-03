# Schedule System Usage Guide

This Jekyll site now includes an automated schedule generation system that allows you to easily manage course schedules without manually entering dates.

## How It Works

The system combines two types of content:
1. **Regular lectures** - Automatically calculated dates based on weekly schedule
2. **Additional events** - Manually specified dates for special events

## Configuration Files

### 1. Course Schedule Configuration (`_data/course_schedule.yml`)

This file contains:
- **Semester dates**: Start and end dates
- **Class schedule**: Days and times (Tuesday/Thursday 2:00 PM)
- **Holidays**: Dates when there are no classes
- **Weekly lectures**: Topics and materials for each week

```yaml
course_schedule:
  semester_start: "2025-09-02"  # First Tuesday
  semester_end: "2025-12-11"    # Last Thursday
  class_days:
    - day: "tuesday"
      time: "14:00"
    - day: "thursday" 
      time: "14:00"

lectures:
  - week: 1
    tuesday:
      topic: "Introduction to Mobile Sensing"
      materials:
        - name: "Lecture Slides"
          url: "/static_files/lectures/01_intro_slides.pdf"
    thursday:
      topic: "Mobile Networks Overview"
      materials:
        - name: "Lecture Slides"
          url: "/static_files/lectures/02_networks_slides.pdf"
```

### 2. Additional Events (`_data/additional_events.yml`)

For events that don't follow the regular schedule:

```yaml
additional_events:
  - date: "2025-09-15"
    type: "assignment_due"
    topic: "Assignment 1: Mobile App Analysis" 
    materials:
      - name: "Assignment Description"
        url: "/static_files/assignments/assignment1.pdf"
```

## Adding Content

### Adding a Regular Lecture

1. Open `_data/course_schedule.yml`
2. Add a new week or update existing week:

```yaml
- week: 4
  tuesday:
    topic: "Your Lecture Topic"
    materials:
      - name: "Slides"
        url: "/path/to/slides.pdf"
      - name: "Reading"
        url: "https://example.com/paper.pdf"
  thursday:
    topic: "Another Topic" 
    materials:
      - name: "Slides"
        url: "/path/to/slides2.pdf"
```

The dates will be automatically calculated as:
- Week 1 Tuesday = semester_start
- Week 1 Thursday = semester_start + 2 days
- Week 2 Tuesday = semester_start + 7 days
- etc.

### Adding Special Events

1. Open `_data/additional_events.yml`
2. Add your event:

```yaml
- date: "2025-10-15"
  type: "exam"  # or assignment_due, presentation, project_due
  topic: "Midterm Exam"
  materials:
    - name: "Study Guide"
      url: "/static_files/study_guide.pdf"
```

## Event Types and Colors

- **lecture** - Green border (regular class)
- **assignment_due** - Orange border
- **exam** - Red border  
- **presentation** - Purple border
- **project_due** - Dark green border

## Schedule Display

The final schedule will show:
- **Date**: Month/day format with day name
- **Topic**: Lecture title or event name
- **Materials**: Clickable links to PDFs, papers, etc.

All events are automatically sorted by date and displayed in a single table.

## Benefits

1. **No manual date entry** for regular lectures
2. **Automatic sorting** by date
3. **Flexible** for special events
4. **Easy maintenance** - just update topics and materials
5. **Color coding** for different event types
6. **Responsive design** that works on mobile

## Updating for New Semester

1. Update `semester_start` and `semester_end` dates
2. Update `holidays` list
3. Update lecture topics and materials for each week
4. Update additional events with new dates