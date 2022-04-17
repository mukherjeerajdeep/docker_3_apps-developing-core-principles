FROM node:14-alpine AS base


FROM base AS deps
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install


FROM base
WORKDIR /app
COPY . .
COPY --from=deps /app/node_modules ./node_modules/
ENTRYPOINT ["npm", "run"]
CMD ["prod"]
