#!/bin/bash
set -e

# Ansible role repo to deploy to
readonly ANSIBLE_ROLE_GITHUB_ORG="girder"
readonly ANSIBLE_ROLE_GITHUB_REPO="ansible-role-girder"

readonly SUBTREE_PREFIX="devops/ansible/roles/girder"
readonly SUBTREE_DEST_REPO="git@github.com:$ANSIBLE_ROLE_GITHUB_ORG/$ANSIBLE_ROLE_GITHUB_REPO.git"
readonly SUBTREE_DEST_BRANCH="master"

# Push any changes that have occurred
git subtree push --prefix="$SUBTREE_PREFIX" "$SUBTREE_DEST_REPO" add-galaxy-import-to-circleci

# Install ansible for ansible-galaxy
pip install ansible

# Import the changes into Ansible Galaxy
ansible-galaxy login --github-token="$ANSIBLE_GALAXY_GITHUB_TOKEN"
#ansible-galaxy import girder ansible-role-girder
