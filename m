Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A375AC61D85
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 18:53:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6Eo2-00089h-V9; Thu, 23 Nov 2023 13:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6Enu-0007zW-Cf
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 13:51:59 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6Enl-0008IM-Kf
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 13:51:53 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1cf897c8de1so7821565ad.0
 for <qemu-riscv@nongnu.org>; Thu, 23 Nov 2023 10:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700765507; x=1701370307; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i3asFkCX44dbueHLeyC5ZhzKDVitot3MIedZa9BHV1o=;
 b=HF01N+cJsvaYdDOmDSeeVGF18xfxjIXzUxhyVKOdUS7l7HwjEggcW916RdrhK0k3+c
 Q9CG8NMxzGN7viKzFoa8pZJMPvmRn54Nnd7XyAWn09hrXJb1KuSTxrsapmjrUg6kLHJR
 h+5CpEci6yCtCVEsQLcVRMP+caJMdiiItxCDInU8jJoU/+frQn4gaO0AcpoWwXLNRN+L
 11ZVCZ1MZ+R24dvh1TpyY3rud+2UqXmWtvj8/YCSj3z2dDO4I7NhjK833cYpA66j61PY
 av9h+Pz2M8QHiGLF/pE9zozEmfzhDOf84sY+1t/XFMW9V8TqmP1aFVYJ6nbbFxvfAda1
 LsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700765507; x=1701370307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i3asFkCX44dbueHLeyC5ZhzKDVitot3MIedZa9BHV1o=;
 b=m6t3XC/Awsa+auwneXI8k3JhRT6EBZ6F0IBhgVNfOVlkEP7hXsOxLoMB3SYPsnYqX/
 jUUBLzINdm1JDBSVzNFU+/RZDA8dSsugQs4c81zWmOi41QzZOMaA9sCfNrAIlSzh/q/8
 Oa+S73BtgZIUe76FqEgBveI7/QIVznQozV2a/tSsBnQldMt6iotZ3ncoBKJHYeceFvcg
 L+tcNmhD4n7Wr1NgH77aWcmxKLGxGJqmqOZIrXUznD+PyfXgvtksSnRwC0HrttKzRdXI
 9aVExJSmh1gPcTRkdigv/bNO+3+hE9niAdFbJnIH6xK5gYem8/bpg6iOWnNmRJDVVvn7
 xlgA==
X-Gm-Message-State: AOJu0Yzq4bpHNIPR9vpvfaaibvirviNQuDQgydRwpF3ukyir8Ayyl7Oq
 Zos59awYhYUsow+AOHA7AM2Bfg==
X-Google-Smtp-Source: AGHT+IGQKNaqcaiZMQfmtwuuOcm5/CsE8UoufuM4r0YqiTH3teG2ccmXxWhCQErzugSEdayymjVudQ==
X-Received: by 2002:a17:903:244e:b0:1ce:1892:2fa6 with SMTP id
 l14-20020a170903244e00b001ce18922fa6mr456527pls.0.1700765507359; 
 Thu, 23 Nov 2023 10:51:47 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a17090282c400b001bb1f0605b2sm1662638plz.214.2023.11.23.10.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 10:51:46 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v11 06/18] target/riscv/tcg: add 'zic64b' support
Date: Thu, 23 Nov 2023 15:51:10 -0300
Message-ID: <20231123185122.1100436-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123185122.1100436-1-dbarboza@ventanamicro.com>
References: <20231123185122.1100436-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x630.google.com
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
index 40c64581ec..8841052290 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1444,6 +1444,12 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
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
index d74b361be6..5fb4ca2324 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -767,6 +767,7 @@ typedef struct RISCVCPUMultiExtConfig {
 extern const RISCVCPUMultiExtConfig riscv_cpu_extensions[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
+extern const RISCVCPUMultiExtConfig riscv_cpu_named_features[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[];
 extern Property riscv_cpu_options[];
 
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index bd2ff87cc8..90f18eb601 100644
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
index d279314624..68577da8a8 100644
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
@@ -293,6 +310,18 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
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
@@ -657,6 +686,8 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    riscv_cpu_validate_named_features(cpu);
+
     if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
-- 
2.41.0


