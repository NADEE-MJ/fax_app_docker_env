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
RUN echo "$(curl -fsSL https://gist.githubusercontent.com/NADEE-MJ/d1a275c1d780a7f17011cff25d573def/raw/.p10k.zsh)" >> /root/.p10k.zsh
RUN echo "$(curl -fsSL https://gist.githubusercontent.com/NADEE-MJ/03950416a42d0a477f950ce0a9fabff3/raw/.zshrc)" >> /root/.zshrc
#plugins
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#!###############################################################
#!fax repos setup
#!###############################################################
RUN git clone https://github.com/fax-app/fax_server.git /root/repos/fax_server
RUN git clone https://github.com/fax-app/notes.git /root/repos/notes
#!###############################################################
#!npm setup
#!###############################################################
RUN cd /root/repos/fax_server && npm install
RUN cd /root/repos/fax_server && npm run prep