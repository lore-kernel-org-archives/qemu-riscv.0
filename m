Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX3K-0005du-Ct
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:10:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX3I-0005XY-MB
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:10:00 -0500
Received: from [2607:f8b0:4864:20::635] (port=35676
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX3G-0000vf-Dw
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:10:00 -0500
Received: by mail-pl1-x635.google.com with SMTP id b13so11015717plg.2
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dlo8zODwLvmCFZA3m1FDSB4n5vdns79JzyY3iXEFfv0=;
 b=cr+t1Q8zdeqXUP4Rz1p2WG86GtzqaBTMaru6eVLO0VH2WpKftcCINcc2kjR6q60IMg
 mhftTm0TV9mvR+5rN7hh/b/FKkCpoeOGC/X8e7wClaMQTEs0hvFTIc7VCrITaIevpCNe
 v983gmOT+2rzOr/MxTfQ1kWVv7A6lAaSJYM8GXF/QvJgEh/CB5Kd2UmTHLCp8dWUrtKr
 oACtdAoOGu5l6t+hOCwewm+PQ1MTGlLptDiLpo7cpc/8ave7ISTqdWBoRndVpoyuqMXt
 IRCqSNctGHYSbdcQOgBjufeXRLhoF5oOVD5mwqze6DxR92jK7OjbSOZNGZzpuZXL7ZYh
 G2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dlo8zODwLvmCFZA3m1FDSB4n5vdns79JzyY3iXEFfv0=;
 b=GCuVOcgndm+xrSjmGdRAN0hf2eJurBXQqlCYtcrqzVxdCfbtRsNfktVMNZ7qf/QBpe
 cjYNLMziS4DCHz/MUmPLWpt44MNULBWNCjufnfy2m4ixIlf31rVX/3sWEnH0NsosapBx
 A38UxW7zjDJqJLA0Jg6mg/JKF9M33gmNPV43lAc9Ff2irQ4hLdtak2P6/JIr6XGQJ7SG
 yA97ZfDYiC9Vmxw7hcZANeSKI/vzH5RctZqID49j710u8TD3nJumGPyH3VQZSfrR+74O
 2jBD0XjkyoIcZfOJOtVWkjFtACqhlZiaEoIk47FxvuzFQFIyRCdk//iWJLnyqjyglUgS
 i0Kw==
X-Gm-Message-State: AOAM533oYP6YGv2R/Qf9O1Y8Smc0qeVPoy4mgE+KKHofBnr/PmnK2p58
 GOIIn6nZ1jYNu0PHMbo+eqXM2A==
X-Google-Smtp-Source: ABdhPJzaLtHjXY5I54n9Qhyr7NxQ+t7FFWAhMyCmvtrLNqp3i5Lmz0byLUWPd1e2/ZogqZDm+CjThg==
X-Received: by 2002:a17:90b:4b89:: with SMTP id
 lr9mr34765426pjb.49.1638155397198; 
 Sun, 28 Nov 2021 19:09:57 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:09:56 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Hsiangkai Wang <kai.wang@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 68/77] target/riscv: gdb: support vector registers for
 rv64 & rv32
Date: Mon, 29 Nov 2021 11:03:28 +0800
Message-Id: <20211129030340.429689-69-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:10:01 -0000

From: Hsiangkai Wang <kai.wang@sifive.com>

Signed-off-by: Hsiangkai Wang <kai.wang@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c     |   2 +
 target/riscv/cpu.h     |   1 +
 target/riscv/gdbstub.c | 184 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 187 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c760ea08621..860f356bd99 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -675,6 +675,8 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 
     if (strcmp(xmlname, "riscv-csr.xml") == 0) {
         return cpu->dyn_csr_xml;
+    } else if (strcmp(xmlname, "riscv-vector.xml") == 0) {
+        return cpu->dyn_vreg_xml;
     }
 
     return NULL;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5d93ccdfa71..dc10f27093b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -291,6 +291,7 @@ struct RISCVCPU {
     CPURISCVState env;
 
     char *dyn_csr_xml;
+    char *dyn_vreg_xml;
 
     /* Configuration Settings */
     struct {
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 23429179e2e..881ab333924 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -20,6 +20,32 @@
 #include "exec/gdbstub.h"
 #include "cpu.h"
 
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
+};
+
 int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
@@ -101,6 +127,96 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
+/*
+ * Convert register index number passed by GDB to the correspond
+ * vector CSR number. Vector CSRs are defined after vector registers
+ * in dynamic generated riscv-vector.xml, thus the starting register index
+ * of vector CSRs is 32.
+ * Return 0 if register index number is out of range.
+ */
+static int riscv_gdb_vector_csrno(int num_regs)
+{
+    /*
+     * The order of vector CSRs in the switch case
+     * should match with the order defined in csr_ops[].
+     */
+    switch (num_regs) {
+    case 32:
+        return CSR_VSTART;
+    case 33:
+        return CSR_VXSAT;
+    case 34:
+        return CSR_VXRM;
+    case 35:
+        return CSR_VCSR;
+    case 36:
+        return CSR_VL;
+    case 37:
+        return CSR_VTYPE;
+    case 38:
+        return CSR_VLENB;
+    default:
+        /* Unknown register. */
+        return 0;
+    }
+}
+
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
+    int csrno = riscv_gdb_vector_csrno(n);
+
+    if (!csrno) {
+        return 0;
+    }
+
+    target_ulong val = 0;
+    int result = riscv_csrrw_debug(env, csrno, &val, 0, 0);
+
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
+
+    int csrno = riscv_gdb_vector_csrno(n);
+
+    if (!csrno) {
+        return 0;
+    }
+
+    target_ulong val = ldtul_p(mem_buf);
+    int result = riscv_csrrw_debug(env, csrno, NULL, val, -1);
+
+    if (result == 0) {
+        return sizeof(target_ulong);
+    }
+
+    return 0;
+}
+
 static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
 {
     if (n < CSR_TABLE_SIZE) {
@@ -187,6 +303,68 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
     return CSR_TABLE_SIZE;
 }
 
+static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    GString *s = g_string_new(NULL);
+    g_autoptr(GString) ts = g_string_new("");
+    int reg_width = cpu->cfg.vlen;
+    int num_regs = 0;
+    int i;
+
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
+        num_regs++;
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
+        num_regs++;
+    }
+
+    g_string_append_printf(s, "</feature>");
+
+    cpu->dyn_vreg_xml = g_string_free(s, false);
+    return num_regs;
+}
+
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
@@ -198,6 +376,12 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
                                  36, "riscv-32bit-fpu.xml", 0);
     }
+    if (env->misa_ext & RVV) {
+        gdb_register_coprocessor(cs, riscv_gdb_get_vector, riscv_gdb_set_vector,
+                                 ricsv_gen_dynamic_vector_xml(cs,
+                                                              cs->gdb_num_regs),
+                                 "riscv-vector.xml", 0);
+    }
 #if defined(TARGET_RISCV32)
     gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
                              1, "riscv-32bit-virtual.xml", 0);
-- 
2.25.1


