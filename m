Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nLDaI-0000Nk-6S
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 19:26:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDaB-0000Ef-4H
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 19:26:39 -0500
Received: from [2607:f8b0:4864:20::334] (port=33711
 helo=mail-ot1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZa-000740-QE
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 19:26:38 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 j8-20020a056830014800b005ad00ef6d5dso3108950otp.0
 for <qemu-riscv@nongnu.org>; Fri, 18 Feb 2022 16:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O+TAsTb0YDZkAb19nkPyl6+rbdBOWvZTNZKyEPjrLhY=;
 b=Fk8OBH2TYnxMi2/e2bmFwEv/xLsq9XJr5QKVm4dfPFRv4TokporrLO4DGZiiGp5SYy
 MuZXBga8iUhkIGd9DYAL7O6PvAwu18nGeJMMYBtQwd41l/AoW1jBqU7nW8oOfYzn050P
 OrPc4jotLHR/s9BZJvWV2BvY43KqgL2qATeSuz9fKFdsnXi6oCLRbjR3rS4ULh089tE1
 QPt5PgXKmKSlhWx+cZtcmfp8PpEz7kdLwGA+JK/yHqnKclscSOJFOtEMYm9HiauSisMk
 SURJleQLYuEJmWqhbXuAhrigQERje54DOPoKZ3swuzBp5N+VIXS9U5bzhL3/pGpgb1Td
 eiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O+TAsTb0YDZkAb19nkPyl6+rbdBOWvZTNZKyEPjrLhY=;
 b=XI3a/rYfe2GG4TjhVQtXv60M7+UCOUq2cMe8ZH64RYcMc2CuFo4wuK4f2ZTUc2SU/o
 ysTs79fbDx40YZj9U1tsRkGoS4iHUlCtEp9cfSIDUZlALF0SdPu9E5umSlTx6TIvImQd
 c9tLwXqdsUHHKWhP8RU+p7V+Cli5X4bAJqZs+Gav4cB+924tYQohqYLFYwrIKgpLCtaa
 ltfJKlh2YQLvhZRr89kIOYj4042+3TblYcXJbeLrGxpv8sUp8WmQwkHY9vAVg6fv/gBX
 xKZkS/aG9+jeuvftmzxGcdUav/CJ4AYUtJhPr2Ev1bGVMlJ+AzvKaaNlkC1nk6iN6rNf
 i9JA==
X-Gm-Message-State: AOAM533a4MQebyKtoNbWvS7ZBum6cNNeF7El62JxlQFDqTEqHqpxV/0N
 ImVJfoMX1PNlC4VIIZOuuLICaV7K10lMz2Vs
X-Google-Smtp-Source: ABdhPJzVmNTd+yl/b5icvnRLignkntCm8+3x12e9yIDpGCmZ42M2h9SFIDxhno++BJFKAzWONcGcJQ==
X-Received: by 2002:a9d:44a:0:b0:591:cc04:997c with SMTP id
 68-20020a9d044a000000b00591cc04997cmr3320901otc.128.1645230349380; 
 Fri, 18 Feb 2022 16:25:49 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id r38sm2315588otv.72.2022.02.18.16.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 16:25:48 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v5 11/12] hw/riscv: virt: Add PMU DT node to the device tree
Date: Fri, 18 Feb 2022 16:25:17 -0800
Message-Id: <20220219002518.1936806-12-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220219002518.1936806-1-atishp@rivosinc.com>
References: <20220219002518.1936806-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::334
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=atishp@rivosinc.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 19 Feb 2022 00:26:39 -0000

Qemu virt machine can support few cache events and cycle/instret counters.
It also supports counter overflow for these events.

Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
capabilities. There are some dummy nodes added for testing as well.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/riscv/virt.c    | 28 +++++++++++++++++++++++
 target/riscv/cpu.c |  1 +
 target/riscv/pmu.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++
 target/riscv/pmu.h |  1 +
 4 files changed, 87 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 7d5f1e58c983..6288e436aa73 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -28,6 +28,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/char/serial.h"
 #include "target/riscv/cpu.h"
+#include "target/riscv/pmu.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
@@ -687,6 +688,32 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
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
@@ -732,6 +759,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
                     &intc_phandles[phandle_pos]);
             }
         }
+        create_fdt_socket_pmu(s, socket, phandle, intc_phandles);
     }
 
     if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 677210bc6d94..00c385009d67 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -910,6 +910,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char *isa_str, int max_str_len)
         { "svpbmt", cpu->cfg.ext_svpbmt   },
         { "svinval", cpu->cfg.ext_svinval },
         { "svnapot", cpu->cfg.ext_svnapot },
+        { "sscofpmf", cpu->cfg.ext_sscofpmf },
     };
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 5b212d2eb630..6e470a1d5f66 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -19,11 +19,68 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "pmu.h"
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
index 9b400c3522f2..63c4b533b223 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -31,6 +31,7 @@ int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
 int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
                                uint32_t ctr_idx);
 int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
+void riscv_pmu_generate_fdt_node(void *fdt, int num_counters, char *pmu_name);
 target_ulong get_icount_ticks(bool brv32);
 int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
                           uint32_t ctr_idx);
-- 
2.30.2


