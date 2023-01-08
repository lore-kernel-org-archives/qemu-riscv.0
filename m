Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELZq-0005Np-2Q
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZo-0005JF-03
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:24 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZ8-0004eT-4i
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:23 -0500
Received: by mail-pl1-x629.google.com with SMTP id b2so5869421pld.7
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fBe81AYf+h+ZBpFhnMwhRAiDvhJXmvmqR7+o6P3dQKY=;
 b=HqXY6QIZgmvawjIMl3xMJ+aoWYtOfrLlUlA0s5tRnenWNZLVzfkHXGy7jwBYQUN6++
 Ed6Tm901X5LaW/9Y3Hdq/hgXD2gyAlBRaGe0LPwU5aQVpBBdM70dqGH4sXoEIOGHIVZ+
 ruR8vQl+ahTo0jdu62U5XjA+ks5UjaPSZXEeAP4NcpIZdurGIfyJcb6jfdyMblM+7vMG
 uRcU+cWFX245qQLmY4ASYJalf/Ludn4UBjOfmhFP8uyxppxy0qQ0ymbOiZpTQoYgfbBD
 0op5yO6l1U6/k7sk62SxzevKl66RzUSrYRInOhfxwHhpQZ+Ux3CzqO50NJjThU4q4SfQ
 3JvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fBe81AYf+h+ZBpFhnMwhRAiDvhJXmvmqR7+o6P3dQKY=;
 b=iF3h20WsTxeQnk+VErJHr2FvbFnaIU9ygYxLrYvW7eEihFqlgvGgnA14+zJ3BvLwgo
 PuzM8+ps7pnHTzaMON5ndnKHm6zFF7UOuY8Br/JcEJI85MXGBfRA3Yh8T1waokmz5mMB
 zvzuDuOSaFj9EQgJqYySabLAw0PLWfzg8v2MVKp1pieMcDIaK7x8BRaypk+t0mx7iFzr
 NacaKwcW0kjQxApJRkE8m3dBWwAmr3wxbsSprxBYIw5zgY68TM/WFXbAWw7NuoAkl7Ym
 uodbDiURV7vbwy8Wb1tcRTRH5qSiT37qK+mlIpZMnQXkLLqxkczoCt1QioVDSn0BtqzP
 r1zw==
X-Gm-Message-State: AFqh2kpAhQeIXFe6eIcRrNUMClttnFomY1RseLKWgFDq6TDf1urbysE8
 H8Fb1WxQj0MPedW5o27+4T6Nkw==
X-Google-Smtp-Source: AMrXdXu9WbTIehrcLnC9zTxNY2PRsME1mrOkgpADNMYOsfQtdQMwvDweeTeOPHJ670PkKIo5VGMeRw==
X-Received: by 2002:a17:902:f80c:b0:185:441e:90dd with SMTP id
 ix12-20020a170902f80c00b00185441e90ddmr67708680plb.67.1673145460792; 
 Sat, 07 Jan 2023 18:37:40 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 18/36] target/arm: Use tcg_gen_atomic_cmpxchg_i128 for STXP
Date: Sat,  7 Jan 2023 18:37:01 -0800
Message-Id: <20230108023719.2466341-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Sun, 08 Jan 2023 02:38:24 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20221112042555.2622152-2-richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |   6 ---
 target/arm/helper-a64.c    | 104 -------------------------------------
 target/arm/translate-a64.c |  60 ++++++++++++---------
 3 files changed, 35 insertions(+), 135 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 7b706571bb..94065d1917 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -50,12 +50,6 @@ DEF_HELPER_FLAGS_2(frecpx_f16, TCG_CALL_NO_RWG, f16, f16, ptr)
 DEF_HELPER_FLAGS_2(fcvtx_f64_to_f32, TCG_CALL_NO_RWG, f32, f64, env)
 DEF_HELPER_FLAGS_3(crc32_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
 DEF_HELPER_FLAGS_3(crc32c_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
-DEF_HELPER_FLAGS_4(paired_cmpxchg64_le, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
-DEF_HELPER_FLAGS_4(paired_cmpxchg64_le_parallel, TCG_CALL_NO_WG,
-                   i64, env, i64, i64, i64)
-DEF_HELPER_FLAGS_4(paired_cmpxchg64_be, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
-DEF_HELPER_FLAGS_4(paired_cmpxchg64_be_parallel, TCG_CALL_NO_WG,
-                   i64, env, i64, i64, i64)
 DEF_HELPER_5(casp_le_parallel, void, env, i32, i64, i64, i64)
 DEF_HELPER_5(casp_be_parallel, void, env, i32, i64, i64, i64)
 DEF_HELPER_FLAGS_3(advsimd_maxh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 77a8502b6b..7dbdb2c233 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -505,110 +505,6 @@ uint64_t HELPER(crc32c_64)(uint64_t acc, uint64_t val, uint32_t bytes)
     return crc32c(acc, buf, bytes) ^ 0xffffffff;
 }
 
-uint64_t HELPER(paired_cmpxchg64_le)(CPUARMState *env, uint64_t addr,
-                                     uint64_t new_lo, uint64_t new_hi)
-{
-    Int128 cmpv = int128_make128(env->exclusive_val, env->exclusive_high);
-    Int128 newv = int128_make128(new_lo, new_hi);
-    Int128 oldv;
-    uintptr_t ra = GETPC();
-    uint64_t o0, o1;
-    bool success;
-    int mem_idx = cpu_mmu_index(env, false);
-    MemOpIdx oi0 = make_memop_idx(MO_LEUQ | MO_ALIGN_16, mem_idx);
-    MemOpIdx oi1 = make_memop_idx(MO_LEUQ, mem_idx);
-
-    o0 = cpu_ldq_le_mmu(env, addr + 0, oi0, ra);
-    o1 = cpu_ldq_le_mmu(env, addr + 8, oi1, ra);
-    oldv = int128_make128(o0, o1);
-
-    success = int128_eq(oldv, cmpv);
-    if (success) {
-        cpu_stq_le_mmu(env, addr + 0, int128_getlo(newv), oi1, ra);
-        cpu_stq_le_mmu(env, addr + 8, int128_gethi(newv), oi1, ra);
-    }
-
-    return !success;
-}
-
-uint64_t HELPER(paired_cmpxchg64_le_parallel)(CPUARMState *env, uint64_t addr,
-                                              uint64_t new_lo, uint64_t new_hi)
-{
-    Int128 oldv, cmpv, newv;
-    uintptr_t ra = GETPC();
-    bool success;
-    int mem_idx;
-    MemOpIdx oi;
-
-    assert(HAVE_CMPXCHG128);
-
-    mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
-
-    cmpv = int128_make128(env->exclusive_val, env->exclusive_high);
-    newv = int128_make128(new_lo, new_hi);
-    oldv = cpu_atomic_cmpxchgo_le_mmu(env, addr, cmpv, newv, oi, ra);
-
-    success = int128_eq(oldv, cmpv);
-    return !success;
-}
-
-uint64_t HELPER(paired_cmpxchg64_be)(CPUARMState *env, uint64_t addr,
-                                     uint64_t new_lo, uint64_t new_hi)
-{
-    /*
-     * High and low need to be switched here because this is not actually a
-     * 128bit store but two doublewords stored consecutively
-     */
-    Int128 cmpv = int128_make128(env->exclusive_high, env->exclusive_val);
-    Int128 newv = int128_make128(new_hi, new_lo);
-    Int128 oldv;
-    uintptr_t ra = GETPC();
-    uint64_t o0, o1;
-    bool success;
-    int mem_idx = cpu_mmu_index(env, false);
-    MemOpIdx oi0 = make_memop_idx(MO_BEUQ | MO_ALIGN_16, mem_idx);
-    MemOpIdx oi1 = make_memop_idx(MO_BEUQ, mem_idx);
-
-    o1 = cpu_ldq_be_mmu(env, addr + 0, oi0, ra);
-    o0 = cpu_ldq_be_mmu(env, addr + 8, oi1, ra);
-    oldv = int128_make128(o0, o1);
-
-    success = int128_eq(oldv, cmpv);
-    if (success) {
-        cpu_stq_be_mmu(env, addr + 0, int128_gethi(newv), oi1, ra);
-        cpu_stq_be_mmu(env, addr + 8, int128_getlo(newv), oi1, ra);
-    }
-
-    return !success;
-}
-
-uint64_t HELPER(paired_cmpxchg64_be_parallel)(CPUARMState *env, uint64_t addr,
-                                              uint64_t new_lo, uint64_t new_hi)
-{
-    Int128 oldv, cmpv, newv;
-    uintptr_t ra = GETPC();
-    bool success;
-    int mem_idx;
-    MemOpIdx oi;
-
-    assert(HAVE_CMPXCHG128);
-
-    mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_BE | MO_128 | MO_ALIGN, mem_idx);
-
-    /*
-     * High and low need to be switched here because this is not actually a
-     * 128bit store but two doublewords stored consecutively
-     */
-    cmpv = int128_make128(env->exclusive_high, env->exclusive_val);
-    newv = int128_make128(new_hi, new_lo);
-    oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
-
-    success = int128_eq(oldv, cmpv);
-    return !success;
-}
-
 /* Writes back the old data into Rs.  */
 void HELPER(casp_le_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
                               uint64_t new_lo, uint64_t new_hi)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2ee171f249..dffd7ee737 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2580,32 +2580,42 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
                                        get_mem_index(s),
                                        MO_64 | MO_ALIGN | s->be_data);
             tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
-        } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
-            if (!HAVE_CMPXCHG128) {
-                gen_helper_exit_atomic(cpu_env);
-                /*
-                 * Produce a result so we have a well-formed opcode
-                 * stream when the following (dead) code uses 'tmp'.
-                 * TCG will remove the dead ops for us.
-                 */
-                tcg_gen_movi_i64(tmp, 0);
-            } else if (s->be_data == MO_LE) {
-                gen_helper_paired_cmpxchg64_le_parallel(tmp, cpu_env,
-                                                        cpu_exclusive_addr,
-                                                        cpu_reg(s, rt),
-                                                        cpu_reg(s, rt2));
-            } else {
-                gen_helper_paired_cmpxchg64_be_parallel(tmp, cpu_env,
-                                                        cpu_exclusive_addr,
-                                                        cpu_reg(s, rt),
-                                                        cpu_reg(s, rt2));
-            }
-        } else if (s->be_data == MO_LE) {
-            gen_helper_paired_cmpxchg64_le(tmp, cpu_env, cpu_exclusive_addr,
-                                           cpu_reg(s, rt), cpu_reg(s, rt2));
         } else {
-            gen_helper_paired_cmpxchg64_be(tmp, cpu_env, cpu_exclusive_addr,
-                                           cpu_reg(s, rt), cpu_reg(s, rt2));
+            TCGv_i128 t16 = tcg_temp_new_i128();
+            TCGv_i128 c16 = tcg_temp_new_i128();
+            TCGv_i64 a, b;
+
+            if (s->be_data == MO_LE) {
+                tcg_gen_concat_i64_i128(t16, cpu_reg(s, rt), cpu_reg(s, rt2));
+                tcg_gen_concat_i64_i128(c16, cpu_exclusive_val,
+                                        cpu_exclusive_high);
+            } else {
+                tcg_gen_concat_i64_i128(t16, cpu_reg(s, rt2), cpu_reg(s, rt));
+                tcg_gen_concat_i64_i128(c16, cpu_exclusive_high,
+                                        cpu_exclusive_val);
+            }
+
+            tcg_gen_atomic_cmpxchg_i128(t16, cpu_exclusive_addr, c16, t16,
+                                        get_mem_index(s),
+                                        MO_128 | MO_ALIGN | s->be_data);
+            tcg_temp_free_i128(c16);
+
+            a = tcg_temp_new_i64();
+            b = tcg_temp_new_i64();
+            if (s->be_data == MO_LE) {
+                tcg_gen_extr_i128_i64(a, b, t16);
+            } else {
+                tcg_gen_extr_i128_i64(b, a, t16);
+            }
+
+            tcg_gen_xor_i64(a, a, cpu_exclusive_val);
+            tcg_gen_xor_i64(b, b, cpu_exclusive_high);
+            tcg_gen_or_i64(tmp, a, b);
+            tcg_temp_free_i64(a);
+            tcg_temp_free_i64(b);
+            tcg_temp_free_i128(t16);
+
+            tcg_gen_setcondi_i64(TCG_COND_NE, tmp, tmp, 0);
         }
     } else {
         tcg_gen_atomic_cmpxchg_i64(tmp, cpu_exclusive_addr, cpu_exclusive_val,
-- 
2.34.1


