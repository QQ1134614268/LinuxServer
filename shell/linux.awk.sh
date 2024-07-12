awk "aa|bb" filename
grep 'xx' /home/error.* | awk -F '异常' '{print $2}'

#Usage: awk [POSIX or GNU style options] -f progfile [--] file ...
#Usage: awk [POSIX or GNU style options] [--] 'program' file ...
#POSIX options:		GNU long options: (standard)
#	-f progfile		--file=progfile
#	-F fs			--field-separator=fs
#	-v var=val		--assign=var=val
#Short options:		GNU long options: (extensions)
#	-b			--characters-as-bytes
#	-c			--traditional
#	-C			--copyright
#	-d[file]		--dump-variables[=file]
#	-e 'program-text'	--source='program-text'
#	-E file			--exec=file
#	-g			--gen-pot
#	-h			--help
#	-L [fatal]		--lint[=fatal]
#	-n			--non-decimal-data
#	-N			--use-lc-numeric
#	-O			--optimize
#	-p[file]		--profile[=file]
#	-P			--posix
#	-r			--re-interval
#	-S			--sandbox
#	-t			--lint-old
#	-V			--version
#
#To report bugs, see node `Bugs' in `gawk.info', which is
#section `Reporting Problems and Bugs' in the printed version.
#
#gawk is a pattern scanning and processing language.
#By default it reads standard input and writes standard output.
#
#Examples:
#	gawk '{ sum += $1 }; END { print sum }' file
#	gawk -F: '{ print $1 }' /etc/passwd
