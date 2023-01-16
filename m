Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHTNU-0006Vn-VQ
	for mharc-qemu-riscv@gnu.org; Mon, 16 Jan 2023 12:34:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHTNS-0006VH-W7
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 12:34:35 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHTNR-0004oB-D1
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 12:34:34 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-15ee27bb0a8so9142097fac.7
 for <qemu-riscv@nongnu.org>; Mon, 16 Jan 2023 09:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bkdBWyE6jruQmgrrkVuvbYYaLJJGy83f3GFd5HdR6mc=;
 b=gCjIgVSKjlanCXPeSyH7rOE7HzhG6WsNNzZIC0L8WsA3IPNM4Tvxmj/hnGwgN+wW4Q
 RnTJ1QtaU8JPoWcldu3TM4xrA2P+oPt0FZ3dmw80k5MaPn1EV4KHWR+FeVB+oyIvAx2X
 2Fx9sWwb0eqikkXyP/kHT/WiE1qlNNDTlAcmKLMaIsJSCTPqhOeywexWNovN2RIt+zCR
 4dqFO7bkrFeTFFn1dNsTV3TeOFeAiN/c+YcrGSbuRUb4+ZaCO1Rs9KbYVurNhXAgHvKV
 P7xuZ1ZYJ1B7fbhKyKsQ7klmCv1f2dlwCUJBLbfxLpv055siLRG0LQw5ayYJpOi904l/
 iu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bkdBWyE6jruQmgrrkVuvbYYaLJJGy83f3GFd5HdR6mc=;
 b=XWyXtY7mR0zp4OfeFiEkDlw9TgXUZIoXmwIOs80aHJXI2W66Dgc7yE1Y1NdZcXIEqg
 pOyJdatVILFGeae7IUwTUPFrvMK093juxmFO9lnfwufZWkt/G6MgoU5UmudSVY80DEjp
 BwGHuN+3mBGVHODF2bE5oxZEP65Knhh1DGMyfVP2J7sTB+EI6udND46KXgKO5UpfZ501
 1bDfpCWTCWBbysi/CkolCrpL6aF5r5AyjwAUuYESbMYltdFobI+4y9hDVASZbAMffMHN
 uwf1Fxm8mhZh1F3TNZHGSp8BJYE67ab6+rpBMLwXbMmbaKX/02jvw9RKhWX18UCvvg2/
 M1oA==
X-Gm-Message-State: AFqh2kq6wv8P0ZSLDs+kwSgp75scjihf+UXpSsANITu44EprFGAQRYSE
 VmK9y/iglt1V9Is+5IZm68zQOw==
X-Google-Smtp-Source: AMrXdXsrinyrDZud3N2Uox2P6IHNnPWdIn8egIaDWghzfL0doDWmGvzkYbhy08pIqcmIUdpvSNYa5g==
X-Received: by 2002:a05:6870:be97:b0:14c:4479:84a6 with SMTP id
 nx23-20020a056870be9700b0014c447984a6mr290524oab.52.1673890472362; 
 Mon, 16 Jan 2023 09:34:32 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 f23-20020a4ae617000000b0049fd5c02d25sm1353802oot.12.2023.01.16.09.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 09:34:31 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 3/6] hw/riscv: simplify riscv_compute_fdt_addr()
Date: Mon, 16 Jan 2023 14:34:17 -0300
Message-Id: <20230116173420.1146808-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
References: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 17:34:35 -0000

All callers are using attributes from the MachineState object. Use a
pointer to it instead of passing dram_size (which is always
machine->ram_size) and fdt (always machine->fdt).

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c            | 6 +++---
 hw/riscv/microchip_pfsoc.c | 4 ++--
 hw/riscv/sifive_u.c        | 4 ++--
 hw/riscv/spike.c           | 4 ++--
 hw/riscv/virt.c            | 3 +--
 include/hw/riscv/boot.h    | 2 +-
 6 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index b213a32157..508da3f5c7 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -255,11 +255,11 @@ void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
  *
  * The FDT is fdt_packed() during the calculation.
  */
-uint32_t riscv_compute_fdt_addr(hwaddr dram_base, uint64_t mem_size,
-                                void *fdt)
+uint32_t riscv_compute_fdt_addr(MachineState *machine, hwaddr dram_base)
 {
+    void *fdt = machine->fdt;
     uint64_t temp;
-    hwaddr dram_end = dram_base + mem_size;
+    hwaddr dram_end = dram_base + machine->ram_size;
     int ret = fdt_pack(fdt);
     int fdtsize;
 
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index dcdbc2cac3..a53e48e996 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -641,8 +641,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
         }
 
         /* Compute the fdt load address in dram */
-        fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
-                                              machine->ram_size, machine->fdt);
+        fdt_load_addr = riscv_compute_fdt_addr(machine,
+                                               memmap[MICROCHIP_PFSOC_DRAM_LO].base);
         riscv_load_fdt(fdt_load_addr, machine->fdt);
 
         /* Load the reset vector */
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 626d4dc2f3..ebfddf161d 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -616,8 +616,8 @@ static void sifive_u_machine_init(MachineState *machine)
         kernel_entry = 0;
     }
 
-    fdt_load_addr = riscv_compute_fdt_addr(memmap[SIFIVE_U_DEV_DRAM].base,
-                                           machine->ram_size, machine->fdt);
+    fdt_load_addr = riscv_compute_fdt_addr(machine,
+                                           memmap[SIFIVE_U_DEV_DRAM].base);
     riscv_load_fdt(fdt_load_addr, machine->fdt);
 
     if (!riscv_is_32bit(&s->soc.u_cpus)) {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 88b9fdfc36..afd581436b 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -324,8 +324,8 @@ static void spike_board_init(MachineState *machine)
         kernel_entry = 0;
     }
 
-    fdt_load_addr = riscv_compute_fdt_addr(memmap[SPIKE_DRAM].base,
-                                           machine->ram_size, machine->fdt);
+    fdt_load_addr = riscv_compute_fdt_addr(machine,
+                                           memmap[SPIKE_DRAM].base);
     riscv_load_fdt(fdt_load_addr, machine->fdt);
 
     /* load the reset vector */
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 839dfaa125..cbba0b8930 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1307,8 +1307,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
-    fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
-                                           machine->ram_size, machine->fdt);
+    fdt_load_addr = riscv_compute_fdt_addr(machine, memmap[VIRT_DRAM].base);
     riscv_load_fdt(fdt_load_addr, machine->fdt);
 
     /* load the reset vector */
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 9aea7b9c46..f933de88fb 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -47,7 +47,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
-uint32_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size, void *fdt);
+uint32_t riscv_compute_fdt_addr(MachineState *machine, hwaddr dram_start);
 void riscv_load_fdt(uint32_t fdt_addr, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
-- 
2.39.0


