Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E45BC4167D
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 22:46:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qygR5-0006RC-1Y; Thu, 02 Nov 2023 18:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygR2-0006QE-R3
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:08 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygR0-0003Ho-If
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:08 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5b383b4184fso18135527b3.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 15:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698965105; x=1699569905; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2U3cH+LAAq3k8DDXflF8NQSmZTp10gRR1f8jG2ykAU0=;
 b=L/FXuMu5txLoxg5IrEGYAIv/qGbvy+JsWUf70rXGmPCKetXipM+zCH+fKCeLRf9ZnF
 NsV05Cv5qSA6SpkN3gRqjF3FRLKC+jQPlGhGj+YMAzGlt4bWXldxK8YsKkNvAQnauFv3
 e/X5rWmSOOeD2rm+8fvQxPgTD7wrch29DMdirGqgm2JdnyyPBl23qaigwJpII4kvsDF8
 R39IVpkq+vCmG0wtX1cDADMXv78JKvGzbCMwdsyBVOJXSbNZJwQf3DnXpzutOr7ydV6F
 0/0s0EuJXT5gVbWn/4sYfmsRcJjlxUlhPiripyM38mFANnt2VhPvY00TdMPR1TZvu9E2
 Fyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698965105; x=1699569905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2U3cH+LAAq3k8DDXflF8NQSmZTp10gRR1f8jG2ykAU0=;
 b=RBjbHyWtn8frULIECscyx7rkbY7rSVaBmUKgxSVWgeIRnXT3YWLmIdc23Kw2sgLgNX
 1SZmmmXNZpVh13kLp2CcLpiU4LJlWU/IUwIfcMkDpT8QchUeoneSEFMmhz4zMlF+6hO/
 CJNwFObcBs4250xb6TZM82ri8hm+UjxgV82uzcTadmiqGi7ujcOk+b7jXIrtwJKI/XbJ
 pjtBV0H5rSOpscYCPrWte8P2SAMm+EgiB9DO0yl8VBZxL4bw/0mPKqJwPLw6oQu/p3Hl
 kdUnp2PvQ6sjfeF7LslxBk9sBYweJ/mkNcEWyX+qQXvOdtkAec1Xe1tuU+KWEBR8bsSv
 rElg==
X-Gm-Message-State: AOJu0Yw90quQwI+A3yhiImRhuNDczwQwzUrggit4/x5RPDva8uaGPnTE
 a/fFsPrFVx2Q6edl0FytWa6Mhw==
X-Google-Smtp-Source: AGHT+IHGGLFeclynXxAQ+YoVMo2itxuvX6ZMra83M2zzidJCCSXje8w80O+MhXuqRLrhwOHIESnb3A==
X-Received: by 2002:a0d:d811:0:b0:59f:b0d9:5df2 with SMTP id
 a17-20020a0dd811000000b0059fb0d95df2mr1031371ywe.0.1698965105592; 
 Thu, 02 Nov 2023 15:45:05 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 ce10-20020a05690c098a00b0059b24bd4f2asm259523ywb.57.2023.11.02.15.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:45:05 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 06/19] target/riscv/tcg: add 'zic64b' support
Date: Thu,  2 Nov 2023 19:44:32 -0300
Message-ID: <20231102224445.527355-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102224445.527355-1-dbarboza@ventanamicro.com>
References: <20231102224445.527355-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1135.google.com
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
index 057dd3d186..4b92f320e0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1448,6 +1448,12 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
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
index c21e4bcc47..414c4eba77 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -116,6 +116,7 @@ struct RISCVCPUConfig {
     bool ext_smepmp;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
+    bool zic64b;
 
     uint32_t mvendorid;
     uint64_t marchid;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 0e684ab86f..b0f69c6437 100644
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
@@ -644,6 +673,8 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    riscv_cpu_validate_named_features(cpu);
+
     if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
-- 
2.41.0


