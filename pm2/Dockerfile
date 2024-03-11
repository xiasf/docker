FROM xiaobu191/alpine

RUN apk --update add --no-cache nodejs-current npm

RUN npm install pm2 -g \
    && npm cache clean --force

CMD ["pm2-runtime", "start", "pm2.json"]