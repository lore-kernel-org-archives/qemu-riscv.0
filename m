Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC646C27C44
	for <qemu-riscv@archiver.kernel.org>; Fri, 31 May 2024 17:46:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sD6KK-0002Aa-VL; Fri, 31 May 2024 13:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sD6K0-0001z5-IB
 for qemu-riscv@nongnu.org; Fri, 31 May 2024 13:45:46 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sD6Jx-0007iA-T7
 for qemu-riscv@nongnu.org; Fri, 31 May 2024 13:45:43 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1f4a5344ec7so17660345ad.1
 for <qemu-riscv@nongnu.org>; Fri, 31 May 2024 10:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717177540; x=1717782340; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gCcFfZSpG0DTooCBgGsai6/Bi/5BGaMYihmO+rZ2ifU=;
 b=isYsAmttyyh9vC+iPAA2FP9Mo6P9vYNO+5Whcjmhf5WFdJHj0wDglJnYgRBk/xTWCB
 jJ2yrkXGhyvcW7AQofOiE0L+8NRsglkUp3lpuhKQGnYNYpfhepXZCygQ5tP6AJqL4zwf
 GbsG/Z4J6b/RvePDkn+Ywiqm4UXGdbjI+PqbJO2VQeUsoTn+v38mgIL6WHki+c73nXFT
 pMy1jyJ1b+53zJ14ftThkHRoFFE7vV73bppDPSZQBKt4vzcrYxj1Z+5PAIKVAGA/hULd
 Q2K3smGXJ3ZcECM3LWcuBKc0oUuOEr0u5Ia3AjhFwJpMTZm/ieCUKs8EUsVEiAPtk167
 g5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717177540; x=1717782340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gCcFfZSpG0DTooCBgGsai6/Bi/5BGaMYihmO+rZ2ifU=;
 b=is10paGYfSpjfvKIWsTmXkTBnvCYxPB1FISlTr9vjfiMnk7/6Z4CUuPJdEvNftNJRH
 VEJ9YD4LaxaHh1ywMVqT12Pe8SEkf6I6JraCk370wxAecq/v9lDtvzcTk9FMdmOhSkXA
 kGC06xgWa9xvIPwhMZ4BvSfhRvSthBoKFyueGnE3ksjWA7vQZgz0GiDbMSOC5+t2qsLy
 q/lOZe4mHYlVhzlFnVfggRJPxHABpMbatqcEsAAP+DmvdJQCmqc1jseI6jA3N/0vBxbq
 iYBS8R0Gs2GIyOPKjX7OY4Rcnhti6QoMBIM8Rpa37InG+aBeh9OIEOym2+7wZ+++Wiv9
 za7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/qQyZXosABXo81Op1CW9msI7oUp7Ad2UP1asf3ix23ysxEtd/dD2Qgx64lXeOaNH1Kh5P3q0T9g6tSObJkKVPoss/RPs=
X-Gm-Message-State: AOJu0YzhlPXgcbaZHwfIe0YKFE+2wBWPPN2wpz/TWX7T13z3ksP7yTWC
 PeLJwHgnUeIYM31/lOHTxyxD2EK7o8OsQAVtWwIMuiI2ieHonAWrUIYU714Stu8=
X-Google-Smtp-Source: AGHT+IFtLgu8sT264xYDuQlZcz7mHFjTM8M3L7/mtylmHcLtt/e8zP6zBA5ztZLACl5ufm+3GwGwxA==
X-Received: by 2002:a17:902:6806:b0:1f4:8a31:5a4c with SMTP id
 d9443c01a7336-1f635a4f54bmr34390495ad.24.1717177540488; 
 Fri, 31 May 2024 10:45:40 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f63236ce6dsm19389875ad.95.2024.05.31.10.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 10:45:40 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Max Chou <max.chou@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH v2 6/6] target/riscv: rvv: Optimize vl8re8.v/vs8r.v with
 limitations
Date: Sat,  1 Jun 2024 01:44:53 +0800
Message-Id: <20240531174504.281461-7-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240531174504.281461-1-max.chou@sifive.com>
References: <20240531174504.281461-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The vector load/store whole register instructions (e.g. vl8re8.v/vs8r.v)
perform unmasked continuous load/store. We can optimize these
instructions by replacing the corresponding helper functions by TCG ops
to copy more data at a time with following assumptions:

* Host and target are little endian

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 196 +++++++++++++++++++++++-
 1 file changed, 194 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index bbac73bb12b..44763ccec06 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1402,11 +1402,108 @@ GEN_LDST_WHOLE_TRANS(vl4re8_v,  4)
 GEN_LDST_WHOLE_TRANS(vl4re16_v, 4)
 GEN_LDST_WHOLE_TRANS(vl4re32_v, 4)
 GEN_LDST_WHOLE_TRANS(vl4re64_v, 4)
-GEN_LDST_WHOLE_TRANS(vl8re8_v,  8)
 GEN_LDST_WHOLE_TRANS(vl8re16_v, 8)
 GEN_LDST_WHOLE_TRANS(vl8re32_v, 8)
 GEN_LDST_WHOLE_TRANS(vl8re64_v, 8)
 
+static bool trans_vl8re8_v(DisasContext *s, arg_r2 * a)
+{
+    if (require_rvv(s) && QEMU_IS_ALIGNED(a->rd, 8)) {
+        if (!HOST_BIG_ENDIAN && s->vstart_eq_zero) {
+            uint32_t vofs = vreg_ofs(s, a->rd);
+            uint32_t midx = s->mem_idx;
+            uint32_t evl = s->cfg_ptr->vlenb << 3;
+
+            TCGv_i64 t0, t1;
+            TCGv_i128 t16;
+            TCGv_ptr tp;
+            TCGv_ptr i = tcg_temp_new_ptr();
+            TCGv len_remain = tcg_temp_new();
+            TCGv rs1 = get_gpr(s, a->rs1, EXT_NONE);
+            TCGv addr = tcg_temp_new();
+
+            TCGLabel *loop_128 = gen_new_label();
+            TCGLabel *remain_64 = gen_new_label();
+            TCGLabel *remain_32 = gen_new_label();
+            TCGLabel *remain_16 = gen_new_label();
+            TCGLabel *remain_8 = gen_new_label();
+            TCGLabel *over = gen_new_label();
+
+            tcg_gen_mov_tl(addr, rs1);
+            tcg_gen_movi_tl(len_remain, evl);
+            tcg_gen_movi_ptr(i, 0);
+
+            tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, evl, over);
+            gen_helper_check_probe_read(tcg_env, addr, len_remain);
+
+            tcg_gen_brcondi_tl(TCG_COND_LTU, len_remain, 16, remain_64);
+
+            gen_set_label(loop_128);
+
+            t16 = tcg_temp_new_i128();
+            tcg_gen_qemu_ld_i128(t16, addr, midx,
+                                 MO_LE | MO_128 | MO_ATOM_NONE);
+            tcg_gen_addi_tl(addr, addr, 16);
+
+            tp = tcg_temp_new_ptr();
+            tcg_gen_add_ptr(tp, tcg_env, i);
+            tcg_gen_addi_ptr(i, i, 16);
+
+            t0 = tcg_temp_new_i64();
+            t1 = tcg_temp_new_i64();
+            tcg_gen_extr_i128_i64(t0, t1, t16);
+
+            tcg_gen_st_i64(t0, tp, vofs);
+            tcg_gen_st_i64(t1, tp, vofs + 8);
+            tcg_gen_subi_tl(len_remain, len_remain, 16);
+
+            tcg_gen_brcondi_tl(TCG_COND_GEU, len_remain, 16, loop_128);
+
+            gen_set_label(remain_64);
+            tcg_gen_brcondi_tl(TCG_COND_LTU, len_remain, 8, remain_32);
+            tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEUQ | MO_ATOM_NONE);
+            tcg_gen_addi_tl(addr, addr, 8);
+            tcg_gen_add_ptr(tp, tcg_env, i);
+            tcg_gen_addi_ptr(i, i, 8);
+            tcg_gen_st_i64(t0, tp, vofs);
+            tcg_gen_subi_tl(len_remain, len_remain, 8);
+
+            gen_set_label(remain_32);
+            tcg_gen_brcondi_tl(TCG_COND_LTU, len_remain, 4, remain_16);
+            tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEUL | MO_ATOM_NONE);
+            tcg_gen_addi_tl(addr, addr, 4);
+            tcg_gen_add_ptr(tp, tcg_env, i);
+            tcg_gen_addi_ptr(i, i, 4);
+            tcg_gen_st32_i64(t0, tp, vofs);
+            tcg_gen_subi_tl(len_remain, len_remain, 4);
+
+            gen_set_label(remain_16);
+            tcg_gen_brcondi_tl(TCG_COND_LTU, len_remain, 2, remain_8);
+            tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEUW | MO_ATOM_NONE);
+            tcg_gen_addi_tl(addr, addr, 2);
+            tcg_gen_add_ptr(tp, tcg_env, i);
+            tcg_gen_addi_ptr(i, i, 2);
+            tcg_gen_st16_i64(t0, tp, vofs);
+            tcg_gen_subi_tl(len_remain, len_remain, 2);
+
+            gen_set_label(remain_8);
+            tcg_gen_brcondi_tl(TCG_COND_EQ, len_remain, 0, over);
+            tcg_gen_qemu_ld_i64(t0, addr, midx,
+                                MO_LE | MO_8 | MO_ATOM_NONE);
+            tcg_gen_add_ptr(tp, tcg_env, i);
+            tcg_gen_st8_i64(t0, tp, vofs);
+
+            gen_set_label(over);
+
+            finalize_rvv_inst(s);
+        } else {
+            return ldst_whole_trans(a->rd, a->rs1, 8, gen_helper_vl8re8_v, s);
+        }
+        return true;
+    }
+    return false;
+}
+
 /*
  * The vector whole register store instructions are encoded similar to
  * unmasked unit-stride store of elements with EEW=8.
@@ -1414,7 +1511,102 @@ GEN_LDST_WHOLE_TRANS(vl8re64_v, 8)
 GEN_LDST_WHOLE_TRANS(vs1r_v, 1)
 GEN_LDST_WHOLE_TRANS(vs2r_v, 2)
 GEN_LDST_WHOLE_TRANS(vs4r_v, 4)
-GEN_LDST_WHOLE_TRANS(vs8r_v, 8)
+
+static bool trans_vs8r_v(DisasContext *s, arg_r2 * a)
+{
+    if (require_rvv(s) && QEMU_IS_ALIGNED(a->rd, 8)) {
+        if (!HOST_BIG_ENDIAN && s->vstart_eq_zero) {
+            uint32_t vofs = vreg_ofs(s, a->rd);
+            uint32_t midx = s->mem_idx;
+            uint32_t evl = s->cfg_ptr->vlenb << 3;
+
+            TCGv_i64 t0, t1;
+            TCGv_i128 t16;
+            TCGv_ptr tp;
+            TCGv_ptr i = tcg_temp_new_ptr();
+            TCGv len_remain = tcg_temp_new();
+            TCGv rs1 = get_gpr(s, a->rs1, EXT_NONE);
+            TCGv addr = tcg_temp_new();
+
+            TCGLabel *loop_128 = gen_new_label();
+            TCGLabel *remain_64 = gen_new_label();
+            TCGLabel *remain_32 = gen_new_label();
+            TCGLabel *remain_16 = gen_new_label();
+            TCGLabel *remain_8 = gen_new_label();
+            TCGLabel *over = gen_new_label();
+
+            tcg_gen_mov_tl(addr, rs1);
+            tcg_gen_movi_tl(len_remain, evl);
+            tcg_gen_movi_ptr(i, 0);
+
+            tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, evl, over);
+            gen_helper_check_probe_write(tcg_env, addr, len_remain);
+
+            tcg_gen_brcondi_tl(TCG_COND_LTU, len_remain, 16, remain_64);
+
+            gen_set_label(loop_128);
+
+            t0 = tcg_temp_new_i64();
+            t1 = tcg_temp_new_i64();
+            tp = tcg_temp_new_ptr();
+            tcg_gen_add_ptr(tp, tcg_env, i);
+            tcg_gen_ld_i64(t0, tp, vofs);
+            tcg_gen_ld_i64(t1, tp, vofs + 8);
+            tcg_gen_addi_ptr(i, i, 16);
+
+            t16 = tcg_temp_new_i128();
+            tcg_gen_concat_i64_i128(t16, t0, t1);
+
+            tcg_gen_qemu_st_i128(t16, addr, midx,
+                                 MO_LE | MO_128 | MO_ATOM_NONE);
+            tcg_gen_addi_tl(addr, addr, 16);
+            tcg_gen_subi_tl(len_remain, len_remain, 16);
+
+            tcg_gen_brcondi_tl(TCG_COND_GEU, len_remain, 16, loop_128);
+
+            gen_set_label(remain_64);
+            tcg_gen_brcondi_tl(TCG_COND_LTU, len_remain, 8, remain_32);
+            tcg_gen_add_ptr(tp, tcg_env, i);
+            tcg_gen_ld_i64(t0, tp, vofs);
+            tcg_gen_addi_ptr(i, i, 8);
+            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEUQ | MO_ATOM_NONE);
+            tcg_gen_addi_tl(addr, addr, 8);
+            tcg_gen_subi_tl(len_remain, len_remain, 8);
+
+            gen_set_label(remain_32);
+            tcg_gen_brcondi_tl(TCG_COND_LTU, len_remain, 4, remain_16);
+            tcg_gen_add_ptr(tp, tcg_env, i);
+            tcg_gen_ld_i64(t0, tp, vofs);
+            tcg_gen_addi_ptr(i, i, 4);
+            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEUL | MO_ATOM_NONE);
+            tcg_gen_addi_tl(addr, addr, 4);
+            tcg_gen_subi_tl(len_remain, len_remain, 4);
+
+            gen_set_label(remain_16);
+            tcg_gen_brcondi_tl(TCG_COND_LTU, len_remain, 2, remain_8);
+            tcg_gen_add_ptr(tp, tcg_env, i);
+            tcg_gen_ld_i64(t0, tp, vofs);
+            tcg_gen_addi_ptr(i, i, 2);
+            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEUW | MO_ATOM_NONE);
+            tcg_gen_addi_tl(addr, addr, 2);
+            tcg_gen_subi_tl(len_remain, len_remain, 2);
+
+            gen_set_label(remain_8);
+            tcg_gen_brcondi_tl(TCG_COND_EQ, len_remain, 0, over);
+            tcg_gen_add_ptr(tp, tcg_env, i);
+            tcg_gen_ld_i64(t0, tp, vofs);
+            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LE | MO_8 | MO_ATOM_NONE);
+
+            gen_set_label(over);
+
+            finalize_rvv_inst(s);
+        } else {
+            return ldst_whole_trans(a->rd, a->rs1, 8, gen_helper_vl8re8_v, s);
+        }
+        return true;
+    }
+    return false;
+}
 
 /*
  *** Vector Integer Arithmetic Instructions
-- 
2.34.1


