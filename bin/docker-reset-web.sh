#!/bin/bash
# Wrapper script for use in a Makefile
# Copyright (C) 2020 eGloo, LLC
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

resetDocker() {
    docker stop egloo_web_1
    docker rm -v egloo_web_1
    docker rmi egloo_web
    make build
    make up
}

# echo "Are you sure you wish to reset docker for web?"
# select yn in "Yes" "No"; do
#     case $yn in
#         # Reset Docker
#         Yes ) resetDocker; break;;
#         No ) exit;;
#     esac
# done

resetDocker