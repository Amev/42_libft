# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vame <marvin@42.fr>                        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/11/10 16:31:28 by vame              #+#    #+#              #
#    Updated: 2015/05/02 18:24:03 by vame             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# cibles prioritaire pour les regles sans dependances
.PHONY: all lib clean fclean re

# desactivation des regles implicites pour eviter la compilation automatique
.SUFFIXES:


#
## variables
#

NAME =		libft.a

CC =		gcc

CFLAGS =	-Wall -Wextra -Werror

INC_FNC =	libft.h
GCH_FNC =	$(INC_FNC:.h=.h.gch)

FUNCTIONS = ft_abs.c ft_atoi.c ft_bzero.c ft_isalnum.c \
	  		ft_isalpha.c ft_isascii.c ft_isdigit.c \
	  		ft_islower.c ft_isprint.c ft_isupper.c \
	  		ft_itoa.c ft_memalloc.c ft_memccpy.c \
	  		ft_memchr.c ft_memcmp.c ft_memcpy.c \
	  		ft_memdel.c ft_memmove.c ft_memset.c \
	  		ft_putchar.c ft_putchar_fd.c ft_putendl.c \
	  		ft_putendl_fd.c ft_putnbr_fd.c ft_putnbr.c ft_min_db.c \
	  		ft_putstr_fd.c ft_putstr.c ft_strcat.c ft_lstiter_r.c \
	  		ft_strchr.c ft_strclr.c ft_strcmp.c ft_atoi_l.c \
	  		ft_strcpy.c ft_strdel.c ft_strdup.c ft_max.c ft_min.c \
	  		ft_strequ.c ft_striter.c ft_striteri.c ft_max_db.c \
	  		ft_strjoin.c ft_strlcat.c ft_strlen.c ft_abs_db.c \
	  		ft_strmap.c ft_strmapi.c ft_strncat.c ft_color_degrade.c \
	  		ft_strncmp.c ft_strncpy.c ft_strnequ.c ft_nbrsplit.c \
	  		ft_strnew.c ft_strnstr.c ft_strrchr.c ft_strsplit_esc.c \
	  		ft_strstr.c ft_strsub.c ft_lstmap.c ft_strlen_c.c\
	  		ft_strtrim.c ft_tolower.c ft_toupper.c ft_strdel_double.c \
	  		ft_lstnew.c ft_lstdelone.c ft_lstdel.c \
	  		ft_lstadd.c ft_lstadd_back.c ft_lstiter.c ft_wcharlen.c \
	  		ft_strsplit.c ft_putwchar.c ft_wstrlen.c ft_putwstr.c \
	  		ft_lstlen.c ft_itoa_base_usgnd.c

INC_PTF =	ft_printf.h
GCH_PTF =	$(INC_PTF:.h=.h.gch)

PRINTF = 	ft_printf.c ptf_fonctions.c ptf_flags.c \
			ptf_layout.c ptf_print_sign.c ptf_asterisk.c

INC_GNL =	get_next_line.h
GCH_GNL =	$(INC_GNL:.h=.h.gch)

GNL =		get_next_line.c get_next_line_2.c


BIN_FNC =	$(FUNCTIONS:.c=.o)
BIN_PTF =	$(PRINTF:.c=.o)
BIN_GNL =	$(GNL:.c=.o)


#
## regles
#

all: $(NAME)
	@:

$(NAME): $(BIN_FNC) $(BIN_PTF) $(BIN_GNL) $(INC_FNC) $(INC_PTF) $(INC_GNL)
		ar rc $(NAME) $(BIN_FNC) $(BIN_PTF) $(BIN_GNL)
		ranlib $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c $^ -o $@

$(BIN_PTF):
	$(CC) $(CFLAGS) -c $(PRINTF) $(INC_PTF)

$(BIN_GNL):
	$(CC) $(CFLAGS) -c $(GNL) $(INC_GNL)

clean:
	rm -f $(BIN_FNC) $(BIN_PTF) $(BIN_GNL) $(GCH_FNC) $(GCH_PTF) $(GCH_GNL)

fclean: clean
	rm -f $(NAME)

re: fclean all
