Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAWZM-0004oI-Pp
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 08:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZI-0004kq-QE
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:34:04 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZH-0008Aq-2X
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:34:04 -0500
Received: by mail-oi1-x231.google.com with SMTP id d127so13465184oif.12
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 05:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GeCiC3GKUs9WcRKhA9RfO9im1F+/KYIPp7kBcBoEaXc=;
 b=SIXZXOLsTJgzvIJHJeMgL89skTwcg7Jw76EInMaVYlXeaeu60Tjq+SZTd5zHmmYPaK
 SHnGLXhENZE+jDOXr80BHU80Svuxk0eSWozel7R2BfUFztlC93W5/ZarVAZR5zhhYc5V
 4ginaipoFyVjuqIIscrnk0+Fihnl6xTf4EW9ePNq6XZ7jqYqzyJYKR7qI+Q/a3NTcCJ0
 WUn5zsDbl7PuHbZwZM+YxvdzrRCQzfBa6NlDI+dKakbrYK+yBMRW+dvteAscnqmAPEt2
 x4EOpHyiTzEJJcXk5cpkM+K/mSUG53u3NPbZgUFOdVDXspZr9h8qSkdSWjtuPjm2kDil
 ekoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GeCiC3GKUs9WcRKhA9RfO9im1F+/KYIPp7kBcBoEaXc=;
 b=ceSQwO8kjkbKhiPTFvhiCjb+d7uTb4fsNWPpcysP8/SmGfX0FliCdXwZslowZv7VVp
 +A5MnABpwmTI+XHzDG2kDBfCYovJ+WHfYNJjE1+YaxGb5S4rF55zkscTK9H82JLUWX4B
 NAz3/XvLgsTEz+vuGcDVqAYKF03I56FTbwfMwUYNU2Rv5qlSJ3LmEd6OFmNs/mtrz88J
 CU39Ms9wNSfl5rTiA1ELGxSbmvFAOoBq3DlHjF3S6a7BtY8xr+8GeSG2WoaMI3StDlw/
 g6aav/067f/FG9k9pHMW/TrM/DwbAQbYvuqzmaFLamvqMFWxQvN7KN/gSJ/XPoH3cU6/
 zrnw==
X-Gm-Message-State: AFqh2konu+fa1jPC+3WcapopasOPdjvRHoQJwlpDzY1dhJBDK04/DLwt
 85LnG9aCWKE6AluNUDXfgutTXQ==
X-Google-Smtp-Source: AMrXdXuEnRVmNE3ZBPjyLP6dckRRisqCSzYFHXCss4lkVGhOmby+CVSpQKj/Q8lRWSrByWx5ppAf1Q==
X-Received: by 2002:a05:6808:1a03:b0:35e:d61b:fdb7 with SMTP id
 bk3-20020a0568081a0300b0035ed61bfdb7mr13581231oib.2.1672234442318; 
 Wed, 28 Dec 2022 05:34:02 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 bl22-20020a056808309600b0035e7d07bf9dsm6991626oib.16.2022.12.28.05.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 05:34:01 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v3 06/10] hw/riscv: write bootargs 'chosen' FDT after
 riscv_load_kernel()
Date: Wed, 28 Dec 2022 10:33:32 -0300
Message-Id: <20221228133336.197467-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228133336.197467-1-dbarboza@ventanamicro.com>
References: <20221228133336.197467-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 13:34:05 -0000

The sifive_u, spike and virt machines are writing the 'bootargs' FDT
node during their respective create_fdt().

Given that bootargs is written only when '-append' is used, and this
option is only allowed with the '-kernel' option, which in turn is
already being check before executing riscv_load_kernel(), write
'bootargs' in the same code path as riscv_load_kernel().

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/sifive_u.c | 11 +++++------
 hw/riscv/spike.c    |  9 +++++----
 hw/riscv/virt.c     | 11 +++++------
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 37f5087172..3e6df87b5b 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -117,7 +117,6 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
             error_report("load_device_tree() failed");
             exit(1);
         }
-        goto update_bootargs;
     } else {
         fdt = ms->fdt = create_device_tree(&fdt_size);
         if (!fdt) {
@@ -510,11 +509,6 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_string(fdt, "/aliases", "serial0", nodename);
 
     g_free(nodename);
-
-update_bootargs:
-    if (cmdline && *cmdline) {
-        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
-    }
 }
 
 static void sifive_u_machine_reset(void *opaque, int n, int level)
@@ -611,6 +605,11 @@ static void sifive_u_machine_init(MachineState *machine)
             riscv_load_initrd(machine->initrd_filename, machine->ram_size,
                               kernel_entry, machine->fdt);
         }
+
+        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
+            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
+                                    machine->kernel_cmdline);
+        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 360bf83564..775f910a50 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -179,10 +179,6 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/chosen");
     qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
-
-    if (cmdline && *cmdline) {
-        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
-    }
 }
 
 static bool spike_test_elf_image(char *filename)
@@ -314,6 +310,11 @@ static void spike_board_init(MachineState *machine)
             riscv_load_initrd(machine->initrd_filename, machine->ram_size,
                               kernel_entry, machine->fdt);
         }
+
+        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
+            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
+                                    machine->kernel_cmdline);
+        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5967b136b4..6c946b6def 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1012,7 +1012,6 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
             error_report("load_device_tree() failed");
             exit(1);
         }
-        goto update_bootargs;
     } else {
         mc->fdt = create_device_tree(&s->fdt_size);
         if (!mc->fdt) {
@@ -1050,11 +1049,6 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     create_fdt_fw_cfg(s, memmap);
     create_fdt_pmu(s);
 
-update_bootargs:
-    if (cmdline && *cmdline) {
-        qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline);
-    }
-
     /* Pass seed to RNG */
     qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
     qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
@@ -1294,6 +1288,11 @@ static void virt_machine_done(Notifier *notifier, void *data)
             riscv_load_initrd(machine->initrd_filename, machine->ram_size,
                               kernel_entry, machine->fdt);
         }
+
+        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
+            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
+                                    machine->kernel_cmdline);
+        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
-- 
2.38.1


