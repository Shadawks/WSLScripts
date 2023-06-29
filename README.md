# WSL2 Installation

This document aims to provide you with all the necessary information for setting up WSL2, installing Docker, and customizing the terminal to enhance your development workflow.

## Table of contents

[Install Windows Subsystem for Linux (WSL)](./WSL.md#install-windows-subsystem-for-linux-wsl)

[Update and Upgrade packages](./WSL.md#update-and-upgrade-packages)

[Install Docker in WSL](./WSL.md#install-docker-in-wsl)

[Docker Installation Script](./WSL.md#docker-installation-script)

[Workflow improvements](./WSL.md#workflow-improvements)

## Install Windows Subsystem for Linux (WSL)

1.	Open PowerShell or Command Prompt by right-clicking on the Start menu and selecting "Run as administrator". This will ensure that you have the necessary privileges to execute the installation commands.

2.	In the command prompt window, enter the following command: 
    ```
    wsl --install
    ```
    This command will initiate the installation process for WSL2.

3.	Wait for the installation to complete. This may take some time as it involves downloading and configuring the necessary components.

4.	Once the installation is finished, it's recommended to reboot your computer to ensure all changes take effect. You can do this by clicking on the Start menu, selecting the power icon, and choosing "Restart".

5.	After your computer has rebooted, log in to your Windows 10 account as usual.

6.	The command prompt will open again. This time, it will ask you to set up a username and password specifically for WSL. It's important to note that these credentials will be separate from your Windows credentials. Follow the prompts to enter your desired username and password for WSL.

## Update and Upgrade packages

1.	Open the Start Menu and search for "Ubuntu" to find and launch the "Ubuntu" app. This will open a terminal window for the Ubuntu distribution. 

2.	In the Ubuntu terminal, enter the following command: 
    ```
    sudo apt update -y
    ```
    This command will update the package lists and dependencies for your Ubuntu system. 


3.	When prompted, enter the password you previously configured for the "sudo" command. Note that as you type the password, no characters will be displayed on the screen for security reasons. Press Enter to proceed. 

4.	Wait for the update process to complete. This will ensure that you have the latest package information for your Ubuntu system. 


5.	Next, enter the following command: 
    ```
    sudo apt upgrade -y
    ```
    This command will upgrade all the installed packages on your Ubuntu system to their latest versions. 

## Install Docker in WSL

**You can use the [script](./WSL.md#docker-installation-script) to auto install docker or follow the tutorial bellow.**

1.	Install the prerequisite packages by running the following command: 
    ```
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    ```

2.	Add the Docker GPG key to your system using the command:
    ```
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    ```

3.	Add the docker repository to APT sources: 
    ```
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    ```

4.	Update the package list and verify that the Docker package is available from the Docker repository
    ```
    apt update && apt-cache policy docker-ce
    ```

5.	Finally you can install docker: 
    ```
    sudo apt install docker-ce
    ```

6.	Verify that Docker is running properly by checking its status:
    ```
    sudo systemctl status docker
    ```

## Docker Installation Script

1. Download the script from Github
    ```bash
    wget https://raw.githubusercontent.com/Shadawks/WSLScripts/main/install_docker.sh
    ```

2. Add execution permission to the script
    ```bash
    chmod +x install_docker.sh
    ```

3. Run the script
    ```bash
    ./install_docker
    ```

## Workflow improvements

### Windows Terminal

1. Install [Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab) from the Microsoft Store

2. Open Windows Terminal and click on the down arrow next to the plus sign and select "Settings"

3. In "Default Terminal Application" change the value to "Windows Terminal"

4. Save the settings and close the window

### Custom WSL2 Terminal

The following script will install the following packages:

- [ZSH](https://www.zsh.org/)
- [Oh My Zsh](https://ohmyz.sh/)
- [Starship](https://starship.rs/)
- [Exa](https://the.exa.website/)
- [Bat](https://github.com/sharkdp/bat)
- [Bottom](https://github.com/ClementTsang/bottom)

And will add aliases to the .zshrc file
- ls, la, ll, lla -> exa
- bcat, cat -> bat
- bottom, btom -> btm
- weather, wtr -> curl wttr.in

1. Download the script from Github
   ```bash
   wget https://raw.githubusercontent.com/Shadawks/WSLScripts/main/custom.sh
    ```

2. Add execution permission to the script
    ```bash
    chmod +x custom.sh
    ```
3. Run the script
    ```bash
    ./custom.sh
    ```
