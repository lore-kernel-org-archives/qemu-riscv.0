Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nuKCc-0007z8-1c
	for mharc-qemu-riscv@gnu.org; Thu, 26 May 2022 16:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nuKCY-0007yb-UI
 for qemu-riscv@nongnu.org; Thu, 26 May 2022 16:35:23 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nuKCV-0006xD-56
 for qemu-riscv@nongnu.org; Thu, 26 May 2022 16:35:20 -0400
Received: by mail-pl1-x62f.google.com with SMTP id w3so2372254plp.13
 for <qemu-riscv@nongnu.org>; Thu, 26 May 2022 13:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KdoqvWiXBEPNSeEAv5Sf60XOekRwhgfnSHLs+rxW3OE=;
 b=dYY/X64Bjoq3KVy6q4PdXqOMuXBogz3lY3meonoHS2nAp7Bh05+GxY+4PpHKEyehaQ
 iO48eptlCzYNhTsooJ15djZ2673BOqeRiQjJCHDdmRp349can2YC8ZAWCPlvf36vhsMw
 50GEEMW7/7MaezO+5kWDnZd0sekavgRZjkd3lAL9Y4h3EFlFUwVrVonqt4sZYmvdGfvj
 ZknmHAFYvTKhqK7xriRbMwUFQRhDMTV8bVuOkoie4q40aWP2NXt8yo/lxrtgusMc3P/8
 Vzvb/HKDLEEvg+CXEOpmv2zIwkFZloXXacoexA8jXiK62DFf9/cPRMTMw4lOwBwehGNH
 Gi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KdoqvWiXBEPNSeEAv5Sf60XOekRwhgfnSHLs+rxW3OE=;
 b=ohmvoK6+b5qsPsvlChhkfMXGIPGBsUMfrhF5X57IkgwZuu6GmE9VRc056vK9Z49LuV
 yr8BTJGxBX0SAFyTwZPlo9TZDhQNWpyhlx2yNZLtEB/6874W5Qm/CcL446iGzhHaIup4
 xJ1Bljs/ALRkXXfx01PXXhtJLy2FvZ+j3y3a96MaUMZhftS576NI/k1XQyQfsjclq4Ha
 yvnHTB1MsVvip0w6YguVoz3D1BYm469KWDMOPc8c/70PaLJ1+v+8Br5CWZLfqEZb4Fa9
 KAVCumDaSPTPqV0yhdFypiSt0Y0eUbJjT6B7KnUBvZOdwVPJtytf0OUGvDGpIKOv9giJ
 bQaw==
X-Gm-Message-State: AOAM5332B/aoZ+HIoKZSMjAJzy137zqEVxs4NOgHZ6oBRkRr1WXYC49M
 xWwabeU4SUuqLHk3o+QSkY+4Ag==
X-Google-Smtp-Source: ABdhPJwUcTPTySeLklK4qFbBv2zWF8dgABCe/Fwvxbpf/vzvKULC6HA9hKGkYvXtKCxXoLWti9YUxQ==
X-Received: by 2002:a17:90b:17c4:b0:1df:a60b:1e28 with SMTP id
 me4-20020a17090b17c400b001dfa60b1e28mr4438217pjb.31.1653597316730; 
 Thu, 26 May 2022 13:35:16 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a170902ba8e00b00160c970eeb7sm1997363pls.234.2022.05.26.13.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 13:35:15 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH] hw/riscv: virt: Generate fw_cfg DT node correctly
Date: Thu, 26 May 2022 13:35:00 -0700
Message-Id: <20220526203500.847165-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 26 May 2022 20:35:23 -0000

fw_cfg DT node is generated after the create_fdt without any check
if the DT is being loaded from the commandline. This results in
FDT_ERR_EXISTS error if dtb is loaded from the commandline.

Generate fw_cfg node only if the DT is not loaded from the commandline.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/riscv/virt.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index c57617381517..07aeee3bf0c3 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -975,6 +975,23 @@ static void create_fdt_flash(RISCVVirtState *s, const MemMapEntry *memmap)
     g_free(name);
 }
 
+static void create_fdt_fw_cfg(RISCVVirtState *s, const MemMapEntry *memmap)
+{
+    char *nodename;
+    MachineState *mc = MACHINE(s);
+    hwaddr base = memmap[VIRT_FW_CFG].base;
+    hwaddr size = memmap[VIRT_FW_CFG].size;
+
+    nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
+    qemu_fdt_add_subnode(mc->fdt, nodename);
+    qemu_fdt_setprop_string(mc->fdt, nodename,
+                            "compatible", "qemu,fw-cfg-mmio");
+    qemu_fdt_setprop_sized_cells(mc->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    qemu_fdt_setprop(mc->fdt, nodename, "dma-coherent", NULL, 0);
+    g_free(nodename);
+}
+
 static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
@@ -1023,6 +1040,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     create_fdt_rtc(s, memmap, irq_mmio_phandle);
 
     create_fdt_flash(s, memmap);
+    create_fdt_fw_cfg(s, memmap);
 
 update_bootargs:
     if (cmdline && *cmdline) {
@@ -1082,22 +1100,12 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
 static FWCfgState *create_fw_cfg(const MachineState *mc)
 {
     hwaddr base = virt_memmap[VIRT_FW_CFG].base;
-    hwaddr size = virt_memmap[VIRT_FW_CFG].size;
     FWCfgState *fw_cfg;
-    char *nodename;
 
     fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16,
                                   &address_space_memory);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)mc->smp.cpus);
 
-    nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
-    qemu_fdt_add_subnode(mc->fdt, nodename);
-    qemu_fdt_setprop_string(mc->fdt, nodename,
-                            "compatible", "qemu,fw-cfg-mmio");
-    qemu_fdt_setprop_sized_cells(mc->fdt, nodename, "reg",
-                                 2, base, 2, size);
-    qemu_fdt_setprop(mc->fdt, nodename, "dma-coherent", NULL, 0);
-    g_free(nodename);
     return fw_cfg;
 }
 
-- 
2.25.1


