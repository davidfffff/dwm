//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"^c#7aa2f7^ ^c#a9b1d6^", "~/cpu.sh", 1, 0},
	{"^c#bb9af7^  ^c#a9b1d6^", "free -h | awk '/^Mem/ { print $3 }' | sed s/i//g",	5,		0},
	{"", "~/net.sh",					1,		0},
	{"", "~/vol.sh",					1,		0},
	{"", "~/bat.sh",					1,		0},
	{" ", "date '+%H:%M '",					60,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "  ";
static unsigned int delimLen = 5;
