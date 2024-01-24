# How to use

## Tested Environment

- Ubuntu 22.04.3 LTS (Jammy Jellyfish)
- Docker version 24.0.7

## Create a docker container

1. Clone this repository to local
2. Move to the docker folder

    ``` [bash]
    cd dbt-trino-python/docker
    ```

3. Create a network

    ```[bash]
    docker network create --driver=bridge --subnet=172.30.0.0/16 --gateway=172.30.0.1 shared-network
    ```

4. Create a container

    ``` [bash]
    docker compose up -d --build
    ```

5. The following containers will be up
   - dbt_host
      - This repository is mounted to ```/home/dbt_projects```
   - postgres_host
      - Initial data is automatically inserted.

## Run the DBT models

### Example model

1. Enter the container

    ``` [bash]
    docker exec -it dbt_host /bin/bash
    ```

2. Activate the venv

    ``` [bash]
    source /home/venvs/dbt/bin/activate

    dbt --version
    # The output should be like the below.

    # Core:
    #   - installed: 1.7.4
    #   - latest:    1.7.4 - Up to date!
    # 
    # Plugins:
    #   - postgres: 1.7.4 - Up to date!
    ```

3. Move to the dbt project folder

    ``` [bash]
    cd /home/dbt_projects/crypto_etl
    ```

4. Run the following dbt commands
    - Debug to check if the dbt configuration is proper.

        ``` [bash]
        dbt debug
        ```

    - Run the example model

        ``` [bash]
        dbt run --select example
        ```

    - Test the example model

        ``` [bash]
        dbt test --select example
        ```

### Custom model

1. Check the working directory.

    ``` [bash]
    pwd
    # /home/dbt_projects/crypto_etl
    ```

2. Compiling check

    ``` [bash]
    dbt compile
    ```

3. Run the following dbt commands

    - Run the custom model

        ``` [bash]
        dbt run --select get_stats
        ```

    - Test the custom model
      - A new table is created by running the model above.
      - And the model has composite key which is composed by id and week_num columns.
      - Therefore, in the test, check the composite key is unique.
      - The test is defined in ```dbt_projects/crypto_etl/models/get_stats/schema.yml```

        ``` [bash]
        dbt test --select get_stats
        ```

### Seeds a CSV file

1. Put CSV files in ```dbt_projects/crypto_etl/seeds``` that you want to import

2. Check the working directory.

    ``` [bash]
    pwd
    # /home/dbt_projects/crypto_etl
    ```

3. Run the following command.

    ```[bash]
    dbt seeds --select init
    ```

## Install packages

1. Create a packages.yml in the same directory of dbt_project.yml
2. Write package name that you want.

    ```YAML:dbt_project.yml
    packages:
    - package: dbt-labs/dbt_utils
        version: 1.1.1
    ```

3. Install the packages. Run the command from ```dbt_projects/crypto_etl``` in my case.

    ```bash
    dbt deps
    ```
