Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtsch-0006Fa-2g
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqe8-0005bl-U1
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:48 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:37286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqe3-0006lO-VQ
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:48 -0400
Received: by mail-pl1-x643.google.com with SMTP id p1so2102535pls.4
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QVVdfGmmz0q3v7WLZzm0DoSH2sziwGfoaHkjoMqBj9M=;
 b=itmCJIkUANWO6WwBWapWmo358FBcz3y1Rehzw16m5E2GcEBPYj5N4OMg+lQ/eXZK5K
 9EhFcslAU0c8GXjlj1wJwyHWODxGreeiu+VUWcF1NWdZ94MF3rFdtisYLLzpHaHjQUI7
 XA/4JSwKpM36tHlin82R4AAL1SC7QD32yeoYRCltVlgHPsrZzGgyrfXUCb3j0dhzq7eM
 sGchcmIa8rhF1iUNhPHGpywkx+BsyaoZpjv738cj3gqLCmROYX96wpeGJYoUQSRZMQqj
 j3TVxxl+Eq2u06//6x1P86vqvMd1byyuFISs9CkOhGMpVL+EDDWBpTiyfm+eiCxJwWhL
 xRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QVVdfGmmz0q3v7WLZzm0DoSH2sziwGfoaHkjoMqBj9M=;
 b=SEHgh0f4c4SZiyphRklW5hCY7kdVVokNuz8nMmPa6ZSEcJt8rvGpxgRu3j0KwsKETQ
 5VMuXYjOU1THo+hgFeJ2lWzZmxR1ARekm3uWq35oPLsiaeFU8XOrDLdJiC/o5ifJVjCJ
 3bjaugcnyRp9GXe02+XrKO8ZtW/3hUa1gt9WV/0YHmfnTXAZOuuMNPx1OUo9kjf62BOF
 ldiSzu5Fw2IHr4vPgfM2Ta908XcaWmRvC1edh5Yqv6xuenM+bXmpYImY0ji4ocuYYRE8
 4rLUMnsZ0SvBCqFwC3sA6o4WrIUm+uhziz4nMoHOT9PkHOVxvBjpsoPlAXbCB/XjQ7Zl
 NTEA==
X-Gm-Message-State: AOAM532zCNSkURUXQLnpoaRS89+akex+nw66gFURYBylSXz6+0TTg2iO
 DPYKC0prIMiXAjp/mzyDMbLzpg==
X-Google-Smtp-Source: ABdhPJyXXJdgpya0QMXtTZtSoquC7VpAnbQ4tdT4EnckMg/W4GZ3B3SlWlIrS2B1oJpuefLtPb0pzA==
X-Received: by 2002:a17:90a:a413:: with SMTP id
 y19mr4904573pjp.59.1594378362805; 
 Fri, 10 Jul 2020 03:52:42 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:52:42 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 32/65] target/riscv: rvv-0.9: integer extension instructions
Date: Fri, 10 Jul 2020 18:48:46 +0800
Message-Id: <20200710104920.13550-33-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:58:59 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:52:49 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vzext.vf2
* vzext.vf4
* vzext.vf8
* vsext.vf2
* vsext.vf4
* vsext.vf8

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   | 14 ++++
 target/riscv/insn32.decode              |  8 +++
 target/riscv/insn_trans/trans_rvv.inc.c | 94 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 34 +++++++++
 4 files changed, 150 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index f759d4cbc6..e53fad1fd5 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1096,3 +1096,17 @@ DEF_HELPER_6(vcompress_vm_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_5(vzext_vf2_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vzext_vf2_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vzext_vf2_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vzext_vf4_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vzext_vf4_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vzext_vf8_d, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_5(vsext_vf2_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vsext_vf2_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vsext_vf2_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vsext_vf4_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vsext_vf4_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vsext_vf8_d, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0e1d6b3ead..5c31936a92 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -600,5 +600,13 @@ vmv2r_v         100111 1 ..... 00001 011 ..... 1010111 @r2rd
 vmv4r_v         100111 1 ..... 00011 011 ..... 1010111 @r2rd
 vmv8r_v         100111 1 ..... 00111 011 ..... 1010111 @r2rd
 
+# Vector Integer Extension
+vzext_vf2       010010 . ..... 00110 010 ..... 1010111 @r2_vm
+vzext_vf4       010010 . ..... 00100 010 ..... 1010111 @r2_vm
+vzext_vf8       010010 . ..... 00010 010 ..... 1010111 @r2_vm
+vsext_vf2       010010 . ..... 00111 010 ..... 1010111 @r2_vm
+vsext_vf4       010010 . ..... 00101 010 ..... 1010111 @r2_vm
+vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
+
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 41777c7f93..dc9064e868 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -352,6 +352,23 @@ static bool vext_check_overlap_mask(DisasContext *s, uint32_t vd, bool vm,
     return (vm != 0 || vd != 0) || (!force && (s->lmul == 0));
 }
 
+/*
+ * Check function for vector integer extension instructions.
+ */
+#define VEXT_CHECK_EXT(s, rd, rs2, vm, div) do {                 \
+    uint32_t from = (1 << (s->sew + 3)) / div;                   \
+    require(from >= 8 && from <= 64);                            \
+    require(rd != rs2);                                          \
+    require_align(rd, s->flmul);                                 \
+    require_align(rs2, s->flmul / div);                          \
+    if ((s->flmul / div) < 1) {                                  \
+        require_noover(rd, s->flmul, rs2, s->flmul / div);       \
+    } else {                                                     \
+        require_noover_widen(rd, s->flmul, rs2, s->flmul / div); \
+    }                                                            \
+    require_vm(vm, rd);                                          \
+} while (0)
+
 /*
  * In cpu_get_tb_cpu_state(), set VILL if RVV was not present.
  * So RVV is also be checked in this function.
@@ -3247,3 +3264,80 @@ GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
 GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
 GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
 GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
+
+static bool int_ext_check(DisasContext *s, arg_rmr *a, uint8_t div)
+{
+    REQUIRE_RVV;
+    VEXT_CHECK_EXT(s, a->rd, a->rs2, a->vm, div);
+    return true;
+}
+
+static bool int_ext_op(DisasContext *s, arg_rmr *a, uint8_t seq)
+{
+    uint32_t data = 0;
+    gen_helper_gvec_3_ptr *fn;
+    TCGLabel *over = gen_new_label();
+    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+
+    static gen_helper_gvec_3_ptr * const fns[6][4] = {
+        {
+            NULL, gen_helper_vzext_vf2_h,
+            gen_helper_vzext_vf2_w, gen_helper_vzext_vf2_d
+        },
+        {
+            NULL, NULL,
+            gen_helper_vzext_vf4_w, gen_helper_vzext_vf4_d,
+        },
+        {
+            NULL, NULL,
+            NULL, gen_helper_vzext_vf8_d
+        },
+        {
+            NULL, gen_helper_vsext_vf2_h,
+            gen_helper_vsext_vf2_w, gen_helper_vsext_vf2_d
+        },
+        {
+            NULL, NULL,
+            gen_helper_vsext_vf4_w, gen_helper_vsext_vf4_d,
+        },
+        {
+            NULL, NULL,
+            NULL, gen_helper_vsext_vf8_d
+        }
+    };
+
+    fn = fns[seq][s->sew];
+    if (fn == NULL) {
+        return false;
+    }
+
+    data = FIELD_DP32(data, VDATA, VM, a->vm);
+    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, VTA, s->vta);
+    data = FIELD_DP32(data, VDATA, VMA, s->vma);
+
+    tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
+                       vreg_ofs(s, a->rs2), cpu_env, 0,
+                       s->vlen / 8, data, fn);
+
+    mark_vs_dirty(s);
+    gen_set_label(over);
+    return true;
+}
+
+/* Vector Integer Extension */
+#define GEN_INT_EXT_TRANS(NAME, DIV, SEQ)             \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a) \
+{                                                     \
+    if (int_ext_check(s, a, DIV)) {                   \
+        return int_ext_op(s, a, SEQ);                 \
+    }                                                 \
+    return false;                                     \
+}
+
+GEN_INT_EXT_TRANS(vzext_vf2, 2, 0)
+GEN_INT_EXT_TRANS(vzext_vf4, 4, 1)
+GEN_INT_EXT_TRANS(vzext_vf8, 8, 2)
+GEN_INT_EXT_TRANS(vsext_vf2, 2, 3)
+GEN_INT_EXT_TRANS(vsext_vf4, 4, 4)
+GEN_INT_EXT_TRANS(vsext_vf8, 8, 5)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 71a12c6c9b..70a4505736 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4976,3 +4976,37 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_b, uint8_t, H1, clearb)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_h, uint16_t, H2, clearh)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_w, uint32_t, H4, clearl)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8, clearq)
+
+/* Vector Integer Extension */
+#define GEN_VEXT_INT_EXT(NAME, ETYPE, DTYPE, HD, HS1, CLEAR_FN)       \
+void HELPER(NAME)(void *vd, void *v0, void *vs2,                      \
+                  CPURISCVState *env, uint32_t desc)                  \
+{                                                                     \
+    uint32_t vlmax = vext_max_elems(desc, sizeof(ETYPE), false);      \
+    uint32_t vta = vext_vta(desc);                                    \
+    uint32_t vl = env->vl;                                            \
+    uint32_t vm = vext_vm(desc);                                      \
+    uint32_t i;                                                       \
+                                                                      \
+    for (i = 0; i < vl; i++) {                                        \
+        if (!vm && !vext_elem_mask(v0, i)) {                          \
+            continue;                                                 \
+        }                                                             \
+        *((ETYPE *)vd + HD(i)) = *((DTYPE *)vs2 + HS1(i));            \
+    }                                                                 \
+    CLEAR_FN(vd, vta, vl, vl * sizeof(ETYPE), vlmax * sizeof(ETYPE)); \
+}
+
+GEN_VEXT_INT_EXT(vzext_vf2_h, uint16_t, uint8_t,  H2, H1, clearh)
+GEN_VEXT_INT_EXT(vzext_vf2_w, uint32_t, uint16_t, H4, H2, clearl)
+GEN_VEXT_INT_EXT(vzext_vf2_d, uint64_t, uint32_t, H8, H4, clearq)
+GEN_VEXT_INT_EXT(vzext_vf4_w, uint32_t, uint8_t,  H4, H1, clearl)
+GEN_VEXT_INT_EXT(vzext_vf4_d, uint64_t, uint16_t, H8, H2, clearq)
+GEN_VEXT_INT_EXT(vzext_vf8_d, uint64_t, uint8_t,  H8, H1, clearq)
+
+GEN_VEXT_INT_EXT(vsext_vf2_h, int16_t, int8_t,  H2, H1, clearh)
+GEN_VEXT_INT_EXT(vsext_vf2_w, int32_t, int16_t, H4, H2, clearl)
+GEN_VEXT_INT_EXT(vsext_vf2_d, int64_t, int32_t, H8, H4, clearq)
+GEN_VEXT_INT_EXT(vsext_vf4_w, int32_t, int8_t,  H4, H1, clearl)
+GEN_VEXT_INT_EXT(vsext_vf4_d, int64_t, int16_t, H8, H2, clearq)
+GEN_VEXT_INT_EXT(vsext_vf8_d, int64_t, int8_t,  H8, H1, clearq)
-- 
2.17.1


