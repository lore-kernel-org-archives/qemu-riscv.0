Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D531EC4332F
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 13:51:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyuWA-0002Dt-Ki; Fri, 03 Nov 2023 09:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyuW6-0002Au-LC
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 09:47:19 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyuW4-0000ys-LE
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 09:47:18 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5a7af20c488so24469087b3.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 06:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699019236; x=1699624036; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8iIEsdoWWBOUqwWLUXjPf6AUaxyxfDNqu3ouuFotmnM=;
 b=huOHIEZYRlxcg9J/kyDfd23sGT6o7bhg8KMiRGId+S+0lkrJQfcitAEvMcuIpFCM6a
 UCXE9AZJORmdzh+f48BwieH7a1UaRJIT+2CyclI9L9RHjp55qQISpYWmpLuikrdT95fN
 w3npnGIjZopk9Uo8GlliJyobnx+8FwlNeA/x2ai8HEFIBQd7BtthNA7hSHRyeoGbyk5y
 aScTMs7YL1ZmDT0iRn+VYdmXwuunDUMYVAtJtUGBrwI/sHWNoid00mmQq4z6XhNu/we9
 j65BxyqlPi5Wa9iN1sXF8lcLuU+67RNAnFvVdDj1ubbgI9EV4GbRGzDLsZsF7TECnLsx
 Zt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699019236; x=1699624036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8iIEsdoWWBOUqwWLUXjPf6AUaxyxfDNqu3ouuFotmnM=;
 b=e4jO0uzKZ8ydMT6aOG045AGO3H2XiaZUmxLoNSTd8gr24vf9FMimrrYeW1pjEV/8v4
 EZKXPVR6rcz7vM16JrF5sFepaGSdr4HX4UmMssoPMrjJhb34l9UmWH0BlPysXLYI408N
 U9o57JqinfTTOozb9gvEKkQbc+ZXtSA/s9gbCKI85hq7j7rab90MroqafcWAgJT4EQ4g
 pNHyuT2DRHxYjxFE//+oPI6HjiqV3GLqLdRLx8nBWqREYZHs2irdRv7qVcFrSPIryxPQ
 IltMlw8KGgmdkuXF5nzWvmpBzGZmy8o2LoEN8nbkTYULJnrkm+wiFqWb27Jm0553rh2o
 r76g==
X-Gm-Message-State: AOJu0YwDsmYog8FdzQb815Hl9CrpHJ6BPEN1VWWp5xOs4l/aZHGEZgSU
 0a2GmcNyXSugsZY0sZRC0vIUTQ==
X-Google-Smtp-Source: AGHT+IGicLF57CrnBYN4+ikr7+UJmzRScxV2ikpOOPw86NAnbLQ9pFhF79BSiSGHCRcePPU3963u/w==
X-Received: by 2002:a0d:e6cb:0:b0:5a8:62f2:996a with SMTP id
 p194-20020a0de6cb000000b005a862f2996amr3135026ywe.6.1699019235735; 
 Fri, 03 Nov 2023 06:47:15 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 j68-20020a0df947000000b00582b239674esm935814ywf.129.2023.11.03.06.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 06:47:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 15/18] target/riscv/tcg: honor user choice for G MISA bits
Date: Fri,  3 Nov 2023 10:46:26 -0300
Message-ID: <20231103134629.561732-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231103134629.561732-1-dbarboza@ventanamicro.com>
References: <20231103134629.561732-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112c.google.com
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

RVG behaves like a profile: a single flag enables a set of bits. Right
now we're considering user choice when handling RVG and zicsr/zifencei
and ignoring user choice on MISA bits.

We'll add user warnings for profiles when the user disables its
mandatory extensions in the next patch. We'll do the same thing with RVG
now to keep consistency between RVG and profile handling.

First and foremost, create a new RVG only helper to avoid clogging
riscv_cpu_validate_set_extensions(). We do not want to annoy users with
RVG warnings like we did in the past (see 9b9741c38f), thus we'll only
warn if RVG was user set and the user disabled a RVG extension in the
command line.

For every RVG MISA bit (IMAFD), zicsr and zifencei, the logic then
becomes:

- if enabled, do nothing;
- if disabled and not user set, enable it;
- if disabled and user set, throw a warning that it's a RVG mandatory
  extension.

This same logic will be used for profiles in the next patch.

Note that this is a behavior change, where we would error out if the
user disabled either zicsr or zifencei. As long as users are explicitly
disabling things in the command line we'll let them have a go at it, at
least in this step. We'll error out later in the validation if needed.

Other notable changes from the previous RVG code:

- use riscv_cpu_write_misa_bit() instead of manually updating both
  env->misa_ext and env->misa_ext_mask;

- set zicsr and zifencei directly. We're already checking if they
  were user set and priv version will never fail for these
  extensions, making cpu_cfg_ext_auto_update() redundant.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/tcg/tcg-cpu.c | 73 +++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 25 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index dd9026c675..9c2469412b 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -42,6 +42,12 @@ static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
                                  GUINT_TO_POINTER(ext_offset));
 }
 
+static bool cpu_misa_ext_is_user_set(uint32_t misa_bit)
+{
+    return g_hash_table_contains(misa_ext_user_opts,
+                                 GUINT_TO_POINTER(misa_bit));
+}
+
 static void cpu_cfg_ext_add_user_opt(uint32_t ext_offset, bool value)
 {
     g_hash_table_insert(multi_ext_user_opts, GUINT_TO_POINTER(ext_offset),
@@ -340,6 +346,46 @@ static void riscv_cpu_validate_named_features(RISCVCPU *cpu)
     riscv_cpu_validate_zic64b(cpu);
 }
 
+static void riscv_cpu_validate_g(RISCVCPU *cpu)
+{
+    const char *warn_msg = "RVG mandates disabled extension %s";
+    uint32_t g_misa_bits[] = {RVI, RVM, RVA, RVF, RVD};
+    bool send_warn = cpu_misa_ext_is_user_set(RVG);
+
+    for (int i = 0; i < ARRAY_SIZE(g_misa_bits); i++) {
+        uint32_t bit = g_misa_bits[i];
+
+        if (riscv_has_ext(&cpu->env, bit)) {
+            continue;
+        }
+
+        if (!cpu_misa_ext_is_user_set(bit)) {
+            riscv_cpu_write_misa_bit(cpu, bit, true);
+            continue;
+        }
+
+        if (send_warn) {
+            warn_report(warn_msg, riscv_get_misa_ext_name(bit));
+        }
+    }
+
+    if (!cpu->cfg.ext_zicsr) {
+        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zicsr))) {
+            cpu->cfg.ext_zicsr = true;
+        } else if (send_warn) {
+            warn_report(warn_msg, "zicsr");
+        }
+    }
+
+    if (!cpu->cfg.ext_zifencei) {
+        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zifencei))) {
+            cpu->cfg.ext_zifencei = true;
+        } else if (send_warn) {
+            warn_report(warn_msg, "zifencei");
+        }
+    }
+}
+
 /*
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly.
@@ -349,31 +395,8 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
 
-    /* Do some ISA extension error checking */
-    if (riscv_has_ext(env, RVG) &&
-        !(riscv_has_ext(env, RVI) && riscv_has_ext(env, RVM) &&
-          riscv_has_ext(env, RVA) && riscv_has_ext(env, RVF) &&
-          riscv_has_ext(env, RVD) &&
-          cpu->cfg.ext_zicsr && cpu->cfg.ext_zifencei)) {
-
-        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zicsr)) &&
-            !cpu->cfg.ext_zicsr) {
-            error_setg(errp, "RVG requires Zicsr but user set Zicsr to false");
-            return;
-        }
-
-        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zifencei)) &&
-            !cpu->cfg.ext_zifencei) {
-            error_setg(errp, "RVG requires Zifencei but user set "
-                       "Zifencei to false");
-            return;
-        }
-
-        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zicsr), true);
-        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zifencei), true);
-
-        env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
-        env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
+    if (riscv_has_ext(env, RVG)) {
+        riscv_cpu_validate_g(cpu);
     }
 
     if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
-- 
2.41.0


