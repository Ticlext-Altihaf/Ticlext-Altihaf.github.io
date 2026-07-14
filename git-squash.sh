BASE=$(git merge-base origin/$(git rev-parse --abbrev-ref HEAD) HEAD); \
git reset --soft "$BASE" && \
echo "Opening editor for your final commit message..." && \
git commit -v && \
git reflog expire --expire=now --all && \
git gc --prune=now --aggressive