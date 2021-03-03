Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHVQY-0008NC-Dt
	for mharc-qemu-riscv@gnu.org; Wed, 03 Mar 2021 12:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHVQW-0008Mc-UD
 for qemu-riscv@nongnu.org; Wed, 03 Mar 2021 12:36:48 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHVQU-0002nj-EU
 for qemu-riscv@nongnu.org; Wed, 03 Mar 2021 12:36:48 -0500
Received: by mail-wr1-x434.google.com with SMTP id e10so24359692wro.12
 for <qemu-riscv@nongnu.org>; Wed, 03 Mar 2021 09:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1mhDoxefyC/VVw7zUuqfiHo+BNITfl2gfYDxMgzesU4=;
 b=y8ZioLIGZvHKVdZXRlv1Zar1mcJF3BAo55XTeclyWG7L1Ra+fookeVnBv1QaxXwyMD
 3/tNFOUq9PlV7eQ+ejutHRg8QEXH8Wk/zTPau7KzdQACukH7fFZDs4AQ0sFK2epAtH9+
 aixZob2k3D61ulHEcxY+dJRI0xinFr9lNeIr35PfAc30pBrfH54QrNhwf89w013Nhr0f
 UDGgJ2pMGm0e+tSXuEj5wAOOAyz/bDgYSQ2A6DtSmWQBquJ0FduvnWFRsPQbjvDJcnFc
 3rQRTqczwqbcwKyUbVbhbhmnEIVMDcK/hLttLiJTnpGOLHl/UmzYsgIwbo2dF/qJZPPU
 sz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1mhDoxefyC/VVw7zUuqfiHo+BNITfl2gfYDxMgzesU4=;
 b=jSnIAWecN21OeXKb/cuuHBiw0LD+/3APyY4W3YF8y3IuiGxQTCzjDAFfLD1DVsPtb8
 Mh/5+ek+LmXQ+O99m8nbhcdE7yZ6WRcLLYVuDs0jEcLFC8WuJwfyJ8Lf/zzpef8qlbSk
 3mpMKFfMZDgQSu10pkDYhSLSi4Gi1rm8aJSxfwYNyEHzkVnKJqlKXnP0WEDdA8wycGSi
 WUbu7QFjiy2KZCbLH6y0bK/KLyTXMB7vlE753NH2TxtJwpaapFMlFnj/YlBJoCTG/r+/
 UvUqI1D917fbLClGq9Ia+8pRwxRy9psGjTJTCP0nkUkrogHfYDt2o95diag4JR5b+Ihr
 hT7g==
X-Gm-Message-State: AOAM531NTHDyyntu7Uy/AKQXRg8f0YxbneuNEyVyKXXTfrGmY5eLpPME
 3xiW6bOyIMnsx3EPsDXsLE9xEvOSLmILiA==
X-Google-Smtp-Source: ABdhPJyZSxtpc4fcGhtaCFDlXly5Tpm9D42Lg+8EXzRiM52nT+tOhOeLiZfd9lGfRgooTwIG8FgzQg==
X-Received: by 2002:adf:c752:: with SMTP id b18mr5625686wrh.233.1614793004917; 
 Wed, 03 Mar 2021 09:36:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m2sm6316827wml.34.2021.03.03.09.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:36:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7DDF21FF8C;
 Wed,  3 Mar 2021 17:36:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: julien@xen.org, stefano.stabellini@linaro.org,
 stefano.stabellini@xilinx.com, andre.przywara@arm.com,
 stratos-dev@op-lists.linaro.org, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH  v3 2/7] hw/riscv: migrate fdt field to generic MachineState
Date: Wed,  3 Mar 2021 17:36:37 +0000
Message-Id: <20210303173642.3805-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303173642.3805-1-alex.bennee@linaro.org>
References: <20210303173642.3805-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 03 Mar 2021 17:36:49 -0000

This is a mechanical change to make the fdt available through
MachineState.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210211171945.18313-3-alex.bennee@linaro.org>
---
 include/hw/riscv/virt.h |  1 -
 hw/riscv/virt.c         | 20 ++++++++++----------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 84b7a3848f..632da52018 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -41,7 +41,6 @@ struct RISCVVirtState {
     DeviceState *plic[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
 
-    void *fdt;
     int fdt_size;
 };
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2299b3a6be..8d0ba72d78 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -189,14 +189,14 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
 
     if (mc->dtb) {
-        fdt = s->fdt = load_device_tree(mc->dtb, &s->fdt_size);
+        fdt = mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
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
@@ -434,12 +434,12 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
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
@@ -654,12 +654,12 @@ static void virt_machine_init(MachineState *machine)
 
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
-                                   machine->ram_size, s->fdt);
+                                   machine->ram_size, machine->fdt);
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
                               virt_memmap[VIRT_MROM].base,
                               virt_memmap[VIRT_MROM].size, kernel_entry,
-                              fdt_load_addr, s->fdt);
+                              fdt_load_addr, machine->fdt);
 
     /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
-- 
2.20.1


