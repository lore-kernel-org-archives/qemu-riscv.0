Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcqyy-0004wE-2x
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 11:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyr-0004lL-F2
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 11:24:46 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyo-0007Sd-6Q
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 11:24:45 -0400
Received: by mail-pl1-x636.google.com with SMTP id s1so12086077plg.12
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 08:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ur4NYkKvb4IwfCVRQ66xGSUcq2q0ktl5nOkYZP/fju8=;
 b=mDeCoX00cF4NTV/f1IQTb6N1EdKjmgcRY/IdoRiiz8WNve5tk8AGlIlwyfr2FkTAjK
 9iUIOPHWCvE3xzoF18ibWnK7+UyXxijekwMR+YG34il+rBRrmuk0LOOyoTh0Nq7BKGMP
 8EVTrObFM+a/5mwcVZF3GJEiPlsWyQ3uT/DVS7O3eliTgMsik0rf2ibnedl+ojd35bZx
 ZWAdI0HNyNkz6MGPLtUklh99n6NSpSEOVTgVDTeYtjcFFlUAdxOK1Pp4roip/jTGdrsX
 mBptRk99fq5/jeJkGpTRq2bCGM0O6lFzaFuPBgsmyQaewqwvez8Za5GzcQlbNi5Bm4+D
 EKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ur4NYkKvb4IwfCVRQ66xGSUcq2q0ktl5nOkYZP/fju8=;
 b=JseEPPXwhli9fpCSjZozAceoc/mfYAsMAcdoVR2jgHojJnr76cX5TZdLK/VPpwXG8U
 BvqeV+bvnY3XosBc7Y/9At6jPg4i25wzEo0dkRkWDvz/cy+sxTDdJ4JVOrMFt2MMTF43
 ELaImGc1yhiur3nAqXOUNPpb3g6B+z8kVK6he1McgiaZyHbXvPdk815YB1D3kh6iImU5
 4EkO3pIBxS+r0Mqx45kfQOVtm4dP7heMfa4/g3Or32bfxT6qGMXG6iFNzf5Pza8dZB74
 WqFptf01AyzFC5rWyAZtaKNqN/2bxc4ND/fY63b7wUheeGt0v5FvyGXnHPfKLLuST27y
 /PIw==
X-Gm-Message-State: AOAM531LFz1COZ4AF5RKeN8zFPSNFY453NGl/fOsLRq7jqKPcVHH+tW7
 oZgGGjoWeiocyuoJSO5SYURSAaECTEOFRg==
X-Google-Smtp-Source: ABdhPJyctISoZrBmRTDhOkvG7B2d2NePNk4+7o6GJl3UykmugsyBQ3mY/YQQmVeZylttaIGfZWC7Hg==
X-Received: by 2002:a17:902:f281:b0:13f:3be8:b160 with SMTP id
 k1-20020a170902f28100b0013f3be8b160mr34074439plc.32.1634657080340; 
 Tue, 19 Oct 2021 08:24:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm3293814pjt.19.2021.10.19.08.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:24:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v5 01/16] target/riscv: Move cpu_get_tb_cpu_state out of line
Date: Tue, 19 Oct 2021 08:24:23 -0700
Message-Id: <20211019152438.269077-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019152438.269077-1-richard.henderson@linaro.org>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 15:24:47 -0000

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


