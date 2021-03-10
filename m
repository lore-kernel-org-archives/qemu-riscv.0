Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lK1GO-0004ok-JR
	for mharc-qemu-riscv@gnu.org; Wed, 10 Mar 2021 11:00:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1GH-0004j0-NQ
 for qemu-riscv@nongnu.org; Wed, 10 Mar 2021 11:00:39 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:41110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1G5-0002nD-VA
 for qemu-riscv@nongnu.org; Wed, 10 Mar 2021 11:00:36 -0500
Received: by mail-lj1-x22c.google.com with SMTP id t9so26213922ljt.8
 for <qemu-riscv@nongnu.org>; Wed, 10 Mar 2021 08:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ViVWtZ3No3EwiuLvapp181B6jvA1Zl37fC61JHK5PU=;
 b=JBdEbffkez64Mc7m3WjWfI/it9TsTKd999OZ9tSVY383s8EVAMYZnKMIPHj9xsgKgl
 AJFaVZKdfIIC6E3SFvuMVG4ldIaalAm/U5Kb1Ia7PWnGWync9DPAQ7aEwfU07YSAuF8n
 L7TMkrKMbM+uNFtnr42uNAWbA0EXSLC7uhGi72NhH4M6Uqvt7z3NL3j9mO++woWJfKRS
 oMC4GKNn/nXZH7PS8sPjir68p6KF8PH5chZT5K3nGMVaMuZNglmePzZ2hx6/h0d6YQFk
 s5eYmv59mOpoCgPlOQ51NcYaP3p9t6ybc80YlpI0t9dSu2FAUQ2kytPnakEFV4ZaTbSj
 8Xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ViVWtZ3No3EwiuLvapp181B6jvA1Zl37fC61JHK5PU=;
 b=fMSTTsbs85ALlw4fnFykVE5UeRMD1tXibzcDBNO264LWh2c/I7ShTsC+ltnDJ8UCKi
 KVODdsqnpqZR/5vm8jnnEp68fD0NqHZM0eP6w7rSQcJvA8/Cs3JfJ7bprB7mV2FvtYJ8
 EVUccQPlCN/gnUrY4bGgturnCYjjke2Wn2gApG3Zpb5Pr/osQkn+7726dihETGtOIBGz
 VDXOMPE6MvYexKuX9ByN0OnVY3Q6hnzsnByrEm2Zbdrp2sgErwYymWKAUPgxFNMN8AHV
 3Qp3vjH3rHKZXrdA30dWTimIyTa09IDeE4bCDldAgJGhfgzL5hB0fauTUwmgeihxGw61
 25Pw==
X-Gm-Message-State: AOAM531IX+zMvqzYEJDAqofS1VzcZcs4P2MSlhNIwaPC7XzZQV7SoPv/
 wFwZoX+TWD8wF0ewnFvAXkomrtcwQhGEZw==
X-Google-Smtp-Source: ABdhPJy1PksEbV5y9RV2XHc8TIEi0IUuns3AgN5smAPnFMtn/Ed5YXRw2tgeDDYr29wZOhzHMdLN2w==
X-Received: by 2002:a05:6402:3550:: with SMTP id
 f16mr4105497edd.134.1615392013718; 
 Wed, 10 Mar 2021 08:00:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id qo25sm2825463ejb.93.2021.03.10.08.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:00:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 54F021FF96;
 Wed, 10 Mar 2021 16:00:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PULL v2 08/15] hw/riscv: migrate fdt field to generic MachineState
Date: Wed, 10 Mar 2021 15:59:55 +0000
Message-Id: <20210310160002.11659-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310160002.11659-1-alex.bennee@linaro.org>
References: <20210310160002.11659-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x22c.google.com
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
X-List-Received-Date: Wed, 10 Mar 2021 16:00:42 -0000

This is a mechanical change to make the fdt available through
MachineState.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210303173642.3805-3-alex.bennee@linaro.org>

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
index 4f0c2fbca0..0b39101a5e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -195,14 +195,14 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
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
@@ -444,12 +444,12 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
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
@@ -667,9 +667,9 @@ static void virt_machine_init(MachineState *machine)
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
@@ -690,12 +690,12 @@ static void virt_machine_init(MachineState *machine)
 
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


