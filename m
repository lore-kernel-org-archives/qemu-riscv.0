Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAWZH-0004jj-LA
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 08:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZD-0004gU-Lh
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:33:59 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZB-0008IF-N7
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:33:59 -0500
Received: by mail-oi1-x22d.google.com with SMTP id i127so14834224oif.8
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 05:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QE2XJgRkAH08Shs2lwlBT8vzcOTk7Tw+J/29kSs4rCU=;
 b=PY+zEq5WxuHdmgJoaTmFojQQjRgi8MYe66EiwgIZ4a5kvh15S1K1SFlYTLKL2wlVwW
 D0H9nSWQkOGv5Wmc4fjbyl7IJf/d78umhV7Pu17CQyQxLt4lcdg/lwpE09Q3buUBbVNk
 pTTUUhoaLsqGrBRv++H7x/109MUVf5/9njFJNRMvTORDv5SeKWtDG/tzzWNxBNxraOeW
 xBNsrK2Fu/yNwaASHtDnTl1eB85mX8ucO3yR0rzJgMAbGfvAoj3eYQAkcXy30EDw5XcM
 FJ+8IIdh4R3obXFz2bGpz8uyjj2uvfI1zDISWtVTxjYD+9gpcWo5wlswypFtCKuwuOLD
 1VuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QE2XJgRkAH08Shs2lwlBT8vzcOTk7Tw+J/29kSs4rCU=;
 b=d0iVVkZxrNc/8A7by0nQ7LMFMxKmEVNSxr8hTHxHppr2IXCYzJSvMmfXeYW9/bFOJK
 ke9DHmrDhNegu/bDRskljF6coSpuYZj9/c2EUEK3NkJiECDL5g7f7c/Sfn9OT1Li1e2S
 R1rlbzABVPgjJtDEjBj+MjdpeOOhsBc7Zv5BT+eN0L41I2DM/OZIn0LtmJRPH0ZA8Ol6
 zltpXhr2kLxijmDQ33pdDxw3uSoxd100eN+hi5EV926wa4M5G8KGAikONHigc7kXsmJ8
 XXR6dMgSdUezFqalCe4sZg023lm0NTNqbh1r9Sh0KrZfclOnr0V4GOsx6/tp/HfEoy/X
 RClA==
X-Gm-Message-State: AFqh2kqB5RA4HofwVzxlXbgFNjboo8Em7dBsuKCww6O1SlMs2WfNdqS4
 IhG3R/VV33JmXBKZCenVOW00MY4xkD6HVi3K
X-Google-Smtp-Source: AMrXdXvUd+KbqMfe3nfJzdUlxuDUfgwb9looEDYPz4/Jxvac2QN+Rr1bcF2nFjYRxwX8j7Ne+Slqwg==
X-Received: by 2002:a05:6808:55:b0:360:e1dc:8b18 with SMTP id
 v21-20020a056808005500b00360e1dc8b18mr11114671oic.20.1672234436543; 
 Wed, 28 Dec 2022 05:33:56 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 bl22-20020a056808309600b0035e7d07bf9dsm6991626oib.16.2022.12.28.05.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 05:33:56 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v3 04/10] hw/riscv/spike.c: load initrd right after
 riscv_load_kernel()
Date: Wed, 28 Dec 2022 10:33:30 -0300
Message-Id: <20221228133336.197467-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228133336.197467-1-dbarboza@ventanamicro.com>
References: <20221228133336.197467-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 13:34:00 -0000

This will make the code more in line with what the other boards are
doing. We'll also avoid an extra check to machine->kernel_filename since
we already checked that before executing riscv_load_kernel().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/spike.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 426c383cef..0d2feea930 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -297,6 +297,10 @@ static void spike_board_init(MachineState *machine)
         g_free(firmware_name);
     }
 
+    /* Create device tree */
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32bit(&s->soc[0]), htif_custom_base);
+
     /* Load kernel */
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
@@ -305,6 +309,17 @@ static void spike_board_init(MachineState *machine)
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
@@ -313,22 +328,6 @@ static void spike_board_init(MachineState *machine)
         kernel_entry = 0;
     }
 
-    /* Create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]), htif_custom_base);
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


