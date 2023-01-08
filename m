Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELZo-0005JV-6U
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZf-0005EC-O6
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:15 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZ5-0004d1-LA
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:15 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so9263479pjk.3
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tmU0MjgiKsSxPUHRGzRVInhdiWEFNbDXapXPwryhCsg=;
 b=dVPjSWSVfw3dl+K0WrjZQUtWVtasW1reVIEELlM9F/TvOFEnsRyHTV7neQKKF0yDq0
 zWZ7VC8avBIbay8SO1uxz1pN7XNarj00p0ljqQio0+igPCW075mN1y3Kk+BVFZ/TVkl1
 H14q04qgtIopeXhtxBT82aELAfULRloENIut2Uk/8piyu4a+jMIvsLkCTj06VNuJOcGA
 vQtUBveoUTqvGYhZkytToXTi/1sweQfKDUV4TOGHFkFbI7Ddby6iIhVB6fkmJLJV8EsH
 2Q05RxM9udcCSC493hceEzCq3fyyQWSKrpPuAgOZ7a6VATnDEo+9zDl6MbsEeJwfpb2W
 1z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tmU0MjgiKsSxPUHRGzRVInhdiWEFNbDXapXPwryhCsg=;
 b=VOkEEV9WacWQTNQxD9Bu9ge0i4PkqJlxWBZNuv1IaGry1lFyUEFveQXDYc2ZFPSRgK
 sScIoL3rzJIXuwGN/jtnOyEBku9wCTGxKRoIhE0em1opSNs6W/ppe9K18EHvKvFAo55G
 7bpZcOrsHwLoHh2Kku3d5gqsn4QG/sL9FRZ4kjNOQWSoQexdQ6tWHyAkO/JFL9Es2Fij
 K4pCzoAEOxK2NnNm2kt/8patHQt6pGV47SnILVDdSPyfdatJr1cmNcJTU8vZcF7M0o/I
 uxniqJbC6WQ8lpMmHuEDT/Q6AnxSFbJzS+76VPMRZzefBGHjn+eFSzrys1xfPcPupS3e
 iaDQ==
X-Gm-Message-State: AFqh2kom/QBvHsKyEUE+DfA1H4t1jETpMNdkwQROJ9szpU+rpg+s3luw
 GYbyK7BzAIyBSUWW7uphGiPZ/w==
X-Google-Smtp-Source: AMrXdXtQAF1iIe2yb+kn0a3+q+s7wVHxHtEe1ezf/KHN5Ycay/z3DWneG/bBUmfvL2X0omsUa/PkLA==
X-Received: by 2002:a17:902:8e86:b0:192:b43e:272 with SMTP id
 bg6-20020a1709028e8600b00192b43e0272mr28292109plb.53.1673145458376; 
 Sat, 07 Jan 2023 18:37:38 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 16/36] tcg: Add tcg_gen_{non}atomic_cmpxchg_i128
Date: Sat,  7 Jan 2023 18:36:59 -0800
Message-Id: <20230108023719.2466341-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Sun, 08 Jan 2023 02:38:16 -0000

This will allow targets to avoid rolling their own.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-runtime.h       | 11 +++++
 include/tcg/tcg-op.h          |  5 +++
 tcg/tcg-op.c                  | 85 +++++++++++++++++++++++++++++++++++
 accel/tcg/atomic_common.c.inc | 45 +++++++++++++++++++
 4 files changed, 146 insertions(+)

diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index 37cbd722bf..e141a6ab24 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -55,6 +55,17 @@ DEF_HELPER_FLAGS_5(atomic_cmpxchgq_be, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_5(atomic_cmpxchgq_le, TCG_CALL_NO_WG,
                    i64, env, tl, i64, i64, i32)
 #endif
+#ifdef CONFIG_CMPXCHG128
+DEF_HELPER_FLAGS_5(atomic_cmpxchgo_be, TCG_CALL_NO_WG,
+                   i128, env, tl, i128, i128, i32)
+DEF_HELPER_FLAGS_5(atomic_cmpxchgo_le, TCG_CALL_NO_WG,
+                   i128, env, tl, i128, i128, i32)
+#endif
+
+DEF_HELPER_FLAGS_5(nonatomic_cmpxchgo_be, TCG_CALL_NO_WG,
+                   i128, env, tl, i128, i128, i32)
+DEF_HELPER_FLAGS_5(nonatomic_cmpxchgo_le, TCG_CALL_NO_WG,
+                   i128, env, tl, i128, i128, i32)
 
 #ifdef CONFIG_ATOMIC64
 #define GEN_ATOMIC_HELPERS(NAME)                                  \
diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index e5f5b63c37..31bf3d287e 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -907,6 +907,11 @@ void tcg_gen_atomic_cmpxchg_i32(TCGv_i32, TCGv, TCGv_i32, TCGv_i32,
                                 TCGArg, MemOp);
 void tcg_gen_atomic_cmpxchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGv_i64,
                                 TCGArg, MemOp);
+void tcg_gen_atomic_cmpxchg_i128(TCGv_i128, TCGv, TCGv_i128, TCGv_i128,
+                                 TCGArg, MemOp);
+
+void tcg_gen_nonatomic_cmpxchg_i128(TCGv_i128, TCGv, TCGv_i128, TCGv_i128,
+                                    TCGArg, MemOp);
 
 void tcg_gen_atomic_xchg_i32(TCGv_i32, TCGv, TCGv_i32, TCGArg, MemOp);
 void tcg_gen_atomic_xchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, MemOp);
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 55ecedb66f..66f9c894ad 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3293,6 +3293,8 @@ typedef void (*gen_atomic_cx_i32)(TCGv_i32, TCGv_env, TCGv,
                                   TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void (*gen_atomic_cx_i64)(TCGv_i64, TCGv_env, TCGv,
                                   TCGv_i64, TCGv_i64, TCGv_i32);
+typedef void (*gen_atomic_cx_i128)(TCGv_i128, TCGv_env, TCGv,
+                                   TCGv_i128, TCGv_i128, TCGv_i32);
 typedef void (*gen_atomic_op_i32)(TCGv_i32, TCGv_env, TCGv,
                                   TCGv_i32, TCGv_i32);
 typedef void (*gen_atomic_op_i64)(TCGv_i64, TCGv_env, TCGv,
@@ -3303,6 +3305,11 @@ typedef void (*gen_atomic_op_i64)(TCGv_i64, TCGv_env, TCGv,
 #else
 # define WITH_ATOMIC64(X)
 #endif
+#ifdef CONFIG_CMPXCHG128
+# define WITH_ATOMIC128(X) X,
+#else
+# define WITH_ATOMIC128(X)
+#endif
 
 static void * const table_cmpxchg[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_8] = gen_helper_atomic_cmpxchgb,
@@ -3312,6 +3319,8 @@ static void * const table_cmpxchg[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_32 | MO_BE] = gen_helper_atomic_cmpxchgl_be,
     WITH_ATOMIC64([MO_64 | MO_LE] = gen_helper_atomic_cmpxchgq_le)
     WITH_ATOMIC64([MO_64 | MO_BE] = gen_helper_atomic_cmpxchgq_be)
+    WITH_ATOMIC128([MO_128 | MO_LE] = gen_helper_atomic_cmpxchgo_le)
+    WITH_ATOMIC128([MO_128 | MO_BE] = gen_helper_atomic_cmpxchgo_be)
 };
 
 void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
@@ -3410,6 +3419,82 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
     }
 }
 
+void tcg_gen_nonatomic_cmpxchg_i128(TCGv_i128 retv, TCGv addr, TCGv_i128 cmpv,
+                                    TCGv_i128 newv, TCGArg idx, MemOp memop)
+{
+    if (TCG_TARGET_REG_BITS == 32) {
+        /* Inline expansion below is simply too large for 32-bit hosts. */
+        gen_atomic_cx_i128 gen = ((memop & MO_BSWAP) == MO_LE
+                                  ? gen_helper_nonatomic_cmpxchgo_le 
+                                  : gen_helper_nonatomic_cmpxchgo_be);
+        MemOpIdx oi = make_memop_idx(memop, idx);
+
+        tcg_debug_assert((memop & MO_SIZE) == MO_128);
+        tcg_debug_assert((memop & MO_SIGN) == 0);
+
+        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
+    } else {
+        TCGv_i128 oldv = tcg_temp_new_i128();
+        TCGv_i128 tmpv = tcg_temp_new_i128();
+        TCGv_i64 t0 = tcg_temp_new_i64();
+        TCGv_i64 t1 = tcg_temp_new_i64();
+        TCGv_i64 z = tcg_constant_i64(0);
+
+        tcg_gen_qemu_ld_i128(oldv, addr, idx, memop);
+
+        /* Compare i128 */
+        tcg_gen_xor_i64(t0, TCGV128_LOW(oldv), TCGV128_LOW(cmpv));
+        tcg_gen_xor_i64(t1, TCGV128_HIGH(oldv), TCGV128_HIGH(cmpv));
+        tcg_gen_or_i64(t0, t0, t1);
+
+        /* tmpv = equal ? newv : oldv */
+        tcg_gen_movcond_i64(TCG_COND_EQ, TCGV128_LOW(tmpv), t0, z,
+                            TCGV128_LOW(newv), TCGV128_LOW(oldv));
+        tcg_gen_movcond_i64(TCG_COND_EQ, TCGV128_HIGH(tmpv), t0, z,
+                            TCGV128_HIGH(newv), TCGV128_HIGH(oldv));
+
+        /* Unconditional writeback. */
+        tcg_gen_qemu_st_i128(tmpv, addr, idx, memop);
+        tcg_gen_mov_i128(retv, oldv);
+
+        tcg_temp_free_i64(t0);
+        tcg_temp_free_i64(t1);
+        tcg_temp_free_i128(tmpv);
+        tcg_temp_free_i128(oldv);
+    }
+}
+
+void tcg_gen_atomic_cmpxchg_i128(TCGv_i128 retv, TCGv addr, TCGv_i128 cmpv,
+                                 TCGv_i128 newv, TCGArg idx, MemOp memop)
+{
+    gen_atomic_cx_i128 gen;
+
+    if (!(tcg_ctx->tb_cflags & CF_PARALLEL)) {
+        tcg_gen_nonatomic_cmpxchg_i128(retv, addr, cmpv, newv, idx, memop);
+        return;
+    }
+
+    tcg_debug_assert((memop & MO_SIZE) == MO_128);
+    tcg_debug_assert((memop & MO_SIGN) == 0);
+    gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
+
+    if (gen) {
+        MemOpIdx oi = make_memop_idx(memop, idx);
+        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
+        return;
+    }
+
+    gen_helper_exit_atomic(cpu_env);
+
+    /*
+     * Produce a result for a well-formed opcode stream.  This satisfies
+     * liveness for set before used, which happens before this dead code
+     * is removed.
+     */
+    tcg_gen_movi_i64(TCGV128_LOW(retv), 0);
+    tcg_gen_movi_i64(TCGV128_HIGH(retv), 0);
+}
+
 static void do_nonatomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
                                 TCGArg idx, MemOp memop, bool new_val,
                                 void (*gen)(TCGv_i32, TCGv_i32, TCGv_i32))
diff --git a/accel/tcg/atomic_common.c.inc b/accel/tcg/atomic_common.c.inc
index 6602d7689f..8f2ce43ee6 100644
--- a/accel/tcg/atomic_common.c.inc
+++ b/accel/tcg/atomic_common.c.inc
@@ -55,8 +55,53 @@ CMPXCHG_HELPER(cmpxchgq_be, uint64_t)
 CMPXCHG_HELPER(cmpxchgq_le, uint64_t)
 #endif
 
+#ifdef CONFIG_CMPXCHG128
+CMPXCHG_HELPER(cmpxchgo_be, Int128)
+CMPXCHG_HELPER(cmpxchgo_le, Int128)
+#endif
+
 #undef CMPXCHG_HELPER
 
+Int128 HELPER(nonatomic_cmpxchgo_be)(CPUArchState *env, target_ulong addr,
+                                     Int128 cmpv, Int128 newv, uint32_t oi)
+{
+#if TCG_TARGET_REG_BITS == 32
+    uintptr_t ra = GETPC();
+    Int128 oldv;
+
+    oldv = cpu_ld16_be_mmu(env, addr, oi, ra);
+    if (int128_eq(oldv, cmpv)) {
+        cpu_st16_be_mmu(env, addr, newv, oi, ra);
+    } else {
+        /* Even with comparison failure, still need a write cycle. */
+        probe_write(env, addr, 16, get_mmuidx(oi), ra);
+    }
+    return oldv;
+#else
+    g_assert_not_reached();
+#endif
+}
+
+Int128 HELPER(nonatomic_cmpxchgo_le)(CPUArchState *env, target_ulong addr,
+                                     Int128 cmpv, Int128 newv, uint32_t oi)
+{
+#if TCG_TARGET_REG_BITS == 32
+    uintptr_t ra = GETPC();
+    Int128 oldv;
+
+    oldv = cpu_ld16_le_mmu(env, addr, oi, ra);
+    if (int128_eq(oldv, cmpv)) {
+        cpu_st16_le_mmu(env, addr, newv, oi, ra);
+    } else {
+        /* Even with comparison failure, still need a write cycle. */
+        probe_write(env, addr, 16, get_mmuidx(oi), ra);
+    }
+    return oldv;
+#else
+    g_assert_not_reached();
+#endif
+}
+
 #define ATOMIC_HELPER(OP, TYPE) \
     TYPE HELPER(glue(atomic_,OP))(CPUArchState *env, target_ulong addr,  \
                                   TYPE val, uint32_t oi)                 \
-- 
2.34.1


