Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAVm8-0005GC-1t
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 07:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVlz-00058l-8K
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 07:43:11 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVlr-0007mN-1D
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 07:43:01 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 r2-20020a9d7cc2000000b006718a7f7fbaso9787831otn.2
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 04:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=14j0rjtt0NAYgU5LJ1kqKbCWT8XXgNf4j+2giaEVxKo=;
 b=IaFGSW5AJBCxp9XP2P1vg8pPKwv988B7Op6QmI5W6mmZ94DDORZ3dJo62xMBMPwM8o
 Axb4SpCWDPdiDSeAYK0nngFOkjXzEJPnx0kL02eTf+8z2bHm/V4+EJoBKXYSdMZEvvWZ
 4fmDlduqtCHAiD2M81t/LsBFuG53+p3iYVi2N4gctdHQXhMRdb9obQ/FwAofv9ljdyTP
 o67LXB7QgVUNDef5i5FqybbwZFtvvJ3kIwni8yciXLsdUtoufafjr21lU5B1DmX7lsa8
 pGe8h8WZg2uVSNuqc1iwKjtTYDxb/qC+5kwI/2vVwYZy+utieHVW4ADbqFs8V8ofQRKW
 n0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=14j0rjtt0NAYgU5LJ1kqKbCWT8XXgNf4j+2giaEVxKo=;
 b=2WDCiSebhna7kSpV3TTNxGJa2s16GAGf/HyLO+HNFePdnqsgnjQ3IxH5FD4j8neGj/
 YO+j7tFBkrQKXMCyzssLBonhYsPm66eV6J12CfBGJvez3wr89SavFVxBuFcQKaioKN4M
 mKOhXGeqn6ZnFTdZjo5dgRu8kdZd/X04x9kKCS/7mABcr/Km8hSGqXonNEtK81RhodUL
 0Z2FxkReuHvQL+0jQKx08/qVmJaFPdqKhFhf3cz+f0R3lPY5nWUof2IBoQGXP9TOd3BA
 0q7uVjLWoWGrpqjOoilD8g7/yize/+2eNBFfqt6I4+VDLomXEIb7k5BcuYJSCXhe+lkv
 5hQA==
X-Gm-Message-State: AFqh2kpmWVNJr+kI6EjEv6OEaJ+BiYbcNOc2f61Rm8QoOohgV9gsS7Yk
 uAX1L8SgC6o+/XUnbJXg1fKnuQ==
X-Google-Smtp-Source: AMrXdXthyZ0z0zX7qYj7gRmuq0Rlwtp3V6Pmg6inZXqFM/tUJoU/1NoPYUkvhWS+kkrkq92pFSBmqg==
X-Received: by 2002:a05:6830:1110:b0:675:2e8a:8263 with SMTP id
 w16-20020a056830111000b006752e8a8263mr13473111otq.14.1672231377577; 
 Wed, 28 Dec 2022 04:42:57 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 cj5-20020a056830640500b0066f09567827sm7689333otb.78.2022.12.28.04.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 04:42:57 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v2 02/10] hw/riscv/spike: use 'fdt' from MachineState
Date: Wed, 28 Dec 2022 09:42:34 -0300
Message-Id: <20221228124242.184784-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228124242.184784-1-dbarboza@ventanamicro.com>
References: <20221228124242.184784-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
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

Remove the 'fdt' pointer from SpikeState and use MachineState::fdt
instead.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/spike.c         | 12 +++++-------
 include/hw/riscv/spike.h |  2 --
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 1b747d8f7c..426c383cef 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -53,6 +53,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
                        bool is_32_bit, bool htif_custom_base)
 {
     void *fdt;
+    int fdt_size;
     uint64_t addr, size;
     unsigned long clint_addr;
     int cpu, socket;
@@ -65,7 +66,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
         "sifive,clint0", "riscv,clint0"
     };
 
-    fdt = s->fdt = create_device_tree(&s->fdt_size);
+    fdt = mc->fdt = create_device_tree(&fdt_size);
     if (!fdt) {
         error_report("create_device_tree() failed");
         exit(1);
@@ -322,18 +323,15 @@ static void spike_board_init(MachineState *machine)
         hwaddr end = riscv_load_initrd(machine->initrd_filename,
                                        machine->ram_size, kernel_entry,
                                        &start);
-        qemu_fdt_setprop_cell(s->fdt, "/chosen",
+        qemu_fdt_setprop_cell(machine->fdt, "/chosen",
                               "linux,initrd-start", start);
-        qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
+        qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
                               end);
     }
 
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
-                                   machine->ram_size, s->fdt);
-
-    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
-    machine->fdt = s->fdt;
+                                   machine->ram_size, machine->fdt);
 
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
index 73d69234de..d13a147942 100644
--- a/include/hw/riscv/spike.h
+++ b/include/hw/riscv/spike.h
@@ -37,8 +37,6 @@ struct SpikeState {
 
     /*< public >*/
     RISCVHartArrayState soc[SPIKE_SOCKETS_MAX];
-    void *fdt;
-    int fdt_size;
 };
 
 enum {
-- 
2.38.1


