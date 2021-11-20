# length of maximum padding
padding="......................................"

printf "==== TABLE OF CONTENTS ===========================\n"

# print first line
title="1) Chapter one - the intro"
printf "%s%s %s\n" "$title" "${padding:${#title}}" "Page 1"

# print second line
title="2) Chapter two - summary"
printf "%s%s %s\n" "$title" "${padding:${#title}}" "Page 4"