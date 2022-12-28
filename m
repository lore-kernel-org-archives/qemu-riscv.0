Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAWZ8-0004f3-9r
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 08:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZ6-0004dK-IA
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:33:52 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZ5-0008Al-1w
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:33:52 -0500
Received: by mail-oi1-x231.google.com with SMTP id r11so14799515oie.13
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 05:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=14j0rjtt0NAYgU5LJ1kqKbCWT8XXgNf4j+2giaEVxKo=;
 b=ZpIGj2qwxzpz6/fqM84QzXSrfzz6R10DAzyXqwXqtSaznzaC3/dTftfdjwCkhNvPIo
 yWTmKOE7UPoVz5ExOTOBNciX/FQQ/6/2lSs8Wb6uqAGbABeZUzmpuVCcdBC1Dh960yUA
 wu2wdK5t4y4SbyWyW9qgFDZgNHbKYI3U6KtYbfamVPAZa7h7Yi+tnvBuh6SD0VjWAjtp
 5YqdyALr1V1ELxFFsXRC0VITL4fzXdlcCVD9cqqDY9ijUQcm/JGzbdiIVd5y38nsmjB2
 fHtRxgK1JpQh19DCk9TOTPWNwQdC5rHTQdX+1HbhhFEjjvPCOgcQX9AJ7gQZFtX0iNfd
 8dTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=14j0rjtt0NAYgU5LJ1kqKbCWT8XXgNf4j+2giaEVxKo=;
 b=M3cv4ljoeJU6nb/1R4C+IrbGpdPeNX3DqTiEfbGxzw4k5UwCYGainYTzd8BQaxV0fD
 RGGZLPGpCrrLa1kmDQMsOJDJZusyUkaH4d+KMPCPtSWvyR/UOo10+7iqJ8V6Jb7XDVeS
 3JBHIrvnqRra0sSMvoD2os3WexZ+7BRyYeEd0DFpHHReVI3i91WrP80gspIGJJr/RoT1
 jAmm1zudxQx1M/MpjBtyYDX98e0Q7v7TsIs5lRj1ykuUXnS24M1o/TJ9tYIQU3yjIFn2
 3UxeuK9m6TXUFtoarP/x0d+drutZRtr0GlILiqgkMGCs/hpm+HtLSvHUsXyP0y0xG+Qu
 +Qaw==
X-Gm-Message-State: AFqh2krp1VS7/05FlwPiRXuCB4B5/No1c0SYHOImrsmlBFFeuoRFzbo0
 WwAsLXyIMoP+MoOuyvH1GWTRIw==
X-Google-Smtp-Source: AMrXdXuRFubBTPUaoFhcOqWzNYBUDtE9+pbv8B3kVh72X2pAucM43g7YAfFrDa015biFL+NWjreLUg==
X-Received: by 2002:a05:6808:488:b0:360:c988:f07c with SMTP id
 z8-20020a056808048800b00360c988f07cmr11447726oid.34.1672234430464; 
 Wed, 28 Dec 2022 05:33:50 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 bl22-20020a056808309600b0035e7d07bf9dsm6991626oib.16.2022.12.28.05.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 05:33:50 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v3 02/10] hw/riscv/spike: use 'fdt' from MachineState
Date: Wed, 28 Dec 2022 10:33:28 -0300
Message-Id: <20221228133336.197467-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228133336.197467-1-dbarboza@ventanamicro.com>
References: <20221228133336.197467-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 28 Dec 2022 13:33:52 -0000

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


