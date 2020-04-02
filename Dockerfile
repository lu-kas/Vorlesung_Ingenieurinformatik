FROM jekyll/jekyll:3.8.5

# ----------------- MISC ---------------- #
RUN apk update
RUN apk --update add make gcc g++ libc-dev
RUN gem install bundler

# ------------- JupyterBook ------------- #
RUN git clone https://github.com/lu-kas/Vorlesung_Ingenieurinformatik.git /opt/
RUN ls /opt/
RUN chmod 777 -R /opt/
WORKDIR "/opt/Build"
RUN bundle update jekyll-scholar
RUN bundle install
RUN cp -r ./* /srv/jekyll

EXPOSE 4000

RUN echo "cd /opt/ && git pull &" >> ./start.sh
RUN echo "cd /opt/ && bundle install &" >> ./start.sh
RUN echo "cp -r ./* /srv/jekyll &" >> ./start.sh
RUN echo "bundle exec jekyll serve --host 0.0.0.0" >> ./start.sh

# --------------- Start --------------- #
RUN chmod 777 ./start.sh
CMD ./start.sh
