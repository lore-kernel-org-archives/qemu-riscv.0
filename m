Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p83kk-0008I2-Id
	for mharc-qemu-riscv@gnu.org; Wed, 21 Dec 2022 13:23:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83ki-0008GX-HA
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:40 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kg-0007t2-UI
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:40 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-144bd860fdbso20209026fac.0
 for <qemu-riscv@nongnu.org>; Wed, 21 Dec 2022 10:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UP1YWN/4d3fREVx8YBdysopigU4Qtv31qo0Og9ikRe4=;
 b=pZS0VV/n/art+54XSWvgOsfWojloytHat1IbY5P5lcJ6DPinBaaciRsgiagqbLxHPW
 IbUky+GEiCsADwp7K+9kakzykuM5IwB+L5QphY7qQ6rVRChb5U0TNJF0eKOSB9ywuOmq
 BLdSpza0w+zeLHTUUbuPQxoFbSmptyPHdVtUbkPbGNe7D45kBPEvByUlM0T/3twimvrh
 FPGKIkTa4srXPuo/Pu1VSuhrSTACXWiUnDjsOepTvJsDMAtwZzDWXwcrEwe5Viby3XwH
 vR16gVmmp6ARlaUi9rifVZFpnYpA+cO6eom3YggElPfJtQ4lHjJj0y5ME6Y4VeGblA5I
 AG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UP1YWN/4d3fREVx8YBdysopigU4Qtv31qo0Og9ikRe4=;
 b=My50juiOvirbEs38KtpQtwItpQeewLOXK9+gClgLIEJxgUIz4xfvex4AqglBfW+JaR
 EungCBZeDZ7pwaa/ebIlBy6NVgZpSIQNIbOJKZVXeH88GrCvA+p47k4UQ5tIV+6VhWY6
 RKmyz5jxtbJE9k5cpORRdChythkQ88wpUXkL6oJNVBo5zermejNsuuZtc/4noJcsh3b9
 or/XZvtbtQQii2zs4FmGtuacUDzwfVQlFtnM5priELTr42ih8tUexRf/pibqsMU66KC9
 dYcbtyhNR/3D0HqSdFoJHeTtVHTvWleRxt7ySZpmdmXlbEm0sHKBkq3grBx3X7zNcFpb
 NymQ==
X-Gm-Message-State: AFqh2kqxgFs/kqHnvvKyVeK123wKPH2WBa6bo3Za5Kvx1OPNT5n2+gHq
 Jh9Z/ljaPVxDE3gVJ8a79TjqJw==
X-Google-Smtp-Source: AMrXdXsjWQqlsq0TZfgkI4hknWiBYvn7lrhslSZ2VrUzMGI/qaOXVtFFJ4bWLHGnPuKso3zMML8/yg==
X-Received: by 2002:a05:6870:9e44:b0:144:fb4f:82a6 with SMTP id
 pt4-20020a0568709e4400b00144fb4f82a6mr1165516oab.56.1671647017935; 
 Wed, 21 Dec 2022 10:23:37 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:37 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 10/15] hw/riscv/boot.c: use MachineState in riscv_load_kernel()
Date: Wed, 21 Dec 2022 15:22:55 -0300
Message-Id: <20221221182300.307900-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
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
X-List-Received-Date: Wed, 21 Dec 2022 18:23:40 -0000

All callers are using kernel_filename as machine->kernel_filename.

This will also simplify the changes in riscv_load_kernel() that we're
going to do next.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 3 ++-
 hw/riscv/microchip_pfsoc.c | 3 +--
 hw/riscv/opentitan.c       | 3 +--
 hw/riscv/sifive_e.c        | 3 +--
 hw/riscv/sifive_u.c        | 3 +--
 hw/riscv/spike.c           | 3 +--
 hw/riscv/virt.c            | 3 +--
 include/hw/riscv/boot.h    | 2 +-
 8 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 4b46a9c51b..c79a08e6fe 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -160,10 +160,11 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
     exit(1);
 }
 
-target_ulong riscv_load_kernel(const char *kernel_filename,
+target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong kernel_start_addr,
                                symbol_fn_t sym_cb)
 {
+    const char *kernel_filename = machine->kernel_filename;
     uint64_t kernel_load_base, kernel_entry;
 
     /*
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 1e9b0a420e..82ae5e7023 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -629,8 +629,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr, NULL);
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 85ffdac5be..64d5d435b9 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -101,8 +101,7 @@ static void opentitan_board_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine->kernel_filename,
-                          memmap[IBEX_DEV_RAM].base, NULL);
+        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index d65d2fd869..3e3f4b0088 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -114,8 +114,7 @@ static void sifive_e_machine_init(MachineState *machine)
                           memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine->kernel_filename,
-                          memmap[SIFIVE_E_DEV_DTIM].base, NULL);
+        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL);
     }
 }
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index c40885ed5c..bac394c959 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -598,8 +598,7 @@ static void sifive_u_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr, NULL);
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 1eeee8f349..c9c69f92fc 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -272,8 +272,7 @@ static void spike_board_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr,
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
                                          htif_symbol_callback);
 
         if (machine->initrd_filename) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 02f1369843..c8e35f861e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1281,8 +1281,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr, NULL);
+        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index a2861c9431..2256b04986 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -41,7 +41,7 @@ const char *riscv_default_firmware_name(RISCVHartArrayState *harts);
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
-target_ulong riscv_load_kernel(const char *kernel_filename,
+target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
-- 
2.38.1


