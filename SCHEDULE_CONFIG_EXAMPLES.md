# Schedule Configuration Examples

## 当前支持的配置选项

### 1. 每周一次课（只有Tuesday）

```yaml
course_schedule:
  semester_start: "2025-08-25"  # 学期开始日期
  semester_end: "2025-12-08"    # 学期结束日期
  
  class_days:
    - day: "tuesday"
      time: "14:00"

lectures:
  - week: 1
    tuesday:
      topic: "Introduction to Mobile Sensing"
      materials:
        - name: "Lecture Slides"
          url: "/static_files/lectures/01_intro_slides.pdf"
```

### 2. 每周两次课（Tuesday + Thursday）

```yaml
course_schedule:
  semester_start: "2025-08-25"  
  semester_end: "2025-12-08"    
  
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

### 3. 每周三次课（Monday + Wednesday + Friday）

```yaml
course_schedule:
  semester_start: "2025-08-25"  # 确保这是第一个Monday
  semester_end: "2025-12-08"    
  
  class_days:
    - day: "monday"
      time: "10:00"
    - day: "wednesday"
      time: "10:00"
    - day: "friday"
      time: "10:00"

lectures:
  - week: 1
    monday:
      topic: "Course Introduction"
      materials:
        - name: "Syllabus"
          url: "/static_files/syllabus.pdf"
    wednesday:
      topic: "Basic Concepts"
      materials:
        - name: "Lecture Slides"
          url: "/static_files/lectures/01_basic.pdf"
    friday:
      topic: "Fundamentals"
      materials:
        - name: "Lecture Slides"
          url: "/static_files/lectures/02_fundamentals.pdf"
```

### 4. 灵活安排（不同周可以有不同安排）

```yaml
lectures:
  - week: 1
    tuesday:
      topic: "Introduction"
      materials: [...]
    thursday:
      topic: "Overview"
      materials: [...]
  
  - week: 2
    tuesday:
      topic: "Deep Dive"
      materials: [...]
    # 这周没有Thursday课
  
  - week: 3
    # 这周只有Thursday课
    thursday:
      topic: "Special Topic"
      materials: [...]
```

## 支持的星期

系统支持以下星期设置：
- `monday`
- `tuesday` 
- `wednesday`
- `thursday`
- `friday`
- `saturday`
- `sunday`

## 重要提示

1. **semester_start 日期**：确保这个日期是你想要的第一节课的那一天的星期。比如如果你每周二上课，semester_start 应该是一个Tuesday。

2. **灵活性**：你可以为任何一周的任何一天设置课程，系统会自动计算正确的日期。

3. **跳过周次**：如果某周没有课（比如假期），简单地不在配置中包含那一周即可。

4. **材料链接**：每节课可以有多个材料链接，支持PDF、网页等任何URL。

## 当前你的配置

你当前的配置是每周二上课，但已经启用了周四课程。如果你想要每周两次课，可以为每周添加Thursday的内容。如果想要不同的安排，可以修改 `class_days` 部分。