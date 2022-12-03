#df -lh
#
#du 语法：
#du [-abcDhHklmsSx] [-L <符号连接>][-X <文件>][--block-size][--exclude=<文件夹或文件>] [--max-depth=<文件夹层数>][--help][--version][文件夹或文件]
#-h：以人类可读的方式显示
#-a：显示目录占用的磁盘空间大小，还要显示其下目录和文件占用磁盘空间的大小
#-s：显示目录占用的磁盘空间大小，不要显示其下子目录和文件占用的磁盘空间大小
#-c：显示几个目录或文件占用的磁盘空间大小，还要统计它们的总和
#--apparent-size：显示目录或文件自身的大小
#-l ：统计硬链接占用磁盘空间的大小
#-L：统计符号链接所指向的文件占用的磁盘空间大小
#常使用參数：
#-a或-all 为每一个指定文件显示磁盘使用情况，或者为文件夹中每一个文件显示各自磁盘使用情况。
#-b或-bytes 显示文件夹或文件大小时，以byte为单位。
#-c或–total 除了显示文件夹或文件的大小外，同一时候也显示全部文件夹或文件的总和。
#-D或–dereference -args 显示指定符号连接的源文件大小。
#-h或–human -readable 以K``，M``，G为单位，提高信息的可读性。
#-H或–si 与-h參数同样，可是K``，M``，G是以1000为换算单位,而不是以1024为换算单位。
#-k或–kilobytes 以1024`` bytes为单位。
#-l或–count -links 反复计算硬件连接的文件。
#-L<符号连接>或–dereference<符号连接> 显示选项中所指定符号连接的源文件大小。
#-m或–megabytes 以1MB为单位。
#-s或–summarize 仅显示总计，即当前文件夹的大小。
#-S或–separate -dirs 显示每一个文件夹的大小时，并不含其子文件夹的大小。
#-x或–one``-file -xystem 以一開始处理时的文件系统为准，若遇上其它不同的文件系统文件夹则略过。
#-X<文件>或–exclude -from=<文件> 在<文件>指定文件夹或文件。
#–exclude=<文件夹或文件> 略过指定的文件夹或文件。
#–max -depth=<文件夹层数> 超过指定层数的文件夹后，予以忽略。
#–help 显示帮助。
#–version 显示版本号信息