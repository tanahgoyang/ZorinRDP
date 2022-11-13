# ZorinRDP 🖥

![version](https://img.shields.io/badge/version-2.0.0-blue&style=?style=for-the-badge) 
![Visitors](https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2FZorinArch%2FZorinRDP&labelColor=%23697689&countColor=%230f80c1)

## Description

**What is RDP?**<br>

* **RDP (Remote Desktop Protocol)** is a network communications protocol developed by Microsoft, which allows users to connect to another computer from a remote location.

**How long does this RDP stay active?**<br>

* This RDP stays active for up to **1 hour**.<br>

## How to use it?

#### Step 1

1. Press the **fork** button  
2. Login or signup to ngrok: https://ngrok.com
3. Now visit here for token: https://dashboard.ngrok.com/auth/your-authtoken
   
   > You'll get token from here. It'll be needed to the next step.

#### Step 2

1. In your forked repo: **Go to Settings > Secrets > Action > New Repository Secret**
2. In the name section, enter this text: **NGROK_AUTH_TOKEN**
3. In the value section, enter the **ngrok token**
4. Then press **Add Secret**
5. Now go to **Action > ZorinRDP (Left Menu) > Run Workflow**
6. Refresh the page and go to **ZorinRDP > build** option
7. You'll get IP, Username & Password from **Connect to RDP** section.

 


