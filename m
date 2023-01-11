Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFecO-000359-Sj
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 12:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFecI-0002yl-31
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 12:10:22 -0500
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFecD-0006Qe-NT
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 12:10:20 -0500
Received: by mail-oo1-xc36.google.com with SMTP id
 b10-20020a4a9fca000000b004e6f734c6b4so4198317oom.9
 for <qemu-riscv@nongnu.org>; Wed, 11 Jan 2023 09:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ncd/T/HTYU2+SGGnKfXa9OlGfj8OLblc1pqxQ33fLME=;
 b=LX/EAVSLCB0cN6yGOH1s3qiCmsk/WpaqwTBI1YsFAX4JPT8xo4FRkCFqFBSDhx0hst
 WJI2OMinY+7F7GMo+PRolm4g5E3H0Hca51ywjkEqQLLj9MivelV+206+hscUz44e02IP
 1mCNHOF+nkFhpdKpVZGGaFBASDJOXabXj3clG8qE2e7gMs2ue2E0drporXLXh/3oBHgd
 gj/uTFgirIBGfogbSOfR4cRjsLLhjRVgd9A/akttc6P9AIqWSquHOgV1Ors9iWj/TQdL
 b4L4QMilJ3l9AUcUynKseiaP4Q5Ev7z4JF6g4FWa3on6W+Au/XZ0zSti/JJ6GaC2xmZM
 NC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ncd/T/HTYU2+SGGnKfXa9OlGfj8OLblc1pqxQ33fLME=;
 b=lOg+iP19MDAhKH1zoZFV+frnVUed/uWOiASY6IpmmkCuIexpxfoZPs4HIicPxPqRc4
 zf5F8bSzG2q+EFqVenPZ6cefp/BcMKnGBlY+Guf7c92JIEY6JNCPrLBUNA6e+MUuKGAX
 VAJhVoDDpeOz0SZps1yKdas+LbVtpxQ/cp/1kc9FOf7VsO311/Hz21F8CjNTZCgtxf2N
 Z1B3sRNsbTgEdFnUMx+6qiIYXqPgC6/YFefNVTZJ6UTsfo2NXMHKEGhy5cciMatCS6Wr
 kT5fPTHag3Ah5PD9FVg3AhMv/JpKTVu/BUsilMK5mafM69VBALVxZHvcGDODkkUAZfQp
 C2cg==
X-Gm-Message-State: AFqh2koztbCEB13ElPdPjr57NDkDBKRc4J+BYAb3vuJexs1dY07woWxJ
 AGu79Z+PtCHsWAJKwVa6JsS8/Q==
X-Google-Smtp-Source: AMrXdXsTdpf7lWzswffCunF8bDyR8JT+B5lvLZbJOLpLFTp7/tebdAVOwcFcD7laGcnUws1EwZsj1g==
X-Received: by 2002:a4a:894f:0:b0:4f2:9e:3e9e with SMTP id
 g15-20020a4a894f000000b004f2009e3e9emr4480612ooi.5.1673457016297; 
 Wed, 11 Jan 2023 09:10:16 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 x18-20020a4ac592000000b004a3543fbfbbsm7214974oop.14.2023.01.11.09.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 09:10:15 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/10] hw/riscv/spike.c: rename MachineState 'mc' pointers to'
 ms'
Date: Wed, 11 Jan 2023 14:09:48 -0300
Message-Id: <20230111170948.316276-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111170948.316276-1-dbarboza@ventanamicro.com>
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc36.google.com
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
X-List-Received-Date: Wed, 11 Jan 2023 17:10:26 -0000

Follow the QEMU convention of naming MachineState pointers as 'ms' by
renaming the instances where we're calling it 'mc'.

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/spike.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 82093dd2cb..d753fb1f31 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -56,7 +56,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     uint64_t addr, size;
     unsigned long clint_addr;
     int cpu, socket;
-    MachineState *mc = MACHINE(s);
+    MachineState *ms = MACHINE(s);
     uint32_t *clint_cells;
     uint32_t cpu_phandle, intc_phandle, phandle = 1;
     char *name, *mem_name, *clint_name, *clust_name;
@@ -65,7 +65,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
         "sifive,clint0", "riscv,clint0"
     };
 
-    fdt = mc->fdt = create_device_tree(&fdt_size);
+    fdt = ms->fdt = create_device_tree(&fdt_size);
     if (!fdt) {
         error_report("create_device_tree() failed");
         exit(1);
@@ -96,7 +96,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
 
-    for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
+    for (socket = (riscv_socket_count(ms) - 1); socket >= 0; socket--) {
         clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
         qemu_fdt_add_subnode(fdt, clust_name);
 
@@ -121,7 +121,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
             qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
                 s->soc[socket].hartid_base + cpu);
             qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu");
-            riscv_socket_fdt_write_id(mc, cpu_name, socket);
+            riscv_socket_fdt_write_id(ms, cpu_name, socket);
             qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle);
 
             intc_name = g_strdup_printf("%s/interrupt-controller", cpu_name);
@@ -147,14 +147,14 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
             g_free(cpu_name);
         }
 
-        addr = memmap[SPIKE_DRAM].base + riscv_socket_mem_offset(mc, socket);
-        size = riscv_socket_mem_size(mc, socket);
+        addr = memmap[SPIKE_DRAM].base + riscv_socket_mem_offset(ms, socket);
+        size = riscv_socket_mem_size(ms, socket);
         mem_name = g_strdup_printf("/memory@%lx", (long)addr);
         qemu_fdt_add_subnode(fdt, mem_name);
         qemu_fdt_setprop_cells(fdt, mem_name, "reg",
             addr >> 32, addr, size >> 32, size);
         qemu_fdt_setprop_string(fdt, mem_name, "device_type", "memory");
-        riscv_socket_fdt_write_id(mc, mem_name, socket);
+        riscv_socket_fdt_write_id(ms, mem_name, socket);
         g_free(mem_name);
 
         clint_addr = memmap[SPIKE_CLINT].base +
@@ -167,14 +167,14 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
             0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
         qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
             clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
-        riscv_socket_fdt_write_id(mc, clint_name, socket);
+        riscv_socket_fdt_write_id(ms, clint_name, socket);
 
         g_free(clint_name);
         g_free(clint_cells);
         g_free(clust_name);
     }
 
-    riscv_socket_fdt_write_distance_matrix(mc);
+    riscv_socket_fdt_write_distance_matrix(ms);
 
     qemu_fdt_add_subnode(fdt, "/chosen");
     qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
-- 
2.39.0


