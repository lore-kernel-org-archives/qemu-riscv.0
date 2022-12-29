Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAxNi-0006t8-7i
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 13:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNg-0006sc-NX
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:11:52 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNf-0003Zv-4q
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:11:52 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 k44-20020a9d19af000000b00683e176ab01so6955505otk.13
 for <qemu-riscv@nongnu.org>; Thu, 29 Dec 2022 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wTbQ/z0MT6rXtviJyLfGSW2PszZMHUabflErTSFD2bY=;
 b=RzzBnuOeJ2E1/MEVmPTcdsHNZ0CqSPeMx4W1hqdJmKjtZPeukkSNf/+dfwPoxISUcD
 1e6jWgxR6lV88vtCoXJ0jZzOkTCyMJlEBCK3Nb74M6xaWO9Ke85tyyo/A/5zogSoPxKh
 iw/rY5XPxuNcyjZWDHmJGzrJnB//1KCCB/OdXERJTKwAoEsaAGNUL8dCTIua7GZeIFRO
 2L4wUB+jqCOjID24gV0hD7d7z0yF06HohQsTSUeklEr7YySNpmyOi4FtgGXf7+hRCw/B
 FE0gr+U5qn9ssVhI0rgNUxX6iDqoaUsc3NKvBmESwcpxBAQub2cJKzslqhpnHFce74Du
 WkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wTbQ/z0MT6rXtviJyLfGSW2PszZMHUabflErTSFD2bY=;
 b=7WNF/Pcfv6kTdtGmqlSxJLGxC2AdUkrOJ3gqcyyg8Fn2i3g5K+UaNTRV9IOnOnz7m5
 VQlu6jqe3zzm74FsiiY+dHl/0r3SmIWsT/st0ktQb4PJP841QnbIMqfPQyn0MQ8DTH2f
 4xktntBmGOWoWlE/smdzfFu6PLILdAyyHW7F8EkK27qMsN62eYYBqpXQhdm/1zsi2GFI
 3hxpu/7urg2KZtgSihJFcvDqlYpVFgcZDMPOs7+BlF00P2XsGP/UTyw6JU/SAeOipCkB
 uxQYfz2pfXhl7I/xuA5/5FC+SKXM1TABUNUk3jVFYJGM6B3Plzc7sVKNwyaQqWZ6KIIp
 mrAQ==
X-Gm-Message-State: AFqh2kqn8rFEim/v306HWo613w8bC7uO1WZz6HqX81V9J6lmHzfurd0p
 ZjzHtv5u4yHHijf+nTSxC5v0mw==
X-Google-Smtp-Source: AMrXdXsAP00+L9l0CVn8ihPJ6jDtC8LRcO9rWNyjj8M0vNhcwiX4YSYh0bJ728+86Ja41F1m1C/MGA==
X-Received: by 2002:a05:6830:6485:b0:66e:aa56:3623 with SMTP id
 ck5-20020a056830648500b0066eaa563623mr15638418otb.4.1672337510162; 
 Thu, 29 Dec 2022 10:11:50 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056830139400b0066db09fb1b5sm9267205otq.66.2022.12.29.10.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 10:11:49 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v4 02/11] hw/riscv/spike: use 'fdt' from MachineState
Date: Thu, 29 Dec 2022 15:11:26 -0300
Message-Id: <20221229181135.270661-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229181135.270661-1-dbarboza@ventanamicro.com>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
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
X-List-Received-Date: Thu, 29 Dec 2022 18:11:53 -0000

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
index 1679c325d5..25c5420ee6 100644
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
@@ -327,18 +328,15 @@ static void spike_board_init(MachineState *machine)
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


