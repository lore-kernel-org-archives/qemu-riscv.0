Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWyg-0001m5-C1
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:05:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWyd-0001h6-0H
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:05:12 -0500
Received: from [2607:f8b0:4864:20::436] (port=43543
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWya-00006R-1b
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:05:10 -0500
Received: by mail-pf1-x436.google.com with SMTP id n85so15268381pfd.10
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e4SfqqiTarFCqQQK25rEQ6nn+NjcWVm4RnuIyhBYXw0=;
 b=XWSwr6t5Vav+dpCi0+rNx3qJFcEfweY1Bb4taaZHfu00eyCGFNGUWS2QgLbgkVU2Yh
 ePkbgwGIK1jO8rrlJAcBSW8nqP4biin0adojaFxOM65P7fmC2MBId1XXgaxEm8Vexej2
 CDK7Uc1w8lHlQFNDx7/hQAzXSvOUUV4v4l/ADseONC4GI5apEaXluD5SyLfhfb/G7jYI
 qGO9vpuAjUoQqKGcYd9FuprzbpnltxEoV8y0z3Ye1ekTD7yBEQDEO7O3sAfk5RCO+6tY
 WDiVNThcWJM8wuQdIbIxI2/9RcIruTSF/qyhSqaGEl/t3GopOthAHBdiuh9UNJquLHc7
 1FPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e4SfqqiTarFCqQQK25rEQ6nn+NjcWVm4RnuIyhBYXw0=;
 b=tDVOgp9Zv5OHDA9+eURCdNZOJE9HnbYrVWYvuWGmNQCDNZKqQhYajb66vBdgf0fnVj
 QiQEbVv0dNb1639MrBR++Nm+Ko8qVKeh15uorwSYszYNFq/1sro+5gIt9F+Qn3Wi0seN
 C/FKHb0yjsSMTKVRig+nklDS4Cv+sHVLtqi+Ov4y5MCDbDqzRwUShb2dSlqwWZWnb3h4
 jpzAPT2+dDZ5GgGevyNdESocNZFIsecDnZMlcNusoBIwRN49AwFFlegmmWjZTrV0h9Pw
 1pGLiTVUJ4VKcqXAEx5+lyqaqPm/zdoY8uKqhv0LcN687qt1s7cd9aJXej8QYdKK4D2F
 CerQ==
X-Gm-Message-State: AOAM530ALLdhZZCL1c1amZEz3tTLW80moI6tWGeMoRyH5VI/694Bl8Vn
 jsQjhzMYhJKv50qM3RDvp3lRIg==
X-Google-Smtp-Source: ABdhPJxi7AXfaftoRs7UvVTaHGZVXEa0UiADOXRN6MJs6gg0GUrKqBuy37qdt9RGeqfmi7CjMMdAMQ==
X-Received: by 2002:a63:4643:: with SMTP id v3mr19771750pgk.532.1638155105474; 
 Sun, 28 Nov 2021 19:05:05 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:05:05 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 18/77] target/riscv: rvv-1.0: remove amo operations
 instructions
Date: Mon, 29 Nov 2021 11:02:38 +0800
Message-Id: <20211129030340.429689-19-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:05:12 -0000

From: Frank Chang <frank.chang@sifive.com>

Vector AMOs are removed from standard vector extensions. Will be added
later as separate Zvamo extension, but will need a different encoding
from earlier proposal.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  27 -----
 target/riscv/insn32.decode              |  24 ----
 target/riscv/insn_trans/trans_rvv.c.inc | 140 ------------------------
 target/riscv/vector_helper.c            | 125 ---------------------
 4 files changed, 316 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index d25cf725c57..ecb6af6cd99 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -274,33 +274,6 @@ DEF_HELPER_5(vlhuff_v_w, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlhuff_v_d, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlwuff_v_w, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlwuff_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_6(vamoswapw_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoswapd_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoaddw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoaddd_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoxorw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoxord_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoandw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoandd_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoorw_v_d,   void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoord_v_d,   void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamominw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomind_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxd_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamominuw_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamominud_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxuw_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxud_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoswapw_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoaddw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoxorw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoandw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoorw_v_w,   void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamominw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamominuw_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxuw_v_w, void, ptr, ptr, tl, ptr, env, i32)
 
 DEF_HELPER_6(vadd_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6c4cde216bc..3d57255fffb 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -49,7 +49,6 @@
 &atomic    aq rl rs2 rs1 rd
 &rmrr      vm rd rs1 rs2
 &rmr       vm rd rs2
-&rwdvm     vm wd rd rs1 rs2
 &r2nfvm    vm rd rs1 nf
 &rnfvm     vm rd rs1 rs2 nf
 
@@ -79,7 +78,6 @@
 @r_vm    ...... vm:1 ..... ..... ... ..... ....... &rmrr %rs2 %rs1 %rd
 @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=1 %rs2 %rs1 %rd
 @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=0 %rs2 %rs1 %rd
-@r_wdvm  ..... wd:1 vm:1 ..... ..... ... ..... ....... &rwdvm %rs2 %rs1 %rd
 @r2_zimm . zimm:11  ..... ... ..... ....... %rs1 %rd
 @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
 
@@ -340,17 +338,6 @@ vsxh_v     ... -11 . ..... ..... 101 ..... 0100111 @r_nfvm
 vsxw_v     ... -11 . ..... ..... 110 ..... 0100111 @r_nfvm
 vsxe_v     ... -11 . ..... ..... 111 ..... 0100111 @r_nfvm
 
-#*** Vector AMO operations are encoded under the standard AMO major opcode ***
-vamoswapw_v     00001 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamoaddw_v      00000 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamoxorw_v      00100 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamoandw_v      01100 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamoorw_v       01000 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamominw_v      10000 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamomaxw_v      10100 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamominuw_v     11000 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamomaxuw_v     11100 . . ..... ..... 110 ..... 0101111 @r_wdvm
-
 # *** new major opcode OP-V ***
 vadd_vv         000000 . ..... ..... 000 ..... 1010111 @r_vm
 vadd_vx         000000 . ..... ..... 100 ..... 1010111 @r_vm
@@ -649,17 +636,6 @@ vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 
-#*** Vector AMO operations (in addition to Zvamo) ***
-vamoswapd_v     00001 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamoaddd_v      00000 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamoxord_v      00100 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamoandd_v      01100 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamoord_v       01000 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamomind_v      10000 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamomaxd_v      10100 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamominud_v     11000 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
-
 # *** RV32 Zba Standard Extension ***
 sh1add     0010000 .......... 010 ..... 0110011 @r
 sh2add     0010000 .......... 100 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f9ace6ae412..afec1873333 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -973,146 +973,6 @@ GEN_VEXT_TRANS(vlbuff_v, 4, r2nfvm, ldff_op, ld_us_check)
 GEN_VEXT_TRANS(vlhuff_v, 5, r2nfvm, ldff_op, ld_us_check)
 GEN_VEXT_TRANS(vlwuff_v, 6, r2nfvm, ldff_op, ld_us_check)
 
-/*
- *** vector atomic operation
- */
-typedef void gen_helper_amo(TCGv_ptr, TCGv_ptr, TCGv, TCGv_ptr,
-                            TCGv_env, TCGv_i32);
-
-static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
-                      uint32_t data, gen_helper_amo *fn, DisasContext *s)
-{
-    TCGv_ptr dest, mask, index;
-    TCGv base;
-    TCGv_i32 desc;
-
-    TCGLabel *over = gen_new_label();
-    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
-
-    dest = tcg_temp_new_ptr();
-    mask = tcg_temp_new_ptr();
-    index = tcg_temp_new_ptr();
-    base = get_gpr(s, rs1, EXT_NONE);
-    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
-
-    tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
-    tcg_gen_addi_ptr(index, cpu_env, vreg_ofs(s, vs2));
-    tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
-
-    fn(dest, mask, base, index, cpu_env, desc);
-
-    tcg_temp_free_ptr(dest);
-    tcg_temp_free_ptr(mask);
-    tcg_temp_free_ptr(index);
-    mark_vs_dirty(s);
-    gen_set_label(over);
-    return true;
-}
-
-static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
-{
-    uint32_t data = 0;
-    gen_helper_amo *fn;
-    static gen_helper_amo *const fnsw[9] = {
-        /* no atomic operation */
-        gen_helper_vamoswapw_v_w,
-        gen_helper_vamoaddw_v_w,
-        gen_helper_vamoxorw_v_w,
-        gen_helper_vamoandw_v_w,
-        gen_helper_vamoorw_v_w,
-        gen_helper_vamominw_v_w,
-        gen_helper_vamomaxw_v_w,
-        gen_helper_vamominuw_v_w,
-        gen_helper_vamomaxuw_v_w
-    };
-    static gen_helper_amo *const fnsd[18] = {
-        gen_helper_vamoswapw_v_d,
-        gen_helper_vamoaddw_v_d,
-        gen_helper_vamoxorw_v_d,
-        gen_helper_vamoandw_v_d,
-        gen_helper_vamoorw_v_d,
-        gen_helper_vamominw_v_d,
-        gen_helper_vamomaxw_v_d,
-        gen_helper_vamominuw_v_d,
-        gen_helper_vamomaxuw_v_d,
-        gen_helper_vamoswapd_v_d,
-        gen_helper_vamoaddd_v_d,
-        gen_helper_vamoxord_v_d,
-        gen_helper_vamoandd_v_d,
-        gen_helper_vamoord_v_d,
-        gen_helper_vamomind_v_d,
-        gen_helper_vamomaxd_v_d,
-        gen_helper_vamominud_v_d,
-        gen_helper_vamomaxud_v_d
-    };
-
-    if (tb_cflags(s->base.tb) & CF_PARALLEL) {
-        gen_helper_exit_atomic(cpu_env);
-        s->base.is_jmp = DISAS_NORETURN;
-        return true;
-    }
-
-    switch (s->sew) {
-    case 0 ... 2:
-        assert(seq < ARRAY_SIZE(fnsw));
-        fn = fnsw[seq];
-        break;
-    case 3:
-        /* XLEN check done in amo_check(). */
-        assert(seq < ARRAY_SIZE(fnsd));
-        fn = fnsd[seq];
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    data = FIELD_DP32(data, VDATA, VM, a->vm);
-    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
-    data = FIELD_DP32(data, VDATA, WD, a->wd);
-    return amo_trans(a->rd, a->rs1, a->rs2, data, fn, s);
-}
-/*
- * There are two rules check here.
- *
- * 1. SEW must be at least as wide as the AMO memory element size.
- *
- * 2. If SEW is greater than XLEN, an illegal instruction exception is raised.
- */
-static bool amo_check(DisasContext *s, arg_rwdvm* a)
-{
-    return (!s->vill && has_ext(s, RVA) &&
-            (!a->wd || vext_check_overlap_mask(s, a->rd, a->vm, false)) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            ((1 << s->sew) <= sizeof(target_ulong)) &&
-            ((1 << s->sew) >= 4));
-}
-
-static bool amo_check64(DisasContext *s, arg_rwdvm* a)
-{
-    REQUIRE_64BIT(s);
-    return amo_check(s, a);
-}
-
-GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoaddw_v, 1, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoxorw_v, 2, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoandw_v, 3, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoorw_v, 4, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamominw_v, 5, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamomaxw_v, 6, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamominuw_v, 7, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamomaxuw_v, 8, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoswapd_v, 9, rwdvm, amo_op, amo_check64)
-GEN_VEXT_TRANS(vamoaddd_v, 10, rwdvm, amo_op, amo_check64)
-GEN_VEXT_TRANS(vamoxord_v, 11, rwdvm, amo_op, amo_check64)
-GEN_VEXT_TRANS(vamoandd_v, 12, rwdvm, amo_op, amo_check64)
-GEN_VEXT_TRANS(vamoord_v, 13, rwdvm, amo_op, amo_check64)
-GEN_VEXT_TRANS(vamomind_v, 14, rwdvm, amo_op, amo_check64)
-GEN_VEXT_TRANS(vamomaxd_v, 15, rwdvm, amo_op, amo_check64)
-GEN_VEXT_TRANS(vamominud_v, 16, rwdvm, amo_op, amo_check64)
-GEN_VEXT_TRANS(vamomaxud_v, 17, rwdvm, amo_op, amo_check64)
-
 /*
  *** Vector Integer Arithmetic Instructions
  */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index db1a40a3dbd..bf976d364f1 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -103,11 +103,6 @@ static inline int32_t vext_lmul(uint32_t desc)
     return sextract32(FIELD_EX32(simd_data(desc), VDATA, LMUL), 0, 3);
 }
 
-static uint32_t vext_wd(uint32_t desc)
-{
-    return FIELD_EX32(simd_data(desc), VDATA, WD);
-}
-
 /*
  * Get vector group length in bytes. Its range is [64, 2048].
  *
@@ -633,38 +628,12 @@ GEN_VEXT_LDFF(vlhuff_v_d, uint16_t, uint64_t, ldhu_d)
 GEN_VEXT_LDFF(vlwuff_v_w, uint32_t, uint32_t, ldwu_w)
 GEN_VEXT_LDFF(vlwuff_v_d, uint32_t, uint64_t, ldwu_d)
 
-/*
- *** Vector AMO Operations (Zvamo)
- */
-typedef void vext_amo_noatomic_fn(void *vs3, target_ulong addr,
-                                  uint32_t wd, uint32_t idx, CPURISCVState *env,
-                                  uintptr_t retaddr);
-
-/* no atomic opreation for vector atomic insructions */
 #define DO_SWAP(N, M) (M)
 #define DO_AND(N, M)  (N & M)
 #define DO_XOR(N, M)  (N ^ M)
 #define DO_OR(N, M)   (N | M)
 #define DO_ADD(N, M)  (N + M)
 
-#define GEN_VEXT_AMO_NOATOMIC_OP(NAME, ESZ, MSZ, H, DO_OP, SUF) \
-static void                                                     \
-vext_##NAME##_noatomic_op(void *vs3, target_ulong addr,         \
-                          uint32_t wd, uint32_t idx,            \
-                          CPURISCVState *env, uintptr_t retaddr)\
-{                                                               \
-    typedef int##ESZ##_t ETYPE;                                 \
-    typedef int##MSZ##_t MTYPE;                                 \
-    typedef uint##MSZ##_t UMTYPE __attribute__((unused));       \
-    ETYPE *pe3 = (ETYPE *)vs3 + H(idx);                         \
-    MTYPE  a = cpu_ld##SUF##_data(env, addr), b = *pe3;         \
-                                                                \
-    cpu_st##SUF##_data(env, addr, DO_OP(a, b));                 \
-    if (wd) {                                                   \
-        *pe3 = a;                                               \
-    }                                                           \
-}
-
 /* Signed min/max */
 #define DO_MAX(N, M)  ((N) >= (M) ? (N) : (M))
 #define DO_MIN(N, M)  ((N) >= (M) ? (M) : (N))
@@ -673,100 +642,6 @@ vext_##NAME##_noatomic_op(void *vs3, target_ulong addr,         \
 #define DO_MAXU(N, M) DO_MAX((UMTYPE)N, (UMTYPE)M)
 #define DO_MINU(N, M) DO_MIN((UMTYPE)N, (UMTYPE)M)
 
-GEN_VEXT_AMO_NOATOMIC_OP(vamoswapw_v_w, 32, 32, H4, DO_SWAP, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoaddw_v_w,  32, 32, H4, DO_ADD,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoxorw_v_w,  32, 32, H4, DO_XOR,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoandw_v_w,  32, 32, H4, DO_AND,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoorw_v_w,   32, 32, H4, DO_OR,   l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamominw_v_w,  32, 32, H4, DO_MIN,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxw_v_w,  32, 32, H4, DO_MAX,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamominuw_v_w, 32, 32, H4, DO_MINU, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuw_v_w, 32, 32, H4, DO_MAXU, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoswapw_v_d, 64, 32, H8, DO_SWAP, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoswapd_v_d, 64, 64, H8, DO_SWAP, q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoaddw_v_d,  64, 32, H8, DO_ADD,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoaddd_v_d,  64, 64, H8, DO_ADD,  q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoxorw_v_d,  64, 32, H8, DO_XOR,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoxord_v_d,  64, 64, H8, DO_XOR,  q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoandw_v_d,  64, 32, H8, DO_AND,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoandd_v_d,  64, 64, H8, DO_AND,  q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoorw_v_d,   64, 32, H8, DO_OR,   l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoord_v_d,   64, 64, H8, DO_OR,   q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamominw_v_d,  64, 32, H8, DO_MIN,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomind_v_d,  64, 64, H8, DO_MIN,  q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxw_v_d,  64, 32, H8, DO_MAX,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxd_v_d,  64, 64, H8, DO_MAX,  q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamominuw_v_d, 64, 32, H8, DO_MINU, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamominud_v_d, 64, 64, H8, DO_MINU, q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuw_v_d, 64, 32, H8, DO_MAXU, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxud_v_d, 64, 64, H8, DO_MAXU, q)
-
-static inline void
-vext_amo_noatomic(void *vs3, void *v0, target_ulong base,
-                  void *vs2, CPURISCVState *env, uint32_t desc,
-                  vext_get_index_addr get_index_addr,
-                  vext_amo_noatomic_fn *noatomic_op,
-                  uint32_t esz, uint32_t msz, uintptr_t ra)
-{
-    uint32_t i;
-    target_long addr;
-    uint32_t wd = vext_wd(desc);
-    uint32_t vm = vext_vm(desc);
-
-    for (i = 0; i < env->vl; i++) {
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
-        probe_pages(env, get_index_addr(base, i, vs2), msz, ra, MMU_DATA_LOAD);
-        probe_pages(env, get_index_addr(base, i, vs2), msz, ra, MMU_DATA_STORE);
-    }
-    for (i = 0; i < env->vl; i++) {
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
-        addr = get_index_addr(base, i, vs2);
-        noatomic_op(vs3, addr, wd, i, env, ra);
-    }
-}
-
-#define GEN_VEXT_AMO(NAME, MTYPE, ETYPE, INDEX_FN)              \
-void HELPER(NAME)(void *vs3, void *v0, target_ulong base,       \
-                  void *vs2, CPURISCVState *env, uint32_t desc) \
-{                                                               \
-    vext_amo_noatomic(vs3, v0, base, vs2, env, desc,            \
-                      INDEX_FN, vext_##NAME##_noatomic_op,      \
-                      sizeof(ETYPE), sizeof(MTYPE),             \
-                      GETPC());                                 \
-}
-
-GEN_VEXT_AMO(vamoswapw_v_d, int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoswapd_v_d, int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoaddw_v_d,  int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoaddd_v_d,  int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoxorw_v_d,  int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoxord_v_d,  int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoandw_v_d,  int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoandd_v_d,  int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoorw_v_d,   int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoord_v_d,   int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamominw_v_d,  int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamomind_v_d,  int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamomaxw_v_d,  int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamomaxd_v_d,  int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamominuw_v_d, uint32_t, uint64_t, idx_d)
-GEN_VEXT_AMO(vamominud_v_d, uint64_t, uint64_t, idx_d)
-GEN_VEXT_AMO(vamomaxuw_v_d, uint32_t, uint64_t, idx_d)
-GEN_VEXT_AMO(vamomaxud_v_d, uint64_t, uint64_t, idx_d)
-GEN_VEXT_AMO(vamoswapw_v_w, int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamoaddw_v_w,  int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamoxorw_v_w,  int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamoandw_v_w,  int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamoorw_v_w,   int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamominw_v_w,  int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamomaxw_v_w,  int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamominuw_v_w, uint32_t, uint32_t, idx_w)
-GEN_VEXT_AMO(vamomaxuw_v_w, uint32_t, uint32_t, idx_w)
-
 /*
  *** Vector Integer Arithmetic Instructions
  */
-- 
2.25.1


