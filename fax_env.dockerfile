FROM debian:bookworm

#!###############################################################
#!Update Packages
#!###############################################################
RUN apt-get update -y
RUN apt-get upgrade -y

#!###############################################################
#!setup dev user
#!###############################################################
RUN apt-get install zsh -y
ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID
# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/zsh --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install sudo -y \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
#set dev as default user
USER $USERNAME

#!###############################################################
#!install apps
#!###############################################################
RUN sudo apt-get install nala -y
RUN sudo nala install python3.10 python-is-python3 python3-pip python3-venv tig vim wget git curl unzip pkg-config clang cmake ninja-build libgtk-3-dev -y
RUN sudo nala autoremove

#!###############################################################
#!git config
#!###############################################################
RUN git config --global pull.rebase false

#!###############################################################
#!vscode setup
#!###############################################################
COPY /src/.vscode /home/dev/.vscode

#!###############################################################
#!zsh setup
#!###############################################################
RUN sh -c "$(curl -fsSL https://raw.github.com/NADEE-MJ/zsh/main/debian-zsh-install.sh)"

#!###############################################################
#!Poetry setup
#!###############################################################
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/home/dev/.local/bin:$PATH"

#!###############################################################
#!AWS CLI setup
#!###############################################################
RUN cd ~ && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN cd ~ && unzip awscliv2.zip
RUN sudo ~/aws/install
RUN rm -r ~/aws
RUN rm ~/awscliv2.zip

#!###############################################################
#!fax repos setup
#!###############################################################
RUN git clone https://github.com/fax-app/fax-app.git ~/repos/fax_app
RUN git clone https://github.com/fax-app/fax_server.git ~/repos/fax_server
RUN cp ~/repos/fax_server/.env.example ~/repos/fax_server/.env
RUN sudo chmod u+x ~/repos/fax_server/bin/add-hooks.sh && ~/repos/fax_server/bin/add-hooks.sh
RUN git clone https://github.com/fax-app/notes.git ~/repos/notes
RUN git clone https://github.com/fax-app/docker_env.git ~/repos/docker_env

#!###############################################################
#!dart/flutter setup
#!###############################################################
RUN mkdir ~/tools
RUN cd ~/tools && git clone https://github.com/flutter/flutter.git -b stable
ENV PATH="$PATH:/home/dev/tools/flutter/bin"
RUN flutter precache
RUN flutter config --no-analytics
RUN cd ~/repos/fax_app && flutter packages get