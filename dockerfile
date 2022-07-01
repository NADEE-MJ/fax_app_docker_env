FROM debian:latest

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install python3.10 zsh fzf tig curl npm -y
#!###############################################################
#!vscode setup
#!###############################################################
COPY /src/.vscode /root/.vscode
#!###############################################################
#!oh my zsh setup
#!###############################################################
RUN echo "zsh" >> /root/.bashrc
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN rm ~/.zshrc
#config files
COPY /src/.zshrc /root/.zshrc
COPY /src/.p10k.zsh /root/.p10k.zsh
#plugins
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#!###############################################################
#!fax repos setup
#!###############################################################
RUN git clone https://github.com/fax-app/fax_server.git /root/repos/fax_server
#!###############################################################
#!npm setup
#!###############################################################
RUN cd /root/repos/fax_server && npm install
RUN chmod 777 -R scripts/ && npm run prep
