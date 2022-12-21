Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p83kY-00086q-R5
	for mharc-qemu-riscv@gnu.org; Wed, 21 Dec 2022 13:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kX-00084w-4F
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:29 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kV-0007qV-9p
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:28 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-14449b7814bso20154281fac.3
 for <qemu-riscv@nongnu.org>; Wed, 21 Dec 2022 10:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lZoBmiJkkWhRinFmahJoiZPpwFUsq8AacgVvO+2kw0k=;
 b=D8jkteHKZcZO7/7rlSOCuelx9sayuD4tvhC14Yvmpqk1hSkxqyKqCEWsiEzr6QwG4M
 oXGdxNgJJM1FRXk/rdKnJfO4kO52s43PDfx280R3hSpWaCgb97/PMRZmcNC5//u6qYI5
 0ICGEtu+qdybpZPQVJz95NePmrzKRdLE0fK8xBpidh1AVFHD8kGqeDuaTT2HUjMiraWL
 NWjSc5qv6mDXM1OiEs85dAQF+f06+OmTf4E33s7xxGq8NhEcLWAE/VOl+EPU48anZlLh
 W3R9U52ovD1rKks5pmDqI+dsTMHagJgKVh/Utv41kMH4p276hqoVSbrsgW6Kk9ZfYJPy
 /65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lZoBmiJkkWhRinFmahJoiZPpwFUsq8AacgVvO+2kw0k=;
 b=xDpfulrKs5wTzHLU2HnJ2cEvlUGf7DuiRZ01bjmm1uJhMcUAJVVOybRp8ldLsrcJgG
 Sm/owLc1qRyK7/gAasQpMSQ4n+fz+M2GKRTXtKosdr5smX8atsgufpofuq//sH5DzVml
 yifCagDlHPQ6MES9gitvJ/IpoC68o3JaLJLPSDOJWxgk3TiHT5IRngikB9LNuf6KRfZu
 c+LrBo+nOeXzVCxN7ne2kIN7531UMlge/LBDf7mwwpulp3ZpQ4Agk2ZaVj/Hw3HJQxtY
 uBUYnOaJIVg+Y/klty6qffDPHuDEtX+vGl9WWdDsTFJJbGOzxKSd5yYDrbS8yLjWECe1
 3cCQ==
X-Gm-Message-State: AFqh2kqrECgtWqaRJOK7ie3WDmx77lk3poCylaiz2cfs8rdTVoVuSNmp
 kpcy1AUbm5zyygth/Rru1NkvIA==
X-Google-Smtp-Source: AMrXdXsEZLLL8TsI/4+Rhx1NeV5ZeMmuZSvbsbhT0HGY5wHOWyxUzoNShQ46V1VBmcBjBHKIpsWVJA==
X-Received: by 2002:a05:6870:aa86:b0:14b:ffbe:51d5 with SMTP id
 gr6-20020a056870aa8600b0014bffbe51d5mr7464747oab.5.1671647005859; 
 Wed, 21 Dec 2022 10:23:25 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:25 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 05/15] hw/riscv/boot.c: introduce riscv_default_firmware_name()
Date: Wed, 21 Dec 2022 15:22:50 -0300
Message-Id: <20221221182300.307900-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 21 Dec 2022 18:23:29 -0000

Some boards are duplicating the 'riscv_find_and_load_firmware' call
because the 32 and 64 bits images have different names. Create
a function to handle this detail instead of hardcoding it in the boards.

Ideally we would bake this logic inside riscv_find_and_load_firmware(),
or even create a riscv_load_default_firmware(), but at this moment we
cannot infer whether the machine is running 32 or 64 bits without
accessing RISCVHartArrayState, which in turn can't be accessed via the
common code from boot.c. In the end we would exchange 'firmware_name'
for a flag with riscv_is_32bit(), which isn't much better than what we
already have today.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c         |  9 +++++++++
 hw/riscv/sifive_u.c     | 11 ++++-------
 hw/riscv/spike.c        | 14 +++++---------
 hw/riscv/virt.c         | 10 +++-------
 include/hw/riscv/boot.h |  1 +
 5 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 7361d5c0d8..e1a544b1d9 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -75,6 +75,15 @@ target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
     }
 }
 
+const char *riscv_default_firmware_name(RISCVHartArrayState *harts)
+{
+    if (riscv_is_32bit(harts)) {
+        return RISCV32_BIOS_BIN;
+    }
+
+    return RISCV64_BIOS_BIN;
+}
+
 static char *riscv_find_firmware(const char *firmware_filename)
 {
     char *filename;
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 9cf66957ab..ddceb750ea 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -533,6 +533,7 @@ static void sifive_u_machine_init(MachineState *machine)
     MemoryRegion *flash0 = g_new(MemoryRegion, 1);
     target_ulong start_addr = memmap[SIFIVE_U_DEV_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
+    const char *firmware_name;
     uint32_t start_addr_hi32 = 0x00000000;
     int i;
     uint32_t fdt_load_addr;
@@ -595,13 +596,9 @@ static void sifive_u_machine_init(MachineState *machine)
         break;
     }
 
-    if (riscv_is_32bit(&s->soc.u_cpus)) {
-        firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    RISCV32_BIOS_BIN, start_addr, NULL);
-    } else {
-        firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    RISCV64_BIOS_BIN, start_addr, NULL);
-    }
+    firmware_name = riscv_default_firmware_name(&s->soc.u_cpus);
+    firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
+                                                     start_addr, NULL);
 
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index d96f013e2e..43341c20b6 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -191,6 +191,7 @@ static void spike_board_init(MachineState *machine)
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     target_ulong firmware_end_addr, kernel_start_addr;
+    const char *firmware_name;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
     char *soc_name;
@@ -261,15 +262,10 @@ static void spike_board_init(MachineState *machine)
      * keeping ELF files here was intentional because BIN files don't work
      * for the Spike machine as HTIF emulation depends on ELF parsing.
      */
-    if (riscv_is_32bit(&s->soc[0])) {
-        firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    RISCV32_BIOS_BIN, memmap[SPIKE_DRAM].base,
-                                    htif_symbol_callback);
-    } else {
-        firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    RISCV64_BIOS_BIN, memmap[SPIKE_DRAM].base,
-                                    htif_symbol_callback);
-    }
+    firmware_name = riscv_default_firmware_name(&s->soc[0]);
+    firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
+                                                     memmap[SPIKE_DRAM].base,
+                                                     htif_symbol_callback);
 
     /* Load kernel */
     if (machine->kernel_filename) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 94ff2a1584..408f7a2256 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1237,6 +1237,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
     MachineState *machine = MACHINE(s);
     target_ulong start_addr = memmap[VIRT_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
+    const char *firmware_name = riscv_default_firmware_name(&s->soc[0]);
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
 
@@ -1256,13 +1257,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
         }
     }
 
-    if (riscv_is_32bit(&s->soc[0])) {
-        firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    RISCV32_BIOS_BIN, start_addr, NULL);
-    } else {
-        firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    RISCV64_BIOS_BIN, start_addr, NULL);
-    }
+    firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
+                                                     start_addr, NULL);
 
     /*
      * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index c03e4e74c5..60cf320c88 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -37,6 +37,7 @@ target_ulong riscv_find_and_load_firmware(MachineState *machine,
                                           const char *default_machine_firmware,
                                           hwaddr firmware_load_addr,
                                           symbol_fn_t sym_cb);
+const char *riscv_default_firmware_name(RISCVHartArrayState *harts);
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
-- 
2.38.1


