Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAxNl-0006wK-KT
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 13:11:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNk-0006u7-2a
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:11:56 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNi-0003c0-Ea
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:11:55 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 r2-20020a9d7cc2000000b006718a7f7fbaso11872880otn.2
 for <qemu-riscv@nongnu.org>; Thu, 29 Dec 2022 10:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sHU/59DX/o1/r0pnySH91c8qF73tF/MEtRKTLilJBpE=;
 b=OxlMGRtfDDu92hLHRbIzFqc2zAAdqLeiQMPKsEXZMyEuPo67lMQDM0jV2poh7DJ/N2
 TUtsxqNhIUBaJI5dWemQbA4cL6udqTbjIimU2sP4cDTU+4/oeIeANFxUHL96cJPR5K41
 I1VPdwJLb1YZ/RpGfifNHTF1ZWCtMP30/vad8OJX/QuZvCh5c+jElOb95TJkhWVYwEGn
 uvjF28QPtSAB3VgoC4+Ed21wd4RKoek+jktAV0YL2FF4sKlvQfPQdAl4rUaK3E7I120m
 SRQN+Vl5pAE/RCuxPKPXMxHSGbtmTo3Ogc2Q30wguBl1kflOv2IF5u3KBzzzsWDK0gAR
 VWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sHU/59DX/o1/r0pnySH91c8qF73tF/MEtRKTLilJBpE=;
 b=zVyi9fcyVxs5EfwBww0a3d9fmoRbkmUWzEL4VvyXtfw55CBgEXm/6Y4uQbCvfQpCx/
 x0Q9kc0l/6rbM7D5KwMekBnxjtA8020QoQ4rBWsHDTRqzV9+QgIpvq1vGEVdyKi7Gf+k
 OasBqa03Uhr3gP3dCOCH7+ML2QcVqVXt9X505H4WSeq4UXdbjrr2VDGUgKvCz4mo8iUq
 r9qDM9pnk9Mewp0kAZd9+/DleN9Km4Llcj9ogZtlHDyzVEXcA1ZZ4QwOIMPFWnbt30Dc
 9yC8ggtZFIk2rtZ3Lqd83axlZvqBcKODtjQx+Yh/mHV+OEnf0tpmKyv0WBI2WEWnW7mU
 YEbw==
X-Gm-Message-State: AFqh2koWkaVnzKRrljFU9yG1gGYb97ZlWmIn9u0qBL3UJFPx2rZRXu4Z
 GvBSz8uJ2PSx1dc0EN1bEUaqe4wjfEG6uP0c
X-Google-Smtp-Source: AMrXdXsZ584Uciol/KgkFvWhimEG9hP2EbmAqZxNVj5CkIlrjzacfavSqPOh+DChnzEW7gsYKZ8FHg==
X-Received: by 2002:a9d:6f90:0:b0:66c:5842:637c with SMTP id
 h16-20020a9d6f90000000b0066c5842637cmr23895569otq.21.1672337513244; 
 Thu, 29 Dec 2022 10:11:53 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056830139400b0066db09fb1b5sm9267205otq.66.2022.12.29.10.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 10:11:52 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v4 03/11] hw/riscv/sifive_u: use 'fdt' from MachineState
Date: Thu, 29 Dec 2022 15:11:27 -0300
Message-Id: <20221229181135.270661-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229181135.270661-1-dbarboza@ventanamicro.com>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
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
X-List-Received-Date: Thu, 29 Dec 2022 18:11:56 -0000

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


