#!/bin/bash
# macOS Setup Script for eGloo Platform Monorepo
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

installHomebrew() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

installSqitch() {
    brew tap sqitchers/sqitch; brew install sqitch --with-postgres-support --with-sqlite-support --with-mysql-support
}

installAssumeRole() {
    brew install remind101/formulae/assume-role
}

echo "Do you wish to install Homebrew?"
select yn in "Yes" "No"; do
    case $yn in
        # Install Homebrew
        Yes ) installHomebrew; break;;
        No ) break;;
    esac
done

# Install Sqitch
echo "Do you wish to install Sqitch?"
select yn in "Yes" "No"; do
    case $yn in
        # Install Sqitch
        Yes ) installSqitch; break;;
        No ) break;;
    esac
done

# Connect to postgres
#psql -U postgres -h localhost -p 5432

# Install assume-role
echo "Do you wish to install assume-role?"
select yn in "Yes" "No"; do
    case $yn in
        # Install assume-role
        Yes ) installAssumeRole; break;;
        No ) break;;
    esac
done
