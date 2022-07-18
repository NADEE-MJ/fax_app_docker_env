FROM debian:bookworm

#!###############################################################
#!setup dev user
#!###############################################################
ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID
# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
#set dev as default user
USER $USERNAME

#!###############################################################
#!install apps
#!###############################################################
RUN sudo apt-get update -y
RUN sudo apt-get upgrade -y
RUN sudo apt-get install sudo python3.10 python3-venv zsh tig curl npm unzip pkg-config clang cmake ninja-build libgtk-3-dev -y

#!###############################################################
#!git setup
#!###############################################################
RUN git config --global pull.rebase false

#!###############################################################
#!vscode setup
#!###############################################################
COPY /src/.vscode /home/dev/.vscode

#!###############################################################
#!oh my zsh setup
#!###############################################################
RUN echo "zsh" >> ~/.bashrc
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN rm ~/.zshrc
#config files
RUN echo "$(curl -fsSL https://gist.githubusercontent.com/NADEE-MJ/d1a275c1d780a7f17011cff25d573def/raw/.p10k.zsh)" >> ~/.p10k.zsh
RUN echo "$(curl -fsSL https://gist.githubusercontent.com/NADEE-MJ/03950416a42d0a477f950ce0a9fabff3/raw/.zshrc)" >> ~/.zshrc
#plugins
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
RUN git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

#!###############################################################
#!Poetry setup
#!###############################################################
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/home/dev/.local/bin:$PATH"

#!###############################################################
#!fax repos setup
#!###############################################################
RUN git clone https://github.com/fax-app/fax_server.git ~/repos/fax_server
RUN git clone https://github.com/fax-app/notes.git ~/repos/notes
RUN git clone https://github.com/fax-app/fax-app.git ~/repos/fax_app
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

#!###############################################################
#!npm setup
#!###############################################################
RUN cd ~/repos/fax_server && npm install
RUN cd ~/repos/fax_server && npm run prep