Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o632A-0005sl-Mt
	for mharc-qemu-riscv@gnu.org; Tue, 28 Jun 2022 00:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o6323-0005pm-TM
 for qemu-riscv@nongnu.org; Tue, 28 Jun 2022 00:41:00 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o6321-0006V6-Uk
 for qemu-riscv@nongnu.org; Tue, 28 Jun 2022 00:40:59 -0400
Received: by mail-pl1-x635.google.com with SMTP id jh14so10022955plb.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Jun 2022 21:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jXsfoRJoFy8eowC34vbywLaVEMgoFF/TBBpgUmrTXTM=;
 b=NndlNJGxL25IBiHANsSU4qVXqfAlWUderYjtioEiSYe2Y9OlG5px4bUVACZ9Gq7MGt
 TSYDNzW/4OaY9JWARkkBxrDKrN1aPJXxtMV1SD6/K1JmFPfmJeTon/gYQB9dX1BkanG3
 GNYLvhdYzB+gjpcBa6RZD3XrlkWv47b9MQ6IUKchi/V+cjcWKJqU4yXzws/3Y1O6xeRG
 87ijFSbIKJXJ+ah1uHKobzehtW9ridjHCToBzBTSEtO4mYPDUIiif4yvw9jw9RFVli1+
 a2qZMBk7RTWZGpzEIo5FNBf+O7nO+o6Y89M2lCKJVzuIDa60LWS0l+KYE/Ab1OfAenur
 vXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jXsfoRJoFy8eowC34vbywLaVEMgoFF/TBBpgUmrTXTM=;
 b=3py0CM5iEq8fsEw+yjR8IdRKxuRMH7kXGG2y3w4TMfVVLagRt+osnxk7iKGsTOv0KX
 mr+LI2SBypSwjOe54gGt3qPdMHPQm2w+OP6MoGUaeVCXjHCRK2kHl32rp/KsaUPQZUEc
 2ADA28FufoRINLoJBaMs+URHsB4lz+GF9sBznvvXf4QxHK/Ce7pvSR3eeDgrbNsHtaKV
 vxyykuwUEnD1D84eI4N9AGfkPActcvmK8heEMlpDAgyL/H/tucLT1prTope3kvhwZzYD
 XCqMkN+Zeagb+NZLtGtWZBakJGsx3F+TLR+LgSkc/s6u2MStqGDvqtewZPp85X1GiN2o
 y7Eg==
X-Gm-Message-State: AJIora8i/43Zkuv5qRWd2oMUm1a096GsP7ek3wVrdNmgkrPhsMmd03F6
 g1pvsV7KzrJyyNvddjM9sMUYSg==
X-Google-Smtp-Source: AGRyM1t5x5nP9mEfob4+gm3azQlbLpBqio7bbjomgPSFXqIyuqZOvN3Mv/r9eDgQcIFD/uH/mxpN5w==
X-Received: by 2002:a17:90a:6396:b0:1ec:f52d:90db with SMTP id
 f22-20020a17090a639600b001ecf52d90dbmr20167872pjj.52.1656391257164; 
 Mon, 27 Jun 2022 21:40:57 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([117.96.230.192])
 by smtp.gmail.com with ESMTPSA id
 q62-20020a17090a17c400b001ece6f492easm10284001pja.44.2022.06.27.21.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:40:56 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Rahul Pathak <rpathak@ventanamicro.com>
Subject: [PATCH v7 4/4] target/riscv: Force disable extensions if priv spec
 version does not match
Date: Tue, 28 Jun 2022 10:10:28 +0530
Message-Id: <20220628044028.659704-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628044028.659704-1-apatel@ventanamicro.com>
References: <20220628044028.659704-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Jun 2022 04:41:01 -0000

We should disable extensions in riscv_cpu_realize() if minimum required
priv spec version is not satisfied. This also ensures that machines with
priv spec v1.11 (or lower) cannot enable H, V, and various multi-letter
extensions.

Fixes: a775398be2e9 ("target/riscv: Add isa extenstion strings to the device tree")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
---
 target/riscv/cpu.c | 150 ++++++++++++++++++++++++++++-----------------
 1 file changed, 94 insertions(+), 56 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4e7ca6cd4a..9bc4ef0685 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -43,9 +43,82 @@ static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 
 struct isa_ext_data {
     const char *name;
-    bool enabled;
+    bool multi_letter;
+    int min_version;
+    int ext_enable_offset;
 };
 
+#define ISA_EXT_DATA_ENTRY(_name, _m_letter, _min_ver, _prop) \
+{#_name, _m_letter, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
+
+/**
+ * Here are the ordering rules of extension naming defined by RISC-V
+ * specification :
+ * 1. All extensions should be separated from other multi-letter extensions
+ *    by an underscore.
+ * 2. The first letter following the 'Z' conventionally indicates the most
+ *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
+ *    If multiple 'Z' extensions are named, they should be ordered first
+ *    by category, then alphabetically within a category.
+ * 3. Standard supervisor-level extensions (starts with 'S') should be
+ *    listed after standard unprivileged extensions.  If multiple
+ *    supervisor-level extensions are listed, they should be ordered
+ *    alphabetically.
+ * 4. Non-standard extensions (starts with 'X') must be listed after all
+ *    standard extensions. They must be separated from other multi-letter
+ *    extensions by an underscore.
+ */
+static const struct isa_ext_data isa_edata_arr[] = {
+    ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
+    ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
+    ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
+    ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
+    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_12_0, ext_zfh),
+    ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
+    ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
+    ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
+    ISA_EXT_DATA_ENTRY(zba, true, PRIV_VERSION_1_12_0, ext_zba),
+    ISA_EXT_DATA_ENTRY(zbb, true, PRIV_VERSION_1_12_0, ext_zbb),
+    ISA_EXT_DATA_ENTRY(zbc, true, PRIV_VERSION_1_12_0, ext_zbc),
+    ISA_EXT_DATA_ENTRY(zbkb, true, PRIV_VERSION_1_12_0, ext_zbkb),
+    ISA_EXT_DATA_ENTRY(zbkc, true, PRIV_VERSION_1_12_0, ext_zbkc),
+    ISA_EXT_DATA_ENTRY(zbkx, true, PRIV_VERSION_1_12_0, ext_zbkx),
+    ISA_EXT_DATA_ENTRY(zbs, true, PRIV_VERSION_1_12_0, ext_zbs),
+    ISA_EXT_DATA_ENTRY(zk, true, PRIV_VERSION_1_12_0, ext_zk),
+    ISA_EXT_DATA_ENTRY(zkn, true, PRIV_VERSION_1_12_0, ext_zkn),
+    ISA_EXT_DATA_ENTRY(zknd, true, PRIV_VERSION_1_12_0, ext_zknd),
+    ISA_EXT_DATA_ENTRY(zkne, true, PRIV_VERSION_1_12_0, ext_zkne),
+    ISA_EXT_DATA_ENTRY(zknh, true, PRIV_VERSION_1_12_0, ext_zknh),
+    ISA_EXT_DATA_ENTRY(zkr, true, PRIV_VERSION_1_12_0, ext_zkr),
+    ISA_EXT_DATA_ENTRY(zks, true, PRIV_VERSION_1_12_0, ext_zks),
+    ISA_EXT_DATA_ENTRY(zksed, true, PRIV_VERSION_1_12_0, ext_zksed),
+    ISA_EXT_DATA_ENTRY(zksh, true, PRIV_VERSION_1_12_0, ext_zksh),
+    ISA_EXT_DATA_ENTRY(zkt, true, PRIV_VERSION_1_12_0, ext_zkt),
+    ISA_EXT_DATA_ENTRY(zve32f, true, PRIV_VERSION_1_12_0, ext_zve32f),
+    ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
+    ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
+    ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
+    ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
+    ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
+    ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
+};
+
+static bool isa_ext_is_enabled(RISCVCPU *cpu,
+                               const struct isa_ext_data *edata)
+{
+    bool *ext_enabled = (void *)&cpu->cfg + edata->ext_enable_offset;
+
+    return *ext_enabled;
+}
+
+static void isa_ext_update_enabled(RISCVCPU *cpu,
+                                   const struct isa_ext_data *edata, bool en)
+{
+    bool *ext_enabled = (void *)&cpu->cfg + edata->ext_enable_offset;
+
+    *ext_enabled = en;
+}
+
 const char * const riscv_int_regnames[] = {
   "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
   "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
@@ -530,7 +603,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     CPUClass *cc = CPU_CLASS(mcc);
-    int priv_version = -1;
+    int i, priv_version = -1;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -558,6 +631,23 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         set_priv_version(env, priv_version);
     }
 
+    /* Force disable extensions if priv spec version does not match */
+    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
+        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
+            (env->priv_ver < isa_edata_arr[i].min_version)) {
+            isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
+#ifndef CONFIG_USER_ONLY
+            warn_report("disabling %s extension for hart 0x%lx because "
+                        "privilege spec version does not match",
+                        isa_edata_arr[i].name, (unsigned long)env->mhartid);
+#else
+            warn_report("disabling %s extension because "
+                        "privilege spec version does not match",
+                        isa_edata_arr[i].name);
+#endif
+        }
+    }
+
     if (cpu->cfg.mmu) {
         riscv_set_feature(env, RISCV_FEATURE_MMU);
     }
@@ -1049,67 +1139,15 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
-
 static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
 {
     char *old = *isa_str;
     char *new = *isa_str;
     int i;
 
-    /**
-     * Here are the ordering rules of extension naming defined by RISC-V
-     * specification :
-     * 1. All extensions should be separated from other multi-letter extensions
-     *    by an underscore.
-     * 2. The first letter following the 'Z' conventionally indicates the most
-     *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
-     *    If multiple 'Z' extensions are named, they should be ordered first
-     *    by category, then alphabetically within a category.
-     * 3. Standard supervisor-level extensions (starts with 'S') should be
-     *    listed after standard unprivileged extensions.  If multiple
-     *    supervisor-level extensions are listed, they should be ordered
-     *    alphabetically.
-     * 4. Non-standard extensions (starts with 'X') must be listed after all
-     *    standard extensions. They must be separated from other multi-letter
-     *    extensions by an underscore.
-     */
-    struct isa_ext_data isa_edata_arr[] = {
-        ISA_EDATA_ENTRY(zicsr, ext_icsr),
-        ISA_EDATA_ENTRY(zifencei, ext_ifencei),
-        ISA_EDATA_ENTRY(zmmul, ext_zmmul),
-        ISA_EDATA_ENTRY(zfh, ext_zfh),
-        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
-        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
-        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
-        ISA_EDATA_ENTRY(zba, ext_zba),
-        ISA_EDATA_ENTRY(zbb, ext_zbb),
-        ISA_EDATA_ENTRY(zbc, ext_zbc),
-        ISA_EDATA_ENTRY(zbkb, ext_zbkb),
-        ISA_EDATA_ENTRY(zbkc, ext_zbkc),
-        ISA_EDATA_ENTRY(zbkx, ext_zbkx),
-        ISA_EDATA_ENTRY(zbs, ext_zbs),
-        ISA_EDATA_ENTRY(zk, ext_zk),
-        ISA_EDATA_ENTRY(zkn, ext_zkn),
-        ISA_EDATA_ENTRY(zknd, ext_zknd),
-        ISA_EDATA_ENTRY(zkne, ext_zkne),
-        ISA_EDATA_ENTRY(zknh, ext_zknh),
-        ISA_EDATA_ENTRY(zkr, ext_zkr),
-        ISA_EDATA_ENTRY(zks, ext_zks),
-        ISA_EDATA_ENTRY(zksed, ext_zksed),
-        ISA_EDATA_ENTRY(zksh, ext_zksh),
-        ISA_EDATA_ENTRY(zkt, ext_zkt),
-        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
-        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
-        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
-        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
-        ISA_EDATA_ENTRY(svinval, ext_svinval),
-        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
-        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
-    };
-
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_edata_arr[i].enabled) {
+        if (isa_edata_arr[i].multi_letter &&
+            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.34.1


