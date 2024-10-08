FROM python:3.12-slim-bookworm AS python-base

ENV PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_VERSION=1.8.3 \
    POETRY_HOME="/opt/poetry" \
    POETRY_CACHE_DIR="/.cache/pypoetry" \
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1 \
    # paths
    PYSETUP_PATH="/opt/pysetup" \
    VENV_PATH="/opt/pysetup/.venv"

ENV PATH="${POETRY_HOME}/bin:${VENV_PATH}/bin:${PATH}"


FROM python-base AS builder-base
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        curl \
        build-essential

RUN curl -sSL https://install.python-poetry.org | python3 -

WORKDIR ${PYSETUP_PATH}
COPY pyproject.toml poetry.lock ./

RUN --mount=type=cache,target=${POETRY_CACHE_DIR} \
    poetry install --only main --no-root


FROM python-base AS development
WORKDIR ${PYSETUP_PATH}

COPY --from=builder-base ${POETRY_HOME} ${POETRY_HOME}
COPY --from=builder-base ${PYSETUP_PATH} ${PYSETUP_PATH}

RUN --mount=type=cache,target=${POETRY_CACHE_DIR} \
    poetry install --with dev --no-root

WORKDIR /usr/src/app
COPY src/flask_project_template ./flask_project_template

ENTRYPOINT [ "bash", "-c" ]
CMD ["python -m flask --app flask_project_template.main run -h 0.0.0.0 -p 8080 --debug"]
