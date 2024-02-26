# 自动更新 GitHub 仓库方法

## 1. 准备工作

在开始之前，请确保您已完成以下准备工作：
- 创建一个 GitHub 仓库，并获取**仓库地址**。
- 生成**个人访问令牌**（Personal Access Token）用于身份验证。

## 2. 编写自动更新脚本

创建一个shell脚本，具体内容及注释见 `auto_update_github.sh`文件，该文件为定时任务执行具体的执行内容。

## 3. 使用linux cron 进行定时任务

**crond** 是后台守护进程的名称，用来实际执行脚本，它在系统中是一直运行的。  
**crontab** 是一个工具，用来管理定时任务列表，比如添加作业、编辑作业、删除作业、查看作业。作为管理工具，不会后台运行，需要手动调用，执行完自动退出。

- 开启 crond 服务
  - 启动服务：`systemctl start crond`
  - 关闭服务：`systemctl stop crond`
  - 重启服务：`systemctl restart crond`
- 添加定时任务
  - 首先创建一个xx.cron文件
  - 向该文件中编辑定时任务的执行周期，例`3,15 * * * * /path/your_cron_task.sh`代表每小时的第3分钟和第15分钟执行该shell脚本，`3,15 8-11 * * 1 /path/your_cron_task.sh`代表每周一上午8点到11点的第3和第15分钟执行该脚本。[编写格式的查询地址](https://zhuanlan.zhihu.com/p/353029881)
  - 向**crontab**中添加定时任务，终端命令为`crontab /path/xx.cron`。
  - 查看是否添加成功，终端命令为`crontab -l`。
- 删除所有定时定时任务
  - 终端命令为`crontab -r`。
- 检查cron的运行状态
  - 终端命令为`systemctl cron status`。
  


