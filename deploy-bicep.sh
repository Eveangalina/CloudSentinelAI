#!/bin/bash

################################################################################
# Script Name: deploy-bicep.sh
# Author: Eveangalina Campos
# Date: June 2, 2025
# Purpose: Automate Bicep template deployment for GlobalTeamBot-RG in Azure.
# Project: CloudSentinelAI
#
# Description:
#   This script deploys a specified Bicep template to a resource group using 
#   Azure CLI. Optionally, a parameters JSON file may be passed.
#
# Usage:
#   ./deploy-bicep.sh <resourceGroupName> <bicepTemplateFile> [parametersFile]
#
# Example:
#   ./deploy-bicep.sh GlobalTeamBot-RG template.bicep parameters.json
################################################################################

# Define ANSI color codes
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m" # No Color

RESOURCE_GROUP=$1
BICEP_FILE=$2
PARAM_FILE=$3

# Check if required arguments are provided
if [[ -z "$RESOURCE_GROUP" || -z "$BICEP_FILE" ]]; then
  echo -e "${RED}❌ Usage: $0 <resourceGroupName> <bicepTemplateFile> [parametersFile]${NC}"
  exit 1
fi

echo -e "🚀 Starting deployment of ${BICEP_FILE} to resource group: ${RESOURCE_GROUP}..."

# Run deployment with or without parameters file
if [[ -n "$PARAM_FILE" ]]; then
  az deployment group create \
    --resource-group "$RESOURCE_GROUP" \
    --template-file "$BICEP_FILE" \
    --parameters @"$PARAM_FILE"
else
  az deployment group create \
    --resource-group "$RESOURCE_GROUP" \
    --template-file "$BICEP_FILE"
fi

# Check result of the deployment
if [[ $? -eq 0 ]]; then
  echo -e "${GREEN}✅ Deployment to ${RESOURCE_GROUP} succeeded!${NC}"
else
  echo -e "${RED}❌ Deployment failed. Check errors above.${NC}"
  exit 1
fi
