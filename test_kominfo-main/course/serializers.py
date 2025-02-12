from rest_framework import serializers
from .models import CustomUser, Course, UserCourse

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['id', 'username', 'email', 'password']
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        user = CustomUser.objects.create_user(**validated_data)
        return user


class CourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Course
        fields = '__all__'


class UserCourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserCourse
        fields = '__all__'    


class Soal5Serializer(serializers.Serializer):
    user_id = serializers.IntegerField()
    username = serializers.CharField(max_length=150)
    course = serializers.CharField(max_length=50)
    mentor = serializers.CharField(max_length=50)
    title = serializers.CharField(max_length=50)


class Soal7Serializer(serializers.Serializer):
    course_name = serializers.CharField(max_length=50)
    mentor = serializers.CharField(max_length=50)
    title = serializers.CharField(max_length=50)
    jumlah_peserta = serializers.IntegerField()  


class Soal8Serializer(serializers.Serializer):
    mentor = serializers.CharField(max_length=50)
    jumlah_peserta = serializers.IntegerField()
    total_fee = serializers.IntegerField()