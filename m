Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ofe9y-0004Mq-SR
	for mharc-qemu-riscv@gnu.org; Tue, 04 Oct 2022 05:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ofe9x-0004LR-Ot
 for qemu-riscv@nongnu.org; Tue, 04 Oct 2022 05:24:17 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ofe9u-0004OK-MN
 for qemu-riscv@nongnu.org; Tue, 04 Oct 2022 05:24:17 -0400
Received: by mail-pg1-x529.google.com with SMTP id q9so12221382pgq.8
 for <qemu-riscv@nongnu.org>; Tue, 04 Oct 2022 02:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FRti7/w2G6ja63I+XSRHDfjXoUV0Jx/llmf+dyAA6jk=;
 b=NZAdq2nAZyjbpb0QfySd4nxQIUESqNUZO210AHcGBebFqHOR70LOGqQ8uUhEo+KCNr
 Ws1Ckcx7yKtuY0IrVMFdHte9ZzXbg/0jq/Len2xn43wUjtLPDgpcLWHVq1a0CuivXrTW
 En3xv9ObTO6zMN4+5dEjajdTAIsMRS0HI1MeDl2qxxdxbkhBsQi2m5+8Llz+Rf1vWzFh
 Bvj4J7jQepgX9F0mEFAoU2ia5DiWvOspSe6yj6ZLsJEiDsTZwbl5QV1gGnMSr0j9br25
 EsVXxZLdMFE71jgpKtnmk6cQ0q8pd25hKXFv2DHb0XsAMjLKd2AzRzX7+mvppPvJwRA/
 BwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FRti7/w2G6ja63I+XSRHDfjXoUV0Jx/llmf+dyAA6jk=;
 b=G/NC7jBbJT2y8kjIraILqq9jdl3UNlO+NZYoB0Zs5GZM2g26XZiPgwNfYNqoA2JJHv
 PKXJd9oqmkseSSQt993kFdpsedn3bL/0APSXl/3S36U3uNGjq91Zf7FBnFZNOWpviHfe
 EIcS70gwtj5o8KdhWQbKQ78/4oETMCHtkTEjic6DiPksP71qs82+UkBdXBUNn9elgcmU
 cTWqt0TUZVr8NdSX62MIo8sQo+NYbBgKKFr+9WBv5OIHPqvpRdDILmTPgQT6Kknc7jrB
 S7oE7ECwi9isvm8bOqdCeMRHnUJpIQwuiJYQZGgxkqi260HGy2Lb49NNFEd/i/0M72kr
 F2EA==
X-Gm-Message-State: ACrzQf3i4+xomd4ihsRHqFmyyvcDn/6BfRmsSnPLIuaOQ/5a6fHRQvJ6
 JDgkDvpWaaOXg3faG5Gv+1om8Q==
X-Google-Smtp-Source: AMsMyM4GAqtI6IyvZ1oD7bbMe2mZIMA/R8pej/pjcL8bk9N0+hLOaDgelxzqE11dfJP1/ZSQFiOxUQ==
X-Received: by 2002:a63:1317:0:b0:42a:e7a5:ef5a with SMTP id
 i23-20020a631317000000b0042ae7a5ef5amr22876898pgl.392.1664875451273; 
 Tue, 04 Oct 2022 02:24:11 -0700 (PDT)
Received: from localhost.localdomain ([49.206.9.142])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a17090b070200b001fba4716f11sm2934551pjz.22.2022.10.04.02.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 02:24:10 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH V5 3/3] hw/riscv: virt: Enable booting S-mode firmware from
 pflash
Date: Tue,  4 Oct 2022 14:53:51 +0530
Message-Id: <20221004092351.18209-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221004092351.18209-1-sunilvl@ventanamicro.com>
References: <20221004092351.18209-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 04 Oct 2022 09:24:18 -0000

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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/boot.c         | 29 +++++++++++++++++++++++++++++
 hw/riscv/virt.c         | 18 +++++++++++++++++-
 include/hw/riscv/boot.h |  1 +
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 1ae7596873..fa8ad27da2 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -338,3 +338,32 @@ void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr)
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
+
+        if (machine->kernel_cmdline) {
+            fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
+                           strlen(machine->kernel_cmdline) + 1);
+            fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA,
+                              machine->kernel_cmdline);
+        }
+    }
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index de2efccebf..a5bc7353b4 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1274,7 +1274,23 @@ static void virt_machine_done(Notifier *notifier, void *data)
     s->fw_cfg = create_fw_cfg(machine);
     rom_set_fw(s->fw_cfg);
 
-    if (machine->kernel_filename) {
+    if (drive_get(IF_PFLASH, 0, 1)) {
+        /*
+         * S-mode FW like EDK2 will be kept in second plash (unit 1).
+         * When both kernel, initrd and pflash options are provided in the
+         * command line, the kernel and initrd will be copied to the fw_cfg
+         * table and opensbi will jump to the flash address which is the
+         * entry point of S-mode FW. It is the job of the S-mode FW to load
+         * the kernel and initrd using fw_cfg table.
+         *
+         * If only pflash is given but not -kernel, then it is the job of
+         * of the S-mode firmware to locate and load the kernel.
+         * In either case, the next_addr for opensbi will be the flash address.
+         */
+        riscv_setup_firmware_boot(machine);
+        kernel_entry = virt_memmap[VIRT_FLASH].base +
+                       virt_memmap[VIRT_FLASH].size / 2;
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


