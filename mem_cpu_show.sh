# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mem_cpu_show.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: macbook <macbook@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/12/30 23:01:03 by macbook           #+#    #+#              #
#    Updated: 2017/12/30 23:42:00 by macbook          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


memcpu=$(ps -eo cmd,%mem,%cpu --sort=-%mem | head -10)
mem=$(ps -eo %mem --sort=-%mem | head -10)
cpu=$(ps -eo %cpu --sort=-%cpu | head -10)
cmd=$(ps -eo cmd --sort=-%mem | head -2 | cut -d ' ' -f 1)


echo $mem | cut -d ' ' -f 2
echo $cpu | cut -d ' ' -f 2
echo $cmd | cut -d ' ' -f 2
#echo $cpu

