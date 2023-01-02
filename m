Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pCJNR-0007Jp-82
	for mharc-qemu-riscv@gnu.org; Mon, 02 Jan 2023 06:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJNQ-0007JL-9r
 for qemu-riscv@nongnu.org; Mon, 02 Jan 2023 06:53:12 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJNO-0002wh-M7
 for qemu-riscv@nongnu.org; Mon, 02 Jan 2023 06:53:12 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-142b72a728fso33407966fac.9
 for <qemu-riscv@nongnu.org>; Mon, 02 Jan 2023 03:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oj08w++xbODCvY6Eg3Vy9vgHuatSVtDy2DUMld8rccg=;
 b=i95QppjjsQqyLNjdMiF9/RR/ukVHDfMWADLbDRJR2r7LePXkY4p89Z9Nj4jVN0kkJc
 EWZxzB2x0WHAPv6gCd/I9jX4b0LEnpLMxTjZ6nQQSdJW7TKXPoxhjp0UZ6BN/fxgnqxH
 SW4lPGsczBr5K7vJ4J1lh5XKJfdmyvj+ShV+kcITdUEnzWBc7CMpB0B07/BUlTNnGJTW
 McB118biW3UR2u3scpoH2e+Aoql4hT3NHmafRzIMKOty+TsH4QBNR/T1QulRPzsI1Xy9
 VN6MBSelDPaJbKAH2Q8cYB/6WZKJsM/M6vU3PMPzX5FWRpHunzXM6+brXWkfIXf3nNk4
 Pi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oj08w++xbODCvY6Eg3Vy9vgHuatSVtDy2DUMld8rccg=;
 b=wFYoVLJdeE5hBM0BLvW0f5N9xtORUGccm2jlrSAq8UK17HPpxnXyipvRWXmQx8DVYF
 LAVDJfvILJXjAciElQpIhriFRbPNdrHqTTILxHy/ASGdqphpbylxuu9x7fFc820sq8cy
 ncB+oA2sW4Dy3tCw1yn6r5107pdqVDNHdwze7Q5rQZ93ZsCAucpDCx3xx3bG40JFoCHg
 3qJm3DSmZrqKbctCYaaGfTooP1S4s6q9QOd/Go6D8lnG7sAt1tTxFp05QXp0/PYRDet0
 kVhrLm/7yaZJ5NgDsRi7M4nqDaJcPVAmG6QlWa1mgqcaHcd7IY5ao+qqiCjfxDMR597Z
 pL7w==
X-Gm-Message-State: AFqh2kpxCB+ycDm1tLZ/VFuM1M0UKh90q/s/bhRb9CgBpsTTTCQKV8Bm
 AGDVpyruSUqLYMEQo3+aYmpFiA==
X-Google-Smtp-Source: AMrXdXvD1cDaXmI2tUmlNU64eByUxBjq5aCm5NklLgetaauhXZ0n2zrCnYxvGReSOm9Iihhwv66MKg==
X-Received: by 2002:a05:6870:fc85:b0:150:b06e:1c57 with SMTP id
 ly5-20020a056870fc8500b00150b06e1c57mr1398580oab.43.1672660389556; 
 Mon, 02 Jan 2023 03:53:09 -0800 (PST)
Received: from grind.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 l39-20020a05687106a700b0014fb4bdc746sm11354475oao.8.2023.01.02.03.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 03:53:09 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v5 08/11] hw/riscv/boot.c: use MachineState in
 riscv_load_initrd()
Date: Mon,  2 Jan 2023 08:52:38 -0300
Message-Id: <20230102115241.25733-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102115241.25733-1-dbarboza@ventanamicro.com>
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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
X-List-Received-Date: Mon, 02 Jan 2023 11:53:12 -0000

'filename', 'mem_size' and 'fdt' from riscv_load_initrd() can all be
retrieved by the MachineState object for all callers.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/boot.c            | 6 ++++--
 hw/riscv/microchip_pfsoc.c | 3 +--
 hw/riscv/sifive_u.c        | 3 +--
 hw/riscv/spike.c           | 3 +--
 hw/riscv/virt.c            | 3 +--
 include/hw/riscv/boot.h    | 3 +--
 6 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 6b948d1c9e..d3e780c3b6 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -208,9 +208,11 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
     exit(1);
 }
 
-void riscv_load_initrd(const char *filename, uint64_t mem_size,
-                       uint64_t kernel_entry, void *fdt)
+void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
 {
+    const char *filename = machine->initrd_filename;
+    uint64_t mem_size = machine->ram_size;
+    void *fdt = machine->fdt;
     hwaddr start, end;
     ssize_t size;
 
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 593a799549..1e9b0a420e 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -633,8 +633,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
                                          kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
-            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
-                              kernel_entry, machine->fdt);
+            riscv_load_initrd(machine, kernel_entry);
         }
 
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 3e6df87b5b..c40885ed5c 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -602,8 +602,7 @@ static void sifive_u_machine_init(MachineState *machine)
                                          kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
-            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
-                              kernel_entry, machine->fdt);
+            riscv_load_initrd(machine, kernel_entry);
         }
 
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 60e2912be5..99dec74fe8 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -312,8 +312,7 @@ static void spike_board_init(MachineState *machine)
                                          htif_symbol_callback);
 
         if (machine->initrd_filename) {
-            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
-                              kernel_entry, machine->fdt);
+            riscv_load_initrd(machine, kernel_entry);
         }
 
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6c946b6def..02f1369843 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1285,8 +1285,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
                                          kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
-            riscv_load_initrd(machine->initrd_filename, machine->ram_size,
-                              kernel_entry, machine->fdt);
+            riscv_load_initrd(machine, kernel_entry);
         }
 
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index e37e1d1238..cfd72ecabf 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -46,8 +46,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
 target_ulong riscv_load_kernel(const char *kernel_filename,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
-void riscv_load_initrd(const char *filename, uint64_t mem_size,
-                       uint64_t kernel_entry, void *fdt);
+void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
-- 
2.39.0


