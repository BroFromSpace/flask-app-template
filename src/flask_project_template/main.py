from flask import Flask

from flask_project_template.api import routes


def create_app() -> Flask:
    app = Flask(__name__, instance_relative_config=True)
    app.register_blueprint(routes.setup())

    return app
