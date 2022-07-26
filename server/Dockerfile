FROM golang:alpine3.15

# Copy Erupe and Quests to the container
COPY ./Erupe /Erupe

# Update container packages
RUN apk -U upgrade

# Install certificates
RUN apk add --no-cache ca-certificates

# Install packages required by server
RUN apk add p7zip

# Extract quests
RUN cd /Erupe && 7z x Quests.7z
