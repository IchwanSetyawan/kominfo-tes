from rest_framework import status
from rest_framework.response import Response
from rest_framework import permissions
from rest_framework.decorators import api_view, permission_classes

from django.db.models import Count, Value, F

from .models import UserCourse
from .serializers import Soal5Serializer, Soal7Serializer, Soal8Serializer


@api_view(['GET'])
@permission_classes([permissions.AllowAny])
def soal5(request):
    queryset = UserCourse.objects.select_related('user', 'course').filter(course__title__startswith='S.')

    data = [
        {
            'user_id': uc.user.id,
            'username': uc.user.username,
            'course': uc.course.course,
            'mentor': uc.course.mentor,
            'title': uc.course.title
        }
        for uc in queryset
    ]
    
    serializer = Soal5Serializer(data, many=True)
    
    return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(['GET'])
@permission_classes([permissions.AllowAny])
def soal6(request):
    queryset = UserCourse.objects.select_related('user', 'course').exclude(course__title__startswith='S.')

    data = [
        {
            'user_id': uc.user.id,
            'username': uc.user.username,
            'course': uc.course.course,
            'mentor': uc.course.mentor,
            'title': uc.course.title
        }
        for uc in queryset
    ]
    
    serializer = Soal5Serializer(data, many=True)
    
    return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(['GET'])
@permission_classes([permissions.AllowAny])
def soal7(request):
    queryset = UserCourse.objects \
        .select_related('course') \
        .values(
            course_name=F('course__course'),
            mentor=F('course__mentor'),
            title=F('course__title')
        ) \
        .annotate(
            jumlah_peserta=Count('id')
        )
    
    serializer = Soal7Serializer(queryset, many=True)
    
    return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(['GET'])
@permission_classes([permissions.AllowAny])
def soal8(request):
    queryset = UserCourse.objects \
        .select_related('course') \
        .values(mentor=F('course__mentor')) \
        .annotate(
            jumlah_peserta=Count('id'),
            total_fee=Count('id') * Value(2000000)
        )
    
    serializer = Soal8Serializer(queryset, many=True)
    
    return Response(serializer.data, status=status.HTTP_200_OK)