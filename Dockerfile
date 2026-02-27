# Hugo static site generator Docker image
FROM klakegg/hugo:0.111.3-ext-alpine

WORKDIR /site

EXPOSE 1313

CMD ["server", "--bind", "0.0.0.0", "--buildDrafts"]
