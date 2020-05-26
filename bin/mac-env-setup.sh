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

USER_SHELL="other"
INSTALL_SHELL_MODE="print"

recordBash() {
    USER_SHELL="bash"
}

recordZsh() {
    USER_SHELL="zsh"
}

recordInstallShellAutoMode() {
    INSTALL_SHELL_MODE="auto"
}

promptShellInstallMode() {
    echo "Some tools require updates to shell startup scripts. Would you like the installer to add those for you or print out instructions?"
    select installShellMode in "Auto" "Print"; do
        case $installShellMode in
            # Install Homebrew
            Auto ) recordInstallShellAutoMode; break;;
            Print ) break;;
        esac
    done
}

checkForHomebrew() {
    which -s brew
    if [[ $? != 0 ]] ; then
        # Install Homebrew
        promptForHomebrew
    else
        homebrewInstallNotice="Homebrew detected: Do you wish to update Homebrew? "
        homebrewInstallNotice="${homebrewInstallNotice}Installed packages will not be upgraded.\n\n"
        homebrewInstallNotice="${homebrewInstallNotice}Note: this installer assumes Homebrew is up-to-date."

        # echo -e for interpretting newlines
        echo -e $homebrewInstallNotice
        select yn in "Yes" "No"; do
            case $yn in
                # Update Homebrew
                Yes ) brew update; break;;
                No ) break;;
            esac
        done        
    fi
}

promptForHomebrew() {
    echo "Do you wish to install Homebrew?"
    select yn in "Yes" "No"; do
        case $yn in
            # Install Homebrew
            Yes ) installHomebrew; break;;
            No ) break;;
        esac
    done
}

installHomebrew() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

installSqitch() {
    brew tap sqitchers/sqitch; brew install sqitch --with-postgres-support --with-sqlite-support --with-mysql-support
}

installAssumeRole() {
    brew install remind101/formulae/assume-role

    case $INSTALL_SHELL_MODE in
        auto ) setupAssumeRoleForShell;;
        print ) printAssumeRoleForShell;;
    esac
}

setupAssumeRoleForShell() {
    case $USER_SHELL in
        bash ) setupAssumeRoleForBash;;
        zsh ) setupAssumeRoleForZsh;;
    esac
}

printAssumeRoleForShell() {
    case $USER_SHELL in
        bash ) printAssumeRoleForBash;;
        zsh ) printAssumeRoleForZsh;;
    esac
}

printAssumeRoleForBash() {
    echo -e "Place the following in your ~/.bashrc:\n\nalias assume-role='function(){eval \$(command assume-role \$@);}'\n"
}

printAssumeRoleForZsh() {
    echo -e "Place the following in your ~/.zshrc:\n\nalias assume-role='function(){eval \$(command assume-role \$@);}'\n"
}

setupAssumeRoleForBash() {
    echo -e "\nalias assume-role='function(){eval \$(command assume-role \$@);}'\n" >> $HOME/.bashrc
}

setupAssumeRoleForZsh() {
    echo -e "\nalias assume-role='function(){eval \$(command assume-role \$@);}'\n" >> $HOME/.zshrc
}

installPython() {
    brew install python
    brew install pyenv

    case $INSTALL_SHELL_MODE in
        auto ) setupPyenvForShell;;
        print ) printPyenvForShell;;
    esac

    # TODO check if we need to set the shell startup script first
    pyenv install 3.8.2
}

setupPyenvForShell() {
    case $USER_SHELL in
        bash ) setupPyenvForBash;;
        zsh ) setupPyenvForZsh;;
    esac
}

printPyenvForShell() {
    case $USER_SHELL in
        bash ) printPyenvForBash;;
        zsh ) printPyenvForZsh;;
    esac
}

printPyenvForBash() {
    echo -e 'Place the following in your ~/.bashrc:\n\neval "$(pyenv init -)"\n'
}

printPyenvForZsh() {
    echo -e 'Place the following in your ~/.zshrc:\n\neval "$(pyenv init -)"\n'
}

setupPyenvForBash() {
    echo -e '\neval "$(pyenv init -)"\n' >> $HOME/.bashrc
}

setupPyenvForZsh() {
    echo -e '\neval "$(pyenv init -)"\n' >> $HOME/.zshrc
}

echo "Which shell do you generally use?"
select userShell in "Bash" "Zsh" "Other"; do
    case $userShell in
        # Record shell choice
        Bash ) recordBash; break;;
        Zsh ) recordZsh; break;;
        Other ) break;;
    esac
done

# If shell is supported, offer auto shell startup injections or print required inits
case $USER_SHELL in
    bash ) promptShellInstallMode;;
    zsh ) promptShellInstallMode;;
esac

# Check for or install Homebrew
checkForHomebrew

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


# Install python3 and pyenv
echo "Do you wish to install python3 and pyenv?"
select yn in "Yes" "No"; do
    case $yn in
        # Install assume-role
        Yes ) installPython; break;;
        No ) break;;
    esac
done

echo "Environment setup complete."