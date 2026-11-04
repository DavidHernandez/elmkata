# Elm 0.17 Linux binaries are no longer installable: the npm `elm@0.17.0`
# installer downloads from Bintray (shut down) and the official GitHub release
# only ships Windows/Mac installers. We pull the binaries out of the community
# `codesimple/elm:0.17` image (built with Elm's official BuildFromSource.hs).
# That image uses a v1 manifest that modern Docker refuses to pull, so we fetch
# the build layer straight from the registry by digest and verify its sha256.
FROM node:6.17.1-stretch AS elm

ARG ELM_LAYER=sha256:f1bfd082fef6f2bb678fad5386f548ace9134c26df1e12302f3338904fa21118

RUN set -eu; \
    token=$(curl -fsSL "https://auth.docker.io/token?service=registry.docker.io&scope=repository:codesimple/elm:pull" \
      | node -e 'let s="";process.stdin.on("data",d=>s+=d).on("end",()=>console.log(JSON.parse(s).token))'); \
    curl -fsSL -H "Authorization: Bearer $token" -o /tmp/elm.tgz \
      "https://registry-1.docker.io/v2/codesimple/elm/blobs/$ELM_LAYER"; \
    echo "${ELM_LAYER#sha256:}  /tmp/elm.tgz" | sha256sum -c -; \
    mkdir -p /elm; \
    tar xzf /tmp/elm.tgz -C /elm --strip-components=5 \
      opt/Elm-Platform/0.17/.cabal-sandbox/bin/elm \
      opt/Elm-Platform/0.17/.cabal-sandbox/bin/elm-make \
      opt/Elm-Platform/0.17/.cabal-sandbox/bin/elm-package \
      opt/Elm-Platform/0.17/.cabal-sandbox/bin/elm-reactor \
      opt/Elm-Platform/0.17/.cabal-sandbox/bin/elm-repl; \
    rm /tmp/elm.tgz


# Node 6.17.1 / npm 3.10.10, matching the original development setup.
# The full (non-slim) image is needed: elm-package requires git and node-sass
# may need python/make/g++ to build its native binding.
FROM node:6.17.1-stretch

COPY --from=elm /elm/ /usr/local/bin/

WORKDIR /app

COPY package.json ./
RUN npm install && npm cache clean

COPY elm-package.json ./
RUN elm-package install --yes

COPY . .

ENV PATH=/app/node_modules/.bin:$PATH

# 3000: BrowserSync dev server, 3001: BrowserSync UI, 8000: elm-reactor
EXPOSE 3000 3001 8000

CMD ["gulp"]
