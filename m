Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELaj-0006pR-EE
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELaa-0006hq-Tf
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:39:13 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZR-0004oO-7O
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:39:06 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so9304108pjq.1
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3xrOaDJVPE/CmdkY8im+Dl4QkQvUXux7CRjkgzX7WCc=;
 b=Vr7pPQ0Vc0da8CqPlxQPFJ4iAo8IUHkomwGS3CyijOiziB7ECFHyQEeK4aFoJZLz7q
 S7fxY59hce7PqHpOkqVNUeTFwZhS68Ef/TTfCLwopjG29LAqTX11JnCX8LwO5kM35E1V
 8quXLh8FYORyUirF3vO/1PscXa6siTIIGsVEo5mKLkZGi7qUEpM0F8jFU07I9LKKcZ5z
 GEQXkvMEhf2hqOCeUsvErTt0UVDnFsP5Ptwj9BG9TiuF/NoknW2RcIGlj0J+Wb7W61oR
 53AvWjCV22JwemnUIvnYW10INtjETRKRGAfOYCpmhiee/jsqvFySxNy3s1OQEGSfKed2
 sdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3xrOaDJVPE/CmdkY8im+Dl4QkQvUXux7CRjkgzX7WCc=;
 b=3Oehl+gNn/S7XHCWb3vkUyx3tmN20Wfy/cqZtkGJxpYHQOfJvHpK25Me6zyjnM2RsA
 U9mZy4eOFdjtpmdD1ykrTtH2yyiU79Zrwm4QHgqHpeiuU+XmPP1658dXAMFO4KNnGKVG
 mHjsRb3KxlMKn0aabTiI60eY/UAwxTmOZXt7Fh8sJBeC0oVxWZe/KUGNSIcsYCE3cVrY
 B4GJVvWbBvzE/whzLKAkSySBlD6ffp+ZXxX1EMWo5/5BMRjnaH432GPNjgN6LccAZhT6
 S3Fka31uPCLrOUMo3q0eQVmVXsuVz1j0n8XIcy4fZUPyk5e5B6DOC/msElMU3ddUNC9O
 s/CQ==
X-Gm-Message-State: AFqh2kqATy65xtR08luM0UUBbtHHlHFrAb1h7rrcu/cIxijXgqSFrcl3
 mE3J3T4a+FOsopWVi/rM4R6FFg==
X-Google-Smtp-Source: AMrXdXs6zlYtsN5O8W75nSeo0sOtBsn4uHgAwLvWjHAUGY8YABkDmResS2O353GK6NBU4IEM9CVcvw==
X-Received: by 2002:a17:902:b609:b0:192:4ed2:7509 with SMTP id
 b9-20020a170902b60900b001924ed27509mr62839722pls.15.1673145480024; 
 Sat, 07 Jan 2023 18:38:00 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 35/36] target/i386: Inline cmpxchg8b
Date: Sat,  7 Jan 2023 18:37:18 -0800
Message-Id: <20230108023719.2466341-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 08 Jan 2023 02:39:14 -0000

Use tcg_gen_atomic_cmpxchg_i64 for the atomic case,
and tcg_gen_nonatomic_cmpxchg_i64 otherwise.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.h         |  2 --
 target/i386/tcg/mem_helper.c | 57 ------------------------------------
 target/i386/tcg/translate.c  | 54 ++++++++++++++++++++++++++++++----
 3 files changed, 49 insertions(+), 64 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index b7de5429ef..2df8049f91 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -66,8 +66,6 @@ DEF_HELPER_1(rsm, void, env)
 #endif /* !CONFIG_USER_ONLY */
 
 DEF_HELPER_2(into, void, env, int)
-DEF_HELPER_2(cmpxchg8b_unlocked, void, env, tl)
-DEF_HELPER_2(cmpxchg8b, void, env, tl)
 #ifdef TARGET_X86_64
 DEF_HELPER_2(cmpxchg16b_unlocked, void, env, tl)
 DEF_HELPER_2(cmpxchg16b, void, env, tl)
diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
index e3cdafd2d4..814786bb87 100644
--- a/target/i386/tcg/mem_helper.c
+++ b/target/i386/tcg/mem_helper.c
@@ -27,63 +27,6 @@
 #include "tcg/tcg.h"
 #include "helper-tcg.h"
 
-void helper_cmpxchg8b_unlocked(CPUX86State *env, target_ulong a0)
-{
-    uintptr_t ra = GETPC();
-    uint64_t oldv, cmpv, newv;
-    int eflags;
-
-    eflags = cpu_cc_compute_all(env, CC_OP);
-
-    cmpv = deposit64(env->regs[R_EAX], 32, 32, env->regs[R_EDX]);
-    newv = deposit64(env->regs[R_EBX], 32, 32, env->regs[R_ECX]);
-
-    oldv = cpu_ldq_data_ra(env, a0, ra);
-    newv = (cmpv == oldv ? newv : oldv);
-    /* always do the store */
-    cpu_stq_data_ra(env, a0, newv, ra);
-
-    if (oldv == cmpv) {
-        eflags |= CC_Z;
-    } else {
-        env->regs[R_EAX] = (uint32_t)oldv;
-        env->regs[R_EDX] = (uint32_t)(oldv >> 32);
-        eflags &= ~CC_Z;
-    }
-    CC_SRC = eflags;
-}
-
-void helper_cmpxchg8b(CPUX86State *env, target_ulong a0)
-{
-#ifdef CONFIG_ATOMIC64
-    uint64_t oldv, cmpv, newv;
-    int eflags;
-
-    eflags = cpu_cc_compute_all(env, CC_OP);
-
-    cmpv = deposit64(env->regs[R_EAX], 32, 32, env->regs[R_EDX]);
-    newv = deposit64(env->regs[R_EBX], 32, 32, env->regs[R_ECX]);
-
-    {
-        uintptr_t ra = GETPC();
-        int mem_idx = cpu_mmu_index(env, false);
-        MemOpIdx oi = make_memop_idx(MO_TEUQ, mem_idx);
-        oldv = cpu_atomic_cmpxchgq_le_mmu(env, a0, cmpv, newv, oi, ra);
-    }
-
-    if (oldv == cmpv) {
-        eflags |= CC_Z;
-    } else {
-        env->regs[R_EAX] = (uint32_t)oldv;
-        env->regs[R_EDX] = (uint32_t)(oldv >> 32);
-        eflags &= ~CC_Z;
-    }
-    CC_SRC = eflags;
-#else
-    cpu_loop_exit_atomic(env_cpu(env), GETPC());
-#endif /* CONFIG_ATOMIC64 */
-}
-
 #ifdef TARGET_X86_64
 void helper_cmpxchg16b_unlocked(CPUX86State *env, target_ulong a0)
 {
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index a82131d635..b542b084a6 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2995,15 +2995,59 @@ static void gen_sty_env_A0(DisasContext *s, int offset, bool align)
 
 static void gen_cmpxchg8b(DisasContext *s, CPUX86State *env, int modrm)
 {
+    TCGv_i64 cmp, val, old;
+    TCGv Z;
+
     gen_lea_modrm(env, s, modrm);
 
-    if ((s->prefix & PREFIX_LOCK) &&
-        (tb_cflags(s->base.tb) & CF_PARALLEL)) {
-        gen_helper_cmpxchg8b(cpu_env, s->A0);
+    cmp = tcg_temp_new_i64();
+    val = tcg_temp_new_i64();
+    old = tcg_temp_new_i64();
+
+    /* Construct the comparison values from the register pair. */
+    tcg_gen_concat_tl_i64(cmp, cpu_regs[R_EAX], cpu_regs[R_EDX]);
+    tcg_gen_concat_tl_i64(val, cpu_regs[R_EBX], cpu_regs[R_ECX]);
+
+    /* Only require atomic with LOCK; non-parallel handled in generator. */
+    if (s->prefix & PREFIX_LOCK) {
+        tcg_gen_atomic_cmpxchg_i64(old, s->A0, cmp, val, s->mem_index, MO_TEUQ);
     } else {
-        gen_helper_cmpxchg8b_unlocked(cpu_env, s->A0);
+        tcg_gen_nonatomic_cmpxchg_i64(old, s->A0, cmp, val,
+                                      s->mem_index, MO_TEUQ);
     }
-    set_cc_op(s, CC_OP_EFLAGS);
+    tcg_temp_free_i64(val);
+
+    /* Set tmp0 to match the required value of Z. */
+    tcg_gen_setcond_i64(TCG_COND_EQ, cmp, old, cmp);
+    Z = tcg_temp_new();
+    tcg_gen_trunc_i64_tl(Z, cmp);
+    tcg_temp_free_i64(cmp);
+
+    /*
+     * Extract the result values for the register pair.
+     * For 32-bit, we may do this unconditionally, because on success (Z=1),
+     * the old value matches the previous value in EDX:EAX.  For x86_64,
+     * the store must be conditional, because we must leave the source
+     * registers unchanged on success, and zero-extend the writeback
+     * on failure (Z=0).
+     */
+    if (TARGET_LONG_BITS == 32) {
+        tcg_gen_extr_i64_tl(cpu_regs[R_EAX], cpu_regs[R_EDX], old);
+    } else {
+        TCGv zero = tcg_constant_tl(0);
+
+        tcg_gen_extr_i64_tl(s->T0, s->T1, old);
+        tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EAX], Z, zero,
+                           s->T0, cpu_regs[R_EAX]);
+        tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EDX], Z, zero,
+                           s->T1, cpu_regs[R_EDX]);
+    }
+    tcg_temp_free_i64(old);
+
+    /* Update Z. */
+    gen_compute_eflags(s);
+    tcg_gen_deposit_tl(cpu_cc_src, cpu_cc_src, Z, ctz32(CC_Z), 1);
+    tcg_temp_free(Z);
 }
 
 #ifdef TARGET_X86_64
-- 
2.34.1


