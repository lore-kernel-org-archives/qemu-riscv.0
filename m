Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E50C7EE2F
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 19:48:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q45JX-0006rQ-3a; Tue, 30 May 2023 15:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45JU-0006ps-VX
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:47:24 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45JT-0004My-8C
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:47:24 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-19eab8bca4dso4382851fac.0
 for <qemu-riscv@nongnu.org>; Tue, 30 May 2023 12:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685476042; x=1688068042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CrhzqizdTgnzqcguCNLILoS86odAFap96xtuLIlGjBs=;
 b=UJsF939TQoL/2clPmqmFLo8VziDSc1NGQD+siLVsM82DEI/4bd20XNn+vABDO9lKWw
 /VxYaisBeckJS4RcxmYIJJc9XHMWQtZGIagYJOPWIIDtfwnqDzaareM19yNwPzdrEUOW
 F5NfLqkI3M3ank8Ky/177ZP96vxiiYNLgp5yVbKk2IJ54VNfxYXWNGjFaK12OLAReDE2
 CObKHT/LrTZKpkbBOwuqwpSQt3s1vJxAmQf6DyvuiixHC9RHLiNKdDfU2LWHXTitYBFZ
 1eWXCyQujImW9KWi1WqPQx2P3TwoHjKkmVqAPMGXghTQJI4/bYfHEKTrtINLwq16YieM
 L0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685476042; x=1688068042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CrhzqizdTgnzqcguCNLILoS86odAFap96xtuLIlGjBs=;
 b=arfLE2K3ud3wii3JZY9wiPl6WpKZS1SheG5gtuoD61nikhaU958oQY81Pf1rN0EK1N
 QFBue4oVZkTTcKmJdjTeurMEpLsCJMFSOq0AU/nhqBaq/vLOrr4abjIQ/eqJeGzhgnqL
 9H39nX2Wl+tRk19nMqVIWRmgJlzRg5T5CbLs7g/p4kgxT1TuVoirVCRzR1XbbbmX6UkM
 PO8ntUIzlUhLQD+/kh3buQK3bPMeNW5WRqSTTaZDjtEdXoWeuUr1M1hooFAsYOUiDF/o
 q3fzd3xdobr7oxeQrP6ZbKdtsZDpEMJV7fFFcu+MlLJTzWZIRJgKbj5t1rkQlKL+2WoG
 WUnQ==
X-Gm-Message-State: AC+VfDzTYQ8Rb2du356yLZXX1uBSP92RLfF6kobMyZifsQMqB/SyvVxY
 gKeTECuHRVf81dALkBqdDD0Zyg==
X-Google-Smtp-Source: ACHHUZ5ONwqJ+gVY3AxB551xaCjyVjsFHr5BE8pmRrcI60ZEW1z0XwQdMWDXDNSqBEmJUuNHybFtUQ==
X-Received: by 2002:a05:6871:4044:b0:172:2d00:99f7 with SMTP id
 ky4-20020a056871404400b001722d0099f7mr2093104oab.20.1685476042287; 
 Tue, 30 May 2023 12:47:22 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (200-162-225-121.static-corp.ajato.com.br. [200.162.225.121])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a056870a48300b0019fa8728b05sm342214oal.39.2023.05.30.12.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:47:21 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 16/16] target/riscv/kvm.c: read/write (cbom|cboz)_blocksize in
 KVM
Date: Tue, 30 May 2023 16:46:23 -0300
Message-Id: <20230530194623.272652-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530194623.272652-1-dbarboza@ventanamicro.com>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

If we don't set a proper cbom_blocksize|cboz_blocksize in the FDT the
Linux Kernel will fail to detect the availability of the CBOM/CBOZ
extensions, regardless of the contents of the 'riscv,isa' DT prop.

The FDT is being written using the cpu->cfg.cbom|z_blocksize attributes,
so let's use them. We'll also expose them as user flags like it is
already done with TCG.

However, in contrast with what happens with TCG, the user is not able to
set any value that is different from the 'host' value. And KVM can be
harsh dealing with it: a ENOTSUPP can be thrown for the mere attempt of
executing kvm_set_one_reg() for these 2 regs.

We'll read the 'host' value and use it to set these values, regardless of
user choice. If the user happened to chose a different value, error out.
We'll also error out if we failed to read the block sizes.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm.c | 94 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 2 deletions(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 92b99fe261..7789d835e5 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -241,8 +241,16 @@ static void kvm_cpu_cfg_set(RISCVCPU *cpu, RISCVCPUMultiExtConfig *multi_ext,
                             uint32_t val)
 {
     int cpu_cfg_offset = multi_ext->cpu_cfg_offset;
-    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
+    uint16_t *blocksize;
+    bool *ext_enabled;
 
+    if (strstr(multi_ext->name, "blocksize")) {
+        blocksize = (void *)&cpu->cfg + cpu_cfg_offset;
+        *blocksize = val;
+        return;
+    }
+
+    ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
     *ext_enabled = val;
 }
 
@@ -250,8 +258,15 @@ static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
                                 RISCVCPUMultiExtConfig *multi_ext)
 {
     int cpu_cfg_offset = multi_ext->cpu_cfg_offset;
-    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
+    uint16_t *blocksize;
+    bool *ext_enabled;
 
+    if (strstr(multi_ext->name, "blocksize")) {
+        blocksize = (void *)&cpu->cfg + cpu_cfg_offset;
+        return *blocksize;
+    }
+
+    ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
     return *ext_enabled;
 }
 
@@ -295,6 +310,33 @@ static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
     kvm_cpu_cfg_set(cpu, multi_ext_cfg, value);
 }
 
+/*
+ * We'll avoid extra complexity by always assuming this
+ * array order with cbom first.
+ */
+static RISCVCPUMultiExtConfig kvm_cbomz_blksize_cfgs[] = {
+    {.name = "cbom_blocksize", .cpu_cfg_offset = CPUCFG(cbom_blocksize),
+     .kvm_reg_id = KVM_REG_RISCV_CONFIG_REG(zicbom_block_size)},
+    {.name = "cboz_blocksize", .cpu_cfg_offset = CPUCFG(cboz_blocksize),
+     .kvm_reg_id = KVM_REG_RISCV_CONFIG_REG(zicboz_block_size)},
+};
+
+static void kvm_cpu_set_cbomz_blksize(Object *obj, Visitor *v,
+                                      const char *name,
+                                      void *opaque, Error **errp)
+{
+    RISCVCPUMultiExtConfig *cbomz_size_cfg = opaque;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint16_t value;
+
+    if (!visit_type_uint16(v, name, &value, errp)) {
+        return;
+    }
+
+    cbomz_size_cfg->user_set = true;
+    kvm_cpu_cfg_set(cpu, cbomz_size_cfg, value);
+}
+
 static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
 {
     CPURISCVState *env = &cpu->env;
@@ -321,6 +363,45 @@ static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
     }
 }
 
+static void kvm_riscv_finalize_features(RISCVCPU *cpu, CPUState *cs)
+{
+    CPURISCVState *env = &cpu->env;
+    uint64_t id, reg;
+    int i, ret;
+
+    for (i = 0; i < ARRAY_SIZE(kvm_cbomz_blksize_cfgs); i++) {
+        RISCVCPUMultiExtConfig *cbomz_cfg = &kvm_cbomz_blksize_cfgs[i];
+        uint64_t host_val;
+
+        if ((i == 0 && !cpu->cfg.ext_icbom) ||
+            (i == 1 && !cpu->cfg.ext_icboz)) {
+            continue;
+        }
+
+        id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
+                              cbomz_cfg->kvm_reg_id);
+
+        ret = kvm_get_one_reg(cs, id, &host_val);
+        if (ret != 0) {
+            error_report("Unable to read KVM reg val %s, error %d",
+                         cbomz_cfg->name, ret);
+            exit(EXIT_FAILURE);
+        }
+
+        if (cbomz_cfg->user_set) {
+            reg = kvm_cpu_cfg_get(cpu, cbomz_cfg);
+            if (reg != host_val) {
+                error_report("Unable to set %s to a different value than "
+                             "the host (%lu)",
+                             cbomz_cfg->name, host_val);
+                exit(EXIT_FAILURE);
+            }
+        }
+
+        kvm_cpu_cfg_set(cpu, cbomz_cfg, host_val);
+    }
+}
+
 static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
 {
     int i;
@@ -344,6 +425,14 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
                             kvm_cpu_set_multi_ext_cfg,
                             NULL, multi_cfg);
     }
+
+    for (i = 0; i < ARRAY_SIZE(kvm_cbomz_blksize_cfgs); i++) {
+        RISCVCPUMultiExtConfig *cbomz_size_cfg = &kvm_cbomz_blksize_cfgs[i];
+
+        object_property_add(cpu_obj, cbomz_size_cfg->name, "uint16",
+                            NULL, kvm_cpu_set_cbomz_blksize,
+                            NULL, cbomz_size_cfg);
+    }
 }
 
 void kvm_riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
@@ -856,6 +945,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     kvm_riscv_update_cpu_misa_ext(cpu, cs);
     kvm_riscv_update_cpu_cfg_isa_ext(cpu, cs);
+    kvm_riscv_finalize_features(cpu, cs);
 
     return ret;
 }
-- 
2.40.1


