FROM node:24-bookworm-slim

WORKDIR /app

# Copy only package files first
COPY package*.json ./

# Install dependencies inside container
RUN npm install

# Copy rest of source code
COPY . .

EXPOSE 8080

CMD ["npm", "start"]