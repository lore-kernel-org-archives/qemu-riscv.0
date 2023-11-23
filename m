Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68D8C5AD4C
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 19:16:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6FB9-0000Aw-5o; Thu, 23 Nov 2023 14:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6FB8-0008Vf-0t
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 14:15:58 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6FB5-0003nu-BB
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 14:15:56 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1cf6a67e290so8980465ad.1
 for <qemu-riscv@nongnu.org>; Thu, 23 Nov 2023 11:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700766954; x=1701371754; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F3cAPK7POkxyDf86f2CZfhfjK5yQaCv5kDXzXsqfuNk=;
 b=lggOLv4q8nS0YJofNpPH8OaEEHr3YkP08YWE+TjoLxVfjx0ZotIozHONc2Dsn3wANd
 XPV3zDGoMpW47bjW9TKG1Io+L2sXvl77AC43UqbAlfmFeJZDFus6Sg2og6AcF5KEBIsM
 zpj3e24OzXykWvUVpTHzhFEimi/PtOPX0TeTCk3tsikYEluESIutw+vDB1Y1eolBuGYB
 dBo/gsCTcvu723TA4470y9g1r4grDi2FrDop1GoFiQgG3ORS8j96DWybbwBtxtmRRgiM
 pqQ3lPV5tae7JmrX4d5RHx/rxkQEg6BBjUnqQTM6XVZaIE2KhpGFzplHMbHCmTL0x2ot
 EzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700766954; x=1701371754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F3cAPK7POkxyDf86f2CZfhfjK5yQaCv5kDXzXsqfuNk=;
 b=HpUukHx5f3P4fVcU3ceIOMZJVoGZbc3Y8Ri0W3BOo7WGrl1uAHhS5qb0VWReWs/YNY
 3HrFSGRvUKpt+UZoghql0udqPvlPL0Dx7lk2Nf5iAxICXJGLHwvAm7J0UUxPDnlKshBj
 nRF3fojNl5KO6zWEx+/MPKwkl3X/ip5SaZTN5P0VO9kRsqeFj7XL0/jtmcPlEV8Dq7IC
 ob87RvOqkPialHoM6k5Xk/dvQ1RNzrLQQ1T0fSgB5zqx16KbQBgNXtOnc+XTgBpWhAaK
 S0Ozg4ewKUp0J01rhdzcjnb/oAK73taiOAxwkb7fxNN31X5lDTwhfH9BowL8ACL7M9Zn
 soQA==
X-Gm-Message-State: AOJu0YwQ06edHx6UIzSBe9bjWDNmHYTEhI7iiNP32dMXnuXo5BNsNmJu
 mn/ZHmQigNj0qRYlq9Vi1zQ2jR5Soxf9/455nOQ=
X-Google-Smtp-Source: AGHT+IF2zaRM69vieJYmziac3Wmy9Y01txIclsVs38rEJB4TKnnzzgD/hkGvIefladLrvjK5M9zXLA==
X-Received: by 2002:a17:903:4282:b0:1c9:faef:5765 with SMTP id
 ju2-20020a170903428200b001c9faef5765mr416652plb.5.1700766954048; 
 Thu, 23 Nov 2023 11:15:54 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902eed500b001bc21222e34sm1680760plb.285.2023.11.23.11.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 11:15:53 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 5/7] target/riscv: add satp_mode profile support
Date: Thu, 23 Nov 2023 16:15:30 -0300
Message-ID: <20231123191532.1101644-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123191532.1101644-1-dbarboza@ventanamicro.com>
References: <20231123191532.1101644-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
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

'satp_mode' is a requirement for supervisor profiles like RVA22S64.
User-mode/application profiles like RVA22U64 doesn't care.

Add 'satp_mode' to the profile description. If a profile requires it,
set it during cpu_set_profile(). We'll also check it during finalize()
to validate if the running config implements the profile.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         |  1 +
 target/riscv/cpu.h         |  1 +
 target/riscv/tcg/tcg-cpu.c | 41 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2b79fe861b..a77118549b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1543,6 +1543,7 @@ static RISCVCPUProfile RVA22U64 = {
     .name = "rva22u64",
     .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVU,
     .priv_spec = RISCV_PROFILE_ATTR_UNUSED,
+    .satp_mode = RISCV_PROFILE_ATTR_UNUSED,
     .ext_offsets = {
         CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
         CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 485d2da3c2..6c5fceb5f5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -82,6 +82,7 @@ typedef struct riscv_cpu_profile {
     bool enabled;
     bool user_set;
     int priv_spec;
+    int satp_mode;
     const int32_t ext_offsets[];
 } RISCVCPUProfile;
 
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index a26cc6f093..8cfab26915 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -775,6 +775,31 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     riscv_cpu_disable_priv_spec_isa_exts(cpu);
 }
 
+#ifndef CONFIG_USER_ONLY
+static bool riscv_cpu_validate_profile_satp(RISCVCPU *cpu,
+                                            RISCVCPUProfile *profile,
+                                            bool send_warn)
+{
+    int satp_max = satp_mode_max_from_map(cpu->cfg.satp_mode.supported);
+
+    if (profile->satp_mode > satp_max) {
+        if (send_warn) {
+            bool is_32bit = riscv_cpu_is_32bit(cpu);
+            const char *req_satp = satp_mode_str(profile->satp_mode, is_32bit);
+            const char *cur_satp = satp_mode_str(satp_max, is_32bit);
+
+            warn_report("Profile %s requires satp mode %s, "
+                        "but satp mode %s was set", profile->name,
+                        req_satp, cur_satp);
+        }
+
+        return false;
+    }
+
+    return true;
+}
+#endif
+
 static void riscv_cpu_validate_profile(RISCVCPU *cpu,
                                        RISCVCPUProfile *profile)
 {
@@ -784,6 +809,13 @@ static void riscv_cpu_validate_profile(RISCVCPU *cpu,
     bool profile_impl = true;
     int i;
 
+#ifndef CONFIG_USER_ONLY
+    if (profile->satp_mode != RISCV_PROFILE_ATTR_UNUSED) {
+        profile_impl = riscv_cpu_validate_profile_satp(cpu, profile,
+                                                       send_warn);
+    }
+#endif
+
     if (profile->priv_spec != env->priv_ver) {
         profile_impl = false;
 
@@ -1083,10 +1115,19 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
     profile->user_set = true;
     profile->enabled = value;
 
+
     if (profile->enabled) {
         cpu->env.priv_ver = profile->priv_spec;
     }
 
+#ifndef CONFIG_USER_ONLY
+    if (profile->satp_mode != RISCV_PROFILE_ATTR_UNUSED) {
+        const char *satp_prop = satp_mode_str(profile->satp_mode,
+                                              riscv_cpu_is_32bit(cpu));
+        object_property_set_bool(obj, satp_prop, profile->enabled, NULL);
+    }
+#endif
+
     for (i = 0; misa_bits[i] != 0; i++) {
         uint32_t bit = misa_bits[i];
 
-- 
2.41.0


