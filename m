Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dTV-0005DE-16
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dTS-00058L-RE
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:50:14 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dTQ-00088f-55
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:50:14 -0400
Received: by mail-pf1-x431.google.com with SMTP id y206so14428885pfb.10
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yhGZFEaD3aO0KQsD2ICHPMvun3tAOslpYraI0HTacnk=;
 b=fuYXfdB/4OUE4pbZ8kjHto2p8IYmeSb3gOHQMntkJmwDHhBkhHwWE8V2GkySWo2i6e
 tKPrFq++cOwaS+R0YyX3qoXM3g8mNZKpRppwBozkCiWCOJ2z1C34QNS+PHbyTi9RXOQ3
 jjz9TuBorVG3cUdj/ou/FEDl1eUQ6ZdkrZ3LHNg8T138URYWfykPq+2Pe6FC32XqlVtG
 lXmZsCCoP9HUASkYXiMNoMSya2d3kGHtOws+btIbYWJAJ+rc05pTvxdxO2msxw4b/STT
 ieWJMKRzUoQhqx2SX/qMkJYf+Eir7oxrLwe921TT2D1UCBHsWNKgh+l4f188RW7dysHQ
 6W4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yhGZFEaD3aO0KQsD2ICHPMvun3tAOslpYraI0HTacnk=;
 b=Ov+I+bR0CcLVwhtgab9QfkjyhULSjuh9M2pzycnBEeFeI/vcO+CfrWclYgboZerDEu
 D/vNbLNZBQnSi9oyrp9wB90uKhtFpnrz9awSJyGfDNMLjg1qkFIklhNTL5u3h5L13QKr
 kSio9+MysvENicx0UhPYLKbKesWV4ZGdbqw9lfRtRLlAF+xYX1FSi8Tqe+UVKE4yhgtW
 5Nkugli91fv/b5BdyevGAB+nsaU/ib9VCNQWG6F+S8KhF3YTn0JypCZNXqP1tnmu5twF
 cF9eHma3uRRRD/MinvERHr9wDAAm4qqCxbQG7ZkG4t3S2oV6HllBe+a6ZOXOEQinuYu8
 heAA==
X-Gm-Message-State: AOAM532UPMK+NXLcSYFDfJZ/umyeJNCuZKsWJWq87wXpzBcpVFaL4bbW
 OYwCcPS38At7ZPJUu6eUlA9YKg==
X-Google-Smtp-Source: ABdhPJx/777rqK6ZSXyd5uVarpw06fyKmsKwyNKyipDqZnkHEwbrz1FZlsIK/jc5UqeKYZPOuvwAPQ==
X-Received: by 2002:aa7:8a4d:: with SMTP id n13mr8227090pfa.143.1596711010822; 
 Thu, 06 Aug 2020 03:50:10 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:50:10 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Hsiangkai Wang <kai.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 70/71] target/riscv: gdb: support vector registers for rv64
Date: Thu,  6 Aug 2020 18:47:07 +0800
Message-Id: <20200806104709.13235-71-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Aug 2020 10:50:15 -0000

From: Hsiangkai Wang <kai.wang@sifive.com>

Signed-off-by: Hsiangkai Wang <kai.wang@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 gdb-xml/riscv-64bit-csr.xml |   7 ++
 target/riscv/cpu.c          |   1 +
 target/riscv/cpu.h          |  25 +++++++
 target/riscv/gdbstub.c      | 126 +++++++++++++++++++++++++++++++++++-
 4 files changed, 157 insertions(+), 2 deletions(-)

diff --git a/gdb-xml/riscv-64bit-csr.xml b/gdb-xml/riscv-64bit-csr.xml
index 90394562930..f768c3202a4 100644
--- a/gdb-xml/riscv-64bit-csr.xml
+++ b/gdb-xml/riscv-64bit-csr.xml
@@ -248,4 +248,11 @@
   <reg name="mucounteren" bitsize="64"/>
   <reg name="mscounteren" bitsize="64"/>
   <reg name="mhcounteren" bitsize="64"/>
+  <reg name="vstart" bitsize="64" group="vector"/>
+  <reg name="vxsat" bitsize="64" group="vector"/>
+  <reg name="vxrm" bitsize="64" group="vector"/>
+  <reg name="vcsr" bitsize="64" group="vector"/>
+  <reg name="vl" bitsize="64" group="vector"/>
+  <reg name="vtype" bitsize="64" group="vector"/>
+  <reg name="vlenb" bitsize="64" group="vector"/>
 </feature>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8844975bf94..e04cea5514c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -548,6 +548,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 #elif defined(TARGET_RISCV64)
     cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
 #endif
+    cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 528814cbfc7..88ca6f71c2e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -102,6 +102,16 @@ FIELD(VTYPE, VEDIV, 8, 2)
 FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
 FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 
+/**
+ * DynamicGDBXMLInfo:
+ * @desc: Contains the XML descriptions.
+ * @num: Number of the registers in this XML seen by GDB.
+ */
+typedef struct DynamicGDBXMLInfo {
+    char *desc;
+    int num;
+} DynamicGDBXMLInfo;
+
 struct CPURISCVState {
     target_ulong gpr[32];
     uint64_t fpr[32]; /* assume both F and D extensions */
@@ -295,6 +305,8 @@ typedef struct RISCVCPU {
         bool mmu;
         bool pmp;
     } cfg;
+
+    DynamicGDBXMLInfo dyn_vreg_xml;
 } RISCVCPU;
 
 static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
@@ -485,6 +497,19 @@ typedef struct {
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
 void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
 
+/*
+ * Helpers to dynamically generates XML descriptions of the
+ * vector registers. Returns the number of registers in each set.
+ */
+int ricsv_gen_dynamic_vector_xml(CPUState *cpu, int base_reg);
+
+/*
+ * Returns the dynamically generated XML for the gdb stub.
+ * Returns a pointer to the XML contents for the specified XML file or NULL
+ * if the XML name doesn't match the predefined one.
+ */
+const char *riscv_gdb_get_dynamic_xml(CPUState *cpu, const char *xmlname);
+
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
 
 #endif /* RISCV_CPU_H */
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index f7c5212e274..ceb73a08b25 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -268,6 +268,39 @@ static int csr_register_map[] = {
     CSR_MUCOUNTEREN,
     CSR_MSCOUNTEREN,
     CSR_MHCOUNTEREN,
+    CSR_VSTART,
+    CSR_VXSAT,
+    CSR_VXRM,
+    CSR_VCSR,
+    CSR_VL,
+    CSR_VTYPE,
+    CSR_VLENB,
+};
+
+struct TypeSize {
+    const char *gdb_type;
+    const char *id;
+    int size;
+    const char suffix;
+};
+
+static const struct TypeSize vec_lanes[] = {
+    /* quads */
+    { "uint128", "quads", 128, 'q' },
+    /* 64 bit */
+    { "uint64", "longs", 64, 'l' },
+    /* 32 bit */
+    { "uint32", "words", 32, 'w' },
+    /* 16 bit */
+    { "uint16", "shorts", 16, 's' },
+    /*
+     * TODO: currently there is no reliable way of telling
+     * if the remote gdb actually understands ieee_half so
+     * we don't expose it in the target description for now.
+     * { "ieee_half", 16, 'h', 'f' },
+     */
+    /* bytes */
+    { "uint8", "bytes", 8, 'b' },
 };
 
 int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
@@ -351,6 +384,34 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
+static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
+{
+    uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+    if (n < 32) {
+        int i;
+        int cnt = 0;
+        for (i = 0; i < vlenb; i += 8) {
+            cnt += gdb_get_reg64(buf,
+                                 env->vreg[(n * vlenb + i) / 8]);
+        }
+        return cnt;
+    }
+    return 0;
+}
+
+static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
+{
+    uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+    if (n < 32) {
+        int i;
+        for (i = 0; i < vlenb; i += 8) {
+            env->vreg[(n * vlenb + i) / 8] = ldq_p(mem_buf + i);
+        }
+        return vlenb;
+    }
+    return 0;
+}
+
 static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
 {
     if (n < ARRAY_SIZE(csr_register_map)) {
@@ -405,6 +466,51 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
+int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    GString *s = g_string_new(NULL);
+    DynamicGDBXMLInfo *info = &cpu->dyn_vreg_xml;
+    g_autoptr(GString) ts = g_string_new("");
+    int i, reg_width = cpu->cfg.vlen;
+    info->num = 0;
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.vector\">");
+
+    /* First define types and totals in a whole VL */
+    for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
+        int count = reg_width / vec_lanes[i].size;
+        g_string_printf(ts, "%s", vec_lanes[i].id);
+        g_string_append_printf(s,
+                               "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
+                               ts->str, vec_lanes[i].gdb_type, count);
+    }
+
+    /* Define unions */
+    g_string_append_printf(s, "<union id=\"riscv_vector\">");
+    for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
+        g_string_append_printf(s, "<field name=\"%c\" type=\"%s\"/>",
+                               vec_lanes[i].suffix,
+                               vec_lanes[i].id);
+    }
+    g_string_append(s, "</union>");
+
+    /* Define vector registers */
+    for (i = 0; i < 32; i++) {
+        g_string_append_printf(s,
+                               "<reg name=\"v%d\" bitsize=\"%d\""
+                               " regnum=\"%d\" group=\"vector\""
+                               " type=\"riscv_vector\"/>",
+                               i, reg_width, base_reg++);
+        info->num++;
+    }
+
+    g_string_append_printf(s, "</feature>");
+    cpu->dyn_vreg_xml.desc = g_string_free(s, false);
+    return cpu->dyn_vreg_xml.num;
+}
+
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
@@ -416,17 +522,33 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
                                  36, "riscv-32bit-fpu.xml", 0);
     }
+    if (env->misa & RVV) {
+        gdb_register_coprocessor(cs, riscv_gdb_get_vector, riscv_gdb_set_vector,
+                                 ricsv_gen_dynamic_vector_xml(cs,
+                                                              cs->gdb_num_regs),
+                                 "riscv-vector.xml", 0);
+    }
 #if defined(TARGET_RISCV32)
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                             241, "riscv-32bit-csr.xml", 0);
+                             248, "riscv-32bit-csr.xml", 0);
 
     gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
                              1, "riscv-32bit-virtual.xml", 0);
 #elif defined(TARGET_RISCV64)
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                             241, "riscv-64bit-csr.xml", 0);
+                             248, "riscv-64bit-csr.xml", 0);
 
     gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
                              1, "riscv-64bit-virtual.xml", 0);
 #endif
 }
+
+const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (strcmp(xmlname, "riscv-vector.xml") == 0) {
+        return cpu->dyn_vreg_xml.desc;
+    }
+    return NULL;
+}
-- 
2.17.1


