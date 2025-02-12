from django.shortcuts import render

def course_stats_page(request):
    return render(request, 'course_stats.html')