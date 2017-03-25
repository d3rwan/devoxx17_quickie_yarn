FROM node:7.5.0

RUN npm install yarn -g \
    && npm install npmvsyarn -g

COPY ./bench.sh /bench.sh
RUN chmod +x /bench.sh

ENV LIBRARIES "angular react express gulp grunt"
ENV PROJECTS "https://github.com/react-boilerplate/react-boilerplate https://github.com/angular/angular-seed https://github.com/christianalfoni/webpack-express-boilerplate"

CMD ["/bench.sh"]
