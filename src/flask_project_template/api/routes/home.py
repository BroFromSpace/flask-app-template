from flask import Blueprint

from ..views import home as home_views


def setup() -> Blueprint:
    bp = Blueprint("home", __name__, url_prefix="/")
    bp.add_url_rule("/", "get", home_views.home)

    return bp
