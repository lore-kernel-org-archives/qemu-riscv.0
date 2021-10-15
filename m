Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHza-0004YE-5t
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzY-0004TK-Pk
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:51:00 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzW-0005Sk-Na
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:51:00 -0400
Received: by mail-pg1-x536.google.com with SMTP id d23so7856272pgh.8
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8EnvSBZj82lsga5PFI+SC6nCvGxzeS492+WxvMwhu9k=;
 b=aEdz9sIFsv0caeb8HZVbrB8psTqKogEFOy0chckn7z9cWdV1nOzIZaPEEHVUffbSJ6
 KHnWU73spSsx9p2i3fFH3HesQASTC2hDYULrqI3oRxs5yOkAWwSj4wxRnYroWqaf8g+3
 0+NVycsvGJ4kkvhF9BVsfO+a0ZP/NGHAE4BIEVL0ZcfLLE1J81RphaSnpLuiMVz8297U
 qjQKs+17t2lOz79qpK7gbEATLPH90QpAjfhxGj/qP/GnUGAJ85RFgwpevshPHVj7Zb0N
 HJHBYU13OKN6POTJkD+Supj/3gwWM8pQJF5WyXhsqhUpzNi5Ba+rFVsXN+VIuuQkZONG
 373Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8EnvSBZj82lsga5PFI+SC6nCvGxzeS492+WxvMwhu9k=;
 b=c02hbb0yz1mrgGEUyY2hJ0v/x4RUmn/euvhN9a2a7O0j0/Q9JDnkbF3Cj079HLY6mo
 FodS6CrjZ0Gg8sBQKz5bMYpJlrOlwOE6VmQ5yh5Lqv6GzDFnGUanDII5S8Stp3ezy+dN
 DO6AAZBvx5CLlpp2pxLfpHYB5gvfq/lmu3AWh7jDVUJBC7FC/XIMLAVuiknBKL1WDzHE
 kJvxA0cY7NeOZZsM6TPIVTXX2bqvUIU3f/Judwwyp9+qPWWEo6pwL7LG9UziXh0/azcr
 tO0nJqrw5305t9MK0F/qJ92zu8wkmEGV+bODWsiwEbbQtY2g80PVQm8pfEVZjL66ClvN
 hhog==
X-Gm-Message-State: AOAM531iKTu7aE1pYzsKSxxx/2U+YMN3UylPfk7XJ949EmjbvwHq3egJ
 BgaXKOPv73BSi7qLmJZ3/L/+7w==
X-Google-Smtp-Source: ABdhPJwqj64RLmpSmpiUwqsZb1kQggKnXCeZoCbJ1jp//Hc2hApKczmAYcMQAEg8fg3S4UzJOzKkiw==
X-Received: by 2002:a65:6389:: with SMTP id h9mr8061506pgv.83.1634284257490;
 Fri, 15 Oct 2021 00:50:57 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:50:56 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Hsiangkai Wang <kai.wang@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 69/78] target/riscv: gdb: support vector registers for rv64
 & rv32
Date: Fri, 15 Oct 2021 15:46:17 +0800
Message-Id: <20211015074627.3957162-77-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x536.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:51:01 -0000

From: Hsiangkai Wang <kai.wang@sifive.com>

Signed-off-by: Hsiangkai Wang <kai.wang@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c     |   2 +
 target/riscv/cpu.h     |   1 +
 target/riscv/gdbstub.c | 184 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 187 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 36448e61572..4d2ae445361 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -634,6 +634,8 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 
     if (strcmp(xmlname, "riscv-csr.xml") == 0) {
         return cpu->dyn_csr_xml;
+    } else if (strcmp(xmlname, "riscv-vector.xml") == 0) {
+        return cpu->dyn_vreg_xml;
     }
 
     return NULL;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 49eece111e2..7a18f539037 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -277,6 +277,7 @@ struct RISCVCPU {
     CPURISCVState env;
 
     char *dyn_csr_xml;
+    char *dyn_vreg_xml;
 
     /* Configuration Settings */
     struct {
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index a7a9c0b1fec..de764c1970e 100644
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
+    if (env->misa & RVV) {
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


