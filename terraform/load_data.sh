#!/bin/bash

# Define the variables
BUCKET="entrada_manual"
DATASET="manual"
PROJECT_ID="portfolioentrada"

# Load data into tb_super_invoice
bq --location=us-central1 load --source_format=CSV --skip_leading_rows=1 \
  --replace --autodetect \
  ${PROJECT_ID}:${DATASET}.tb_super_invoice \
  gs://${BUCKET}/supermarket/Invoices.csv

# Load data into tb_super_orderleads
bq --location=us-central1 load --source_format=CSV --skip_leading_rows=1 \
  --replace --autodetect \
  ${PROJECT_ID}:${DATASET}.tb_super_orderleads \
  gs://${BUCKET}/supermarket/OrderLeads.csv

# Load data into tb_super_salesteam
bq --location=us-central1 load --source_format=CSV --skip_leading_rows=1 \
  --replace --autodetect \
  ${PROJECT_ID}:${DATASET}.tb_super_salesteam \
  gs://${BUCKET}/supermarket/SalesTeam.csv
