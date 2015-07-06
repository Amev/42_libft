/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putwstr.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vame <marvin@42.fr>                        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/01/19 15:53:55 by vame              #+#    #+#             */
/*   Updated: 2015/01/19 16:09:27 by vame             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int				ft_putwstr(wchar_t *str)
{
	int			len;
	int			tmp;

	len = 0;
	while (str && *str)
	{
		if ((tmp = ft_putwchar(*str++)) == -1)
			return (-1);
		len += tmp;
	}
	return (len);
}
