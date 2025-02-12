from django.db import models
from django.contrib.auth.models import AbstractUser


class CustomUser(AbstractUser):
    email = models.EmailField(unique=True)


class Course(models.Model):
    course = models.CharField(max_length=50)
    mentor = models.CharField(max_length=50)
    title = models.CharField(max_length=50)

    def __str__(self):
        return self.course
    

class UserCourse(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)

    def __str__(self):
        return f'{self.user.username} - {self.course.course}'