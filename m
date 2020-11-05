Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kajQp-0004FS-Iu
	for mharc-qemu-riscv@gnu.org; Thu, 05 Nov 2020 12:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kajQn-0004An-8g
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2020 12:52:17 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kajQh-0004pH-P2
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2020 12:52:16 -0500
Received: by mail-wm1-x343.google.com with SMTP id c16so2458713wmd.2
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2020 09:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Nz9MSyQVsT6uTf5IolftpS8uipcBc27d6vn+zZBZfo=;
 b=jJV7REPO8q4WmM1H5lmQh9/AM0xYpocZfjtmflTPhdHgB3yHf/m4EbvsaMwERdNQr5
 2HEAZOrQbvaRGUqOHJE87g9Tw90NVrWfeHZa8PmM4gTqHSQ/nIuWtroFrSmCoFUoCdaB
 yohJm/MTa4NCbM5nBR15YI8/5utt/Zj+og8qY7mdXgYjpV5x+d59xT8nzm3Ghavy01B4
 Eves61Q2M6c6MDOv/5pLHjVNtRlkbsa0ixd7ofY30vdMNMGXb1l7XH8NEmxuoAq8wHk4
 Qme+lTnpnqIkOFTSXd/fRbjl7kYARcHb9JUsGvOUP9ZEzXgN7mIOI7SyNoibzLX/q4+B
 JQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Nz9MSyQVsT6uTf5IolftpS8uipcBc27d6vn+zZBZfo=;
 b=HZnS6I70+z2Mjj7DOD/iEvb3TvXfha9BIbypQ6/BF/0U4bnWbzVno3YVWg6Ce4IUKA
 W7QE4kr57yXjCKofT1EQM9dDyc+M/ePlYvVMdE2BX4YUagmchp3gR76NQPzujrYDsu18
 58GylIc4h96vRbrTbzVkcaQjrk5ugS9qSnkNflpvRqIVRY/A9hxg+htoB8BgvB9VodZ0
 SmnrXOAVOT7cxmWLVWNTzKfY2+pEkFPX3Ef2wHV9DE0wgq5PwSzSm1uDcXhC4Fw3HNHS
 aROztTjctprkj1hpxLYEOCP/fObJTjGx3EVEXsNlm1WiAjdYtryTYbYGU9mbrS8X2GW8
 P+0w==
X-Gm-Message-State: AOAM5312md3zPxR9rh12p9WbwszUt3xAyNRuX2uPdy1ABEoo2lcG5ZYp
 AHxQ1ksU+WOZcKxxBiz6B1gYoA==
X-Google-Smtp-Source: ABdhPJxNAznyHZH2z8txC5rGzDF+wYG6dyDEXUtddVc/PLnSS/9cuaXMg7iGYfQAR4ipPU8MhonmtA==
X-Received: by 2002:a05:600c:2110:: with SMTP id
 u16mr3997847wml.4.1604598721029; 
 Thu, 05 Nov 2020 09:52:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o184sm3590398wmo.37.2020.11.05.09.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 09:51:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E0D441FF8C;
 Thu,  5 Nov 2020 17:51:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: julien@xen.org, stefano.stabellini@linaro.org,
 stefano.stabellini@xilinx.com, masami.hiramatsu@linaro.org,
 takahiro.akashi@linaro.org, andre.przywara@arm.com,
 stratos-dev@op-lists.linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [RFC PATCH 02/15] hw/riscv: migrate fdt field to generic MachineState
Date: Thu,  5 Nov 2020 17:51:40 +0000
Message-Id: <20201105175153.30489-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201105175153.30489-1-alex.bennee@linaro.org>
References: <20201105175153.30489-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 05 Nov 2020 17:52:17 -0000

This is a mechanical change to make the fdt available through
MachineState.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20201021170842.25762-3-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/riscv/virt.h |  1 -
 hw/riscv/virt.c         | 20 ++++++++++----------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index b4ed9a32eb..6505ae8d23 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -41,7 +41,6 @@ struct RISCVVirtState {
     DeviceState *plic[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
 
-    void *fdt;
     int fdt_size;
 };
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 25cea7aa67..377400e02a 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -197,14 +197,14 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
 
     dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
     if (dtb_filename) {
-        fdt = s->fdt = load_device_tree(dtb_filename, &s->fdt_size);
+        fdt = mc->fdt = load_device_tree(dtb_filename, &s->fdt_size);
         if (!fdt) {
             error_report("load_device_tree() failed");
             exit(1);
         }
         goto update_bootargs;
     } else {
-        fdt = s->fdt = create_device_tree(&s->fdt_size);
+        fdt = mc->fdt = create_device_tree(&s->fdt_size);
         if (!fdt) {
             error_report("create_device_tree() failed");
             exit(1);
@@ -442,12 +442,12 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     g_free(name);
 
     name = g_strdup_printf("/soc/flash@%" PRIx64, flashbase);
-    qemu_fdt_add_subnode(s->fdt, name);
-    qemu_fdt_setprop_string(s->fdt, name, "compatible", "cfi-flash");
-    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg",
                                  2, flashbase, 2, flashsize,
                                  2, flashbase + flashsize, 2, flashsize);
-    qemu_fdt_setprop_cell(s->fdt, name, "bank-width", 4);
+    qemu_fdt_setprop_cell(mc->fdt, name, "bank-width", 4);
     g_free(name);
 
 update_bootargs:
@@ -631,9 +631,9 @@ static void virt_machine_init(MachineState *machine)
             hwaddr end = riscv_load_initrd(machine->initrd_filename,
                                            machine->ram_size, kernel_entry,
                                            &start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen",
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
                                   "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
                                   end);
         }
     } else {
@@ -654,11 +654,11 @@ static void virt_machine_init(MachineState *machine)
 
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
-                                   machine->ram_size, s->fdt);
+                                   machine->ram_size, machine->fdt);
     /* load the reset vector */
     riscv_setup_rom_reset_vec(start_addr, virt_memmap[VIRT_MROM].base,
                               virt_memmap[VIRT_MROM].size, kernel_entry,
-                              fdt_load_addr, s->fdt);
+                              fdt_load_addr, machine->fdt);
 
     /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
-- 
2.20.1


