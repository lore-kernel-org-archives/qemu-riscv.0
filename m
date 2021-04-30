Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lcNLA-0000UA-45
	for mharc-qemu-riscv@gnu.org; Fri, 30 Apr 2021 03:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNL6-0000R2-OI; Fri, 30 Apr 2021 03:13:28 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNL4-0000WV-SX; Fri, 30 Apr 2021 03:13:28 -0400
Received: by mail-ej1-x62b.google.com with SMTP id r12so103724071ejr.5;
 Fri, 30 Apr 2021 00:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7dCWjL573Gahu7h+Kf6RESRLjB/RTp/6jU2NDFatOOM=;
 b=lMZ8wZqTqlBXnXm6ZdnkVclGenxn70MDN60s6gi+nZW4Srx5Khauyw16wMYVxe2Ros
 98yG9pK5vMBocEItg+S0i8fnMnOiRxsER36eyxoS3l9LuEB0wVED9kQ9d0bdANjJpjk3
 DKN6q4MG/tQbtbDnK3PaRvFXN7WKh92IGvmOmXBf+Zvp3qvObu7fEgIrVSzxgR/HfLmJ
 AZkUP/ZCgFAaKZKW2x3dGW5l91FTx9Y8OfRFBohZu7V9MgP2Tl4eIIpLQNGf1huC3gln
 5cxaP3P2KSlKHCnF1TIMyqUm/vf/GUhATllzfuEMsrr52CA9uQNdj0uQfpOrrK7vxqvx
 d8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7dCWjL573Gahu7h+Kf6RESRLjB/RTp/6jU2NDFatOOM=;
 b=JscXs5vnCE6gO3vV0/qLj49SIAHndeipOSz+5TSYxH0Ap+vhPYOwyzA96+A5qcG2mq
 tAMYaPa3XtogcZzXsEliU4A2jE4DwUIQtll+gPmGXDY1xnIXEuXbNZN8Inppa+gUa6Ue
 2JFh3sk0dAxqSfErilOYaa9E+D1/ZwUuCMbb3Dg8UhXvhMUNp8JRC5igt0uTHieODi2m
 oD0wVcZuIV0GUa3icldTzFaeN09K1T14BD+HvPk9ULstagl5/NzkT+w2NAkVUmAYg2XS
 oyFQOpOETDs9TxZ1WQ3N76WNgQmplP5zk6htAqvDOWTbsUf+4Gnc+ZKuVDrovNjmupLL
 4ylw==
X-Gm-Message-State: AOAM531j/6RCvzZqlKYSq2WtDoiWQ/vxvoYNJnaPnokbpiTk/s1NQAvB
 T7AbRC0DQFYULqJEghP+AN/DN9DGmbc=
X-Google-Smtp-Source: ABdhPJwDmIJ7oPj2hI5nuRRx5KPlB0m4i+C38BfL9EEX5V9035WpNRg0QpI4Ga6Ycc8hweuFVu3pEQ==
X-Received: by 2002:a17:906:f210:: with SMTP id
 gt16mr2650816ejb.52.1619766805202; 
 Fri, 30 Apr 2021 00:13:25 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id b19sm574462edd.66.2021.04.30.00.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 00:13:24 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 7/8] hw/riscv: Use macros for BIOS image names
Date: Fri, 30 Apr 2021 15:13:01 +0800
Message-Id: <20210430071302.1489082-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430071302.1489082-1-bmeng.cn@gmail.com>
References: <20210430071302.1489082-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62b.google.com
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
X-List-Received-Date: Fri, 30 Apr 2021 07:13:29 -0000

From: Bin Meng <bin.meng@windriver.com>

The OpenSBI BIOS image names are used by many RISC-V machines.
Let's define macros for them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 include/hw/riscv/boot.h | 5 +++++
 hw/riscv/sifive_u.c     | 6 ++----
 hw/riscv/spike.c        | 6 ++----
 hw/riscv/virt.c         | 6 ++----
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 11a21dd584..0e89400b09 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -24,6 +24,11 @@
 #include "hw/loader.h"
 #include "hw/riscv/riscv_hart.h"
 
+#define RISCV32_BIOS_BIN    "opensbi-riscv32-generic-fw_dynamic.bin"
+#define RISCV32_BIOS_ELF    "opensbi-riscv32-generic-fw_dynamic.elf"
+#define RISCV64_BIOS_BIN    "opensbi-riscv64-generic-fw_dynamic.bin"
+#define RISCV64_BIOS_ELF    "opensbi-riscv64-generic-fw_dynamic.elf"
+
 bool riscv_is_32bit(RISCVHartArrayState *harts);
 
 target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b55e56890c..f30cc8004b 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -561,12 +561,10 @@ static void sifive_u_machine_init(MachineState *machine)
 
     if (riscv_is_32bit(&s->soc.u_cpus)) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv32-generic-fw_dynamic.bin",
-                                    start_addr, NULL);
+                                    RISCV32_BIOS_BIN, start_addr, NULL);
     } else {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv64-generic-fw_dynamic.bin",
-                                    start_addr, NULL);
+                                    RISCV64_BIOS_BIN, start_addr, NULL);
     }
 
     if (machine->kernel_filename) {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index f094bb2158..98932fba62 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -259,13 +259,11 @@ static void spike_board_init(MachineState *machine)
      */
     if (riscv_is_32bit(&s->soc[0])) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv32-generic-fw_dynamic.elf",
-                                    memmap[SPIKE_DRAM].base,
+                                    RISCV32_BIOS_ELF, memmap[SPIKE_DRAM].base,
                                     htif_symbol_callback);
     } else {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv64-generic-fw_dynamic.elf",
-                                    memmap[SPIKE_DRAM].base,
+                                    RISCV64_BIOS_ELF, memmap[SPIKE_DRAM].base,
                                     htif_symbol_callback);
     }
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 8a8ff04dab..b03c5f8b5b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -682,12 +682,10 @@ static void virt_machine_init(MachineState *machine)
 
     if (riscv_is_32bit(&s->soc[0])) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv32-generic-fw_dynamic.bin",
-                                    start_addr, NULL);
+                                    RISCV32_BIOS_BIN, start_addr, NULL);
     } else {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv64-generic-fw_dynamic.bin",
-                                    start_addr, NULL);
+                                    RISCV64_BIOS_BIN, start_addr, NULL);
     }
 
     if (machine->kernel_filename) {
-- 
2.25.1


