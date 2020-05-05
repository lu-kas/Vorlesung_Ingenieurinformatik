FROM ubuntu:18.04

# ----------------- MISC ---------------- #
RUN apt update && apt -y install vim less git
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# --------------- Python --------------- #
RUN apt update && apt install python3-pip -y
RUN ln -s /usr/bin/python3 /usr/bin/python

# ------------- JupyterBook ------------- #
RUN python3 -m pip install jupyter-book
RUN apt install ruby-full build-essential zlib1g-dev -y
RUN gem install jekyll
RUN gem install bundler -v "1.17.2"

RUN git clone https://github.com/lu-kas/Vorlesung_Ingenieurinformatik.git
WORKDIR "/Vorlesung_Ingenieurinformatik/Build"
RUN bundle update jekyll-scholar
RUN bundle update --bundler
RUN make clean
RUN make install
RUN make build

EXPOSE 4000

RUN echo "(cd /Vorlesung_Ingenieurinformatik/ && git checkout .)" >> /start.sh
RUN echo "(cd /Vorlesung_Ingenieurinformatik/ && git pull)" >> /start.sh
RUN echo "(cd /Vorlesung_Ingenieurinformatik/Build && make clean && make install && make build)" >> /start.sh
RUN echo "(cd /Vorlesung_Ingenieurinformatik/Build && bundle exec jekyll serve --host 0.0.0.0)" >> /start.sh

# --------------- Start --------------- #
RUN chmod 777 /start.sh
CMD /start.sh
