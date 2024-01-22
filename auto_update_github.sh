#!/bin/bash

# GitHub 自动更新脚本

REPO="https://github.com/your-username/your-repository.git"  # 替换为您的仓库地址
TOKEN="your-personal-access-token"  # 替换为您的个人访问令牌

# 进入仓库目录
cd /path/to/your/repository

# 拉取最新代码
git pull origin main

# 比较当前工作目录与最后一次提交的快照之间的状态
if git status --porcelain; then
    # 有未提交的更改，执行添加、提交和推送更改
    git add .
    git commit -m "Auto-update: $(date +'%Y-%m-%d %H:%M:%S')"
    git push -u origin main -f
    echo "push over!"
else
    # 没有未提交的更改
    echo "No changes in the working directory. Skipping commit and push."
fi
# 结束

