Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAVm6-0005EJ-Jn
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 07:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVm1-000590-Jm
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 07:43:11 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVly-0007nK-WF
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 07:43:08 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 l8-20020a056830054800b006705fd35eceso9783797otb.12
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 04:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sHU/59DX/o1/r0pnySH91c8qF73tF/MEtRKTLilJBpE=;
 b=RlYH/2NCLfHG81R1T6IKhXOBGbCYR+4ULNBGYQFOCQwlHU4fUvJrNDfn5cEjKqoVxh
 iXwU3LScGkQYddKBOU59X3dmm6HHUP2dNpF/vEq7DMxusRKWl74lMszHIarro4aIsISc
 XAxAF4/neBVlGbG7iRh2zFUidJb4h2wUUrjP3ZTBOO+TwCO7wrxTHJGCe9JF+Ppz3Cfy
 J+QEdJobl64TsIXnSkuIO1APnBXu7AIxeEJ7ncrnCSqYhybGDtEGtk8tiBRD6M9TZ8Wm
 GxmbWpW5CbYdAUkqvSJgaGm8BzdOe8obaumdH6ePCH23H+MeWvlihhnjVO3/vdzHILT8
 ziWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sHU/59DX/o1/r0pnySH91c8qF73tF/MEtRKTLilJBpE=;
 b=ZBhIMrtGdJlt/C6K7r9zjpxWadz4HXrYKwxkNQtniQGdc9LC3YdtaUiYC+urgLashq
 GcLOKdvb5RIPQiUHFcLn7E09gBDgWoa8IRpooKwjXXKdiRZe9ngRwwgDKVgG3EyHa2EP
 ZF9n7c431qoFHUcqQyBmH4kxVnZ/L8JPk05xpJtTvm5uyrg49KVRqeLSycCU7N6pbTBL
 cDPxalTvcYlYo1KDXvM78LkYnjriBB0um0tkJApJqilBffkR2er9SgmPfm+4jC616X/A
 zhzVSLcgDBBwD5aWAN1Zvrlssrg+QjxmwMtWKe1BxG6CkoinwNyF3oVaC2OGe+V4Hfg3
 9zdw==
X-Gm-Message-State: AFqh2koIVZgcgL5LXKT49pIDL83fKIVKtAIS68U/PougiCuh+F8yrQ+m
 qQTbmZY8jSY9khIG41qCmE3Gvw==
X-Google-Smtp-Source: AMrXdXuJCJ2rJeEDbRvQKqGlxBqL0Kr56B5ygeepCgfgtY40eTt1A7vYA1H24Ec9GCAUHV59kVQF4w==
X-Received: by 2002:a9d:7997:0:b0:671:a87c:137c with SMTP id
 h23-20020a9d7997000000b00671a87c137cmr12081444otm.17.1672231380892; 
 Wed, 28 Dec 2022 04:43:00 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 cj5-20020a056830640500b0066f09567827sm7689333otb.78.2022.12.28.04.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 04:43:00 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v2 03/10] hw/riscv/sifive_u: use 'fdt' from MachineState
Date: Wed, 28 Dec 2022 09:42:35 -0300
Message-Id: <20221228124242.184784-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228124242.184784-1-dbarboza@ventanamicro.com>
References: <20221228124242.184784-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 12:43:11 -0000

The MachineState object provides a 'fdt' pointer that is already being
used by other RISC-V machines, and it's also used by the 'dumpdtb' QMP
command.

Remove the 'fdt' pointer from SiFiveUState and use MachineState::fdt
instead.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/sifive_u.c         | 15 ++++++---------
 include/hw/riscv/sifive_u.h |  3 ---
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index a58ddb36ac..ddceb750ea 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -98,7 +98,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     void *fdt;
-    int cpu;
+    int cpu, fdt_size;
     uint32_t *cells;
     char *nodename;
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
@@ -112,14 +112,14 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     };
 
     if (ms->dtb) {
-        fdt = s->fdt = load_device_tree(ms->dtb, &s->fdt_size);
+        fdt = ms->fdt = load_device_tree(ms->dtb, &fdt_size);
         if (!fdt) {
             error_report("load_device_tree() failed");
             exit(1);
         }
         goto update_bootargs;
     } else {
-        fdt = s->fdt = create_device_tree(&s->fdt_size);
+        fdt = ms->fdt = create_device_tree(&fdt_size);
         if (!fdt) {
             error_report("create_device_tree() failed");
             exit(1);
@@ -612,9 +612,9 @@ static void sifive_u_machine_init(MachineState *machine)
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
@@ -627,14 +627,11 @@ static void sifive_u_machine_init(MachineState *machine)
 
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SIFIVE_U_DEV_DRAM].base,
-                                   machine->ram_size, s->fdt);
+                                   machine->ram_size, machine->fdt);
     if (!riscv_is_32bit(&s->soc.u_cpus)) {
         start_addr_hi32 = (uint64_t)start_addr >> 32;
     }
 
-    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
-    machine->fdt = s->fdt;
-
     /* reset vector */
     uint32_t reset_vec[12] = {
         s->msel,                       /* MSEL pin state */
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index e680d61ece..4a8828a30e 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -67,9 +67,6 @@ typedef struct SiFiveUState {
     /*< public >*/
     SiFiveUSoCState soc;
 
-    void *fdt;
-    int fdt_size;
-
     bool start_in_flash;
     uint32_t msel;
     uint32_t serial;
-- 
2.38.1


