# http://docs.locus.io/latest/quickstart.html
from locust import HttpUser, TaskSet, task


class UserBehavior(TaskSet):
    def on_start(self):
        """
        on_start is called when a Locust start before any task is scheduled
        """
        # self.login()

    def login(self):
        pass
        # self.client.post("/login", {"username": "ellen_key", "password": "test"})

    @task(2)
    def index_2(self):
        self.client.get("/")

    @task(1)
    def index(self):
        self.client.get("/index.html")


class WebsiteUser(HttpUser):
    # abstract = True
    tasks = [UserBehavior]
    min_wait = 5000
    max_wait = 9000
