FROM node:14-alpine AS base
ARG NODE_ENV
ENV NODE_ENV "${NODE_ENV:-production}"


FROM base AS deps
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install


FROM base
WORKDIR /app
COPY . .
COPY --from=deps /app/node_modules ./node_modules/
ENTRYPOINT ["/app/docker-entrypoint.sh"]
