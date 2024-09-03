# Analytics Environment Setup with Docker

This script automates the installation and setup of an analytics environment using Docker. It installs Docker if it is not already installed on the system, and then pulls and runs containers for PostgreSQL, Grafana, Redash, and Jupyter Notebook.

## Prerequisites

- A Linux system (Ubuntu recommended) with `sudo` privileges.
- Internet access to pull Docker images.

## Script Overview

The script performs the following tasks:

1. **Updates Packages**: Ensures the system packages are up-to-date.
2. **Installs Docker**: Installs Docker if it's not already installed on the system.
3. **Sets Up Docker Containers**:
   - **PostgreSQL**: A powerful, open-source object-relational database system.
   - **Grafana**: An open-source platform for monitoring and observability.
   - **Redash**: A data visualization and query tool.
   - **Jupyter Notebook**: An interactive notebook environment for data analysis and visualization.
4. **Outputs Jupyter Notebook Token**: Retrieves and displays the token needed to access the Jupyter Notebook.
5. **Displays Running Containers**: Lists all the Docker containers that were started.

## Installation and Usage

1. **Clone the Repository** (if using a repository):

    ```bash
    git clone <repository_url>
    cd <repository_name>
    ```

2. **Make the Script Executable**:

    ```bash
    chmod +x runme.sh
    ```

3. **Run the Script**:

    ```bash
    ./runme.sh
    ```

4. **Access the Services**:

    Once the script completes, the services will be available at the following URLs:

    - **PostgreSQL**: `localhost:5432`
    - **Grafana**: `http://localhost:3000`
    - **Redash**: `http://localhost:5000`
    - **Jupyter Notebook**: `http://localhost:8888/?token=<your-token>`

    The Jupyter Notebook token will be displayed in the terminal after the script runs.

## Service Configuration

- **PostgreSQL**: The default password for the `postgres` user is `admin`. This can be changed in the script if needed.
- **Grafana**: The default credentials (admin/admin) will prompt you to change on first login.
- **Redash**: The setup process will guide you to create an admin account.
- **Jupyter Notebook**: The script will display a token to access Jupyter Notebook.

## Notes

- **Customization**: If you need to customize the setup, you can edit the `runme.sh` script.
- **Managing Containers**: To stop and remove the containers, use the following commands:

    ```bash
    docker stop <container_name>
    docker rm <container_name>
    ```

- **Checking Logs**: To view the logs for a specific container, use:

    ```bash
    docker logs <container_name>
    ```
