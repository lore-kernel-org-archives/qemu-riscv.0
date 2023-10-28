Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB2CC27C47
	for <qemu-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 08:56:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qwf68-0000rM-JN; Sat, 28 Oct 2023 04:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qwf64-0000au-MB
 for qemu-riscv@nongnu.org; Sat, 28 Oct 2023 04:55:08 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qwf62-0004Mf-JW
 for qemu-riscv@nongnu.org; Sat, 28 Oct 2023 04:55:08 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5afabb23900so12892927b3.2
 for <qemu-riscv@nongnu.org>; Sat, 28 Oct 2023 01:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698483305; x=1699088105; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xw8m+vfwr7mtXc1jkEURl0DYI0nE52UXZym6cV79T38=;
 b=XDbigLM1+5i8WmAbOQQ6+CDZ6wk9zRwAV0GGdgd3ppDOgIgwbCyrCGhxDxGdTw3dAQ
 EPDoInh58jWDkWMkm83ZqnBl2P/gSGEK7kQba9xXKbmbwnbC3QcPI2Ke0AStTf3Hc3Wn
 r7Rnh9pXVlZJWBddLDc71oPFF9Tv9+2iUOVWZvgVnlDFzZMfKLwTMjLFZArIG7SHtyqa
 4cerBXp0+J7SOTT5Hl3NjVaMHWux9nlTNTXxx9Ogx2yTNMPx1QcMnHZYodk7kKtTgF4w
 7ROyW039Ee9szE6igjZmH1NiwiFwtPzx3rHST1+xAmMT3wDLHjSV6ffhmKjJ0G1mRMP8
 BSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698483305; x=1699088105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xw8m+vfwr7mtXc1jkEURl0DYI0nE52UXZym6cV79T38=;
 b=LSs0exYhmILP6p3uysxx6qCckRa8hB8jT2XJZmd/zvb9/R/6GPkNYL4+3iErsmXNSI
 233cU8L/Fudf6RKaRAWroTI18V7FHT9LE+1HYl+4J1k1yj6F5SjsVT43+eTGjd6PN2um
 HNGvnmuian8lrEr5KmagmOwjWok0ail0xBE1NMvbohSLGQY/nMd7bfVt+aKU95DKmeTa
 YnAs2AfnHU8DbaxAwJzUH8wFx6szOFa1BNdlp/5iFQtdLCov1zNrTq5IB0zjYC8Pp73O
 20YWvXzFikYyTjxK89ptEfyr0E7FZ/h1+Pd5Q+kqG/PcswunBSN4QPwVsJbqi+YWAKxi
 lhCQ==
X-Gm-Message-State: AOJu0YztarwWKjRXsmPFJm+88RIDKpbTKaprPniedsP85G7LP2AqF+2I
 kK5meQLStui4k2hIgI0Z6ss/LQ==
X-Google-Smtp-Source: AGHT+IHxBq0nPFpzJVsrGjk4rQW2YyvFjjeEvDekJy33EJANOq8xXndhJzdwVulKuHekidT5LDy3zw==
X-Received: by 2002:a05:690c:f13:b0:5a7:d133:370d with SMTP id
 dc19-20020a05690c0f1300b005a7d133370dmr6267262ywb.16.1698483305696; 
 Sat, 28 Oct 2023 01:55:05 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.2.33])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a81830f000000b00594fff48796sm1604325ywf.75.2023.10.28.01.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 01:55:05 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 11/12] target/riscv/tcg: honor user choice for G MISA bits
Date: Sat, 28 Oct 2023 05:54:26 -0300
Message-ID: <20231028085427.707060-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231028085427.707060-1-dbarboza@ventanamicro.com>
References: <20231028085427.707060-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 target/riscv/tcg/tcg-cpu.c | 73 +++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 25 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 3a96b1f476..953e8432d6 100644
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
@@ -303,6 +309,46 @@ static void riscv_cpu_validate_named_features(RISCVCPU *cpu)
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
@@ -312,31 +358,8 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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


