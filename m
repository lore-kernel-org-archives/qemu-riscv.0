Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pCJNA-0007Dj-2J
	for mharc-qemu-riscv@gnu.org; Mon, 02 Jan 2023 06:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJN8-0007Av-Hu
 for qemu-riscv@nongnu.org; Mon, 02 Jan 2023 06:52:54 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJN7-0002uA-1W
 for qemu-riscv@nongnu.org; Mon, 02 Jan 2023 06:52:54 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-12c8312131fso33457460fac.4
 for <qemu-riscv@nongnu.org>; Mon, 02 Jan 2023 03:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8tYhCgeu+CUPdU0tlNGR+x3OI3mYmG0ZDZI1kUqM/1s=;
 b=UdT6ilTSt972XE81gYaspt6L9Aw4du3Wot7oNrmNBiPh2CRo+Lb49xTG/jKAYT0i+o
 aONB4VNBwRd8NtSPswjQ0tCcbNZ1x4R+nJIBH0j5ZerV5LaSL9nr5QM4FGvCDo6+XcWj
 /gBWGL2lYuiLR3t3RMVuUTHxcdnIRucJUedPaW54XOsi/kEu12rQ0/SA3upz4D+sMjKF
 b2+txD923m+ryFDauxHm2Dfc4ZBxq3gh1HoBflCl/RdSk8veSB0roiIH4F+vd9rqs453
 408w1fziScmJclRi7QxXAEDxsq9RG0WvVMs+9IXp9iTVlbGr2p8BY1Wo17dYGB9RYETl
 5wwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8tYhCgeu+CUPdU0tlNGR+x3OI3mYmG0ZDZI1kUqM/1s=;
 b=N61caA5MxqYU/0S1Ek2/zkHxb58YcbUZFZW6fl1uFox1q5vXHoyopqs67105azorQw
 mAbMKqgKS4vefW82GlRbPKps1l3lftHyHe8E0Si5DrN7AI31OdcLic0STxKr0/7kSVga
 Um25gqZK7Sce9s942MHeW4WaR2wqGfNKkfMtLFJ2pDKPWk0m9UDMMKwjfgcyvwPPfu8W
 mE/tqe6tHctzHTYRXqVHzoFcwFZlABUgRwkieAUCp7XrmLRFBMrAm3sYSc4IyivfrTZn
 uhgWxYN2xnxx6pvDa5PYkJUuwMPRiVxnoqJO3jcQbERe4uht9HC3+6zYIdrVrgH24xPj
 WwNg==
X-Gm-Message-State: AFqh2kqj/4/9NqUDFQndTwkJaqabxG7PzI8syh1IDaQ2n+JUUx8eZAYz
 VzueAYainNeiCZbASP6i8WEgIA==
X-Google-Smtp-Source: AMrXdXu7jwkKbzqaZ4NJ7RMjItpnBS69O3IKBMEGkTuNUe5iggof9qujNOzW9MxAgasW5UT5rbhH7Q==
X-Received: by 2002:a05:6870:b6a7:b0:144:7395:2140 with SMTP id
 cy39-20020a056870b6a700b0014473952140mr22269021oab.35.1672660372462; 
 Mon, 02 Jan 2023 03:52:52 -0800 (PST)
Received: from grind.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 l39-20020a05687106a700b0014fb4bdc746sm11354475oao.8.2023.01.02.03.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 03:52:52 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v5 02/11] hw/riscv/spike: use 'fdt' from MachineState
Date: Mon,  2 Jan 2023 08:52:32 -0300
Message-Id: <20230102115241.25733-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102115241.25733-1-dbarboza@ventanamicro.com>
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
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
X-List-Received-Date: Mon, 02 Jan 2023 11:52:54 -0000

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
2.39.0


