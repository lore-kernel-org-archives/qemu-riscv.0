Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852DEC5DF88
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 04:07:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxGV1-0006Tt-VJ; Fri, 21 Aug 2026 00:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUa-00068Q-0o
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:33 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUV-0003Fe-Jy
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:31 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-3900e39d935so503006a91.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 21:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787285065; x=1787889865; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=erKbFuTfEb8twlwL8KOeUQx1ZKUgJRBYtRM9xW0W6Yg=;
 b=D7wCuV/jj3pRuUFGjoFdgDIEiggZu6JLV7DenVmi1mCMQsSQMemiBNIr/0UxlnLilg
 gYg0AaPY9RmAdeoqgAfAjjFu3gOnGOxRdEkPc33/HM7+boTI2d2CH+MTnxuXsE1c96Ht
 AbGK6BIkyXmWyAD+UubXfT5E1pHevDiPyr2SWzOO69LlvgJg1/djWKnNYbgQKp52ZgCr
 TV1o+AB6HufXD4Yj8FVZcKKhAIk1aBlh/rAHQs5vEwdn2VnCD+/kSNX8+p6omkRhbrUG
 nVA1UYAbJxW+fqgsd728OnoJ0LFRJT2kg5OaRmfHI06/fIsyo7Md3G1YFMXvj1SC4EEN
 s0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787285065; x=1787889865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=erKbFuTfEb8twlwL8KOeUQx1ZKUgJRBYtRM9xW0W6Yg=;
 b=JAE2oEyCnD5aQx81v/5lMI1PoltYMSzOfzZ4nViKQ2rwsMdzdrEZxjqpg6AgiJrqPJ
 iwEV/ZuAxPdKoCG3JCVBDJhMZ4lOExfQVdzQDvGCruw/SGsYVlVEu2rUmaN9+q+U4NhF
 +oxHD8rs88dZn2StQ0S+8VR+Tp4jFq8SARE+2WUArSonNeTUDu43pXcA7l/Ok4pXcHMv
 vQTz1HeyGSRr9bHAwReryRO/JNmaILJy2RBXrsKSr+dXp5ElLfV0oS2Ofi7/Md7HissZ
 bsVSRw+HFimzKIz6ao4Hily6d5hKp/0gzmI/EtT/9sE43MymOjKmUwqqx6GMmn6pVZA7
 I7nw==
X-Gm-Message-State: AFuF++mbAREtQ0TMbxBBrGPaZtFDfshG2YpgyPoqu55DzDIlHWrGW2N9
 Z8r/OvfSRf+r/8f4/ia+FIEr2wcajnuCMN9jByEm4nRSmncNvAkV9xHH69rjWpauFyc=
X-Gm-Gg: AR+sD101aA+hbGx3PIrGtOeLt2AAiKXRc/PB8RRjyzQ8pgkKNo+IhAu61kP1TxVqj1u
 1zA1X0J2ix2aJKavbpW9Hkd4g5nnuGU+H6pg+Cca3CjhgCpV/hVB52lylxfgfLoqn1iuTRNW1gk
 evH8heiZNq3NC7baIYNYPrePgueyCKhNaZX7kf+OBYSF+NGCxn34Vq+aPnHk/PE0efsygJnAcpd
 NYWo1KGL1YxR6oZn0j6AZGi30mBxjEmNfKwm8/RkJX1eOe3WUJ85kts/zFegMqRexZA//cNs1Dm
 Cjck4NQnmtUwSUlt5U02RsF/D2kX/2+zWiP1e7qWrhxqSe1yNfKmplWttaN0tycGipw+4Vob7cK
 3YyAfoaJyZsPuGGH8KMSYCjWBh6JHAVgelUNamzejfWGJ6Hk9yntI12589tHnM1pop5IAEirNlx
 zF8xvuCd/yKbLHZ6SOLs6MDl5NbWyI1sSedzI7lW/cVLuLmQt+bvJNflNd/Sst6F10T2Y=
X-Received: by 2002:a17:90b:4a89:b0:38e:fea2:df53 with SMTP id
 98e67ed59e1d1-395c3511456mr5730420a91.4.1787285065190; 
 Thu, 20 Aug 2026 21:04:25 -0700 (PDT)
Received: from stoup.. ([108.174.179.84]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4c194d2sm1298383a91.15.2026.08.20.21.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 21:04:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH v2 18/23] target/riscv: Use FLATTEN rather than ALWAYS_INLINE
 for vector ldst
Date: Thu, 20 Aug 2026 21:03:59 -0700
Message-ID: <20260821040404.268123-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821040404.268123-1-richard.henderson@linaro.org>
References: <20260821040404.268123-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

It turns out there are fewer places that need annotation if we
just flatten from the outer helper macros instead of everything
along the call stack.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/vector_helper.c | 147 +++++++++++++++----------------
 1 file changed, 70 insertions(+), 77 deletions(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index f65da46144..c5b4085f9c 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -158,7 +158,7 @@ static inline void vext_set_elem_mask(void *v0, int index,
     ((uint64_t *)v0)[idx] = deposit64(old, pos, 1, value);
 }
 
-static inline MemOpIdx vext_oi(uint32_t desc, MemOp memop)
+static MemOpIdx vext_oi(uint32_t desc, MemOp memop)
 {
     uint32_t data = simd_data(desc);
 
@@ -178,20 +178,18 @@ typedef void vext_ldst_elem_fn_tlb(CPURISCVState *env, abi_ptr addr,
 typedef void vext_ldst_elem_fn_host(void *vd, uint32_t idx, void *host);
 
 #define GEN_VEXT_TLB_LD_ELEM(NAME, ETYPE, H, LDSUF)                     \
-static inline QEMU_ALWAYS_INLINE                                        \
-void NAME##_tlb(CPURISCVState *env, abi_ptr addr, uint32_t idx,         \
-                void *vd, MemOpIdx oi, uintptr_t retaddr)               \
+static void NAME##_tlb(CPURISCVState *env, abi_ptr addr, uint32_t idx,  \
+                       void *vd, MemOpIdx oi, uintptr_t retaddr)        \
 {                                                                       \
     ETYPE *cur = ((ETYPE *)vd + H(idx));                                \
     *cur = cpu_##LDSUF##_mmu(env, addr, oi, retaddr);                   \
 }
 
-#define GEN_VEXT_HOST_LD_ELEM(NAME, ETYPE, H, LDSUF)        \
-static inline QEMU_ALWAYS_INLINE                            \
-void NAME##_host(void *vd, uint32_t idx, void *host)        \
-{                                                           \
-    ETYPE *cur = ((ETYPE *)vd + H(idx));                    \
-    *cur = (ETYPE)LDSUF##_p(host);                          \
+#define GEN_VEXT_HOST_LD_ELEM(NAME, ETYPE, H, LDSUF)                    \
+static void NAME##_host(void *vd, uint32_t idx, void *host)             \
+{                                                                       \
+    ETYPE *cur = ((ETYPE *)vd + H(idx));                                \
+    *cur = (ETYPE)LDSUF##_p(host);                                      \
 }
 
 GEN_VEXT_TLB_LD_ELEM(lde_b, uint8_t,  H1, ldb)
@@ -205,20 +203,18 @@ GEN_VEXT_HOST_LD_ELEM(lde_w, uint32_t, H4, ldl_le)
 GEN_VEXT_HOST_LD_ELEM(lde_d, uint64_t, H8, ldq_le)
 
 #define GEN_VEXT_TLB_ST_ELEM(NAME, ETYPE, H, STSUF)                     \
-static inline QEMU_ALWAYS_INLINE                                        \
-void NAME##_tlb(CPURISCVState *env, abi_ptr addr, uint32_t idx,         \
+static void NAME##_tlb(CPURISCVState *env, abi_ptr addr, uint32_t idx,  \
                 void *vd, MemOpIdx oi, uintptr_t retaddr)               \
 {                                                                       \
     ETYPE data = *((ETYPE *)vd + H(idx));                               \
     cpu_##STSUF##_mmu(env, addr, data, oi, retaddr);                    \
 }
 
-#define GEN_VEXT_HOST_ST_ELEM(NAME, ETYPE, H, STSUF)        \
-static inline QEMU_ALWAYS_INLINE                            \
-void NAME##_host(void *vd, uint32_t idx, void *host)        \
-{                                                           \
-    ETYPE data = *((ETYPE *)vd + H(idx));                   \
-    STSUF##_p(host, data);                                  \
+#define GEN_VEXT_HOST_ST_ELEM(NAME, ETYPE, H, STSUF)                    \
+static void NAME##_host(void *vd, uint32_t idx, void *host)             \
+{                                                                       \
+    ETYPE data = *((ETYPE *)vd + H(idx));                               \
+    STSUF##_p(host, data);                                              \
 }
 
 GEN_VEXT_TLB_ST_ELEM(ste_b, uint8_t,  H1, stb)
@@ -308,9 +304,9 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base, target_ulong stride,
 }
 
 #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
-void HELPER(NAME)(void *vd, void * v0, target_ulong base,               \
-                  target_ulong stride, CPURISCVState *env,              \
-                  uint32_t desc)                                        \
+QEMU_FLATTEN void HELPER(NAME)(void *vd, void * v0, target_ulong base,  \
+                               target_ulong stride, CPURISCVState *env, \
+                               uint32_t desc)                           \
 {                                                                       \
     uint32_t vm = vext_vm(desc);                                        \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, LOAD_FN,      \
@@ -323,9 +319,9 @@ GEN_VEXT_LD_STRIDE(vlse32_v, int32_t, lde_w_tlb)
 GEN_VEXT_LD_STRIDE(vlse64_v, int64_t, lde_d_tlb)
 
 #define GEN_VEXT_ST_STRIDE(NAME, ETYPE, STORE_FN)                       \
-void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
-                  target_ulong stride, CPURISCVState *env,              \
-                  uint32_t desc)                                        \
+QEMU_FLATTEN void HELPER(NAME)(void *vd, void *v0, target_ulong base,   \
+                               target_ulong stride, CPURISCVState *env, \
+                               uint32_t desc)                           \
 {                                                                       \
     uint32_t vm = vext_vm(desc);                                        \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, STORE_FN,     \
@@ -342,7 +338,7 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d_tlb)
  */
 
 /* unmasked unit-stride load and store operation */
-static inline QEMU_ALWAYS_INLINE void
+static void
 vext_page_ldst_us_host(void *vd, void *host, uint32_t i, uint32_t evl,
                        uint32_t nf, uint32_t log2_esz, uint32_t max_elems,
                        vext_ldst_elem_fn_host *ldst_host, bool is_load)
@@ -372,7 +368,7 @@ vext_page_ldst_us_host(void *vd, void *host, uint32_t i, uint32_t evl,
     }
 }
 
-static inline QEMU_ALWAYS_INLINE void
+static void
 vext_page_ldst_us_tlb(CPURISCVState *env, void *vd, target_ulong addr,
                       uint32_t i, uint32_t evl, uint32_t nf,
                       uint32_t log2_esz, uint32_t max_elems,
@@ -403,7 +399,7 @@ static void vext_test_alignment(CPURISCVState *env, vaddr addr, uint32_t esz,
     }
 }
 
-static inline QEMU_ALWAYS_INLINE void
+static void
 vext_ldst_us_notail(void *vd, target_ulong base, CPURISCVState *env,
                     uint32_t log2_esz, uint32_t nf, uint32_t evl,
                     uint32_t max_elems, bool vma,
@@ -499,7 +495,7 @@ vext_ldst_us_notail(void *vd, target_ulong base, CPURISCVState *env,
     }
 }
 
-static inline QEMU_ALWAYS_INLINE void
+static void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
              vext_ldst_elem_fn_tlb *ldst_tlb,
              vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz,
@@ -521,20 +517,19 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
  * stride, stride = NF * sizeof (ETYPE)
  */
 
-#define GEN_VEXT_LD_US(NAME, ETYPE, LOAD_FN_TLB, LOAD_FN_HOST)      \
-void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,     \
-                         CPURISCVState *env, uint32_t desc)         \
-{                                                                   \
-    uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));         \
-    vext_ldst_stride(vd, v0, base, stride, env, desc, false,        \
-                     LOAD_FN_TLB, ctzl(sizeof(ETYPE)), GETPC());    \
-}                                                                   \
-                                                                    \
-void HELPER(NAME)(void *vd, void *v0, target_ulong base,            \
-                  CPURISCVState *env, uint32_t desc)                \
-{                                                                   \
-    vext_ldst_us(vd, base, env, desc, LOAD_FN_TLB, LOAD_FN_HOST,    \
-                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), true);      \
+#define GEN_VEXT_LD_US(NAME, ETYPE, LOAD_FN_TLB, LOAD_FN_HOST)          \
+QEMU_FLATTEN void HELPER(NAME##_mask)(void *vd, void *v0,               \
+    target_ulong base, CPURISCVState *env, uint32_t desc)               \
+{                                                                       \
+    uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));             \
+    vext_ldst_stride(vd, v0, base, stride, env, desc, false,            \
+                     LOAD_FN_TLB, ctzl(sizeof(ETYPE)), GETPC());        \
+}                                                                       \
+QEMU_FLATTEN void HELPER(NAME)(void *vd, void *v0, target_ulong base,   \
+                               CPURISCVState *env, uint32_t desc)       \
+{                                                                       \
+    vext_ldst_us(vd, base, env, desc, LOAD_FN_TLB, LOAD_FN_HOST,        \
+                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), true);          \
 }
 
 GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b_tlb, lde_b_host)
@@ -543,16 +538,15 @@ GEN_VEXT_LD_US(vle32_v, int32_t, lde_w_tlb, lde_w_host)
 GEN_VEXT_LD_US(vle64_v, int64_t, lde_d_tlb, lde_d_host)
 
 #define GEN_VEXT_ST_US(NAME, ETYPE, STORE_FN_TLB, STORE_FN_HOST)         \
-void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,          \
-                         CPURISCVState *env, uint32_t desc)              \
+QEMU_FLATTEN void HELPER(NAME##_mask)(void *vd, void *v0,                \
+    target_ulong base, CPURISCVState *env, uint32_t desc)                \
 {                                                                        \
     uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));              \
     vext_ldst_stride(vd, v0, base, stride, env, desc, false,             \
                      STORE_FN_TLB, ctzl(sizeof(ETYPE)), GETPC());        \
 }                                                                        \
-                                                                         \
-void HELPER(NAME)(void *vd, void *v0, target_ulong base,                 \
-                  CPURISCVState *env, uint32_t desc)                     \
+QEMU_FLATTEN void HELPER(NAME)(void *vd, void *v0, target_ulong base,    \
+                               CPURISCVState *env, uint32_t desc)        \
 {                                                                        \
     vext_ldst_us(vd, base, env, desc, STORE_FN_TLB, STORE_FN_HOST,       \
                  ctzl(sizeof(ETYPE)), env->vl, GETPC(), false);          \
@@ -566,8 +560,8 @@ GEN_VEXT_ST_US(vse64_v, int64_t, ste_d_tlb, ste_d_host)
 /*
  * unit stride mask load and store, EEW = 1
  */
-void HELPER(vlm_v)(void *vd, void *v0, target_ulong base,
-                    CPURISCVState *env, uint32_t desc)
+QEMU_FLATTEN void HELPER(vlm_v)(void *vd, void *v0, target_ulong base,
+                                CPURISCVState *env, uint32_t desc)
 {
     /* evl = ceil(vl/8) */
     uint8_t evl = (env->vl + 7) >> 3;
@@ -575,8 +569,8 @@ void HELPER(vlm_v)(void *vd, void *v0, target_ulong base,
                  0, evl, GETPC(), true);
 }
 
-void HELPER(vsm_v)(void *vd, void *v0, target_ulong base,
-                    CPURISCVState *env, uint32_t desc)
+QEMU_FLATTEN void HELPER(vsm_v)(void *vd, void *v0, target_ulong base,
+                                CPURISCVState *env, uint32_t desc)
 {
     /* evl = ceil(vl/8) */
     uint8_t evl = (env->vl + 7) >> 3;
@@ -602,7 +596,7 @@ GEN_VEXT_GET_INDEX_ADDR(idx_h, uint16_t, H2)
 GEN_VEXT_GET_INDEX_ADDR(idx_w, uint32_t, H4)
 GEN_VEXT_GET_INDEX_ADDR(idx_d, uint64_t, H8)
 
-static inline void
+static void
 vext_ldst_index(void *vd, void *v0, target_ulong base,
                 void *vs2, CPURISCVState *env, uint32_t desc,
                 vext_get_index_addr get_index_addr,
@@ -637,12 +631,12 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
 }
 
-#define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
-void HELPER(NAME)(void *vd, void *v0, target_ulong base,                   \
-                  void *vs2, CPURISCVState *env, uint32_t desc)            \
-{                                                                          \
-    vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,                \
-                    LOAD_FN, ctzl(sizeof(ETYPE)), GETPC());                \
+#define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)               \
+QEMU_FLATTEN void HELPER(NAME)(void *vd, void *v0, target_ulong base,   \
+                               void *vs2, CPURISCVState *env, uint32_t desc) \
+{                                                                       \
+    vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,             \
+                    LOAD_FN, ctzl(sizeof(ETYPE)), GETPC());             \
 }
 
 GEN_VEXT_LD_INDEX(vlxei8_8_v,   int8_t,  idx_b, lde_b_tlb)
@@ -662,13 +656,12 @@ GEN_VEXT_LD_INDEX(vlxei64_16_v, int16_t, idx_d, lde_h_tlb)
 GEN_VEXT_LD_INDEX(vlxei64_32_v, int32_t, idx_d, lde_w_tlb)
 GEN_VEXT_LD_INDEX(vlxei64_64_v, int64_t, idx_d, lde_d_tlb)
 
-#define GEN_VEXT_ST_INDEX(NAME, ETYPE, INDEX_FN, STORE_FN)       \
-void HELPER(NAME)(void *vd, void *v0, target_ulong base,         \
-                  void *vs2, CPURISCVState *env, uint32_t desc)  \
-{                                                                \
-    vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,      \
-                    STORE_FN, ctzl(sizeof(ETYPE)),               \
-                    GETPC());                                    \
+#define GEN_VEXT_ST_INDEX(NAME, ETYPE, INDEX_FN, STORE_FN)              \
+QEMU_FLATTEN void HELPER(NAME)(void *vd, void *v0, target_ulong base,   \
+                               void *vs2, CPURISCVState *env, uint32_t desc) \
+{                                                                       \
+    vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,             \
+                    STORE_FN, ctzl(sizeof(ETYPE)), GETPC());            \
 }
 
 GEN_VEXT_ST_INDEX(vsxei8_8_v,   int8_t,  idx_b, ste_b_tlb)
@@ -691,7 +684,7 @@ GEN_VEXT_ST_INDEX(vsxei64_64_v, int64_t, idx_d, ste_d_tlb)
 /*
  * unit-stride fault-only-fisrt load instructions
  */
-static inline void
+static void
 vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
           uint32_t desc, vext_ldst_elem_fn_tlb *ldst_tlb,
           vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz, uintptr_t ra)
@@ -922,12 +915,12 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
     vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
 }
 
-#define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN_TLB, LOAD_FN_HOST)   \
-void HELPER(NAME)(void *vd, void *v0, target_ulong base,        \
-                  CPURISCVState *env, uint32_t desc)            \
-{                                                               \
-    vext_ldff(vd, v0, base, env, desc, LOAD_FN_TLB,             \
-              LOAD_FN_HOST, ctzl(sizeof(ETYPE)), GETPC());      \
+#define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN_TLB, LOAD_FN_HOST)           \
+QEMU_FLATTEN void HELPER(NAME)(void *vd, void *v0, target_ulong base,   \
+                               CPURISCVState *env, uint32_t desc)       \
+{                                                                       \
+    vext_ldff(vd, v0, base, env, desc, LOAD_FN_TLB,                     \
+              LOAD_FN_HOST, ctzl(sizeof(ETYPE)), GETPC());              \
 }
 
 GEN_VEXT_LDFF(vle8ff_v,  int8_t,  lde_b_tlb, lde_b_host)
@@ -948,7 +941,7 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d_tlb, lde_d_host)
 /*
  * load and store whole register instructions
  */
-static inline QEMU_ALWAYS_INLINE void
+static void
 vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
                 vext_ldst_elem_fn_tlb *ldst_tlb,
                 vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz,
@@ -963,8 +956,8 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
 }
 
 #define GEN_VEXT_LD_WHOLE(NAME, ETYPE, LOAD_FN_TLB, LOAD_FN_HOST)   \
-void HELPER(NAME)(void *vd, target_ulong base, CPURISCVState *env,  \
-                  uint32_t desc)                                    \
+QEMU_FLATTEN void HELPER(NAME)(void *vd, target_ulong base,         \
+                               CPURISCVState *env, uint32_t desc)   \
 {                                                                   \
     vext_ldst_whole(vd, base, env, desc, LOAD_FN_TLB, LOAD_FN_HOST, \
                     ctzl(sizeof(ETYPE)), GETPC(), true);            \
@@ -988,8 +981,8 @@ GEN_VEXT_LD_WHOLE(vl8re32_v, int32_t, lde_w_tlb, lde_w_host)
 GEN_VEXT_LD_WHOLE(vl8re64_v, int64_t, lde_d_tlb, lde_d_host)
 
 #define GEN_VEXT_ST_WHOLE(NAME, ETYPE, STORE_FN_TLB, STORE_FN_HOST)     \
-void HELPER(NAME)(void *vd, target_ulong base, CPURISCVState *env,      \
-                  uint32_t desc)                                        \
+QEMU_FLATTEN void HELPER(NAME)(void *vd, target_ulong base,             \
+                               CPURISCVState *env, uint32_t desc)       \
 {                                                                       \
     vext_ldst_whole(vd, base, env, desc, STORE_FN_TLB, STORE_FN_HOST,   \
                     ctzl(sizeof(ETYPE)), GETPC(), false);               \
-- 
2.43.0


