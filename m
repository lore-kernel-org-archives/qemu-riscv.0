Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD142C7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 05:00:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4aPI-0004gy-MB; Thu, 01 Jun 2023 00:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q4aPG-0004gJ-MJ
 for qemu-riscv@nongnu.org; Thu, 01 Jun 2023 00:59:26 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q4aPE-0006F1-O7
 for qemu-riscv@nongnu.org; Thu, 01 Jun 2023 00:59:26 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-55554ab909cso342201eaf.2
 for <qemu-riscv@nongnu.org>; Wed, 31 May 2023 21:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685595563; x=1688187563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rb2DFlL8NbWJDkaOWudgl6M+ct2AD91DAIzG07niuWc=;
 b=aZEjXWrgOnQVmffdpIG7O/25uRlM+I+DFWckgXbPAYPfZmmmllxv5ThVgV1JcHNP9n
 a511EbujzRPOYbS/fCHRrL0n5GVgYtBczYllGv2If5OV7rg8AGG+jTkNBJ5iBuq8hetG
 WeksvTCASx2goHnPWkAaGdQZTQT9rXwH3PhhPqunkHmlquxU/NoGt40YrbxeGCUkI6h1
 XNFxZ/FaALUNmU2mXcdry509ZJ/A64UUMN4JHYrwgN2xEV7G0zDhIEbH9TE2irDu9JBg
 U6a3SudWbfbEi6L3oD9ix9nbvwns4Bx/o9Cp2BUVXOAHSEf06CLojSNp+94gDDiSBJ9T
 aQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685595563; x=1688187563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rb2DFlL8NbWJDkaOWudgl6M+ct2AD91DAIzG07niuWc=;
 b=AwtBSrqMXYvQPADktwl2ysOhRndetFUlrAFEVEQWeHBb4OEAK0V4Nv5aEBtv9LLEXc
 ekDToxdKCmcvCGEX5m9AWJcUUsvrwk6hQ12CngQnz7k7FCWuZPUl8oVs5/XSmag+5IKr
 CWtVpcuW/Z6rn/yThXRcvnxw3QmX7QPtDmkTltLgOQP1b1ciUIVp6L72sNepdZfXHYa4
 9THhEVoqchoravqsIQquR75M+SP7lrq6PW9iRSdw+aVxzwJkbwOFTVhrG4PAW1diF5jC
 66sMNn8G6XR6qNdSZ6TjYuTIXpw00cE2JAglxZMjI9KOMxssuts6PgeDx9yTU9kS6Zmx
 ue5w==
X-Gm-Message-State: AC+VfDw2na+XV6dBLvrHQSwZylPwyOe38aTqLPy4bUZcxG+fuo0JmNDs
 ZXFegghJen5Ro6IPf6UcAdifoeZUTPEHIFYEWyO6aQ==
X-Google-Smtp-Source: ACHHUZ5NzMMtAH2dPHnDuqfO+fZ2Q3WBcI74JOCYBxF2IvB3VIN/bsK1pGoyWfhVJVRzey6qSgkMIQ==
X-Received: by 2002:a4a:4146:0:b0:54f:49ad:1c93 with SMTP id
 x67-20020a4a4146000000b0054f49ad1c93mr4443359ooa.0.1685595563477; 
 Wed, 31 May 2023 21:59:23 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.83.242])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a4ab648000000b0055530a42ce3sm3985608ooo.34.2023.05.31.21.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 21:59:23 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH v7 1/3] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
Date: Thu,  1 Jun 2023 10:29:08 +0530
Message-Id: <20230601045910.18646-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601045910.18646-1-sunilvl@ventanamicro.com>
References: <20230601045910.18646-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oo1-xc2e.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Currently, virt machine supports two pflash instances each with
32MB size. However, the first pflash is always assumed to
contain M-mode firmware and reset vector is set to this if
enabled. Hence, for S-mode payloads like EDK2, only one pflash
instance is available for use. This means both code and NV variables
of EDK2 will need to use the same pflash.

The OS distros keep the EDK2 FW code as readonly. When non-volatile
variables also need to share the same pflash, it is not possible
to keep it as readonly since variables need write access.

To resolve this issue, the code and NV variables need to be separated.
But in that case we need an extra flash. Hence, modify the convention
for non-KVM guests such that, pflash0 will contain the M-mode FW
only when "-bios none" option is used. Otherwise, pflash0 will contain
the S-mode payload FW. This enables both pflash instances available
for EDK2 use.

When KVM is enabled, pflash0 is always assumed to contain the
S-mode payload firmware only.

Example usage:
1) pflash0 containing M-mode FW
qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
or
qemu-system-riscv64 -bios none \
-drive file=<mmode_fw>,if=pflash,format=raw,unit=0 -machine virt

2) pflash0 containing S-mode payload like EDK2
qemu-system-riscv64 -pflash <smode_fw_code> -pflash <smode_vars> -machine  virt
or
qemu-system-riscv64 -bios <opensbi_fw> \
-pflash <smode_fw_code> \
-pflash <smode_vars> \
-machine  virt
or
qemu-system-riscv64 -bios <opensbi_fw> \
-drive file=<smode_fw_code>,if=pflash,format=raw,unit=0,readonly=on \
-drive file=<smode_fw_vars>,if=pflash,format=raw,unit=1 \
-machine virt

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Tested-by: Andrea Bolognani <abologna@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 53 ++++++++++++++++++++-----------------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4e3efbee16..3e5dc649c3 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1245,7 +1245,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
     target_ulong firmware_end_addr, kernel_start_addr;
     const char *firmware_name = riscv_default_firmware_name(&s->soc[0]);
     uint32_t fdt_load_addr;
-    uint64_t kernel_entry;
+    uint64_t kernel_entry = 0;
 
     /*
      * Only direct boot kernel is currently supported for KVM VM,
@@ -1266,42 +1266,31 @@ static void virt_machine_done(Notifier *notifier, void *data)
     firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
                                                      start_addr, NULL);
 
-    if (drive_get(IF_PFLASH, 0, 1)) {
-        /*
-         * S-mode FW like EDK2 will be kept in second plash (unit 1).
-         * When both kernel, initrd and pflash options are provided in the
-         * command line, the kernel and initrd will be copied to the fw_cfg
-         * table and opensbi will jump to the flash address which is the
-         * entry point of S-mode FW. It is the job of the S-mode FW to load
-         * the kernel and initrd using fw_cfg table.
-         *
-         * If only pflash is given but not -kernel, then it is the job of
-         * of the S-mode firmware to locate and load the kernel.
-         * In either case, the next_addr for opensbi will be the flash address.
-         */
-        riscv_setup_firmware_boot(machine);
-        kernel_entry = virt_memmap[VIRT_FLASH].base +
-                       virt_memmap[VIRT_FLASH].size / 2;
-    } else if (machine->kernel_filename) {
+    if (drive_get(IF_PFLASH, 0, 0)) {
+        if (machine->firmware && !strcmp(machine->firmware, "none") &&
+            !kvm_enabled()) {
+            /*
+             * Pflash was supplied but bios is none and not KVM guest,
+             * let's overwrite the address we jump to after reset to
+             * the base of the flash.
+             */
+            start_addr = virt_memmap[VIRT_FLASH].base;
+        } else {
+            /*
+             * Pflash was supplied but either KVM guest or bios is not none.
+             * In this case, base of the flash would contain S-mode payload.
+             */
+            riscv_setup_firmware_boot(machine);
+            kernel_entry = virt_memmap[VIRT_FLASH].base;
+        }
+    }
+
+    if (machine->kernel_filename && !kernel_entry) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
         kernel_entry = riscv_load_kernel(machine, &s->soc[0],
                                          kernel_start_addr, true, NULL);
-    } else {
-       /*
-        * If dynamic firmware is used, it doesn't know where is the next mode
-        * if kernel argument is not set.
-        */
-        kernel_entry = 0;
-    }
-
-    if (drive_get(IF_PFLASH, 0, 0)) {
-        /*
-         * Pflash was supplied, let's overwrite the address we jump to after
-         * reset to the base of the flash.
-         */
-        start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
     fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
-- 
2.34.1


