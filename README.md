# Flask Project Template Documentation

## Getting Started

This template provides a quick way to set up a Flask project with Docker and Poetry for dependency management.

### Prerequisites

- Docker
- Docker Compose

### Starting the Project

1. Clone the repository containing the project template.
1. Navigate to the project directory.
1. Run the following command to start the development server:

    ```sh
    docker-compose up --build
    ```

   This will build the Docker image and start the Flask application in development mode.

1. Access the application at `http://localhost:8080`.

## Project Structure

The main application code is located in the `src/flask_project_template` directory. This directory is mounted as a volume in the Docker container, allowing for live code reloading during development.

## Development Environment

The development environment is set up using Docker. The `Dockerfile` defines a multi-stage build process:

1. `python-base`: Sets up the base Python environment and Poetry.
1. `builder-base`: Installs system dependencies and Poetry.
1. `development`: Sets up the development environment with all dependencies installed.

## Dependency Management

This project uses Poetry for dependency management. The `pyproject.toml` file defines the project dependencies.

## Code Formatting with Ruff

This project uses Ruff for code formatting and linting. To use Ruff:

1. Ensure Ruff is installed in your development environment. It should be included in the `dev` dependencies in `pyproject.toml`.
