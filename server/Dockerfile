FROM golang:alpine3.15

# Copy Erupe and Quests to the container
COPY ./Erupe /Erupe

# Update container packages
RUN apk -U upgrade

# Install certificates
RUN apk add --no-cache ca-certificates

# Install packages required by server
RUN apk add p7zip

# Expose server ports
EXPOSE 53312
EXPOSE 54001
EXPOSE 54002
EXPOSE 54003
EXPOSE 54004
EXPOSE 53310
