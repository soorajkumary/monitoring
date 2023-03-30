# Installing OpenSearch and OpenSearch Dashboards using Helm

This guide will walk you through the steps required to install OpenSearch and OpenSearch Dashboards using Helm on your Kubernetes cluster.

## Prerequisites

Before beginning with the installation process, ensure you have the following prerequisites in place:

- A Kubernetes cluster with Helm installed.
- Access to the command-line interface (CLI) of the Kubernetes cluster.

## Step 1: Adding the OpenSearch Helm Chart Repository

The first step in installing OpenSearch using Helm is to add the OpenSearch Helm chart repository to your Helm configuration. This repository contains the charts required to install OpenSearch and OpenSearch Dashboards.

To add the OpenSearch Helm chart repository, run the following command:

```sh

helm repo add opensearch https://opensearch-project.github.io/helm-charts/

```

## Step 2: Updating the Helm Repository

After adding the OpenSearch Helm chart repository, you will need to update your Helm repository with the latest version of the OpenSearch charts. This step ensures that you have access to the most up-to-date charts.

To update the Helm repository, run the following command:

```sh

helm repo update

```

## Step 3: Installing OpenSearch

Once you have added the OpenSearch Helm chart repository and updated your Helm repository, you can install OpenSearch using Helm. The following command will install OpenSearch on your Kubernetes cluster using the default configuration:

```sh

helm install opensearch opensearch/opensearch

```

## Step 4: Installing OpenSearch Dashboards

To install OpenSearch Dashboards, run the following command:

```sh

helm install dashboard opensearch/opensearch-dashboards

```

## Step 5: Verifying the Installation

To verify the installation, you can check the status of the OpenSearch and OpenSearch Dashboards pods using the following command:

```sh

kubectl get pods

```


This command will list all the pods running in your Kubernetes cluster. Look for the pods named "opensearch" and "opensearch-dashboards" to ensure they are running.

## Conclusion

Congratulations! You have successfully installed OpenSearch and OpenSearch Dashboards using Helm on your Kubernetes cluster. You can now use OpenSearch to search, analyze, and visualize your data.


# Checking the Fluentd Pod

After installing OpenSearch and OpenSearch Dashboards using Helm, you can check the status of the Fluentd pod by running the following command:


```sh

kubectl get pods -f fluentd.yaml

```


This command will list all the pods running in your Kubernetes cluster, filtering by the selector specified in the `fluentd.yaml` file. Look for the pod named "fluentd" to ensure it is running.

## Conclusion

Congratulations! You have successfully checked the status of the Fluentd pod after installing OpenSearch and OpenSearch Dashboards using Helm on your Kubernetes cluster. You can now use Fluentd to collect and ship your logs to OpenSearch.
