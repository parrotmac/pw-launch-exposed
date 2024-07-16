FROM mcr.microsoft.com/playwright:v1.45.1-jammy

# Install dependencies
RUN apt-get update && apt-get install -y nodejs
RUN npm install -g pnpm

WORKDIR /app

COPY server ./server
COPY package.json pnpm-lock.yaml nodemon.json tsconfig.json ./

RUN pnpm install

ENV DEBUG=pw:*
CMD ["pnpm", "run", "server"]
