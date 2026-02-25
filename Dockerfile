# Use base image
FROM node:18-alpine as base

WORKDIR /app

# Install dependencies
COPY package.json package-lock.json* ./
RUN npm ci --omit=dev

# Copy app source
COPY . .

# Run as non-root user
USER node

EXPOSE 3030
ENV NODE_ENV=production

CMD ["npm", "start"]