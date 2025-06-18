Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64FBC7115A
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 21:36:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uS0Rk-00078i-K4; Wed, 18 Jun 2025 17:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vliaskovitis@suse.com>)
 id 1uS0Rj-00078T-Qr
 for qemu-riscv@nongnu.org; Wed, 18 Jun 2025 17:35:51 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vliaskovitis@suse.com>)
 id 1uS0Rh-0002Kg-DM
 for qemu-riscv@nongnu.org; Wed, 18 Jun 2025 17:35:51 -0400
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so1278415e9.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Jun 2025 14:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1750282547; x=1750887347; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/dtP/wPX6YaIMdCs/d+V0dG8onDo592JRn8CaOwFdRE=;
 b=LjMf07mnQkC0mpTQaYo5e5GHSrQsNi3jg9CaahrMpSlzvtB4gCXGPj8NqKOhwEWIsb
 eucmj729rmJQ0Awf0N/rdffIe7NpWpPm0rMO87Sw2ZMjOlxGWdfuL2Owty8Rwhe7Ycts
 4WXFIpVA186O5MXdEiuYxpY2SQomMo6no6nsCm7q7ZWslBIwpomxqbXEvrbaYuADqkzj
 60EjHjm8ildyUIbwJbLocvWppN85vXaIyw9TK4vgEr6vp0OnL8KqfrV+MJJmLXZfJiZ6
 brLcZaJ0Ak/GsnUkxqfFoHuBoavHrZ5ET2Ol8nCgM1eo6liFF26crmzgyeY4XLdZAlNP
 EVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750282547; x=1750887347;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/dtP/wPX6YaIMdCs/d+V0dG8onDo592JRn8CaOwFdRE=;
 b=PIQh4UVDxdobsFgnXMJK3NW7HlklcYzZIPYxXbWO5YBZbVZG048cVY+tFSGCZhedhR
 WhOnalMu7ypcR59hnmtztnDqq4MPmoIholOXzEnlpOZxh7GU2EVJ5bofEkienNuox1l0
 5Eo1e9yOKxMZGxCyCV1WxaCGg1mGRauBHmzmBzn5Eo1aqB0H8+wIvJpDmAl+7UgVKPC0
 TK6KNS3pvfmxBaqvT8khROlUh8t9oOTT031urdPguz+o0CXEr2TjB0mqu2+7v/D3LA1k
 /j9QPJVJuOis45wf3tq8lX54QahZwYHSTZlvJ5ObUj+6PxihmkBSYcT5gH/Bs9zdy3lo
 ipFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc5x7/13TsEEK+1FLQC6nqUGg1qfZcxUGqwU+JNJ9XHEmeeOovI2ZLPNPVLSsGwXvr7svmQcmKOGNl@nongnu.org
X-Gm-Message-State: AOJu0YyyBCUbIBC6QvaTFHH2Kaln5PF2ponxk+l2t9SYaI+gcMSUM/iU
 5yJMnk77mSNf6Wcmmg1oVRY0ntmC7IL9bbAFawUq18MJzqu3zCJpOZG7EuA5vfHtbHvyfjQDTrr
 EPYrnHt0j1g==
X-Gm-Gg: ASbGncvWXcLTFq9kaDKSyxl8GxG/j7Kb7W/9XoYuueYs2xmVFFWKKvSffMLc42Q8Z3B
 yXBSfiA4lojce//bIgvKSSI2EnIo8pzXB4t5b8BXZ3tQYt7Rxg4Ap3YhqdCgDJmx38xziUG64+x
 CyCmQc1zocFnGzAD7UlmUn5wDvgJI2pb0z06yNksQgxl/6t7paYqKmrBEc3cGFYeVGXxzMCYvG2
 HJlT++UD6K8qkIK/EzcI3VFMpijbti2vIWO7+7WACcRB56DxEJs7pAHS+RNlwP2PNL3Gg86kqZO
 rc0tm3id4v/BD/fDbK31IkYQV9cr9KddLaq/Otf63Cd9dEGW/4c42sMAfelxuL4=
X-Google-Smtp-Source: AGHT+IHfH0POiYdvqSbXnwEmTQeAnbr0JF1o2eOxl1YFcuUpQBicPPFXHBAyv3Lk1ylYejIBYr7GYA==
X-Received: by 2002:a05:600c:1d06:b0:450:c20d:64c3 with SMTP id
 5b1f17b1804b1-4533caad17fmr184569945e9.18.1750282547173; 
 Wed, 18 Jun 2025 14:35:47 -0700 (PDT)
Received: from localhost ([2a02:587:4b09:8700:f50f:b7ef:31a4:1163])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4535e982dd5sm8296275e9.12.2025.06.18.14.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 14:35:46 -0700 (PDT)
From: Vasilis Liaskovitis <vliaskovitis@suse.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, ajones@ventanamicro.com,
 alistair.francis@wdc.com, philmd@linaro.org,
 Vasilis Liaskovitis <vliaskovitis@suse.com>
Subject: [PATCH v2] target/riscv: Add a property to set vill bit on reserved
 usage of vsetvli instruction
Date: Wed, 18 Jun 2025 23:35:42 +0200
Message-ID: <20250618213542.22873-1-vliaskovitis@suse.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=vliaskovitis@suse.com; helo=mail-wm1-x341.google.com
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

Usage of vsetvli instruction is reserved if VLMAX is changed when vsetvli rs1
and rd arguments are x0.

In this case, if the new property is true, only the vill bit will be set.

See https://github.com/riscv/riscv-isa-manual/blob/main/src/v-st-ext.adoc#avl-encoding
According to the spec, the above use cases are reserved, and
"Implementations may set vill in either case."

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2422
Signed-off-by: Vasilis Liaskovitis <vliaskovitis@suse.com>
---
 target/riscv/cpu.c                      |  1 +
 target/riscv/cpu_cfg_fields.h.inc       |  1 +
 target/riscv/helper.h                   |  2 +-
 target/riscv/insn_trans/trans_rvv.c.inc |  4 ++--
 target/riscv/vector_helper.c            | 12 +++++++++++-
 5 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 629ac37501..1c29ed3b2b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2595,6 +2595,7 @@ static const Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
     DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
     DEFINE_PROP_BOOL("rvv_vl_half_avl", RISCVCPU, cfg.rvv_vl_half_avl, false),
+    DEFINE_PROP_BOOL("rvv_vsetvl_x0_vill", RISCVCPU, cfg.rvv_vsetvl_x0_vill, false),
 
     /*
      * write_misa() is marked as experimental for now so mark
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index 59f134a419..9c78a797cf 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -114,6 +114,7 @@ BOOL_FIELD(ext_supm)
 BOOL_FIELD(rvv_ta_all_1s)
 BOOL_FIELD(rvv_ma_all_1s)
 BOOL_FIELD(rvv_vl_half_avl)
+BOOL_FIELD(rvv_vsetvl_x0_vill)
 /* Named features  */
 BOOL_FIELD(ext_svade)
 BOOL_FIELD(ext_zic64b)
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 85d73e492d..f712b1c368 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -159,7 +159,7 @@ DEF_HELPER_FLAGS_3(hyp_hsv_d, TCG_CALL_NO_WG, void, env, tl, tl)
 #endif
 
 /* Vector functions */
-DEF_HELPER_3(vsetvl, tl, env, tl, tl)
+DEF_HELPER_4(vsetvl, tl, env, tl, tl, tl)
 DEF_HELPER_5(vle8_v, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vle16_v, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vle32_v, void, ptr, ptr, tl, env, i32)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 2b6077ac06..87071c5d62 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -202,7 +202,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
         s1 = get_gpr(s, rs1, EXT_ZERO);
     }
 
-    gen_helper_vsetvl(dst, tcg_env, s1, s2);
+    gen_helper_vsetvl(dst, tcg_env, s1, s2, tcg_constant_tl((int) (rd == 0 && rs1 == 0)));
     gen_set_gpr(s, rd, dst);
     finalize_rvv_inst(s);
 
@@ -222,7 +222,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
 
     dst = dest_gpr(s, rd);
 
-    gen_helper_vsetvl(dst, tcg_env, s1, s2);
+    gen_helper_vsetvl(dst, tcg_env, s1, s2, tcg_constant_tl(0));
     gen_set_gpr(s, rd, dst);
     finalize_rvv_inst(s);
     gen_update_pc(s, s->cur_insn_len);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 5dc1c10012..b41c29da0b 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -35,7 +35,7 @@
 #include <math.h>
 
 target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
-                            target_ulong s2)
+                            target_ulong s2, target_ulong x0)
 {
     int vlmax, vl;
     RISCVCPU *cpu = env_archcpu(env);
@@ -83,6 +83,16 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     } else {
         vl = vlmax;
     }
+
+    if (cpu->cfg.rvv_vsetvl_x0_vill && x0 && (env->vl != vl)) {
+        /* only set vill bit. */
+        env->vill = 1;
+        env->vtype = 0;
+        env->vl = 0;
+        env->vstart = 0;
+        return 0;
+    }
+
     env->vl = vl;
     env->vtype = s2;
     env->vstart = 0;
-- 
2.46.0


