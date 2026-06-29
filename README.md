# Student Progress Tracking System

## Application Overview

The Student Progress Tracking System is a web application designed to help mentors and instructors manage students, courses, assignments, and monitor learning progress efficiently.

The application provides a centralized platform where mentors can:

- Register and manage students
- Create and manage courses
- Create and manage assignments
- Track student progress
- View progress reports
- Manage account information

---

## Development Environment

| Technology | Version |
|------------|---------|
| Ruby | 3.0.1 |
| Rails | 6.1.7.6 |
| PostgreSQL | 13+ |

---

## Setup Instructions

### Clone the Repository

```bash
git clone https://github.com/kmercy-afk/student_progress_system.git
```

### Move into the Project Directory

```bash
cd student_progress_system
```

### Install Dependencies

```bash
bundle install
```

### Create the Database

```bash
rails db:create
```

### Run Migrations

```bash
rails db:migrate
```

### Start the Server

```bash
rails s
```

### Open the Application

```text
http://localhost:3000
```

---

## Catalog Design

Paste your Google Sheet shared link here:

https://docs.google.com/spreadsheets/d/1Nuv9gYsQhKlRwhjizCkCjGCRNzEHWtcrYvYpnyZFCO8/edit?usp=sharing


---

## Table Definition

Paste your Google Sheet shared link here:

https://docs.google.com/spreadsheets/d/1Nuv9gYsQhKlRwhjizCkCjGCRNzEHWtcrYvYpnyZFCO8/edit?usp=sharing

---

## ER Diagram

![ER Diagram](docs/er_diagram.png)

---

## Screen Transition Diagram

![Screen Transition Diagram](docs/screen_transition_diagram.png)

---

## Wireframe

![Wireframe](docs/wireframe.png)

---

## Main Functions

### High Priority Functions

- User Registration
- Login
- Student Management
- Course Management
- Assignment Management
- Progress Tracking
- Search Students

### Low Priority Functions

- Reports
- Notifications

---

## Database Tables

### Users

- id
- name
- email
- password_digest
- admin
- created_at
- updated_at

### Students

- id
- name
- email
- phone_number
- user_id
- created_at
- updated_at

### Courses

- id
- title
- description
- user_id
- created_at
- updated_at

### Assignments

- id
- title
- description
- due_date
- course_id
- created_at
- updated_at

### Progresses

- id
- student_id
- course_id
- completion_percentage
- status
- created_at
- updated_at

---

## Author

Mercy Kariuki