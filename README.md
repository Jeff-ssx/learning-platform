# README
A modular student management system.


# Setup
### Docker
Docker version :
```
Docker version 26.1.4
```

Docker Compose version:
```
docker-compose version 1.29.2
```

# Start Application

1. Build docker images

```
docker compose build
```

2. Start Application

```
docker compose up
```
* issues :Not supported URL scheme http+docke from docker-compose up
  * Try to run `DOCKER_HOST=unix:///var/run/docker.sock` berfore running commands
  * And verify by run `echo $DOCKER_HOST`
  * If the issue remains
    * Try to click the button in `docker-compose.yaml` file.

3. Access the application through

```
localhost:3000
```

## Features

### Student User

Login

* As a student user, i want to be able to login.
  * only be able to login to the school the student belongs to.
  * only be able to login to the student page.
* As a student user, i am only belongs to one school.

* **Potential Features**:
  * Account creation
  * Password Reset

Terms

* As a student user, i want to be able to view all terms.
  * only terms belongs to the school
* As a student user, i want to be able to choose terms.
  * only terms belongs to the school
* As a studnet user, i want to know if i have the access to the term.
* As a student user, i want to get access to the term.
  * getting access by paying through credit cards.
  * getting access by providing pre-generated license code.
* As a student user, i want to be able to have access to many terms.

* **Potential Features**:
  * read-only access to the past terms
  * read-only access to the future terms courses list before payment
    * student user cannot enroll into a course without the access to the term.

Courses

* As a student user, i want to be able to view all available courses.
  * only courses from the school
  * only courses from the picked terms
    * student user must has the access to the picked term.
* As a student user, i want to be able to enroll into courses.
  * only enroll into available courses.

* **Potential Features**:
  * pre-requestie check
  * time conflict check

### School Admin

Login

* As a school admin user, i want to be able to login.
  * only be able to login to the school which the school admin belongs to.
  * only be able to login to the school admin page.
* As a school admin user, i am only belongs to one school.

* **Potential Features**:
  * create, update, delete school admin accounts
  * password reset

Data Dashboard

* As a school admin user, i want to be able to view data summaries.
  * Number of students enrolled per course.
  * Number of students enrolled per term.
  * Number of students enrolled using credit card.
  * Number of students enrolled using licenses.

* **Potential Features**:
  * student view
    * terms, courses for each student from the same school

license

* **Potential Features**:
  * issue, revoke licience
  * long-term, one-time licience

terms

* **Potential Features**:
  * create, update terms

courses

* **Potential Features**:
  * create, update courses

students

* **Potential Features**:
  * create, update, delete student accounts
