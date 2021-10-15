Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHxy-0001FV-H8
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxw-00018q-Mp
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:20 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:52938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxu-0003yp-MF
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:20 -0400
Received: by mail-pj1-x102f.google.com with SMTP id oa4so6670863pjb.2
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jnPgFyoAu3GQMnAVjF4thF+qb/wTK3CwUiZ28rW7CN8=;
 b=OiEE2jXrbuL/REAEeeQheBFnLQPRNXEvJclpbcmdn4z/tiM754ayeO+wJURknx7fcb
 X5hh5PfeXXasHXDf1EChLoK9WUJOI59lnVaFjD0lHjNdnYD8VMa0iYRQAk58X2yohUkT
 JyFQ+6uXTMF5LXPr4IKOJWQWUEpBcWOO+Xywz2T7l6F7g/MJV1Pul5+YkVSBWj3+1KlO
 dIL6ca+q0UX6avu2TeiPiHGaDc17RNOotS/KNEKwFwtvDqWbp417mi9PDCjiMMMP4Tbg
 aj3I3vykUCNW4L1fkxrylnW5rCdOWQ4gCCeTBMYB5uFnTXqfCOWBr0EX3lVZzL7B0F3Z
 65OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jnPgFyoAu3GQMnAVjF4thF+qb/wTK3CwUiZ28rW7CN8=;
 b=8AQcb5LEY6L1aFoiFrCqIESFyrBq7RnI7q3L4qPUgpPQL4c9BCvTljQ6i3ZTyN1rDC
 s3Tjegr+g8pG+lIVIOTvX/XkhEsRSuH+o9ErD9QhYTIejI+Q+5nq78jnmgwUxBIHvQr3
 GbOxdtvztpi+5ED4wWNWrD2ixv1TERIRyXNSZ7QnBd1+DkyKQE11eAQzkLMXW06QYQbp
 G+zED74zt5iM/7wbfJmXOlEeFAjeVh9V6Ys7EilLubk59mHkRJT2xd1e+bS0VwFPKZ4s
 U8vEbIlTS7haduGPIKA+nafBH/R9F4gTk4zto4T8L3Q4f+5OtzlQjJL6nEJd4lix0ftL
 22Hw==
X-Gm-Message-State: AOAM532VmmZu4fjC9F2Z+fNkANoebfEcc4wH2saRpnC7sy6Jqt8GM1wy
 slZE6TQc4Fe5dtsKjhgt6avx3u4jllW2kfRa
X-Google-Smtp-Source: ABdhPJxCxUB5pBDtdezODm/cX5Xe7D9hgWO+kOSvpO6QzJvPfr2A5+RjEyvi67AX2o3OljDX/yiMyw==
X-Received: by 2002:a17:90b:390b:: with SMTP id
 ob11mr26341754pjb.145.1634284157355; 
 Fri, 15 Oct 2021 00:49:17 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:17 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 40/78] target/riscv: rvv-1.0: integer extension instructions
Date: Fri, 15 Oct 2021 15:45:48 +0800
Message-Id: <20211015074627.3957162-48-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:49:21 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vzext.vf2
* vzext.vf4
* vzext.vf8
* vsext.vf2
* vsext.vf4
* vsext.vf8

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 14 +++++
 target/riscv/insn32.decode              |  8 +++
 target/riscv/insn_trans/trans_rvv.c.inc | 80 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 31 ++++++++++
 4 files changed, 133 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index bd0768d048f..878d82caf61 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1072,3 +1072,17 @@ DEF_HELPER_6(vcompress_vm_b, void, ptr, ptr, ptr, ptr, env, i32)
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
index 06a80763112..a6f9e5dcc66 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -655,6 +655,14 @@ vmv2r_v         100111 1 ..... 00001 011 ..... 1010111 @r2rd
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
 
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5eaf978fe90..43cdc846d9f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3283,3 +3283,83 @@ GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
 GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
 GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
 GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
+
+static bool int_ext_check(DisasContext *s, arg_rmr *a, uint8_t div)
+{
+    uint8_t from = (s->sew + 3) - div;
+    bool ret = require_rvv(s) &&
+        (from >= 3 && from <= 8) &&
+        (a->rd != a->rs2) &&
+        require_align(a->rd, s->lmul) &&
+        require_align(a->rs2, s->lmul - div) &&
+        require_vm(a->vm, a->rd) &&
+        require_noover(a->rd, s->lmul, a->rs2, s->lmul - div);
+    return ret;
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
+
+    tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
+                       vreg_ofs(s, a->rs2), cpu_env,
+                       s->vlen / 8, s->vlen / 8, data, fn);
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
+GEN_INT_EXT_TRANS(vzext_vf2, 1, 0)
+GEN_INT_EXT_TRANS(vzext_vf4, 2, 1)
+GEN_INT_EXT_TRANS(vzext_vf8, 3, 2)
+GEN_INT_EXT_TRANS(vsext_vf2, 1, 3)
+GEN_INT_EXT_TRANS(vsext_vf4, 2, 4)
+GEN_INT_EXT_TRANS(vsext_vf8, 3, 5)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 86d03d8e395..58ba2a7d99b 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4544,3 +4544,34 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_b, uint8_t,  H1)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_h, uint16_t, H2)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_w, uint32_t, H4)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8)
+
+/* Vector Integer Extension */
+#define GEN_VEXT_INT_EXT(NAME, ETYPE, DTYPE, HD, HS1)            \
+void HELPER(NAME)(void *vd, void *v0, void *vs2,                 \
+                  CPURISCVState *env, uint32_t desc)             \
+{                                                                \
+    uint32_t vl = env->vl;                                       \
+    uint32_t vm = vext_vm(desc);                                 \
+    uint32_t i;                                                  \
+                                                                 \
+    for (i = 0; i < vl; i++) {                                   \
+        if (!vm && !vext_elem_mask(v0, i)) {                     \
+            continue;                                            \
+        }                                                        \
+        *((ETYPE *)vd + HD(i)) = *((DTYPE *)vs2 + HS1(i));       \
+    }                                                            \
+}
+
+GEN_VEXT_INT_EXT(vzext_vf2_h, uint16_t, uint8_t,  H2, H1)
+GEN_VEXT_INT_EXT(vzext_vf2_w, uint32_t, uint16_t, H4, H2)
+GEN_VEXT_INT_EXT(vzext_vf2_d, uint64_t, uint32_t, H8, H4)
+GEN_VEXT_INT_EXT(vzext_vf4_w, uint32_t, uint8_t,  H4, H1)
+GEN_VEXT_INT_EXT(vzext_vf4_d, uint64_t, uint16_t, H8, H2)
+GEN_VEXT_INT_EXT(vzext_vf8_d, uint64_t, uint8_t,  H8, H1)
+
+GEN_VEXT_INT_EXT(vsext_vf2_h, int16_t, int8_t,  H2, H1)
+GEN_VEXT_INT_EXT(vsext_vf2_w, int32_t, int16_t, H4, H2)
+GEN_VEXT_INT_EXT(vsext_vf2_d, int64_t, int32_t, H8, H4)
+GEN_VEXT_INT_EXT(vsext_vf4_w, int32_t, int8_t,  H4, H1)
+GEN_VEXT_INT_EXT(vsext_vf4_d, int64_t, int16_t, H8, H2)
+GEN_VEXT_INT_EXT(vsext_vf8_d, int64_t, int8_t,  H8, H1)
-- 
2.25.1


