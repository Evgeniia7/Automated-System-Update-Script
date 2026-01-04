# Automated System Update Script

A **Bash script** to automate system maintenance tasks. It checks for updates, performs necessary installations, and cleans up old packages. Designed for user-friendly execution on Debian/Ubuntu systems.

---

## Features

- **Automated Updates:** Runs system commands like `apt update` and `apt upgrade`.
- **Cleanup:** Removes unnecessary packages and files after updates.
- **Logging:** Tracks update success or failure.

---
## Requirements

- Linux (Debian/Ubuntu-based)
- Bash shell
- Sudo privileges

---
## Usage

To use this script, follow these steps:

### 1. Clone the repository

```bash
git clone [https://github.com/Evgeniia7/Automated-System-Update-Script.git](https://github.com/Evgeniia7/Automated-System-Update-Script.git)
cd Automated-System-Update-Script

#### 2. Make the Script Executable
chmod +x system_update.sh

##### 3. Run the Script
sudo ./system_update.sh
