Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E61C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 20:46:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyI2u-0002hx-51; Wed, 01 Nov 2023 16:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyI2t-0002fq-BI
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 16:42:35 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyI2r-0000hI-8x
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 16:42:35 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-d9c687f83a2so189126276.3
 for <qemu-riscv@nongnu.org>; Wed, 01 Nov 2023 13:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698871352; x=1699476152; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vg8TWqLJuWdWqnDA43cqj104JxPxDzhD4xhOykP5PPE=;
 b=RMfUug+/Rc0/6/3Pg0oYmuR7znHjtxTWyAb7OgUvdJbb98W81xQY0n6NxoKErfyzZY
 cvEWKP6ocxCKARRDkNSxpja8G9L3HzmPaWnl20fNNdDQue63uAze5m3C45vrke+1A8oK
 yTpR1v940KKHpFelAa4JDmPCinIJcEG2GOC0tTtscN44zbWIsERzquBJHe2ezDzPY9pa
 SmqazwxC/UvIm6PjKxnPBiXU0hTTQYeBvASJu/8Ap12u/sF9CUOghM7x4cHtLNHiqAZe
 m1UmssslSkOrqzwPvAtfhGOBJDHkdhd5CqUQ0yu+GcjITtffUPQTWeSO3PzG1AD/0AXt
 7zPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698871352; x=1699476152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vg8TWqLJuWdWqnDA43cqj104JxPxDzhD4xhOykP5PPE=;
 b=rrwLkJEN+cBWZkxdm9TqRkZdDcv9t218xksS1BGsLIZm8uJ/DvM99/OmUHIj7p6oZc
 F/gWEns8DJujNXR+GWG71pW9P/AEXVCpCmIby63X+pnjwowBV6vPs99H04F5tohkrj9S
 w6/JOdXqUmdFeZOoQ7rVmOAznImEnq84dycwAewunOiXo+oNR+nIMVmlDZcsqgZdavWK
 iz+vnmFlUrA8QOD0QnZDcnZTDr0PIfGpNL0NxILqNrXcwGucKDctGPvfHyy9fn/zLVEU
 3PbohTfJflq73EMYNAU0lGQrWAUuNcLuVPlAZwlT06mGcrzQt86W6DaP3+p86kMj6z87
 PADg==
X-Gm-Message-State: AOJu0YxSBHGluIuvvmaXFE4XAl5I27JiLxGj6KJUCsTenpgIfy3jmjoJ
 vFdKgNXt6OgDBYLVvhw4/Q57Uw==
X-Google-Smtp-Source: AGHT+IHlDhuyzYBRLlmjEsIqdTP1KCHApUVLjBaOnEhjOo/hkbPM+TA6nH0bXdF2I7m6oHeXCDlwOA==
X-Received: by 2002:a25:aaae:0:b0:d9a:5666:7ab5 with SMTP id
 t43-20020a25aaae000000b00d9a56667ab5mr18039594ybi.10.1698871352399; 
 Wed, 01 Nov 2023 13:42:32 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 z187-20020a2533c4000000b00d9cc49edae9sm329724ybz.63.2023.11.01.13.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 13:42:32 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 08/19] target/riscv/tcg: add 'zic64b' support
Date: Wed,  1 Nov 2023 17:41:53 -0300
Message-ID: <20231101204204.345470-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101204204.345470-1-dbarboza@ventanamicro.com>
References: <20231101204204.345470-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yb1-xb2b.google.com
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

zic64b is defined in the RVA22U64 profile [1] as a named feature for
"Cache blocks must be 64 bytes in size, naturally aligned in the address
space". It's a fantasy name for 64 bytes cache blocks. The RVA22U64
profile mandates this feature, meaning that applications using this
profile expects 64 bytes cache blocks.

To make the upcoming RVA22U64 implementation complete, we'll zic64b as
a 'named feature', not a regular extension. This means that:

- it won't be exposed to users;
- it won't be written in riscv,isa.

This will be extended to other named extensions in the future, so we're
creating some common boilerplate for them as well.

zic64b is default to 'true' since we're already using 64 bytes blocks.
If any cache block size (cbo{m,p,z}_blocksize) is changed to something
different than 64, zic64b is set to 'false'.

Our profile implementation will then be able to check the current state
of zic64b and take the appropriate action (e.g. throw a warning).

[1] https://github.com/riscv/riscv-profiles/releases/download/v1.0/profiles.pdf

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c         |  6 ++++++
 target/riscv/cpu.h         |  1 +
 target/riscv/cpu_cfg.h     |  1 +
 target/riscv/tcg/tcg-cpu.c | 31 +++++++++++++++++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 92807f5324..c7c09c1f7c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1427,6 +1427,12 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+const RISCVCPUMultiExtConfig riscv_cpu_named_features[] = {
+    MULTI_EXT_CFG_BOOL("zic64b", zic64b, true),
+
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 /* Deprecated entries marked for future removal */
 const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[] = {
     MULTI_EXT_CFG_BOOL("Zifencei", ext_zifencei, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8efc4d83ec..bf12f34082 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -745,6 +745,7 @@ typedef struct RISCVCPUMultiExtConfig {
 extern const RISCVCPUMultiExtConfig riscv_cpu_extensions[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
+extern const RISCVCPUMultiExtConfig riscv_cpu_named_features[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[];
 extern Property riscv_cpu_options[];
 
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 2203b4c45b..f61a8434c4 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -108,6 +108,7 @@ struct RISCVCPUConfig {
     bool ext_smepmp;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
+    bool zic64b;
 
     uint32_t mvendorid;
     uint64_t marchid;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index b88fce98a4..a577cd795a 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -114,6 +114,19 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
     g_assert_not_reached();
 }
 
+static bool cpu_cfg_offset_is_named_feat(uint32_t ext_offset)
+{
+    const RISCVCPUMultiExtConfig *feat;
+
+    for (feat = riscv_cpu_named_features; feat->name != NULL; feat++) {
+        if (feat->offset == ext_offset) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
 static void cpu_validate_multi_ext_priv_ver(CPURISCVState *env,
                                             uint32_t ext_offset)
 {
@@ -123,6 +136,10 @@ static void cpu_validate_multi_ext_priv_ver(CPURISCVState *env,
         return;
     }
 
+    if (cpu_cfg_offset_is_named_feat(ext_offset)) {
+        return;
+    }
+
     ext_priv_ver = cpu_cfg_ext_get_min_version(ext_offset);
 
     if (env->priv_ver < ext_priv_ver) {
@@ -280,6 +297,18 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
     }
 }
 
+static void riscv_cpu_validate_zic64b(RISCVCPU *cpu)
+{
+    cpu->cfg.zic64b = cpu->cfg.cbom_blocksize == 64 &&
+                      cpu->cfg.cbop_blocksize == 64 &&
+                      cpu->cfg.cboz_blocksize == 64;
+}
+
+static void riscv_cpu_validate_named_features(RISCVCPU *cpu)
+{
+    riscv_cpu_validate_zic64b(cpu);
+}
+
 /*
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly.
@@ -602,6 +631,8 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    riscv_cpu_validate_named_features(cpu);
+
     if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
-- 
2.41.0


