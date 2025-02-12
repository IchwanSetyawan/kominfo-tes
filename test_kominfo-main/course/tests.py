from django.test import TestCase
from django.contrib.auth import get_user_model

class UserTestCase(TestCase):
    def setUp(self):
        self.user = get_user_model().objects.create_user(username='testuser', email='test@example.com', password='password123')

    def test_user_login(self):
        login = self.client.login(username='testuser', password='password123')
        self.assertTrue(login)

    def test_user_creation(self):
        user = get_user_model().objects.create_user(username='newuser', email='new@example.com', password='password123')
        self.assertEqual(user.username, 'newuser')
        self.assertEqual(user.email, 'new@example.com')
