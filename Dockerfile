# Hugo static site generator Docker image
FROM klakegg/hugo:0.111.3-ext-alpine

WORKDIR /site

EXPOSE 4000

CMD ["server", "--bind", "0.0.0.0", "--port", "4000", "--buildDrafts"]
