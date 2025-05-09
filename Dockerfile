FROM node:20-alpine

WORKDIR /app

# Copy package files and source code
COPY package*.json ./
COPY tsconfig.json ./
COPY src ./src

# Install dependencies
RUN npm install

# Build the application
RUN npm run build

# Create data directory
RUN mkdir -p /app/calendar-data
RUN chown -R node:node /app/calendar-data

# Switch to non-root user
USER node

# Start the server
CMD ["node", "build/index.js"]