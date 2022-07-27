Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGarL-000343-BZ
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 02:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGarF-0002pe-1R
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 02:49:25 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGarC-0003DX-HC
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 02:49:24 -0400
Received: by mail-pf1-x42d.google.com with SMTP id c3so15283888pfb.13
 for <qemu-riscv@nongnu.org>; Tue, 26 Jul 2022 23:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Keb8rMw+JxX3SCOraKaeDJHyTeo7O/ZvkjMwUVylhY8=;
 b=oDx0vHXmf4PPcduz6dGh0B/VLj0J3E0Ky46/JZnLH2UC6+ZsPiNL92iwgkN4S1ZE/x
 8LzXjgyLOQWplsPD8BBTLyxrroUYhEpeLsJrIZcCL+SKNLIiADcoTiUMDqzzkgndg8h2
 kiDShEzCRO2I1wu2CDEJiEJft8RUc3D62s1x4g0Cs58pxHMkF4xWAWWk8y2qvlN8Qm2h
 IpvckadSqBPt9PJbIG065TcAlWsrgzqooiTMdhsm3mRG7H3WNDtEGZw3L+dvCDNjuzxT
 U6s8mXu6Gf8cFM2XakPU0DvRPCPmTtnFhG5ERgdKFP6jvd+Fq03/n7848az41ekmu/xS
 qS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Keb8rMw+JxX3SCOraKaeDJHyTeo7O/ZvkjMwUVylhY8=;
 b=C1k/Vt+8UTjuiBZxFknFgRHatjNnk+BUU0qkaYY2xBU0DOJRTDDZZPjVNR/VAcWm/h
 NDGsXdAj9SxoFlYCYxtjbghIyVh9kKCXhgVlpIpu5J9dcqtmbVvFQA7qiYlSCbWMtJoB
 nYypiQiOAR5Ltaj6w7UUuBZBPvAwvMX/Hv+Cx0szX56rAkHVx7V2oo2svNTd+nQZhHEj
 52YOiXL0uy7yLFCTr213InCa695NgrnaBfeMO/C433+Es1zj/i4VJjqfPz7hCnkKQ4BF
 5JWs5Z5BsYFGOAZnA7H5HR8D3OzjnNptvMbbS7zuFDjtqA0BLYD345YvEvssi4R00bE/
 DoQQ==
X-Gm-Message-State: AJIora8/hucoLLw+o638o4quNemPGstdJSjgUTT/quV2hW4wypkstLX/
 G7ELosD6XbhHNl9o7cPOhpv6TOHChbX2RQ==
X-Google-Smtp-Source: AGRyM1vGL+pKrRR0nMTZsCLQswEfcXzy2dN4FPf3m05MwXkj2h0DcSCg9hcU8xwQ4rl+liu8NNG+Kw==
X-Received: by 2002:a05:6a02:18b:b0:415:c9d:4e3c with SMTP id
 bj11-20020a056a02018b00b004150c9d4e3cmr17289019pgb.580.1658904561243; 
 Tue, 26 Jul 2022 23:49:21 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a170902ab9000b0016d2d2c7df1sm12764851plr.188.2022.07.26.23.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 23:49:20 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v11 4/6] hw/riscv: virt: Add PMU DT node to the device tree
Date: Tue, 26 Jul 2022 23:49:11 -0700
Message-Id: <20220727064913.1041427-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727064913.1041427-1-atishp@rivosinc.com>
References: <20220727064913.1041427-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Wed, 27 Jul 2022 06:49:26 -0000

Qemu virt machine can support few cache events and cycle/instret counters.
It also supports counter overflow for these events.

Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
capabilities. There are some dummy nodes added for testing as well.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/riscv/virt.c    | 28 +++++++++++++++++++++++
 target/riscv/cpu.c |  1 +
 target/riscv/pmu.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++
 target/riscv/pmu.h |  1 +
 4 files changed, 87 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index bc424dd2f523..0f3fdb4908b8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -29,6 +29,7 @@
 #include "hw/char/serial.h"
 #include "target/riscv/cpu.h"
 #include "hw/core/sysbus-fdt.h"
+#include "target/riscv/pmu.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
@@ -714,6 +715,32 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
     aplic_phandles[socket] = aplic_s_phandle;
 }
 
+static void create_fdt_socket_pmu(RISCVVirtState *s,
+                                  int socket, uint32_t *phandle,
+                                  uint32_t *intc_phandles)
+{
+    int cpu;
+    char *pmu_name;
+    uint32_t *pmu_cells;
+    MachineState *mc = MACHINE(s);
+    RISCVCPU hart = s->soc[socket].harts[0];
+
+    pmu_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
+
+    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+        pmu_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        pmu_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_PMU_OVF);
+    }
+
+    pmu_name = g_strdup_printf("/soc/pmu");
+    qemu_fdt_add_subnode(mc->fdt, pmu_name);
+    qemu_fdt_setprop_string(mc->fdt, pmu_name, "compatible", "riscv,pmu");
+    riscv_pmu_generate_fdt_node(mc->fdt, hart.cfg.pmu_num, pmu_name);
+
+    g_free(pmu_name);
+    g_free(pmu_cells);
+}
+
 static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
                                bool is_32_bit, uint32_t *phandle,
                                uint32_t *irq_mmio_phandle,
@@ -759,6 +786,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
                     &intc_phandles[phandle_pos]);
             }
         }
+        create_fdt_socket_pmu(s, socket, phandle, intc_phandles);
     }
 
     if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c1d62b81a725..5c8417a56e5b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1114,6 +1114,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
         ISA_EDATA_ENTRY(zve64f, ext_zve64f),
         ISA_EDATA_ENTRY(zhinx, ext_zhinx),
         ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
+        ISA_EDATA_ENTRY(sscofpmf, ext_sscofpmf),
         ISA_EDATA_ENTRY(svinval, ext_svinval),
         ISA_EDATA_ENTRY(svnapot, ext_svnapot),
         ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 34096941c0ce..59feb3c243dd 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -20,11 +20,68 @@
 #include "cpu.h"
 #include "pmu.h"
 #include "sysemu/cpu-timers.h"
+#include "sysemu/device_tree.h"
 
 #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
 #define MAKE_32BIT_MASK(shift, length) \
         (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
 
+/**
+ * To keep it simple, any event can be mapped to any programmable counters in
+ * QEMU. The generic cycle & instruction count events can also be monitored
+ * using programmable counters. In that case, mcycle & minstret must continue
+ * to provide the correct value as well. Heterogeneous PMU per hart is not
+ * supported yet. Thus, number of counters are same across all harts.
+ */
+void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_name)
+{
+    uint32_t fdt_event_ctr_map[20] = {};
+    uint32_t cmask;
+
+    /* All the programmable counters can map to any event */
+    cmask = MAKE_32BIT_MASK(3, num_ctrs);
+
+   /**
+    * The event encoding is specified in the SBI specification
+    * Event idx is a 20bits wide number encoded as follows:
+    * event_idx[19:16] = type
+    * event_idx[15:0] = code
+    * The code field in cache events are encoded as follows:
+    * event_idx.code[15:3] = cache_id
+    * event_idx.code[2:1] = op_id
+    * event_idx.code[0:0] = result_id
+    */
+
+   /* SBI_PMU_HW_CPU_CYCLES: 0x01 : type(0x00) */
+   fdt_event_ctr_map[0] = cpu_to_be32(0x00000001);
+   fdt_event_ctr_map[1] = cpu_to_be32(0x00000001);
+   fdt_event_ctr_map[2] = cpu_to_be32(cmask | 1 << 0);
+
+   /* SBI_PMU_HW_INSTRUCTIONS: 0x02 : type(0x00) */
+   fdt_event_ctr_map[3] = cpu_to_be32(0x00000002);
+   fdt_event_ctr_map[4] = cpu_to_be32(0x00000002);
+   fdt_event_ctr_map[5] = cpu_to_be32(cmask | 1 << 2);
+
+   /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x00 type(0x01) */
+   fdt_event_ctr_map[6] = cpu_to_be32(0x00010019);
+   fdt_event_ctr_map[7] = cpu_to_be32(0x00010019);
+   fdt_event_ctr_map[8] = cpu_to_be32(cmask);
+
+   /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x00 type(0x01) */
+   fdt_event_ctr_map[9] = cpu_to_be32(0x0001001B);
+   fdt_event_ctr_map[10] = cpu_to_be32(0x0001001B);
+   fdt_event_ctr_map[11] = cpu_to_be32(cmask);
+
+   /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x00 type(0x01) */
+   fdt_event_ctr_map[12] = cpu_to_be32(0x00010021);
+   fdt_event_ctr_map[13] = cpu_to_be32(0x00010021);
+   fdt_event_ctr_map[14] = cpu_to_be32(cmask);
+
+   /* This a OpenSBI specific DT property documented in OpenSBI docs */
+   qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
+                    fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
+}
+
 static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
 {
     if (ctr_idx < 3 || ctr_idx >= RV_MAX_MHPMCOUNTERS ||
diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 036653627f78..3004ce37b636 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -31,5 +31,6 @@ int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
 int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
                                uint32_t ctr_idx);
 int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
+void riscv_pmu_generate_fdt_node(void *fdt, int num_counters, char *pmu_name);
 int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
                           uint32_t ctr_idx);
-- 
2.25.1


