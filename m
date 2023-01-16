Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHTNb-0006Y9-BA
	for mharc-qemu-riscv@gnu.org; Mon, 16 Jan 2023 12:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHTNa-0006XZ-8z
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 12:34:42 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHTNY-0004pP-Mn
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 12:34:42 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-15ebfdf69adso12091252fac.0
 for <qemu-riscv@nongnu.org>; Mon, 16 Jan 2023 09:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uY7mmdSeesbv/Hm7XAxa618fZ21HHqAP2GCCfB3aKR0=;
 b=orfYqvVYKRHhnK91jThlOWPuY1hQ1Ea2nMQPGRfprs7AZh64XFPM5bD+ZdcuwuK7ab
 LzrusWP+NlpTR62jWWR534Ez9FwhUQ4hgzh8YqMuiF6ZYNGpnVrzQal9u+jMimqxWtsf
 SoDzteIBjur6ysd2EhTRYTSwUfFUeLM58+jKdtGuieObl6phylG9JxS/z9orJ/S9BmNB
 wWlNyvj1SiDQWKY7OHDJy8r7kA31AZ+0Q/kqIydsHng39EjuQLPjFzG9SDOlOJJz/FMd
 nFWJ3p6IImzwUhxpg+/nnSsfO/bJaqTWmCOEgBFg2b2kvKpVpZ14tE9oQ+EcYJzvNy0t
 fopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uY7mmdSeesbv/Hm7XAxa618fZ21HHqAP2GCCfB3aKR0=;
 b=aOIkyCs3SEl7dV/DISRZcwMtCDd9koy2Kv82O7EsyFb/+DQDNhMRK5j0+CanX8V25+
 14l33T0vgdnd5pVI0ITuPrS46DIMX9N/sxFSI9h3NcKmZ3BGTC09Oe4XfpyFfkokNYIG
 zJm0r6C5lEX/Q1dtc2kWCcSezpDGSucAk2DCE/vW2H2QGzk6Wf7YzMpyfgTNDC1acZuJ
 rizqLzmFBRBLBKppoO3JNag3S5JA7xvcjMWgYwLxJSVF0V/GsVkXjOSbida6RWFFoBS6
 F4IWhA6v4cFKMNipfg8RCP0/HX58iHAH0TNkn8it++rQijQmMVW3x2N49/ToCrzDA3fo
 9/2g==
X-Gm-Message-State: AFqh2krMRgzxcoshqPUjXOt5IyL1Bau3YANEByhkjg700GW7+fnAnC0o
 frO/ZhXA0za0qpaAiZezRlgCCA==
X-Google-Smtp-Source: AMrXdXt6jR9sCNNiPbb8N4fHgr1gdBI8bA5yRysTW40LVVL0Sx4vv1J+DjISS15nHc6oASnoAaoKuw==
X-Received: by 2002:a05:6870:b787:b0:15f:3e1d:8968 with SMTP id
 ed7-20020a056870b78700b0015f3e1d8968mr273205oab.2.1673890479550; 
 Mon, 16 Jan 2023 09:34:39 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 f23-20020a4ae617000000b0049fd5c02d25sm1353802oot.12.2023.01.16.09.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 09:34:39 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 6/6] hw/riscv/spike.c: rename MachineState 'mc' pointers
 to' ms'
Date: Mon, 16 Jan 2023 14:34:20 -0300
Message-Id: <20230116173420.1146808-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
References: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 17:34:42 -0000

Follow the QEMU convention of naming MachineState pointers as 'ms' by
renaming the instances where we're calling it 'mc'.

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/spike.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index afd581436b..222fde0c5c 100644
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


