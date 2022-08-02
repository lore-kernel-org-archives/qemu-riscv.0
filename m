Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJ1O7-0003Jr-Sr
	for mharc-qemu-riscv@gnu.org; Tue, 02 Aug 2022 19:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJ1O6-0003G0-Kp
 for qemu-riscv@nongnu.org; Tue, 02 Aug 2022 19:33:22 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:33414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJ1O3-0007mD-Bm
 for qemu-riscv@nongnu.org; Tue, 02 Aug 2022 19:33:21 -0400
Received: by mail-pl1-x635.google.com with SMTP id w10so14871941plq.0
 for <qemu-riscv@nongnu.org>; Tue, 02 Aug 2022 16:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=STW5zgSAnPfM9o5zUiWG83iqfjpuSrH8mknbFxyp28g=;
 b=F19CmX5NUWdyZ/3RDr3bzmDOC1BTWCkp2fPwuk3W0qbo0LgFgQ2an2Uz/en+ZSKfiK
 vbD4xOt4cI9vwH0LD2PVn60lepojBmvhMx2FsnACEOhnq6KE6xOjmnKdC79MRrjAb25S
 mHxBi9dUtn4uRd4c9wdwOPYezTz6eOplvZJI9uIxLc/Ifkk4v0G6CNcCyeGKLBXBSV4R
 hggc8gneWjocqzwfy7uXCtc3zsy43+QuXqO3vEpqyCPxKkefFby0yHk3/pFE6wOCbgSE
 jph5Rasq1P1hsn6P+pmxfNHFPFJ+t7VCoXET3dVvKiK/xZlJmENJKSCkon5lfknh7++W
 JxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=STW5zgSAnPfM9o5zUiWG83iqfjpuSrH8mknbFxyp28g=;
 b=yOsslwcDGJ/ST+4GMcTXGVLa2LW0SnfpTWTmgogOsK62Fj8hwjFkHa15mx4SNvBcgj
 Rhd0KuQdHdSdkqxuPZ8U1+ZNIdnexOP9eLi4TOnUg5doHYi6dfYGOR1xup5iEbkPu0w6
 8S95XMKdmTMtpxUCYdGRush28KAaycxzm+8b0w9vQkjQC5qCI8BIlZvQQ2ZNMfM3poV9
 CjpgWcgD+fU7glk6UswSw2j9zkd89kxRTONIxRiXooIeNJY0OE/ZlywrdenvwXAgikLy
 0cFJj2GRFZtTNYFdeMk/DwulG8HeDeZaJ+6wL16oKfQw6gdvip0ONb2y7IzJyZ22Srvt
 T2Dw==
X-Gm-Message-State: ACgBeo2elCOzR7us3HgaK0f8/RcVm91rtgR4cXptetQZaaxoX+fODAYV
 MFiFHXdfi6jbIQTjiOiojoUKlg==
X-Google-Smtp-Source: AA6agR7cwJRLFI4EL0A+iR6t0SfJxrR/tgqZmkXSRV1/yAWARBLVrvN20Y7Df1+L2gzqEsORt8Pcxw==
X-Received: by 2002:a17:902:6b0c:b0:16e:de0e:9d0e with SMTP id
 o12-20020a1709026b0c00b0016ede0e9d0emr15184665plk.30.1659483198158; 
 Tue, 02 Aug 2022 16:33:18 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a170902a50a00b001636d95fe59sm250543plq.172.2022.08.02.16.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 16:33:17 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v12 4/6] hw/riscv: virt: Add PMU DT node to the device tree
Date: Tue,  2 Aug 2022 16:33:05 -0700
Message-Id: <20220802233307.2106839-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802233307.2106839-1-atishp@rivosinc.com>
References: <20220802233307.2106839-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Tue, 02 Aug 2022 23:33:22 -0000

Qemu virt machine can support few cache events and cycle/instret counters.
It also supports counter overflow for these events.

Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
capabilities. There are some dummy nodes added for testing as well.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/riscv/virt.c    | 16 +++++++++++++
 target/riscv/pmu.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++
 target/riscv/pmu.h |  1 +
 3 files changed, 74 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index f2ce5663a4c7..b58e6ed8b823 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -30,6 +30,7 @@
 #include "hw/char/serial.h"
 #include "target/riscv/cpu.h"
 #include "hw/core/sysbus-fdt.h"
+#include "target/riscv/pmu.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
@@ -715,6 +716,20 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
     aplic_phandles[socket] = aplic_s_phandle;
 }
 
+static void create_fdt_pmu(RISCVVirtState *s)
+{
+    char *pmu_name;
+    MachineState *mc = MACHINE(s);
+    RISCVCPU hart = s->soc[0].harts[0];
+
+    pmu_name = g_strdup_printf("/soc/pmu");
+    qemu_fdt_add_subnode(mc->fdt, pmu_name);
+    qemu_fdt_setprop_string(mc->fdt, pmu_name, "compatible", "riscv,pmu");
+    riscv_pmu_generate_fdt_node(mc->fdt, hart.cfg.pmu_num, pmu_name);
+
+    g_free(pmu_name);
+}
+
 static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
                                bool is_32_bit, uint32_t *phandle,
                                uint32_t *irq_mmio_phandle,
@@ -1043,6 +1058,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
 
     create_fdt_flash(s, memmap);
     create_fdt_fw_cfg(s, memmap);
+    create_fdt_pmu(s);
 
 update_bootargs:
     if (cmdline && *cmdline) {
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


