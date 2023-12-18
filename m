Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E5EC46CCD
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 12:56:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFD91-0003Ux-SU; Mon, 18 Dec 2023 07:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD90-0003T6-1i
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:54:50 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD8y-00050a-BS
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:54:49 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d39e2f1089so14571955ad.1
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 04:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702904087; x=1703508887; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t3VFZwYb5dz9aVP0OviCp/5GJ2siX/EWps6S1qNDtR4=;
 b=LbXcEkEGWNzyfys9icrzdQthqUCGmrwAOG6jQEg/Qa/B8Tdf8W/o7yNHpXuT+NEnh+
 WtV4LSi1N+7hquCNU8RU4gRgPs8GrE48yiQadptuATYAzT6awF3TKMW+CN1wJWZ1Ybcj
 /jiDW18N4XZfK8z+6xOwfhSx4ainMqsLmrFzqz56klhnvSaG4CbcTdJ5OvEvRZKgw5Qu
 C3QjOVW5AmglMLYbELPdLUD0VlOc9v5x9Gs5sWqUkssUxs7topAO49Rua6TLorCFuq16
 mbUFuZBpk4Q+uN6m/QAXbq1//FZfu/roX6W1vkpTMqUXgaIRyoYVlzqB2BXfzKWMGawS
 IZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702904087; x=1703508887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t3VFZwYb5dz9aVP0OviCp/5GJ2siX/EWps6S1qNDtR4=;
 b=um/V1StaMAZL7J5i0UjFz8z80+7dx6NsT93yi1d8kacW6iV6YFcHicDjsxZxezsCjt
 pqIym7Yo4IWXBhmkV5DOH+JExTRPpacjibCJTLb03qF3Z7sXypEK2TxpqK+yO+S6xags
 4kEzkEwLN53XDXtRFHiwJeGn8Q27ZfDHFTWXs2RkF+97uVDfwI9OVg16+Qehy0PGmRvH
 2OSpEPEgK5LdjExJYEfwpBNX8LEG/HCdWrRhMtQadH7nW+fXZ2Ww08BRnV1Sl16xim5o
 8rOeEKlyWJbF5+v17i+zsOYebJF2DekwRHAlKcOFdgyJAWS4ZQRY8Lj+0/EqYRpgNpwx
 Jxow==
X-Gm-Message-State: AOJu0YyUIHyn42Lbz0tuyZM5s1VcU8pc2iRbs/YhsLgGwzUVUCAbSnBT
 PsmDnl2hs34nmWBqUlz0/URP5A==
X-Google-Smtp-Source: AGHT+IHSImtwOWm7PlE0CdbZ8QxlwKjR567+jf+WQIxXHwdDU1FofJ6RZM6cNWA9rhcommR08PEz6g==
X-Received: by 2002:a17:902:c389:b0:1d3:ac9e:3074 with SMTP id
 g9-20020a170902c38900b001d3ac9e3074mr2090792plg.40.1702904087143; 
 Mon, 18 Dec 2023 04:54:47 -0800 (PST)
Received: from grind.. ([179.93.21.205]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170902848200b001d09c539c96sm7494897plo.229.2023.12.18.04.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 04:54:46 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v13 20/26] target/riscv: add priv ver restriction to profiles
Date: Mon, 18 Dec 2023 09:53:28 -0300
Message-ID: <20231218125334.37184-21-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218125334.37184-1-dbarboza@ventanamicro.com>
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
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

Some profiles, like RVA22S64, has a priv_spec requirement.

Make this requirement explicit for all profiles. We'll validate this
requirement finalize() time and, in case the user chooses an
incompatible priv_spec while activating a profile, a warning will be
shown.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c         |  1 +
 target/riscv/cpu.h         |  2 ++
 target/riscv/tcg/tcg-cpu.c | 31 +++++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a76bc1b86a..1ba85c6d1c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1537,6 +1537,7 @@ Property riscv_cpu_options[] = {
 static RISCVCPUProfile RVA22U64 = {
     .name = "rva22u64",
     .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVU,
+    .priv_spec = RISCV_PROFILE_ATTR_UNUSED,
     .ext_offsets = {
         CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
         CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5ff629650d..1f34eda1e4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,10 +81,12 @@ typedef struct riscv_cpu_profile {
     uint32_t misa_ext;
     bool enabled;
     bool user_set;
+    int priv_spec;
     const int32_t ext_offsets[];
 } RISCVCPUProfile;
 
 #define RISCV_PROFILE_EXT_LIST_END -1
+#define RISCV_PROFILE_ATTR_UNUSED -1
 
 extern RISCVCPUProfile *riscv_profiles[];
 
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index e395e2449e..4d25fc43d2 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -74,6 +74,20 @@ static void riscv_cpu_write_misa_bit(RISCVCPU *cpu, uint32_t bit,
     }
 }
 
+static const char *cpu_priv_ver_to_str(int priv_ver)
+{
+    switch (priv_ver) {
+    case PRIV_VERSION_1_10_0:
+        return "v1.10.0";
+    case PRIV_VERSION_1_11_0:
+        return "v1.11.0";
+    case PRIV_VERSION_1_12_0:
+        return "v1.12.0";
+    }
+
+    g_assert_not_reached();
+}
+
 static void riscv_cpu_synchronize_from_tb(CPUState *cs,
                                           const TranslationBlock *tb)
 {
@@ -755,11 +769,24 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 static void riscv_cpu_validate_profile(RISCVCPU *cpu,
                                        RISCVCPUProfile *profile)
 {
+    CPURISCVState *env = &cpu->env;
     const char *warn_msg = "Profile %s mandates disabled extension %s";
     bool send_warn = profile->user_set && profile->enabled;
     bool profile_impl = true;
     int i;
 
+    if (profile->priv_spec != RISCV_PROFILE_ATTR_UNUSED &&
+        profile->priv_spec != env->priv_ver) {
+        profile_impl = false;
+
+        if (send_warn) {
+            warn_report("Profile %s requires priv spec %s, "
+                        "but priv ver %s was set", profile->name,
+                        cpu_priv_ver_to_str(profile->priv_spec),
+                        cpu_priv_ver_to_str(env->priv_ver));
+        }
+    }
+
     for (i = 0; misa_bits[i] != 0; i++) {
         uint32_t bit = misa_bits[i];
 
@@ -1048,6 +1075,10 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
     profile->user_set = true;
     profile->enabled = value;
 
+    if (profile->enabled) {
+        cpu->env.priv_ver = profile->priv_spec;
+    }
+
     for (i = 0; misa_bits[i] != 0; i++) {
         uint32_t bit = misa_bits[i];
 
-- 
2.43.0


