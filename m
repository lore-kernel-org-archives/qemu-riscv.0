Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p83ka-00088B-Er
	for mharc-qemu-riscv@gnu.org; Wed, 21 Dec 2022 13:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kY-00086W-C2
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:30 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kW-0007og-RE
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:30 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-12c8312131fso20141650fac.4
 for <qemu-riscv@nongnu.org>; Wed, 21 Dec 2022 10:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tRuVtqu0y6HSFA/62eqdmXWh2hHPYGAd1pNKzZ7sbeQ=;
 b=G9mhRDhC/3y6Dc0dx3bWSGjJLdcFG3rBFAPpRXw/Axc6YuBI8NeRIywyJHj1KpZ6Q4
 gmhbUnbd+UxbMl5lbkjYTuLCsCqYC0mbWlWm/3DGFqLyEKUROTKbgTlsssb4rhT199Ss
 I/fNSl5PYC4BmMoyrANRIP3ip2o3UV+XgKZIjSFSe7Jri2y09RlapDm7uEm9gy6XN7kA
 TjFGyJqC8H35F6l0BL//Qn1uboTClLeW/O3Mf3Q5rKBBkjFf4kF9bK016nxIfqnPJY3u
 76K8Ry5ghcLiYeWpNIJz5BAWxJLYlKQ1HQT2oz6fyx5W64N3RGt4LydR+pXLROswHbOD
 LdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tRuVtqu0y6HSFA/62eqdmXWh2hHPYGAd1pNKzZ7sbeQ=;
 b=32c5yWtJAgjOQuTZRunKGa8d7KzpqKFFQzPxtJRaBcYbptJJWeqT6B3d7gwe8OjwMb
 dZcTXcry5OW1f64Vxamvkwj3Gs6PvOIUAl4QQ0NIuviohmaBZ6/ilWlt8OUpnLc0L+wS
 9HCRfZnjae0ojOjS2vST+LoZjxauivA8dbQ8jsHrzyPStWFuLNUGeePQe3GusSPPxikP
 7dq74pSepv5yic27uztOlGdY1Rx/Ji5F+W12j1Jbmbuss+PWq+jWmL5+cgvbl6jHFXWq
 u5bpFKfPZlsVYMv5Zb75SzOUIyKWqy2kQYXJmXfALgFoP6m7RTuQdWN7PFoKl+bel6sK
 xIQA==
X-Gm-Message-State: AFqh2kqceWTemQ/XJWc6VZ+vXCRMYMAnOMxqhOFBijsYcDwCwubKHvR2
 FAoiM3yRpGF3DdjUhrUfZOZ5pA==
X-Google-Smtp-Source: AMrXdXsCRiPATMchVfMqj/9I+RyKRDzUMUpQx4yBTQDts9L2Z3CxW2qBINTUSTSz+lyohZYqhYMQJw==
X-Received: by 2002:a05:6870:cd11:b0:144:b4d6:4df1 with SMTP id
 qk17-20020a056870cd1100b00144b4d64df1mr1002408oab.30.1671647008143; 
 Wed, 21 Dec 2022 10:23:28 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:27 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 06/15] hw/riscv/spike.c: load initrd right after
 riscv_load_kernel()
Date: Wed, 21 Dec 2022 15:22:51 -0300
Message-Id: <20221221182300.307900-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
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
X-List-Received-Date: Wed, 21 Dec 2022 18:23:30 -0000

This will make the code more in line with what the other boards are
doing. We'll also avoid an extra check to machine->kernel_filename since
we already checked that before executing riscv_load_kernel().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/spike.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 43341c20b6..f37a9bebbf 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -257,6 +257,10 @@ static void spike_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
                                 mask_rom);
 
+    /* Create device tree */
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32bit(&s->soc[0]));
+
     /*
      * Not like other RISC-V machines that use plain binary bios images,
      * keeping ELF files here was intentional because BIN files don't work
@@ -275,6 +279,17 @@ static void spike_board_init(MachineState *machine)
         kernel_entry = riscv_load_kernel(machine->kernel_filename,
                                          kernel_start_addr,
                                          htif_symbol_callback);
+
+        if (machine->initrd_filename) {
+            hwaddr start;
+            hwaddr end = riscv_load_initrd(machine->initrd_filename,
+                                           machine->ram_size, kernel_entry,
+                                           &start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
+                                  "linux,initrd-start", start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
+                                  end);
+        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
@@ -283,22 +298,6 @@ static void spike_board_init(MachineState *machine)
         kernel_entry = 0;
     }
 
-    /* Create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
-
-    /* Load initrd */
-    if (machine->kernel_filename && machine->initrd_filename) {
-        hwaddr start;
-        hwaddr end = riscv_load_initrd(machine->initrd_filename,
-                                       machine->ram_size, kernel_entry,
-                                       &start);
-        qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                              "linux,initrd-start", start);
-        qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
-                              end);
-    }
-
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, machine->fdt);
-- 
2.38.1


