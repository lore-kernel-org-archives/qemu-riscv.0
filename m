Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvwt0-0005zH-9H
	for mharc-qemu-riscv@gnu.org; Thu, 16 Jul 2020 01:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jvwsx-0005tu-RB; Thu, 16 Jul 2020 01:56:47 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jvwsw-0000Lq-Ac; Thu, 16 Jul 2020 01:56:47 -0400
Received: by mail-wr1-x444.google.com with SMTP id f7so5718655wrw.1;
 Wed, 15 Jul 2020 22:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=v4rIb2CeclCvwojfrkAqQ1sS0w4c9rJ4vZWLayY4XDc=;
 b=CVZCbEj8q8nNgCkAPO0JJkK4Tk4OrU03tI+1IW2lZLzcZWrM2Yx6R4NOTCUGptCUfJ
 7yLYTiXK3psqw/910aOi9KnKHSLKiYjby05ZGEsMC2xHKP/6YZ+XXGNjdghomHgtjWIP
 Xbf5K2WDhBJ/xzlUoBgemIdAZuFGdKBGUurCh+d40YlVFAlNyPE6illau8HJs57FIIV1
 /ju1q3fTiChS8RS275AKg4Li8GuNktAOuT4C2Q5nZ8+lLa8gkVjHvdJ5r28fmtH1wlnz
 AnP12OY1zyiK+hNY3nKHKgfqjJYWa0N/e4lRLRXkRtfqOrAYTQYeMcywytZqdZWkQpIz
 jhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=v4rIb2CeclCvwojfrkAqQ1sS0w4c9rJ4vZWLayY4XDc=;
 b=YaCA8bJobOyLi/CJQmFZI4no579R1DMSUyqe6Usc44+ActOU56QHTKb1dtCfQC9SOW
 WmbjzyVoo9ECkGV2RS/H85GkewlmXceWqyubdQSAfr7bG2Ypy638JgKuuumjPaIjg6H8
 47c2p2TpFVLEB/mkevRuArVEkou3cUtltw9NTsXfrI1e4fWNjBDmAE1s6RkyRd6ZTsEU
 oz6wnWE0datsyqcEqrgM4JlkS4dyTTeAaGthK29OB4aUrPZPtY0m9SRZmsNECylQ45RH
 y/qKm9/G8ssTOeQlvYGXI10uuBXki3xJsxJ89SCHei/fkgtrZmfk5F4IO4t0A3mTIVqc
 e/iw==
X-Gm-Message-State: AOAM532X7V1F9d1jPT52GzVQNhH/Pv0xh1PhG5EwhpHJpioYFr8dOtqn
 uO5tjL/UMNPBD+vHSZh0o6E=
X-Google-Smtp-Source: ABdhPJyeRQ89v02DAROIHnm/6tk4X93uhC5ccEsi4dbjE+RUR5yKW+250CwJg7INMxLROKDFTz+OtQ==
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr3296268wrr.196.1594879004844; 
 Wed, 15 Jul 2020 22:56:44 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id f12sm7193458wrw.53.2020.07.15.22.56.42
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 15 Jul 2020 22:56:44 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Anup Patel <anup@brainfault.org>,
	Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v5 5/7] hw/riscv: spike: Change the default bios to use
 generic platform image
Date: Wed, 15 Jul 2020 22:56:09 -0700
Message-Id: <1594878971-26050-6-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1594878971-26050-1-git-send-email-bmeng.cn@gmail.com>
References: <1594878971-26050-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=bmeng.cn@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 16 Jul 2020 05:56:48 -0000

From: Bin Meng <bin.meng@windriver.com>

To keep sync with other RISC-V machines, change the default bios to
use generic platform fw_dynamic.elf image.

While we are here, add some comments to mention that using ELF files
for the Spike machine was intentional.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

(no changes since v3)

Changes in v3:
- Change to fw_dynamic.elf for Spike

 hw/riscv/spike.c                               |   9 +++++++--
 pc-bios/opensbi-riscv32-generic-fw_dynamic.elf | Bin 0 -> 558668 bytes
 pc-bios/opensbi-riscv64-generic-fw_dynamic.elf | Bin 0 -> 620424 bytes
 3 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
 create mode 100644 pc-bios/opensbi-riscv64-generic-fw_dynamic.elf

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 7b23a29..13958bd 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -42,10 +42,15 @@
 #include "sysemu/qtest.h"
 #include "sysemu/sysemu.h"
 
+/*
+ * Not like other RISC-V machines that use plain binary bios images,
+ * keeping ELF files here was intentional because BIN files don't work
+ * for the Spike machine as HTIF emulation depends on ELF parsing.
+ */
 #if defined(TARGET_RISCV32)
-# define BIOS_FILENAME "opensbi-riscv32-spike-fw_jump.elf"
+# define BIOS_FILENAME "opensbi-riscv32-generic-fw_dynamic.elf"
 #else
-# define BIOS_FILENAME "opensbi-riscv64-spike-fw_jump.elf"
+# define BIOS_FILENAME "opensbi-riscv64-generic-fw_dynamic.elf"
 #endif
 
 static const struct MemmapEntry {
diff --git a/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf b/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
new file mode 100644
index 0000000..eb9ebf5
Binary files /dev/null and b/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf differ
diff --git a/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf b/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf
new file mode 100644
index 0000000..642a64e
Binary files /dev/null and b/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf differ
-- 
2.7.4


