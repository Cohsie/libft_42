# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jose-tor <jose-tor@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/06 18:23:45 by jose-tor          #+#    #+#              #
#    Updated: 2024/07/21 14:23:07 by jose-tor         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

CC = $(shell which cc clang gcc | head -n 1)
CFLAGS = -Wall -Wextra -Werror
AR = ar rcs
RM = rm -f

FILES = ft_memset \
		ft_bzero \
		ft_memcpy \
		ft_memmove \
		ft_memchr \
		ft_memcmp \
		ft_strlen \
		ft_strlcpy \
		ft_strlcat \
		ft_strchr \
		ft_strrchr \
		ft_strnstr \
		ft_strncmp \
		ft_atoi \
		ft_isalpha \
		ft_isdigit \
		ft_isalnum \
		ft_isascii \
		ft_isprint \
		ft_toupper \
		ft_tolower \
		ft_putchar_fd \
		ft_calloc \
		ft_strdup \
		ft_substr\
		ft_strjoin \
		ft_strtrim \
		ft_itoa \
		ft_split \
		ft_strmapi \
		ft_striteri \
		ft_putstr_fd \
		ft_putendl_fd \
		ft_putnbr_fd \

FILES_BONUS =		ft_lstnew_bonus \
					ft_lstsize_bonus \
					ft_lstiter_bonus \
					ft_lstlast_bonus \
					ft_lstadd_back_bonus \
					ft_lstdelone_bonus \
					ft_lstclear_bonus \
					ft_lstmap_bonus \
					ft_lstadd_front_bonus \

SRCS_DIR = ./
SRCS = $(addprefix $(SRCS_DIR), $(addsuffix .c, $(FILES)))
SRCS_BONUS = $(addprefix $(SRCS_DIR), $(addsuffix .c, $(FILES_BONUS)))

OBJS_DIR = ./
#OBJS = $(addprefix $(OBJS_DIR), $(addsuffix .o, $(FILES)))
#OBJS_BONUS = $(addprefix $(OBJS_DIR), $(addsuffix .o, $(FILES_BONUS)))

OBJ = $(SRCS:%.c=%.o)

OBJ_BONUS = $(SRCS_BONUS:%.c=%.o)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJ) $(OBJ_BONUS)
	$(AR) $(NAME) $(OBJ) $(OBJ_BONUS)

all: $(NAME)

bonus: $(OBJ_BONUS)
	$(AR) $(NAME) $(OBJ) $(OBJ_BONUS)

clean:
	$(RM) $(OBJ) $(OBJ_BONUS)

fclean: clean
	$(RM) $(NAME)

re: clean all

rebonus: fclean bonus

.PHONY: all bonus clean fclean re rebonus