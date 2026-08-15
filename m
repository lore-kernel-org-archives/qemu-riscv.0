Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFF0C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 19:50:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvKKt-0007XL-N4; Sat, 15 Aug 2026 15:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKs-0007VS-2E
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:30 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKq-0008P9-2T
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:29 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2cee9b74ee1so15725535ad.3
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 12:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786823187; x=1787427987; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mYRQeAvknjyLDklW5tIpZ3uNJGDTrB+oedKoB4JiGRA=;
 b=g4ikNXdDR0JKVj4CbFGfWDj/B452xlzD7lsM9v4qA5J+PwdQeR45TUEU2ArXTZuJRk
 ZpwHTRlWruD53c9NJNfs4kyI3CjpfFU6zHY8Zz7Z9BKGAGPqcASSN5WHOPY9gJ1aZws6
 ekDeyIxdHYlWuYGJozwDnlTQm52vxKxlLFkNByeDcXCThH2/qB2qq+oyPKnbPDgI8k3d
 SBY1QeB4oXN6xtsr9vCmyCNcKV6unqHWTtUB7egwreNzBW4HAxIKiolpl7aPE3hI6GvO
 h2nj4hZT1IOQvJNLOR9arFyAQqfO10jQ53hRChQ7aFIss/ZxstVOjfZlhxhRgyO4qbHY
 +R8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786823187; x=1787427987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mYRQeAvknjyLDklW5tIpZ3uNJGDTrB+oedKoB4JiGRA=;
 b=Yj3wq5iL5A9H4ukpKYFDHKrH5aVW9gLxAWXhGgNRmqqmwz4sjWWaePavGR9jVsI++G
 tpgv0xdJTVAajwdfPubFEXsIQuoOTRWNX/KFZhXpkErPIZMyj8Tz1nq5MxXx7WSJ2dCs
 ZowS2RYAzC8Q+sD7vvT7LFr+dJcKOkarZsfaPHcIu6G/g/scgN2W7NGnsc1DDUZY+Zdf
 mrby4R6BSvP58jjMN+21RZtFfOWlr2oBhVKzCsKBOrZa4PTnPGNJZScmUfi3bk7aqdSi
 81OOS/twbazzMdhTPnQgyEy3f2l6iiPnFjvu4OFpGRdYKVHvjUThs0xvUoC2Z7v1LtyW
 Uy5A==
X-Forwarded-Encrypted: i=1;
 AHgh+RqwQM1pWALqc4nNAUOUvqR4XA2arg5QZzwVpFljVdd0+59Kne5mpzEn3mmng7RXPXO6zgNIj+5pVxjo@nongnu.org
X-Gm-Message-State: AOJu0YzFBX3YsDgWSRIHKmijVTCkA90Rfzc2I5LmC3qFjIQ6uv3Kn34h
 BIuPiKjefwvrQ5Upiqa8D5DGjBfhuT/N+Flxzv2TZm1EdalSMaFVIeS6Vmu/93sz1KQ=
X-Gm-Gg: AR+sD13usVmuISeT+Tm8ozznHN1g5ThyJ+Tnb2/TovXdFD6hkvcZdLUimhRraV7q2if
 QUPWcYhYL5aUULFujvp57azewnfhhsVrwyLdUgD1kZ7cAJf319CSkYUv+Hh0z9jTW1Cc8A0c37q
 smbGseD1l1PF1DmjTs2fyppe1UQ6j5sd7Bc9rzvtyu1tv9HOMQ8fLtC1qdFBOecbn98dkXFd2f2
 SoHjU4WZoKam/ejWgCLjmPVfDK6XtK1BTaQMgfjwAR7+5z1+9FEekWUoi8G/bhn1CL0lhL2WtAd
 n1Fea359In0fbhCfJIFKT3Cw/Eu0Dn5vQ+zsQpaxaQz0b/jnCoijWEzZKLXh2xG4M2v3OqPbIap
 EgoplN7hQFhitfaeQqrzPLmzf5n0HbrkTHy5mgs9Aoan/9lXV8WHz/NQMvyuVUsuYoK/FMrbH6p
 DqKx++Q4FEQahqkpb4ZMeciLgVnYVQ1EraFptsl3WzxcMf3yEtBKs6/y/Srrg+4v5ETiaQUqlgP
 pTmvL2szVGZfUbT0DX0
X-Received: by 2002:a17:902:e78c:b0:2ca:e19c:986 with SMTP id
 d9443c01a7336-2d3b0cdbd75mr172887785ad.1.1786823186696; 
 Sat, 15 Aug 2026 12:46:26 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3ae753ebcsm21179465ad.5.2026.08.15.12.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 12:46:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com,
	max.chou@sifive.com,
	qemu-riscv@nongnu.org
Subject: [PATCH 23/23] target/riscv: Drop v0 argument from
 gen_helper_ldst_index
Date: Sat, 15 Aug 2026 12:45:48 -0700
Message-ID: <20260815194549.1377505-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815194549.1377505-1-richard.henderson@linaro.org>
References: <20260815194549.1377505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Since we're also passing env, v0 is always env->vreg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                       | 64 ++++++++++-----------
 target/riscv/tcg/vector_helper.c            | 15 ++---
 target/riscv/tcg/insn_trans/trans_rvv.c.inc | 17 ++----
 3 files changed, 46 insertions(+), 50 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 82a478962b..96fb2347df 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -188,38 +188,38 @@ DEF_HELPER_5(vsse8_v, void, ptr, tl, tl, env, i32)
 DEF_HELPER_5(vsse16_v, void, ptr, tl, tl, env, i32)
 DEF_HELPER_5(vsse32_v, void, ptr, tl, tl, env, i32)
 DEF_HELPER_5(vsse64_v, void, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlxei8_8_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxei8_16_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxei16_8_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxei16_16_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxei16_64_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxei32_8_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxei32_16_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxei32_32_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxei32_64_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxei64_8_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxei64_16_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vlxei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxei8_8_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxei8_16_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxei16_8_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxei16_16_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxei16_64_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxei32_8_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxei32_16_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxei32_32_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxei32_64_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxei64_8_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxei64_16_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vsxei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vlxei8_8_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vlxei8_16_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vlxei8_32_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vlxei8_64_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vlxei16_8_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vlxei16_16_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vlxei16_32_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vlxei16_64_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vlxei32_8_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vlxei32_16_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vlxei32_32_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vlxei32_64_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vlxei64_8_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vlxei64_16_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vlxei64_32_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vlxei64_64_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vsxei8_8_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vsxei8_16_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vsxei8_32_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vsxei8_64_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vsxei16_8_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vsxei16_16_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vsxei16_32_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vsxei16_64_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vsxei32_8_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vsxei32_16_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vsxei32_32_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vsxei32_64_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vsxei64_8_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vsxei64_16_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vsxei64_32_v, void, ptr, tl, ptr, env, i32)
+DEF_HELPER_5(vsxei64_64_v, void, ptr, tl, ptr, env, i32)
 DEF_HELPER_4(vle8ff_v, void, ptr, tl, env, i32)
 DEF_HELPER_4(vle16ff_v, void, ptr, tl, env, i32)
 DEF_HELPER_4(vle32ff_v, void, ptr, tl, env, i32)
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 354c0b0da5..b7b3805a6d 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -601,12 +601,13 @@ GEN_VEXT_GET_INDEX_ADDR(idx_w, uint32_t, H4)
 GEN_VEXT_GET_INDEX_ADDR(idx_d, uint64_t, H8)
 
 static void
-vext_ldst_index(void *vd, void *v0, target_ulong base,
+vext_ldst_index(void *vd, target_ulong base,
                 void *vs2, CPURISCVState *env, uint32_t desc,
                 vext_get_index_addr get_index_addr,
                 vext_ldst_elem_fn_tlb *ldst_elem,
                 uint32_t log2_esz, uintptr_t ra)
 {
+    void *v0 = env->vreg;
     uint32_t nf = vext_nf(desc);
     uint32_t vm = vext_vm(desc);
     uint32_t max_elems = vext_max_elems(desc, log2_esz);
@@ -638,10 +639,10 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
 }
 
 #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)               \
-QEMU_FLATTEN void HELPER(NAME)(void *vd, void *v0, target_ulong base,   \
-                               void *vs2, CPURISCVState *env, uint32_t desc) \
+QEMU_FLATTEN void HELPER(NAME)(void *vd, target_ulong base, void *vs2,  \
+                               CPURISCVState *env, uint32_t desc)       \
 {                                                                       \
-    vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,             \
+    vext_ldst_index(vd, base, vs2, env, desc, INDEX_FN,                 \
                     LOAD_FN, ctzl(sizeof(ETYPE)), GETPC());             \
 }
 
@@ -663,10 +664,10 @@ GEN_VEXT_LD_INDEX(vlxei64_32_v, int32_t, idx_d, lde_w_tlb)
 GEN_VEXT_LD_INDEX(vlxei64_64_v, int64_t, idx_d, lde_d_tlb)
 
 #define GEN_VEXT_ST_INDEX(NAME, ETYPE, INDEX_FN, STORE_FN)              \
-QEMU_FLATTEN void HELPER(NAME)(void *vd, void *v0, target_ulong base,   \
-                               void *vs2, CPURISCVState *env, uint32_t desc) \
+QEMU_FLATTEN void HELPER(NAME)(void *vd, target_ulong base, void *vs2,  \
+                               CPURISCVState *env, uint32_t desc)       \
 {                                                                       \
-    vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,             \
+    vext_ldst_index(vd, base, vs2, env, desc, INDEX_FN,                 \
                     STORE_FN, ctzl(sizeof(ETYPE)), GETPC());            \
 }
 
diff --git a/target/riscv/tcg/insn_trans/trans_rvv.c.inc b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
index 5e352dbf41..4556c644cc 100644
--- a/target/riscv/tcg/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
@@ -975,33 +975,28 @@ GEN_VEXT_TRANS(vsse64_v, MO_64, rnfvm, st_stride_op, st_stride_check)
 /*
  *** index load and store
  */
-typedef void gen_helper_ldst_index(TCGv_ptr, TCGv_ptr, TCGv,
-                                   TCGv_ptr, TCGv_env, TCGv_i32);
+typedef void gen_helper_ldst_index(TCGv_ptr, TCGv, TCGv_ptr,
+                                   TCGv_env, TCGv_i32);
 
 static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
                              uint32_t data, gen_helper_ldst_index *fn,
                              DisasContext *s)
 {
-    TCGv_ptr dest, mask, index;
-    TCGv base;
+    TCGv_ptr dest = tcg_temp_new_ptr();
+    TCGv_ptr index = tcg_temp_new_ptr();
+    TCGv base = get_gpr(s, rs1, EXT_NONE);
     TCGv_i32 desc;
 
-    dest = tcg_temp_new_ptr();
-    mask = tcg_temp_new_ptr();
-    index = tcg_temp_new_ptr();
-    base = get_gpr(s, rs1, EXT_NONE);
-
     data = vdata_add_memopidx(s, data);
     desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
                                       s->cfg_ptr->vlenb, data));
 
     tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(index, tcg_env, vreg_ofs(s, vs2));
-    tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
 
     mark_vs_dirty(s);
 
-    fn(dest, mask, base, index, tcg_env, desc);
+    fn(dest, base, index, tcg_env, desc);
 
     finalize_rvv_inst(s);
     return true;
-- 
2.43.0


