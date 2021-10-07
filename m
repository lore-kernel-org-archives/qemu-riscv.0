Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYXUo-0004Wc-NY
	for mharc-qemu-riscv@gnu.org; Thu, 07 Oct 2021 13:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUV-00043g-70
 for qemu-riscv@nongnu.org; Thu, 07 Oct 2021 13:47:39 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUP-0006rc-8h
 for qemu-riscv@nongnu.org; Thu, 07 Oct 2021 13:47:32 -0400
Received: by mail-pl1-x62f.google.com with SMTP id w14so4444738pll.2
 for <qemu-riscv@nongnu.org>; Thu, 07 Oct 2021 10:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OjRGfpVPKULWg/qA8nsYIOw1P9JnLXCdc48XaUFRhzo=;
 b=YP/uFF/Ar2YizNlSvxODd4LVwR5sqqffy6rcEMe/6bku3luUXoCA3Zl++U3Nu5FDXN
 5CEP0C1klURVKb5pzsanltG4gK/aH+H9x6036m3XCBn765fSHcRAthj1Vg/5eBTEDora
 RRF1WcAB5/McOqWqcXYo/yEBNwBqwfGSIg4MqoDPBGQ9sMxufHJDAbySrkEn8lr9Wfa5
 8TpjcUoCW8MWvnKtHW5/76v8+76fm5KU21yuDH3exx3Ag0qsu1m2DzOyumn8AWjKYk2Z
 4b2SIbAam60Aejmys3K95HrbEwc4xBMKDPesBsqcibfR7n8BYitbVVs4ObLZbgnr1Era
 BgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OjRGfpVPKULWg/qA8nsYIOw1P9JnLXCdc48XaUFRhzo=;
 b=v4A+cIvbfIilYzxL9piKrbGecjGlOTnBU17rtOPOFSLUEyguC9JkAnqKQmD7VHeqI+
 3Faakr8pfruQOqd6vtMVZDm40f8iDMmHzayuN6115+v17LgQcbBHj3cDKviBK2rW+293
 EVgQMZdUxBKnafRcUHRxLMj2Oxsj9gtK81da+47cJxcTSJcd0Qmq6YLtIvTS2ND4b8wd
 WY0JDq+o9epCyhJnKlHeEDsjdjmLP7RKFwC6Q9md3n2dp1BMMZvOCDfCDyHobXj/Cy9g
 8VpBqq3/Nl33qYE6F5yRbXX5XyFfFYJfkUvsm2S1j4QePYpvOcCbOsigdqlT7X9Zo8V2
 j3GQ==
X-Gm-Message-State: AOAM530LenIx2Qq1XbJTm77RDJqEPinJTg5LSWHjKqUtT5g/NYJZKgvv
 DE2Eso+1MOpXmrN/ATf62L5WTQ==
X-Google-Smtp-Source: ABdhPJxOljphnX9dOnT0DPq8S/HCYaCzf7ojY8D7DbKpqDKRXzLmZcqdKiUe/TA77T75xaTWB2kuFA==
X-Received: by 2002:a17:90a:7e82:: with SMTP id
 j2mr6314534pjl.165.1633628847915; 
 Thu, 07 Oct 2021 10:47:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 197sm83318pfv.6.2021.10.07.10.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:47:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org
Subject: [PATCH 05/13] target/riscv: Add MXL/SXL/UXL to TB_FLAGS
Date: Thu,  7 Oct 2021 10:47:14 -0700
Message-Id: <20211007174722.929993-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007174722.929993-1-richard.henderson@linaro.org>
References: <20211007174722.929993-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Thu, 07 Oct 2021 17:47:45 -0000

Begin adding support for switching XLEN at runtime.  Extract the
effective XLEN from MISA and MSTATUS and store for use during translation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c | 33 +++++++++++++++++++++++++++++++++
 target/riscv/translate.c  |  2 +-
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 87248b562a..445ba5b395 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -395,6 +395,8 @@ FIELD(TB_FLAGS, VILL, 8, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 9, 1)
 FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
+/* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
+FIELD(TB_FLAGS, XL, 12, 2)
 
 #ifdef CONFIG_RISCV32
 #define riscv_cpu_mxl(env)      MXL_RV32
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 403f54171d..429afd1f48 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -35,6 +35,37 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #endif
 }
 
+static RISCVMXL cpu_get_xl(CPURISCVState *env)
+{
+#if defined(TARGET_RISCV32)
+    return MXL_RV32;
+#elif defined(CONFIG_USER_ONLY)
+    return MXL_RV64;
+#else
+    RISCVMXL xl = riscv_cpu_mxl(env);
+
+    /*
+     * When emulating a 32-bit-only cpu, use RV32.
+     * When emulating a 64-bit cpu, and MXL has been reduced to RV32,
+     * MSTATUSH doesn't have UXL/SXL, therefore XLEN cannot be widened
+     * back to RV64 for lower privs.
+     */
+    if (xl != MXL_RV32) {
+        switch (env->priv) {
+        case PRV_M:
+            break;
+        case PRV_U:
+            xl = get_field(env->mstatus, MSTATUS64_UXL);
+            break;
+        default: /* PRV_S | PRV_H */
+            xl = get_field(env->mstatus, MSTATUS64_SXL);
+            break;
+        }
+    }
+    return xl;
+#endif
+}
+
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
@@ -78,6 +109,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     }
 #endif
 
+    flags = FIELD_DP32(flags, TB_FLAGS, XL, cpu_get_xl(env));
+
     *pflags = flags;
 }
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 422f8ab8d0..7e7bb67d15 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -539,7 +539,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 #else
     ctx->virt_enabled = false;
 #endif
-    ctx->xl = env->misa_mxl;
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
@@ -551,6 +550,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
     ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs = cs;
     ctx->w = false;
     ctx->ntemp = 0;
-- 
2.25.1


