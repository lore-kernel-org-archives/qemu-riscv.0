Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAVm7-0005FQ-6v
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 07:43:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVm4-0005As-A6
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 07:43:12 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVm2-0007t8-Fv
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 07:43:11 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 j16-20020a056830271000b0067202045ee9so9782095otu.7
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 04:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GeCiC3GKUs9WcRKhA9RfO9im1F+/KYIPp7kBcBoEaXc=;
 b=jJr9p6bSa8CfxsxaeaW0qj8cGXD+ITdB+3DyigAEGyKfLX6y8HPKiBYl3vblaae10j
 IOJqC/ZIXS0ZuZcFgc9boubz7RbN5XnvJOYLE5tDEmvy6lpECtanCnjCwt4rUVSwwH2q
 NgneVQJq9IT+3Ozl+HewkZZGzDgCATC1fU+hkrOwjLx0JkHYvDzzF6lsqZ4XNtNrfeCx
 DQkW44wGALSApkFOEFAjcj/QMVTHt6tyBsXbJ7P1aGggeN6bATjA5dnx3ytiNqevrRZQ
 ZXZFCwyAV8U7XgQHM58r++9Ty7mIm04eO30DyOE5I+Ch4v1DYHCQWNWD30Ve9OPuVO8x
 55mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GeCiC3GKUs9WcRKhA9RfO9im1F+/KYIPp7kBcBoEaXc=;
 b=qQ/Rf+mXgrKqfIXwownseAegH1Zi8PylwmNjG8oVs86frrjSzhFl3x8Cl6CzxXnMMA
 1SYRD3k9Mk+fzxTQ+P33y8JLcSTCExsCwjgpC5q64bRez2/tOKBE/S6UWsFBdGpzpejY
 3LgE+ucndJAOQSNXOh+ToVv69JrQL0sZmPL9X3amvn5Djq2lM/ykgwWYors1kJAZdjLS
 5kHfU4uq/2TLm0OiWXn1IUt/X+CxrfyzwmtrtbjfM2aPWDFIw3SgfZE7YSU8OGH5gUWF
 FWk54Ira5wD+7H1Huf+XFM0cC08yMbIosiBldrxywKX/1YGlvnwqIU7BNYWhOdscYr4e
 IDAw==
X-Gm-Message-State: AFqh2kpMMcpanmryc4Uq0TdvWmieJXdZQ7eRo3H/sDi0NDVXnWkc43d6
 25VhI+tbXFueasMytjv560l1IQ==
X-Google-Smtp-Source: AMrXdXt8siNEqVHU+iryey13q21RhcGLtaEQSSPCQqCBza+Ijj76Lp4WY7uEy88EskwjoOYndwHkww==
X-Received: by 2002:a9d:845:0:b0:670:832d:e840 with SMTP id
 63-20020a9d0845000000b00670832de840mr13501202oty.20.1672231389361; 
 Wed, 28 Dec 2022 04:43:09 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 cj5-20020a056830640500b0066f09567827sm7689333otb.78.2022.12.28.04.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 04:43:08 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v2 06/10] hw/riscv: write bootargs 'chosen' FDT after
 riscv_load_kernel()
Date: Wed, 28 Dec 2022 09:42:38 -0300
Message-Id: <20221228124242.184784-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228124242.184784-1-dbarboza@ventanamicro.com>
References: <20221228124242.184784-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x333.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 12:43:12 -0000

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


