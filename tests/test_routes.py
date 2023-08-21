import pytest
import unittest
from flask import Flask
from flask_testing import TestCase
from server.app import app

class TestApp(TestCase):

    def create_app(self):
        app.config['TESTING'] = True
        return app

    def test_index(self):
        response = self.client.get('/')
        self.assert_template_used('index.html')
        self.assert_context('t', 'TODO with Flask')
        self.assert_context('h', 'ToDo Reminder')

    def test_list_route(self):
        response = self.client.get('/list')
        
        self.assert_template_used('index.html')
        self.assert_context('t', 'TODO with Flask')
        self.assert_context('h', 'ToDo Reminder')
        self.assert_context('a1', 'active')
        
        self.assertIn('datas', response.data.decode('utf-8'))
        
if __name__ == '__main__':
    unittest.main()