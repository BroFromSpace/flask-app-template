from flask import Blueprint

from flask_project_template.api.routes import home


def setup() -> Blueprint:
    bp = Blueprint("index", __name__, url_prefix="/")
    bp.register_blueprint(home.setup())

    return bp
