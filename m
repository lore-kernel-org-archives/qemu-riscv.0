Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mccZD-0004fD-4M
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 20:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZB-0004cn-Bu
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:17 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:42889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZ6-0001c0-7c
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:15 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso1253706pjb.1
 for <qemu-riscv@nongnu.org>; Mon, 18 Oct 2021 17:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ur4NYkKvb4IwfCVRQ66xGSUcq2q0ktl5nOkYZP/fju8=;
 b=Lw+0xg2BsoNfCVm3hNJS+cG2SBZjjs3TAxsdAXW1unLolldclQTMvVzXB7lhO+x587
 zN4iCH1Xu1Cd+mnY86hukVpNLYwQKXZDy879SQdZVA/kq33U9X4H4H7xkxBlUeHLMMF5
 BMioFc8dHY/DS8OrPd14jm/w6ubKHi6658p7rRLXkXXFa/BLo7Vf1nXZumAwIghiSyJI
 +YW2ldDOEJZFv/tVphPsIrKAdSGUWhAS+XlULINftazRmoKyoPb78AXxyOC3WgxlxRrH
 2LjayybZwtiJ1Ug/5MDUYCQ8Vi/rAU90ztSE/PLDY+8FF+uDYajmG+iKC4WYpIoYveuN
 fCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ur4NYkKvb4IwfCVRQ66xGSUcq2q0ktl5nOkYZP/fju8=;
 b=WACgk5tcqTPEuaETnAqQrWOjRzJUEwGETziV6wm2IVbk/qZvajqE6/7l7MLGs6Qv8S
 AuPc+kgUqRReIXnn0agAZscWbCLsL7YWdzUTQ7xcYU/j4GkCfxq2EOduzmzYoC1UVAn7
 /h4qm4MFYNz1yc4FA2BhMAKTZy4Gvk8S4/2ek9ljO+7PwoVCwharMlXnPGzCLMa17itA
 DLMA+QaldM8acZZ/rRqF4+9xDfy/jZfl64CMqnXj25coc4kL57pLy1k4Q6Tcfeq9MghF
 jfNSg+fTQh1gVFMbt9J4AoqC/Loo53EhY9wpj2i7Pnb+isA4RvLEyzc/iBQNhAUB5w6F
 GXKQ==
X-Gm-Message-State: AOAM531taROZKUW80xphLm8V7Z6+kpEGBU4Jak0nkfbNLAui0lQGf8wa
 Ei/emwhX+ddebI/4TwX7z82aAlIDnQQ=
X-Google-Smtp-Source: ABdhPJxSYMuulN56wP/5pfqyTImksY/zhaLqFcgTiSMl9D5fR0Rr6T3TZf/JRnvgzT2304sDBnwKPw==
X-Received: by 2002:a17:902:7616:b0:13f:354a:114f with SMTP id
 k22-20020a170902761600b0013f354a114fmr31104803pll.8.1634601670165; 
 Mon, 18 Oct 2021 17:01:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v4 01/16] target/riscv: Move cpu_get_tb_cpu_state out of line
Date: Mon, 18 Oct 2021 17:00:53 -0700
Message-Id: <20211019000108.3678724-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019000108.3678724-1-richard.henderson@linaro.org>
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Oct 2021 00:01:17 -0000

Move the function to cpu_helper.c, as it is large and growing.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h        | 47 ++-------------------------------------
 target/riscv/cpu_helper.c | 46 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 45 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9e55b2f5b1..7084efc452 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -413,51 +413,8 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
     return cpu->cfg.vlen >> (sew + 3 - lmul);
 }
 
-static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
-                                        target_ulong *cs_base, uint32_t *pflags)
-{
-    uint32_t flags = 0;
-
-    *pc = env->pc;
-    *cs_base = 0;
-
-    if (riscv_has_ext(env, RVV)) {
-        uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
-        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl);
-        flags = FIELD_DP32(flags, TB_FLAGS, VILL,
-                    FIELD_EX64(env->vtype, VTYPE, VILL));
-        flags = FIELD_DP32(flags, TB_FLAGS, SEW,
-                    FIELD_EX64(env->vtype, VTYPE, VSEW));
-        flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
-                    FIELD_EX64(env->vtype, VTYPE, VLMUL));
-        flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
-    } else {
-        flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
-    }
-
-#ifdef CONFIG_USER_ONLY
-    flags |= TB_FLAGS_MSTATUS_FS;
-#else
-    flags |= cpu_mmu_index(env, 0);
-    if (riscv_cpu_fp_enabled(env)) {
-        flags |= env->mstatus & MSTATUS_FS;
-    }
-
-    if (riscv_has_ext(env, RVH)) {
-        if (env->priv == PRV_M ||
-            (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
-            (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
-                get_field(env->hstatus, HSTATUS_HU))) {
-            flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
-        }
-
-        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
-                           get_field(env->mstatus_hs, MSTATUS_FS));
-    }
-#endif
-
-    *pflags = flags;
-}
+void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
+                          target_ulong *cs_base, uint32_t *pflags);
 
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d41d5cd27c..14d1d3cb72 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -35,6 +35,52 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #endif
 }
 
+void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
+                          target_ulong *cs_base, uint32_t *pflags)
+{
+    uint32_t flags = 0;
+
+    *pc = env->pc;
+    *cs_base = 0;
+
+    if (riscv_has_ext(env, RVV)) {
+        uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
+        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl);
+        flags = FIELD_DP32(flags, TB_FLAGS, VILL,
+                    FIELD_EX64(env->vtype, VTYPE, VILL));
+        flags = FIELD_DP32(flags, TB_FLAGS, SEW,
+                    FIELD_EX64(env->vtype, VTYPE, VSEW));
+        flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
+                    FIELD_EX64(env->vtype, VTYPE, VLMUL));
+        flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
+    } else {
+        flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
+    }
+
+#ifdef CONFIG_USER_ONLY
+    flags |= TB_FLAGS_MSTATUS_FS;
+#else
+    flags |= cpu_mmu_index(env, 0);
+    if (riscv_cpu_fp_enabled(env)) {
+        flags |= env->mstatus & MSTATUS_FS;
+    }
+
+    if (riscv_has_ext(env, RVH)) {
+        if (env->priv == PRV_M ||
+            (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
+            (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
+                get_field(env->hstatus, HSTATUS_HU))) {
+            flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
+        }
+
+        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
+                           get_field(env->mstatus_hs, MSTATUS_FS));
+    }
+#endif
+
+    *pflags = flags;
+}
+
 #ifndef CONFIG_USER_ONLY
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
-- 
2.25.1


