Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAxNz-0007A4-PW
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 13:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNx-00075s-Dq
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:12:09 -0500
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNu-0003h7-RB
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:12:08 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 x44-20020a05683040ac00b006707c74330eso11862458ott.10
 for <qemu-riscv@nongnu.org>; Thu, 29 Dec 2022 10:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+MI0oL0ZRJy2SABO5vwyh1bZOV/QqvaYE86B4zwgOwY=;
 b=OjgSEKTw8iTfhrwgF4iIbDgNBsJnK/+IHhh6cnKFaI23oKS4ewEyJkCLkl5P8T90ef
 JM+fIcu7iGjjhqAYhaOCqrfmghc3f29FFMzaj2N5AdZtvQ3VypCZLMg4U5UJpyo0oBnk
 SMunH/o3jFLxP0IT1VjjXValLiq+iBUBs1WLWYwAv5u8kiIkak2U4ul6ptpGF8wVEBAP
 cGQnoi/CjVRkC/xNfsrR4SkRJy0OW4MT63+JHmuSaWx4inDXOh+qz+2cskRB4zkQFd17
 ta/6pUda23isXlCBNG6UQyX4BVckQpHKF0k3UCx740KGc2b0JLzQqiVrMUYC+vTJ7J0e
 1t2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+MI0oL0ZRJy2SABO5vwyh1bZOV/QqvaYE86B4zwgOwY=;
 b=WVSYLq4xJnmnorqb9oMgPO8BJREcraKI6RDTMF+suNZ9840RiW4mDZoOExNtO4KdiO
 I5mMqYDet57T4qoERvtQ3XjSGatPtxDt+/ZdceudFuh1qSgxQ/VV84tgEtOrP21j0uvf
 kQAu/aeYvynyfMkS+J7XZ0VCQp+tnhJ+wJdMjwJ/iQAFQ6VX/YkKS+IVFdc/5U8q98HY
 0mU24Hy+5Owi5LLXfCZaliyVBCjYPHnc9jFJdgIRRUHWVIoxI0wA3A/Pt3jRj+VQoHTV
 WqXTClEBrgzBwraY2NemTPiJTZZSbKfBu3l4O20EDoovGPLlQj3xfUVpDbZnrCMhtWAE
 Ms2Q==
X-Gm-Message-State: AFqh2koVJb9zfCbl8KIRrbqtZiOiHKxisQZMkuIzA4UFp1mWEgY75xvR
 X/fpXIOICIIdEZgKYODpge0l6w==
X-Google-Smtp-Source: AMrXdXutgi9sZu2VQCx2T7/hzJbm4cLM1GFmy2oIcZRc7JTZZhHU+7fMI7cnVK3VgVFcMa6LvPYQjA==
X-Received: by 2002:a9d:61d2:0:b0:66e:a0ea:674c with SMTP id
 h18-20020a9d61d2000000b0066ea0ea674cmr15020465otk.1.1672337524470; 
 Thu, 29 Dec 2022 10:12:04 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056830139400b0066db09fb1b5sm9267205otq.66.2022.12.29.10.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 10:12:04 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v4 07/11] hw/riscv: write bootargs 'chosen' FDT after
 riscv_load_kernel()
Date: Thu, 29 Dec 2022 15:11:31 -0300
Message-Id: <20221229181135.270661-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229181135.270661-1-dbarboza@ventanamicro.com>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x336.google.com
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
X-List-Received-Date: Thu, 29 Dec 2022 18:12:10 -0000

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
index 5668fe0694..60e2912be5 100644
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
@@ -319,6 +315,11 @@ static void spike_board_init(MachineState *machine)
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


