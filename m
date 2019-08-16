Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hybzL-0007p6-1u
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 09:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34277)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hybzI-0007ky-K8
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 09:09:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hybzH-00009T-Lh
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 09:09:48 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41114)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hybzF-00007g-Me; Fri, 16 Aug 2019 09:09:45 -0400
Received: by mail-pf1-x442.google.com with SMTP id 196so3111965pfz.8;
 Fri, 16 Aug 2019 06:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=KggTVOC8yADf6NdFItK5nRQaRea4jdHEMeQcbzejC6g=;
 b=mA0k//C+V6lA5g/zaeyDjmiVv3EG0VEz3PpqUUkRTyYnrq5xSbLK+z0H88X9Q92II9
 QcEDfmAC+NWae31DDqugwMix4jBYJCeAOOpDEo0sQu7lPIkhT0LNo7cAXKPrkxF/bpj+
 54LnlbGSu5P5wftd+5uGTRxVR19tXbYEiHk6pFvRwzzy137B/wATJtxz1ns20ROnPL1I
 yGs65lGthgbCwRtq5dwkhUswQ/XKsHpKwuDSEPN+DPlzU+8zUDpn3kamwsBJxHX+8Y5k
 ZI5bVs7pXThtunp1SwJeoSMpmoDhl4BCbrxjFdk4Pnk6rzWsxUxot+GkRhcTpFv9qmAn
 1iSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=KggTVOC8yADf6NdFItK5nRQaRea4jdHEMeQcbzejC6g=;
 b=E7bP1G/fPb5q6DiEk557D1/+79j3xQ7Nt5Dsaq5tNBw4f3pL/sYH0e9e/v49G3wi82
 JWjNHL9s8aHGSLfyLhhm6yBbHQfP3QLBq2dRMv1P3IaDy5AzPpbVDn7XPVDlwyM8ly5b
 5KciNKqF7n6G6bJieHN/c/TsbEVYNYjnqVr3vHH97y0d+I4Flr5Dj15QVnmBHWgdhUA3
 Ym4Dl/UXyxf7Ezzf7dJ4Ne8RJwKRxqRPT30WnEpyX9yX9rDAR87Mg5Wc2vnBg3y7+5Cp
 rjFJC91MKMsejPisYX5oLxbwrnqzYPvbaFwW6jy+9VkU9pPL2ggpeym3ohMgHUpTo2Zz
 XFMA==
X-Gm-Message-State: APjAAAVcwxkM6ii2On2tltdU3bNzYp7yPmeqeSXbZet2LBt1+LhdRoYL
 Ydjp+lYAQNeZicl7uMuxgXtev2z0
X-Google-Smtp-Source: APXvYqz6CBpoTac2OQPKIaEBQs+OXPrgxtfACU+3Zi93xIhcpMyVhViY8f4qF/1Am56ixAUQdjm7bQ==
X-Received: by 2002:a17:90a:374a:: with SMTP id
 u68mr7159655pjb.4.1565960984792; 
 Fri, 16 Aug 2019 06:09:44 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id t7sm6122743pfh.101.2019.08.16.06.09.43
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 16 Aug 2019 06:09:44 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Fri, 16 Aug 2019 06:09:36 -0700
Message-Id: <1565960976-6693-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565960976-6693-1-git-send-email-bmeng.cn@gmail.com>
References: <1565960976-6693-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-riscv] [PATCH 2/2] riscv: Resolve full path of the given bios
 image
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Aug 2019 13:09:50 -0000

At present when "-bios image" is supplied, we just use the straight
path without searching for the configured data directories. Like
"-bios default", we add the same logic so that "-L" actually works.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

 hw/riscv/boot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index a122846..15002d3 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -72,14 +72,14 @@ void riscv_find_and_load_firmware(MachineState *machine,
         firmware_filename = riscv_find_firmware(default_machine_firmware);
     } else {
         firmware_filename = machine->firmware;
+        if (strcmp(firmware_filename, "none")) {
+            firmware_filename = riscv_find_firmware(firmware_filename);
+        }
     }
 
     if (strcmp(firmware_filename, "none")) {
         /* If not "none" load the firmware */
         riscv_load_firmware(firmware_filename, firmware_load_addr);
-    }
-
-    if (!strcmp(machine->firmware, "default")) {
         g_free(firmware_filename);
     }
 }
-- 
2.7.4


