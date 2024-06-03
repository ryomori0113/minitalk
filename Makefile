# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ryomori <ryomori@student.42tokyo.jp>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/06/03 12:19:56 by ryomori           #+#    #+#              #
#    Updated: 2024/06/03 13:30:34 by ryomori          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			=	minitalk
CC				=	cc
CFLAGS			=	-Wall -Wextra -Werror

SERVER			=	server
SERVER_SRC		=	server.c
SERVER_OBJ		=	$(SERVER_SRC:%.c=%.o)

CLIENT			=	client
CLIENT_SRC		=	client.c
CLIENT_OBJ		=	$(CLIENT_SRC:%.c=%.o)

SRCS			=	utils.c utils2.c

OBJS			=	$(SRCS:%.c=%.o)



%.o: %.c
		$(CC) $(CFLAGS) -c $< -o $@

all: $(NAME)

$(SERVER):	$(SERVER_OBJ) $(OBJS)
		$(CC) $(CFLAGS) $(SERVER_OBJ) $(OBJS) -o $(SERVER)

$(CLIENT):	$(CLIENT_OBJ) $(OBJS)
		$(CC) $(CFLAGS) $(CLIENT_OBJ) $(OBJS) -o $(CLIENT)

$(NAME):	$(SERVER) $(CLIENT)


clean:
		rm -rf $(SERVER_OBJ) $(CLIENT_OBJ) $(OBJS)

fclean: clean
		rm -rf $(SERVER) $(CLIENT)

re: fclean all

.PHONY: all clean fclean re