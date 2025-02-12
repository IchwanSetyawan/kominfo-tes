from django.urls import path
from .api import soal5, soal6, soal7, soal8
from .views import course_stats_page

urlpatterns = [
    path('soal-5', soal5),
    path('soal-6', soal6),
    path('soal-7', soal7),
    path('soal-8', soal8),
    path('course-stats-page/', course_stats_page, name='course-stats-page'),
]
