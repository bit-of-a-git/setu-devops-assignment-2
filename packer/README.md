# Packer Configuration for SETU DevOps Assignment 2

This directory contains the Packer configuration files for **Assignment 2** of the SETU  Year 2 DevOps module.

## Overview

Hashicorp's Packer is used to automate the creation of machine images. The files in this directory define the configuration needed to build consistent and reusable images for my assignment.

## Files

- `main.pkr.hcl`: The main Packer template file defining the image build process.
- `database.pkrvars.hcl`: A file containing user-defined variables to build a database image, using MongoDB.
- `web-server.pkrvars.hcl`: A file containing user-defined variables to build a web server image, using Node.js.
- `scripts/`: A directory containing provisioning scripts to configure database or web server images.
- `README.md`: This documentation file.

## Prerequisites

- Install [Packer](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli).
- Ensure you have access to the required cloud provider or virtualization platform. For AWS, this involves configuring your credentials.

## Usage

1. Navigate to the Packer directory.
    ```bash
    cd packer
    ```
2. Validate the Packer template:
    ```bash
    packer validate .
    ```
3. Build the database:
    ```bash
    packer build -var-file=database.pkrvars.hcl .
    ```
4. Build the web server:
    ```bash
    packer build -var-file=web-server.pkrvars.hcl .
    ```