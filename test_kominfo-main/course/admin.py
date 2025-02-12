from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import CustomUser, Course, UserCourse

class CustomUserAdmin(BaseUserAdmin):
    model = CustomUser
    fieldsets = (
        (None, {'fields': ('username', 'email', ('first_name', 'last_name'), ('is_superuser', 'is_staff', 'groups', 'user_permissions'), ('date_joined', 'last_login'))}),
    )
    list_display = ('username','email',)
    list_filter = ('is_superuser', 'is_staff')
    list_per_page = 25
    readonly_fields = ('last_login', 'date_joined')
    search_fields = ('email', 'first_name', 'last_name')


class CourseAdmin(admin.ModelAdmin):
    model = Course
    fields = ['course', 'mentor', 'title']
    list_display = ['course', 'mentor', 'title']
    search_fields = ['course', 'mentor', 'title']
    
    def get_queryset(self, request):
        queryset = super().get_queryset(request)
        if request.user.is_superuser:
            return queryset
        return queryset.filter(usercourse__user=request.user)


class UserCourseAdmin(admin.ModelAdmin):
    model = UserCourse
    fields = ['user', 'course']
    list_display = ['user', 'course']
    search_fields = ['user__username', 'course__course']
    
    def get_queryset(self, request):
        queryset = super().get_queryset(request)
        if request.user.is_superuser:
            return queryset
        return queryset.filter(user__username=request.user)
    
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "user":
            user = request.user.id
            kwargs["queryset"] = CustomUser.objects.filter(id=user)
            kwargs["initial"] = user

        return super().formfield_for_foreignkey(db_field, request, **kwargs)


admin.site.register(CustomUser, CustomUserAdmin)
admin.site.register(Course, CourseAdmin)
admin.site.register(UserCourse, UserCourseAdmin)
