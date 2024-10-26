
# Gobuster

```bash
gobuster dir -u $TARGET -w $WORDLIST
gobuster dir -u $TARGET -w $WORDLIST -x php
gobuster dns -d $TARGET_DOMAIN -t 50 -w $WORDLIST
gobuster vhost -u $TARGET_DOMAIN -w $WORDLIST --append-domain
```

