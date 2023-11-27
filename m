Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D531C0755A
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 11:38:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r7ZwG-0003pj-7t; Mon, 27 Nov 2023 06:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r7ZwF-0003pM-6n
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 06:38:07 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r7ZwD-0005GP-FV
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 06:38:06 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6d7eb7ff384so2693399a34.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Nov 2023 03:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1701085084; x=1701689884; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dGNqscTm0j47pNh5vB1J02Wn8NgcJ09lbo8OaJQCkt0=;
 b=okmEcH04fRHdKvmeVgga+gfgEMNxdoPI+kpEcfR38/CpS75Xwk7xz8/efhZxrWOvxr
 yGwkLizcqAHCo1IJysQZSQ/jSqsKjui5JD7t+Xk2mbr5QV4Ve5USCbtiL5gGKtCvuWkw
 wlpj8VjPGR5iKeRr7PRGIPQgk2A8ffClOhhtlX0woXHBNTDv43jjNrBK2uCvNbGzdDld
 LKFmCOolpzcEhAe9gl9HgxnfEH72XBB5cinp9UC5L9qOGeT4FQWgRTeWeyQ+uFLPsYj4
 O3xDC7q8GqnbaW+tjusYqTqLSnEopfYz2aKTyg3o7KsqvCFMGz8cpC9ShJdOsxuvmAm0
 1nRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701085084; x=1701689884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dGNqscTm0j47pNh5vB1J02Wn8NgcJ09lbo8OaJQCkt0=;
 b=Pmm+gIsvA9k70U9fhdfY8EYckYMZWxkIm+4bo5TWNpdFs+PN2CGyL+WbaRCcxGOc9K
 2a4/Ui12V77Xpew6BO/l28NfGUOCltd0f9vsGzr8p3cUSy8V39kmrXz5E7YMwmboNKFm
 4+3VQrX67nWubNLJmSpnoPzd79ZEoPYfkqWAR6HKZ0TpWU3W3ApSd1B+A2FCIErQyo2u
 grWXUaJrG7FINpVlfsFOpKjrIL5QN5I336n+goW1nMhuvxpz7qTwoOYp7p+5wXjitdfZ
 PuBVsS9kkht1801CEqOPNaksGTBW7AfHUbuoRxRgMusGXuxGsvzqYK6mPYepAOSrNi8+
 JcHA==
X-Gm-Message-State: AOJu0YxhuwnZesWg/9Vk3i299+Uw8K1Jfll9slgty+AOepNy+TFqkMK8
 XpWSPN9JNwXPl54bW5YEy8qaHg==
X-Google-Smtp-Source: AGHT+IFO4nub4CFKBoScddwqgyPE6APX3r3t2ZJRaunzsq6VUBtg+zRYPgER0EHbQVKKLXXtv0mLkg==
X-Received: by 2002:a9d:6c90:0:b0:6ce:2789:7195 with SMTP id
 c16-20020a9d6c90000000b006ce27897195mr11117799otr.31.1701085084503; 
 Mon, 27 Nov 2023 03:38:04 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a63e94f000000b00578b40a4903sm7618323pgj.22.2023.11.27.03.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 03:38:04 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v2 2/8] target/riscv: add priv ver restriction to
 profiles
Date: Mon, 27 Nov 2023 08:37:46 -0300
Message-ID: <20231127113752.1290265-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
References: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32a.google.com
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
---
 target/riscv/cpu.c         |  1 +
 target/riscv/cpu.h         |  2 ++
 target/riscv/tcg/tcg-cpu.c | 31 +++++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 59b131c1fc..29a9f77702 100644
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
2.41.0


