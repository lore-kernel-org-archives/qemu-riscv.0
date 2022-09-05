Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVGkt-0002U4-JJ
	for mharc-qemu-riscv@gnu.org; Mon, 05 Sep 2022 14:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVGkr-0002Pu-NT
 for qemu-riscv@nongnu.org; Mon, 05 Sep 2022 14:23:29 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVGkj-00028n-UB
 for qemu-riscv@nongnu.org; Mon, 05 Sep 2022 14:23:29 -0400
Received: by mail-pg1-x535.google.com with SMTP id t70so2838538pgc.5
 for <qemu-riscv@nongnu.org>; Mon, 05 Sep 2022 11:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/Hfi1dqn7aBKUskyIzQv2SXHLLV50tRsQ66eiL+Qum8=;
 b=CSv3wy3KLWo6GFb8e25uWFTqD4WhCvkZ09VWoN8sF0xFwdeujLhmtmCfLr86cNUEGC
 tM3UpWzHrqlIFcbRxMWHcITdva6jwDEePvf/iHkQ9GTCWMH+Xq6mpyPRZWyZkUN5mAir
 tfjATx7V/YY1EKNrmOZAlOdLNNrd9Vzt07wFge7dlSwInsILbvFQvwQaAbEAOqLMManB
 AkxjDy6eeU3ofFZ4ahsMd6uxTdU8RPvwcUVEz9itHbVjCeXDC1TT2tLu78SrqnwP3qjj
 vpe9N/BwLCU7uC/U0xody4f9sP+Sr6eaQivGdJ/L0iRYvlYniggj4r0pHwOcEeUxu8Z2
 PMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/Hfi1dqn7aBKUskyIzQv2SXHLLV50tRsQ66eiL+Qum8=;
 b=3lVxMMXuyVFevwKhzDFqrYOphiPTPv4oU0JIbNWICaVHUBD5UDvhIUzNSBXgYp2ZeN
 KpBDZCjbDwZkp0yC2/3nBmg+j12z9Fyq2IAwESv6ZQ1bg34BYAy5lUVDHvreK7ysNhRx
 mRDOLsbgPpOHBm776NArpzvjB+evdhAXwTBPBb0guKRzHe84W1KTUGwhzhzN+AV576lU
 hnI+NyACG87cTv5Jq/caTEPQAWGXjcjk+14MM0j+keM7AS2mCV6jtUhuo088WjAq6MKr
 ds//VovsfrjV1044EkjaR5xLwBPCNH4L9f4IMTtMLRzcLxFejWgJ5fazpkXy0cYjS6wC
 RM8Q==
X-Gm-Message-State: ACgBeo2JKP+YbPsw9+V0qCJxxLFSStyBx43E6uiD7T68hRHlnrCrfbcf
 c2YyIOzKqV10M1mfc6sMy03YYQ==
X-Google-Smtp-Source: AA6agR5gORXLJDzfgTDmlFMjDN7/ErZWko3JmvBNALZ6I2RqwkPdPj/f3C/IOOmwX0q7DKfxpgYHdA==
X-Received: by 2002:a63:4b62:0:b0:421:8c8b:163c with SMTP id
 k34-20020a634b62000000b004218c8b163cmr41032332pgl.182.1662402200491; 
 Mon, 05 Sep 2022 11:23:20 -0700 (PDT)
Received: from localhost.localdomain ([49.206.11.92])
 by smtp.gmail.com with ESMTPSA id
 z7-20020aa79587000000b005321340753fsm8046724pfj.103.2022.09.05.11.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 11:23:20 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V2 3/3] hw/riscv: virt: Enable booting S-mode firmware from
 pflash
Date: Mon,  5 Sep 2022 23:52:38 +0530
Message-Id: <20220905182238.374545-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905182238.374545-1-sunilvl@ventanamicro.com>
References: <20220905182238.374545-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Sep 2022 18:23:30 -0000

To boot S-mode firmware payload like EDK2 from persistent
flash storage, qemu needs to pass the flash address as the
next_addr in fw_dynamic_info to the opensbi.

When both -kernel and -pflash options are provided in command line,
the kernel (and initrd if -initrd) will be copied to fw_cfg table.
The S-mode FW will load the kernel/initrd from fw_cfg table.

If only pflash is given but not -kernel, then it is the job of
of the S-mode firmware to locate and load the kernel.

In either case, update the kernel_entry with the flash address
so that the opensbi can jump to the entry point of the S-mode
firmware.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/boot.c         | 28 ++++++++++++++++++++++++++++
 hw/riscv/virt.c         | 17 ++++++++++++++++-
 include/hw/riscv/boot.h |  1 +
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 1ae7596873..39436b8d56 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -338,3 +338,31 @@ void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr)
         riscv_cpu->env.fdt_addr = fdt_addr;
     }
 }
+
+void riscv_setup_firmware_boot(MachineState *machine)
+{
+    if (machine->kernel_filename) {
+        FWCfgState *fw_cfg;
+        fw_cfg = fw_cfg_find();
+
+        assert(fw_cfg);
+        /*
+         * Expose the kernel, the command line, and the initrd in fw_cfg.
+         * We don't process them here at all, it's all left to the
+         * firmware.
+         */
+        load_image_to_fw_cfg(fw_cfg,
+                             FW_CFG_KERNEL_SIZE, FW_CFG_KERNEL_DATA,
+                             machine->kernel_filename,
+                             true);
+        load_image_to_fw_cfg(fw_cfg,
+                             FW_CFG_INITRD_SIZE, FW_CFG_INITRD_DATA,
+                             machine->initrd_filename, false);
+        if (machine->kernel_cmdline) {
+            fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
+                           strlen(machine->kernel_cmdline) + 1);
+            fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA,
+                              machine->kernel_cmdline);
+        }
+    }
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b6bbf03f61..b985df9b16 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1258,7 +1258,22 @@ static void virt_machine_done(Notifier *notifier, void *data)
     s->fw_cfg = create_fw_cfg(machine);
     rom_set_fw(s->fw_cfg);
 
-    if (machine->kernel_filename) {
+    if (drive_get(IF_PFLASH, 0, 1)) {
+        /*
+         * S-mode FW like EDk2 will be kept in second plash (unit 1). When
+         * both -kernel and -pflash options are provided in command line,
+         * the kernel, initrd will be copied to fw_cfg table and opensbi
+         * will jump to flash address which is the entry point of S-mode FW.
+         * It is the job of the S-mode FW to load the kernel/initrd and launch.
+         *
+         * If only pflash is given but not -kernel, then it is the job of
+         * of the S-mode firmware to locate and load the kernel.
+         * In either case, the next_addr for opensbi will be the flash address.
+         */
+        riscv_setup_firmware_boot(machine);
+        kernel_entry = virt_memmap[VIRT_FLASH].base +
+                         virt_memmap[VIRT_FLASH].size / 2;
+    } else if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index a36f7618f5..93e5f8760d 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -57,5 +57,6 @@ void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
                                   uint32_t reset_vec_size,
                                   uint64_t kernel_entry);
 void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr);
+void riscv_setup_firmware_boot(MachineState *machine);
 
 #endif /* RISCV_BOOT_H */
-- 
2.25.1


