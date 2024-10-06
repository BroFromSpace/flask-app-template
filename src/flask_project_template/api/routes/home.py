from flask import Blueprint

from flask_project_template.api.views import home


def setup() -> Blueprint:
    bp = Blueprint("home", __name__, url_prefix="/")
    bp.add_url_rule("/", "get", home.home)

    return bp
