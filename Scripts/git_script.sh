#!/bin/sh

CYAN="\033[0;36m"
NC="\033[0m"

echo "${CYAN}Staging...${NC}"
git add -A
echo 

echo "${CYAN}Commiting...${NC}"
git commit -am "${1}"
echo 

echo "${CYAN}Pulling...${NC}"
git pull
echo 

echo "${CYAN}Pushing...${NC}"
git push
echo

echo "${CYAN}Status:${NC}"
git status
echo

