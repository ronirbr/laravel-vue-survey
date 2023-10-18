FROM node:18

# remove the created user
RUN userdel -r node

# Arguments defined in docker-compose.yml
ARG user
ARG uid

# Create system user
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user && \
    chown -R $user:$user /home/$user

EXPOSE 5173

USER $user
