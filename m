Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAve-0003fv-C4
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvd-0003ci-29
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:45 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAva-0005pv-V4
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:44 -0400
Received: by mail-pf1-x429.google.com with SMTP id 1so861077pfn.9
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7I29w9Yyi3mvfOblF5aq3CVAkBnj/fLwd8DUfu+tXI4=;
 b=PR470QOCJkLhxZqrs3Q4+wDcgfR4Pq6uU/WeGdXtKumTVdf0lEe1xZ4ftjAbmX5PM2
 FbWAYZlkEzRUHZKp2E/MHZXkbJYylPfHAJHsavDrk5pQw/7pQeoQNW+xcrHC0pe34x8w
 K2/jh1uCFX63XFm4HaDqNSp4oUPlSUoOIiN3D7jV94Yd6zH1v50uUmJWyP3FRoYN91pk
 VXO9osz+1VdR2jvWy6/Cdip16eUICpwRNmB9tWJyjSAuZF3wAGz5zhgwFGF80TLi2nCr
 dTAvPN1cyzaXB4mcXBE23VJFxWXJasKjZbFRfBsjlBniSk0sWIRjEoVugTTg8jEfgoag
 8gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7I29w9Yyi3mvfOblF5aq3CVAkBnj/fLwd8DUfu+tXI4=;
 b=HZgyiGpgpUeu4O6h0VNjnVz9KhCKzA9i/2wEqRCkUXkw3PR8RDAQStPLdcWPdwf7NS
 nMjkFjI82qOIZZyFsjC7MIX3kxqk5JKpAPf5XwGkyF4ay4xjSavTlRDSyTlo02DVX+hJ
 5KRmCXLD+c1GspzM94pdY2Pn9Gyju6jwid6oFgpINq7B5WEa/YpLINm8LN2KhhVqzD5u
 Z083jsSwC1MWtOtJ8kOFcQXxqbgnUid7PbCXD7jj+LEZ/Pb7SBSinsRxkkBeGbGFdBR9
 FIeLQlj3uLljlFycS1KkrnG8M67xQo2ZtXl0KrizN19OdsQ6MuNhvuLkcDjHR8psbcBe
 mIcA==
X-Gm-Message-State: AOAM532UKJsJi8UbfxBU4gDr+yjeWO1SzY8RXZSqBChWGbHbXt6Ngd5i
 N153LCh3wH/+TRg6I+IsS54n/g==
X-Google-Smtp-Source: ABdhPJzO1KXlGWIi/QMUnDAVdO1CYeDSCV2bvQv+EamJhNRcn1CKWVk8z1H9oEOVRnNvvcDRIeNh4Q==
X-Received: by 2002:a63:8f51:: with SMTP id r17mr26024640pgn.124.1595409641521; 
 Wed, 22 Jul 2020 02:20:41 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:20:40 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 43/76] target/riscv: rvv-0.9: integer extension instructions
Date: Wed, 22 Jul 2020 17:16:06 +0800
Message-Id: <20200722091641.8834-44-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:20:45 -0000

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
 target/riscv/insn_trans/trans_rvv.inc.c | 87 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 34 ++++++++++
 4 files changed, 143 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 1dea171599..7eca91e510 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1097,4 +1097,18 @@ DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
 
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
+
 DEF_HELPER_3(narrower_nanbox_fpr, i64, i64, i32, env)
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
index 85f22a1495..e18ca432b7 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3554,3 +3554,90 @@ GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
 GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
 GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
 GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
+
+static bool int_ext_check(DisasContext *s, arg_rmr *a, uint8_t div)
+{
+    uint32_t from = (1 << (s->sew + 3)) / div;
+    bool ret = require_rvv(s);
+    ret &= (from >= 8 && from <= 64) &&
+           (a->rd != a->rs2) &&
+           require_align(a->rd, s->flmul) &&
+           require_align(a->rs2, s->flmul / div) &&
+           require_vm(a->vm, a->rd);
+    if ((s->flmul / div) < 1) {
+        ret &= require_noover(a->rd, s->flmul, a->rs2, s->flmul / div);
+    } else {
+        ret &= require_noover_widen(a->rd, s->flmul, a->rs2, s->flmul / div);
+    }
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
index c1ed0ff6ad..8516570e5f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -5002,3 +5002,37 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_b, uint8_t, H1, clearb)
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


