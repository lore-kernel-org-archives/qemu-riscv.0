Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAxO1-0007Aw-F4
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 13:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNz-00079I-1c
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:12:11 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNx-0003hW-6h
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:12:10 -0500
Received: by mail-oi1-x229.google.com with SMTP id s187so17698302oie.10
 for <qemu-riscv@nongnu.org>; Thu, 29 Dec 2022 10:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B8DtHT/1hlp9A5ueaG23p9ti8TTHG91U4whOnqYe/xY=;
 b=PI458k8KyiRJRuzicVut+FGaY4EXhB/G+Qbw+rplOCjihYZWYygEKhexCNnGX7ODV5
 CA9uIEmY52iLfgZxgNlQxh3Jmad8OpV88WZS6XEnrAUB6ix+CALwLc2VLx1ZABSJrGKK
 cDWUzDF2V7aUEXIetjNFB0IQlhZ+h2VlUuwMFAgCH7blOB/qQPJH5lW+VhcF4q1tG/lF
 EnnPM0X+Tar8cWrvFONibJ7me9J6nf7B/0vpHJSw24KetzirpAw8YkClys9LjGwXNisg
 tk+Bnk4WmR+bpro/PY2QZlYuFSQQIExoi5CJrX9cdQUAyhu7J8l9m/AYrZCrQjAcSwLp
 Ybew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B8DtHT/1hlp9A5ueaG23p9ti8TTHG91U4whOnqYe/xY=;
 b=TOO23EA19IsChjOashf2iYcxCnhJvo2cwe0KiWp+jz1IZFcfXOmFO96OXXxom7bNGH
 p8Ku5pPnhJx4ut3v2t5YS7qaa0IudVSBCfpP+A/FSZUcXok8/Go5sNWs0hqk77IKjt7k
 2X4MqVTFmML6amGR2IkBli6Zy3t51+v1w6TqxmBdbyc8xdcy9qE9D2tlhXypKeXieJ+t
 YeEDM1T08pbVjJwysmsE67o1A64JUP/CnGmmp+hZakDG7oQ2vmjsBiM34eGJZ1fd/HxY
 M/cFupScgGsAhRgyPJdeCYUraO+Gd+MlcKOd42aRU7keGecwSqg1h92F4jYcLDYOK3wi
 GJsw==
X-Gm-Message-State: AFqh2kpUma+iyWo7jRY1CAzTlRjhKJAa33sb/ZZpKzs2BEb81jYVsVAC
 Zy00kQRDqd7NZsLgl0EZnYfesw==
X-Google-Smtp-Source: AMrXdXtK6wyGS+gP7rPjmQff+Gd25gfnWwxwcbEN0Wi3U/sgpI7DwGDQ78ZtgnLVXZFC2nn9wN8pDA==
X-Received: by 2002:a05:6808:b0d:b0:35e:563:e0d6 with SMTP id
 s13-20020a0568080b0d00b0035e0563e0d6mr13000224oij.38.1672337527710; 
 Thu, 29 Dec 2022 10:12:07 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056830139400b0066db09fb1b5sm9267205otq.66.2022.12.29.10.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 10:12:07 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v4 08/11] hw/riscv/boot.c: use MachineState in
 riscv_load_initrd()
Date: Thu, 29 Dec 2022 15:11:32 -0300
Message-Id: <20221229181135.270661-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229181135.270661-1-dbarboza@ventanamicro.com>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
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
X-List-Received-Date: Thu, 29 Dec 2022 18:12:11 -0000

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
index 8583732e4e..a78461cd14 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -206,9 +206,11 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
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
2.38.1


