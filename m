Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGEN-0007uX-Ei
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGEL-0007oQ-0g
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:49 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:37785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGEH-0000AH-Jl
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:48 -0500
Received: by mail-pf1-x42c.google.com with SMTP id 11so1072589pfu.4
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NZ3FRreF60FioJk5INpF7zWytDLIW7w0s37NHFof1Ww=;
 b=cq3kbhsofbulDPZ2SVBVg48vEWTAtuDBLfPZC0WPf3YAhNLZVhswFNDC2KJ7z4u9ma
 GO5jJeUpTlpUdxYKNMPMkyj2TF3TjqtcTAwQeJYUyFBMiyPZ7GRoT524Oea4pgXRJIB6
 5Ju5T6jStqFFy0fbiPcJ+5EdlZKlNFpC+FvfB9hyr83Z9UX93lu+vICY1tfMfE4CpTS6
 kqlz24ZCzhTBpva0g2LrBIhtDgX8ggBhhu/tBpVEHeKplyRw4215zGH7bna4a5K8GjG8
 M0jHBf64Czg5u3Xlhv1PWP7Wb4z40ysv3z6Xp28YNhVJShGzSdZaoTpfoDVWLG/vuf++
 DA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NZ3FRreF60FioJk5INpF7zWytDLIW7w0s37NHFof1Ww=;
 b=WkrhOA4iXgZbwMK+w552FXNnqewVTKNXJeX1TdD8dUz3Ry1upk5/MJKPOikE77ahgC
 OoSIGEc6GlhtVL0Zps2BNqkZoUpmMIVHhpIq9DI5msqvlF6fAZEbd7SH6yhy+SduoCsf
 1OzeKY3fzWPqL4UIUS9doXTVP+JKhQYFiDlGJFl2mm+uq1VFe1TfbzlZosaiKU/lxoEz
 5yVDLRLRJthQiFWSYx3Liay4VaBfmJFBJkAhUB35BCb8PBXhsu+nMe2u26TUVI2CJsFh
 mZZL9nEWZfNI6q9GwK9wqj7Oz5utoFC9UF/Mf3Y44yRgRtJyypHmdy0y0ut4AZtxoMek
 0mUQ==
X-Gm-Message-State: AOAM531FCVdygZxUszvVH8OfiMrwsIGgn561k9vc+E/oTRF/rUYQVUnw
 gq9tZKvcetVu81HF9zjKNaHXKw==
X-Google-Smtp-Source: ABdhPJyNBD8nwsc46f/64R16ddFnyFYbnZXNwlham8eMkz1nl5s/h2WjmXTLuonQbeu3Jfs7yBzGLQ==
X-Received: by 2002:a63:445a:: with SMTP id t26mr3949701pgk.402.1610444683530; 
 Tue, 12 Jan 2021 01:44:43 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:44:43 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Hsiangkai Wang <kai.wang@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 69/72] target/riscv: gdb: support vector registers for rv64
 & rv32
Date: Tue, 12 Jan 2021 17:39:43 +0800
Message-Id: <20210112093950.17530-70-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jan 2021 09:44:49 -0000

From: Hsiangkai Wang <kai.wang@sifive.com>

Signed-off-by: Hsiangkai Wang <kai.wang@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 gdb-xml/riscv-32bit-csr.xml |   7 ++
 gdb-xml/riscv-64bit-csr.xml |   7 ++
 target/riscv/cpu.c          |   1 +
 target/riscv/cpu.h          |  25 +++++
 target/riscv/gdbstub.c      | 177 +++++++++++++++++++++++++++++++++++-
 5 files changed, 215 insertions(+), 2 deletions(-)

diff --git a/gdb-xml/riscv-32bit-csr.xml b/gdb-xml/riscv-32bit-csr.xml
index 3d2031da7dc..19010714705 100644
--- a/gdb-xml/riscv-32bit-csr.xml
+++ b/gdb-xml/riscv-32bit-csr.xml
@@ -248,4 +248,11 @@
   <reg name="mucounteren" bitsize="32"/>
   <reg name="mscounteren" bitsize="32"/>
   <reg name="mhcounteren" bitsize="32"/>
+  <reg name="vstart" bitsize="32"/>
+  <reg name="vxsat" bitsize="32"/>
+  <reg name="vxrm" bitsize="32"/>
+  <reg name="vcsr" bitsize="32"/>
+  <reg name="vl" bitsize="32"/>
+  <reg name="vtype" bitsize="32"/>
+  <reg name="vlenb" bitsize="32"/>
 </feature>
diff --git a/gdb-xml/riscv-64bit-csr.xml b/gdb-xml/riscv-64bit-csr.xml
index 90394562930..28a7c9a9f3a 100644
--- a/gdb-xml/riscv-64bit-csr.xml
+++ b/gdb-xml/riscv-64bit-csr.xml
@@ -248,4 +248,11 @@
   <reg name="mucounteren" bitsize="64"/>
   <reg name="mscounteren" bitsize="64"/>
   <reg name="mhcounteren" bitsize="64"/>
+  <reg name="vstart" bitsize="64"/>
+  <reg name="vxsat" bitsize="64"/>
+  <reg name="vxrm" bitsize="64"/>
+  <reg name="vcsr" bitsize="64"/>
+  <reg name="vl" bitsize="64"/>
+  <reg name="vtype" bitsize="64"/>
+  <reg name="vlenb" bitsize="64"/>
 </feature>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 49e78456422..bc3724d7ea0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -583,6 +583,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 #elif defined(TARGET_RISCV64)
     cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
 #endif
+    cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e3c0c750fb3..90c1c2af3b6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -113,6 +113,16 @@ FIELD(VTYPE, VEDIV, 8, 2)
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
@@ -301,6 +311,8 @@ struct RISCVCPU {
         bool pmp;
         uint64_t resetvec;
     } cfg;
+
+    DynamicGDBXMLInfo dyn_vreg_xml;
 };
 
 static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
@@ -510,6 +522,19 @@ typedef struct {
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
index f7c5212e274..2edcd558a7b 100644
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
@@ -351,6 +384,70 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
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
+
+    int csrno;
+    switch (n) {
+    case 32:
+        csrno = CSR_VSTART;
+        break;
+    case 33:
+        csrno = CSR_VXSAT;
+        break;
+    case 34:
+        csrno = CSR_VXRM;
+        break;
+    case 35:
+        csrno = CSR_VCSR;
+        break;
+    case 36:
+        csrno = CSR_VL;
+        break;
+    case 37:
+        csrno = CSR_VTYPE;
+        break;
+    case 38:
+        csrno = CSR_VLENB;
+        break;
+    default:
+        /* Unknown register. */
+        return 0;
+    }
+
+    target_ulong val = 0;
+
+    int result = riscv_csrrw_debug(env, csrno, &val, 0, 0);
+    if (result == 0) {
+        return gdb_get_regl(buf, val);
+    }
+
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
@@ -405,6 +502,66 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
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
+    /* Define vector CSRs */
+    const char *vector_csrs[7] = {
+        "vstart", "vxsat", "vxrm", "vcsr",
+        "vl", "vtype", "vlenb"
+    };
+
+    for (i = 0; i < 7; i++) {
+        g_string_append_printf(s,
+                               "<reg name=\"%s\" bitsize=\"%d\""
+                               " regnum=\"%d\" group=\"vector\""
+                               " type=\"int\"/>",
+                               vector_csrs[i], TARGET_LONG_BITS, base_reg++);
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
@@ -416,17 +573,33 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
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


