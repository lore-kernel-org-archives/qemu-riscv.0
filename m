Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED3ACDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 12:52:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrHcd-0003qB-9p; Fri, 13 Oct 2023 08:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCw3-0004K6-BC
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 03:50:15 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCvs-000475-3T
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 03:50:15 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-405524e6769so11292885e9.1
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 00:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183398; x=1697788198; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zbqysoGwzGGdEuiePiDGe/vVRNiuRLPHhrIWAaG7Bz8=;
 b=opvBBJJ823dpVe2pgCFjGNmemcSMG23E3yeAyMqDKqHiWspLZL3MGZ7iaw9IzQFM4S
 lbHGFVxhePb6DQAH7Ne1/nKOxv/1RGaNtkfdPy9z/oCgiS2BTBN/82FIJ4Y2gbzAAvCl
 xQD93Aau5l+oiWpWlR+a5dCJuBd+Sbmajrl8722ppqPyLSP6ADBEyjF9zx0KFeMTU7sv
 9QuJpw7HqrlKfYp1CJT6Mdw7p+egx8dPDXsPah3crfKBPSYy8jl64O5QZ+vi85QCcego
 eROPgGKwbUdHgE+gX5EEBOYC0uNuPHJLaWKEhf7DCe2svCcbwerQpdrzyFlyfef0LItR
 7ZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183398; x=1697788198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zbqysoGwzGGdEuiePiDGe/vVRNiuRLPHhrIWAaG7Bz8=;
 b=VH6KImNRc0SQf0e179NGtJ/xP26Vx2jLD9kbJZ0+nAsI+I5lNP0XczLQqtNh5DnGu2
 8L+8PUAy8zQoPV/61p2UOrQ5YbIYC6OVUcNYWsSJPfeADlgC3/oKxxT4Hef3453RqgQG
 5pHdpO0Pax/eXPVHPt6TuATWRuNo+L0QopiwaSTNFNf+nk9CV9KAeXGtyS4akwyw1v/K
 FtVtoCbwyVupcxU98USdBwhffswyz8d5Eg8Pgr8EsSJjQqEyqyEnlkUwzmxmuRgh1O6G
 nc4A3kIrsQUasXTjSbHOtDjAZDoMMRDfUKW5CpMcuV+yW0yuG4OuVGxSRejSj3SWYrmt
 xp0A==
X-Gm-Message-State: AOJu0Ywx7lhzbOm1qeBKtERMa85MrBx9/jJiVrmAeEbaXckhud89cHDR
 FdaiYIX08ULbyDusT4IC9ZkPbQ==
X-Google-Smtp-Source: AGHT+IF78ZMPmt2s4evUf6pfew7UIT3/a4A4Ie+2NcZW1haum4w1M1lIACl/PmuVvknRwxogxPvBIQ==
X-Received: by 2002:a05:600c:4f02:b0:401:609f:7f9a with SMTP id
 l2-20020a05600c4f0200b00401609f7f9amr20337838wmq.8.1697183397777; 
 Fri, 13 Oct 2023 00:49:57 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:49:56 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG target)
Subject: [RFC PATCH 06/78] tcg: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:10 +0300
Message-Id: <3303ac9dd5e2106c732d22a4c649445ce073b97c.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 13 Oct 2023 08:50:29 -0400
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

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/i386/tcg/translate.c      |  3 +++
 tcg/aarch64/tcg-target.c.inc     | 15 ++++++++++++++-
 tcg/arm/tcg-target.c.inc         |  5 +++--
 tcg/i386/tcg-target.c.inc        | 20 ++++++++++++++------
 tcg/loongarch64/tcg-target.c.inc |  4 ++--
 tcg/mips/tcg-target.c.inc        |  8 ++++++--
 tcg/ppc/tcg-target.c.inc         | 19 ++++++++++++++-----
 tcg/riscv/tcg-target.c.inc       |  5 +++--
 tcg/s390x/tcg-target.c.inc       |  8 ++++++--
 tcg/tcg-op-gvec.c                | 24 ++++++++++++------------
 tcg/tcg-op-ldst.c                |  2 +-
 tcg/tcg.c                        | 24 +++++++++++++-----------
 tcg/tci.c                        |  2 +-
 tcg/tci/tcg-target.c.inc         |  2 +-
 14 files changed, 93 insertions(+), 48 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index d2061ec44a..e42e3dd653 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -1966,83 +1966,84 @@ static void gen_rotc_rm_T1(DisasContext *s, MemOp ot, int op1,
 /* XXX: add faster immediate case */
 static void gen_shiftd_rm_T1(DisasContext *s, MemOp ot, int op1,
                              bool is_right, TCGv count_in)
 {
     target_ulong mask = (ot == MO_64 ? 63 : 31);
     TCGv count;
 
     /* load */
     if (op1 == OR_TMP0) {
         gen_op_ld_v(s, ot, s->T0, s->A0);
     } else {
         gen_op_mov_v_reg(s, ot, s->T0, op1);
     }
 
     count = tcg_temp_new();
     tcg_gen_andi_tl(count, count_in, mask);
 
     switch (ot) {
     case MO_16:
         /* Note: we implement the Intel behaviour for shift count > 16.
            This means "shrdw C, B, A" shifts A:B:A >> C.  Build the B:A
            portion by constructing it as a 32-bit value.  */
         if (is_right) {
             tcg_gen_deposit_tl(s->tmp0, s->T0, s->T1, 16, 16);
             tcg_gen_mov_tl(s->T1, s->T0);
             tcg_gen_mov_tl(s->T0, s->tmp0);
         } else {
             tcg_gen_deposit_tl(s->T1, s->T0, s->T1, 16, 16);
         }
         /*
          * If TARGET_X86_64 defined then fall through into MO_32 case,
          * otherwise fall through default case.
          */
+        fallthrough;
     case MO_32:
 #ifdef TARGET_X86_64
         /* Concatenate the two 32-bit values and use a 64-bit shift.  */
         tcg_gen_subi_tl(s->tmp0, count, 1);
         if (is_right) {
             tcg_gen_concat_tl_i64(s->T0, s->T0, s->T1);
             tcg_gen_shr_i64(s->tmp0, s->T0, s->tmp0);
             tcg_gen_shr_i64(s->T0, s->T0, count);
         } else {
             tcg_gen_concat_tl_i64(s->T0, s->T1, s->T0);
             tcg_gen_shl_i64(s->tmp0, s->T0, s->tmp0);
             tcg_gen_shl_i64(s->T0, s->T0, count);
             tcg_gen_shri_i64(s->tmp0, s->tmp0, 32);
             tcg_gen_shri_i64(s->T0, s->T0, 32);
         }
         break;
 #endif
     default:
         tcg_gen_subi_tl(s->tmp0, count, 1);
         if (is_right) {
             tcg_gen_shr_tl(s->tmp0, s->T0, s->tmp0);
 
             tcg_gen_subfi_tl(s->tmp4, mask + 1, count);
             tcg_gen_shr_tl(s->T0, s->T0, count);
             tcg_gen_shl_tl(s->T1, s->T1, s->tmp4);
         } else {
             tcg_gen_shl_tl(s->tmp0, s->T0, s->tmp0);
             if (ot == MO_16) {
                 /* Only needed if count > 16, for Intel behaviour.  */
                 tcg_gen_subfi_tl(s->tmp4, 33, count);
                 tcg_gen_shr_tl(s->tmp4, s->T1, s->tmp4);
                 tcg_gen_or_tl(s->tmp0, s->tmp0, s->tmp4);
             }
 
             tcg_gen_subfi_tl(s->tmp4, mask + 1, count);
             tcg_gen_shl_tl(s->T0, s->T0, count);
             tcg_gen_shr_tl(s->T1, s->T1, s->tmp4);
         }
         tcg_gen_movi_tl(s->tmp4, 0);
         tcg_gen_movcond_tl(TCG_COND_EQ, s->T1, count, s->tmp4,
                            s->tmp4, s->T1);
         tcg_gen_or_tl(s->T0, s->T0, s->T1);
         break;
     }
 
     /* store */
     gen_op_st_rm_T0_A0(s, ot, op1);
 
     gen_shift_flags(s, ot, s->T0, s->tmp0, count, is_right);
 }
@@ -3078,3750 +3079,3751 @@ static void gen_cmpxchg16b(DisasContext *s, CPUX86State *env, int modrm)
 /* convert one instruction. s->base.is_jmp is set if the translation must
    be stopped. Return the next pc value */
 static bool disas_insn(DisasContext *s, CPUState *cpu)
 {
     CPUX86State *env = cpu_env(cpu);
     int b, prefixes;
     int shift;
     MemOp ot, aflag, dflag;
     int modrm, reg, rm, mod, op, opreg, val;
     bool orig_cc_op_dirty = s->cc_op_dirty;
     CCOp orig_cc_op = s->cc_op;
     target_ulong orig_pc_save = s->pc_save;
 
     s->pc = s->base.pc_next;
     s->override = -1;
 #ifdef TARGET_X86_64
     s->rex_r = 0;
     s->rex_x = 0;
     s->rex_b = 0;
 #endif
     s->rip_offset = 0; /* for relative ip address */
     s->vex_l = 0;
     s->vex_v = 0;
     s->vex_w = false;
     switch (sigsetjmp(s->jmpbuf, 0)) {
     case 0:
         break;
     case 1:
         gen_exception_gpf(s);
         return true;
     case 2:
         /* Restore state that may affect the next instruction. */
         s->pc = s->base.pc_next;
         /*
          * TODO: These save/restore can be removed after the table-based
          * decoder is complete; we will be decoding the insn completely
          * before any code generation that might affect these variables.
          */
         s->cc_op_dirty = orig_cc_op_dirty;
         s->cc_op = orig_cc_op;
         s->pc_save = orig_pc_save;
         /* END TODO */
         s->base.num_insns--;
         tcg_remove_ops_after(s->prev_insn_end);
         s->base.is_jmp = DISAS_TOO_MANY;
         return false;
     default:
         g_assert_not_reached();
     }
 
     prefixes = 0;
 
  next_byte:
     s->prefix = prefixes;
     b = x86_ldub_code(env, s);
     /* Collect prefixes.  */
     switch (b) {
     default:
         break;
     case 0x0f:
         b = x86_ldub_code(env, s) + 0x100;
         break;
     case 0xf3:
         prefixes |= PREFIX_REPZ;
         prefixes &= ~PREFIX_REPNZ;
         goto next_byte;
     case 0xf2:
         prefixes |= PREFIX_REPNZ;
         prefixes &= ~PREFIX_REPZ;
         goto next_byte;
     case 0xf0:
         prefixes |= PREFIX_LOCK;
         goto next_byte;
     case 0x2e:
         s->override = R_CS;
         goto next_byte;
     case 0x36:
         s->override = R_SS;
         goto next_byte;
     case 0x3e:
         s->override = R_DS;
         goto next_byte;
     case 0x26:
         s->override = R_ES;
         goto next_byte;
     case 0x64:
         s->override = R_FS;
         goto next_byte;
     case 0x65:
         s->override = R_GS;
         goto next_byte;
     case 0x66:
         prefixes |= PREFIX_DATA;
         goto next_byte;
     case 0x67:
         prefixes |= PREFIX_ADR;
         goto next_byte;
 #ifdef TARGET_X86_64
     case 0x40 ... 0x4f:
         if (CODE64(s)) {
             /* REX prefix */
             prefixes |= PREFIX_REX;
             s->vex_w = (b >> 3) & 1;
             s->rex_r = (b & 0x4) << 1;
             s->rex_x = (b & 0x2) << 2;
             s->rex_b = (b & 0x1) << 3;
             goto next_byte;
         }
         break;
 #endif
     case 0xc5: /* 2-byte VEX */
     case 0xc4: /* 3-byte VEX */
         if (CODE32(s) && !VM86(s)) {
             int vex2 = x86_ldub_code(env, s);
             s->pc--; /* rewind the advance_pc() x86_ldub_code() did */
 
             if (!CODE64(s) && (vex2 & 0xc0) != 0xc0) {
                 /* 4.1.4.6: In 32-bit mode, bits [7:6] must be 11b,
                    otherwise the instruction is LES or LDS.  */
                 break;
             }
             disas_insn_new(s, cpu, b);
             return s->pc;
         }
         break;
     }
 
     /* Post-process prefixes.  */
     if (CODE64(s)) {
         /* In 64-bit mode, the default data size is 32-bit.  Select 64-bit
            data with rex_w, and 16-bit data with 0x66; rex_w takes precedence
            over 0x66 if both are present.  */
         dflag = (REX_W(s) ? MO_64 : prefixes & PREFIX_DATA ? MO_16 : MO_32);
         /* In 64-bit mode, 0x67 selects 32-bit addressing.  */
         aflag = (prefixes & PREFIX_ADR ? MO_32 : MO_64);
     } else {
         /* In 16/32-bit mode, 0x66 selects the opposite data size.  */
         if (CODE32(s) ^ ((prefixes & PREFIX_DATA) != 0)) {
             dflag = MO_32;
         } else {
             dflag = MO_16;
         }
         /* In 16/32-bit mode, 0x67 selects the opposite addressing.  */
         if (CODE32(s) ^ ((prefixes & PREFIX_ADR) != 0)) {
             aflag = MO_32;
         }  else {
             aflag = MO_16;
         }
     }
 
     s->prefix = prefixes;
     s->aflag = aflag;
     s->dflag = dflag;
 
     /* now check op code */
     switch (b) {
         /**************************/
         /* arith & logic */
     case 0x00 ... 0x05:
     case 0x08 ... 0x0d:
     case 0x10 ... 0x15:
     case 0x18 ... 0x1d:
     case 0x20 ... 0x25:
     case 0x28 ... 0x2d:
     case 0x30 ... 0x35:
     case 0x38 ... 0x3d:
         {
             int f;
             op = (b >> 3) & 7;
             f = (b >> 1) & 3;
 
             ot = mo_b_d(b, dflag);
 
             switch(f) {
             case 0: /* OP Ev, Gv */
                 modrm = x86_ldub_code(env, s);
                 reg = ((modrm >> 3) & 7) | REX_R(s);
                 mod = (modrm >> 6) & 3;
                 rm = (modrm & 7) | REX_B(s);
                 if (mod != 3) {
                     gen_lea_modrm(env, s, modrm);
                     opreg = OR_TMP0;
                 } else if (op == OP_XORL && rm == reg) {
                 xor_zero:
                     /* xor reg, reg optimisation */
                     set_cc_op(s, CC_OP_CLR);
                     tcg_gen_movi_tl(s->T0, 0);
                     gen_op_mov_reg_v(s, ot, reg, s->T0);
                     break;
                 } else {
                     opreg = rm;
                 }
                 gen_op_mov_v_reg(s, ot, s->T1, reg);
                 gen_op(s, op, ot, opreg);
                 break;
             case 1: /* OP Gv, Ev */
                 modrm = x86_ldub_code(env, s);
                 mod = (modrm >> 6) & 3;
                 reg = ((modrm >> 3) & 7) | REX_R(s);
                 rm = (modrm & 7) | REX_B(s);
                 if (mod != 3) {
                     gen_lea_modrm(env, s, modrm);
                     gen_op_ld_v(s, ot, s->T1, s->A0);
                 } else if (op == OP_XORL && rm == reg) {
                     goto xor_zero;
                 } else {
                     gen_op_mov_v_reg(s, ot, s->T1, rm);
                 }
                 gen_op(s, op, ot, reg);
                 break;
             case 2: /* OP A, Iv */
                 val = insn_get(env, s, ot);
                 tcg_gen_movi_tl(s->T1, val);
                 gen_op(s, op, ot, OR_EAX);
                 break;
             }
         }
         break;
 
     case 0x82:
         if (CODE64(s))
             goto illegal_op;
         /* fall through */
+        fallthrough;
     case 0x80: /* GRP1 */
     case 0x81:
     case 0x83:
         {
             ot = mo_b_d(b, dflag);
 
             modrm = x86_ldub_code(env, s);
             mod = (modrm >> 6) & 3;
             rm = (modrm & 7) | REX_B(s);
             op = (modrm >> 3) & 7;
 
             if (mod != 3) {
                 if (b == 0x83)
                     s->rip_offset = 1;
                 else
                     s->rip_offset = insn_const_size(ot);
                 gen_lea_modrm(env, s, modrm);
                 opreg = OR_TMP0;
             } else {
                 opreg = rm;
             }
 
             switch(b) {
             default:
             case 0x80:
             case 0x81:
             case 0x82:
                 val = insn_get(env, s, ot);
                 break;
             case 0x83:
                 val = (int8_t)insn_get(env, s, MO_8);
                 break;
             }
             tcg_gen_movi_tl(s->T1, val);
             gen_op(s, op, ot, opreg);
         }
         break;
 
         /**************************/
         /* inc, dec, and other misc arith */
     case 0x40 ... 0x47: /* inc Gv */
         ot = dflag;
         gen_inc(s, ot, OR_EAX + (b & 7), 1);
         break;
     case 0x48 ... 0x4f: /* dec Gv */
         ot = dflag;
         gen_inc(s, ot, OR_EAX + (b & 7), -1);
         break;
     case 0xf6: /* GRP3 */
     case 0xf7:
         ot = mo_b_d(b, dflag);
 
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
         rm = (modrm & 7) | REX_B(s);
         op = (modrm >> 3) & 7;
         if (mod != 3) {
             if (op == 0) {
                 s->rip_offset = insn_const_size(ot);
             }
             gen_lea_modrm(env, s, modrm);
             /* For those below that handle locked memory, don't load here.  */
             if (!(s->prefix & PREFIX_LOCK)
                 || op != 2) {
                 gen_op_ld_v(s, ot, s->T0, s->A0);
             }
         } else {
             gen_op_mov_v_reg(s, ot, s->T0, rm);
         }
 
         switch(op) {
         case 0: /* test */
             val = insn_get(env, s, ot);
             tcg_gen_movi_tl(s->T1, val);
             gen_op_testl_T0_T1_cc(s);
             set_cc_op(s, CC_OP_LOGICB + ot);
             break;
         case 2: /* not */
             if (s->prefix & PREFIX_LOCK) {
                 if (mod == 3) {
                     goto illegal_op;
                 }
                 tcg_gen_movi_tl(s->T0, ~0);
                 tcg_gen_atomic_xor_fetch_tl(s->T0, s->A0, s->T0,
                                             s->mem_index, ot | MO_LE);
             } else {
                 tcg_gen_not_tl(s->T0, s->T0);
                 if (mod != 3) {
                     gen_op_st_v(s, ot, s->T0, s->A0);
                 } else {
                     gen_op_mov_reg_v(s, ot, rm, s->T0);
                 }
             }
             break;
         case 3: /* neg */
             if (s->prefix & PREFIX_LOCK) {
                 TCGLabel *label1;
                 TCGv a0, t0, t1, t2;
 
                 if (mod == 3) {
                     goto illegal_op;
                 }
                 a0 = s->A0;
                 t0 = s->T0;
                 label1 = gen_new_label();
 
                 gen_set_label(label1);
                 t1 = tcg_temp_new();
                 t2 = tcg_temp_new();
                 tcg_gen_mov_tl(t2, t0);
                 tcg_gen_neg_tl(t1, t0);
                 tcg_gen_atomic_cmpxchg_tl(t0, a0, t0, t1,
                                           s->mem_index, ot | MO_LE);
                 tcg_gen_brcond_tl(TCG_COND_NE, t0, t2, label1);
 
                 tcg_gen_neg_tl(s->T0, t0);
             } else {
                 tcg_gen_neg_tl(s->T0, s->T0);
                 if (mod != 3) {
                     gen_op_st_v(s, ot, s->T0, s->A0);
                 } else {
                     gen_op_mov_reg_v(s, ot, rm, s->T0);
                 }
             }
             gen_op_update_neg_cc(s);
             set_cc_op(s, CC_OP_SUBB + ot);
             break;
         case 4: /* mul */
             switch(ot) {
             case MO_8:
                 gen_op_mov_v_reg(s, MO_8, s->T1, R_EAX);
                 tcg_gen_ext8u_tl(s->T0, s->T0);
                 tcg_gen_ext8u_tl(s->T1, s->T1);
                 /* XXX: use 32 bit mul which could be faster */
                 tcg_gen_mul_tl(s->T0, s->T0, s->T1);
                 gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
                 tcg_gen_mov_tl(cpu_cc_dst, s->T0);
                 tcg_gen_andi_tl(cpu_cc_src, s->T0, 0xff00);
                 set_cc_op(s, CC_OP_MULB);
                 break;
             case MO_16:
                 gen_op_mov_v_reg(s, MO_16, s->T1, R_EAX);
                 tcg_gen_ext16u_tl(s->T0, s->T0);
                 tcg_gen_ext16u_tl(s->T1, s->T1);
                 /* XXX: use 32 bit mul which could be faster */
                 tcg_gen_mul_tl(s->T0, s->T0, s->T1);
                 gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
                 tcg_gen_mov_tl(cpu_cc_dst, s->T0);
                 tcg_gen_shri_tl(s->T0, s->T0, 16);
                 gen_op_mov_reg_v(s, MO_16, R_EDX, s->T0);
                 tcg_gen_mov_tl(cpu_cc_src, s->T0);
                 set_cc_op(s, CC_OP_MULW);
                 break;
             default:
             case MO_32:
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 tcg_gen_trunc_tl_i32(s->tmp3_i32, cpu_regs[R_EAX]);
                 tcg_gen_mulu2_i32(s->tmp2_i32, s->tmp3_i32,
                                   s->tmp2_i32, s->tmp3_i32);
                 tcg_gen_extu_i32_tl(cpu_regs[R_EAX], s->tmp2_i32);
                 tcg_gen_extu_i32_tl(cpu_regs[R_EDX], s->tmp3_i32);
                 tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[R_EAX]);
                 tcg_gen_mov_tl(cpu_cc_src, cpu_regs[R_EDX]);
                 set_cc_op(s, CC_OP_MULL);
                 break;
 #ifdef TARGET_X86_64
             case MO_64:
                 tcg_gen_mulu2_i64(cpu_regs[R_EAX], cpu_regs[R_EDX],
                                   s->T0, cpu_regs[R_EAX]);
                 tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[R_EAX]);
                 tcg_gen_mov_tl(cpu_cc_src, cpu_regs[R_EDX]);
                 set_cc_op(s, CC_OP_MULQ);
                 break;
 #endif
             }
             break;
         case 5: /* imul */
             switch(ot) {
             case MO_8:
                 gen_op_mov_v_reg(s, MO_8, s->T1, R_EAX);
                 tcg_gen_ext8s_tl(s->T0, s->T0);
                 tcg_gen_ext8s_tl(s->T1, s->T1);
                 /* XXX: use 32 bit mul which could be faster */
                 tcg_gen_mul_tl(s->T0, s->T0, s->T1);
                 gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
                 tcg_gen_mov_tl(cpu_cc_dst, s->T0);
                 tcg_gen_ext8s_tl(s->tmp0, s->T0);
                 tcg_gen_sub_tl(cpu_cc_src, s->T0, s->tmp0);
                 set_cc_op(s, CC_OP_MULB);
                 break;
             case MO_16:
                 gen_op_mov_v_reg(s, MO_16, s->T1, R_EAX);
                 tcg_gen_ext16s_tl(s->T0, s->T0);
                 tcg_gen_ext16s_tl(s->T1, s->T1);
                 /* XXX: use 32 bit mul which could be faster */
                 tcg_gen_mul_tl(s->T0, s->T0, s->T1);
                 gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
                 tcg_gen_mov_tl(cpu_cc_dst, s->T0);
                 tcg_gen_ext16s_tl(s->tmp0, s->T0);
                 tcg_gen_sub_tl(cpu_cc_src, s->T0, s->tmp0);
                 tcg_gen_shri_tl(s->T0, s->T0, 16);
                 gen_op_mov_reg_v(s, MO_16, R_EDX, s->T0);
                 set_cc_op(s, CC_OP_MULW);
                 break;
             default:
             case MO_32:
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 tcg_gen_trunc_tl_i32(s->tmp3_i32, cpu_regs[R_EAX]);
                 tcg_gen_muls2_i32(s->tmp2_i32, s->tmp3_i32,
                                   s->tmp2_i32, s->tmp3_i32);
                 tcg_gen_extu_i32_tl(cpu_regs[R_EAX], s->tmp2_i32);
                 tcg_gen_extu_i32_tl(cpu_regs[R_EDX], s->tmp3_i32);
                 tcg_gen_sari_i32(s->tmp2_i32, s->tmp2_i32, 31);
                 tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[R_EAX]);
                 tcg_gen_sub_i32(s->tmp2_i32, s->tmp2_i32, s->tmp3_i32);
                 tcg_gen_extu_i32_tl(cpu_cc_src, s->tmp2_i32);
                 set_cc_op(s, CC_OP_MULL);
                 break;
 #ifdef TARGET_X86_64
             case MO_64:
                 tcg_gen_muls2_i64(cpu_regs[R_EAX], cpu_regs[R_EDX],
                                   s->T0, cpu_regs[R_EAX]);
                 tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[R_EAX]);
                 tcg_gen_sari_tl(cpu_cc_src, cpu_regs[R_EAX], 63);
                 tcg_gen_sub_tl(cpu_cc_src, cpu_cc_src, cpu_regs[R_EDX]);
                 set_cc_op(s, CC_OP_MULQ);
                 break;
 #endif
             }
             break;
         case 6: /* div */
             switch(ot) {
             case MO_8:
                 gen_helper_divb_AL(tcg_env, s->T0);
                 break;
             case MO_16:
                 gen_helper_divw_AX(tcg_env, s->T0);
                 break;
             default:
             case MO_32:
                 gen_helper_divl_EAX(tcg_env, s->T0);
                 break;
 #ifdef TARGET_X86_64
             case MO_64:
                 gen_helper_divq_EAX(tcg_env, s->T0);
                 break;
 #endif
             }
             break;
         case 7: /* idiv */
             switch(ot) {
             case MO_8:
                 gen_helper_idivb_AL(tcg_env, s->T0);
                 break;
             case MO_16:
                 gen_helper_idivw_AX(tcg_env, s->T0);
                 break;
             default:
             case MO_32:
                 gen_helper_idivl_EAX(tcg_env, s->T0);
                 break;
 #ifdef TARGET_X86_64
             case MO_64:
                 gen_helper_idivq_EAX(tcg_env, s->T0);
                 break;
 #endif
             }
             break;
         default:
             goto unknown_op;
         }
         break;
 
     case 0xfe: /* GRP4 */
     case 0xff: /* GRP5 */
         ot = mo_b_d(b, dflag);
 
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
         rm = (modrm & 7) | REX_B(s);
         op = (modrm >> 3) & 7;
         if (op >= 2 && b == 0xfe) {
             goto unknown_op;
         }
         if (CODE64(s)) {
             if (op == 2 || op == 4) {
                 /* operand size for jumps is 64 bit */
                 ot = MO_64;
             } else if (op == 3 || op == 5) {
                 ot = dflag != MO_16 ? MO_32 + REX_W(s) : MO_16;
             } else if (op == 6) {
                 /* default push size is 64 bit */
                 ot = mo_pushpop(s, dflag);
             }
         }
         if (mod != 3) {
             gen_lea_modrm(env, s, modrm);
             if (op >= 2 && op != 3 && op != 5)
                 gen_op_ld_v(s, ot, s->T0, s->A0);
         } else {
             gen_op_mov_v_reg(s, ot, s->T0, rm);
         }
 
         switch(op) {
         case 0: /* inc Ev */
             if (mod != 3)
                 opreg = OR_TMP0;
             else
                 opreg = rm;
             gen_inc(s, ot, opreg, 1);
             break;
         case 1: /* dec Ev */
             if (mod != 3)
                 opreg = OR_TMP0;
             else
                 opreg = rm;
             gen_inc(s, ot, opreg, -1);
             break;
         case 2: /* call Ev */
             /* XXX: optimize if memory (no 'and' is necessary) */
             if (dflag == MO_16) {
                 tcg_gen_ext16u_tl(s->T0, s->T0);
             }
             gen_push_v(s, eip_next_tl(s));
             gen_op_jmp_v(s, s->T0);
             gen_bnd_jmp(s);
             s->base.is_jmp = DISAS_JUMP;
             break;
         case 3: /* lcall Ev */
             if (mod == 3) {
                 goto illegal_op;
             }
             gen_op_ld_v(s, ot, s->T1, s->A0);
             gen_add_A0_im(s, 1 << ot);
             gen_op_ld_v(s, MO_16, s->T0, s->A0);
         do_lcall:
             if (PE(s) && !VM86(s)) {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_lcall_protected(tcg_env, s->tmp2_i32, s->T1,
                                            tcg_constant_i32(dflag - 1),
                                            eip_next_tl(s));
             } else {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
                 gen_helper_lcall_real(tcg_env, s->tmp2_i32, s->tmp3_i32,
                                       tcg_constant_i32(dflag - 1),
                                       eip_next_i32(s));
             }
             s->base.is_jmp = DISAS_JUMP;
             break;
         case 4: /* jmp Ev */
             if (dflag == MO_16) {
                 tcg_gen_ext16u_tl(s->T0, s->T0);
             }
             gen_op_jmp_v(s, s->T0);
             gen_bnd_jmp(s);
             s->base.is_jmp = DISAS_JUMP;
             break;
         case 5: /* ljmp Ev */
             if (mod == 3) {
                 goto illegal_op;
             }
             gen_op_ld_v(s, ot, s->T1, s->A0);
             gen_add_A0_im(s, 1 << ot);
             gen_op_ld_v(s, MO_16, s->T0, s->A0);
         do_ljmp:
             if (PE(s) && !VM86(s)) {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_ljmp_protected(tcg_env, s->tmp2_i32, s->T1,
                                           eip_next_tl(s));
             } else {
                 gen_op_movl_seg_T0_vm(s, R_CS);
                 gen_op_jmp_v(s, s->T1);
             }
             s->base.is_jmp = DISAS_JUMP;
             break;
         case 6: /* push Ev */
             gen_push_v(s, s->T0);
             break;
         default:
             goto unknown_op;
         }
         break;
 
     case 0x84: /* test Ev, Gv */
     case 0x85:
         ot = mo_b_d(b, dflag);
 
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
 
         gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
         gen_op_mov_v_reg(s, ot, s->T1, reg);
         gen_op_testl_T0_T1_cc(s);
         set_cc_op(s, CC_OP_LOGICB + ot);
         break;
 
     case 0xa8: /* test eAX, Iv */
     case 0xa9:
         ot = mo_b_d(b, dflag);
         val = insn_get(env, s, ot);
 
         gen_op_mov_v_reg(s, ot, s->T0, OR_EAX);
         tcg_gen_movi_tl(s->T1, val);
         gen_op_testl_T0_T1_cc(s);
         set_cc_op(s, CC_OP_LOGICB + ot);
         break;
 
     case 0x98: /* CWDE/CBW */
         switch (dflag) {
 #ifdef TARGET_X86_64
         case MO_64:
             gen_op_mov_v_reg(s, MO_32, s->T0, R_EAX);
             tcg_gen_ext32s_tl(s->T0, s->T0);
             gen_op_mov_reg_v(s, MO_64, R_EAX, s->T0);
             break;
 #endif
         case MO_32:
             gen_op_mov_v_reg(s, MO_16, s->T0, R_EAX);
             tcg_gen_ext16s_tl(s->T0, s->T0);
             gen_op_mov_reg_v(s, MO_32, R_EAX, s->T0);
             break;
         case MO_16:
             gen_op_mov_v_reg(s, MO_8, s->T0, R_EAX);
             tcg_gen_ext8s_tl(s->T0, s->T0);
             gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
             break;
         default:
             g_assert_not_reached();
         }
         break;
     case 0x99: /* CDQ/CWD */
         switch (dflag) {
 #ifdef TARGET_X86_64
         case MO_64:
             gen_op_mov_v_reg(s, MO_64, s->T0, R_EAX);
             tcg_gen_sari_tl(s->T0, s->T0, 63);
             gen_op_mov_reg_v(s, MO_64, R_EDX, s->T0);
             break;
 #endif
         case MO_32:
             gen_op_mov_v_reg(s, MO_32, s->T0, R_EAX);
             tcg_gen_ext32s_tl(s->T0, s->T0);
             tcg_gen_sari_tl(s->T0, s->T0, 31);
             gen_op_mov_reg_v(s, MO_32, R_EDX, s->T0);
             break;
         case MO_16:
             gen_op_mov_v_reg(s, MO_16, s->T0, R_EAX);
             tcg_gen_ext16s_tl(s->T0, s->T0);
             tcg_gen_sari_tl(s->T0, s->T0, 15);
             gen_op_mov_reg_v(s, MO_16, R_EDX, s->T0);
             break;
         default:
             g_assert_not_reached();
         }
         break;
     case 0x1af: /* imul Gv, Ev */
     case 0x69: /* imul Gv, Ev, I */
     case 0x6b:
         ot = dflag;
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
         if (b == 0x69)
             s->rip_offset = insn_const_size(ot);
         else if (b == 0x6b)
             s->rip_offset = 1;
         gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
         if (b == 0x69) {
             val = insn_get(env, s, ot);
             tcg_gen_movi_tl(s->T1, val);
         } else if (b == 0x6b) {
             val = (int8_t)insn_get(env, s, MO_8);
             tcg_gen_movi_tl(s->T1, val);
         } else {
             gen_op_mov_v_reg(s, ot, s->T1, reg);
         }
         switch (ot) {
 #ifdef TARGET_X86_64
         case MO_64:
             tcg_gen_muls2_i64(cpu_regs[reg], s->T1, s->T0, s->T1);
             tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[reg]);
             tcg_gen_sari_tl(cpu_cc_src, cpu_cc_dst, 63);
             tcg_gen_sub_tl(cpu_cc_src, cpu_cc_src, s->T1);
             break;
 #endif
         case MO_32:
             tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
             tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
             tcg_gen_muls2_i32(s->tmp2_i32, s->tmp3_i32,
                               s->tmp2_i32, s->tmp3_i32);
             tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
             tcg_gen_sari_i32(s->tmp2_i32, s->tmp2_i32, 31);
             tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[reg]);
             tcg_gen_sub_i32(s->tmp2_i32, s->tmp2_i32, s->tmp3_i32);
             tcg_gen_extu_i32_tl(cpu_cc_src, s->tmp2_i32);
             break;
         default:
             tcg_gen_ext16s_tl(s->T0, s->T0);
             tcg_gen_ext16s_tl(s->T1, s->T1);
             /* XXX: use 32 bit mul which could be faster */
             tcg_gen_mul_tl(s->T0, s->T0, s->T1);
             tcg_gen_mov_tl(cpu_cc_dst, s->T0);
             tcg_gen_ext16s_tl(s->tmp0, s->T0);
             tcg_gen_sub_tl(cpu_cc_src, s->T0, s->tmp0);
             gen_op_mov_reg_v(s, ot, reg, s->T0);
             break;
         }
         set_cc_op(s, CC_OP_MULB + ot);
         break;
     case 0x1c0:
     case 0x1c1: /* xadd Ev, Gv */
         ot = mo_b_d(b, dflag);
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
         mod = (modrm >> 6) & 3;
         gen_op_mov_v_reg(s, ot, s->T0, reg);
         if (mod == 3) {
             rm = (modrm & 7) | REX_B(s);
             gen_op_mov_v_reg(s, ot, s->T1, rm);
             tcg_gen_add_tl(s->T0, s->T0, s->T1);
             gen_op_mov_reg_v(s, ot, reg, s->T1);
             gen_op_mov_reg_v(s, ot, rm, s->T0);
         } else {
             gen_lea_modrm(env, s, modrm);
             if (s->prefix & PREFIX_LOCK) {
                 tcg_gen_atomic_fetch_add_tl(s->T1, s->A0, s->T0,
                                             s->mem_index, ot | MO_LE);
                 tcg_gen_add_tl(s->T0, s->T0, s->T1);
             } else {
                 gen_op_ld_v(s, ot, s->T1, s->A0);
                 tcg_gen_add_tl(s->T0, s->T0, s->T1);
                 gen_op_st_v(s, ot, s->T0, s->A0);
             }
             gen_op_mov_reg_v(s, ot, reg, s->T1);
         }
         gen_op_update2_cc(s);
         set_cc_op(s, CC_OP_ADDB + ot);
         break;
     case 0x1b0:
     case 0x1b1: /* cmpxchg Ev, Gv */
         {
             TCGv oldv, newv, cmpv, dest;
 
             ot = mo_b_d(b, dflag);
             modrm = x86_ldub_code(env, s);
             reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
             oldv = tcg_temp_new();
             newv = tcg_temp_new();
             cmpv = tcg_temp_new();
             gen_op_mov_v_reg(s, ot, newv, reg);
             tcg_gen_mov_tl(cmpv, cpu_regs[R_EAX]);
             gen_extu(ot, cmpv);
             if (s->prefix & PREFIX_LOCK) {
                 if (mod == 3) {
                     goto illegal_op;
                 }
                 gen_lea_modrm(env, s, modrm);
                 tcg_gen_atomic_cmpxchg_tl(oldv, s->A0, cmpv, newv,
                                           s->mem_index, ot | MO_LE);
             } else {
                 if (mod == 3) {
                     rm = (modrm & 7) | REX_B(s);
                     gen_op_mov_v_reg(s, ot, oldv, rm);
                     gen_extu(ot, oldv);
 
                     /*
                      * Unlike the memory case, where "the destination operand receives
                      * a write cycle without regard to the result of the comparison",
                      * rm must not be touched altogether if the write fails, including
                      * not zero-extending it on 64-bit processors.  So, precompute
                      * the result of a successful writeback and perform the movcond
                      * directly on cpu_regs.  Also need to write accumulator first, in
                      * case rm is part of RAX too.
                      */
                     dest = gen_op_deposit_reg_v(s, ot, rm, newv, newv);
                     tcg_gen_movcond_tl(TCG_COND_EQ, dest, oldv, cmpv, newv, dest);
                 } else {
                     gen_lea_modrm(env, s, modrm);
                     gen_op_ld_v(s, ot, oldv, s->A0);
 
                     /*
                      * Perform an unconditional store cycle like physical cpu;
                      * must be before changing accumulator to ensure
                      * idempotency if the store faults and the instruction
                      * is restarted
                      */
                     tcg_gen_movcond_tl(TCG_COND_EQ, newv, oldv, cmpv, newv, oldv);
                     gen_op_st_v(s, ot, newv, s->A0);
                 }
             }
 	    /*
 	     * Write EAX only if the cmpxchg fails; reuse newv as the destination,
 	     * since it's dead here.
 	     */
             dest = gen_op_deposit_reg_v(s, ot, R_EAX, newv, oldv);
             tcg_gen_movcond_tl(TCG_COND_EQ, dest, oldv, cmpv, dest, newv);
             tcg_gen_mov_tl(cpu_cc_src, oldv);
             tcg_gen_mov_tl(s->cc_srcT, cmpv);
             tcg_gen_sub_tl(cpu_cc_dst, cmpv, oldv);
             set_cc_op(s, CC_OP_SUBB + ot);
         }
         break;
     case 0x1c7: /* cmpxchg8b */
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
         switch ((modrm >> 3) & 7) {
         case 1: /* CMPXCHG8, CMPXCHG16 */
             if (mod == 3) {
                 goto illegal_op;
             }
 #ifdef TARGET_X86_64
             if (dflag == MO_64) {
                 if (!(s->cpuid_ext_features & CPUID_EXT_CX16)) {
                     goto illegal_op;
                 }
                 gen_cmpxchg16b(s, env, modrm);
                 break;
             }
 #endif
             if (!(s->cpuid_features & CPUID_CX8)) {
                 goto illegal_op;
             }
             gen_cmpxchg8b(s, env, modrm);
             break;
 
         case 7: /* RDSEED, RDPID with f3 prefix */
             if (mod != 3 ||
                 (s->prefix & (PREFIX_LOCK | PREFIX_REPNZ))) {
                 goto illegal_op;
             }
             if (s->prefix & PREFIX_REPZ) {
                 if (!(s->cpuid_ext_features & CPUID_7_0_ECX_RDPID)) {
                     goto illegal_op;
                 }
                 gen_helper_rdpid(s->T0, tcg_env);
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_mov_reg_v(s, dflag, rm, s->T0);
                 break;
             } else {
                 if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_RDSEED)) {
                     goto illegal_op;
                 }
                 goto do_rdrand;
             }
 
         case 6: /* RDRAND */
             if (mod != 3 ||
                 (s->prefix & (PREFIX_LOCK | PREFIX_REPZ | PREFIX_REPNZ)) ||
                 !(s->cpuid_ext_features & CPUID_EXT_RDRAND)) {
                 goto illegal_op;
             }
         do_rdrand:
             translator_io_start(&s->base);
             gen_helper_rdrand(s->T0, tcg_env);
             rm = (modrm & 7) | REX_B(s);
             gen_op_mov_reg_v(s, dflag, rm, s->T0);
             set_cc_op(s, CC_OP_EFLAGS);
             break;
 
         default:
             goto illegal_op;
         }
         break;
 
         /**************************/
         /* push/pop */
     case 0x50 ... 0x57: /* push */
         gen_op_mov_v_reg(s, MO_32, s->T0, (b & 7) | REX_B(s));
         gen_push_v(s, s->T0);
         break;
     case 0x58 ... 0x5f: /* pop */
         ot = gen_pop_T0(s);
         /* NOTE: order is important for pop %sp */
         gen_pop_update(s, ot);
         gen_op_mov_reg_v(s, ot, (b & 7) | REX_B(s), s->T0);
         break;
     case 0x60: /* pusha */
         if (CODE64(s))
             goto illegal_op;
         gen_pusha(s);
         break;
     case 0x61: /* popa */
         if (CODE64(s))
             goto illegal_op;
         gen_popa(s);
         break;
     case 0x68: /* push Iv */
     case 0x6a:
         ot = mo_pushpop(s, dflag);
         if (b == 0x68)
             val = insn_get(env, s, ot);
         else
             val = (int8_t)insn_get(env, s, MO_8);
         tcg_gen_movi_tl(s->T0, val);
         gen_push_v(s, s->T0);
         break;
     case 0x8f: /* pop Ev */
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
         ot = gen_pop_T0(s);
         if (mod == 3) {
             /* NOTE: order is important for pop %sp */
             gen_pop_update(s, ot);
             rm = (modrm & 7) | REX_B(s);
             gen_op_mov_reg_v(s, ot, rm, s->T0);
         } else {
             /* NOTE: order is important too for MMU exceptions */
             s->popl_esp_hack = 1 << ot;
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
             s->popl_esp_hack = 0;
             gen_pop_update(s, ot);
         }
         break;
     case 0xc8: /* enter */
         {
             int level;
             val = x86_lduw_code(env, s);
             level = x86_ldub_code(env, s);
             gen_enter(s, val, level);
         }
         break;
     case 0xc9: /* leave */
         gen_leave(s);
         break;
     case 0x06: /* push es */
     case 0x0e: /* push cs */
     case 0x16: /* push ss */
     case 0x1e: /* push ds */
         if (CODE64(s))
             goto illegal_op;
         gen_op_movl_T0_seg(s, b >> 3);
         gen_push_v(s, s->T0);
         break;
     case 0x1a0: /* push fs */
     case 0x1a8: /* push gs */
         gen_op_movl_T0_seg(s, (b >> 3) & 7);
         gen_push_v(s, s->T0);
         break;
     case 0x07: /* pop es */
     case 0x17: /* pop ss */
     case 0x1f: /* pop ds */
         if (CODE64(s))
             goto illegal_op;
         reg = b >> 3;
         ot = gen_pop_T0(s);
         gen_movl_seg_T0(s, reg);
         gen_pop_update(s, ot);
         break;
     case 0x1a1: /* pop fs */
     case 0x1a9: /* pop gs */
         ot = gen_pop_T0(s);
         gen_movl_seg_T0(s, (b >> 3) & 7);
         gen_pop_update(s, ot);
         break;
 
         /**************************/
         /* mov */
     case 0x88:
     case 0x89: /* mov Gv, Ev */
         ot = mo_b_d(b, dflag);
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
 
         /* generate a generic store */
         gen_ldst_modrm(env, s, modrm, ot, reg, 1);
         break;
     case 0xc6:
     case 0xc7: /* mov Ev, Iv */
         ot = mo_b_d(b, dflag);
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
         if (mod != 3) {
             s->rip_offset = insn_const_size(ot);
             gen_lea_modrm(env, s, modrm);
         }
         val = insn_get(env, s, ot);
         tcg_gen_movi_tl(s->T0, val);
         if (mod != 3) {
             gen_op_st_v(s, ot, s->T0, s->A0);
         } else {
             gen_op_mov_reg_v(s, ot, (modrm & 7) | REX_B(s), s->T0);
         }
         break;
     case 0x8a:
     case 0x8b: /* mov Ev, Gv */
         ot = mo_b_d(b, dflag);
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
 
         gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
         gen_op_mov_reg_v(s, ot, reg, s->T0);
         break;
     case 0x8e: /* mov seg, Gv */
         modrm = x86_ldub_code(env, s);
         reg = (modrm >> 3) & 7;
         if (reg >= 6 || reg == R_CS)
             goto illegal_op;
         gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
         gen_movl_seg_T0(s, reg);
         break;
     case 0x8c: /* mov Gv, seg */
         modrm = x86_ldub_code(env, s);
         reg = (modrm >> 3) & 7;
         mod = (modrm >> 6) & 3;
         if (reg >= 6)
             goto illegal_op;
         gen_op_movl_T0_seg(s, reg);
         ot = mod == 3 ? dflag : MO_16;
         gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
         break;
 
     case 0x1b6: /* movzbS Gv, Eb */
     case 0x1b7: /* movzwS Gv, Eb */
     case 0x1be: /* movsbS Gv, Eb */
     case 0x1bf: /* movswS Gv, Eb */
         {
             MemOp d_ot;
             MemOp s_ot;
 
             /* d_ot is the size of destination */
             d_ot = dflag;
             /* ot is the size of source */
             ot = (b & 1) + MO_8;
             /* s_ot is the sign+size of source */
             s_ot = b & 8 ? MO_SIGN | ot : ot;
 
             modrm = x86_ldub_code(env, s);
             reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
             rm = (modrm & 7) | REX_B(s);
 
             if (mod == 3) {
                 if (s_ot == MO_SB && byte_reg_is_xH(s, rm)) {
                     tcg_gen_sextract_tl(s->T0, cpu_regs[rm - 4], 8, 8);
                 } else {
                     gen_op_mov_v_reg(s, ot, s->T0, rm);
                     switch (s_ot) {
                     case MO_UB:
                         tcg_gen_ext8u_tl(s->T0, s->T0);
                         break;
                     case MO_SB:
                         tcg_gen_ext8s_tl(s->T0, s->T0);
                         break;
                     case MO_UW:
                         tcg_gen_ext16u_tl(s->T0, s->T0);
                         break;
                     default:
                     case MO_SW:
                         tcg_gen_ext16s_tl(s->T0, s->T0);
                         break;
                     }
                 }
                 gen_op_mov_reg_v(s, d_ot, reg, s->T0);
             } else {
                 gen_lea_modrm(env, s, modrm);
                 gen_op_ld_v(s, s_ot, s->T0, s->A0);
                 gen_op_mov_reg_v(s, d_ot, reg, s->T0);
             }
         }
         break;
 
     case 0x8d: /* lea */
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
         if (mod == 3)
             goto illegal_op;
         reg = ((modrm >> 3) & 7) | REX_R(s);
         {
             AddressParts a = gen_lea_modrm_0(env, s, modrm);
             TCGv ea = gen_lea_modrm_1(s, a, false);
             gen_lea_v_seg(s, s->aflag, ea, -1, -1);
             gen_op_mov_reg_v(s, dflag, reg, s->A0);
         }
         break;
 
     case 0xa0: /* mov EAX, Ov */
     case 0xa1:
     case 0xa2: /* mov Ov, EAX */
     case 0xa3:
         {
             target_ulong offset_addr;
 
             ot = mo_b_d(b, dflag);
             offset_addr = insn_get_addr(env, s, s->aflag);
             tcg_gen_movi_tl(s->A0, offset_addr);
             gen_add_A0_ds_seg(s);
             if ((b & 2) == 0) {
                 gen_op_ld_v(s, ot, s->T0, s->A0);
                 gen_op_mov_reg_v(s, ot, R_EAX, s->T0);
             } else {
                 gen_op_mov_v_reg(s, ot, s->T0, R_EAX);
                 gen_op_st_v(s, ot, s->T0, s->A0);
             }
         }
         break;
     case 0xd7: /* xlat */
         tcg_gen_mov_tl(s->A0, cpu_regs[R_EBX]);
         tcg_gen_ext8u_tl(s->T0, cpu_regs[R_EAX]);
         tcg_gen_add_tl(s->A0, s->A0, s->T0);
         gen_extu(s->aflag, s->A0);
         gen_add_A0_ds_seg(s);
         gen_op_ld_v(s, MO_8, s->T0, s->A0);
         gen_op_mov_reg_v(s, MO_8, R_EAX, s->T0);
         break;
     case 0xb0 ... 0xb7: /* mov R, Ib */
         val = insn_get(env, s, MO_8);
         tcg_gen_movi_tl(s->T0, val);
         gen_op_mov_reg_v(s, MO_8, (b & 7) | REX_B(s), s->T0);
         break;
     case 0xb8 ... 0xbf: /* mov R, Iv */
 #ifdef TARGET_X86_64
         if (dflag == MO_64) {
             uint64_t tmp;
             /* 64 bit case */
             tmp = x86_ldq_code(env, s);
             reg = (b & 7) | REX_B(s);
             tcg_gen_movi_tl(s->T0, tmp);
             gen_op_mov_reg_v(s, MO_64, reg, s->T0);
         } else
 #endif
         {
             ot = dflag;
             val = insn_get(env, s, ot);
             reg = (b & 7) | REX_B(s);
             tcg_gen_movi_tl(s->T0, val);
             gen_op_mov_reg_v(s, ot, reg, s->T0);
         }
         break;
 
     case 0x91 ... 0x97: /* xchg R, EAX */
     do_xchg_reg_eax:
         ot = dflag;
         reg = (b & 7) | REX_B(s);
         rm = R_EAX;
         goto do_xchg_reg;
     case 0x86:
     case 0x87: /* xchg Ev, Gv */
         ot = mo_b_d(b, dflag);
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
         mod = (modrm >> 6) & 3;
         if (mod == 3) {
             rm = (modrm & 7) | REX_B(s);
         do_xchg_reg:
             gen_op_mov_v_reg(s, ot, s->T0, reg);
             gen_op_mov_v_reg(s, ot, s->T1, rm);
             gen_op_mov_reg_v(s, ot, rm, s->T0);
             gen_op_mov_reg_v(s, ot, reg, s->T1);
         } else {
             gen_lea_modrm(env, s, modrm);
             gen_op_mov_v_reg(s, ot, s->T0, reg);
             /* for xchg, lock is implicit */
             tcg_gen_atomic_xchg_tl(s->T1, s->A0, s->T0,
                                    s->mem_index, ot | MO_LE);
             gen_op_mov_reg_v(s, ot, reg, s->T1);
         }
         break;
     case 0xc4: /* les Gv */
         /* In CODE64 this is VEX3; see above.  */
         op = R_ES;
         goto do_lxx;
     case 0xc5: /* lds Gv */
         /* In CODE64 this is VEX2; see above.  */
         op = R_DS;
         goto do_lxx;
     case 0x1b2: /* lss Gv */
         op = R_SS;
         goto do_lxx;
     case 0x1b4: /* lfs Gv */
         op = R_FS;
         goto do_lxx;
     case 0x1b5: /* lgs Gv */
         op = R_GS;
     do_lxx:
         ot = dflag != MO_16 ? MO_32 : MO_16;
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
         mod = (modrm >> 6) & 3;
         if (mod == 3)
             goto illegal_op;
         gen_lea_modrm(env, s, modrm);
         gen_op_ld_v(s, ot, s->T1, s->A0);
         gen_add_A0_im(s, 1 << ot);
         /* load the segment first to handle exceptions properly */
         gen_op_ld_v(s, MO_16, s->T0, s->A0);
         gen_movl_seg_T0(s, op);
         /* then put the data */
         gen_op_mov_reg_v(s, ot, reg, s->T1);
         break;
 
         /************************/
         /* shifts */
     case 0xc0:
     case 0xc1:
         /* shift Ev,Ib */
         shift = 2;
     grp2:
         {
             ot = mo_b_d(b, dflag);
             modrm = x86_ldub_code(env, s);
             mod = (modrm >> 6) & 3;
             op = (modrm >> 3) & 7;
 
             if (mod != 3) {
                 if (shift == 2) {
                     s->rip_offset = 1;
                 }
                 gen_lea_modrm(env, s, modrm);
                 opreg = OR_TMP0;
             } else {
                 opreg = (modrm & 7) | REX_B(s);
             }
 
             /* simpler op */
             if (shift == 0) {
                 gen_shift(s, op, ot, opreg, OR_ECX);
             } else {
                 if (shift == 2) {
                     shift = x86_ldub_code(env, s);
                 }
                 gen_shifti(s, op, ot, opreg, shift);
             }
         }
         break;
     case 0xd0:
     case 0xd1:
         /* shift Ev,1 */
         shift = 1;
         goto grp2;
     case 0xd2:
     case 0xd3:
         /* shift Ev,cl */
         shift = 0;
         goto grp2;
 
     case 0x1a4: /* shld imm */
         op = 0;
         shift = 1;
         goto do_shiftd;
     case 0x1a5: /* shld cl */
         op = 0;
         shift = 0;
         goto do_shiftd;
     case 0x1ac: /* shrd imm */
         op = 1;
         shift = 1;
         goto do_shiftd;
     case 0x1ad: /* shrd cl */
         op = 1;
         shift = 0;
     do_shiftd:
         ot = dflag;
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
         rm = (modrm & 7) | REX_B(s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
         if (mod != 3) {
             gen_lea_modrm(env, s, modrm);
             opreg = OR_TMP0;
         } else {
             opreg = rm;
         }
         gen_op_mov_v_reg(s, ot, s->T1, reg);
 
         if (shift) {
             TCGv imm = tcg_constant_tl(x86_ldub_code(env, s));
             gen_shiftd_rm_T1(s, ot, opreg, op, imm);
         } else {
             gen_shiftd_rm_T1(s, ot, opreg, op, cpu_regs[R_ECX]);
         }
         break;
 
         /************************/
         /* floats */
     case 0xd8 ... 0xdf:
         {
             bool update_fip = true;
 
             if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
                 /* if CR0.EM or CR0.TS are set, generate an FPU exception */
                 /* XXX: what to do if illegal op ? */
                 gen_exception(s, EXCP07_PREX);
                 break;
             }
             modrm = x86_ldub_code(env, s);
             mod = (modrm >> 6) & 3;
             rm = modrm & 7;
             op = ((b & 7) << 3) | ((modrm >> 3) & 7);
             if (mod != 3) {
                 /* memory op */
                 AddressParts a = gen_lea_modrm_0(env, s, modrm);
                 TCGv ea = gen_lea_modrm_1(s, a, false);
                 TCGv last_addr = tcg_temp_new();
                 bool update_fdp = true;
 
                 tcg_gen_mov_tl(last_addr, ea);
                 gen_lea_v_seg(s, s->aflag, ea, a.def_seg, s->override);
 
                 switch (op) {
                 case 0x00 ... 0x07: /* fxxxs */
                 case 0x10 ... 0x17: /* fixxxl */
                 case 0x20 ... 0x27: /* fxxxl */
                 case 0x30 ... 0x37: /* fixxx */
                     {
                         int op1;
                         op1 = op & 7;
 
                         switch (op >> 4) {
                         case 0:
                             tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
                                                 s->mem_index, MO_LEUL);
                             gen_helper_flds_FT0(tcg_env, s->tmp2_i32);
                             break;
                         case 1:
                             tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
                                                 s->mem_index, MO_LEUL);
                             gen_helper_fildl_FT0(tcg_env, s->tmp2_i32);
                             break;
                         case 2:
                             tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
                                                 s->mem_index, MO_LEUQ);
                             gen_helper_fldl_FT0(tcg_env, s->tmp1_i64);
                             break;
                         case 3:
                         default:
                             tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
                                                 s->mem_index, MO_LESW);
                             gen_helper_fildl_FT0(tcg_env, s->tmp2_i32);
                             break;
                         }
 
                         gen_helper_fp_arith_ST0_FT0(op1);
                         if (op1 == 3) {
                             /* fcomp needs pop */
                             gen_helper_fpop(tcg_env);
                         }
                     }
                     break;
                 case 0x08: /* flds */
                 case 0x0a: /* fsts */
                 case 0x0b: /* fstps */
                 case 0x18 ... 0x1b: /* fildl, fisttpl, fistl, fistpl */
                 case 0x28 ... 0x2b: /* fldl, fisttpll, fstl, fstpl */
                 case 0x38 ... 0x3b: /* filds, fisttps, fists, fistps */
                     switch (op & 7) {
                     case 0:
                         switch (op >> 4) {
                         case 0:
                             tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
                                                 s->mem_index, MO_LEUL);
                             gen_helper_flds_ST0(tcg_env, s->tmp2_i32);
                             break;
                         case 1:
                             tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
                                                 s->mem_index, MO_LEUL);
                             gen_helper_fildl_ST0(tcg_env, s->tmp2_i32);
                             break;
                         case 2:
                             tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
                                                 s->mem_index, MO_LEUQ);
                             gen_helper_fldl_ST0(tcg_env, s->tmp1_i64);
                             break;
                         case 3:
                         default:
                             tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
                                                 s->mem_index, MO_LESW);
                             gen_helper_fildl_ST0(tcg_env, s->tmp2_i32);
                             break;
                         }
                         break;
                     case 1:
                         /* XXX: the corresponding CPUID bit must be tested ! */
                         switch (op >> 4) {
                         case 1:
                             gen_helper_fisttl_ST0(s->tmp2_i32, tcg_env);
                             tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
                                                 s->mem_index, MO_LEUL);
                             break;
                         case 2:
                             gen_helper_fisttll_ST0(s->tmp1_i64, tcg_env);
                             tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
                                                 s->mem_index, MO_LEUQ);
                             break;
                         case 3:
                         default:
                             gen_helper_fistt_ST0(s->tmp2_i32, tcg_env);
                             tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
                                                 s->mem_index, MO_LEUW);
                             break;
                         }
                         gen_helper_fpop(tcg_env);
                         break;
                     default:
                         switch (op >> 4) {
                         case 0:
                             gen_helper_fsts_ST0(s->tmp2_i32, tcg_env);
                             tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
                                                 s->mem_index, MO_LEUL);
                             break;
                         case 1:
                             gen_helper_fistl_ST0(s->tmp2_i32, tcg_env);
                             tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
                                                 s->mem_index, MO_LEUL);
                             break;
                         case 2:
                             gen_helper_fstl_ST0(s->tmp1_i64, tcg_env);
                             tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
                                                 s->mem_index, MO_LEUQ);
                             break;
                         case 3:
                         default:
                             gen_helper_fist_ST0(s->tmp2_i32, tcg_env);
                             tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
                                                 s->mem_index, MO_LEUW);
                             break;
                         }
                         if ((op & 7) == 3) {
                             gen_helper_fpop(tcg_env);
                         }
                         break;
                     }
                     break;
                 case 0x0c: /* fldenv mem */
                     gen_helper_fldenv(tcg_env, s->A0,
                                       tcg_constant_i32(dflag - 1));
                     update_fip = update_fdp = false;
                     break;
                 case 0x0d: /* fldcw mem */
                     tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
                                         s->mem_index, MO_LEUW);
                     gen_helper_fldcw(tcg_env, s->tmp2_i32);
                     update_fip = update_fdp = false;
                     break;
                 case 0x0e: /* fnstenv mem */
                     gen_helper_fstenv(tcg_env, s->A0,
                                       tcg_constant_i32(dflag - 1));
                     update_fip = update_fdp = false;
                     break;
                 case 0x0f: /* fnstcw mem */
                     gen_helper_fnstcw(s->tmp2_i32, tcg_env);
                     tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
                                         s->mem_index, MO_LEUW);
                     update_fip = update_fdp = false;
                     break;
                 case 0x1d: /* fldt mem */
                     gen_helper_fldt_ST0(tcg_env, s->A0);
                     break;
                 case 0x1f: /* fstpt mem */
                     gen_helper_fstt_ST0(tcg_env, s->A0);
                     gen_helper_fpop(tcg_env);
                     break;
                 case 0x2c: /* frstor mem */
                     gen_helper_frstor(tcg_env, s->A0,
                                       tcg_constant_i32(dflag - 1));
                     update_fip = update_fdp = false;
                     break;
                 case 0x2e: /* fnsave mem */
                     gen_helper_fsave(tcg_env, s->A0,
                                      tcg_constant_i32(dflag - 1));
                     update_fip = update_fdp = false;
                     break;
                 case 0x2f: /* fnstsw mem */
                     gen_helper_fnstsw(s->tmp2_i32, tcg_env);
                     tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
                                         s->mem_index, MO_LEUW);
                     update_fip = update_fdp = false;
                     break;
                 case 0x3c: /* fbld */
                     gen_helper_fbld_ST0(tcg_env, s->A0);
                     break;
                 case 0x3e: /* fbstp */
                     gen_helper_fbst_ST0(tcg_env, s->A0);
                     gen_helper_fpop(tcg_env);
                     break;
                 case 0x3d: /* fildll */
                     tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
                                         s->mem_index, MO_LEUQ);
                     gen_helper_fildll_ST0(tcg_env, s->tmp1_i64);
                     break;
                 case 0x3f: /* fistpll */
                     gen_helper_fistll_ST0(s->tmp1_i64, tcg_env);
                     tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
                                         s->mem_index, MO_LEUQ);
                     gen_helper_fpop(tcg_env);
                     break;
                 default:
                     goto unknown_op;
                 }
 
                 if (update_fdp) {
                     int last_seg = s->override >= 0 ? s->override : a.def_seg;
 
                     tcg_gen_ld_i32(s->tmp2_i32, tcg_env,
                                    offsetof(CPUX86State,
                                             segs[last_seg].selector));
                     tcg_gen_st16_i32(s->tmp2_i32, tcg_env,
                                      offsetof(CPUX86State, fpds));
                     tcg_gen_st_tl(last_addr, tcg_env,
                                   offsetof(CPUX86State, fpdp));
                 }
             } else {
                 /* register float ops */
                 opreg = rm;
 
                 switch (op) {
                 case 0x08: /* fld sti */
                     gen_helper_fpush(tcg_env);
                     gen_helper_fmov_ST0_STN(tcg_env,
                                             tcg_constant_i32((opreg + 1) & 7));
                     break;
                 case 0x09: /* fxchg sti */
                 case 0x29: /* fxchg4 sti, undocumented op */
                 case 0x39: /* fxchg7 sti, undocumented op */
                     gen_helper_fxchg_ST0_STN(tcg_env, tcg_constant_i32(opreg));
                     break;
                 case 0x0a: /* grp d9/2 */
                     switch (rm) {
                     case 0: /* fnop */
                         /*
                          * check exceptions (FreeBSD FPU probe)
                          * needs to be treated as I/O because of ferr_irq
                          */
                         translator_io_start(&s->base);
                         gen_helper_fwait(tcg_env);
                         update_fip = false;
                         break;
                     default:
                         goto unknown_op;
                     }
                     break;
                 case 0x0c: /* grp d9/4 */
                     switch (rm) {
                     case 0: /* fchs */
                         gen_helper_fchs_ST0(tcg_env);
                         break;
                     case 1: /* fabs */
                         gen_helper_fabs_ST0(tcg_env);
                         break;
                     case 4: /* ftst */
                         gen_helper_fldz_FT0(tcg_env);
                         gen_helper_fcom_ST0_FT0(tcg_env);
                         break;
                     case 5: /* fxam */
                         gen_helper_fxam_ST0(tcg_env);
                         break;
                     default:
                         goto unknown_op;
                     }
                     break;
                 case 0x0d: /* grp d9/5 */
                     {
                         switch (rm) {
                         case 0:
                             gen_helper_fpush(tcg_env);
                             gen_helper_fld1_ST0(tcg_env);
                             break;
                         case 1:
                             gen_helper_fpush(tcg_env);
                             gen_helper_fldl2t_ST0(tcg_env);
                             break;
                         case 2:
                             gen_helper_fpush(tcg_env);
                             gen_helper_fldl2e_ST0(tcg_env);
                             break;
                         case 3:
                             gen_helper_fpush(tcg_env);
                             gen_helper_fldpi_ST0(tcg_env);
                             break;
                         case 4:
                             gen_helper_fpush(tcg_env);
                             gen_helper_fldlg2_ST0(tcg_env);
                             break;
                         case 5:
                             gen_helper_fpush(tcg_env);
                             gen_helper_fldln2_ST0(tcg_env);
                             break;
                         case 6:
                             gen_helper_fpush(tcg_env);
                             gen_helper_fldz_ST0(tcg_env);
                             break;
                         default:
                             goto unknown_op;
                         }
                     }
                     break;
                 case 0x0e: /* grp d9/6 */
                     switch (rm) {
                     case 0: /* f2xm1 */
                         gen_helper_f2xm1(tcg_env);
                         break;
                     case 1: /* fyl2x */
                         gen_helper_fyl2x(tcg_env);
                         break;
                     case 2: /* fptan */
                         gen_helper_fptan(tcg_env);
                         break;
                     case 3: /* fpatan */
                         gen_helper_fpatan(tcg_env);
                         break;
                     case 4: /* fxtract */
                         gen_helper_fxtract(tcg_env);
                         break;
                     case 5: /* fprem1 */
                         gen_helper_fprem1(tcg_env);
                         break;
                     case 6: /* fdecstp */
                         gen_helper_fdecstp(tcg_env);
                         break;
                     default:
                     case 7: /* fincstp */
                         gen_helper_fincstp(tcg_env);
                         break;
                     }
                     break;
                 case 0x0f: /* grp d9/7 */
                     switch (rm) {
                     case 0: /* fprem */
                         gen_helper_fprem(tcg_env);
                         break;
                     case 1: /* fyl2xp1 */
                         gen_helper_fyl2xp1(tcg_env);
                         break;
                     case 2: /* fsqrt */
                         gen_helper_fsqrt(tcg_env);
                         break;
                     case 3: /* fsincos */
                         gen_helper_fsincos(tcg_env);
                         break;
                     case 5: /* fscale */
                         gen_helper_fscale(tcg_env);
                         break;
                     case 4: /* frndint */
                         gen_helper_frndint(tcg_env);
                         break;
                     case 6: /* fsin */
                         gen_helper_fsin(tcg_env);
                         break;
                     default:
                     case 7: /* fcos */
                         gen_helper_fcos(tcg_env);
                         break;
                     }
                     break;
                 case 0x00: case 0x01: case 0x04 ... 0x07: /* fxxx st, sti */
                 case 0x20: case 0x21: case 0x24 ... 0x27: /* fxxx sti, st */
                 case 0x30: case 0x31: case 0x34 ... 0x37: /* fxxxp sti, st */
                     {
                         int op1;
 
                         op1 = op & 7;
                         if (op >= 0x20) {
                             gen_helper_fp_arith_STN_ST0(op1, opreg);
                             if (op >= 0x30) {
                                 gen_helper_fpop(tcg_env);
                             }
                         } else {
                             gen_helper_fmov_FT0_STN(tcg_env,
                                                     tcg_constant_i32(opreg));
                             gen_helper_fp_arith_ST0_FT0(op1);
                         }
                     }
                     break;
                 case 0x02: /* fcom */
                 case 0x22: /* fcom2, undocumented op */
                     gen_helper_fmov_FT0_STN(tcg_env, tcg_constant_i32(opreg));
                     gen_helper_fcom_ST0_FT0(tcg_env);
                     break;
                 case 0x03: /* fcomp */
                 case 0x23: /* fcomp3, undocumented op */
                 case 0x32: /* fcomp5, undocumented op */
                     gen_helper_fmov_FT0_STN(tcg_env, tcg_constant_i32(opreg));
                     gen_helper_fcom_ST0_FT0(tcg_env);
                     gen_helper_fpop(tcg_env);
                     break;
                 case 0x15: /* da/5 */
                     switch (rm) {
                     case 1: /* fucompp */
                         gen_helper_fmov_FT0_STN(tcg_env, tcg_constant_i32(1));
                         gen_helper_fucom_ST0_FT0(tcg_env);
                         gen_helper_fpop(tcg_env);
                         gen_helper_fpop(tcg_env);
                         break;
                     default:
                         goto unknown_op;
                     }
                     break;
                 case 0x1c:
                     switch (rm) {
                     case 0: /* feni (287 only, just do nop here) */
                         break;
                     case 1: /* fdisi (287 only, just do nop here) */
                         break;
                     case 2: /* fclex */
                         gen_helper_fclex(tcg_env);
                         update_fip = false;
                         break;
                     case 3: /* fninit */
                         gen_helper_fninit(tcg_env);
                         update_fip = false;
                         break;
                     case 4: /* fsetpm (287 only, just do nop here) */
                         break;
                     default:
                         goto unknown_op;
                     }
                     break;
                 case 0x1d: /* fucomi */
                     if (!(s->cpuid_features & CPUID_CMOV)) {
                         goto illegal_op;
                     }
                     gen_update_cc_op(s);
                     gen_helper_fmov_FT0_STN(tcg_env, tcg_constant_i32(opreg));
                     gen_helper_fucomi_ST0_FT0(tcg_env);
                     set_cc_op(s, CC_OP_EFLAGS);
                     break;
                 case 0x1e: /* fcomi */
                     if (!(s->cpuid_features & CPUID_CMOV)) {
                         goto illegal_op;
                     }
                     gen_update_cc_op(s);
                     gen_helper_fmov_FT0_STN(tcg_env, tcg_constant_i32(opreg));
                     gen_helper_fcomi_ST0_FT0(tcg_env);
                     set_cc_op(s, CC_OP_EFLAGS);
                     break;
                 case 0x28: /* ffree sti */
                     gen_helper_ffree_STN(tcg_env, tcg_constant_i32(opreg));
                     break;
                 case 0x2a: /* fst sti */
                     gen_helper_fmov_STN_ST0(tcg_env, tcg_constant_i32(opreg));
                     break;
                 case 0x2b: /* fstp sti */
                 case 0x0b: /* fstp1 sti, undocumented op */
                 case 0x3a: /* fstp8 sti, undocumented op */
                 case 0x3b: /* fstp9 sti, undocumented op */
                     gen_helper_fmov_STN_ST0(tcg_env, tcg_constant_i32(opreg));
                     gen_helper_fpop(tcg_env);
                     break;
                 case 0x2c: /* fucom st(i) */
                     gen_helper_fmov_FT0_STN(tcg_env, tcg_constant_i32(opreg));
                     gen_helper_fucom_ST0_FT0(tcg_env);
                     break;
                 case 0x2d: /* fucomp st(i) */
                     gen_helper_fmov_FT0_STN(tcg_env, tcg_constant_i32(opreg));
                     gen_helper_fucom_ST0_FT0(tcg_env);
                     gen_helper_fpop(tcg_env);
                     break;
                 case 0x33: /* de/3 */
                     switch (rm) {
                     case 1: /* fcompp */
                         gen_helper_fmov_FT0_STN(tcg_env, tcg_constant_i32(1));
                         gen_helper_fcom_ST0_FT0(tcg_env);
                         gen_helper_fpop(tcg_env);
                         gen_helper_fpop(tcg_env);
                         break;
                     default:
                         goto unknown_op;
                     }
                     break;
                 case 0x38: /* ffreep sti, undocumented op */
                     gen_helper_ffree_STN(tcg_env, tcg_constant_i32(opreg));
                     gen_helper_fpop(tcg_env);
                     break;
                 case 0x3c: /* df/4 */
                     switch (rm) {
                     case 0:
                         gen_helper_fnstsw(s->tmp2_i32, tcg_env);
                         tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
                         gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
                         break;
                     default:
                         goto unknown_op;
                     }
                     break;
                 case 0x3d: /* fucomip */
                     if (!(s->cpuid_features & CPUID_CMOV)) {
                         goto illegal_op;
                     }
                     gen_update_cc_op(s);
                     gen_helper_fmov_FT0_STN(tcg_env, tcg_constant_i32(opreg));
                     gen_helper_fucomi_ST0_FT0(tcg_env);
                     gen_helper_fpop(tcg_env);
                     set_cc_op(s, CC_OP_EFLAGS);
                     break;
                 case 0x3e: /* fcomip */
                     if (!(s->cpuid_features & CPUID_CMOV)) {
                         goto illegal_op;
                     }
                     gen_update_cc_op(s);
                     gen_helper_fmov_FT0_STN(tcg_env, tcg_constant_i32(opreg));
                     gen_helper_fcomi_ST0_FT0(tcg_env);
                     gen_helper_fpop(tcg_env);
                     set_cc_op(s, CC_OP_EFLAGS);
                     break;
                 case 0x10 ... 0x13: /* fcmovxx */
                 case 0x18 ... 0x1b:
                     {
                         int op1;
                         TCGLabel *l1;
                         static const uint8_t fcmov_cc[8] = {
                             (JCC_B << 1),
                             (JCC_Z << 1),
                             (JCC_BE << 1),
                             (JCC_P << 1),
                         };
 
                         if (!(s->cpuid_features & CPUID_CMOV)) {
                             goto illegal_op;
                         }
                         op1 = fcmov_cc[op & 3] | (((op >> 3) & 1) ^ 1);
                         l1 = gen_new_label();
                         gen_jcc1_noeob(s, op1, l1);
                         gen_helper_fmov_ST0_STN(tcg_env,
                                                 tcg_constant_i32(opreg));
                         gen_set_label(l1);
                     }
                     break;
                 default:
                     goto unknown_op;
                 }
             }
 
             if (update_fip) {
                 tcg_gen_ld_i32(s->tmp2_i32, tcg_env,
                                offsetof(CPUX86State, segs[R_CS].selector));
                 tcg_gen_st16_i32(s->tmp2_i32, tcg_env,
                                  offsetof(CPUX86State, fpcs));
                 tcg_gen_st_tl(eip_cur_tl(s),
                               tcg_env, offsetof(CPUX86State, fpip));
             }
         }
         break;
         /************************/
         /* string ops */
 
     case 0xa4: /* movsS */
     case 0xa5:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
             gen_repz_movs(s, ot);
         } else {
             gen_movs(s, ot);
         }
         break;
 
     case 0xaa: /* stosS */
     case 0xab:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
             gen_repz_stos(s, ot);
         } else {
             gen_stos(s, ot);
         }
         break;
     case 0xac: /* lodsS */
     case 0xad:
         ot = mo_b_d(b, dflag);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
             gen_repz_lods(s, ot);
         } else {
             gen_lods(s, ot);
         }
         break;
     case 0xae: /* scasS */
     case 0xaf:
         ot = mo_b_d(b, dflag);
         if (prefixes & PREFIX_REPNZ) {
             gen_repz_scas(s, ot, 1);
         } else if (prefixes & PREFIX_REPZ) {
             gen_repz_scas(s, ot, 0);
         } else {
             gen_scas(s, ot);
         }
         break;
 
     case 0xa6: /* cmpsS */
     case 0xa7:
         ot = mo_b_d(b, dflag);
         if (prefixes & PREFIX_REPNZ) {
             gen_repz_cmps(s, ot, 1);
         } else if (prefixes & PREFIX_REPZ) {
             gen_repz_cmps(s, ot, 0);
         } else {
             gen_cmps(s, ot);
         }
         break;
     case 0x6c: /* insS */
     case 0x6d:
         ot = mo_b_d32(b, dflag);
         tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
         tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
         if (!gen_check_io(s, ot, s->tmp2_i32,
                           SVM_IOIO_TYPE_MASK | SVM_IOIO_STR_MASK)) {
             break;
         }
         translator_io_start(&s->base);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
             gen_repz_ins(s, ot);
         } else {
             gen_ins(s, ot);
         }
         break;
     case 0x6e: /* outsS */
     case 0x6f:
         ot = mo_b_d32(b, dflag);
         tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
         tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
         if (!gen_check_io(s, ot, s->tmp2_i32, SVM_IOIO_STR_MASK)) {
             break;
         }
         translator_io_start(&s->base);
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
             gen_repz_outs(s, ot);
         } else {
             gen_outs(s, ot);
         }
         break;
 
         /************************/
         /* port I/O */
 
     case 0xe4:
     case 0xe5:
         ot = mo_b_d32(b, dflag);
         val = x86_ldub_code(env, s);
         tcg_gen_movi_i32(s->tmp2_i32, val);
         if (!gen_check_io(s, ot, s->tmp2_i32, SVM_IOIO_TYPE_MASK)) {
             break;
         }
         translator_io_start(&s->base);
         gen_helper_in_func(ot, s->T1, s->tmp2_i32);
         gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
         gen_bpt_io(s, s->tmp2_i32, ot);
         break;
     case 0xe6:
     case 0xe7:
         ot = mo_b_d32(b, dflag);
         val = x86_ldub_code(env, s);
         tcg_gen_movi_i32(s->tmp2_i32, val);
         if (!gen_check_io(s, ot, s->tmp2_i32, 0)) {
             break;
         }
         translator_io_start(&s->base);
         gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
         tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
         gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
         gen_bpt_io(s, s->tmp2_i32, ot);
         break;
     case 0xec:
     case 0xed:
         ot = mo_b_d32(b, dflag);
         tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
         tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
         if (!gen_check_io(s, ot, s->tmp2_i32, SVM_IOIO_TYPE_MASK)) {
             break;
         }
         translator_io_start(&s->base);
         gen_helper_in_func(ot, s->T1, s->tmp2_i32);
         gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
         gen_bpt_io(s, s->tmp2_i32, ot);
         break;
     case 0xee:
     case 0xef:
         ot = mo_b_d32(b, dflag);
         tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
         tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
         if (!gen_check_io(s, ot, s->tmp2_i32, 0)) {
             break;
         }
         translator_io_start(&s->base);
         gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
         tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
         gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
         gen_bpt_io(s, s->tmp2_i32, ot);
         break;
 
         /************************/
         /* control */
     case 0xc2: /* ret im */
         val = x86_ldsw_code(env, s);
         ot = gen_pop_T0(s);
         gen_stack_update(s, val + (1 << ot));
         /* Note that gen_pop_T0 uses a zero-extending load.  */
         gen_op_jmp_v(s, s->T0);
         gen_bnd_jmp(s);
         s->base.is_jmp = DISAS_JUMP;
         break;
     case 0xc3: /* ret */
         ot = gen_pop_T0(s);
         gen_pop_update(s, ot);
         /* Note that gen_pop_T0 uses a zero-extending load.  */
         gen_op_jmp_v(s, s->T0);
         gen_bnd_jmp(s);
         s->base.is_jmp = DISAS_JUMP;
         break;
     case 0xca: /* lret im */
         val = x86_ldsw_code(env, s);
     do_lret:
         if (PE(s) && !VM86(s)) {
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
             gen_helper_lret_protected(tcg_env, tcg_constant_i32(dflag - 1),
                                       tcg_constant_i32(val));
         } else {
             gen_stack_A0(s);
             /* pop offset */
             gen_op_ld_v(s, dflag, s->T0, s->A0);
             /* NOTE: keeping EIP updated is not a problem in case of
                exception */
             gen_op_jmp_v(s, s->T0);
             /* pop selector */
             gen_add_A0_im(s, 1 << dflag);
             gen_op_ld_v(s, dflag, s->T0, s->A0);
             gen_op_movl_seg_T0_vm(s, R_CS);
             /* add stack offset */
             gen_stack_update(s, val + (2 << dflag));
         }
         s->base.is_jmp = DISAS_EOB_ONLY;
         break;
     case 0xcb: /* lret */
         val = 0;
         goto do_lret;
     case 0xcf: /* iret */
         gen_svm_check_intercept(s, SVM_EXIT_IRET);
         if (!PE(s) || VM86(s)) {
             /* real mode or vm86 mode */
             if (!check_vm86_iopl(s)) {
                 break;
             }
             gen_helper_iret_real(tcg_env, tcg_constant_i32(dflag - 1));
         } else {
             gen_helper_iret_protected(tcg_env, tcg_constant_i32(dflag - 1),
                                       eip_next_i32(s));
         }
         set_cc_op(s, CC_OP_EFLAGS);
         s->base.is_jmp = DISAS_EOB_ONLY;
         break;
     case 0xe8: /* call im */
         {
             int diff = (dflag != MO_16
                         ? (int32_t)insn_get(env, s, MO_32)
                         : (int16_t)insn_get(env, s, MO_16));
             gen_push_v(s, eip_next_tl(s));
             gen_bnd_jmp(s);
             gen_jmp_rel(s, dflag, diff, 0);
         }
         break;
     case 0x9a: /* lcall im */
         {
             unsigned int selector, offset;
 
             if (CODE64(s))
                 goto illegal_op;
             ot = dflag;
             offset = insn_get(env, s, ot);
             selector = insn_get(env, s, MO_16);
 
             tcg_gen_movi_tl(s->T0, selector);
             tcg_gen_movi_tl(s->T1, offset);
         }
         goto do_lcall;
     case 0xe9: /* jmp im */
         {
             int diff = (dflag != MO_16
                         ? (int32_t)insn_get(env, s, MO_32)
                         : (int16_t)insn_get(env, s, MO_16));
             gen_bnd_jmp(s);
             gen_jmp_rel(s, dflag, diff, 0);
         }
         break;
     case 0xea: /* ljmp im */
         {
             unsigned int selector, offset;
 
             if (CODE64(s))
                 goto illegal_op;
             ot = dflag;
             offset = insn_get(env, s, ot);
             selector = insn_get(env, s, MO_16);
 
             tcg_gen_movi_tl(s->T0, selector);
             tcg_gen_movi_tl(s->T1, offset);
         }
         goto do_ljmp;
     case 0xeb: /* jmp Jb */
         {
             int diff = (int8_t)insn_get(env, s, MO_8);
             gen_jmp_rel(s, dflag, diff, 0);
         }
         break;
     case 0x70 ... 0x7f: /* jcc Jb */
         {
             int diff = (int8_t)insn_get(env, s, MO_8);
             gen_bnd_jmp(s);
             gen_jcc(s, b, diff);
         }
         break;
     case 0x180 ... 0x18f: /* jcc Jv */
         {
             int diff = (dflag != MO_16
                         ? (int32_t)insn_get(env, s, MO_32)
                         : (int16_t)insn_get(env, s, MO_16));
             gen_bnd_jmp(s);
             gen_jcc(s, b, diff);
         }
         break;
 
     case 0x190 ... 0x19f: /* setcc Gv */
         modrm = x86_ldub_code(env, s);
         gen_setcc1(s, b, s->T0);
         gen_ldst_modrm(env, s, modrm, MO_8, OR_TMP0, 1);
         break;
     case 0x140 ... 0x14f: /* cmov Gv, Ev */
         if (!(s->cpuid_features & CPUID_CMOV)) {
             goto illegal_op;
         }
         ot = dflag;
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
         gen_cmovcc1(env, s, ot, b, modrm, reg);
         break;
 
         /************************/
         /* flags */
     case 0x9c: /* pushf */
         gen_svm_check_intercept(s, SVM_EXIT_PUSHF);
         if (check_vm86_iopl(s)) {
             gen_update_cc_op(s);
             gen_helper_read_eflags(s->T0, tcg_env);
             gen_push_v(s, s->T0);
         }
         break;
     case 0x9d: /* popf */
         gen_svm_check_intercept(s, SVM_EXIT_POPF);
         if (check_vm86_iopl(s)) {
             int mask = TF_MASK | AC_MASK | ID_MASK | NT_MASK;
 
             if (CPL(s) == 0) {
                 mask |= IF_MASK | IOPL_MASK;
             } else if (CPL(s) <= IOPL(s)) {
                 mask |= IF_MASK;
             }
             if (dflag == MO_16) {
                 mask &= 0xffff;
             }
 
             ot = gen_pop_T0(s);
             gen_helper_write_eflags(tcg_env, s->T0, tcg_constant_i32(mask));
             gen_pop_update(s, ot);
             set_cc_op(s, CC_OP_EFLAGS);
             /* abort translation because TF/AC flag may change */
             s->base.is_jmp = DISAS_EOB_NEXT;
         }
         break;
     case 0x9e: /* sahf */
         if (CODE64(s) && !(s->cpuid_ext3_features & CPUID_EXT3_LAHF_LM))
             goto illegal_op;
         tcg_gen_shri_tl(s->T0, cpu_regs[R_EAX], 8);
         gen_compute_eflags(s);
         tcg_gen_andi_tl(cpu_cc_src, cpu_cc_src, CC_O);
         tcg_gen_andi_tl(s->T0, s->T0, CC_S | CC_Z | CC_A | CC_P | CC_C);
         tcg_gen_or_tl(cpu_cc_src, cpu_cc_src, s->T0);
         break;
     case 0x9f: /* lahf */
         if (CODE64(s) && !(s->cpuid_ext3_features & CPUID_EXT3_LAHF_LM))
             goto illegal_op;
         gen_compute_eflags(s);
         /* Note: gen_compute_eflags() only gives the condition codes */
         tcg_gen_ori_tl(s->T0, cpu_cc_src, 0x02);
         tcg_gen_deposit_tl(cpu_regs[R_EAX], cpu_regs[R_EAX], s->T0, 8, 8);
         break;
     case 0xf5: /* cmc */
         gen_compute_eflags(s);
         tcg_gen_xori_tl(cpu_cc_src, cpu_cc_src, CC_C);
         break;
     case 0xf8: /* clc */
         gen_compute_eflags(s);
         tcg_gen_andi_tl(cpu_cc_src, cpu_cc_src, ~CC_C);
         break;
     case 0xf9: /* stc */
         gen_compute_eflags(s);
         tcg_gen_ori_tl(cpu_cc_src, cpu_cc_src, CC_C);
         break;
     case 0xfc: /* cld */
         tcg_gen_movi_i32(s->tmp2_i32, 1);
         tcg_gen_st_i32(s->tmp2_i32, tcg_env, offsetof(CPUX86State, df));
         break;
     case 0xfd: /* std */
         tcg_gen_movi_i32(s->tmp2_i32, -1);
         tcg_gen_st_i32(s->tmp2_i32, tcg_env, offsetof(CPUX86State, df));
         break;
 
         /************************/
         /* bit operations */
     case 0x1ba: /* bt/bts/btr/btc Gv, im */
         ot = dflag;
         modrm = x86_ldub_code(env, s);
         op = (modrm >> 3) & 7;
         mod = (modrm >> 6) & 3;
         rm = (modrm & 7) | REX_B(s);
         if (mod != 3) {
             s->rip_offset = 1;
             gen_lea_modrm(env, s, modrm);
             if (!(s->prefix & PREFIX_LOCK)) {
                 gen_op_ld_v(s, ot, s->T0, s->A0);
             }
         } else {
             gen_op_mov_v_reg(s, ot, s->T0, rm);
         }
         /* load shift */
         val = x86_ldub_code(env, s);
         tcg_gen_movi_tl(s->T1, val);
         if (op < 4)
             goto unknown_op;
         op -= 4;
         goto bt_op;
     case 0x1a3: /* bt Gv, Ev */
         op = 0;
         goto do_btx;
     case 0x1ab: /* bts */
         op = 1;
         goto do_btx;
     case 0x1b3: /* btr */
         op = 2;
         goto do_btx;
     case 0x1bb: /* btc */
         op = 3;
     do_btx:
         ot = dflag;
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
         mod = (modrm >> 6) & 3;
         rm = (modrm & 7) | REX_B(s);
         gen_op_mov_v_reg(s, MO_32, s->T1, reg);
         if (mod != 3) {
             AddressParts a = gen_lea_modrm_0(env, s, modrm);
             /* specific case: we need to add a displacement */
             gen_exts(ot, s->T1);
             tcg_gen_sari_tl(s->tmp0, s->T1, 3 + ot);
             tcg_gen_shli_tl(s->tmp0, s->tmp0, ot);
             tcg_gen_add_tl(s->A0, gen_lea_modrm_1(s, a, false), s->tmp0);
             gen_lea_v_seg(s, s->aflag, s->A0, a.def_seg, s->override);
             if (!(s->prefix & PREFIX_LOCK)) {
                 gen_op_ld_v(s, ot, s->T0, s->A0);
             }
         } else {
             gen_op_mov_v_reg(s, ot, s->T0, rm);
         }
     bt_op:
         tcg_gen_andi_tl(s->T1, s->T1, (1 << (3 + ot)) - 1);
         tcg_gen_movi_tl(s->tmp0, 1);
         tcg_gen_shl_tl(s->tmp0, s->tmp0, s->T1);
         if (s->prefix & PREFIX_LOCK) {
             switch (op) {
             case 0: /* bt */
                 /* Needs no atomic ops; we suppressed the normal
                    memory load for LOCK above so do it now.  */
                 gen_op_ld_v(s, ot, s->T0, s->A0);
                 break;
             case 1: /* bts */
                 tcg_gen_atomic_fetch_or_tl(s->T0, s->A0, s->tmp0,
                                            s->mem_index, ot | MO_LE);
                 break;
             case 2: /* btr */
                 tcg_gen_not_tl(s->tmp0, s->tmp0);
                 tcg_gen_atomic_fetch_and_tl(s->T0, s->A0, s->tmp0,
                                             s->mem_index, ot | MO_LE);
                 break;
             default:
             case 3: /* btc */
                 tcg_gen_atomic_fetch_xor_tl(s->T0, s->A0, s->tmp0,
                                             s->mem_index, ot | MO_LE);
                 break;
             }
             tcg_gen_shr_tl(s->tmp4, s->T0, s->T1);
         } else {
             tcg_gen_shr_tl(s->tmp4, s->T0, s->T1);
             switch (op) {
             case 0: /* bt */
                 /* Data already loaded; nothing to do.  */
                 break;
             case 1: /* bts */
                 tcg_gen_or_tl(s->T0, s->T0, s->tmp0);
                 break;
             case 2: /* btr */
                 tcg_gen_andc_tl(s->T0, s->T0, s->tmp0);
                 break;
             default:
             case 3: /* btc */
                 tcg_gen_xor_tl(s->T0, s->T0, s->tmp0);
                 break;
             }
             if (op != 0) {
                 if (mod != 3) {
                     gen_op_st_v(s, ot, s->T0, s->A0);
                 } else {
                     gen_op_mov_reg_v(s, ot, rm, s->T0);
                 }
             }
         }
 
         /* Delay all CC updates until after the store above.  Note that
            C is the result of the test, Z is unchanged, and the others
            are all undefined.  */
         switch (s->cc_op) {
         case CC_OP_MULB ... CC_OP_MULQ:
         case CC_OP_ADDB ... CC_OP_ADDQ:
         case CC_OP_ADCB ... CC_OP_ADCQ:
         case CC_OP_SUBB ... CC_OP_SUBQ:
         case CC_OP_SBBB ... CC_OP_SBBQ:
         case CC_OP_LOGICB ... CC_OP_LOGICQ:
         case CC_OP_INCB ... CC_OP_INCQ:
         case CC_OP_DECB ... CC_OP_DECQ:
         case CC_OP_SHLB ... CC_OP_SHLQ:
         case CC_OP_SARB ... CC_OP_SARQ:
         case CC_OP_BMILGB ... CC_OP_BMILGQ:
             /* Z was going to be computed from the non-zero status of CC_DST.
                We can get that same Z value (and the new C value) by leaving
                CC_DST alone, setting CC_SRC, and using a CC_OP_SAR of the
                same width.  */
             tcg_gen_mov_tl(cpu_cc_src, s->tmp4);
             set_cc_op(s, ((s->cc_op - CC_OP_MULB) & 3) + CC_OP_SARB);
             break;
         default:
             /* Otherwise, generate EFLAGS and replace the C bit.  */
             gen_compute_eflags(s);
             tcg_gen_deposit_tl(cpu_cc_src, cpu_cc_src, s->tmp4,
                                ctz32(CC_C), 1);
             break;
         }
         break;
     case 0x1bc: /* bsf / tzcnt */
     case 0x1bd: /* bsr / lzcnt */
         ot = dflag;
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
         gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
         gen_extu(ot, s->T0);
 
         /* Note that lzcnt and tzcnt are in different extensions.  */
         if ((prefixes & PREFIX_REPZ)
             && (b & 1
                 ? s->cpuid_ext3_features & CPUID_EXT3_ABM
                 : s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1)) {
             int size = 8 << ot;
             /* For lzcnt/tzcnt, C bit is defined related to the input. */
             tcg_gen_mov_tl(cpu_cc_src, s->T0);
             if (b & 1) {
                 /* For lzcnt, reduce the target_ulong result by the
                    number of zeros that we expect to find at the top.  */
                 tcg_gen_clzi_tl(s->T0, s->T0, TARGET_LONG_BITS);
                 tcg_gen_subi_tl(s->T0, s->T0, TARGET_LONG_BITS - size);
             } else {
                 /* For tzcnt, a zero input must return the operand size.  */
                 tcg_gen_ctzi_tl(s->T0, s->T0, size);
             }
             /* For lzcnt/tzcnt, Z bit is defined related to the result.  */
             gen_op_update1_cc(s);
             set_cc_op(s, CC_OP_BMILGB + ot);
         } else {
             /* For bsr/bsf, only the Z bit is defined and it is related
                to the input and not the result.  */
             tcg_gen_mov_tl(cpu_cc_dst, s->T0);
             set_cc_op(s, CC_OP_LOGICB + ot);
 
             /* ??? The manual says that the output is undefined when the
                input is zero, but real hardware leaves it unchanged, and
                real programs appear to depend on that.  Accomplish this
                by passing the output as the value to return upon zero.  */
             if (b & 1) {
                 /* For bsr, return the bit index of the first 1 bit,
                    not the count of leading zeros.  */
                 tcg_gen_xori_tl(s->T1, cpu_regs[reg], TARGET_LONG_BITS - 1);
                 tcg_gen_clz_tl(s->T0, s->T0, s->T1);
                 tcg_gen_xori_tl(s->T0, s->T0, TARGET_LONG_BITS - 1);
             } else {
                 tcg_gen_ctz_tl(s->T0, s->T0, cpu_regs[reg]);
             }
         }
         gen_op_mov_reg_v(s, ot, reg, s->T0);
         break;
         /************************/
         /* bcd */
     case 0x27: /* daa */
         if (CODE64(s))
             goto illegal_op;
         gen_update_cc_op(s);
         gen_helper_daa(tcg_env);
         set_cc_op(s, CC_OP_EFLAGS);
         break;
     case 0x2f: /* das */
         if (CODE64(s))
             goto illegal_op;
         gen_update_cc_op(s);
         gen_helper_das(tcg_env);
         set_cc_op(s, CC_OP_EFLAGS);
         break;
     case 0x37: /* aaa */
         if (CODE64(s))
             goto illegal_op;
         gen_update_cc_op(s);
         gen_helper_aaa(tcg_env);
         set_cc_op(s, CC_OP_EFLAGS);
         break;
     case 0x3f: /* aas */
         if (CODE64(s))
             goto illegal_op;
         gen_update_cc_op(s);
         gen_helper_aas(tcg_env);
         set_cc_op(s, CC_OP_EFLAGS);
         break;
     case 0xd4: /* aam */
         if (CODE64(s))
             goto illegal_op;
         val = x86_ldub_code(env, s);
         if (val == 0) {
             gen_exception(s, EXCP00_DIVZ);
         } else {
             gen_helper_aam(tcg_env, tcg_constant_i32(val));
             set_cc_op(s, CC_OP_LOGICB);
         }
         break;
     case 0xd5: /* aad */
         if (CODE64(s))
             goto illegal_op;
         val = x86_ldub_code(env, s);
         gen_helper_aad(tcg_env, tcg_constant_i32(val));
         set_cc_op(s, CC_OP_LOGICB);
         break;
         /************************/
         /* misc */
     case 0x90: /* nop */
         /* XXX: correct lock test for all insn */
         if (prefixes & PREFIX_LOCK) {
             goto illegal_op;
         }
         /* If REX_B is set, then this is xchg eax, r8d, not a nop.  */
         if (REX_B(s)) {
             goto do_xchg_reg_eax;
         }
         if (prefixes & PREFIX_REPZ) {
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
             gen_helper_pause(tcg_env, cur_insn_len_i32(s));
             s->base.is_jmp = DISAS_NORETURN;
         }
         break;
     case 0x9b: /* fwait */
         if ((s->flags & (HF_MP_MASK | HF_TS_MASK)) ==
             (HF_MP_MASK | HF_TS_MASK)) {
             gen_exception(s, EXCP07_PREX);
         } else {
             /* needs to be treated as I/O because of ferr_irq */
             translator_io_start(&s->base);
             gen_helper_fwait(tcg_env);
         }
         break;
     case 0xcc: /* int3 */
         gen_interrupt(s, EXCP03_INT3);
         break;
     case 0xcd: /* int N */
         val = x86_ldub_code(env, s);
         if (check_vm86_iopl(s)) {
             gen_interrupt(s, val);
         }
         break;
     case 0xce: /* into */
         if (CODE64(s))
             goto illegal_op;
         gen_update_cc_op(s);
         gen_update_eip_cur(s);
         gen_helper_into(tcg_env, cur_insn_len_i32(s));
         break;
 #ifdef WANT_ICEBP
     case 0xf1: /* icebp (undocumented, exits to external debugger) */
         gen_svm_check_intercept(s, SVM_EXIT_ICEBP);
         gen_debug(s);
         break;
 #endif
     case 0xfa: /* cli */
         if (check_iopl(s)) {
             gen_reset_eflags(s, IF_MASK);
         }
         break;
     case 0xfb: /* sti */
         if (check_iopl(s)) {
             gen_set_eflags(s, IF_MASK);
             /* interruptions are enabled only the first insn after sti */
             gen_update_eip_next(s);
             gen_eob_inhibit_irq(s, true);
         }
         break;
     case 0x62: /* bound */
         if (CODE64(s))
             goto illegal_op;
         ot = dflag;
         modrm = x86_ldub_code(env, s);
         reg = (modrm >> 3) & 7;
         mod = (modrm >> 6) & 3;
         if (mod == 3)
             goto illegal_op;
         gen_op_mov_v_reg(s, ot, s->T0, reg);
         gen_lea_modrm(env, s, modrm);
         tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
         if (ot == MO_16) {
             gen_helper_boundw(tcg_env, s->A0, s->tmp2_i32);
         } else {
             gen_helper_boundl(tcg_env, s->A0, s->tmp2_i32);
         }
         break;
     case 0x1c8 ... 0x1cf: /* bswap reg */
         reg = (b & 7) | REX_B(s);
 #ifdef TARGET_X86_64
         if (dflag == MO_64) {
             tcg_gen_bswap64_i64(cpu_regs[reg], cpu_regs[reg]);
             break;
         }
 #endif
         tcg_gen_bswap32_tl(cpu_regs[reg], cpu_regs[reg], TCG_BSWAP_OZ);
         break;
     case 0xd6: /* salc */
         if (CODE64(s))
             goto illegal_op;
         gen_compute_eflags_c(s, s->T0);
         tcg_gen_neg_tl(s->T0, s->T0);
         gen_op_mov_reg_v(s, MO_8, R_EAX, s->T0);
         break;
     case 0xe0: /* loopnz */
     case 0xe1: /* loopz */
     case 0xe2: /* loop */
     case 0xe3: /* jecxz */
         {
             TCGLabel *l1, *l2;
             int diff = (int8_t)insn_get(env, s, MO_8);
 
             l1 = gen_new_label();
             l2 = gen_new_label();
             gen_update_cc_op(s);
             b &= 3;
             switch(b) {
             case 0: /* loopnz */
             case 1: /* loopz */
                 gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
                 gen_op_jz_ecx(s, l2);
                 gen_jcc1(s, (JCC_Z << 1) | (b ^ 1), l1);
                 break;
             case 2: /* loop */
                 gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
                 gen_op_jnz_ecx(s, l1);
                 break;
             default:
             case 3: /* jcxz */
                 gen_op_jz_ecx(s, l1);
                 break;
             }
 
             gen_set_label(l2);
             gen_jmp_rel_csize(s, 0, 1);
 
             gen_set_label(l1);
             gen_jmp_rel(s, dflag, diff, 0);
         }
         break;
     case 0x130: /* wrmsr */
     case 0x132: /* rdmsr */
         if (check_cpl0(s)) {
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
             if (b & 2) {
                 gen_helper_rdmsr(tcg_env);
             } else {
                 gen_helper_wrmsr(tcg_env);
                 s->base.is_jmp = DISAS_EOB_NEXT;
             }
         }
         break;
     case 0x131: /* rdtsc */
         gen_update_cc_op(s);
         gen_update_eip_cur(s);
         translator_io_start(&s->base);
         gen_helper_rdtsc(tcg_env);
         break;
     case 0x133: /* rdpmc */
         gen_update_cc_op(s);
         gen_update_eip_cur(s);
         gen_helper_rdpmc(tcg_env);
         s->base.is_jmp = DISAS_NORETURN;
         break;
     case 0x134: /* sysenter */
         /* For AMD SYSENTER is not valid in long mode */
         if (LMA(s) && env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1) {
             goto illegal_op;
         }
         if (!PE(s)) {
             gen_exception_gpf(s);
         } else {
             gen_helper_sysenter(tcg_env);
             s->base.is_jmp = DISAS_EOB_ONLY;
         }
         break;
     case 0x135: /* sysexit */
         /* For AMD SYSEXIT is not valid in long mode */
         if (LMA(s) && env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1) {
             goto illegal_op;
         }
         if (!PE(s) || CPL(s) != 0) {
             gen_exception_gpf(s);
         } else {
             gen_helper_sysexit(tcg_env, tcg_constant_i32(dflag - 1));
             s->base.is_jmp = DISAS_EOB_ONLY;
         }
         break;
     case 0x105: /* syscall */
         /* For Intel SYSCALL is only valid in long mode */
         if (!LMA(s) && env->cpuid_vendor1 == CPUID_VENDOR_INTEL_1) {
             goto illegal_op;
         }
         gen_update_cc_op(s);
         gen_update_eip_cur(s);
         gen_helper_syscall(tcg_env, cur_insn_len_i32(s));
         /* TF handling for the syscall insn is different. The TF bit is  checked
            after the syscall insn completes. This allows #DB to not be
            generated after one has entered CPL0 if TF is set in FMASK.  */
         gen_eob_worker(s, false, true);
         break;
     case 0x107: /* sysret */
         /* For Intel SYSRET is only valid in long mode */
         if (!LMA(s) && env->cpuid_vendor1 == CPUID_VENDOR_INTEL_1) {
             goto illegal_op;
         }
         if (!PE(s) || CPL(s) != 0) {
             gen_exception_gpf(s);
         } else {
             gen_helper_sysret(tcg_env, tcg_constant_i32(dflag - 1));
             /* condition codes are modified only in long mode */
             if (LMA(s)) {
                 set_cc_op(s, CC_OP_EFLAGS);
             }
             /* TF handling for the sysret insn is different. The TF bit is
                checked after the sysret insn completes. This allows #DB to be
                generated "as if" the syscall insn in userspace has just
                completed.  */
             gen_eob_worker(s, false, true);
         }
         break;
     case 0x1a2: /* cpuid */
         gen_update_cc_op(s);
         gen_update_eip_cur(s);
         gen_helper_cpuid(tcg_env);
         break;
     case 0xf4: /* hlt */
         if (check_cpl0(s)) {
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
             gen_helper_hlt(tcg_env, cur_insn_len_i32(s));
             s->base.is_jmp = DISAS_NORETURN;
         }
         break;
     case 0x100:
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
         op = (modrm >> 3) & 7;
         switch(op) {
         case 0: /* sldt */
             if (!PE(s) || VM86(s))
                 goto illegal_op;
             if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, SVM_EXIT_LDTR_READ);
             tcg_gen_ld32u_tl(s->T0, tcg_env,
                              offsetof(CPUX86State, ldt.selector));
             ot = mod == 3 ? dflag : MO_16;
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
             break;
         case 2: /* lldt */
             if (!PE(s) || VM86(s))
                 goto illegal_op;
             if (check_cpl0(s)) {
                 gen_svm_check_intercept(s, SVM_EXIT_LDTR_WRITE);
                 gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_lldt(tcg_env, s->tmp2_i32);
             }
             break;
         case 1: /* str */
             if (!PE(s) || VM86(s))
                 goto illegal_op;
             if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, SVM_EXIT_TR_READ);
             tcg_gen_ld32u_tl(s->T0, tcg_env,
                              offsetof(CPUX86State, tr.selector));
             ot = mod == 3 ? dflag : MO_16;
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
             break;
         case 3: /* ltr */
             if (!PE(s) || VM86(s))
                 goto illegal_op;
             if (check_cpl0(s)) {
                 gen_svm_check_intercept(s, SVM_EXIT_TR_WRITE);
                 gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_ltr(tcg_env, s->tmp2_i32);
             }
             break;
         case 4: /* verr */
         case 5: /* verw */
             if (!PE(s) || VM86(s))
                 goto illegal_op;
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
             gen_update_cc_op(s);
             if (op == 4) {
                 gen_helper_verr(tcg_env, s->T0);
             } else {
                 gen_helper_verw(tcg_env, s->T0);
             }
             set_cc_op(s, CC_OP_EFLAGS);
             break;
         default:
             goto unknown_op;
         }
         break;
 
     case 0x101:
         modrm = x86_ldub_code(env, s);
         switch (modrm) {
         CASE_MODRM_MEM_OP(0): /* sgdt */
             if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, SVM_EXIT_GDTR_READ);
             gen_lea_modrm(env, s, modrm);
             tcg_gen_ld32u_tl(s->T0,
                              tcg_env, offsetof(CPUX86State, gdt.limit));
             gen_op_st_v(s, MO_16, s->T0, s->A0);
             gen_add_A0_im(s, 2);
             tcg_gen_ld_tl(s->T0, tcg_env, offsetof(CPUX86State, gdt.base));
             if (dflag == MO_16) {
                 tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
             }
             gen_op_st_v(s, CODE64(s) + MO_32, s->T0, s->A0);
             break;
 
         case 0xc8: /* monitor */
             if (!(s->cpuid_ext_features & CPUID_EXT_MONITOR) || CPL(s) != 0) {
                 goto illegal_op;
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
             tcg_gen_mov_tl(s->A0, cpu_regs[R_EAX]);
             gen_extu(s->aflag, s->A0);
             gen_add_A0_ds_seg(s);
             gen_helper_monitor(tcg_env, s->A0);
             break;
 
         case 0xc9: /* mwait */
             if (!(s->cpuid_ext_features & CPUID_EXT_MONITOR) || CPL(s) != 0) {
                 goto illegal_op;
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
             gen_helper_mwait(tcg_env, cur_insn_len_i32(s));
             s->base.is_jmp = DISAS_NORETURN;
             break;
 
         case 0xca: /* clac */
             if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_SMAP)
                 || CPL(s) != 0) {
                 goto illegal_op;
             }
             gen_reset_eflags(s, AC_MASK);
             s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xcb: /* stac */
             if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_SMAP)
                 || CPL(s) != 0) {
                 goto illegal_op;
             }
             gen_set_eflags(s, AC_MASK);
             s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(1): /* sidt */
             if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, SVM_EXIT_IDTR_READ);
             gen_lea_modrm(env, s, modrm);
             tcg_gen_ld32u_tl(s->T0, tcg_env, offsetof(CPUX86State, idt.limit));
             gen_op_st_v(s, MO_16, s->T0, s->A0);
             gen_add_A0_im(s, 2);
             tcg_gen_ld_tl(s->T0, tcg_env, offsetof(CPUX86State, idt.base));
             if (dflag == MO_16) {
                 tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
             }
             gen_op_st_v(s, CODE64(s) + MO_32, s->T0, s->A0);
             break;
 
         case 0xd0: /* xgetbv */
             if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
                 || (s->prefix & (PREFIX_LOCK | PREFIX_DATA
                                  | PREFIX_REPZ | PREFIX_REPNZ))) {
                 goto illegal_op;
             }
             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
             gen_helper_xgetbv(s->tmp1_i64, tcg_env, s->tmp2_i32);
             tcg_gen_extr_i64_tl(cpu_regs[R_EAX], cpu_regs[R_EDX], s->tmp1_i64);
             break;
 
         case 0xd1: /* xsetbv */
             if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
                 || (s->prefix & (PREFIX_LOCK | PREFIX_DATA
                                  | PREFIX_REPZ | PREFIX_REPNZ))) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
                 break;
             }
             tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
                                   cpu_regs[R_EDX]);
             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
             gen_helper_xsetbv(tcg_env, s->tmp2_i32, s->tmp1_i64);
             /* End TB because translation flags may change.  */
             s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xd8: /* VMRUN */
             if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
             gen_helper_vmrun(tcg_env, tcg_constant_i32(s->aflag - 1),
                              cur_insn_len_i32(s));
             tcg_gen_exit_tb(NULL, 0);
             s->base.is_jmp = DISAS_NORETURN;
             break;
 
         case 0xd9: /* VMMCALL */
             if (!SVME(s)) {
                 goto illegal_op;
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
             gen_helper_vmmcall(tcg_env);
             break;
 
         case 0xda: /* VMLOAD */
             if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
             gen_helper_vmload(tcg_env, tcg_constant_i32(s->aflag - 1));
             break;
 
         case 0xdb: /* VMSAVE */
             if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
             gen_helper_vmsave(tcg_env, tcg_constant_i32(s->aflag - 1));
             break;
 
         case 0xdc: /* STGI */
             if ((!SVME(s) && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
                 || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
             gen_helper_stgi(tcg_env);
             s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xdd: /* CLGI */
             if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
                 break;
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
             gen_helper_clgi(tcg_env);
             break;
 
         case 0xde: /* SKINIT */
             if ((!SVME(s) && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
                 || !PE(s)) {
                 goto illegal_op;
             }
             gen_svm_check_intercept(s, SVM_EXIT_SKINIT);
             /* If not intercepted, not implemented -- raise #UD. */
             goto illegal_op;
 
         case 0xdf: /* INVLPGA */
             if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, SVM_EXIT_INVLPGA);
             if (s->aflag == MO_64) {
                 tcg_gen_mov_tl(s->A0, cpu_regs[R_EAX]);
             } else {
                 tcg_gen_ext32u_tl(s->A0, cpu_regs[R_EAX]);
             }
             gen_helper_flush_page(tcg_env, s->A0);
             s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(2): /* lgdt */
             if (!check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, SVM_EXIT_GDTR_WRITE);
             gen_lea_modrm(env, s, modrm);
             gen_op_ld_v(s, MO_16, s->T1, s->A0);
             gen_add_A0_im(s, 2);
             gen_op_ld_v(s, CODE64(s) + MO_32, s->T0, s->A0);
             if (dflag == MO_16) {
                 tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
             }
             tcg_gen_st_tl(s->T0, tcg_env, offsetof(CPUX86State, gdt.base));
             tcg_gen_st32_tl(s->T1, tcg_env, offsetof(CPUX86State, gdt.limit));
             break;
 
         CASE_MODRM_MEM_OP(3): /* lidt */
             if (!check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, SVM_EXIT_IDTR_WRITE);
             gen_lea_modrm(env, s, modrm);
             gen_op_ld_v(s, MO_16, s->T1, s->A0);
             gen_add_A0_im(s, 2);
             gen_op_ld_v(s, CODE64(s) + MO_32, s->T0, s->A0);
             if (dflag == MO_16) {
                 tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
             }
             tcg_gen_st_tl(s->T0, tcg_env, offsetof(CPUX86State, idt.base));
             tcg_gen_st32_tl(s->T1, tcg_env, offsetof(CPUX86State, idt.limit));
             break;
 
         CASE_MODRM_OP(4): /* smsw */
             if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, SVM_EXIT_READ_CR0);
             tcg_gen_ld_tl(s->T0, tcg_env, offsetof(CPUX86State, cr[0]));
             /*
              * In 32-bit mode, the higher 16 bits of the destination
              * register are undefined.  In practice CR0[31:0] is stored
              * just like in 64-bit mode.
              */
             mod = (modrm >> 6) & 3;
             ot = (mod != 3 ? MO_16 : s->dflag);
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
             break;
         case 0xee: /* rdpkru */
             if (prefixes & PREFIX_LOCK) {
                 goto illegal_op;
             }
             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
             gen_helper_rdpkru(s->tmp1_i64, tcg_env, s->tmp2_i32);
             tcg_gen_extr_i64_tl(cpu_regs[R_EAX], cpu_regs[R_EDX], s->tmp1_i64);
             break;
         case 0xef: /* wrpkru */
             if (prefixes & PREFIX_LOCK) {
                 goto illegal_op;
             }
             tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
                                   cpu_regs[R_EDX]);
             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
             gen_helper_wrpkru(tcg_env, s->tmp2_i32, s->tmp1_i64);
             break;
 
         CASE_MODRM_OP(6): /* lmsw */
             if (!check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
             /*
              * Only the 4 lower bits of CR0 are modified.
              * PE cannot be set to zero if already set to one.
              */
             tcg_gen_ld_tl(s->T1, tcg_env, offsetof(CPUX86State, cr[0]));
             tcg_gen_andi_tl(s->T0, s->T0, 0xf);
             tcg_gen_andi_tl(s->T1, s->T1, ~0xe);
             tcg_gen_or_tl(s->T0, s->T0, s->T1);
             gen_helper_write_crN(tcg_env, tcg_constant_i32(0), s->T0);
             s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(7): /* invlpg */
             if (!check_cpl0(s)) {
                 break;
             }
             gen_svm_check_intercept(s, SVM_EXIT_INVLPG);
             gen_lea_modrm(env, s, modrm);
             gen_helper_flush_page(tcg_env, s->A0);
             s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xf8: /* swapgs */
 #ifdef TARGET_X86_64
             if (CODE64(s)) {
                 if (check_cpl0(s)) {
                     tcg_gen_mov_tl(s->T0, cpu_seg_base[R_GS]);
                     tcg_gen_ld_tl(cpu_seg_base[R_GS], tcg_env,
                                   offsetof(CPUX86State, kernelgsbase));
                     tcg_gen_st_tl(s->T0, tcg_env,
                                   offsetof(CPUX86State, kernelgsbase));
                 }
                 break;
             }
 #endif
             goto illegal_op;
 
         case 0xf9: /* rdtscp */
             if (!(s->cpuid_ext2_features & CPUID_EXT2_RDTSCP)) {
                 goto illegal_op;
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
             translator_io_start(&s->base);
             gen_helper_rdtsc(tcg_env);
             gen_helper_rdpid(s->T0, tcg_env);
             gen_op_mov_reg_v(s, dflag, R_ECX, s->T0);
             break;
 
         default:
             goto unknown_op;
         }
         break;
 
     case 0x108: /* invd */
     case 0x109: /* wbinvd; wbnoinvd with REPZ prefix */
         if (check_cpl0(s)) {
             gen_svm_check_intercept(s, (b & 1) ? SVM_EXIT_WBINVD : SVM_EXIT_INVD);
             /* nothing to do */
         }
         break;
     case 0x63: /* arpl or movslS (x86_64) */
 #ifdef TARGET_X86_64
         if (CODE64(s)) {
             int d_ot;
             /* d_ot is the size of destination */
             d_ot = dflag;
 
             modrm = x86_ldub_code(env, s);
             reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
             rm = (modrm & 7) | REX_B(s);
 
             if (mod == 3) {
                 gen_op_mov_v_reg(s, MO_32, s->T0, rm);
                 /* sign extend */
                 if (d_ot == MO_64) {
                     tcg_gen_ext32s_tl(s->T0, s->T0);
                 }
                 gen_op_mov_reg_v(s, d_ot, reg, s->T0);
             } else {
                 gen_lea_modrm(env, s, modrm);
                 gen_op_ld_v(s, MO_32 | MO_SIGN, s->T0, s->A0);
                 gen_op_mov_reg_v(s, d_ot, reg, s->T0);
             }
         } else
 #endif
         {
             TCGLabel *label1;
             TCGv t0, t1, t2;
 
             if (!PE(s) || VM86(s))
                 goto illegal_op;
             t0 = tcg_temp_new();
             t1 = tcg_temp_new();
             t2 = tcg_temp_new();
             ot = MO_16;
             modrm = x86_ldub_code(env, s);
             reg = (modrm >> 3) & 7;
             mod = (modrm >> 6) & 3;
             rm = modrm & 7;
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_op_ld_v(s, ot, t0, s->A0);
             } else {
                 gen_op_mov_v_reg(s, ot, t0, rm);
             }
             gen_op_mov_v_reg(s, ot, t1, reg);
             tcg_gen_andi_tl(s->tmp0, t0, 3);
             tcg_gen_andi_tl(t1, t1, 3);
             tcg_gen_movi_tl(t2, 0);
             label1 = gen_new_label();
             tcg_gen_brcond_tl(TCG_COND_GE, s->tmp0, t1, label1);
             tcg_gen_andi_tl(t0, t0, ~3);
             tcg_gen_or_tl(t0, t0, t1);
             tcg_gen_movi_tl(t2, CC_Z);
             gen_set_label(label1);
             if (mod != 3) {
                 gen_op_st_v(s, ot, t0, s->A0);
            } else {
                 gen_op_mov_reg_v(s, ot, rm, t0);
             }
             gen_compute_eflags(s);
             tcg_gen_andi_tl(cpu_cc_src, cpu_cc_src, ~CC_Z);
             tcg_gen_or_tl(cpu_cc_src, cpu_cc_src, t2);
         }
         break;
     case 0x102: /* lar */
     case 0x103: /* lsl */
         {
             TCGLabel *label1;
             TCGv t0;
             if (!PE(s) || VM86(s))
                 goto illegal_op;
             ot = dflag != MO_16 ? MO_32 : MO_16;
             modrm = x86_ldub_code(env, s);
             reg = ((modrm >> 3) & 7) | REX_R(s);
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
             t0 = tcg_temp_new();
             gen_update_cc_op(s);
             if (b == 0x102) {
                 gen_helper_lar(t0, tcg_env, s->T0);
             } else {
                 gen_helper_lsl(t0, tcg_env, s->T0);
             }
             tcg_gen_andi_tl(s->tmp0, cpu_cc_src, CC_Z);
             label1 = gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, s->tmp0, 0, label1);
             gen_op_mov_reg_v(s, ot, reg, t0);
             gen_set_label(label1);
             set_cc_op(s, CC_OP_EFLAGS);
         }
         break;
     case 0x118:
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
         op = (modrm >> 3) & 7;
         switch(op) {
         case 0: /* prefetchnta */
         case 1: /* prefetchnt0 */
         case 2: /* prefetchnt0 */
         case 3: /* prefetchnt0 */
             if (mod == 3)
                 goto illegal_op;
             gen_nop_modrm(env, s, modrm);
             /* nothing more to do */
             break;
         default: /* nop (multi byte) */
             gen_nop_modrm(env, s, modrm);
             break;
         }
         break;
     case 0x11a:
         modrm = x86_ldub_code(env, s);
         if (s->flags & HF_MPX_EN_MASK) {
             mod = (modrm >> 6) & 3;
             reg = ((modrm >> 3) & 7) | REX_R(s);
             if (prefixes & PREFIX_REPZ) {
                 /* bndcl */
                 if (reg >= 4
                     || (prefixes & PREFIX_LOCK)
                     || s->aflag == MO_16) {
                     goto illegal_op;
                 }
                 gen_bndck(env, s, modrm, TCG_COND_LTU, cpu_bndl[reg]);
             } else if (prefixes & PREFIX_REPNZ) {
                 /* bndcu */
                 if (reg >= 4
                     || (prefixes & PREFIX_LOCK)
                     || s->aflag == MO_16) {
                     goto illegal_op;
                 }
                 TCGv_i64 notu = tcg_temp_new_i64();
                 tcg_gen_not_i64(notu, cpu_bndu[reg]);
                 gen_bndck(env, s, modrm, TCG_COND_GTU, notu);
             } else if (prefixes & PREFIX_DATA) {
                 /* bndmov -- from reg/mem */
                 if (reg >= 4 || s->aflag == MO_16) {
                     goto illegal_op;
                 }
                 if (mod == 3) {
                     int reg2 = (modrm & 7) | REX_B(s);
                     if (reg2 >= 4 || (prefixes & PREFIX_LOCK)) {
                         goto illegal_op;
                     }
                     if (s->flags & HF_MPX_IU_MASK) {
                         tcg_gen_mov_i64(cpu_bndl[reg], cpu_bndl[reg2]);
                         tcg_gen_mov_i64(cpu_bndu[reg], cpu_bndu[reg2]);
                     }
                 } else {
                     gen_lea_modrm(env, s, modrm);
                     if (CODE64(s)) {
                         tcg_gen_qemu_ld_i64(cpu_bndl[reg], s->A0,
                                             s->mem_index, MO_LEUQ);
                         tcg_gen_addi_tl(s->A0, s->A0, 8);
                         tcg_gen_qemu_ld_i64(cpu_bndu[reg], s->A0,
                                             s->mem_index, MO_LEUQ);
                     } else {
                         tcg_gen_qemu_ld_i64(cpu_bndl[reg], s->A0,
                                             s->mem_index, MO_LEUL);
                         tcg_gen_addi_tl(s->A0, s->A0, 4);
                         tcg_gen_qemu_ld_i64(cpu_bndu[reg], s->A0,
                                             s->mem_index, MO_LEUL);
                     }
                     /* bnd registers are now in-use */
                     gen_set_hflag(s, HF_MPX_IU_MASK);
                 }
             } else if (mod != 3) {
                 /* bndldx */
                 AddressParts a = gen_lea_modrm_0(env, s, modrm);
                 if (reg >= 4
                     || (prefixes & PREFIX_LOCK)
                     || s->aflag == MO_16
                     || a.base < -1) {
                     goto illegal_op;
                 }
                 if (a.base >= 0) {
                     tcg_gen_addi_tl(s->A0, cpu_regs[a.base], a.disp);
                 } else {
                     tcg_gen_movi_tl(s->A0, 0);
                 }
                 gen_lea_v_seg(s, s->aflag, s->A0, a.def_seg, s->override);
                 if (a.index >= 0) {
                     tcg_gen_mov_tl(s->T0, cpu_regs[a.index]);
                 } else {
                     tcg_gen_movi_tl(s->T0, 0);
                 }
                 if (CODE64(s)) {
                     gen_helper_bndldx64(cpu_bndl[reg], tcg_env, s->A0, s->T0);
                     tcg_gen_ld_i64(cpu_bndu[reg], tcg_env,
                                    offsetof(CPUX86State, mmx_t0.MMX_Q(0)));
                 } else {
                     gen_helper_bndldx32(cpu_bndu[reg], tcg_env, s->A0, s->T0);
                     tcg_gen_ext32u_i64(cpu_bndl[reg], cpu_bndu[reg]);
                     tcg_gen_shri_i64(cpu_bndu[reg], cpu_bndu[reg], 32);
                 }
                 gen_set_hflag(s, HF_MPX_IU_MASK);
             }
         }
         gen_nop_modrm(env, s, modrm);
         break;
     case 0x11b:
         modrm = x86_ldub_code(env, s);
         if (s->flags & HF_MPX_EN_MASK) {
             mod = (modrm >> 6) & 3;
             reg = ((modrm >> 3) & 7) | REX_R(s);
             if (mod != 3 && (prefixes & PREFIX_REPZ)) {
                 /* bndmk */
                 if (reg >= 4
                     || (prefixes & PREFIX_LOCK)
                     || s->aflag == MO_16) {
                     goto illegal_op;
                 }
                 AddressParts a = gen_lea_modrm_0(env, s, modrm);
                 if (a.base >= 0) {
                     tcg_gen_extu_tl_i64(cpu_bndl[reg], cpu_regs[a.base]);
                     if (!CODE64(s)) {
                         tcg_gen_ext32u_i64(cpu_bndl[reg], cpu_bndl[reg]);
                     }
                 } else if (a.base == -1) {
                     /* no base register has lower bound of 0 */
                     tcg_gen_movi_i64(cpu_bndl[reg], 0);
                 } else {
                     /* rip-relative generates #ud */
                     goto illegal_op;
                 }
                 tcg_gen_not_tl(s->A0, gen_lea_modrm_1(s, a, false));
                 if (!CODE64(s)) {
                     tcg_gen_ext32u_tl(s->A0, s->A0);
                 }
                 tcg_gen_extu_tl_i64(cpu_bndu[reg], s->A0);
                 /* bnd registers are now in-use */
                 gen_set_hflag(s, HF_MPX_IU_MASK);
                 break;
             } else if (prefixes & PREFIX_REPNZ) {
                 /* bndcn */
                 if (reg >= 4
                     || (prefixes & PREFIX_LOCK)
                     || s->aflag == MO_16) {
                     goto illegal_op;
                 }
                 gen_bndck(env, s, modrm, TCG_COND_GTU, cpu_bndu[reg]);
             } else if (prefixes & PREFIX_DATA) {
                 /* bndmov -- to reg/mem */
                 if (reg >= 4 || s->aflag == MO_16) {
                     goto illegal_op;
                 }
                 if (mod == 3) {
                     int reg2 = (modrm & 7) | REX_B(s);
                     if (reg2 >= 4 || (prefixes & PREFIX_LOCK)) {
                         goto illegal_op;
                     }
                     if (s->flags & HF_MPX_IU_MASK) {
                         tcg_gen_mov_i64(cpu_bndl[reg2], cpu_bndl[reg]);
                         tcg_gen_mov_i64(cpu_bndu[reg2], cpu_bndu[reg]);
                     }
                 } else {
                     gen_lea_modrm(env, s, modrm);
                     if (CODE64(s)) {
                         tcg_gen_qemu_st_i64(cpu_bndl[reg], s->A0,
                                             s->mem_index, MO_LEUQ);
                         tcg_gen_addi_tl(s->A0, s->A0, 8);
                         tcg_gen_qemu_st_i64(cpu_bndu[reg], s->A0,
                                             s->mem_index, MO_LEUQ);
                     } else {
                         tcg_gen_qemu_st_i64(cpu_bndl[reg], s->A0,
                                             s->mem_index, MO_LEUL);
                         tcg_gen_addi_tl(s->A0, s->A0, 4);
                         tcg_gen_qemu_st_i64(cpu_bndu[reg], s->A0,
                                             s->mem_index, MO_LEUL);
                     }
                 }
             } else if (mod != 3) {
                 /* bndstx */
                 AddressParts a = gen_lea_modrm_0(env, s, modrm);
                 if (reg >= 4
                     || (prefixes & PREFIX_LOCK)
                     || s->aflag == MO_16
                     || a.base < -1) {
                     goto illegal_op;
                 }
                 if (a.base >= 0) {
                     tcg_gen_addi_tl(s->A0, cpu_regs[a.base], a.disp);
                 } else {
                     tcg_gen_movi_tl(s->A0, 0);
                 }
                 gen_lea_v_seg(s, s->aflag, s->A0, a.def_seg, s->override);
                 if (a.index >= 0) {
                     tcg_gen_mov_tl(s->T0, cpu_regs[a.index]);
                 } else {
                     tcg_gen_movi_tl(s->T0, 0);
                 }
                 if (CODE64(s)) {
                     gen_helper_bndstx64(tcg_env, s->A0, s->T0,
                                         cpu_bndl[reg], cpu_bndu[reg]);
                 } else {
                     gen_helper_bndstx32(tcg_env, s->A0, s->T0,
                                         cpu_bndl[reg], cpu_bndu[reg]);
                 }
             }
         }
         gen_nop_modrm(env, s, modrm);
         break;
     case 0x119: case 0x11c ... 0x11f: /* nop (multi byte) */
         modrm = x86_ldub_code(env, s);
         gen_nop_modrm(env, s, modrm);
         break;
 
     case 0x120: /* mov reg, crN */
     case 0x122: /* mov crN, reg */
         if (!check_cpl0(s)) {
             break;
         }
         modrm = x86_ldub_code(env, s);
         /*
          * Ignore the mod bits (assume (modrm&0xc0)==0xc0).
          * AMD documentation (24594.pdf) and testing of Intel 386 and 486
          * processors all show that the mod bits are assumed to be 1's,
          * regardless of actual values.
          */
         rm = (modrm & 7) | REX_B(s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
         switch (reg) {
         case 0:
             if ((prefixes & PREFIX_LOCK) &&
                 (s->cpuid_ext3_features & CPUID_EXT3_CR8LEG)) {
                 reg = 8;
             }
             break;
         case 2:
         case 3:
         case 4:
         case 8:
             break;
         default:
             goto unknown_op;
         }
         ot  = (CODE64(s) ? MO_64 : MO_32);
 
         translator_io_start(&s->base);
         if (b & 2) {
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
             gen_op_mov_v_reg(s, ot, s->T0, rm);
             gen_helper_write_crN(tcg_env, tcg_constant_i32(reg), s->T0);
             s->base.is_jmp = DISAS_EOB_NEXT;
         } else {
             gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
             gen_helper_read_crN(s->T0, tcg_env, tcg_constant_i32(reg));
             gen_op_mov_reg_v(s, ot, rm, s->T0);
         }
         break;
 
     case 0x121: /* mov reg, drN */
     case 0x123: /* mov drN, reg */
         if (check_cpl0(s)) {
             modrm = x86_ldub_code(env, s);
             /* Ignore the mod bits (assume (modrm&0xc0)==0xc0).
              * AMD documentation (24594.pdf) and testing of
              * intel 386 and 486 processors all show that the mod bits
              * are assumed to be 1's, regardless of actual values.
              */
             rm = (modrm & 7) | REX_B(s);
             reg = ((modrm >> 3) & 7) | REX_R(s);
             if (CODE64(s))
                 ot = MO_64;
             else
                 ot = MO_32;
             if (reg >= 8) {
                 goto illegal_op;
             }
             if (b & 2) {
                 gen_svm_check_intercept(s, SVM_EXIT_WRITE_DR0 + reg);
                 gen_op_mov_v_reg(s, ot, s->T0, rm);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
                 gen_helper_set_dr(tcg_env, s->tmp2_i32, s->T0);
                 s->base.is_jmp = DISAS_EOB_NEXT;
             } else {
                 gen_svm_check_intercept(s, SVM_EXIT_READ_DR0 + reg);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
                 gen_helper_get_dr(s->T0, tcg_env, s->tmp2_i32);
                 gen_op_mov_reg_v(s, ot, rm, s->T0);
             }
         }
         break;
     case 0x106: /* clts */
         if (check_cpl0(s)) {
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
             gen_helper_clts(tcg_env);
             /* abort block because static cpu state changed */
             s->base.is_jmp = DISAS_EOB_NEXT;
         }
         break;
     /* MMX/3DNow!/SSE/SSE2/SSE3/SSSE3/SSE4 support */
     case 0x1c3: /* MOVNTI reg, mem */
         if (!(s->cpuid_features & CPUID_SSE2))
             goto illegal_op;
         ot = mo_64_32(dflag);
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
         if (mod == 3)
             goto illegal_op;
         reg = ((modrm >> 3) & 7) | REX_R(s);
         /* generate a generic store */
         gen_ldst_modrm(env, s, modrm, ot, reg, 1);
         break;
     case 0x1ae:
         modrm = x86_ldub_code(env, s);
         switch (modrm) {
         CASE_MODRM_MEM_OP(0): /* fxsave */
             if (!(s->cpuid_features & CPUID_FXSR)
                 || (prefixes & PREFIX_LOCK)) {
                 goto illegal_op;
             }
             if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
                 gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
             gen_helper_fxsave(tcg_env, s->A0);
             break;
 
         CASE_MODRM_MEM_OP(1): /* fxrstor */
             if (!(s->cpuid_features & CPUID_FXSR)
                 || (prefixes & PREFIX_LOCK)) {
                 goto illegal_op;
             }
             if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
                 gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
             gen_helper_fxrstor(tcg_env, s->A0);
             break;
 
         CASE_MODRM_MEM_OP(2): /* ldmxcsr */
             if ((s->flags & HF_EM_MASK) || !(s->flags & HF_OSFXSR_MASK)) {
                 goto illegal_op;
             }
             if (s->flags & HF_TS_MASK) {
                 gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
             tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0, s->mem_index, MO_LEUL);
             gen_helper_ldmxcsr(tcg_env, s->tmp2_i32);
             break;
 
         CASE_MODRM_MEM_OP(3): /* stmxcsr */
             if ((s->flags & HF_EM_MASK) || !(s->flags & HF_OSFXSR_MASK)) {
                 goto illegal_op;
             }
             if (s->flags & HF_TS_MASK) {
                 gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_helper_update_mxcsr(tcg_env);
             gen_lea_modrm(env, s, modrm);
             tcg_gen_ld32u_tl(s->T0, tcg_env, offsetof(CPUX86State, mxcsr));
             gen_op_st_v(s, MO_32, s->T0, s->A0);
             break;
 
         CASE_MODRM_MEM_OP(4): /* xsave */
             if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
                 || (prefixes & (PREFIX_LOCK | PREFIX_DATA
                                 | PREFIX_REPZ | PREFIX_REPNZ))) {
                 goto illegal_op;
             }
             gen_lea_modrm(env, s, modrm);
             tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
                                   cpu_regs[R_EDX]);
             gen_helper_xsave(tcg_env, s->A0, s->tmp1_i64);
             break;
 
         CASE_MODRM_MEM_OP(5): /* xrstor */
             if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
                 || (prefixes & (PREFIX_LOCK | PREFIX_DATA
                                 | PREFIX_REPZ | PREFIX_REPNZ))) {
                 goto illegal_op;
             }
             gen_lea_modrm(env, s, modrm);
             tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
                                   cpu_regs[R_EDX]);
             gen_helper_xrstor(tcg_env, s->A0, s->tmp1_i64);
             /* XRSTOR is how MPX is enabled, which changes how
                we translate.  Thus we need to end the TB.  */
             s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(6): /* xsaveopt / clwb */
             if (prefixes & PREFIX_LOCK) {
                 goto illegal_op;
             }
             if (prefixes & PREFIX_DATA) {
                 /* clwb */
                 if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_CLWB)) {
                     goto illegal_op;
                 }
                 gen_nop_modrm(env, s, modrm);
             } else {
                 /* xsaveopt */
                 if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
                     || (s->cpuid_xsave_features & CPUID_XSAVE_XSAVEOPT) == 0
                     || (prefixes & (PREFIX_REPZ | PREFIX_REPNZ))) {
                     goto illegal_op;
                 }
                 gen_lea_modrm(env, s, modrm);
                 tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
                                       cpu_regs[R_EDX]);
                 gen_helper_xsaveopt(tcg_env, s->A0, s->tmp1_i64);
             }
             break;
 
         CASE_MODRM_MEM_OP(7): /* clflush / clflushopt */
             if (prefixes & PREFIX_LOCK) {
                 goto illegal_op;
             }
             if (prefixes & PREFIX_DATA) {
                 /* clflushopt */
                 if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_CLFLUSHOPT)) {
                     goto illegal_op;
                 }
             } else {
                 /* clflush */
                 if ((s->prefix & (PREFIX_REPZ | PREFIX_REPNZ))
                     || !(s->cpuid_features & CPUID_CLFLUSH)) {
                     goto illegal_op;
                 }
             }
             gen_nop_modrm(env, s, modrm);
             break;
 
         case 0xc0 ... 0xc7: /* rdfsbase (f3 0f ae /0) */
         case 0xc8 ... 0xcf: /* rdgsbase (f3 0f ae /1) */
         case 0xd0 ... 0xd7: /* wrfsbase (f3 0f ae /2) */
         case 0xd8 ... 0xdf: /* wrgsbase (f3 0f ae /3) */
             if (CODE64(s)
                 && (prefixes & PREFIX_REPZ)
                 && !(prefixes & PREFIX_LOCK)
                 && (s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_FSGSBASE)) {
                 TCGv base, treg, src, dst;
 
                 /* Preserve hflags bits by testing CR4 at runtime.  */
                 tcg_gen_movi_i32(s->tmp2_i32, CR4_FSGSBASE_MASK);
                 gen_helper_cr4_testbit(tcg_env, s->tmp2_i32);
 
                 base = cpu_seg_base[modrm & 8 ? R_GS : R_FS];
                 treg = cpu_regs[(modrm & 7) | REX_B(s)];
 
                 if (modrm & 0x10) {
                     /* wr*base */
                     dst = base, src = treg;
                 } else {
                     /* rd*base */
                     dst = treg, src = base;
                 }
 
                 if (s->dflag == MO_32) {
                     tcg_gen_ext32u_tl(dst, src);
                 } else {
                     tcg_gen_mov_tl(dst, src);
                 }
                 break;
             }
             goto unknown_op;
 
         case 0xf8: /* sfence / pcommit */
             if (prefixes & PREFIX_DATA) {
                 /* pcommit */
                 if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_PCOMMIT)
                     || (prefixes & PREFIX_LOCK)) {
                     goto illegal_op;
                 }
                 break;
             }
             /* fallthru */
         case 0xf9 ... 0xff: /* sfence */
             if (!(s->cpuid_features & CPUID_SSE)
                 || (prefixes & PREFIX_LOCK)) {
                 goto illegal_op;
             }
             tcg_gen_mb(TCG_MO_ST_ST | TCG_BAR_SC);
             break;
         case 0xe8 ... 0xef: /* lfence */
             if (!(s->cpuid_features & CPUID_SSE)
                 || (prefixes & PREFIX_LOCK)) {
                 goto illegal_op;
             }
             tcg_gen_mb(TCG_MO_LD_LD | TCG_BAR_SC);
             break;
         case 0xf0 ... 0xf7: /* mfence */
             if (!(s->cpuid_features & CPUID_SSE2)
                 || (prefixes & PREFIX_LOCK)) {
                 goto illegal_op;
             }
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
             break;
 
         default:
             goto unknown_op;
         }
         break;
 
     case 0x10d: /* 3DNow! prefetch(w) */
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
         if (mod == 3)
             goto illegal_op;
         gen_nop_modrm(env, s, modrm);
         break;
     case 0x1aa: /* rsm */
         gen_svm_check_intercept(s, SVM_EXIT_RSM);
         if (!(s->flags & HF_SMM_MASK))
             goto illegal_op;
 #ifdef CONFIG_USER_ONLY
         /* we should not be in SMM mode */
         g_assert_not_reached();
 #else
         gen_update_cc_op(s);
         gen_update_eip_next(s);
         gen_helper_rsm(tcg_env);
 #endif /* CONFIG_USER_ONLY */
         s->base.is_jmp = DISAS_EOB_ONLY;
         break;
     case 0x1b8: /* SSE4.2 popcnt */
         if ((prefixes & (PREFIX_REPZ | PREFIX_LOCK | PREFIX_REPNZ)) !=
              PREFIX_REPZ)
             goto illegal_op;
         if (!(s->cpuid_ext_features & CPUID_EXT_POPCNT))
             goto illegal_op;
 
         modrm = x86_ldub_code(env, s);
         reg = ((modrm >> 3) & 7) | REX_R(s);
 
         if (s->prefix & PREFIX_DATA) {
             ot = MO_16;
         } else {
             ot = mo_64_32(dflag);
         }
 
         gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
         gen_extu(ot, s->T0);
         tcg_gen_mov_tl(cpu_cc_src, s->T0);
         tcg_gen_ctpop_tl(s->T0, s->T0);
         gen_op_mov_reg_v(s, ot, reg, s->T0);
 
         set_cc_op(s, CC_OP_POPCNT);
         break;
     case 0x10e ... 0x117:
     case 0x128 ... 0x12f:
     case 0x138 ... 0x13a:
     case 0x150 ... 0x179:
     case 0x17c ... 0x17f:
     case 0x1c2:
     case 0x1c4 ... 0x1c6:
     case 0x1d0 ... 0x1fe:
         disas_insn_new(s, cpu, b);
         break;
     default:
         goto unknown_op;
     }
     return true;
  illegal_op:
     gen_illegal_opcode(s);
     return true;
  unknown_op:
     gen_unknown_opcode(env, s);
     return true;
 }
@@ -7034,30 +7036,31 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     switch (dc->base.is_jmp) {
     case DISAS_NORETURN:
         break;
     case DISAS_TOO_MANY:
         gen_update_cc_op(dc);
         gen_jmp_rel_csize(dc, 0, 0);
         break;
     case DISAS_EOB_NEXT:
         gen_update_cc_op(dc);
         gen_update_eip_cur(dc);
         /* fall through */
+        fallthrough;
     case DISAS_EOB_ONLY:
         gen_eob(dc);
         break;
     case DISAS_EOB_INHIBIT_IRQ:
         gen_update_cc_op(dc);
         gen_update_eip_cur(dc);
         gen_eob_inhibit_irq(dc, true);
         break;
     case DISAS_JUMP:
         gen_jr(dc);
         break;
     default:
         g_assert_not_reached();
     }
 }
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 3afb896a3a..1af7640aab 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -275,40 +275,40 @@ static bool is_shimm1632(uint32_t v32, int *cmode, int *imm8)
 static bool tcg_target_const_match(int64_t val, TCGType type, int ct, int vece)
 {
     if (ct & TCG_CT_CONST) {
         return 1;
     }
     if (type == TCG_TYPE_I32) {
         val = (int32_t)val;
     }
     if ((ct & TCG_CT_CONST_AIMM) && (is_aimm(val) || is_aimm(-val))) {
         return 1;
     }
     if ((ct & TCG_CT_CONST_LIMM) && is_limm(val)) {
         return 1;
     }
     if ((ct & TCG_CT_CONST_ZERO) && val == 0) {
         return 1;
     }
     if ((ct & TCG_CT_CONST_MONE) && val == -1) {
         return 1;
     }
 
     switch (ct & (TCG_CT_CONST_ORRI | TCG_CT_CONST_ANDI)) {
     case 0:
         break;
     case TCG_CT_CONST_ANDI:
         val = ~val;
-        /* fallthru */
+        fallthrough;
     case TCG_CT_CONST_ORRI:
         if (val == deposit64(val, 32, 32, val)) {
             int cmode, imm8;
             return is_shimm1632(val, &cmode, &imm8);
         }
         break;
     default:
         /* Both bits should not be set for the same insn.  */
         g_assert_not_reached();
     }
 
     return 0;
 }
@@ -1174,34 +1174,35 @@ static void tcg_out_ldst(TCGContext *s, AArch64Insn insn, TCGReg rd,
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
     if (ret == arg) {
         return true;
     }
     switch (type) {
     case TCG_TYPE_I32:
     case TCG_TYPE_I64:
         if (ret < 32 && arg < 32) {
             tcg_out_movr(s, type, ret, arg);
             break;
         } else if (ret < 32) {
             tcg_out_insn(s, 3605, UMOV, type, ret, arg, 0, 0);
             break;
         } else if (arg < 32) {
             tcg_out_insn(s, 3605, INS, 0, ret, arg, 4 << type, 0);
             break;
         }
         /* FALLTHRU */
+        fallthrough;
 
     case TCG_TYPE_V64:
         tcg_debug_assert(ret >= 32 && arg >= 32);
         tcg_out_insn(s, 3616, ORR, 0, 0, ret, arg, arg);
         break;
     case TCG_TYPE_V128:
         tcg_debug_assert(ret >= 32 && arg >= 32);
         tcg_out_insn(s, 3616, ORR, 1, 0, ret, arg, arg);
         break;
 
     default:
         g_assert_not_reached();
     }
     return true;
 }
@@ -2016,406 +2017,418 @@ void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
 {
     /* 99% of the time, we can signal the use of extension registers
        by looking to see if the opcode handles 64-bit data.  */
     TCGType ext = (tcg_op_defs[opc].flags & TCG_OPF_64BIT) != 0;
 
     /* Hoist the loads of the most common arguments.  */
     TCGArg a0 = args[0];
     TCGArg a1 = args[1];
     TCGArg a2 = args[2];
     int c2 = const_args[2];
 
     /* Some operands are defined with "rZ" constraint, a register or
        the zero register.  These need not actually test args[I] == 0.  */
 #define REG0(I)  (const_args[I] ? TCG_REG_XZR : (TCGReg)args[I])
 
     switch (opc) {
     case INDEX_op_goto_ptr:
         tcg_out_insn(s, 3207, BR, a0);
         break;
 
     case INDEX_op_br:
         tcg_out_goto_label(s, arg_label(a0));
         break;
 
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8u_i64:
         tcg_out_ldst(s, I3312_LDRB, a0, a1, a2, 0);
         break;
     case INDEX_op_ld8s_i32:
         tcg_out_ldst(s, I3312_LDRSBW, a0, a1, a2, 0);
         break;
     case INDEX_op_ld8s_i64:
         tcg_out_ldst(s, I3312_LDRSBX, a0, a1, a2, 0);
         break;
     case INDEX_op_ld16u_i32:
     case INDEX_op_ld16u_i64:
         tcg_out_ldst(s, I3312_LDRH, a0, a1, a2, 1);
         break;
     case INDEX_op_ld16s_i32:
         tcg_out_ldst(s, I3312_LDRSHW, a0, a1, a2, 1);
         break;
     case INDEX_op_ld16s_i64:
         tcg_out_ldst(s, I3312_LDRSHX, a0, a1, a2, 1);
         break;
     case INDEX_op_ld_i32:
     case INDEX_op_ld32u_i64:
         tcg_out_ldst(s, I3312_LDRW, a0, a1, a2, 2);
         break;
     case INDEX_op_ld32s_i64:
         tcg_out_ldst(s, I3312_LDRSWX, a0, a1, a2, 2);
         break;
     case INDEX_op_ld_i64:
         tcg_out_ldst(s, I3312_LDRX, a0, a1, a2, 3);
         break;
 
     case INDEX_op_st8_i32:
     case INDEX_op_st8_i64:
         tcg_out_ldst(s, I3312_STRB, REG0(0), a1, a2, 0);
         break;
     case INDEX_op_st16_i32:
     case INDEX_op_st16_i64:
         tcg_out_ldst(s, I3312_STRH, REG0(0), a1, a2, 1);
         break;
     case INDEX_op_st_i32:
     case INDEX_op_st32_i64:
         tcg_out_ldst(s, I3312_STRW, REG0(0), a1, a2, 2);
         break;
     case INDEX_op_st_i64:
         tcg_out_ldst(s, I3312_STRX, REG0(0), a1, a2, 3);
         break;
 
     case INDEX_op_add_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_add_i64:
         if (c2) {
             tcg_out_addsubi(s, ext, a0, a1, a2);
         } else {
             tcg_out_insn(s, 3502, ADD, ext, a0, a1, a2);
         }
         break;
 
     case INDEX_op_sub_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_sub_i64:
         if (c2) {
             tcg_out_addsubi(s, ext, a0, a1, -a2);
         } else {
             tcg_out_insn(s, 3502, SUB, ext, a0, a1, a2);
         }
         break;
 
     case INDEX_op_neg_i64:
     case INDEX_op_neg_i32:
         tcg_out_insn(s, 3502, SUB, ext, a0, TCG_REG_XZR, a1);
         break;
 
     case INDEX_op_and_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_and_i64:
         if (c2) {
             tcg_out_logicali(s, I3404_ANDI, ext, a0, a1, a2);
         } else {
             tcg_out_insn(s, 3510, AND, ext, a0, a1, a2);
         }
         break;
 
     case INDEX_op_andc_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_andc_i64:
         if (c2) {
             tcg_out_logicali(s, I3404_ANDI, ext, a0, a1, ~a2);
         } else {
             tcg_out_insn(s, 3510, BIC, ext, a0, a1, a2);
         }
         break;
 
     case INDEX_op_or_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_or_i64:
         if (c2) {
             tcg_out_logicali(s, I3404_ORRI, ext, a0, a1, a2);
         } else {
             tcg_out_insn(s, 3510, ORR, ext, a0, a1, a2);
         }
         break;
 
     case INDEX_op_orc_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_orc_i64:
         if (c2) {
             tcg_out_logicali(s, I3404_ORRI, ext, a0, a1, ~a2);
         } else {
             tcg_out_insn(s, 3510, ORN, ext, a0, a1, a2);
         }
         break;
 
     case INDEX_op_xor_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_xor_i64:
         if (c2) {
             tcg_out_logicali(s, I3404_EORI, ext, a0, a1, a2);
         } else {
             tcg_out_insn(s, 3510, EOR, ext, a0, a1, a2);
         }
         break;
 
     case INDEX_op_eqv_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_eqv_i64:
         if (c2) {
             tcg_out_logicali(s, I3404_EORI, ext, a0, a1, ~a2);
         } else {
             tcg_out_insn(s, 3510, EON, ext, a0, a1, a2);
         }
         break;
 
     case INDEX_op_not_i64:
     case INDEX_op_not_i32:
         tcg_out_insn(s, 3510, ORN, ext, a0, TCG_REG_XZR, a1);
         break;
 
     case INDEX_op_mul_i64:
     case INDEX_op_mul_i32:
         tcg_out_insn(s, 3509, MADD, ext, a0, a1, a2, TCG_REG_XZR);
         break;
 
     case INDEX_op_div_i64:
     case INDEX_op_div_i32:
         tcg_out_insn(s, 3508, SDIV, ext, a0, a1, a2);
         break;
     case INDEX_op_divu_i64:
     case INDEX_op_divu_i32:
         tcg_out_insn(s, 3508, UDIV, ext, a0, a1, a2);
         break;
 
     case INDEX_op_rem_i64:
     case INDEX_op_rem_i32:
         tcg_out_insn(s, 3508, SDIV, ext, TCG_REG_TMP0, a1, a2);
         tcg_out_insn(s, 3509, MSUB, ext, a0, TCG_REG_TMP0, a2, a1);
         break;
     case INDEX_op_remu_i64:
     case INDEX_op_remu_i32:
         tcg_out_insn(s, 3508, UDIV, ext, TCG_REG_TMP0, a1, a2);
         tcg_out_insn(s, 3509, MSUB, ext, a0, TCG_REG_TMP0, a2, a1);
         break;
 
     case INDEX_op_shl_i64:
     case INDEX_op_shl_i32:
         if (c2) {
             tcg_out_shl(s, ext, a0, a1, a2);
         } else {
             tcg_out_insn(s, 3508, LSLV, ext, a0, a1, a2);
         }
         break;
 
     case INDEX_op_shr_i64:
     case INDEX_op_shr_i32:
         if (c2) {
             tcg_out_shr(s, ext, a0, a1, a2);
         } else {
             tcg_out_insn(s, 3508, LSRV, ext, a0, a1, a2);
         }
         break;
 
     case INDEX_op_sar_i64:
     case INDEX_op_sar_i32:
         if (c2) {
             tcg_out_sar(s, ext, a0, a1, a2);
         } else {
             tcg_out_insn(s, 3508, ASRV, ext, a0, a1, a2);
         }
         break;
 
     case INDEX_op_rotr_i64:
     case INDEX_op_rotr_i32:
         if (c2) {
             tcg_out_rotr(s, ext, a0, a1, a2);
         } else {
             tcg_out_insn(s, 3508, RORV, ext, a0, a1, a2);
         }
         break;
 
     case INDEX_op_rotl_i64:
     case INDEX_op_rotl_i32:
         if (c2) {
             tcg_out_rotl(s, ext, a0, a1, a2);
         } else {
             tcg_out_insn(s, 3502, SUB, 0, TCG_REG_TMP0, TCG_REG_XZR, a2);
             tcg_out_insn(s, 3508, RORV, ext, a0, a1, TCG_REG_TMP0);
         }
         break;
 
     case INDEX_op_clz_i64:
     case INDEX_op_clz_i32:
         tcg_out_cltz(s, ext, a0, a1, a2, c2, false);
         break;
     case INDEX_op_ctz_i64:
     case INDEX_op_ctz_i32:
         tcg_out_cltz(s, ext, a0, a1, a2, c2, true);
         break;
 
     case INDEX_op_brcond_i32:
         a1 = (int32_t)a1;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_brcond_i64:
         tcg_out_brcond(s, ext, a2, a0, a1, const_args[1], arg_label(args[3]));
         break;
 
     case INDEX_op_setcond_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_setcond_i64:
         tcg_out_cmp(s, ext, a1, a2, c2);
         /* Use CSET alias of CSINC Wd, WZR, WZR, invert(cond).  */
         tcg_out_insn(s, 3506, CSINC, TCG_TYPE_I32, a0, TCG_REG_XZR,
                      TCG_REG_XZR, tcg_invert_cond(args[3]));
         break;
 
     case INDEX_op_negsetcond_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_negsetcond_i64:
         tcg_out_cmp(s, ext, a1, a2, c2);
         /* Use CSETM alias of CSINV Wd, WZR, WZR, invert(cond).  */
         tcg_out_insn(s, 3506, CSINV, ext, a0, TCG_REG_XZR,
                      TCG_REG_XZR, tcg_invert_cond(args[3]));
         break;
 
     case INDEX_op_movcond_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_movcond_i64:
         tcg_out_cmp(s, ext, a1, a2, c2);
         tcg_out_insn(s, 3506, CSEL, ext, a0, REG0(3), REG0(4), args[5]);
         break;
 
     case INDEX_op_qemu_ld_a32_i32:
     case INDEX_op_qemu_ld_a64_i32:
     case INDEX_op_qemu_ld_a32_i64:
     case INDEX_op_qemu_ld_a64_i64:
         tcg_out_qemu_ld(s, a0, a1, a2, ext);
         break;
     case INDEX_op_qemu_st_a32_i32:
     case INDEX_op_qemu_st_a64_i32:
     case INDEX_op_qemu_st_a32_i64:
     case INDEX_op_qemu_st_a64_i64:
         tcg_out_qemu_st(s, REG0(0), a1, a2, ext);
         break;
     case INDEX_op_qemu_ld_a32_i128:
     case INDEX_op_qemu_ld_a64_i128:
         tcg_out_qemu_ldst_i128(s, a0, a1, a2, args[3], true);
         break;
     case INDEX_op_qemu_st_a32_i128:
     case INDEX_op_qemu_st_a64_i128:
         tcg_out_qemu_ldst_i128(s, REG0(0), REG0(1), a2, args[3], false);
         break;
 
     case INDEX_op_bswap64_i64:
         tcg_out_rev(s, TCG_TYPE_I64, MO_64, a0, a1);
         break;
     case INDEX_op_bswap32_i64:
         tcg_out_rev(s, TCG_TYPE_I32, MO_32, a0, a1);
         if (a2 & TCG_BSWAP_OS) {
             tcg_out_ext32s(s, a0, a0);
         }
         break;
     case INDEX_op_bswap32_i32:
         tcg_out_rev(s, TCG_TYPE_I32, MO_32, a0, a1);
         break;
     case INDEX_op_bswap16_i64:
     case INDEX_op_bswap16_i32:
         tcg_out_rev(s, TCG_TYPE_I32, MO_16, a0, a1);
         if (a2 & TCG_BSWAP_OS) {
             /* Output must be sign-extended. */
             tcg_out_ext16s(s, ext, a0, a0);
         } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
             /* Output must be zero-extended, but input isn't. */
             tcg_out_ext16u(s, a0, a0);
         }
         break;
 
     case INDEX_op_deposit_i64:
     case INDEX_op_deposit_i32:
         tcg_out_dep(s, ext, a0, REG0(2), args[3], args[4]);
         break;
 
     case INDEX_op_extract_i64:
     case INDEX_op_extract_i32:
         tcg_out_ubfm(s, ext, a0, a1, a2, a2 + args[3] - 1);
         break;
 
     case INDEX_op_sextract_i64:
     case INDEX_op_sextract_i32:
         tcg_out_sbfm(s, ext, a0, a1, a2, a2 + args[3] - 1);
         break;
 
     case INDEX_op_extract2_i64:
     case INDEX_op_extract2_i32:
         tcg_out_extr(s, ext, a0, REG0(2), REG0(1), args[3]);
         break;
 
     case INDEX_op_add2_i32:
         tcg_out_addsub2(s, TCG_TYPE_I32, a0, a1, REG0(2), REG0(3),
                         (int32_t)args[4], args[5], const_args[4],
                         const_args[5], false);
         break;
     case INDEX_op_add2_i64:
         tcg_out_addsub2(s, TCG_TYPE_I64, a0, a1, REG0(2), REG0(3), args[4],
                         args[5], const_args[4], const_args[5], false);
         break;
     case INDEX_op_sub2_i32:
         tcg_out_addsub2(s, TCG_TYPE_I32, a0, a1, REG0(2), REG0(3),
                         (int32_t)args[4], args[5], const_args[4],
                         const_args[5], true);
         break;
     case INDEX_op_sub2_i64:
         tcg_out_addsub2(s, TCG_TYPE_I64, a0, a1, REG0(2), REG0(3), args[4],
                         args[5], const_args[4], const_args[5], true);
         break;
 
     case INDEX_op_muluh_i64:
         tcg_out_insn(s, 3508, UMULH, TCG_TYPE_I64, a0, a1, a2);
         break;
     case INDEX_op_mulsh_i64:
         tcg_out_insn(s, 3508, SMULH, TCG_TYPE_I64, a0, a1, a2);
         break;
 
     case INDEX_op_mb:
         tcg_out_mb(s, a0);
         break;
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
     case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
 
 #undef REG0
 }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 0d9c2d157b..ceb747183d 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -504,41 +504,42 @@ static bool is_shimm1632(uint32_t v32, int *cmode, int *imm8)
 /* Test if a constant matches the constraint.
  * TODO: define constraints for:
  *
  * ldr/str offset:   between -0xfff and 0xfff
  * ldrh/strh offset: between -0xff and 0xff
  * mov operand2:     values represented with x << (2 * y), x < 0x100
  * add, sub, eor...: ditto
  */
 static bool tcg_target_const_match(int64_t val, TCGType type, int ct, int vece)
 {
     if (ct & TCG_CT_CONST) {
         return 1;
     } else if ((ct & TCG_CT_CONST_ARM) && check_fit_imm(val)) {
         return 1;
     } else if ((ct & TCG_CT_CONST_INV) && check_fit_imm(~val)) {
         return 1;
     } else if ((ct & TCG_CT_CONST_NEG) && check_fit_imm(-val)) {
         return 1;
     } else if ((ct & TCG_CT_CONST_ZERO) && val == 0) {
         return 1;
     }
 
     switch (ct & (TCG_CT_CONST_ORRI | TCG_CT_CONST_ANDI)) {
     case 0:
         break;
     case TCG_CT_CONST_ANDI:
         val = ~val;
         /* fallthru */
+        fallthrough;
     case TCG_CT_CONST_ORRI:
         if (val == deposit64(val, 32, 32, val)) {
             int cmode, imm8;
             return is_shimm1632(val, &cmode, &imm8);
         }
         break;
     default:
         /* Both bits should not be set for the same insn.  */
         g_assert_not_reached();
     }
 
     return 0;
 }
@@ -2578,190 +2579,190 @@ static const ARMInsn vec_cmp0_insn[16] = {
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            unsigned vecl, unsigned vece,
                            const TCGArg args[TCG_MAX_OP_ARGS],
                            const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGType type = vecl + TCG_TYPE_V64;
     unsigned q = vecl;
     TCGArg a0, a1, a2, a3;
     int cmode, imm8;
 
     a0 = args[0];
     a1 = args[1];
     a2 = args[2];
 
     switch (opc) {
     case INDEX_op_ld_vec:
         tcg_out_ld(s, type, a0, a1, a2);
         return;
     case INDEX_op_st_vec:
         tcg_out_st(s, type, a0, a1, a2);
         return;
     case INDEX_op_dupm_vec:
         tcg_out_dupm_vec(s, type, vece, a0, a1, a2);
         return;
     case INDEX_op_dup2_vec:
         tcg_out_dup2_vec(s, a0, a1, a2);
         return;
     case INDEX_op_abs_vec:
         tcg_out_vreg2(s, INSN_VABS, q, vece, a0, a1);
         return;
     case INDEX_op_neg_vec:
         tcg_out_vreg2(s, INSN_VNEG, q, vece, a0, a1);
         return;
     case INDEX_op_not_vec:
         tcg_out_vreg2(s, INSN_VMVN, q, 0, a0, a1);
         return;
     case INDEX_op_add_vec:
         tcg_out_vreg3(s, INSN_VADD, q, vece, a0, a1, a2);
         return;
     case INDEX_op_mul_vec:
         tcg_out_vreg3(s, INSN_VMUL, q, vece, a0, a1, a2);
         return;
     case INDEX_op_smax_vec:
         tcg_out_vreg3(s, INSN_VMAX, q, vece, a0, a1, a2);
         return;
     case INDEX_op_smin_vec:
         tcg_out_vreg3(s, INSN_VMIN, q, vece, a0, a1, a2);
         return;
     case INDEX_op_sub_vec:
         tcg_out_vreg3(s, INSN_VSUB, q, vece, a0, a1, a2);
         return;
     case INDEX_op_ssadd_vec:
         tcg_out_vreg3(s, INSN_VQADD, q, vece, a0, a1, a2);
         return;
     case INDEX_op_sssub_vec:
         tcg_out_vreg3(s, INSN_VQSUB, q, vece, a0, a1, a2);
         return;
     case INDEX_op_umax_vec:
         tcg_out_vreg3(s, INSN_VMAX_U, q, vece, a0, a1, a2);
         return;
     case INDEX_op_umin_vec:
         tcg_out_vreg3(s, INSN_VMIN_U, q, vece, a0, a1, a2);
         return;
     case INDEX_op_usadd_vec:
         tcg_out_vreg3(s, INSN_VQADD_U, q, vece, a0, a1, a2);
         return;
     case INDEX_op_ussub_vec:
         tcg_out_vreg3(s, INSN_VQSUB_U, q, vece, a0, a1, a2);
         return;
     case INDEX_op_xor_vec:
         tcg_out_vreg3(s, INSN_VEOR, q, 0, a0, a1, a2);
         return;
     case INDEX_op_arm_sshl_vec:
         /*
          * Note that Vm is the data and Vn is the shift count,
          * therefore the arguments appear reversed.
          */
         tcg_out_vreg3(s, INSN_VSHL_S, q, vece, a0, a2, a1);
         return;
     case INDEX_op_arm_ushl_vec:
         /* See above. */
         tcg_out_vreg3(s, INSN_VSHL_U, q, vece, a0, a2, a1);
         return;
     case INDEX_op_shli_vec:
         tcg_out_vshifti(s, INSN_VSHLI, q, a0, a1, a2 + (8 << vece));
         return;
     case INDEX_op_shri_vec:
         tcg_out_vshifti(s, INSN_VSHRI, q, a0, a1, (16 << vece) - a2);
         return;
     case INDEX_op_sari_vec:
         tcg_out_vshifti(s, INSN_VSARI, q, a0, a1, (16 << vece) - a2);
         return;
     case INDEX_op_arm_sli_vec:
         tcg_out_vshifti(s, INSN_VSLI, q, a0, a2, args[3] + (8 << vece));
         return;
 
     case INDEX_op_andc_vec:
         if (!const_args[2]) {
             tcg_out_vreg3(s, INSN_VBIC, q, 0, a0, a1, a2);
             return;
         }
         a2 = ~a2;
-        /* fall through */
+        fallthrough;
     case INDEX_op_and_vec:
         if (const_args[2]) {
             is_shimm1632(~a2, &cmode, &imm8);
             if (a0 == a1) {
                 tcg_out_vmovi(s, a0, q, 1, cmode | 1, imm8); /* VBICI */
                 return;
             }
             tcg_out_vmovi(s, a0, q, 1, cmode, imm8); /* VMVNI */
             a2 = a0;
         }
         tcg_out_vreg3(s, INSN_VAND, q, 0, a0, a1, a2);
         return;
 
     case INDEX_op_orc_vec:
         if (!const_args[2]) {
             tcg_out_vreg3(s, INSN_VORN, q, 0, a0, a1, a2);
             return;
         }
         a2 = ~a2;
-        /* fall through */
+        fallthrough;
     case INDEX_op_or_vec:
         if (const_args[2]) {
             is_shimm1632(a2, &cmode, &imm8);
             if (a0 == a1) {
                 tcg_out_vmovi(s, a0, q, 0, cmode | 1, imm8); /* VORRI */
                 return;
             }
             tcg_out_vmovi(s, a0, q, 0, cmode, imm8); /* VMOVI */
             a2 = a0;
         }
         tcg_out_vreg3(s, INSN_VORR, q, 0, a0, a1, a2);
         return;
 
     case INDEX_op_cmp_vec:
         {
             TCGCond cond = args[3];
 
             if (cond == TCG_COND_NE) {
                 if (const_args[2]) {
                     tcg_out_vreg3(s, INSN_VTST, q, vece, a0, a1, a1);
                 } else {
                     tcg_out_vreg3(s, INSN_VCEQ, q, vece, a0, a1, a2);
                     tcg_out_vreg2(s, INSN_VMVN, q, 0, a0, a0);
                 }
             } else {
                 ARMInsn insn;
 
                 if (const_args[2]) {
                     insn = vec_cmp0_insn[cond];
                     if (insn) {
                         tcg_out_vreg2(s, insn, q, vece, a0, a1);
                         return;
                     }
                     tcg_out_dupi_vec(s, type, MO_8, TCG_VEC_TMP, 0);
                     a2 = TCG_VEC_TMP;
                 }
                 insn = vec_cmp_insn[cond];
                 if (insn == 0) {
                     TCGArg t;
                     t = a1, a1 = a2, a2 = t;
                     cond = tcg_swap_cond(cond);
                     insn = vec_cmp_insn[cond];
                     tcg_debug_assert(insn != 0);
                 }
                 tcg_out_vreg3(s, insn, q, vece, a0, a1, a2);
             }
         }
         return;
 
     case INDEX_op_bitsel_vec:
         a3 = args[3];
         if (a0 == a3) {
             tcg_out_vreg3(s, INSN_VBIT, q, 0, a0, a2, a1);
         } else if (a0 == a2) {
             tcg_out_vreg3(s, INSN_VBIF, q, 0, a0, a3, a1);
         } else {
             tcg_out_mov(s, type, a0, a1);
             tcg_out_vreg3(s, INSN_VBSL, q, 0, a0, a2, a3);
         }
         return;
 
     case INDEX_op_mov_vec:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_dup_vec:  /* Always emitted via tcg_out_dup_vec.  */
     default:
         g_assert_not_reached();
     }
 }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 788d608150..8f0764156e 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -173,28 +173,29 @@ static const tcg_insn_unit *tb_ret_addr;
 static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend)
 {
     value += addend;
     switch(type) {
     case R_386_PC32:
         value -= (uintptr_t)tcg_splitwx_to_rx(code_ptr);
         if (value != (int32_t)value) {
             return false;
         }
         /* FALLTHRU */
+        fallthrough;
     case R_386_32:
         tcg_patch32(code_ptr, value);
         break;
     case R_386_PC8:
         value -= (uintptr_t)tcg_splitwx_to_rx(code_ptr);
         if (value != (int8_t)value) {
             return false;
         }
         tcg_patch8(code_ptr, value);
         break;
     default:
         g_assert_not_reached();
     }
     return true;
 }
 
 /* test if a constant matches the constraint */
@@ -837,45 +838,46 @@ static inline void tgen_arithr(TCGContext *s, int subop, int dest, int src)
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
     int rexw = 0;
 
     if (arg == ret) {
         return true;
     }
     switch (type) {
     case TCG_TYPE_I64:
         rexw = P_REXW;
         /* fallthru */
+        fallthrough;
     case TCG_TYPE_I32:
         if (ret < 16) {
             if (arg < 16) {
                 tcg_out_modrm(s, OPC_MOVL_GvEv + rexw, ret, arg);
             } else {
                 tcg_out_vex_modrm(s, OPC_MOVD_EyVy + rexw, arg, 0, ret);
             }
         } else {
             if (arg < 16) {
                 tcg_out_vex_modrm(s, OPC_MOVD_VyEy + rexw, ret, 0, arg);
             } else {
                 tcg_out_vex_modrm(s, OPC_MOVQ_VqWq, ret, 0, arg);
             }
         }
         break;
 
     case TCG_TYPE_V64:
         tcg_debug_assert(ret >= 16 && arg >= 16);
         tcg_out_vex_modrm(s, OPC_MOVQ_VqWq, ret, 0, arg);
         break;
     case TCG_TYPE_V128:
         tcg_debug_assert(ret >= 16 && arg >= 16);
         tcg_out_vex_modrm(s, OPC_MOVDQA_VxWx, ret, 0, arg);
         break;
     case TCG_TYPE_V256:
         tcg_debug_assert(ret >= 16 && arg >= 16);
         tcg_out_vex_modrm(s, OPC_MOVDQA_VxWx | P_VEXL, ret, 0, arg);
         break;
 
     default:
         g_assert_not_reached();
     }
     return true;
 }
@@ -888,31 +890,33 @@ static const int avx2_dup_insn[4] = {
 static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
                             TCGReg r, TCGReg a)
 {
     if (have_avx2) {
         int vex_l = (type == TCG_TYPE_V256 ? P_VEXL : 0);
         tcg_out_vex_modrm(s, avx2_dup_insn[vece] + vex_l, r, 0, a);
     } else {
         switch (vece) {
         case MO_8:
             /* ??? With zero in a register, use PSHUFB.  */
             tcg_out_vex_modrm(s, OPC_PUNPCKLBW, r, a, a);
             a = r;
             /* FALLTHRU */
+            fallthrough;
         case MO_16:
             tcg_out_vex_modrm(s, OPC_PUNPCKLWD, r, a, a);
             a = r;
             /* FALLTHRU */
+            fallthrough;
         case MO_32:
             tcg_out_vex_modrm(s, OPC_PSHUFD, r, 0, a);
             /* imm8 operand: all output lanes selected from input lane 0.  */
             tcg_out8(s, 0);
             break;
         case MO_64:
             tcg_out_vex_modrm(s, OPC_PUNPCKLQDQ, r, a, a);
             break;
         default:
             g_assert_not_reached();
         }
     }
     return true;
 }
@@ -1112,44 +1116,45 @@ static inline void tcg_out_pop(TCGContext *s, int reg)
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret,
                        TCGReg arg1, intptr_t arg2)
 {
     switch (type) {
     case TCG_TYPE_I32:
         if (ret < 16) {
             tcg_out_modrm_offset(s, OPC_MOVL_GvEv, ret, arg1, arg2);
         } else {
             tcg_out_vex_modrm_offset(s, OPC_MOVD_VyEy, ret, 0, arg1, arg2);
         }
         break;
     case TCG_TYPE_I64:
         if (ret < 16) {
             tcg_out_modrm_offset(s, OPC_MOVL_GvEv | P_REXW, ret, arg1, arg2);
             break;
         }
         /* FALLTHRU */
+        fallthrough;
     case TCG_TYPE_V64:
         /* There is no instruction that can validate 8-byte alignment.  */
         tcg_debug_assert(ret >= 16);
         tcg_out_vex_modrm_offset(s, OPC_MOVQ_VqWq, ret, 0, arg1, arg2);
         break;
     case TCG_TYPE_V128:
         /*
          * The gvec infrastructure is asserts that v128 vector loads
          * and stores use a 16-byte aligned offset.  Validate that the
          * final pointer is aligned by using an insn that will SIGSEGV.
          */
         tcg_debug_assert(ret >= 16);
         tcg_out_vex_modrm_offset(s, OPC_MOVDQA_VxWx, ret, 0, arg1, arg2);
         break;
     case TCG_TYPE_V256:
         /*
          * The gvec infrastructure only requires 16-byte alignment,
          * so here we must use an unaligned load.
          */
         tcg_debug_assert(ret >= 16);
         tcg_out_vex_modrm_offset(s, OPC_MOVDQU_VxWx | P_VEXL,
                                  ret, 0, arg1, arg2);
         break;
     default:
         g_assert_not_reached();
     }
 }
@@ -1157,51 +1162,52 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret,
 static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
                        TCGReg arg1, intptr_t arg2)
 {
     switch (type) {
     case TCG_TYPE_I32:
         if (arg < 16) {
             tcg_out_modrm_offset(s, OPC_MOVL_EvGv, arg, arg1, arg2);
         } else {
             tcg_out_vex_modrm_offset(s, OPC_MOVD_EyVy, arg, 0, arg1, arg2);
         }
         break;
     case TCG_TYPE_I64:
         if (arg < 16) {
             tcg_out_modrm_offset(s, OPC_MOVL_EvGv | P_REXW, arg, arg1, arg2);
             break;
         }
         /* FALLTHRU */
+        fallthrough;
     case TCG_TYPE_V64:
         /* There is no instruction that can validate 8-byte alignment.  */
         tcg_debug_assert(arg >= 16);
         tcg_out_vex_modrm_offset(s, OPC_MOVQ_WqVq, arg, 0, arg1, arg2);
         break;
     case TCG_TYPE_V128:
         /*
          * The gvec infrastructure is asserts that v128 vector loads
          * and stores use a 16-byte aligned offset.  Validate that the
          * final pointer is aligned by using an insn that will SIGSEGV.
          *
          * This specific instance is also used by TCG_CALL_RET_BY_VEC,
          * for _WIN64, which must have SSE2 but may not have AVX.
          */
         tcg_debug_assert(arg >= 16);
         if (have_avx1) {
             tcg_out_vex_modrm_offset(s, OPC_MOVDQA_WxVx, arg, 0, arg1, arg2);
         } else {
             tcg_out_modrm_offset(s, OPC_MOVDQA_WxVx, arg, arg1, arg2);
         }
         break;
     case TCG_TYPE_V256:
         /*
          * The gvec infrastructure only requires 16-byte alignment,
          * so here we must use an unaligned store.
          */
         tcg_debug_assert(arg >= 16);
         tcg_out_vex_modrm_offset(s, OPC_MOVDQU_WxVx | P_VEXL,
                                  arg, 0, arg1, arg2);
         break;
     default:
         g_assert_not_reached();
     }
 }
@@ -1530,101 +1536,101 @@ static void tcg_out_brcond2(TCGContext *s, const TCGArg *args,
 static void tcg_out_setcond(TCGContext *s, int rexw, TCGCond cond,
                             TCGArg dest, TCGArg arg1, TCGArg arg2,
                             int const_arg2, bool neg)
 {
     bool inv = false;
     bool cleared;
 
     switch (cond) {
     case TCG_COND_NE:
         inv = true;
-        /* fall through */
+        fallthrough;
     case TCG_COND_EQ:
         /* If arg2 is 0, convert to LTU/GEU vs 1. */
         if (const_arg2 && arg2 == 0) {
             arg2 = 1;
             goto do_ltu;
         }
         break;
 
     case TCG_COND_LEU:
         inv = true;
-        /* fall through */
+        fallthrough;
     case TCG_COND_GTU:
         /* If arg2 is a register, swap for LTU/GEU. */
         if (!const_arg2) {
             TCGReg t = arg1;
             arg1 = arg2;
             arg2 = t;
             goto do_ltu;
         }
         break;
 
     case TCG_COND_GEU:
         inv = true;
-        /* fall through */
+        fallthrough;
     case TCG_COND_LTU:
     do_ltu:
         /*
          * Relying on the carry bit, use SBB to produce -1 if LTU, 0 if GEU.
          * We can then use NEG or INC to produce the desired result.
          * This is always smaller than the SETCC expansion.
          */
         tcg_out_cmp(s, arg1, arg2, const_arg2, rexw);
 
         /* X - X - C = -C = (C ? -1 : 0) */
         tgen_arithr(s, ARITH_SBB + (neg ? rexw : 0), dest, dest);
         if (inv && neg) {
             /* ~(C ? -1 : 0) = (C ? 0 : -1) */
             tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_NOT, dest);
         } else if (inv) {
             /* (C ? -1 : 0) + 1 = (C ? 0 : 1) */
             tgen_arithi(s, ARITH_ADD, dest, 1, 0);
         } else if (!neg) {
             /* -(C ? -1 : 0) = (C ? 1 : 0) */
             tcg_out_modrm(s, OPC_GRP3_Ev, EXT3_NEG, dest);
         }
         return;
 
     case TCG_COND_GE:
         inv = true;
-        /* fall through */
+        fallthrough;
     case TCG_COND_LT:
         /* If arg2 is 0, extract the sign bit. */
         if (const_arg2 && arg2 == 0) {
             tcg_out_mov(s, rexw ? TCG_TYPE_I64 : TCG_TYPE_I32, dest, arg1);
             if (inv) {
                 tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_NOT, dest);
             }
             tcg_out_shifti(s, (neg ? SHIFT_SAR : SHIFT_SHR) + rexw,
                            dest, rexw ? 63 : 31);
             return;
         }
         break;
 
     default:
         break;
     }
 
     /*
      * If dest does not overlap the inputs, clearing it first is preferred.
      * The XOR breaks any false dependency for the low-byte write to dest,
      * and is also one byte smaller than MOVZBL.
      */
     cleared = false;
     if (dest != arg1 && (const_arg2 || dest != arg2)) {
         tgen_arithr(s, ARITH_XOR, dest, dest);
         cleared = true;
     }
 
     tcg_out_cmp(s, arg1, arg2, const_arg2, rexw);
     tcg_out_modrm(s, OPC_SETCC | tcg_cond_to_jcc[cond], 0, dest);
 
     if (!cleared) {
         tcg_out_ext8u(s, dest, dest);
     }
     if (neg) {
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_NEG, dest);
     }
 }
 
 #if TCG_TARGET_REG_BITS == 32
@@ -2435,473 +2441,475 @@ void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
 static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                               const TCGArg args[TCG_MAX_OP_ARGS],
                               const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0, a1, a2;
     int c, const_a2, vexop, rexw = 0;
 
 #if TCG_TARGET_REG_BITS == 64
 # define OP_32_64(x) \
         case glue(glue(INDEX_op_, x), _i64): \
             rexw = P_REXW; /* FALLTHRU */    \
+            fallthrough;                     \
         case glue(glue(INDEX_op_, x), _i32)
 #else
 # define OP_32_64(x) \
         case glue(glue(INDEX_op_, x), _i32)
 #endif
 
     /* Hoist the loads of the most common arguments.  */
     a0 = args[0];
     a1 = args[1];
     a2 = args[2];
     const_a2 = const_args[2];
 
     switch (opc) {
     case INDEX_op_goto_ptr:
         /* jmp to the given host address (could be epilogue) */
         tcg_out_modrm(s, OPC_GRP5, EXT5_JMPN_Ev, a0);
         break;
     case INDEX_op_br:
         tcg_out_jxx(s, JCC_JMP, arg_label(a0), 0);
         break;
     OP_32_64(ld8u):
         /* Note that we can ignore REXW for the zero-extend to 64-bit.  */
         tcg_out_modrm_offset(s, OPC_MOVZBL, a0, a1, a2);
         break;
     OP_32_64(ld8s):
         tcg_out_modrm_offset(s, OPC_MOVSBL + rexw, a0, a1, a2);
         break;
     OP_32_64(ld16u):
         /* Note that we can ignore REXW for the zero-extend to 64-bit.  */
         tcg_out_modrm_offset(s, OPC_MOVZWL, a0, a1, a2);
         break;
     OP_32_64(ld16s):
         tcg_out_modrm_offset(s, OPC_MOVSWL + rexw, a0, a1, a2);
         break;
 #if TCG_TARGET_REG_BITS == 64
     case INDEX_op_ld32u_i64:
 #endif
     case INDEX_op_ld_i32:
         tcg_out_ld(s, TCG_TYPE_I32, a0, a1, a2);
         break;
 
     OP_32_64(st8):
         if (const_args[0]) {
             tcg_out_modrm_offset(s, OPC_MOVB_EvIz, 0, a1, a2);
             tcg_out8(s, a0);
         } else {
             tcg_out_modrm_offset(s, OPC_MOVB_EvGv | P_REXB_R, a0, a1, a2);
         }
         break;
     OP_32_64(st16):
         if (const_args[0]) {
             tcg_out_modrm_offset(s, OPC_MOVL_EvIz | P_DATA16, 0, a1, a2);
             tcg_out16(s, a0);
         } else {
             tcg_out_modrm_offset(s, OPC_MOVL_EvGv | P_DATA16, a0, a1, a2);
         }
         break;
 #if TCG_TARGET_REG_BITS == 64
     case INDEX_op_st32_i64:
 #endif
     case INDEX_op_st_i32:
         if (const_args[0]) {
             tcg_out_modrm_offset(s, OPC_MOVL_EvIz, 0, a1, a2);
             tcg_out32(s, a0);
         } else {
             tcg_out_st(s, TCG_TYPE_I32, a0, a1, a2);
         }
         break;
 
     OP_32_64(add):
         /* For 3-operand addition, use LEA.  */
         if (a0 != a1) {
             TCGArg c3 = 0;
             if (const_a2) {
                 c3 = a2, a2 = -1;
             } else if (a0 == a2) {
                 /* Watch out for dest = src + dest, since we've removed
                    the matching constraint on the add.  */
                 tgen_arithr(s, ARITH_ADD + rexw, a0, a1);
                 break;
             }
 
             tcg_out_modrm_sib_offset(s, OPC_LEA + rexw, a0, a1, a2, 0, c3);
             break;
         }
         c = ARITH_ADD;
         goto gen_arith;
     OP_32_64(sub):
         c = ARITH_SUB;
         goto gen_arith;
     OP_32_64(and):
         c = ARITH_AND;
         goto gen_arith;
     OP_32_64(or):
         c = ARITH_OR;
         goto gen_arith;
     OP_32_64(xor):
         c = ARITH_XOR;
         goto gen_arith;
     gen_arith:
         if (const_a2) {
             tgen_arithi(s, c + rexw, a0, a2, 0);
         } else {
             tgen_arithr(s, c + rexw, a0, a2);
         }
         break;
 
     OP_32_64(andc):
         if (const_a2) {
             tcg_out_mov(s, rexw ? TCG_TYPE_I64 : TCG_TYPE_I32, a0, a1);
             tgen_arithi(s, ARITH_AND + rexw, a0, ~a2, 0);
         } else {
             tcg_out_vex_modrm(s, OPC_ANDN + rexw, a0, a2, a1);
         }
         break;
 
     OP_32_64(mul):
         if (const_a2) {
             int32_t val;
             val = a2;
             if (val == (int8_t)val) {
                 tcg_out_modrm(s, OPC_IMUL_GvEvIb + rexw, a0, a0);
                 tcg_out8(s, val);
             } else {
                 tcg_out_modrm(s, OPC_IMUL_GvEvIz + rexw, a0, a0);
                 tcg_out32(s, val);
             }
         } else {
             tcg_out_modrm(s, OPC_IMUL_GvEv + rexw, a0, a2);
         }
         break;
 
     OP_32_64(div2):
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_IDIV, args[4]);
         break;
     OP_32_64(divu2):
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_DIV, args[4]);
         break;
 
     OP_32_64(shl):
         /* For small constant 3-operand shift, use LEA.  */
         if (const_a2 && a0 != a1 && (a2 - 1) < 3) {
             if (a2 - 1 == 0) {
                 /* shl $1,a1,a0 -> lea (a1,a1),a0 */
                 tcg_out_modrm_sib_offset(s, OPC_LEA + rexw, a0, a1, a1, 0, 0);
             } else {
                 /* shl $n,a1,a0 -> lea 0(,a1,n),a0 */
                 tcg_out_modrm_sib_offset(s, OPC_LEA + rexw, a0, -1, a1, a2, 0);
             }
             break;
         }
         c = SHIFT_SHL;
         vexop = OPC_SHLX;
         goto gen_shift_maybe_vex;
     OP_32_64(shr):
         c = SHIFT_SHR;
         vexop = OPC_SHRX;
         goto gen_shift_maybe_vex;
     OP_32_64(sar):
         c = SHIFT_SAR;
         vexop = OPC_SARX;
         goto gen_shift_maybe_vex;
     OP_32_64(rotl):
         c = SHIFT_ROL;
         goto gen_shift;
     OP_32_64(rotr):
         c = SHIFT_ROR;
         goto gen_shift;
     gen_shift_maybe_vex:
         if (have_bmi2) {
             if (!const_a2) {
                 tcg_out_vex_modrm(s, vexop + rexw, a0, a2, a1);
                 break;
             }
             tcg_out_mov(s, rexw ? TCG_TYPE_I64 : TCG_TYPE_I32, a0, a1);
         }
         /* FALLTHRU */
     gen_shift:
         if (const_a2) {
             tcg_out_shifti(s, c + rexw, a0, a2);
         } else {
             tcg_out_modrm(s, OPC_SHIFT_cl + rexw, c, a0);
         }
         break;
 
     OP_32_64(ctz):
         tcg_out_ctz(s, rexw, args[0], args[1], args[2], const_args[2]);
         break;
     OP_32_64(clz):
         tcg_out_clz(s, rexw, args[0], args[1], args[2], const_args[2]);
         break;
     OP_32_64(ctpop):
         tcg_out_modrm(s, OPC_POPCNT + rexw, a0, a1);
         break;
 
     OP_32_64(brcond):
         tcg_out_brcond(s, rexw, a2, a0, a1, const_args[1],
                        arg_label(args[3]), 0);
         break;
     OP_32_64(setcond):
         tcg_out_setcond(s, rexw, args[3], a0, a1, a2, const_a2, false);
         break;
     OP_32_64(negsetcond):
         tcg_out_setcond(s, rexw, args[3], a0, a1, a2, const_a2, true);
         break;
     OP_32_64(movcond):
         tcg_out_movcond(s, rexw, args[5], a0, a1, a2, const_a2, args[3]);
         break;
 
     OP_32_64(bswap16):
         if (a2 & TCG_BSWAP_OS) {
             /* Output must be sign-extended. */
             if (rexw) {
                 tcg_out_bswap64(s, a0);
                 tcg_out_shifti(s, SHIFT_SAR + rexw, a0, 48);
             } else {
                 tcg_out_bswap32(s, a0);
                 tcg_out_shifti(s, SHIFT_SAR, a0, 16);
             }
         } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
             /* Output must be zero-extended, but input isn't. */
             tcg_out_bswap32(s, a0);
             tcg_out_shifti(s, SHIFT_SHR, a0, 16);
         } else {
             tcg_out_rolw_8(s, a0);
         }
         break;
     OP_32_64(bswap32):
         tcg_out_bswap32(s, a0);
         if (rexw && (a2 & TCG_BSWAP_OS)) {
             tcg_out_ext32s(s, a0, a0);
         }
         break;
 
     OP_32_64(neg):
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_NEG, a0);
         break;
     OP_32_64(not):
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_NOT, a0);
         break;
 
     case INDEX_op_qemu_ld_a64_i32:
         if (TCG_TARGET_REG_BITS == 32) {
             tcg_out_qemu_ld(s, a0, -1, a1, a2, args[3], TCG_TYPE_I32);
             break;
         }
-        /* fall through */
+        fallthrough;
     case INDEX_op_qemu_ld_a32_i32:
         tcg_out_qemu_ld(s, a0, -1, a1, -1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_a32_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_ld(s, a0, -1, a1, -1, a2, TCG_TYPE_I64);
         } else {
             tcg_out_qemu_ld(s, a0, a1, a2, -1, args[3], TCG_TYPE_I64);
         }
         break;
     case INDEX_op_qemu_ld_a64_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_ld(s, a0, -1, a1, -1, a2, TCG_TYPE_I64);
         } else {
             tcg_out_qemu_ld(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
         }
         break;
     case INDEX_op_qemu_ld_a32_i128:
     case INDEX_op_qemu_ld_a64_i128:
         tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
         tcg_out_qemu_ld(s, a0, a1, a2, -1, args[3], TCG_TYPE_I128);
         break;
 
     case INDEX_op_qemu_st_a64_i32:
     case INDEX_op_qemu_st8_a64_i32:
         if (TCG_TARGET_REG_BITS == 32) {
             tcg_out_qemu_st(s, a0, -1, a1, a2, args[3], TCG_TYPE_I32);
             break;
         }
-        /* fall through */
+        fallthrough;
     case INDEX_op_qemu_st_a32_i32:
     case INDEX_op_qemu_st8_a32_i32:
         tcg_out_qemu_st(s, a0, -1, a1, -1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_a32_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_st(s, a0, -1, a1, -1, a2, TCG_TYPE_I64);
         } else {
             tcg_out_qemu_st(s, a0, a1, a2, -1, args[3], TCG_TYPE_I64);
         }
         break;
     case INDEX_op_qemu_st_a64_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_st(s, a0, -1, a1, -1, a2, TCG_TYPE_I64);
         } else {
             tcg_out_qemu_st(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
         }
         break;
     case INDEX_op_qemu_st_a32_i128:
     case INDEX_op_qemu_st_a64_i128:
         tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
         tcg_out_qemu_st(s, a0, a1, a2, -1, args[3], TCG_TYPE_I128);
         break;
 
     OP_32_64(mulu2):
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_MUL, args[3]);
         break;
     OP_32_64(muls2):
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_IMUL, args[3]);
         break;
     OP_32_64(add2):
         if (const_args[4]) {
             tgen_arithi(s, ARITH_ADD + rexw, a0, args[4], 1);
         } else {
             tgen_arithr(s, ARITH_ADD + rexw, a0, args[4]);
         }
         if (const_args[5]) {
             tgen_arithi(s, ARITH_ADC + rexw, a1, args[5], 1);
         } else {
             tgen_arithr(s, ARITH_ADC + rexw, a1, args[5]);
         }
         break;
     OP_32_64(sub2):
         if (const_args[4]) {
             tgen_arithi(s, ARITH_SUB + rexw, a0, args[4], 1);
         } else {
             tgen_arithr(s, ARITH_SUB + rexw, a0, args[4]);
         }
         if (const_args[5]) {
             tgen_arithi(s, ARITH_SBB + rexw, a1, args[5], 1);
         } else {
             tgen_arithr(s, ARITH_SBB + rexw, a1, args[5]);
         }
         break;
 
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_brcond2_i32:
         tcg_out_brcond2(s, args, const_args, 0);
         break;
     case INDEX_op_setcond2_i32:
         tcg_out_setcond2(s, args, const_args);
         break;
 #else /* TCG_TARGET_REG_BITS == 64 */
     case INDEX_op_ld32s_i64:
         tcg_out_modrm_offset(s, OPC_MOVSLQ, a0, a1, a2);
         break;
     case INDEX_op_ld_i64:
         tcg_out_ld(s, TCG_TYPE_I64, a0, a1, a2);
         break;
     case INDEX_op_st_i64:
         if (const_args[0]) {
             tcg_out_modrm_offset(s, OPC_MOVL_EvIz | P_REXW, 0, a1, a2);
             tcg_out32(s, a0);
         } else {
             tcg_out_st(s, TCG_TYPE_I64, a0, a1, a2);
         }
         break;
 
     case INDEX_op_bswap64_i64:
         tcg_out_bswap64(s, a0);
         break;
     case INDEX_op_extrh_i64_i32:
         tcg_out_shifti(s, SHIFT_SHR + P_REXW, a0, 32);
         break;
 #endif
 
     OP_32_64(deposit):
         if (args[3] == 0 && args[4] == 8) {
             /* load bits 0..7 */
             if (const_a2) {
                 tcg_out_opc(s, OPC_MOVB_Ib | P_REXB_RM | LOWREGMASK(a0),
                             0, a0, 0);
                 tcg_out8(s, a2);
             } else {
                 tcg_out_modrm(s, OPC_MOVB_EvGv | P_REXB_R | P_REXB_RM, a2, a0);
             }
         } else if (TCG_TARGET_REG_BITS == 32 && args[3] == 8 && args[4] == 8) {
             /* load bits 8..15 */
             if (const_a2) {
                 tcg_out8(s, OPC_MOVB_Ib + a0 + 4);
                 tcg_out8(s, a2);
             } else {
                 tcg_out_modrm(s, OPC_MOVB_EvGv, a2, a0 + 4);
             }
         } else if (args[3] == 0 && args[4] == 16) {
             /* load bits 0..15 */
             if (const_a2) {
                 tcg_out_opc(s, OPC_MOVL_Iv | P_DATA16 | LOWREGMASK(a0),
                             0, a0, 0);
                 tcg_out16(s, a2);
             } else {
                 tcg_out_modrm(s, OPC_MOVL_EvGv | P_DATA16, a2, a0);
             }
         } else {
             g_assert_not_reached();
         }
         break;
 
     case INDEX_op_extract_i64:
         if (a2 + args[3] == 32) {
             /* This is a 32-bit zero-extending right shift.  */
             tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
             tcg_out_shifti(s, SHIFT_SHR, a0, a2);
             break;
         }
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_extract_i32:
         /* On the off-chance that we can use the high-byte registers.
            Otherwise we emit the same ext16 + shift pattern that we
            would have gotten from the normal tcg-op.c expansion.  */
         tcg_debug_assert(a2 == 8 && args[3] == 8);
         if (a1 < 4 && a0 < 8) {
             tcg_out_modrm(s, OPC_MOVZBL, a0, a1 + 4);
         } else {
             tcg_out_ext16u(s, a0, a1);
             tcg_out_shifti(s, SHIFT_SHR, a0, 8);
         }
         break;
 
     case INDEX_op_sextract_i32:
         /* We don't implement sextract_i64, as we cannot sign-extend to
            64-bits without using the REX prefix that explicitly excludes
            access to the high-byte registers.  */
         tcg_debug_assert(a2 == 8 && args[3] == 8);
         if (a1 < 4 && a0 < 8) {
             tcg_out_modrm(s, OPC_MOVSBL, a0, a1 + 4);
         } else {
             tcg_out_ext16s(s, TCG_TYPE_I32, a0, a1);
             tcg_out_shifti(s, SHIFT_SAR, a0, 8);
         }
         break;
 
     OP_32_64(extract2):
         /* Note that SHRD outputs to the r/m operand.  */
         tcg_out_modrm(s, OPC_SHRD_Ib + rexw, a2, a0);
         tcg_out8(s, args[3]);
         break;
 
     case INDEX_op_mb:
         tcg_out_mb(s, a0);
         break;
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
     case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
 
 #undef OP_32_64
 }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 801302d85d..728384ce51 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -992,35 +992,35 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 static void tcg_out_qemu_ld_indexed(TCGContext *s, MemOp opc, TCGType type,
                                     TCGReg rd, HostAddress h)
 {
     /* Byte swapping is left to middle-end expansion.  */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SSIZE) {
     case MO_UB:
         tcg_out_opc_ldx_bu(s, rd, h.base, h.index);
         break;
     case MO_SB:
         tcg_out_opc_ldx_b(s, rd, h.base, h.index);
         break;
     case MO_UW:
         tcg_out_opc_ldx_hu(s, rd, h.base, h.index);
         break;
     case MO_SW:
         tcg_out_opc_ldx_h(s, rd, h.base, h.index);
         break;
     case MO_UL:
         if (type == TCG_TYPE_I64) {
             tcg_out_opc_ldx_wu(s, rd, h.base, h.index);
             break;
         }
-        /* fallthrough */
+        fallthrough;
     case MO_SL:
         tcg_out_opc_ldx_w(s, rd, h.base, h.index);
         break;
     case MO_UQ:
         tcg_out_opc_ldx_d(s, rd, h.base, h.index);
         break;
     default:
         g_assert_not_reached();
     }
 }
@@ -1183,409 +1183,409 @@ void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0 = args[0];
     TCGArg a1 = args[1];
     TCGArg a2 = args[2];
     TCGArg a3 = args[3];
     int c2 = const_args[2];
 
     switch (opc) {
     case INDEX_op_mb:
         tcg_out_mb(s, a0);
         break;
 
     case INDEX_op_goto_ptr:
         tcg_out_opc_jirl(s, TCG_REG_ZERO, a0, 0);
         break;
 
     case INDEX_op_br:
         tcg_out_reloc(s, s->code_ptr, R_LOONGARCH_BR_SD10K16, arg_label(a0),
                       0);
         tcg_out_opc_b(s, 0);
         break;
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
         tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
         break;
 
     case INDEX_op_extrh_i64_i32:
         tcg_out_opc_srai_d(s, a0, a1, 32);
         break;
 
     case INDEX_op_not_i32:
     case INDEX_op_not_i64:
         tcg_out_opc_nor(s, a0, a1, TCG_REG_ZERO);
         break;
 
     case INDEX_op_nor_i32:
     case INDEX_op_nor_i64:
         if (c2) {
             tcg_out_opc_ori(s, a0, a1, a2);
             tcg_out_opc_nor(s, a0, a0, TCG_REG_ZERO);
         } else {
             tcg_out_opc_nor(s, a0, a1, a2);
         }
         break;
 
     case INDEX_op_andc_i32:
     case INDEX_op_andc_i64:
         if (c2) {
             /* guaranteed to fit due to constraint */
             tcg_out_opc_andi(s, a0, a1, ~a2);
         } else {
             tcg_out_opc_andn(s, a0, a1, a2);
         }
         break;
 
     case INDEX_op_orc_i32:
     case INDEX_op_orc_i64:
         if (c2) {
             /* guaranteed to fit due to constraint */
             tcg_out_opc_ori(s, a0, a1, ~a2);
         } else {
             tcg_out_opc_orn(s, a0, a1, a2);
         }
         break;
 
     case INDEX_op_and_i32:
     case INDEX_op_and_i64:
         if (c2) {
             tcg_out_opc_andi(s, a0, a1, a2);
         } else {
             tcg_out_opc_and(s, a0, a1, a2);
         }
         break;
 
     case INDEX_op_or_i32:
     case INDEX_op_or_i64:
         if (c2) {
             tcg_out_opc_ori(s, a0, a1, a2);
         } else {
             tcg_out_opc_or(s, a0, a1, a2);
         }
         break;
 
     case INDEX_op_xor_i32:
     case INDEX_op_xor_i64:
         if (c2) {
             tcg_out_opc_xori(s, a0, a1, a2);
         } else {
             tcg_out_opc_xor(s, a0, a1, a2);
         }
         break;
 
     case INDEX_op_extract_i32:
         tcg_out_opc_bstrpick_w(s, a0, a1, a2, a2 + args[3] - 1);
         break;
     case INDEX_op_extract_i64:
         tcg_out_opc_bstrpick_d(s, a0, a1, a2, a2 + args[3] - 1);
         break;
 
     case INDEX_op_deposit_i32:
         tcg_out_opc_bstrins_w(s, a0, a2, args[3], args[3] + args[4] - 1);
         break;
     case INDEX_op_deposit_i64:
         tcg_out_opc_bstrins_d(s, a0, a2, args[3], args[3] + args[4] - 1);
         break;
 
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
         tcg_out_opc_revb_2h(s, a0, a1);
         if (a2 & TCG_BSWAP_OS) {
             tcg_out_ext16s(s, TCG_TYPE_REG, a0, a0);
         } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
             tcg_out_ext16u(s, a0, a0);
         }
         break;
 
     case INDEX_op_bswap32_i32:
         /* All 32-bit values are computed sign-extended in the register.  */
         a2 = TCG_BSWAP_OS;
-        /* fallthrough */
+        fallthrough;
     case INDEX_op_bswap32_i64:
         tcg_out_opc_revb_2w(s, a0, a1);
         if (a2 & TCG_BSWAP_OS) {
             tcg_out_ext32s(s, a0, a0);
         } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
             tcg_out_ext32u(s, a0, a0);
         }
         break;
 
     case INDEX_op_bswap64_i64:
         tcg_out_opc_revb_d(s, a0, a1);
         break;
 
     case INDEX_op_clz_i32:
         tcg_out_clzctz(s, OPC_CLZ_W, a0, a1, a2, c2, true);
         break;
     case INDEX_op_clz_i64:
         tcg_out_clzctz(s, OPC_CLZ_D, a0, a1, a2, c2, false);
         break;
 
     case INDEX_op_ctz_i32:
         tcg_out_clzctz(s, OPC_CTZ_W, a0, a1, a2, c2, true);
         break;
     case INDEX_op_ctz_i64:
         tcg_out_clzctz(s, OPC_CTZ_D, a0, a1, a2, c2, false);
         break;
 
     case INDEX_op_shl_i32:
         if (c2) {
             tcg_out_opc_slli_w(s, a0, a1, a2 & 0x1f);
         } else {
             tcg_out_opc_sll_w(s, a0, a1, a2);
         }
         break;
     case INDEX_op_shl_i64:
         if (c2) {
             tcg_out_opc_slli_d(s, a0, a1, a2 & 0x3f);
         } else {
             tcg_out_opc_sll_d(s, a0, a1, a2);
         }
         break;
 
     case INDEX_op_shr_i32:
         if (c2) {
             tcg_out_opc_srli_w(s, a0, a1, a2 & 0x1f);
         } else {
             tcg_out_opc_srl_w(s, a0, a1, a2);
         }
         break;
     case INDEX_op_shr_i64:
         if (c2) {
             tcg_out_opc_srli_d(s, a0, a1, a2 & 0x3f);
         } else {
             tcg_out_opc_srl_d(s, a0, a1, a2);
         }
         break;
 
     case INDEX_op_sar_i32:
         if (c2) {
             tcg_out_opc_srai_w(s, a0, a1, a2 & 0x1f);
         } else {
             tcg_out_opc_sra_w(s, a0, a1, a2);
         }
         break;
     case INDEX_op_sar_i64:
         if (c2) {
             tcg_out_opc_srai_d(s, a0, a1, a2 & 0x3f);
         } else {
             tcg_out_opc_sra_d(s, a0, a1, a2);
         }
         break;
 
     case INDEX_op_rotl_i32:
         /* transform into equivalent rotr/rotri */
         if (c2) {
             tcg_out_opc_rotri_w(s, a0, a1, (32 - a2) & 0x1f);
         } else {
             tcg_out_opc_sub_w(s, TCG_REG_TMP0, TCG_REG_ZERO, a2);
             tcg_out_opc_rotr_w(s, a0, a1, TCG_REG_TMP0);
         }
         break;
     case INDEX_op_rotl_i64:
         /* transform into equivalent rotr/rotri */
         if (c2) {
             tcg_out_opc_rotri_d(s, a0, a1, (64 - a2) & 0x3f);
         } else {
             tcg_out_opc_sub_w(s, TCG_REG_TMP0, TCG_REG_ZERO, a2);
             tcg_out_opc_rotr_d(s, a0, a1, TCG_REG_TMP0);
         }
         break;
 
     case INDEX_op_rotr_i32:
         if (c2) {
             tcg_out_opc_rotri_w(s, a0, a1, a2 & 0x1f);
         } else {
             tcg_out_opc_rotr_w(s, a0, a1, a2);
         }
         break;
     case INDEX_op_rotr_i64:
         if (c2) {
             tcg_out_opc_rotri_d(s, a0, a1, a2 & 0x3f);
         } else {
             tcg_out_opc_rotr_d(s, a0, a1, a2);
         }
         break;
 
     case INDEX_op_add_i32:
         if (c2) {
             tcg_out_addi(s, TCG_TYPE_I32, a0, a1, a2);
         } else {
             tcg_out_opc_add_w(s, a0, a1, a2);
         }
         break;
     case INDEX_op_add_i64:
         if (c2) {
             tcg_out_addi(s, TCG_TYPE_I64, a0, a1, a2);
         } else {
             tcg_out_opc_add_d(s, a0, a1, a2);
         }
         break;
 
     case INDEX_op_sub_i32:
         if (c2) {
             tcg_out_addi(s, TCG_TYPE_I32, a0, a1, -a2);
         } else {
             tcg_out_opc_sub_w(s, a0, a1, a2);
         }
         break;
     case INDEX_op_sub_i64:
         if (c2) {
             tcg_out_addi(s, TCG_TYPE_I64, a0, a1, -a2);
         } else {
             tcg_out_opc_sub_d(s, a0, a1, a2);
         }
         break;
 
     case INDEX_op_mul_i32:
         tcg_out_opc_mul_w(s, a0, a1, a2);
         break;
     case INDEX_op_mul_i64:
         tcg_out_opc_mul_d(s, a0, a1, a2);
         break;
 
     case INDEX_op_mulsh_i32:
         tcg_out_opc_mulh_w(s, a0, a1, a2);
         break;
     case INDEX_op_mulsh_i64:
         tcg_out_opc_mulh_d(s, a0, a1, a2);
         break;
 
     case INDEX_op_muluh_i32:
         tcg_out_opc_mulh_wu(s, a0, a1, a2);
         break;
     case INDEX_op_muluh_i64:
         tcg_out_opc_mulh_du(s, a0, a1, a2);
         break;
 
     case INDEX_op_div_i32:
         tcg_out_opc_div_w(s, a0, a1, a2);
         break;
     case INDEX_op_div_i64:
         tcg_out_opc_div_d(s, a0, a1, a2);
         break;
 
     case INDEX_op_divu_i32:
         tcg_out_opc_div_wu(s, a0, a1, a2);
         break;
     case INDEX_op_divu_i64:
         tcg_out_opc_div_du(s, a0, a1, a2);
         break;
 
     case INDEX_op_rem_i32:
         tcg_out_opc_mod_w(s, a0, a1, a2);
         break;
     case INDEX_op_rem_i64:
         tcg_out_opc_mod_d(s, a0, a1, a2);
         break;
 
     case INDEX_op_remu_i32:
         tcg_out_opc_mod_wu(s, a0, a1, a2);
         break;
     case INDEX_op_remu_i64:
         tcg_out_opc_mod_du(s, a0, a1, a2);
         break;
 
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
         tcg_out_setcond(s, args[3], a0, a1, a2, c2);
         break;
 
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
         tcg_out_movcond(s, args[5], a0, a1, a2, c2, args[3], args[4]);
         break;
 
     case INDEX_op_ld8s_i32:
     case INDEX_op_ld8s_i64:
         tcg_out_ldst(s, OPC_LD_B, a0, a1, a2);
         break;
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8u_i64:
         tcg_out_ldst(s, OPC_LD_BU, a0, a1, a2);
         break;
     case INDEX_op_ld16s_i32:
     case INDEX_op_ld16s_i64:
         tcg_out_ldst(s, OPC_LD_H, a0, a1, a2);
         break;
     case INDEX_op_ld16u_i32:
     case INDEX_op_ld16u_i64:
         tcg_out_ldst(s, OPC_LD_HU, a0, a1, a2);
         break;
     case INDEX_op_ld_i32:
     case INDEX_op_ld32s_i64:
         tcg_out_ldst(s, OPC_LD_W, a0, a1, a2);
         break;
     case INDEX_op_ld32u_i64:
         tcg_out_ldst(s, OPC_LD_WU, a0, a1, a2);
         break;
     case INDEX_op_ld_i64:
         tcg_out_ldst(s, OPC_LD_D, a0, a1, a2);
         break;
 
     case INDEX_op_st8_i32:
     case INDEX_op_st8_i64:
         tcg_out_ldst(s, OPC_ST_B, a0, a1, a2);
         break;
     case INDEX_op_st16_i32:
     case INDEX_op_st16_i64:
         tcg_out_ldst(s, OPC_ST_H, a0, a1, a2);
         break;
     case INDEX_op_st_i32:
     case INDEX_op_st32_i64:
         tcg_out_ldst(s, OPC_ST_W, a0, a1, a2);
         break;
     case INDEX_op_st_i64:
         tcg_out_ldst(s, OPC_ST_D, a0, a1, a2);
         break;
 
     case INDEX_op_qemu_ld_a32_i32:
     case INDEX_op_qemu_ld_a64_i32:
         tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_a32_i64:
     case INDEX_op_qemu_ld_a64_i64:
         tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_ld_a32_i128:
     case INDEX_op_qemu_ld_a64_i128:
         tcg_out_qemu_ldst_i128(s, a0, a1, a2, a3, true);
         break;
     case INDEX_op_qemu_st_a32_i32:
     case INDEX_op_qemu_st_a64_i32:
         tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_a32_i64:
     case INDEX_op_qemu_st_a64_i64:
         tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_a32_i128:
     case INDEX_op_qemu_st_a64_i128:
         tcg_out_qemu_ldst_i128(s, a0, a1, a2, a3, false);
         break;
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
     case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
 }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index e2892edc6a..0effa5320a 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -891,51 +891,52 @@ static const uint8_t mips_cmp_map[16] = {
 static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
                             TCGReg arg1, TCGReg arg2)
 {
     MIPSInsn s_opc = OPC_SLTU;
     int cmp_map;
 
     switch (cond) {
     case TCG_COND_EQ:
         if (arg2 != 0) {
             tcg_out_opc_reg(s, OPC_XOR, ret, arg1, arg2);
             arg1 = ret;
         }
         tcg_out_opc_imm(s, OPC_SLTIU, ret, arg1, 1);
         break;
 
     case TCG_COND_NE:
         if (arg2 != 0) {
             tcg_out_opc_reg(s, OPC_XOR, ret, arg1, arg2);
             arg1 = ret;
         }
         tcg_out_opc_reg(s, OPC_SLTU, ret, TCG_REG_ZERO, arg1);
         break;
 
     case TCG_COND_LT:
     case TCG_COND_GE:
     case TCG_COND_LE:
     case TCG_COND_GT:
         s_opc = OPC_SLT;
         /* FALLTHRU */
+        fallthrough;
 
     case TCG_COND_LTU:
     case TCG_COND_GEU:
     case TCG_COND_LEU:
     case TCG_COND_GTU:
         cmp_map = mips_cmp_map[cond];
         if (cmp_map & MIPS_CMP_SWAP) {
             TCGReg t = arg1;
             arg1 = arg2;
             arg2 = t;
         }
         tcg_out_opc_reg(s, s_opc, ret, arg1, arg2);
         if (cmp_map & MIPS_CMP_INV) {
             tcg_out_opc_imm(s, OPC_XORI, ret, ret, 1);
         }
         break;
 
      default:
          g_assert_not_reached();
          break;
      }
 }
@@ -943,60 +944,61 @@ static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
 static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
                            TCGReg arg2, TCGLabel *l)
 {
     static const MIPSInsn b_zero[16] = {
         [TCG_COND_LT] = OPC_BLTZ,
         [TCG_COND_GT] = OPC_BGTZ,
         [TCG_COND_LE] = OPC_BLEZ,
         [TCG_COND_GE] = OPC_BGEZ,
     };
 
     MIPSInsn s_opc = OPC_SLTU;
     MIPSInsn b_opc;
     int cmp_map;
 
     switch (cond) {
     case TCG_COND_EQ:
         b_opc = OPC_BEQ;
         break;
     case TCG_COND_NE:
         b_opc = OPC_BNE;
         break;
 
     case TCG_COND_LT:
     case TCG_COND_GT:
     case TCG_COND_LE:
     case TCG_COND_GE:
         if (arg2 == 0) {
             b_opc = b_zero[cond];
             arg2 = arg1;
             arg1 = 0;
             break;
         }
         s_opc = OPC_SLT;
         /* FALLTHRU */
+        fallthrough;
 
     case TCG_COND_LTU:
     case TCG_COND_GTU:
     case TCG_COND_LEU:
     case TCG_COND_GEU:
         cmp_map = mips_cmp_map[cond];
         if (cmp_map & MIPS_CMP_SWAP) {
             TCGReg t = arg1;
             arg1 = arg2;
             arg2 = t;
         }
         tcg_out_opc_reg(s, s_opc, TCG_TMP0, arg1, arg2);
         b_opc = (cmp_map & MIPS_CMP_INV ? OPC_BEQ : OPC_BNE);
         arg1 = TCG_TMP0;
         arg2 = TCG_REG_ZERO;
         break;
 
     default:
         g_assert_not_reached();
         break;
     }
 
     tcg_out_opc_br(s, b_opc, arg1, arg2);
     tcg_out_reloc(s, s->code_ptr - 1, R_MIPS_PC16, l, 0);
     tcg_out_nop(s);
 }
@@ -1096,54 +1098,55 @@ static void tcg_out_brcond2(TCGContext *s, TCGCond cond, TCGReg al, TCGReg ah,
 static void tcg_out_movcond(TCGContext *s, TCGCond cond, TCGReg ret,
                             TCGReg c1, TCGReg c2, TCGReg v1, TCGReg v2)
 {
     bool eqz = false;
 
     /* If one of the values is zero, put it last to match SEL*Z instructions */
     if (use_mips32r6_instructions && v1 == 0) {
         v1 = v2;
         v2 = 0;
         cond = tcg_invert_cond(cond);
     }
 
     switch (cond) {
     case TCG_COND_EQ:
         eqz = true;
         /* FALLTHRU */
+        fallthrough;
     case TCG_COND_NE:
         if (c2 != 0) {
             tcg_out_opc_reg(s, OPC_XOR, TCG_TMP0, c1, c2);
             c1 = TCG_TMP0;
         }
         break;
 
     default:
         /* Minimize code size by preferring a compare not requiring INV.  */
         if (mips_cmp_map[cond] & MIPS_CMP_INV) {
             cond = tcg_invert_cond(cond);
             eqz = true;
         }
         tcg_out_setcond(s, cond, TCG_TMP0, c1, c2);
         c1 = TCG_TMP0;
         break;
     }
 
     if (use_mips32r6_instructions) {
         MIPSInsn m_opc_t = eqz ? OPC_SELEQZ : OPC_SELNEZ;
         MIPSInsn m_opc_f = eqz ? OPC_SELNEZ : OPC_SELEQZ;
 
         if (v2 != 0) {
             tcg_out_opc_reg(s, m_opc_f, TCG_TMP1, v2, c1);
         }
         tcg_out_opc_reg(s, m_opc_t, ret, v1, c1);
         if (v2 != 0) {
             tcg_out_opc_reg(s, OPC_OR, ret, ret, TCG_TMP1);
         }
     } else {
         MIPSInsn m_opc = eqz ? OPC_MOVZ : OPC_MOVN;
 
         tcg_out_opc_reg(s, m_opc, ret, v1, c1);
 
         /* This should be guaranteed via constraints */
         tcg_debug_assert(v2 == ret);
     }
 }
@@ -1411,41 +1414,42 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
                                    TCGReg base, MemOp opc, TCGType type)
 {
     switch (opc & MO_SSIZE) {
     case MO_UB:
         tcg_out_opc_imm(s, OPC_LBU, lo, base, 0);
         break;
     case MO_SB:
         tcg_out_opc_imm(s, OPC_LB, lo, base, 0);
         break;
     case MO_UW:
         tcg_out_opc_imm(s, OPC_LHU, lo, base, 0);
         break;
     case MO_SW:
         tcg_out_opc_imm(s, OPC_LH, lo, base, 0);
         break;
     case MO_UL:
         if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64) {
             tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
             break;
         }
         /* FALLTHRU */
+        fallthrough;
     case MO_SL:
         tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
         break;
     case MO_UQ:
         /* Prefer to load from offset 0 first, but allow for overlap.  */
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_opc_imm(s, OPC_LD, lo, base, 0);
         } else if (HOST_BIG_ENDIAN ? hi != base : lo == base) {
             tcg_out_opc_imm(s, OPC_LW, hi, base, HI_OFF);
             tcg_out_opc_imm(s, OPC_LW, lo, base, LO_OFF);
         } else {
             tcg_out_opc_imm(s, OPC_LW, lo, base, LO_OFF);
             tcg_out_opc_imm(s, OPC_LW, hi, base, HI_OFF);
         }
         break;
     default:
         g_assert_not_reached();
     }
 }
@@ -1729,466 +1733,466 @@ void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
 {
     MIPSInsn i1, i2;
     TCGArg a0, a1, a2;
     int c2;
 
     /*
      * Note that many operands use the constraint set "rZ".
      * We make use of the fact that 0 is the ZERO register,
      * and hence such cases need not check for const_args.
      */
     a0 = args[0];
     a1 = args[1];
     a2 = args[2];
     c2 = const_args[2];
 
     switch (opc) {
     case INDEX_op_goto_ptr:
         /* jmp to the given host address (could be epilogue) */
         tcg_out_opc_reg(s, OPC_JR, 0, a0, 0);
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, a0);
         } else {
             tcg_out_nop(s);
         }
         break;
     case INDEX_op_br:
         tcg_out_brcond(s, TCG_COND_EQ, TCG_REG_ZERO, TCG_REG_ZERO,
                        arg_label(a0));
         break;
 
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8u_i64:
         i1 = OPC_LBU;
         goto do_ldst;
     case INDEX_op_ld8s_i32:
     case INDEX_op_ld8s_i64:
         i1 = OPC_LB;
         goto do_ldst;
     case INDEX_op_ld16u_i32:
     case INDEX_op_ld16u_i64:
         i1 = OPC_LHU;
         goto do_ldst;
     case INDEX_op_ld16s_i32:
     case INDEX_op_ld16s_i64:
         i1 = OPC_LH;
         goto do_ldst;
     case INDEX_op_ld_i32:
     case INDEX_op_ld32s_i64:
         i1 = OPC_LW;
         goto do_ldst;
     case INDEX_op_ld32u_i64:
         i1 = OPC_LWU;
         goto do_ldst;
     case INDEX_op_ld_i64:
         i1 = OPC_LD;
         goto do_ldst;
     case INDEX_op_st8_i32:
     case INDEX_op_st8_i64:
         i1 = OPC_SB;
         goto do_ldst;
     case INDEX_op_st16_i32:
     case INDEX_op_st16_i64:
         i1 = OPC_SH;
         goto do_ldst;
     case INDEX_op_st_i32:
     case INDEX_op_st32_i64:
         i1 = OPC_SW;
         goto do_ldst;
     case INDEX_op_st_i64:
         i1 = OPC_SD;
     do_ldst:
         tcg_out_ldst(s, i1, a0, a1, a2);
         break;
 
     case INDEX_op_add_i32:
         i1 = OPC_ADDU, i2 = OPC_ADDIU;
         goto do_binary;
     case INDEX_op_add_i64:
         i1 = OPC_DADDU, i2 = OPC_DADDIU;
         goto do_binary;
     case INDEX_op_or_i32:
     case INDEX_op_or_i64:
         i1 = OPC_OR, i2 = OPC_ORI;
         goto do_binary;
     case INDEX_op_xor_i32:
     case INDEX_op_xor_i64:
         i1 = OPC_XOR, i2 = OPC_XORI;
     do_binary:
         if (c2) {
             tcg_out_opc_imm(s, i2, a0, a1, a2);
             break;
         }
     do_binaryv:
         tcg_out_opc_reg(s, i1, a0, a1, a2);
         break;
 
     case INDEX_op_sub_i32:
         i1 = OPC_SUBU, i2 = OPC_ADDIU;
         goto do_subtract;
     case INDEX_op_sub_i64:
         i1 = OPC_DSUBU, i2 = OPC_DADDIU;
     do_subtract:
         if (c2) {
             tcg_out_opc_imm(s, i2, a0, a1, -a2);
             break;
         }
         goto do_binaryv;
     case INDEX_op_and_i32:
         if (c2 && a2 != (uint16_t)a2) {
             int msb = ctz32(~a2) - 1;
             tcg_debug_assert(use_mips32r2_instructions);
             tcg_debug_assert(is_p2m1(a2));
             tcg_out_opc_bf(s, OPC_EXT, a0, a1, msb, 0);
             break;
         }
         i1 = OPC_AND, i2 = OPC_ANDI;
         goto do_binary;
     case INDEX_op_and_i64:
         if (c2 && a2 != (uint16_t)a2) {
             int msb = ctz64(~a2) - 1;
             tcg_debug_assert(use_mips32r2_instructions);
             tcg_debug_assert(is_p2m1(a2));
             tcg_out_opc_bf64(s, OPC_DEXT, OPC_DEXTM, OPC_DEXTU, a0, a1, msb, 0);
             break;
         }
         i1 = OPC_AND, i2 = OPC_ANDI;
         goto do_binary;
     case INDEX_op_nor_i32:
     case INDEX_op_nor_i64:
         i1 = OPC_NOR;
         goto do_binaryv;
 
     case INDEX_op_mul_i32:
         if (use_mips32_instructions) {
             tcg_out_opc_reg(s, OPC_MUL, a0, a1, a2);
             break;
         }
         i1 = OPC_MULT, i2 = OPC_MFLO;
         goto do_hilo1;
     case INDEX_op_mulsh_i32:
         if (use_mips32r6_instructions) {
             tcg_out_opc_reg(s, OPC_MUH, a0, a1, a2);
             break;
         }
         i1 = OPC_MULT, i2 = OPC_MFHI;
         goto do_hilo1;
     case INDEX_op_muluh_i32:
         if (use_mips32r6_instructions) {
             tcg_out_opc_reg(s, OPC_MUHU, a0, a1, a2);
             break;
         }
         i1 = OPC_MULTU, i2 = OPC_MFHI;
         goto do_hilo1;
     case INDEX_op_div_i32:
         if (use_mips32r6_instructions) {
             tcg_out_opc_reg(s, OPC_DIV_R6, a0, a1, a2);
             break;
         }
         i1 = OPC_DIV, i2 = OPC_MFLO;
         goto do_hilo1;
     case INDEX_op_divu_i32:
         if (use_mips32r6_instructions) {
             tcg_out_opc_reg(s, OPC_DIVU_R6, a0, a1, a2);
             break;
         }
         i1 = OPC_DIVU, i2 = OPC_MFLO;
         goto do_hilo1;
     case INDEX_op_rem_i32:
         if (use_mips32r6_instructions) {
             tcg_out_opc_reg(s, OPC_MOD, a0, a1, a2);
             break;
         }
         i1 = OPC_DIV, i2 = OPC_MFHI;
         goto do_hilo1;
     case INDEX_op_remu_i32:
         if (use_mips32r6_instructions) {
             tcg_out_opc_reg(s, OPC_MODU, a0, a1, a2);
             break;
         }
         i1 = OPC_DIVU, i2 = OPC_MFHI;
         goto do_hilo1;
     case INDEX_op_mul_i64:
         if (use_mips32r6_instructions) {
             tcg_out_opc_reg(s, OPC_DMUL, a0, a1, a2);
             break;
         }
         i1 = OPC_DMULT, i2 = OPC_MFLO;
         goto do_hilo1;
     case INDEX_op_mulsh_i64:
         if (use_mips32r6_instructions) {
             tcg_out_opc_reg(s, OPC_DMUH, a0, a1, a2);
             break;
         }
         i1 = OPC_DMULT, i2 = OPC_MFHI;
         goto do_hilo1;
     case INDEX_op_muluh_i64:
         if (use_mips32r6_instructions) {
             tcg_out_opc_reg(s, OPC_DMUHU, a0, a1, a2);
             break;
         }
         i1 = OPC_DMULTU, i2 = OPC_MFHI;
         goto do_hilo1;
     case INDEX_op_div_i64:
         if (use_mips32r6_instructions) {
             tcg_out_opc_reg(s, OPC_DDIV_R6, a0, a1, a2);
             break;
         }
         i1 = OPC_DDIV, i2 = OPC_MFLO;
         goto do_hilo1;
     case INDEX_op_divu_i64:
         if (use_mips32r6_instructions) {
             tcg_out_opc_reg(s, OPC_DDIVU_R6, a0, a1, a2);
             break;
         }
         i1 = OPC_DDIVU, i2 = OPC_MFLO;
         goto do_hilo1;
     case INDEX_op_rem_i64:
         if (use_mips32r6_instructions) {
             tcg_out_opc_reg(s, OPC_DMOD, a0, a1, a2);
             break;
         }
         i1 = OPC_DDIV, i2 = OPC_MFHI;
         goto do_hilo1;
     case INDEX_op_remu_i64:
         if (use_mips32r6_instructions) {
             tcg_out_opc_reg(s, OPC_DMODU, a0, a1, a2);
             break;
         }
         i1 = OPC_DDIVU, i2 = OPC_MFHI;
     do_hilo1:
         tcg_out_opc_reg(s, i1, 0, a1, a2);
         tcg_out_opc_reg(s, i2, a0, 0, 0);
         break;
 
     case INDEX_op_muls2_i32:
         i1 = OPC_MULT;
         goto do_hilo2;
     case INDEX_op_mulu2_i32:
         i1 = OPC_MULTU;
         goto do_hilo2;
     case INDEX_op_muls2_i64:
         i1 = OPC_DMULT;
         goto do_hilo2;
     case INDEX_op_mulu2_i64:
         i1 = OPC_DMULTU;
     do_hilo2:
         tcg_out_opc_reg(s, i1, 0, a2, args[3]);
         tcg_out_opc_reg(s, OPC_MFLO, a0, 0, 0);
         tcg_out_opc_reg(s, OPC_MFHI, a1, 0, 0);
         break;
 
     case INDEX_op_not_i32:
     case INDEX_op_not_i64:
         i1 = OPC_NOR;
         goto do_unary;
     do_unary:
         tcg_out_opc_reg(s, i1, a0, TCG_REG_ZERO, a1);
         break;
 
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
         tcg_out_bswap16(s, a0, a1, a2);
         break;
     case INDEX_op_bswap32_i32:
         tcg_out_bswap32(s, a0, a1, 0);
         break;
     case INDEX_op_bswap32_i64:
         tcg_out_bswap32(s, a0, a1, a2);
         break;
     case INDEX_op_bswap64_i64:
         tcg_out_bswap64(s, a0, a1);
         break;
     case INDEX_op_extrh_i64_i32:
         tcg_out_dsra(s, a0, a1, 32);
         break;
 
     case INDEX_op_sar_i32:
         i1 = OPC_SRAV, i2 = OPC_SRA;
         goto do_shift;
     case INDEX_op_shl_i32:
         i1 = OPC_SLLV, i2 = OPC_SLL;
         goto do_shift;
     case INDEX_op_shr_i32:
         i1 = OPC_SRLV, i2 = OPC_SRL;
         goto do_shift;
     case INDEX_op_rotr_i32:
         i1 = OPC_ROTRV, i2 = OPC_ROTR;
     do_shift:
         if (c2) {
             tcg_out_opc_sa(s, i2, a0, a1, a2);
             break;
         }
     do_shiftv:
         tcg_out_opc_reg(s, i1, a0, a2, a1);
         break;
     case INDEX_op_rotl_i32:
         if (c2) {
             tcg_out_opc_sa(s, OPC_ROTR, a0, a1, 32 - a2);
         } else {
             tcg_out_opc_reg(s, OPC_SUBU, TCG_TMP0, TCG_REG_ZERO, a2);
             tcg_out_opc_reg(s, OPC_ROTRV, a0, TCG_TMP0, a1);
         }
         break;
     case INDEX_op_sar_i64:
         if (c2) {
             tcg_out_dsra(s, a0, a1, a2);
             break;
         }
         i1 = OPC_DSRAV;
         goto do_shiftv;
     case INDEX_op_shl_i64:
         if (c2) {
             tcg_out_dsll(s, a0, a1, a2);
             break;
         }
         i1 = OPC_DSLLV;
         goto do_shiftv;
     case INDEX_op_shr_i64:
         if (c2) {
             tcg_out_dsrl(s, a0, a1, a2);
             break;
         }
         i1 = OPC_DSRLV;
         goto do_shiftv;
     case INDEX_op_rotr_i64:
         if (c2) {
             tcg_out_opc_sa64(s, OPC_DROTR, OPC_DROTR32, a0, a1, a2);
             break;
         }
         i1 = OPC_DROTRV;
         goto do_shiftv;
     case INDEX_op_rotl_i64:
         if (c2) {
             tcg_out_opc_sa64(s, OPC_DROTR, OPC_DROTR32, a0, a1, 64 - a2);
         } else {
             tcg_out_opc_reg(s, OPC_DSUBU, TCG_TMP0, TCG_REG_ZERO, a2);
             tcg_out_opc_reg(s, OPC_DROTRV, a0, TCG_TMP0, a1);
         }
         break;
 
     case INDEX_op_clz_i32:
         tcg_out_clz(s, OPC_CLZ, OPC_CLZ_R6, 32, a0, a1, a2);
         break;
     case INDEX_op_clz_i64:
         tcg_out_clz(s, OPC_DCLZ, OPC_DCLZ_R6, 64, a0, a1, a2);
         break;
 
     case INDEX_op_deposit_i32:
         tcg_out_opc_bf(s, OPC_INS, a0, a2, args[3] + args[4] - 1, args[3]);
         break;
     case INDEX_op_deposit_i64:
         tcg_out_opc_bf64(s, OPC_DINS, OPC_DINSM, OPC_DINSU, a0, a2,
                          args[3] + args[4] - 1, args[3]);
         break;
     case INDEX_op_extract_i32:
         tcg_out_opc_bf(s, OPC_EXT, a0, a1, args[3] - 1, a2);
         break;
     case INDEX_op_extract_i64:
         tcg_out_opc_bf64(s, OPC_DEXT, OPC_DEXTM, OPC_DEXTU, a0, a1,
                          args[3] - 1, a2);
         break;
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
         tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
         break;
     case INDEX_op_brcond2_i32:
         tcg_out_brcond2(s, args[4], a0, a1, a2, args[3], arg_label(args[5]));
         break;
 
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
         tcg_out_movcond(s, args[5], a0, a1, a2, args[3], args[4]);
         break;
 
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
         tcg_out_setcond(s, args[3], a0, a1, a2);
         break;
     case INDEX_op_setcond2_i32:
         tcg_out_setcond2(s, args[5], a0, a1, a2, args[3], args[4]);
         break;
 
     case INDEX_op_qemu_ld_a64_i32:
         if (TCG_TARGET_REG_BITS == 32) {
             tcg_out_qemu_ld(s, a0, 0, a1, a2, args[3], TCG_TYPE_I32);
             break;
         }
-        /* fall through */
+        fallthrough;
     case INDEX_op_qemu_ld_a32_i32:
         tcg_out_qemu_ld(s, a0, 0, a1, 0, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_a32_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_ld(s, a0, 0, a1, 0, a2, TCG_TYPE_I64);
         } else {
             tcg_out_qemu_ld(s, a0, a1, a2, 0, args[3], TCG_TYPE_I64);
         }
         break;
     case INDEX_op_qemu_ld_a64_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_ld(s, a0, 0, a1, 0, a2, TCG_TYPE_I64);
         } else {
             tcg_out_qemu_ld(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
         }
         break;
 
     case INDEX_op_qemu_st_a64_i32:
         if (TCG_TARGET_REG_BITS == 32) {
             tcg_out_qemu_st(s, a0, 0, a1, a2, args[3], TCG_TYPE_I32);
             break;
         }
-        /* fall through */
+        fallthrough;
     case INDEX_op_qemu_st_a32_i32:
         tcg_out_qemu_st(s, a0, 0, a1, 0, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_a32_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_st(s, a0, 0, a1, 0, a2, TCG_TYPE_I64);
         } else {
             tcg_out_qemu_st(s, a0, a1, a2, 0, args[3], TCG_TYPE_I64);
         }
         break;
     case INDEX_op_qemu_st_a64_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_st(s, a0, 0, a1, 0, a2, TCG_TYPE_I64);
         } else {
             tcg_out_qemu_st(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
         }
         break;
 
     case INDEX_op_add2_i32:
         tcg_out_addsub2(s, a0, a1, a2, args[3], args[4], args[5],
                         const_args[4], const_args[5], false);
         break;
     case INDEX_op_sub2_i32:
         tcg_out_addsub2(s, a0, a1, a2, args[3], args[4], args[5],
                         const_args[4], const_args[5], true);
         break;
 
     case INDEX_op_mb:
         tcg_out_mb(s, a0);
         break;
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
     case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
 }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 5c873b2161..a438a02045 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -718,43 +718,45 @@ static void tcg_out_mem_long(TCGContext *s, int opi, int opx, TCGReg rt,
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
     if (ret == arg) {
         return true;
     }
     switch (type) {
     case TCG_TYPE_I64:
         tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
         /* fallthru */
+        fallthrough;
     case TCG_TYPE_I32:
         if (ret < TCG_REG_V0) {
             if (arg < TCG_REG_V0) {
                 tcg_out32(s, OR | SAB(arg, ret, arg));
                 break;
             } else if (have_isa_2_07) {
                 tcg_out32(s, (type == TCG_TYPE_I32 ? MFVSRWZ : MFVSRD)
                           | VRT(arg) | RA(ret));
                 break;
             } else {
                 /* Altivec does not support vector->integer moves.  */
                 return false;
             }
         } else if (arg < TCG_REG_V0) {
             if (have_isa_2_07) {
                 tcg_out32(s, (type == TCG_TYPE_I32 ? MTVSRWZ : MTVSRD)
                           | VRT(ret) | RA(arg));
                 break;
             } else {
                 /* Altivec does not support integer->vector moves.  */
                 return false;
             }
         }
         /* fallthru */
+        fallthrough;
     case TCG_TYPE_V64:
     case TCG_TYPE_V128:
         tcg_debug_assert(ret >= TCG_REG_V0 && arg >= TCG_REG_V0);
         tcg_out32(s, VOR | VRT(ret) | VRA(arg) | VRB(arg));
         break;
     default:
         g_assert_not_reached();
     }
     return true;
 }
@@ -1292,64 +1294,66 @@ static void tcg_out_b(TCGContext *s, int mask, const tcg_insn_unit *target)
 static void tcg_out_mem_long(TCGContext *s, int opi, int opx, TCGReg rt,
                              TCGReg base, tcg_target_long offset)
 {
     tcg_target_long orig = offset, l0, l1, extra = 0, align = 0;
     bool is_int_store = false;
     TCGReg rs = TCG_REG_TMP1;
 
     switch (opi) {
     case LD: case LWA:
         align = 3;
         /* FALLTHRU */
+        fallthrough;
     default:
         if (rt > TCG_REG_R0 && rt < TCG_REG_V0) {
             rs = rt;
             break;
         }
         break;
     case LXSD:
     case STXSD:
         align = 3;
         break;
     case LXV:
     case STXV:
         align = 15;
         break;
     case STD:
         align = 3;
         /* FALLTHRU */
+        fallthrough;
     case STB: case STH: case STW:
         is_int_store = true;
         break;
     }
 
     /* For unaligned, or very large offsets, use the indexed form.  */
     if (offset & align || offset != (int32_t)offset || opi == 0) {
         if (rs == base) {
             rs = TCG_REG_R0;
         }
         tcg_debug_assert(!is_int_store || rs != rt);
         tcg_out_movi(s, TCG_TYPE_PTR, rs, orig);
         tcg_out32(s, opx | TAB(rt & 31, base, rs));
         return;
     }
 
     l0 = (int16_t)offset;
     offset = (offset - l0) >> 16;
     l1 = (int16_t)offset;
 
     if (l1 < 0 && orig >= 0) {
         extra = 0x4000;
         l1 = (int16_t)(offset - 0x4000);
     }
     if (l1) {
         tcg_out32(s, ADDIS | TAI(rs, base, l1));
         base = rs;
     }
     if (extra) {
         tcg_out32(s, ADDIS | TAI(rs, base, extra));
         base = rs;
     }
     if (opi != ADDI || base != rt || l0 != 0) {
         tcg_out32(s, opi | TAI(rt & 31, base, l0));
     }
 }
@@ -1363,52 +1367,53 @@ static void tcg_out_vsldoi(TCGContext *s, TCGReg ret,
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret,
                        TCGReg base, intptr_t offset)
 {
     int shift;
 
     switch (type) {
     case TCG_TYPE_I32:
         if (ret < TCG_REG_V0) {
             tcg_out_mem_long(s, LWZ, LWZX, ret, base, offset);
             break;
         }
         if (have_isa_2_07 && have_vsx) {
             tcg_out_mem_long(s, 0, LXSIWZX, ret, base, offset);
             break;
         }
         tcg_debug_assert((offset & 3) == 0);
         tcg_out_mem_long(s, 0, LVEWX, ret, base, offset);
         shift = (offset - 4) & 0xc;
         if (shift) {
             tcg_out_vsldoi(s, ret, ret, ret, shift);
         }
         break;
     case TCG_TYPE_I64:
         if (ret < TCG_REG_V0) {
             tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
             tcg_out_mem_long(s, LD, LDX, ret, base, offset);
             break;
         }
         /* fallthru */
+        fallthrough;
     case TCG_TYPE_V64:
         tcg_debug_assert(ret >= TCG_REG_V0);
         if (have_vsx) {
             tcg_out_mem_long(s, have_isa_3_00 ? LXSD : 0, LXSDX,
                              ret, base, offset);
             break;
         }
         tcg_debug_assert((offset & 7) == 0);
         tcg_out_mem_long(s, 0, LVX, ret, base, offset & -16);
         if (offset & 8) {
             tcg_out_vsldoi(s, ret, ret, ret, 8);
         }
         break;
     case TCG_TYPE_V128:
         tcg_debug_assert(ret >= TCG_REG_V0);
         tcg_debug_assert((offset & 15) == 0);
         tcg_out_mem_long(s, have_isa_3_00 ? LXV : 0,
                          LVX, ret, base, offset);
         break;
     default:
         g_assert_not_reached();
     }
 }
@@ -1416,55 +1421,56 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret,
 static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
                               TCGReg base, intptr_t offset)
 {
     int shift;
 
     switch (type) {
     case TCG_TYPE_I32:
         if (arg < TCG_REG_V0) {
             tcg_out_mem_long(s, STW, STWX, arg, base, offset);
             break;
         }
         if (have_isa_2_07 && have_vsx) {
             tcg_out_mem_long(s, 0, STXSIWX, arg, base, offset);
             break;
         }
         assert((offset & 3) == 0);
         tcg_debug_assert((offset & 3) == 0);
         shift = (offset - 4) & 0xc;
         if (shift) {
             tcg_out_vsldoi(s, TCG_VEC_TMP1, arg, arg, shift);
             arg = TCG_VEC_TMP1;
         }
         tcg_out_mem_long(s, 0, STVEWX, arg, base, offset);
         break;
     case TCG_TYPE_I64:
         if (arg < TCG_REG_V0) {
             tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
             tcg_out_mem_long(s, STD, STDX, arg, base, offset);
             break;
         }
         /* fallthru */
+        fallthrough;
     case TCG_TYPE_V64:
         tcg_debug_assert(arg >= TCG_REG_V0);
         if (have_vsx) {
             tcg_out_mem_long(s, have_isa_3_00 ? STXSD : 0,
                              STXSDX, arg, base, offset);
             break;
         }
         tcg_debug_assert((offset & 7) == 0);
         if (offset & 8) {
             tcg_out_vsldoi(s, TCG_VEC_TMP1, arg, arg, 8);
             arg = TCG_VEC_TMP1;
         }
         tcg_out_mem_long(s, 0, STVEWX, arg, base, offset);
         tcg_out_mem_long(s, 0, STVEWX, arg, base, offset + 4);
         break;
     case TCG_TYPE_V128:
         tcg_debug_assert(arg >= TCG_REG_V0);
         tcg_out_mem_long(s, have_isa_3_00 ? STXV : 0,
                          STVX, arg, base, offset);
         break;
     default:
         g_assert_not_reached();
     }
 }
@@ -1618,136 +1624,137 @@ static TCGReg tcg_gen_setcond_xor(TCGContext *s, TCGReg arg1, TCGArg arg2,
 static void tcg_out_setcond(TCGContext *s, TCGType type, TCGCond cond,
                             TCGArg arg0, TCGArg arg1, TCGArg arg2,
                             int const_arg2, bool neg)
 {
     int sh;
     bool inv;
 
     tcg_debug_assert(TCG_TARGET_REG_BITS == 64 || type == TCG_TYPE_I32);
 
     /* Ignore high bits of a potential constant arg2.  */
     if (type == TCG_TYPE_I32) {
         arg2 = (uint32_t)arg2;
     }
 
     /* With SETBC/SETBCR, we can always implement with 2 insns. */
     if (have_isa_3_10) {
         tcg_insn_unit bi, opc;
 
         tcg_out_cmp(s, cond, arg1, arg2, const_arg2, 7, type);
 
         /* Re-use tcg_to_bc for BI and BO_COND_{TRUE,FALSE}. */
         bi = tcg_to_bc[cond] & (0x1f << 16);
         if (tcg_to_bc[cond] & BO(8)) {
             opc = neg ? SETNBC : SETBC;
         } else {
             opc = neg ? SETNBCR : SETBCR;
         }
         tcg_out32(s, opc | RT(arg0) | bi);
         return;
     }
 
     /* Handle common and trivial cases before handling anything else.  */
     if (arg2 == 0) {
         switch (cond) {
         case TCG_COND_EQ:
             tcg_out_setcond_eq0(s, type, arg0, arg1, neg);
             return;
         case TCG_COND_NE:
             tcg_out_setcond_ne0(s, type, arg0, arg1, neg);
             return;
         case TCG_COND_GE:
             tcg_out32(s, NOR | SAB(arg1, arg0, arg1));
             arg1 = arg0;
             /* FALLTHRU */
+            fallthrough;
         case TCG_COND_LT:
             /* Extract the sign bit.  */
             if (type == TCG_TYPE_I32) {
                 if (neg) {
                     tcg_out_sari32(s, arg0, arg1, 31);
                 } else {
                     tcg_out_shri32(s, arg0, arg1, 31);
                 }
             } else {
                 if (neg) {
                     tcg_out_sari64(s, arg0, arg1, 63);
                 } else {
                     tcg_out_shri64(s, arg0, arg1, 63);
                 }
             }
             return;
         default:
             break;
         }
     }
 
     /* If we have ISEL, we can implement everything with 3 or 4 insns.
        All other cases below are also at least 3 insns, so speed up the
        code generator by not considering them and always using ISEL.  */
     if (have_isel) {
         int isel, tab;
 
         tcg_out_cmp(s, cond, arg1, arg2, const_arg2, 7, type);
 
         isel = tcg_to_isel[cond];
 
         tcg_out_movi(s, type, arg0, neg ? -1 : 1);
         if (isel & 1) {
             /* arg0 = (bc ? 0 : 1) */
             tab = TAB(arg0, 0, arg0);
             isel &= ~1;
         } else {
             /* arg0 = (bc ? 1 : 0) */
             tcg_out_movi(s, type, TCG_REG_R0, 0);
             tab = TAB(arg0, arg0, TCG_REG_R0);
         }
         tcg_out32(s, isel | tab);
         return;
     }
 
     inv = false;
     switch (cond) {
     case TCG_COND_EQ:
         arg1 = tcg_gen_setcond_xor(s, arg1, arg2, const_arg2);
         tcg_out_setcond_eq0(s, type, arg0, arg1, neg);
         break;
 
     case TCG_COND_NE:
         arg1 = tcg_gen_setcond_xor(s, arg1, arg2, const_arg2);
         tcg_out_setcond_ne0(s, type, arg0, arg1, neg);
         break;
 
     case TCG_COND_LE:
     case TCG_COND_LEU:
         inv = true;
-        /* fall through */
+        fallthrough;
     case TCG_COND_GT:
     case TCG_COND_GTU:
         sh = 30; /* CR7 CR_GT */
         goto crtest;
 
     case TCG_COND_GE:
     case TCG_COND_GEU:
         inv = true;
-        /* fall through */
+        fallthrough;
     case TCG_COND_LT:
     case TCG_COND_LTU:
         sh = 29; /* CR7 CR_LT */
         goto crtest;
 
     crtest:
         tcg_out_cmp(s, cond, arg1, arg2, const_arg2, 7, type);
         tcg_out32(s, MFOCRF | RT(TCG_REG_R0) | FXM(7));
         tcg_out_rlw(s, RLWINM, arg0, TCG_REG_R0, sh, 31, 31);
         if (neg && inv) {
             tcg_out32(s, ADDI | TAI(arg0, arg0, -1));
         } else if (neg) {
             tcg_out32(s, NEG | RT(arg0) | RA(arg0));
         } else if (inv) {
             tcg_out_xori32(s, arg0, arg0, 1);
         }
         break;
 
     default:
         g_assert_not_reached();
     }
 }
@@ -2594,599 +2601,601 @@ void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0, a1, a2;
 
     switch (opc) {
     case INDEX_op_goto_ptr:
         tcg_out32(s, MTSPR | RS(args[0]) | CTR);
         if (USE_REG_TB) {
             tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, args[0]);
         }
         tcg_out32(s, ADDI | TAI(TCG_REG_R3, 0, 0));
         tcg_out32(s, BCCTR | BO_ALWAYS);
         break;
     case INDEX_op_br:
         {
             TCGLabel *l = arg_label(args[0]);
             uint32_t insn = B;
 
             if (l->has_value) {
                 insn |= reloc_pc24_val(tcg_splitwx_to_rx(s->code_ptr),
                                        l->u.value_ptr);
             } else {
                 tcg_out_reloc(s, s->code_ptr, R_PPC_REL24, l, 0);
             }
             tcg_out32(s, insn);
         }
         break;
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8u_i64:
         tcg_out_mem_long(s, LBZ, LBZX, args[0], args[1], args[2]);
         break;
     case INDEX_op_ld8s_i32:
     case INDEX_op_ld8s_i64:
         tcg_out_mem_long(s, LBZ, LBZX, args[0], args[1], args[2]);
         tcg_out_ext8s(s, TCG_TYPE_REG, args[0], args[0]);
         break;
     case INDEX_op_ld16u_i32:
     case INDEX_op_ld16u_i64:
         tcg_out_mem_long(s, LHZ, LHZX, args[0], args[1], args[2]);
         break;
     case INDEX_op_ld16s_i32:
     case INDEX_op_ld16s_i64:
         tcg_out_mem_long(s, LHA, LHAX, args[0], args[1], args[2]);
         break;
     case INDEX_op_ld_i32:
     case INDEX_op_ld32u_i64:
         tcg_out_mem_long(s, LWZ, LWZX, args[0], args[1], args[2]);
         break;
     case INDEX_op_ld32s_i64:
         tcg_out_mem_long(s, LWA, LWAX, args[0], args[1], args[2]);
         break;
     case INDEX_op_ld_i64:
         tcg_out_mem_long(s, LD, LDX, args[0], args[1], args[2]);
         break;
     case INDEX_op_st8_i32:
     case INDEX_op_st8_i64:
         tcg_out_mem_long(s, STB, STBX, args[0], args[1], args[2]);
         break;
     case INDEX_op_st16_i32:
     case INDEX_op_st16_i64:
         tcg_out_mem_long(s, STH, STHX, args[0], args[1], args[2]);
         break;
     case INDEX_op_st_i32:
     case INDEX_op_st32_i64:
         tcg_out_mem_long(s, STW, STWX, args[0], args[1], args[2]);
         break;
     case INDEX_op_st_i64:
         tcg_out_mem_long(s, STD, STDX, args[0], args[1], args[2]);
         break;
 
     case INDEX_op_add_i32:
         a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
         do_addi_32:
             tcg_out_mem_long(s, ADDI, ADD, a0, a1, (int32_t)a2);
         } else {
             tcg_out32(s, ADD | TAB(a0, a1, a2));
         }
         break;
     case INDEX_op_sub_i32:
         a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[1]) {
             if (const_args[2]) {
                 tcg_out_movi(s, TCG_TYPE_I32, a0, a1 - a2);
             } else {
                 tcg_out32(s, SUBFIC | TAI(a0, a2, a1));
             }
         } else if (const_args[2]) {
             a2 = -a2;
             goto do_addi_32;
         } else {
             tcg_out32(s, SUBF | TAB(a0, a2, a1));
         }
         break;
 
     case INDEX_op_and_i32:
         a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_andi32(s, a0, a1, a2);
         } else {
             tcg_out32(s, AND | SAB(a1, a0, a2));
         }
         break;
     case INDEX_op_and_i64:
         a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_andi64(s, a0, a1, a2);
         } else {
             tcg_out32(s, AND | SAB(a1, a0, a2));
         }
         break;
     case INDEX_op_or_i64:
     case INDEX_op_or_i32:
         a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_ori32(s, a0, a1, a2);
         } else {
             tcg_out32(s, OR | SAB(a1, a0, a2));
         }
         break;
     case INDEX_op_xor_i64:
     case INDEX_op_xor_i32:
         a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_xori32(s, a0, a1, a2);
         } else {
             tcg_out32(s, XOR | SAB(a1, a0, a2));
         }
         break;
     case INDEX_op_andc_i32:
         a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_andi32(s, a0, a1, ~a2);
         } else {
             tcg_out32(s, ANDC | SAB(a1, a0, a2));
         }
         break;
     case INDEX_op_andc_i64:
         a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_andi64(s, a0, a1, ~a2);
         } else {
             tcg_out32(s, ANDC | SAB(a1, a0, a2));
         }
         break;
     case INDEX_op_orc_i32:
         if (const_args[2]) {
             tcg_out_ori32(s, args[0], args[1], ~args[2]);
             break;
         }
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_orc_i64:
         tcg_out32(s, ORC | SAB(args[1], args[0], args[2]));
         break;
     case INDEX_op_eqv_i32:
         if (const_args[2]) {
             tcg_out_xori32(s, args[0], args[1], ~args[2]);
             break;
         }
         /* FALLTHRU */
+        fallthrough;
     case INDEX_op_eqv_i64:
         tcg_out32(s, EQV | SAB(args[1], args[0], args[2]));
         break;
     case INDEX_op_nand_i32:
     case INDEX_op_nand_i64:
         tcg_out32(s, NAND | SAB(args[1], args[0], args[2]));
         break;
     case INDEX_op_nor_i32:
     case INDEX_op_nor_i64:
         tcg_out32(s, NOR | SAB(args[1], args[0], args[2]));
         break;
 
     case INDEX_op_clz_i32:
         tcg_out_cntxz(s, TCG_TYPE_I32, CNTLZW, args[0], args[1],
                       args[2], const_args[2]);
         break;
     case INDEX_op_ctz_i32:
         tcg_out_cntxz(s, TCG_TYPE_I32, CNTTZW, args[0], args[1],
                       args[2], const_args[2]);
         break;
     case INDEX_op_ctpop_i32:
         tcg_out32(s, CNTPOPW | SAB(args[1], args[0], 0));
         break;
 
     case INDEX_op_clz_i64:
         tcg_out_cntxz(s, TCG_TYPE_I64, CNTLZD, args[0], args[1],
                       args[2], const_args[2]);
         break;
     case INDEX_op_ctz_i64:
         tcg_out_cntxz(s, TCG_TYPE_I64, CNTTZD, args[0], args[1],
                       args[2], const_args[2]);
         break;
     case INDEX_op_ctpop_i64:
         tcg_out32(s, CNTPOPD | SAB(args[1], args[0], 0));
         break;
 
     case INDEX_op_mul_i32:
         a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out32(s, MULLI | TAI(a0, a1, a2));
         } else {
             tcg_out32(s, MULLW | TAB(a0, a1, a2));
         }
         break;
 
     case INDEX_op_div_i32:
         tcg_out32(s, DIVW | TAB(args[0], args[1], args[2]));
         break;
 
     case INDEX_op_divu_i32:
         tcg_out32(s, DIVWU | TAB(args[0], args[1], args[2]));
         break;
 
     case INDEX_op_rem_i32:
         tcg_out32(s, MODSW | TAB(args[0], args[1], args[2]));
         break;
 
     case INDEX_op_remu_i32:
         tcg_out32(s, MODUW | TAB(args[0], args[1], args[2]));
         break;
 
     case INDEX_op_shl_i32:
         if (const_args[2]) {
             /* Limit immediate shift count lest we create an illegal insn.  */
             tcg_out_shli32(s, args[0], args[1], args[2] & 31);
         } else {
             tcg_out32(s, SLW | SAB(args[1], args[0], args[2]));
         }
         break;
     case INDEX_op_shr_i32:
         if (const_args[2]) {
             /* Limit immediate shift count lest we create an illegal insn.  */
             tcg_out_shri32(s, args[0], args[1], args[2] & 31);
         } else {
             tcg_out32(s, SRW | SAB(args[1], args[0], args[2]));
         }
         break;
     case INDEX_op_sar_i32:
         if (const_args[2]) {
             tcg_out_sari32(s, args[0], args[1], args[2]);
         } else {
             tcg_out32(s, SRAW | SAB(args[1], args[0], args[2]));
         }
         break;
     case INDEX_op_rotl_i32:
         if (const_args[2]) {
             tcg_out_rlw(s, RLWINM, args[0], args[1], args[2], 0, 31);
         } else {
             tcg_out32(s, RLWNM | SAB(args[1], args[0], args[2])
                          | MB(0) | ME(31));
         }
         break;
     case INDEX_op_rotr_i32:
         if (const_args[2]) {
             tcg_out_rlw(s, RLWINM, args[0], args[1], 32 - args[2], 0, 31);
         } else {
             tcg_out32(s, SUBFIC | TAI(TCG_REG_R0, args[2], 32));
             tcg_out32(s, RLWNM | SAB(args[1], args[0], TCG_REG_R0)
                          | MB(0) | ME(31));
         }
         break;
 
     case INDEX_op_brcond_i32:
         tcg_out_brcond(s, args[2], args[0], args[1], const_args[1],
                        arg_label(args[3]), TCG_TYPE_I32);
         break;
     case INDEX_op_brcond_i64:
         tcg_out_brcond(s, args[2], args[0], args[1], const_args[1],
                        arg_label(args[3]), TCG_TYPE_I64);
         break;
     case INDEX_op_brcond2_i32:
         tcg_out_brcond2(s, args, const_args);
         break;
 
     case INDEX_op_neg_i32:
     case INDEX_op_neg_i64:
         tcg_out32(s, NEG | RT(args[0]) | RA(args[1]));
         break;
 
     case INDEX_op_not_i32:
     case INDEX_op_not_i64:
         tcg_out32(s, NOR | SAB(args[1], args[0], args[1]));
         break;
 
     case INDEX_op_add_i64:
         a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
         do_addi_64:
             tcg_out_mem_long(s, ADDI, ADD, a0, a1, a2);
         } else {
             tcg_out32(s, ADD | TAB(a0, a1, a2));
         }
         break;
     case INDEX_op_sub_i64:
         a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[1]) {
             if (const_args[2]) {
                 tcg_out_movi(s, TCG_TYPE_I64, a0, a1 - a2);
             } else {
                 tcg_out32(s, SUBFIC | TAI(a0, a2, a1));
             }
         } else if (const_args[2]) {
             a2 = -a2;
             goto do_addi_64;
         } else {
             tcg_out32(s, SUBF | TAB(a0, a2, a1));
         }
         break;
 
     case INDEX_op_shl_i64:
         if (const_args[2]) {
             /* Limit immediate shift count lest we create an illegal insn.  */
             tcg_out_shli64(s, args[0], args[1], args[2] & 63);
         } else {
             tcg_out32(s, SLD | SAB(args[1], args[0], args[2]));
         }
         break;
     case INDEX_op_shr_i64:
         if (const_args[2]) {
             /* Limit immediate shift count lest we create an illegal insn.  */
             tcg_out_shri64(s, args[0], args[1], args[2] & 63);
         } else {
             tcg_out32(s, SRD | SAB(args[1], args[0], args[2]));
         }
         break;
     case INDEX_op_sar_i64:
         if (const_args[2]) {
             tcg_out_sari64(s, args[0], args[1], args[2]);
         } else {
             tcg_out32(s, SRAD | SAB(args[1], args[0], args[2]));
         }
         break;
     case INDEX_op_rotl_i64:
         if (const_args[2]) {
             tcg_out_rld(s, RLDICL, args[0], args[1], args[2], 0);
         } else {
             tcg_out32(s, RLDCL | SAB(args[1], args[0], args[2]) | MB64(0));
         }
         break;
     case INDEX_op_rotr_i64:
         if (const_args[2]) {
             tcg_out_rld(s, RLDICL, args[0], args[1], 64 - args[2], 0);
         } else {
             tcg_out32(s, SUBFIC | TAI(TCG_REG_R0, args[2], 64));
             tcg_out32(s, RLDCL | SAB(args[1], args[0], TCG_REG_R0) | MB64(0));
         }
         break;
 
     case INDEX_op_mul_i64:
         a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out32(s, MULLI | TAI(a0, a1, a2));
         } else {
             tcg_out32(s, MULLD | TAB(a0, a1, a2));
         }
         break;
     case INDEX_op_div_i64:
         tcg_out32(s, DIVD | TAB(args[0], args[1], args[2]));
         break;
     case INDEX_op_divu_i64:
         tcg_out32(s, DIVDU | TAB(args[0], args[1], args[2]));
         break;
     case INDEX_op_rem_i64:
         tcg_out32(s, MODSD | TAB(args[0], args[1], args[2]));
         break;
     case INDEX_op_remu_i64:
         tcg_out32(s, MODUD | TAB(args[0], args[1], args[2]));
         break;
 
     case INDEX_op_qemu_ld_a64_i32:
         if (TCG_TARGET_REG_BITS == 32) {
             tcg_out_qemu_ld(s, args[0], -1, args[1], args[2],
                             args[3], TCG_TYPE_I32);
             break;
         }
-        /* fall through */
+        fallthrough;
     case INDEX_op_qemu_ld_a32_i32:
         tcg_out_qemu_ld(s, args[0], -1, args[1], -1, args[2], TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_a32_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_ld(s, args[0], -1, args[1], -1,
                             args[2], TCG_TYPE_I64);
         } else {
             tcg_out_qemu_ld(s, args[0], args[1], args[2], -1,
                             args[3], TCG_TYPE_I64);
         }
         break;
     case INDEX_op_qemu_ld_a64_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_ld(s, args[0], -1, args[1], -1,
                             args[2], TCG_TYPE_I64);
         } else {
             tcg_out_qemu_ld(s, args[0], args[1], args[2], args[3],
                             args[4], TCG_TYPE_I64);
         }
         break;
     case INDEX_op_qemu_ld_a32_i128:
     case INDEX_op_qemu_ld_a64_i128:
         tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
         tcg_out_qemu_ldst_i128(s, args[0], args[1], args[2], args[3], true);
         break;
 
     case INDEX_op_qemu_st_a64_i32:
         if (TCG_TARGET_REG_BITS == 32) {
             tcg_out_qemu_st(s, args[0], -1, args[1], args[2],
                             args[3], TCG_TYPE_I32);
             break;
         }
-        /* fall through */
+        fallthrough;
     case INDEX_op_qemu_st_a32_i32:
         tcg_out_qemu_st(s, args[0], -1, args[1], -1, args[2], TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_a32_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_st(s, args[0], -1, args[1], -1,
                             args[2], TCG_TYPE_I64);
         } else {
             tcg_out_qemu_st(s, args[0], args[1], args[2], -1,
                             args[3], TCG_TYPE_I64);
         }
         break;
     case INDEX_op_qemu_st_a64_i64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_qemu_st(s, args[0], -1, args[1], -1,
                             args[2], TCG_TYPE_I64);
         } else {
             tcg_out_qemu_st(s, args[0], args[1], args[2], args[3],
                             args[4], TCG_TYPE_I64);
         }
         break;
     case INDEX_op_qemu_st_a32_i128:
     case INDEX_op_qemu_st_a64_i128:
         tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
         tcg_out_qemu_ldst_i128(s, args[0], args[1], args[2], args[3], false);
         break;
 
     case INDEX_op_setcond_i32:
         tcg_out_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1], args[2],
                         const_args[2], false);
         break;
     case INDEX_op_setcond_i64:
         tcg_out_setcond(s, TCG_TYPE_I64, args[3], args[0], args[1], args[2],
                         const_args[2], false);
         break;
     case INDEX_op_negsetcond_i32:
         tcg_out_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1], args[2],
                         const_args[2], true);
         break;
     case INDEX_op_negsetcond_i64:
         tcg_out_setcond(s, TCG_TYPE_I64, args[3], args[0], args[1], args[2],
                         const_args[2], true);
         break;
     case INDEX_op_setcond2_i32:
         tcg_out_setcond2(s, args, const_args);
         break;
 
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
         tcg_out_bswap16(s, args[0], args[1], args[2]);
         break;
     case INDEX_op_bswap32_i32:
         tcg_out_bswap32(s, args[0], args[1], 0);
         break;
     case INDEX_op_bswap32_i64:
         tcg_out_bswap32(s, args[0], args[1], args[2]);
         break;
     case INDEX_op_bswap64_i64:
         tcg_out_bswap64(s, args[0], args[1]);
         break;
 
     case INDEX_op_deposit_i32:
         if (const_args[2]) {
             uint32_t mask = ((2u << (args[4] - 1)) - 1) << args[3];
             tcg_out_andi32(s, args[0], args[0], ~mask);
         } else {
             tcg_out_rlw(s, RLWIMI, args[0], args[2], args[3],
                         32 - args[3] - args[4], 31 - args[3]);
         }
         break;
     case INDEX_op_deposit_i64:
         if (const_args[2]) {
             uint64_t mask = ((2ull << (args[4] - 1)) - 1) << args[3];
             tcg_out_andi64(s, args[0], args[0], ~mask);
         } else {
             tcg_out_rld(s, RLDIMI, args[0], args[2], args[3],
                         64 - args[3] - args[4]);
         }
         break;
 
     case INDEX_op_extract_i32:
         tcg_out_rlw(s, RLWINM, args[0], args[1],
                     32 - args[2], 32 - args[3], 31);
         break;
     case INDEX_op_extract_i64:
         tcg_out_rld(s, RLDICL, args[0], args[1], 64 - args[2], 64 - args[3]);
         break;
 
     case INDEX_op_movcond_i32:
         tcg_out_movcond(s, TCG_TYPE_I32, args[5], args[0], args[1], args[2],
                         args[3], args[4], const_args[2]);
         break;
     case INDEX_op_movcond_i64:
         tcg_out_movcond(s, TCG_TYPE_I64, args[5], args[0], args[1], args[2],
                         args[3], args[4], const_args[2]);
         break;
 
 #if TCG_TARGET_REG_BITS == 64
     case INDEX_op_add2_i64:
 #else
     case INDEX_op_add2_i32:
 #endif
         /* Note that the CA bit is defined based on the word size of the
            environment.  So in 64-bit mode it's always carry-out of bit 63.
            The fallback code using deposit works just as well for 32-bit.  */
         a0 = args[0], a1 = args[1];
         if (a0 == args[3] || (!const_args[5] && a0 == args[5])) {
             a0 = TCG_REG_R0;
         }
         if (const_args[4]) {
             tcg_out32(s, ADDIC | TAI(a0, args[2], args[4]));
         } else {
             tcg_out32(s, ADDC | TAB(a0, args[2], args[4]));
         }
         if (const_args[5]) {
             tcg_out32(s, (args[5] ? ADDME : ADDZE) | RT(a1) | RA(args[3]));
         } else {
             tcg_out32(s, ADDE | TAB(a1, args[3], args[5]));
         }
         if (a0 != args[0]) {
             tcg_out_mov(s, TCG_TYPE_REG, args[0], a0);
         }
         break;
 
 #if TCG_TARGET_REG_BITS == 64
     case INDEX_op_sub2_i64:
 #else
     case INDEX_op_sub2_i32:
 #endif
         a0 = args[0], a1 = args[1];
         if (a0 == args[5] || (!const_args[3] && a0 == args[3])) {
             a0 = TCG_REG_R0;
         }
         if (const_args[2]) {
             tcg_out32(s, SUBFIC | TAI(a0, args[4], args[2]));
         } else {
             tcg_out32(s, SUBFC | TAB(a0, args[4], args[2]));
         }
         if (const_args[3]) {
             tcg_out32(s, (args[3] ? SUBFME : SUBFZE) | RT(a1) | RA(args[5]));
         } else {
             tcg_out32(s, SUBFE | TAB(a1, args[5], args[3]));
         }
         if (a0 != args[0]) {
             tcg_out_mov(s, TCG_TYPE_REG, args[0], a0);
         }
         break;
 
     case INDEX_op_muluh_i32:
         tcg_out32(s, MULHWU | TAB(args[0], args[1], args[2]));
         break;
     case INDEX_op_mulsh_i32:
         tcg_out32(s, MULHW | TAB(args[0], args[1], args[2]));
         break;
     case INDEX_op_muluh_i64:
         tcg_out32(s, MULHDU | TAB(args[0], args[1], args[2]));
         break;
     case INDEX_op_mulsh_i64:
         tcg_out32(s, MULHD | TAB(args[0], args[1], args[2]));
         break;
 
     case INDEX_op_mb:
         tcg_out_mb(s, args[0]);
         break;
 
     case INDEX_op_mov_i32:   /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:      /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:   /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:   /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
     case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
 }
@@ -3578,49 +3587,49 @@ static void expand_vec_shi(TCGType type, unsigned vece, TCGv_vec v0,
 static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
                            TCGv_vec v1, TCGv_vec v2, TCGCond cond)
 {
     bool need_swap = false, need_inv = false;
 
     tcg_debug_assert(vece <= MO_32 || have_isa_2_07);
 
     switch (cond) {
     case TCG_COND_EQ:
     case TCG_COND_GT:
     case TCG_COND_GTU:
         break;
     case TCG_COND_NE:
         if (have_isa_3_00 && vece <= MO_32) {
             break;
         }
-        /* fall through */
+        fallthrough;
     case TCG_COND_LE:
     case TCG_COND_LEU:
         need_inv = true;
         break;
     case TCG_COND_LT:
     case TCG_COND_LTU:
         need_swap = true;
         break;
     case TCG_COND_GE:
     case TCG_COND_GEU:
         need_swap = need_inv = true;
         break;
     default:
         g_assert_not_reached();
     }
 
     if (need_inv) {
         cond = tcg_invert_cond(cond);
     }
     if (need_swap) {
         TCGv_vec t1;
         t1 = v1, v1 = v2, v2 = t1;
         cond = tcg_swap_cond(cond);
     }
 
     vec_gen_4(INDEX_op_cmp_vec, type, vece, tcgv_vec_arg(v0),
               tcgv_vec_arg(v1), tcgv_vec_arg(v2), cond);
 
     if (need_inv) {
         tcg_gen_not_vec(vece, v0, v0);
     }
 }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index d6dbcaf3cb..8b0e7b000c 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -939,37 +939,37 @@ static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
 static void tcg_out_negsetcond(TCGContext *s, TCGCond cond, TCGReg ret,
                                TCGReg arg1, tcg_target_long arg2, bool c2)
 {
     int tmpflags;
     TCGReg tmp;
 
     /* For LT/GE comparison against 0, replicate the sign bit. */
     if (c2 && arg2 == 0) {
         switch (cond) {
         case TCG_COND_GE:
             tcg_out_opc_imm(s, OPC_XORI, ret, arg1, -1);
             arg1 = ret;
-            /* fall through */
+            fallthrough;
         case TCG_COND_LT:
             tcg_out_opc_imm(s, OPC_SRAI, ret, arg1, TCG_TARGET_REG_BITS - 1);
             return;
         default:
             break;
         }
     }
 
     tmpflags = tcg_out_setcond_int(s, cond, ret, arg1, arg2, c2);
     tmp = tmpflags & ~SETCOND_FLAGS;
 
     /* If intermediate result is zero/non-zero: test != 0. */
     if (tmpflags & SETCOND_NEZ) {
         tcg_out_opc_reg(s, OPC_SLTU, ret, TCG_REG_ZERO, tmp);
         tmp = ret;
     }
 
     /* Produce the 0/-1 result. */
     if (tmpflags & SETCOND_INV) {
         tcg_out_opc_imm(s, OPC_ADDI, ret, tmp, -1);
     } else {
         tcg_out_opc_reg(s, OPC_SUB, ret, TCG_REG_ZERO, tmp);
     }
 }
@@ -1351,35 +1351,36 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
                                    TCGReg base, MemOp opc, TCGType type)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & (MO_SSIZE)) {
     case MO_UB:
         tcg_out_opc_imm(s, OPC_LBU, val, base, 0);
         break;
     case MO_SB:
         tcg_out_opc_imm(s, OPC_LB, val, base, 0);
         break;
     case MO_UW:
         tcg_out_opc_imm(s, OPC_LHU, val, base, 0);
         break;
     case MO_SW:
         tcg_out_opc_imm(s, OPC_LH, val, base, 0);
         break;
     case MO_UL:
         if (type == TCG_TYPE_I64) {
             tcg_out_opc_imm(s, OPC_LWU, val, base, 0);
             break;
         }
         /* FALLTHRU */
+        fallthrough;
     case MO_SL:
         tcg_out_opc_imm(s, OPC_LW, val, base, 0);
         break;
     case MO_UQ:
         tcg_out_opc_imm(s, OPC_LD, val, base, 0);
         break;
     default:
         g_assert_not_reached();
     }
 }
@@ -1486,405 +1487,405 @@ void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0 = args[0];
     TCGArg a1 = args[1];
     TCGArg a2 = args[2];
     int c2 = const_args[2];
 
     switch (opc) {
     case INDEX_op_goto_ptr:
         tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, a0, 0);
         break;
 
     case INDEX_op_br:
         tcg_out_reloc(s, s->code_ptr, R_RISCV_JAL, arg_label(a0), 0);
         tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, 0);
         break;
 
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8u_i64:
         tcg_out_ldst(s, OPC_LBU, a0, a1, a2);
         break;
     case INDEX_op_ld8s_i32:
     case INDEX_op_ld8s_i64:
         tcg_out_ldst(s, OPC_LB, a0, a1, a2);
         break;
     case INDEX_op_ld16u_i32:
     case INDEX_op_ld16u_i64:
         tcg_out_ldst(s, OPC_LHU, a0, a1, a2);
         break;
     case INDEX_op_ld16s_i32:
     case INDEX_op_ld16s_i64:
         tcg_out_ldst(s, OPC_LH, a0, a1, a2);
         break;
     case INDEX_op_ld32u_i64:
         tcg_out_ldst(s, OPC_LWU, a0, a1, a2);
         break;
     case INDEX_op_ld_i32:
     case INDEX_op_ld32s_i64:
         tcg_out_ldst(s, OPC_LW, a0, a1, a2);
         break;
     case INDEX_op_ld_i64:
         tcg_out_ldst(s, OPC_LD, a0, a1, a2);
         break;
 
     case INDEX_op_st8_i32:
     case INDEX_op_st8_i64:
         tcg_out_ldst(s, OPC_SB, a0, a1, a2);
         break;
     case INDEX_op_st16_i32:
     case INDEX_op_st16_i64:
         tcg_out_ldst(s, OPC_SH, a0, a1, a2);
         break;
     case INDEX_op_st_i32:
     case INDEX_op_st32_i64:
         tcg_out_ldst(s, OPC_SW, a0, a1, a2);
         break;
     case INDEX_op_st_i64:
         tcg_out_ldst(s, OPC_SD, a0, a1, a2);
         break;
 
     case INDEX_op_add_i32:
         if (c2) {
             tcg_out_opc_imm(s, OPC_ADDIW, a0, a1, a2);
         } else {
             tcg_out_opc_reg(s, OPC_ADDW, a0, a1, a2);
         }
         break;
     case INDEX_op_add_i64:
         if (c2) {
             tcg_out_opc_imm(s, OPC_ADDI, a0, a1, a2);
         } else {
             tcg_out_opc_reg(s, OPC_ADD, a0, a1, a2);
         }
         break;
 
     case INDEX_op_sub_i32:
         if (c2) {
             tcg_out_opc_imm(s, OPC_ADDIW, a0, a1, -a2);
         } else {
             tcg_out_opc_reg(s, OPC_SUBW, a0, a1, a2);
         }
         break;
     case INDEX_op_sub_i64:
         if (c2) {
             tcg_out_opc_imm(s, OPC_ADDI, a0, a1, -a2);
         } else {
             tcg_out_opc_reg(s, OPC_SUB, a0, a1, a2);
         }
         break;
 
     case INDEX_op_and_i32:
     case INDEX_op_and_i64:
         if (c2) {
             tcg_out_opc_imm(s, OPC_ANDI, a0, a1, a2);
         } else {
             tcg_out_opc_reg(s, OPC_AND, a0, a1, a2);
         }
         break;
 
     case INDEX_op_or_i32:
     case INDEX_op_or_i64:
         if (c2) {
             tcg_out_opc_imm(s, OPC_ORI, a0, a1, a2);
         } else {
             tcg_out_opc_reg(s, OPC_OR, a0, a1, a2);
         }
         break;
 
     case INDEX_op_xor_i32:
     case INDEX_op_xor_i64:
         if (c2) {
             tcg_out_opc_imm(s, OPC_XORI, a0, a1, a2);
         } else {
             tcg_out_opc_reg(s, OPC_XOR, a0, a1, a2);
         }
         break;
 
     case INDEX_op_andc_i32:
     case INDEX_op_andc_i64:
         if (c2) {
             tcg_out_opc_imm(s, OPC_ANDI, a0, a1, ~a2);
         } else {
             tcg_out_opc_reg(s, OPC_ANDN, a0, a1, a2);
         }
         break;
     case INDEX_op_orc_i32:
     case INDEX_op_orc_i64:
         if (c2) {
             tcg_out_opc_imm(s, OPC_ORI, a0, a1, ~a2);
         } else {
             tcg_out_opc_reg(s, OPC_ORN, a0, a1, a2);
         }
         break;
     case INDEX_op_eqv_i32:
     case INDEX_op_eqv_i64:
         if (c2) {
             tcg_out_opc_imm(s, OPC_XORI, a0, a1, ~a2);
         } else {
             tcg_out_opc_reg(s, OPC_XNOR, a0, a1, a2);
         }
         break;
 
     case INDEX_op_not_i32:
     case INDEX_op_not_i64:
         tcg_out_opc_imm(s, OPC_XORI, a0, a1, -1);
         break;
 
     case INDEX_op_neg_i32:
         tcg_out_opc_reg(s, OPC_SUBW, a0, TCG_REG_ZERO, a1);
         break;
     case INDEX_op_neg_i64:
         tcg_out_opc_reg(s, OPC_SUB, a0, TCG_REG_ZERO, a1);
         break;
 
     case INDEX_op_mul_i32:
         tcg_out_opc_reg(s, OPC_MULW, a0, a1, a2);
         break;
     case INDEX_op_mul_i64:
         tcg_out_opc_reg(s, OPC_MUL, a0, a1, a2);
         break;
 
     case INDEX_op_div_i32:
         tcg_out_opc_reg(s, OPC_DIVW, a0, a1, a2);
         break;
     case INDEX_op_div_i64:
         tcg_out_opc_reg(s, OPC_DIV, a0, a1, a2);
         break;
 
     case INDEX_op_divu_i32:
         tcg_out_opc_reg(s, OPC_DIVUW, a0, a1, a2);
         break;
     case INDEX_op_divu_i64:
         tcg_out_opc_reg(s, OPC_DIVU, a0, a1, a2);
         break;
 
     case INDEX_op_rem_i32:
         tcg_out_opc_reg(s, OPC_REMW, a0, a1, a2);
         break;
     case INDEX_op_rem_i64:
         tcg_out_opc_reg(s, OPC_REM, a0, a1, a2);
         break;
 
     case INDEX_op_remu_i32:
         tcg_out_opc_reg(s, OPC_REMUW, a0, a1, a2);
         break;
     case INDEX_op_remu_i64:
         tcg_out_opc_reg(s, OPC_REMU, a0, a1, a2);
         break;
 
     case INDEX_op_shl_i32:
         if (c2) {
             tcg_out_opc_imm(s, OPC_SLLIW, a0, a1, a2 & 0x1f);
         } else {
             tcg_out_opc_reg(s, OPC_SLLW, a0, a1, a2);
         }
         break;
     case INDEX_op_shl_i64:
         if (c2) {
             tcg_out_opc_imm(s, OPC_SLLI, a0, a1, a2 & 0x3f);
         } else {
             tcg_out_opc_reg(s, OPC_SLL, a0, a1, a2);
         }
         break;
 
     case INDEX_op_shr_i32:
         if (c2) {
             tcg_out_opc_imm(s, OPC_SRLIW, a0, a1, a2 & 0x1f);
         } else {
             tcg_out_opc_reg(s, OPC_SRLW, a0, a1, a2);
         }
         break;
     case INDEX_op_shr_i64:
         if (c2) {
             tcg_out_opc_imm(s, OPC_SRLI, a0, a1, a2 & 0x3f);
         } else {
             tcg_out_opc_reg(s, OPC_SRL, a0, a1, a2);
         }
         break;
 
     case INDEX_op_sar_i32:
         if (c2) {
             tcg_out_opc_imm(s, OPC_SRAIW, a0, a1, a2 & 0x1f);
         } else {
             tcg_out_opc_reg(s, OPC_SRAW, a0, a1, a2);
         }
         break;
     case INDEX_op_sar_i64:
         if (c2) {
             tcg_out_opc_imm(s, OPC_SRAI, a0, a1, a2 & 0x3f);
         } else {
             tcg_out_opc_reg(s, OPC_SRA, a0, a1, a2);
         }
         break;
 
     case INDEX_op_rotl_i32:
         if (c2) {
             tcg_out_opc_imm(s, OPC_RORIW, a0, a1, -a2 & 0x1f);
         } else {
             tcg_out_opc_reg(s, OPC_ROLW, a0, a1, a2);
         }
         break;
     case INDEX_op_rotl_i64:
         if (c2) {
             tcg_out_opc_imm(s, OPC_RORI, a0, a1, -a2 & 0x3f);
         } else {
             tcg_out_opc_reg(s, OPC_ROL, a0, a1, a2);
         }
         break;
 
     case INDEX_op_rotr_i32:
         if (c2) {
             tcg_out_opc_imm(s, OPC_RORIW, a0, a1, a2 & 0x1f);
         } else {
             tcg_out_opc_reg(s, OPC_RORW, a0, a1, a2);
         }
         break;
     case INDEX_op_rotr_i64:
         if (c2) {
             tcg_out_opc_imm(s, OPC_RORI, a0, a1, a2 & 0x3f);
         } else {
             tcg_out_opc_reg(s, OPC_ROR, a0, a1, a2);
         }
         break;
 
     case INDEX_op_bswap64_i64:
         tcg_out_opc_imm(s, OPC_REV8, a0, a1, 0);
         break;
     case INDEX_op_bswap32_i32:
         a2 = 0;
-        /* fall through */
+        fallthrough;
     case INDEX_op_bswap32_i64:
         tcg_out_opc_imm(s, OPC_REV8, a0, a1, 0);
         if (a2 & TCG_BSWAP_OZ) {
             tcg_out_opc_imm(s, OPC_SRLI, a0, a0, 32);
         } else {
             tcg_out_opc_imm(s, OPC_SRAI, a0, a0, 32);
         }
         break;
     case INDEX_op_bswap16_i64:
     case INDEX_op_bswap16_i32:
         tcg_out_opc_imm(s, OPC_REV8, a0, a1, 0);
         if (a2 & TCG_BSWAP_OZ) {
             tcg_out_opc_imm(s, OPC_SRLI, a0, a0, 48);
         } else {
             tcg_out_opc_imm(s, OPC_SRAI, a0, a0, 48);
         }
         break;
 
     case INDEX_op_ctpop_i32:
         tcg_out_opc_imm(s, OPC_CPOPW, a0, a1, 0);
         break;
     case INDEX_op_ctpop_i64:
         tcg_out_opc_imm(s, OPC_CPOP, a0, a1, 0);
         break;
 
     case INDEX_op_clz_i32:
         tcg_out_cltz(s, TCG_TYPE_I32, OPC_CLZW, a0, a1, a2, c2);
         break;
     case INDEX_op_clz_i64:
         tcg_out_cltz(s, TCG_TYPE_I64, OPC_CLZ, a0, a1, a2, c2);
         break;
     case INDEX_op_ctz_i32:
         tcg_out_cltz(s, TCG_TYPE_I32, OPC_CTZW, a0, a1, a2, c2);
         break;
     case INDEX_op_ctz_i64:
         tcg_out_cltz(s, TCG_TYPE_I64, OPC_CTZ, a0, a1, a2, c2);
         break;
 
     case INDEX_op_add2_i32:
         tcg_out_addsub2(s, a0, a1, a2, args[3], args[4], args[5],
                         const_args[4], const_args[5], false, true);
         break;
     case INDEX_op_add2_i64:
         tcg_out_addsub2(s, a0, a1, a2, args[3], args[4], args[5],
                         const_args[4], const_args[5], false, false);
         break;
     case INDEX_op_sub2_i32:
         tcg_out_addsub2(s, a0, a1, a2, args[3], args[4], args[5],
                         const_args[4], const_args[5], true, true);
         break;
     case INDEX_op_sub2_i64:
         tcg_out_addsub2(s, a0, a1, a2, args[3], args[4], args[5],
                         const_args[4], const_args[5], true, false);
         break;
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
         tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
         break;
 
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
         tcg_out_setcond(s, args[3], a0, a1, a2, c2);
         break;
 
     case INDEX_op_negsetcond_i32:
     case INDEX_op_negsetcond_i64:
         tcg_out_negsetcond(s, args[3], a0, a1, a2, c2);
         break;
 
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
         tcg_out_movcond(s, args[5], a0, a1, a2, c2,
                         args[3], const_args[3], args[4], const_args[4]);
         break;
 
     case INDEX_op_qemu_ld_a32_i32:
     case INDEX_op_qemu_ld_a64_i32:
         tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_a32_i64:
     case INDEX_op_qemu_ld_a64_i64:
         tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_a32_i32:
     case INDEX_op_qemu_st_a64_i32:
         tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_a32_i64:
     case INDEX_op_qemu_st_a64_i64:
         tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I64);
         break;
 
     case INDEX_op_extrh_i64_i32:
         tcg_out_opc_imm(s, OPC_SRAI, a0, a1, 32);
         break;
 
     case INDEX_op_mulsh_i32:
     case INDEX_op_mulsh_i64:
         tcg_out_opc_reg(s, OPC_MULH, a0, a1, a2);
         break;
 
     case INDEX_op_muluh_i32:
     case INDEX_op_muluh_i64:
         tcg_out_opc_reg(s, OPC_MULHU, a0, a1, a2);
         break;
 
     case INDEX_op_mb:
         tcg_out_mb(s, a0);
         break;
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
     case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
 }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 4ef9ac3d5b..3656b8ddf0 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -801,37 +801,37 @@ static void tcg_out_sh32(TCGContext* s, S390Opcode op, TCGReg dest,
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
 {
     if (src == dst) {
         return true;
     }
     switch (type) {
     case TCG_TYPE_I32:
         if (likely(is_general_reg(dst) && is_general_reg(src))) {
             tcg_out_insn(s, RR, LR, dst, src);
             break;
         }
-        /* fallthru */
+        fallthrough;
 
     case TCG_TYPE_I64:
         if (likely(is_general_reg(dst))) {
             if (likely(is_general_reg(src))) {
                 tcg_out_insn(s, RRE, LGR, dst, src);
             } else {
                 tcg_out_insn(s, VRSc, VLGV, dst, 0, 0, src, 3);
             }
             break;
         } else if (is_general_reg(src)) {
             tcg_out_insn(s, VRSb, VLVG, dst, 0, 0, src, 3);
             break;
         }
-        /* fallthru */
+        fallthrough;
 
     case TCG_TYPE_V64:
     case TCG_TYPE_V128:
         tcg_out_insn(s, VRRa, VLR, dst, src, 0);
         break;
 
     default:
         g_assert_not_reached();
     }
     return true;
 }
@@ -965,33 +965,34 @@ static void tcg_out_vrx_mem(TCGContext *s, S390Opcode opc_vrx,
 /* load data without address translation or endianness conversion */
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg data,
                        TCGReg base, intptr_t ofs)
 {
     switch (type) {
     case TCG_TYPE_I32:
         if (likely(is_general_reg(data))) {
             tcg_out_mem(s, RX_L, RXY_LY, data, base, TCG_REG_NONE, ofs);
             break;
         }
         tcg_out_vrx_mem(s, VRX_VLLEZ, data, base, TCG_REG_NONE, ofs, MO_32);
         break;
 
     case TCG_TYPE_I64:
         if (likely(is_general_reg(data))) {
             tcg_out_mem(s, 0, RXY_LG, data, base, TCG_REG_NONE, ofs);
             break;
         }
         /* fallthru */
+        fallthrough;
 
     case TCG_TYPE_V64:
         tcg_out_vrx_mem(s, VRX_VLLEZ, data, base, TCG_REG_NONE, ofs, MO_64);
         break;
 
     case TCG_TYPE_V128:
         /* Hint quadword aligned.  */
         tcg_out_vrx_mem(s, VRX_VL, data, base, TCG_REG_NONE, ofs, 4);
         break;
 
     default:
         g_assert_not_reached();
     }
 }
@@ -999,32 +1000,33 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg data,
 static void tcg_out_st(TCGContext *s, TCGType type, TCGReg data,
                        TCGReg base, intptr_t ofs)
 {
     switch (type) {
     case TCG_TYPE_I32:
         if (likely(is_general_reg(data))) {
             tcg_out_mem(s, RX_ST, RXY_STY, data, base, TCG_REG_NONE, ofs);
         } else {
             tcg_out_vrx_mem(s, VRX_VSTEF, data, base, TCG_REG_NONE, ofs, 1);
         }
         break;
 
     case TCG_TYPE_I64:
         if (likely(is_general_reg(data))) {
             tcg_out_mem(s, 0, RXY_STG, data, base, TCG_REG_NONE, ofs);
             break;
         }
         /* fallthru */
+        fallthrough;
 
     case TCG_TYPE_V64:
         tcg_out_vrx_mem(s, VRX_VSTEG, data, base, TCG_REG_NONE, ofs, 0);
         break;
 
     case TCG_TYPE_V128:
         /* Hint quadword aligned.  */
         tcg_out_vrx_mem(s, VRX_VST, data, base, TCG_REG_NONE, ofs, 4);
         break;
 
     default:
         g_assert_not_reached();
     }
 }
@@ -1268,93 +1270,95 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
 static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
                          TCGReg dest, TCGReg c1, TCGArg c2,
                          bool c2const, bool neg)
 {
     int cc;
 
     /* With LOC2, we can always emit the minimum 3 insns.  */
     if (HAVE_FACILITY(LOAD_ON_COND2)) {
         /* Emit: d = 0, d = (cc ? 1 : d).  */
         cc = tgen_cmp(s, type, cond, c1, c2, c2const, false);
         tcg_out_movi(s, TCG_TYPE_I64, dest, 0);
         tcg_out_insn(s, RIEg, LOCGHI, dest, neg ? -1 : 1, cc);
         return;
     }
 
     switch (cond) {
     case TCG_COND_GEU:
     case TCG_COND_LTU:
     case TCG_COND_LT:
     case TCG_COND_GE:
         /* Swap operands so that we can use LEU/GTU/GT/LE.  */
         if (!c2const) {
             TCGReg t = c1;
             c1 = c2;
             c2 = t;
             cond = tcg_swap_cond(cond);
         }
         break;
     default:
         break;
     }
 
     switch (cond) {
     case TCG_COND_NE:
         /* X != 0 is X > 0.  */
         if (c2const && c2 == 0) {
             cond = TCG_COND_GTU;
         } else {
             break;
         }
         /* fallthru */
+        fallthrough;
 
     case TCG_COND_GTU:
     case TCG_COND_GT:
         /*
          * The result of a compare has CC=2 for GT and CC=3 unused.
          * ADD LOGICAL WITH CARRY considers (CC & 2) the carry bit.
          */
         tgen_cmp(s, type, cond, c1, c2, c2const, true);
         tcg_out_movi(s, type, dest, 0);
         tcg_out_insn(s, RRE, ALCGR, dest, dest);
         if (neg) {
             if (type == TCG_TYPE_I32) {
                 tcg_out_insn(s, RR, LCR, dest, dest);
             } else {
                 tcg_out_insn(s, RRE, LCGR, dest, dest);
             }
         }
         return;
 
     case TCG_COND_EQ:
         /* X == 0 is X <= 0.  */
         if (c2const && c2 == 0) {
             cond = TCG_COND_LEU;
         } else {
             break;
         }
         /* fallthru */
+        fallthrough;
 
     case TCG_COND_LEU:
     case TCG_COND_LE:
         /*
          * As above, but we're looking for borrow, or !carry.
          * The second insn computes d - d - borrow, or -1 for true
          * and 0 for false.  So we must mask to 1 bit afterward.
          */
         tgen_cmp(s, type, cond, c1, c2, c2const, true);
         tcg_out_insn(s, RRE, SLBGR, dest, dest);
         if (!neg) {
             tgen_andi(s, type, dest, 1);
         }
         return;
 
     default:
         g_assert_not_reached();
     }
 
     cc = tgen_cmp(s, type, cond, c1, c2, c2const, false);
     /* Emit: d = 0, t = 1, d = (cc ? t : d).  */
     tcg_out_movi(s, TCG_TYPE_I64, dest, 0);
     tcg_out_movi(s, TCG_TYPE_I64, TCG_TMP0, neg ? -1 : 1);
     tcg_out_insn(s, RRFc, LOCGR, dest, TCG_TMP0, cc);
 }
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index feb2d3686b..35e47902f1 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -472,51 +472,51 @@ static TCGType choose_vector_type(const TCGOpcode *list, unsigned vece,
 static void do_dup_store(TCGType type, uint32_t dofs, uint32_t oprsz,
                          uint32_t maxsz, TCGv_vec t_vec)
 {
     uint32_t i = 0;
 
     tcg_debug_assert(oprsz >= 8);
 
     /*
      * This may be expand_clr for the tail of an operation, e.g.
      * oprsz == 8 && maxsz == 64.  The first 8 bytes of this store
      * are misaligned wrt the maximum vector size, so do that first.
      */
     if (dofs & 8) {
         tcg_gen_stl_vec(t_vec, tcg_env, dofs + i, TCG_TYPE_V64);
         i += 8;
     }
 
     switch (type) {
     case TCG_TYPE_V256:
         /*
          * Recall that ARM SVE allows vector sizes that are not a
          * power of 2, but always a multiple of 16.  The intent is
          * that e.g. size == 80 would be expanded with 2x32 + 1x16.
          */
         for (; i + 32 <= oprsz; i += 32) {
             tcg_gen_stl_vec(t_vec, tcg_env, dofs + i, TCG_TYPE_V256);
         }
-        /* fallthru */
+        fallthrough;
     case TCG_TYPE_V128:
         for (; i + 16 <= oprsz; i += 16) {
             tcg_gen_stl_vec(t_vec, tcg_env, dofs + i, TCG_TYPE_V128);
         }
         break;
     case TCG_TYPE_V64:
         for (; i < oprsz; i += 8) {
             tcg_gen_stl_vec(t_vec, tcg_env, dofs + i, TCG_TYPE_V64);
         }
         break;
     default:
         g_assert_not_reached();
     }
 
     if (oprsz < maxsz) {
         expand_clr(dofs + oprsz, maxsz - oprsz);
     }
 }
 
 /* Set OPRSZ bytes at DOFS to replications of IN_32, IN_64 or IN_C.
  * Only one of IN_32 or IN_64 may be set;
  * IN_C is used if IN_32 and IN_64 are unset.
  */
@@ -1200,484 +1200,484 @@ static void expand_4i_vec(unsigned vece, uint32_t dofs, uint32_t aofs,
 /* Expand a vector two-operand operation.  */
 void tcg_gen_gvec_2(uint32_t dofs, uint32_t aofs,
                     uint32_t oprsz, uint32_t maxsz, const GVecGen2 *g)
 {
     const TCGOpcode *this_list = g->opt_opc ? : vecop_list_empty;
     const TCGOpcode *hold_list = tcg_swap_vecop_list(this_list);
     TCGType type;
     uint32_t some;
 
     check_size_align(oprsz, maxsz, dofs | aofs);
     check_overlap_2(dofs, aofs, maxsz);
 
     type = 0;
     if (g->fniv) {
         type = choose_vector_type(g->opt_opc, g->vece, oprsz, g->prefer_i64);
     }
     switch (type) {
     case TCG_TYPE_V256:
         /* Recall that ARM SVE allows vector sizes that are not a
          * power of 2, but always a multiple of 16.  The intent is
          * that e.g. size == 80 would be expanded with 2x32 + 1x16.
          */
         some = QEMU_ALIGN_DOWN(oprsz, 32);
         expand_2_vec(g->vece, dofs, aofs, some, 32, TCG_TYPE_V256,
                      g->load_dest, g->fniv);
         if (some == oprsz) {
             break;
         }
         dofs += some;
         aofs += some;
         oprsz -= some;
         maxsz -= some;
-        /* fallthru */
+        fallthrough;
     case TCG_TYPE_V128:
         expand_2_vec(g->vece, dofs, aofs, oprsz, 16, TCG_TYPE_V128,
                      g->load_dest, g->fniv);
         break;
     case TCG_TYPE_V64:
         expand_2_vec(g->vece, dofs, aofs, oprsz, 8, TCG_TYPE_V64,
                      g->load_dest, g->fniv);
         break;
 
     case 0:
         if (g->fni8 && check_size_impl(oprsz, 8)) {
             expand_2_i64(dofs, aofs, oprsz, g->load_dest, g->fni8);
         } else if (g->fni4 && check_size_impl(oprsz, 4)) {
             expand_2_i32(dofs, aofs, oprsz, g->load_dest, g->fni4);
         } else {
             assert(g->fno != NULL);
             tcg_gen_gvec_2_ool(dofs, aofs, oprsz, maxsz, g->data, g->fno);
             oprsz = maxsz;
         }
         break;
 
     default:
         g_assert_not_reached();
     }
     tcg_swap_vecop_list(hold_list);
 
     if (oprsz < maxsz) {
         expand_clr(dofs + oprsz, maxsz - oprsz);
     }
 }
 
 /* Expand a vector operation with two vectors and an immediate.  */
 void tcg_gen_gvec_2i(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
                      uint32_t maxsz, int64_t c, const GVecGen2i *g)
 {
     const TCGOpcode *this_list = g->opt_opc ? : vecop_list_empty;
     const TCGOpcode *hold_list = tcg_swap_vecop_list(this_list);
     TCGType type;
     uint32_t some;
 
     check_size_align(oprsz, maxsz, dofs | aofs);
     check_overlap_2(dofs, aofs, maxsz);
 
     type = 0;
     if (g->fniv) {
         type = choose_vector_type(g->opt_opc, g->vece, oprsz, g->prefer_i64);
     }
     switch (type) {
     case TCG_TYPE_V256:
         /* Recall that ARM SVE allows vector sizes that are not a
          * power of 2, but always a multiple of 16.  The intent is
          * that e.g. size == 80 would be expanded with 2x32 + 1x16.
          */
         some = QEMU_ALIGN_DOWN(oprsz, 32);
         expand_2i_vec(g->vece, dofs, aofs, some, 32, TCG_TYPE_V256,
                       c, g->load_dest, g->fniv);
         if (some == oprsz) {
             break;
         }
         dofs += some;
         aofs += some;
         oprsz -= some;
         maxsz -= some;
-        /* fallthru */
+        fallthrough;
     case TCG_TYPE_V128:
         expand_2i_vec(g->vece, dofs, aofs, oprsz, 16, TCG_TYPE_V128,
                       c, g->load_dest, g->fniv);
         break;
     case TCG_TYPE_V64:
         expand_2i_vec(g->vece, dofs, aofs, oprsz, 8, TCG_TYPE_V64,
                       c, g->load_dest, g->fniv);
         break;
 
     case 0:
         if (g->fni8 && check_size_impl(oprsz, 8)) {
             expand_2i_i64(dofs, aofs, oprsz, c, g->load_dest, g->fni8);
         } else if (g->fni4 && check_size_impl(oprsz, 4)) {
             expand_2i_i32(dofs, aofs, oprsz, c, g->load_dest, g->fni4);
         } else {
             if (g->fno) {
                 tcg_gen_gvec_2_ool(dofs, aofs, oprsz, maxsz, c, g->fno);
             } else {
                 TCGv_i64 tcg_c = tcg_constant_i64(c);
                 tcg_gen_gvec_2i_ool(dofs, aofs, tcg_c, oprsz,
                                     maxsz, c, g->fnoi);
             }
             oprsz = maxsz;
         }
         break;
 
     default:
         g_assert_not_reached();
     }
     tcg_swap_vecop_list(hold_list);
 
     if (oprsz < maxsz) {
         expand_clr(dofs + oprsz, maxsz - oprsz);
     }
 }
 
 /* Expand a vector operation with two vectors and a scalar.  */
 void tcg_gen_gvec_2s(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
                      uint32_t maxsz, TCGv_i64 c, const GVecGen2s *g)
 {
     TCGType type;
 
     check_size_align(oprsz, maxsz, dofs | aofs);
     check_overlap_2(dofs, aofs, maxsz);
 
     type = 0;
     if (g->fniv) {
         type = choose_vector_type(g->opt_opc, g->vece, oprsz, g->prefer_i64);
     }
     if (type != 0) {
         const TCGOpcode *this_list = g->opt_opc ? : vecop_list_empty;
         const TCGOpcode *hold_list = tcg_swap_vecop_list(this_list);
         TCGv_vec t_vec = tcg_temp_new_vec(type);
         uint32_t some;
 
         tcg_gen_dup_i64_vec(g->vece, t_vec, c);
 
         switch (type) {
         case TCG_TYPE_V256:
             /* Recall that ARM SVE allows vector sizes that are not a
              * power of 2, but always a multiple of 16.  The intent is
              * that e.g. size == 80 would be expanded with 2x32 + 1x16.
              */
             some = QEMU_ALIGN_DOWN(oprsz, 32);
             expand_2s_vec(g->vece, dofs, aofs, some, 32, TCG_TYPE_V256,
                           t_vec, g->scalar_first, g->fniv);
             if (some == oprsz) {
                 break;
             }
             dofs += some;
             aofs += some;
             oprsz -= some;
             maxsz -= some;
-            /* fallthru */
+            fallthrough;
 
         case TCG_TYPE_V128:
             expand_2s_vec(g->vece, dofs, aofs, oprsz, 16, TCG_TYPE_V128,
                           t_vec, g->scalar_first, g->fniv);
             break;
 
         case TCG_TYPE_V64:
             expand_2s_vec(g->vece, dofs, aofs, oprsz, 8, TCG_TYPE_V64,
                           t_vec, g->scalar_first, g->fniv);
             break;
 
         default:
             g_assert_not_reached();
         }
         tcg_temp_free_vec(t_vec);
         tcg_swap_vecop_list(hold_list);
     } else if (g->fni8 && check_size_impl(oprsz, 8)) {
         TCGv_i64 t64 = tcg_temp_new_i64();
 
         tcg_gen_dup_i64(g->vece, t64, c);
         expand_2s_i64(dofs, aofs, oprsz, t64, g->scalar_first, g->fni8);
         tcg_temp_free_i64(t64);
     } else if (g->fni4 && check_size_impl(oprsz, 4)) {
         TCGv_i32 t32 = tcg_temp_new_i32();
 
         tcg_gen_extrl_i64_i32(t32, c);
         tcg_gen_dup_i32(g->vece, t32, t32);
         expand_2s_i32(dofs, aofs, oprsz, t32, g->scalar_first, g->fni4);
         tcg_temp_free_i32(t32);
     } else {
         tcg_gen_gvec_2i_ool(dofs, aofs, c, oprsz, maxsz, 0, g->fno);
         return;
     }
 
     if (oprsz < maxsz) {
         expand_clr(dofs + oprsz, maxsz - oprsz);
     }
 }
 
 /* Expand a vector three-operand operation.  */
 void tcg_gen_gvec_3(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                     uint32_t oprsz, uint32_t maxsz, const GVecGen3 *g)
 {
     const TCGOpcode *this_list = g->opt_opc ? : vecop_list_empty;
     const TCGOpcode *hold_list = tcg_swap_vecop_list(this_list);
     TCGType type;
     uint32_t some;
 
     check_size_align(oprsz, maxsz, dofs | aofs | bofs);
     check_overlap_3(dofs, aofs, bofs, maxsz);
 
     type = 0;
     if (g->fniv) {
         type = choose_vector_type(g->opt_opc, g->vece, oprsz, g->prefer_i64);
     }
     switch (type) {
     case TCG_TYPE_V256:
         /* Recall that ARM SVE allows vector sizes that are not a
          * power of 2, but always a multiple of 16.  The intent is
          * that e.g. size == 80 would be expanded with 2x32 + 1x16.
          */
         some = QEMU_ALIGN_DOWN(oprsz, 32);
         expand_3_vec(g->vece, dofs, aofs, bofs, some, 32, TCG_TYPE_V256,
                      g->load_dest, g->fniv);
         if (some == oprsz) {
             break;
         }
         dofs += some;
         aofs += some;
         bofs += some;
         oprsz -= some;
         maxsz -= some;
-        /* fallthru */
+        fallthrough;
     case TCG_TYPE_V128:
         expand_3_vec(g->vece, dofs, aofs, bofs, oprsz, 16, TCG_TYPE_V128,
                      g->load_dest, g->fniv);
         break;
     case TCG_TYPE_V64:
         expand_3_vec(g->vece, dofs, aofs, bofs, oprsz, 8, TCG_TYPE_V64,
                      g->load_dest, g->fniv);
         break;
 
     case 0:
         if (g->fni8 && check_size_impl(oprsz, 8)) {
             expand_3_i64(dofs, aofs, bofs, oprsz, g->load_dest, g->fni8);
         } else if (g->fni4 && check_size_impl(oprsz, 4)) {
             expand_3_i32(dofs, aofs, bofs, oprsz, g->load_dest, g->fni4);
         } else {
             assert(g->fno != NULL);
             tcg_gen_gvec_3_ool(dofs, aofs, bofs, oprsz,
                                maxsz, g->data, g->fno);
             oprsz = maxsz;
         }
         break;
 
     default:
         g_assert_not_reached();
     }
     tcg_swap_vecop_list(hold_list);
 
     if (oprsz < maxsz) {
         expand_clr(dofs + oprsz, maxsz - oprsz);
     }
 }
 
 /* Expand a vector operation with three vectors and an immediate.  */
 void tcg_gen_gvec_3i(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                      uint32_t oprsz, uint32_t maxsz, int64_t c,
                      const GVecGen3i *g)
 {
     const TCGOpcode *this_list = g->opt_opc ? : vecop_list_empty;
     const TCGOpcode *hold_list = tcg_swap_vecop_list(this_list);
     TCGType type;
     uint32_t some;
 
     check_size_align(oprsz, maxsz, dofs | aofs | bofs);
     check_overlap_3(dofs, aofs, bofs, maxsz);
 
     type = 0;
     if (g->fniv) {
         type = choose_vector_type(g->opt_opc, g->vece, oprsz, g->prefer_i64);
     }
     switch (type) {
     case TCG_TYPE_V256:
         /*
          * Recall that ARM SVE allows vector sizes that are not a
          * power of 2, but always a multiple of 16.  The intent is
          * that e.g. size == 80 would be expanded with 2x32 + 1x16.
          */
         some = QEMU_ALIGN_DOWN(oprsz, 32);
         expand_3i_vec(g->vece, dofs, aofs, bofs, some, 32, TCG_TYPE_V256,
                       c, g->load_dest, g->fniv);
         if (some == oprsz) {
             break;
         }
         dofs += some;
         aofs += some;
         bofs += some;
         oprsz -= some;
         maxsz -= some;
-        /* fallthru */
+        fallthrough;
     case TCG_TYPE_V128:
         expand_3i_vec(g->vece, dofs, aofs, bofs, oprsz, 16, TCG_TYPE_V128,
                       c, g->load_dest, g->fniv);
         break;
     case TCG_TYPE_V64:
         expand_3i_vec(g->vece, dofs, aofs, bofs, oprsz, 8, TCG_TYPE_V64,
                       c, g->load_dest, g->fniv);
         break;
 
     case 0:
         if (g->fni8 && check_size_impl(oprsz, 8)) {
             expand_3i_i64(dofs, aofs, bofs, oprsz, c, g->load_dest, g->fni8);
         } else if (g->fni4 && check_size_impl(oprsz, 4)) {
             expand_3i_i32(dofs, aofs, bofs, oprsz, c, g->load_dest, g->fni4);
         } else {
             assert(g->fno != NULL);
             tcg_gen_gvec_3_ool(dofs, aofs, bofs, oprsz, maxsz, c, g->fno);
             oprsz = maxsz;
         }
         break;
 
     default:
         g_assert_not_reached();
     }
     tcg_swap_vecop_list(hold_list);
 
     if (oprsz < maxsz) {
         expand_clr(dofs + oprsz, maxsz - oprsz);
     }
 }
 
 /* Expand a vector four-operand operation.  */
 void tcg_gen_gvec_4(uint32_t dofs, uint32_t aofs, uint32_t bofs, uint32_t cofs,
                     uint32_t oprsz, uint32_t maxsz, const GVecGen4 *g)
 {
     const TCGOpcode *this_list = g->opt_opc ? : vecop_list_empty;
     const TCGOpcode *hold_list = tcg_swap_vecop_list(this_list);
     TCGType type;
     uint32_t some;
 
     check_size_align(oprsz, maxsz, dofs | aofs | bofs | cofs);
     check_overlap_4(dofs, aofs, bofs, cofs, maxsz);
 
     type = 0;
     if (g->fniv) {
         type = choose_vector_type(g->opt_opc, g->vece, oprsz, g->prefer_i64);
     }
     switch (type) {
     case TCG_TYPE_V256:
         /* Recall that ARM SVE allows vector sizes that are not a
          * power of 2, but always a multiple of 16.  The intent is
          * that e.g. size == 80 would be expanded with 2x32 + 1x16.
          */
         some = QEMU_ALIGN_DOWN(oprsz, 32);
         expand_4_vec(g->vece, dofs, aofs, bofs, cofs, some,
                      32, TCG_TYPE_V256, g->write_aofs, g->fniv);
         if (some == oprsz) {
             break;
         }
         dofs += some;
         aofs += some;
         bofs += some;
         cofs += some;
         oprsz -= some;
         maxsz -= some;
-        /* fallthru */
+        fallthrough;
     case TCG_TYPE_V128:
         expand_4_vec(g->vece, dofs, aofs, bofs, cofs, oprsz,
                      16, TCG_TYPE_V128, g->write_aofs, g->fniv);
         break;
     case TCG_TYPE_V64:
         expand_4_vec(g->vece, dofs, aofs, bofs, cofs, oprsz,
                      8, TCG_TYPE_V64, g->write_aofs, g->fniv);
         break;
 
     case 0:
         if (g->fni8 && check_size_impl(oprsz, 8)) {
             expand_4_i64(dofs, aofs, bofs, cofs, oprsz,
                          g->write_aofs, g->fni8);
         } else if (g->fni4 && check_size_impl(oprsz, 4)) {
             expand_4_i32(dofs, aofs, bofs, cofs, oprsz,
                          g->write_aofs, g->fni4);
         } else {
             assert(g->fno != NULL);
             tcg_gen_gvec_4_ool(dofs, aofs, bofs, cofs,
                                oprsz, maxsz, g->data, g->fno);
             oprsz = maxsz;
         }
         break;
 
     default:
         g_assert_not_reached();
     }
     tcg_swap_vecop_list(hold_list);
 
     if (oprsz < maxsz) {
         expand_clr(dofs + oprsz, maxsz - oprsz);
     }
 }
 
 /* Expand a vector four-operand operation.  */
 void tcg_gen_gvec_4i(uint32_t dofs, uint32_t aofs, uint32_t bofs, uint32_t cofs,
                      uint32_t oprsz, uint32_t maxsz, int64_t c,
                      const GVecGen4i *g)
 {
     const TCGOpcode *this_list = g->opt_opc ? : vecop_list_empty;
     const TCGOpcode *hold_list = tcg_swap_vecop_list(this_list);
     TCGType type;
     uint32_t some;
 
     check_size_align(oprsz, maxsz, dofs | aofs | bofs | cofs);
     check_overlap_4(dofs, aofs, bofs, cofs, maxsz);
 
     type = 0;
     if (g->fniv) {
         type = choose_vector_type(g->opt_opc, g->vece, oprsz, g->prefer_i64);
     }
     switch (type) {
     case TCG_TYPE_V256:
         /*
          * Recall that ARM SVE allows vector sizes that are not a
          * power of 2, but always a multiple of 16.  The intent is
          * that e.g. size == 80 would be expanded with 2x32 + 1x16.
          */
         some = QEMU_ALIGN_DOWN(oprsz, 32);
         expand_4i_vec(g->vece, dofs, aofs, bofs, cofs, some,
                       32, TCG_TYPE_V256, c, g->fniv);
         if (some == oprsz) {
             break;
         }
         dofs += some;
         aofs += some;
         bofs += some;
         cofs += some;
         oprsz -= some;
         maxsz -= some;
-        /* fallthru */
+        fallthrough;
     case TCG_TYPE_V128:
         expand_4i_vec(g->vece, dofs, aofs, bofs, cofs, oprsz,
                        16, TCG_TYPE_V128, c, g->fniv);
         break;
     case TCG_TYPE_V64:
         expand_4i_vec(g->vece, dofs, aofs, bofs, cofs, oprsz,
                       8, TCG_TYPE_V64, c, g->fniv);
         break;
 
     case 0:
         if (g->fni8 && check_size_impl(oprsz, 8)) {
             expand_4i_i64(dofs, aofs, bofs, cofs, oprsz, c, g->fni8);
         } else if (g->fni4 && check_size_impl(oprsz, 4)) {
             expand_4i_i32(dofs, aofs, bofs, cofs, oprsz, c, g->fni4);
         } else {
             assert(g->fno != NULL);
             tcg_gen_gvec_4_ool(dofs, aofs, bofs, cofs,
                                oprsz, maxsz, c, g->fno);
             oprsz = maxsz;
         }
         break;
 
     default:
         g_assert_not_reached();
     }
     tcg_swap_vecop_list(hold_list);
 
     if (oprsz < maxsz) {
         expand_clr(dofs + oprsz, maxsz - oprsz);
     }
 }
 
 /*
  * Expand specific vector operations.
  */
@@ -3151,116 +3151,116 @@ static void
 do_gvec_shifts(unsigned vece, uint32_t dofs, uint32_t aofs, TCGv_i32 shift,
                uint32_t oprsz, uint32_t maxsz, const GVecGen2sh *g)
 {
     TCGType type;
     uint32_t some;
 
     check_size_align(oprsz, maxsz, dofs | aofs);
     check_overlap_2(dofs, aofs, maxsz);
 
     /* If the backend has a scalar expansion, great.  */
     type = choose_vector_type(g->s_list, vece, oprsz, vece == MO_64);
     if (type) {
         const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
         switch (type) {
         case TCG_TYPE_V256:
             some = QEMU_ALIGN_DOWN(oprsz, 32);
             expand_2sh_vec(vece, dofs, aofs, some, 32,
                            TCG_TYPE_V256, shift, g->fniv_s);
             if (some == oprsz) {
                 break;
             }
             dofs += some;
             aofs += some;
             oprsz -= some;
             maxsz -= some;
-            /* fallthru */
+            fallthrough;
         case TCG_TYPE_V128:
             expand_2sh_vec(vece, dofs, aofs, oprsz, 16,
                            TCG_TYPE_V128, shift, g->fniv_s);
             break;
         case TCG_TYPE_V64:
             expand_2sh_vec(vece, dofs, aofs, oprsz, 8,
                            TCG_TYPE_V64, shift, g->fniv_s);
             break;
         default:
             g_assert_not_reached();
         }
         tcg_swap_vecop_list(hold_list);
         goto clear_tail;
     }
 
     /* If the backend supports variable vector shifts, also cool.  */
     type = choose_vector_type(g->v_list, vece, oprsz, vece == MO_64);
     if (type) {
         const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
         TCGv_vec v_shift = tcg_temp_new_vec(type);
 
         if (vece == MO_64) {
             TCGv_i64 sh64 = tcg_temp_ebb_new_i64();
             tcg_gen_extu_i32_i64(sh64, shift);
             tcg_gen_dup_i64_vec(MO_64, v_shift, sh64);
             tcg_temp_free_i64(sh64);
         } else {
             tcg_gen_dup_i32_vec(vece, v_shift, shift);
         }
 
         switch (type) {
         case TCG_TYPE_V256:
             some = QEMU_ALIGN_DOWN(oprsz, 32);
             expand_2s_vec(vece, dofs, aofs, some, 32, TCG_TYPE_V256,
                           v_shift, false, g->fniv_v);
             if (some == oprsz) {
                 break;
             }
             dofs += some;
             aofs += some;
             oprsz -= some;
             maxsz -= some;
-            /* fallthru */
+            fallthrough;
         case TCG_TYPE_V128:
             expand_2s_vec(vece, dofs, aofs, oprsz, 16, TCG_TYPE_V128,
                           v_shift, false, g->fniv_v);
             break;
         case TCG_TYPE_V64:
             expand_2s_vec(vece, dofs, aofs, oprsz, 8, TCG_TYPE_V64,
                           v_shift, false, g->fniv_v);
             break;
         default:
             g_assert_not_reached();
         }
         tcg_temp_free_vec(v_shift);
         tcg_swap_vecop_list(hold_list);
         goto clear_tail;
     }
 
     /* Otherwise fall back to integral... */
     if (vece == MO_32 && check_size_impl(oprsz, 4)) {
         expand_2s_i32(dofs, aofs, oprsz, shift, false, g->fni4);
     } else if (vece == MO_64 && check_size_impl(oprsz, 8)) {
         TCGv_i64 sh64 = tcg_temp_ebb_new_i64();
         tcg_gen_extu_i32_i64(sh64, shift);
         expand_2s_i64(dofs, aofs, oprsz, sh64, false, g->fni8);
         tcg_temp_free_i64(sh64);
     } else {
         TCGv_ptr a0 = tcg_temp_ebb_new_ptr();
         TCGv_ptr a1 = tcg_temp_ebb_new_ptr();
         TCGv_i32 desc = tcg_temp_ebb_new_i32();
 
         tcg_gen_shli_i32(desc, shift, SIMD_DATA_SHIFT);
         tcg_gen_ori_i32(desc, desc, simd_desc(oprsz, maxsz, 0));
         tcg_gen_addi_ptr(a0, tcg_env, dofs);
         tcg_gen_addi_ptr(a1, tcg_env, aofs);
 
         g->fno[vece](a0, a1, desc);
 
         tcg_temp_free_ptr(a0);
         tcg_temp_free_ptr(a1);
         tcg_temp_free_i32(desc);
         return;
     }
 
  clear_tail:
     if (oprsz < maxsz) {
         expand_clr(dofs + oprsz, maxsz - oprsz);
     }
 }
@@ -3737,111 +3737,111 @@ static void expand_cmp_vec(unsigned vece, uint32_t dofs, uint32_t aofs,
 void tcg_gen_gvec_cmp(TCGCond cond, unsigned vece, uint32_t dofs,
                       uint32_t aofs, uint32_t bofs,
                       uint32_t oprsz, uint32_t maxsz)
 {
     static const TCGOpcode cmp_list[] = { INDEX_op_cmp_vec, 0 };
     static gen_helper_gvec_3 * const eq_fn[4] = {
         gen_helper_gvec_eq8, gen_helper_gvec_eq16,
         gen_helper_gvec_eq32, gen_helper_gvec_eq64
     };
     static gen_helper_gvec_3 * const ne_fn[4] = {
         gen_helper_gvec_ne8, gen_helper_gvec_ne16,
         gen_helper_gvec_ne32, gen_helper_gvec_ne64
     };
     static gen_helper_gvec_3 * const lt_fn[4] = {
         gen_helper_gvec_lt8, gen_helper_gvec_lt16,
         gen_helper_gvec_lt32, gen_helper_gvec_lt64
     };
     static gen_helper_gvec_3 * const le_fn[4] = {
         gen_helper_gvec_le8, gen_helper_gvec_le16,
         gen_helper_gvec_le32, gen_helper_gvec_le64
     };
     static gen_helper_gvec_3 * const ltu_fn[4] = {
         gen_helper_gvec_ltu8, gen_helper_gvec_ltu16,
         gen_helper_gvec_ltu32, gen_helper_gvec_ltu64
     };
     static gen_helper_gvec_3 * const leu_fn[4] = {
         gen_helper_gvec_leu8, gen_helper_gvec_leu16,
         gen_helper_gvec_leu32, gen_helper_gvec_leu64
     };
     static gen_helper_gvec_3 * const * const fns[16] = {
         [TCG_COND_EQ] = eq_fn,
         [TCG_COND_NE] = ne_fn,
         [TCG_COND_LT] = lt_fn,
         [TCG_COND_LE] = le_fn,
         [TCG_COND_LTU] = ltu_fn,
         [TCG_COND_LEU] = leu_fn,
     };
 
     const TCGOpcode *hold_list;
     TCGType type;
     uint32_t some;
 
     check_size_align(oprsz, maxsz, dofs | aofs | bofs);
     check_overlap_3(dofs, aofs, bofs, maxsz);
 
     if (cond == TCG_COND_NEVER || cond == TCG_COND_ALWAYS) {
         do_dup(MO_8, dofs, oprsz, maxsz,
                NULL, NULL, -(cond == TCG_COND_ALWAYS));
         return;
     }
 
     /*
      * Implement inline with a vector type, if possible.
      * Prefer integer when 64-bit host and 64-bit comparison.
      */
     hold_list = tcg_swap_vecop_list(cmp_list);
     type = choose_vector_type(cmp_list, vece, oprsz,
                               TCG_TARGET_REG_BITS == 64 && vece == MO_64);
     switch (type) {
     case TCG_TYPE_V256:
         /* Recall that ARM SVE allows vector sizes that are not a
          * power of 2, but always a multiple of 16.  The intent is
          * that e.g. size == 80 would be expanded with 2x32 + 1x16.
          */
         some = QEMU_ALIGN_DOWN(oprsz, 32);
         expand_cmp_vec(vece, dofs, aofs, bofs, some, 32, TCG_TYPE_V256, cond);
         if (some == oprsz) {
             break;
         }
         dofs += some;
         aofs += some;
         bofs += some;
         oprsz -= some;
         maxsz -= some;
-        /* fallthru */
+        fallthrough;
     case TCG_TYPE_V128:
         expand_cmp_vec(vece, dofs, aofs, bofs, oprsz, 16, TCG_TYPE_V128, cond);
         break;
     case TCG_TYPE_V64:
         expand_cmp_vec(vece, dofs, aofs, bofs, oprsz, 8, TCG_TYPE_V64, cond);
         break;
 
     case 0:
         if (vece == MO_64 && check_size_impl(oprsz, 8)) {
             expand_cmp_i64(dofs, aofs, bofs, oprsz, cond);
         } else if (vece == MO_32 && check_size_impl(oprsz, 4)) {
             expand_cmp_i32(dofs, aofs, bofs, oprsz, cond);
         } else {
             gen_helper_gvec_3 * const *fn = fns[cond];
 
             if (fn == NULL) {
                 uint32_t tmp;
                 tmp = aofs, aofs = bofs, bofs = tmp;
                 cond = tcg_swap_cond(cond);
                 fn = fns[cond];
                 assert(fn != NULL);
             }
             tcg_gen_gvec_3_ool(dofs, aofs, bofs, oprsz, maxsz, 0, fn[vece]);
             oprsz = maxsz;
         }
         break;
 
     default:
         g_assert_not_reached();
     }
     tcg_swap_vecop_list(hold_list);
 
     if (oprsz < maxsz) {
         expand_clr(dofs + oprsz, maxsz - oprsz);
     }
 }
@@ -3864,125 +3864,125 @@ static void expand_cmps_vec(unsigned vece, uint32_t dofs, uint32_t aofs,
 void tcg_gen_gvec_cmps(TCGCond cond, unsigned vece, uint32_t dofs,
                        uint32_t aofs, TCGv_i64 c,
                        uint32_t oprsz, uint32_t maxsz)
 {
     static const TCGOpcode cmp_list[] = { INDEX_op_cmp_vec, 0 };
     static gen_helper_gvec_2i * const eq_fn[4] = {
         gen_helper_gvec_eqs8, gen_helper_gvec_eqs16,
         gen_helper_gvec_eqs32, gen_helper_gvec_eqs64
     };
     static gen_helper_gvec_2i * const lt_fn[4] = {
         gen_helper_gvec_lts8, gen_helper_gvec_lts16,
         gen_helper_gvec_lts32, gen_helper_gvec_lts64
     };
     static gen_helper_gvec_2i * const le_fn[4] = {
         gen_helper_gvec_les8, gen_helper_gvec_les16,
         gen_helper_gvec_les32, gen_helper_gvec_les64
     };
     static gen_helper_gvec_2i * const ltu_fn[4] = {
         gen_helper_gvec_ltus8, gen_helper_gvec_ltus16,
         gen_helper_gvec_ltus32, gen_helper_gvec_ltus64
     };
     static gen_helper_gvec_2i * const leu_fn[4] = {
         gen_helper_gvec_leus8, gen_helper_gvec_leus16,
         gen_helper_gvec_leus32, gen_helper_gvec_leus64
     };
     static gen_helper_gvec_2i * const * const fns[16] = {
         [TCG_COND_EQ] = eq_fn,
         [TCG_COND_LT] = lt_fn,
         [TCG_COND_LE] = le_fn,
         [TCG_COND_LTU] = ltu_fn,
         [TCG_COND_LEU] = leu_fn,
     };
 
     TCGType type;
 
     check_size_align(oprsz, maxsz, dofs | aofs);
     check_overlap_2(dofs, aofs, maxsz);
 
     if (cond == TCG_COND_NEVER || cond == TCG_COND_ALWAYS) {
         do_dup(MO_8, dofs, oprsz, maxsz,
                NULL, NULL, -(cond == TCG_COND_ALWAYS));
         return;
     }
 
     /*
      * Implement inline with a vector type, if possible.
      * Prefer integer when 64-bit host and 64-bit comparison.
      */
     type = choose_vector_type(cmp_list, vece, oprsz,
                               TCG_TARGET_REG_BITS == 64 && vece == MO_64);
     if (type != 0) {
         const TCGOpcode *hold_list = tcg_swap_vecop_list(cmp_list);
         TCGv_vec t_vec = tcg_temp_new_vec(type);
         uint32_t some;
 
         tcg_gen_dup_i64_vec(vece, t_vec, c);
         switch (type) {
         case TCG_TYPE_V256:
             some = QEMU_ALIGN_DOWN(oprsz, 32);
             expand_cmps_vec(vece, dofs, aofs, some, 32,
                             TCG_TYPE_V256, cond, t_vec);
             aofs += some;
             dofs += some;
             oprsz -= some;
             maxsz -= some;
-            /* fallthru */
+            fallthrough;
 
         case TCG_TYPE_V128:
             some = QEMU_ALIGN_DOWN(oprsz, 16);
             expand_cmps_vec(vece, dofs, aofs, some, 16,
                             TCG_TYPE_V128, cond, t_vec);
             break;
 
         case TCG_TYPE_V64:
             some = QEMU_ALIGN_DOWN(oprsz, 8);
             expand_cmps_vec(vece, dofs, aofs, some, 8,
                             TCG_TYPE_V64, cond, t_vec);
             break;
 
         default:
             g_assert_not_reached();
         }
         tcg_temp_free_vec(t_vec);
         tcg_swap_vecop_list(hold_list);
     } else if (vece == MO_64 && check_size_impl(oprsz, 8)) {
         TCGv_i64 t0 = tcg_temp_ebb_new_i64();
         uint32_t i;
 
         for (i = 0; i < oprsz; i += 8) {
             tcg_gen_ld_i64(t0, tcg_env, aofs + i);
             tcg_gen_negsetcond_i64(cond, t0, t0, c);
             tcg_gen_st_i64(t0, tcg_env, dofs + i);
         }
         tcg_temp_free_i64(t0);
     } else if (vece == MO_32 && check_size_impl(oprsz, 4)) {
         TCGv_i32 t0 = tcg_temp_ebb_new_i32();
         TCGv_i32 t1 = tcg_temp_ebb_new_i32();
         uint32_t i;
 
         tcg_gen_extrl_i64_i32(t1, c);
         for (i = 0; i < oprsz; i += 8) {
             tcg_gen_ld_i32(t0, tcg_env, aofs + i);
             tcg_gen_negsetcond_i32(cond, t0, t0, t1);
             tcg_gen_st_i32(t0, tcg_env, dofs + i);
         }
         tcg_temp_free_i32(t0);
         tcg_temp_free_i32(t1);
     } else {
         gen_helper_gvec_2i * const *fn = fns[cond];
         bool inv = false;
 
         if (fn == NULL) {
             cond = tcg_invert_cond(cond);
             fn = fns[cond];
             assert(fn != NULL);
             inv = true;
         }
         tcg_gen_gvec_2i_ool(dofs, aofs, c, oprsz, maxsz, inv, fn[vece]);
         return;
     }
 
     if (oprsz < maxsz) {
         expand_clr(dofs + oprsz, maxsz - oprsz);
     }
 }
diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
index df4f22c427..5ad51c8cb8 100644
--- a/tcg/tcg-op-ldst.c
+++ b/tcg/tcg-op-ldst.c
@@ -46,36 +46,36 @@ static void check_max_alignment(unsigned a_bits)
 static MemOp tcg_canonicalize_memop(MemOp op, bool is64, bool st)
 {
     unsigned a_bits = get_alignment_bits(op);
 
     check_max_alignment(a_bits);
 
     /* Prefer MO_ALIGN+MO_XX over MO_ALIGN_XX+MO_XX */
     if (a_bits == (op & MO_SIZE)) {
         op = (op & ~MO_AMASK) | MO_ALIGN;
     }
 
     switch (op & MO_SIZE) {
     case MO_8:
         op &= ~MO_BSWAP;
         break;
     case MO_16:
         break;
     case MO_32:
         if (!is64) {
             op &= ~MO_SIGN;
         }
         break;
     case MO_64:
         if (is64) {
             op &= ~MO_SIGN;
             break;
         }
-        /* fall through */
+        fallthrough;
     default:
         g_assert_not_reached();
     }
     if (st) {
         op &= ~MO_SIGN;
     }
     return op;
 }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 637b9e6870..84e74badcf 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1,64 +1,65 @@
 /*
  * Tiny Code Generator for QEMU
  *
  * Copyright (c) 2008 Fabrice Bellard
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
  * in the Software without restriction, including without limitation the rights
  * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  * copies of the Software, and to permit persons to whom the Software is
  * furnished to do so, subject to the following conditions:
  *
  * The above copyright notice and this permission notice shall be included in
  * all copies or substantial portions of the Software.
  *
  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
 
 #include "qemu/osdep.h"
+#include "qemu/compiler.h"
 
 /* Define to jump the ELF file used to communicate with GDB.  */
 #undef DEBUG_JIT
 
 #include "qemu/error-report.h"
 #include "qemu/cutils.h"
 #include "qemu/host-utils.h"
 #include "qemu/qemu-print.h"
 #include "qemu/cacheflush.h"
 #include "qemu/cacheinfo.h"
 #include "qemu/timer.h"
 #include "exec/translation-block.h"
 #include "exec/tlb-common.h"
 #include "tcg/startup.h"
 #include "tcg/tcg-op-common.h"
 
 #if UINTPTR_MAX == UINT32_MAX
 # define ELF_CLASS  ELFCLASS32
 #else
 # define ELF_CLASS  ELFCLASS64
 #endif
 #if HOST_BIG_ENDIAN
 # define ELF_DATA   ELFDATA2MSB
 #else
 # define ELF_DATA   ELFDATA2LSB
 #endif
 
 #include "elf.h"
 #include "exec/log.h"
 #include "tcg/tcg-ldst.h"
 #include "tcg/tcg-temp-internal.h"
 #include "tcg-internal.h"
 #include "accel/tcg/perf.h"
 #ifdef CONFIG_USER_ONLY
 #include "exec/user/guest-base.h"
 #endif
 
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
@@ -1106,180 +1107,180 @@ static void layout_arg_by_ref(TCGCumulativeArgs *cum, TCGHelperInfo *info)
 static void init_call_layout(TCGHelperInfo *info)
 {
     int max_reg_slots = ARRAY_SIZE(tcg_target_call_iarg_regs);
     int max_stk_slots = TCG_STATIC_CALL_ARGS_SIZE / sizeof(tcg_target_long);
     unsigned typemask = info->typemask;
     unsigned typecode;
     TCGCumulativeArgs cum = { };
 
     /*
      * Parse and place any function return value.
      */
     typecode = typemask & 7;
     switch (typecode) {
     case dh_typecode_void:
         info->nr_out = 0;
         break;
     case dh_typecode_i32:
     case dh_typecode_s32:
     case dh_typecode_ptr:
         info->nr_out = 1;
         info->out_kind = TCG_CALL_RET_NORMAL;
         break;
     case dh_typecode_i64:
     case dh_typecode_s64:
         info->nr_out = 64 / TCG_TARGET_REG_BITS;
         info->out_kind = TCG_CALL_RET_NORMAL;
         /* Query the last register now to trigger any assert early. */
         tcg_target_call_oarg_reg(info->out_kind, info->nr_out - 1);
         break;
     case dh_typecode_i128:
         info->nr_out = 128 / TCG_TARGET_REG_BITS;
         info->out_kind = TCG_TARGET_CALL_RET_I128;
         switch (TCG_TARGET_CALL_RET_I128) {
         case TCG_CALL_RET_NORMAL:
             /* Query the last register now to trigger any assert early. */
             tcg_target_call_oarg_reg(info->out_kind, info->nr_out - 1);
             break;
         case TCG_CALL_RET_BY_VEC:
             /* Query the single register now to trigger any assert early. */
             tcg_target_call_oarg_reg(TCG_CALL_RET_BY_VEC, 0);
             break;
         case TCG_CALL_RET_BY_REF:
             /*
              * Allocate the first argument to the output.
              * We don't need to store this anywhere, just make it
              * unavailable for use in the input loop below.
              */
             cum.arg_slot = 1;
             break;
         default:
             qemu_build_not_reached();
         }
         break;
     default:
         g_assert_not_reached();
     }
 
     /*
      * Parse and place function arguments.
      */
     for (typemask >>= 3; typemask; typemask >>= 3, cum.arg_idx++) {
         TCGCallArgumentKind kind;
         TCGType type;
 
         typecode = typemask & 7;
         switch (typecode) {
         case dh_typecode_i32:
         case dh_typecode_s32:
             type = TCG_TYPE_I32;
             break;
         case dh_typecode_i64:
         case dh_typecode_s64:
             type = TCG_TYPE_I64;
             break;
         case dh_typecode_ptr:
             type = TCG_TYPE_PTR;
             break;
         case dh_typecode_i128:
             type = TCG_TYPE_I128;
             break;
         default:
             g_assert_not_reached();
         }
 
         switch (type) {
         case TCG_TYPE_I32:
             switch (TCG_TARGET_CALL_ARG_I32) {
             case TCG_CALL_ARG_EVEN:
                 layout_arg_even(&cum);
-                /* fall through */
+                fallthrough;
             case TCG_CALL_ARG_NORMAL:
                 layout_arg_1(&cum, info, TCG_CALL_ARG_NORMAL);
                 break;
             case TCG_CALL_ARG_EXTEND:
                 kind = TCG_CALL_ARG_EXTEND_U + (typecode & 1);
                 layout_arg_1(&cum, info, kind);
                 break;
             default:
                 qemu_build_not_reached();
             }
             break;
 
         case TCG_TYPE_I64:
             switch (TCG_TARGET_CALL_ARG_I64) {
             case TCG_CALL_ARG_EVEN:
                 layout_arg_even(&cum);
-                /* fall through */
+                fallthrough;
             case TCG_CALL_ARG_NORMAL:
                 if (TCG_TARGET_REG_BITS == 32) {
                     layout_arg_normal_n(&cum, info, 2);
                 } else {
                     layout_arg_1(&cum, info, TCG_CALL_ARG_NORMAL);
                 }
                 break;
             default:
                 qemu_build_not_reached();
             }
             break;
 
         case TCG_TYPE_I128:
             switch (TCG_TARGET_CALL_ARG_I128) {
             case TCG_CALL_ARG_EVEN:
                 layout_arg_even(&cum);
-                /* fall through */
+                fallthrough;
             case TCG_CALL_ARG_NORMAL:
                 layout_arg_normal_n(&cum, info, 128 / TCG_TARGET_REG_BITS);
                 break;
             case TCG_CALL_ARG_BY_REF:
                 layout_arg_by_ref(&cum, info);
                 break;
             default:
                 qemu_build_not_reached();
             }
             break;
 
         default:
             g_assert_not_reached();
         }
     }
     info->nr_in = cum.info_in_idx;
 
     /* Validate that we didn't overrun the input array. */
     assert(cum.info_in_idx <= ARRAY_SIZE(info->in));
     /* Validate the backend has enough argument space. */
     assert(cum.arg_slot <= max_reg_slots + max_stk_slots);
 
     /*
      * Relocate the "ref_slot" area to the end of the parameters.
      * Minimizing this stack offset helps code size for x86,
      * which has a signed 8-bit offset encoding.
      */
     if (cum.ref_slot != 0) {
         int ref_base = 0;
 
         if (cum.arg_slot > max_reg_slots) {
             int align = __alignof(Int128) / sizeof(tcg_target_long);
 
             ref_base = cum.arg_slot - max_reg_slots;
             if (align > 1) {
                 ref_base = ROUND_UP(ref_base, align);
             }
         }
         assert(ref_base + cum.ref_slot <= max_stk_slots);
         ref_base += max_reg_slots;
 
         if (ref_base != 0) {
             for (int i = cum.info_in_idx - 1; i >= 0; --i) {
                 TCGCallArgumentLoc *loc = &info->in[i];
                 switch (loc->kind) {
                 case TCG_CALL_ARG_BY_REF:
                 case TCG_CALL_ARG_BY_REF_N:
                     loc->ref_slot += ref_base;
                     break;
                 default:
                     break;
                 }
             }
         }
     }
 }
@@ -2283,31 +2284,31 @@ void tcg_gen_call7(TCGHelperInfo *info, TCGTemp *ret, TCGTemp *t1,
 static void tcg_reg_alloc_start(TCGContext *s)
 {
     int i, n;
 
     for (i = 0, n = s->nb_temps; i < n; i++) {
         TCGTemp *ts = &s->temps[i];
         TCGTempVal val = TEMP_VAL_MEM;
 
         switch (ts->kind) {
         case TEMP_CONST:
             val = TEMP_VAL_CONST;
             break;
         case TEMP_FIXED:
             val = TEMP_VAL_REG;
             break;
         case TEMP_GLOBAL:
             break;
         case TEMP_EBB:
             val = TEMP_VAL_DEAD;
-            /* fall through */
+            fallthrough;
         case TEMP_TB:
             ts->mem_allocated = 0;
             break;
         default:
             g_assert_not_reached();
         }
         ts->val_type = val;
     }
 
     memset(s->reg_to_temp, 0, sizeof(s->reg_to_temp));
 }
@@ -3456,340 +3457,340 @@ static void __attribute__((noinline))
 liveness_pass_1(TCGContext *s)
 {
     int nb_globals = s->nb_globals;
     int nb_temps = s->nb_temps;
     TCGOp *op, *op_prev;
     TCGRegSet *prefs;
     int i;
 
     prefs = tcg_malloc(sizeof(TCGRegSet) * nb_temps);
     for (i = 0; i < nb_temps; ++i) {
         s->temps[i].state_ptr = prefs + i;
     }
 
     /* ??? Should be redundant with the exit_tb that ends the TB.  */
     la_func_end(s, nb_globals, nb_temps);
 
     QTAILQ_FOREACH_REVERSE_SAFE(op, &s->ops, link, op_prev) {
         int nb_iargs, nb_oargs;
         TCGOpcode opc_new, opc_new2;
         bool have_opc_new2;
         TCGLifeData arg_life = 0;
         TCGTemp *ts;
         TCGOpcode opc = op->opc;
         const TCGOpDef *def = &tcg_op_defs[opc];
 
         switch (opc) {
         case INDEX_op_call:
             {
                 const TCGHelperInfo *info = tcg_call_info(op);
                 int call_flags = tcg_call_flags(op);
 
                 nb_oargs = TCGOP_CALLO(op);
                 nb_iargs = TCGOP_CALLI(op);
 
                 /* pure functions can be removed if their result is unused */
                 if (call_flags & TCG_CALL_NO_SIDE_EFFECTS) {
                     for (i = 0; i < nb_oargs; i++) {
                         ts = arg_temp(op->args[i]);
                         if (ts->state != TS_DEAD) {
                             goto do_not_remove_call;
                         }
                     }
                     goto do_remove;
                 }
             do_not_remove_call:
 
                 /* Output args are dead.  */
                 for (i = 0; i < nb_oargs; i++) {
                     ts = arg_temp(op->args[i]);
                     if (ts->state & TS_DEAD) {
                         arg_life |= DEAD_ARG << i;
                     }
                     if (ts->state & TS_MEM) {
                         arg_life |= SYNC_ARG << i;
                     }
                     ts->state = TS_DEAD;
                     la_reset_pref(ts);
                 }
 
                 /* Not used -- it will be tcg_target_call_oarg_reg().  */
                 memset(op->output_pref, 0, sizeof(op->output_pref));
 
                 if (!(call_flags & (TCG_CALL_NO_WRITE_GLOBALS |
                                     TCG_CALL_NO_READ_GLOBALS))) {
                     la_global_kill(s, nb_globals);
                 } else if (!(call_flags & TCG_CALL_NO_READ_GLOBALS)) {
                     la_global_sync(s, nb_globals);
                 }
 
                 /* Record arguments that die in this helper.  */
                 for (i = nb_oargs; i < nb_iargs + nb_oargs; i++) {
                     ts = arg_temp(op->args[i]);
                     if (ts->state & TS_DEAD) {
                         arg_life |= DEAD_ARG << i;
                     }
                 }
 
                 /* For all live registers, remove call-clobbered prefs.  */
                 la_cross_call(s, nb_temps);
 
                 /*
                  * Input arguments are live for preceding opcodes.
                  *
                  * For those arguments that die, and will be allocated in
                  * registers, clear the register set for that arg, to be
                  * filled in below.  For args that will be on the stack,
                  * reset to any available reg.  Process arguments in reverse
                  * order so that if a temp is used more than once, the stack
                  * reset to max happens before the register reset to 0.
                  */
                 for (i = nb_iargs - 1; i >= 0; i--) {
                     const TCGCallArgumentLoc *loc = &info->in[i];
                     ts = arg_temp(op->args[nb_oargs + i]);
 
                     if (ts->state & TS_DEAD) {
                         switch (loc->kind) {
                         case TCG_CALL_ARG_NORMAL:
                         case TCG_CALL_ARG_EXTEND_U:
                         case TCG_CALL_ARG_EXTEND_S:
                             if (arg_slot_reg_p(loc->arg_slot)) {
                                 *la_temp_pref(ts) = 0;
                                 break;
                             }
-                            /* fall through */
+                            fallthrough;
                         default:
                             *la_temp_pref(ts) =
                                 tcg_target_available_regs[ts->type];
                             break;
                         }
                         ts->state &= ~TS_DEAD;
                     }
                 }
 
                 /*
                  * For each input argument, add its input register to prefs.
                  * If a temp is used once, this produces a single set bit;
                  * if a temp is used multiple times, this produces a set.
                  */
                 for (i = 0; i < nb_iargs; i++) {
                     const TCGCallArgumentLoc *loc = &info->in[i];
                     ts = arg_temp(op->args[nb_oargs + i]);
 
                     switch (loc->kind) {
                     case TCG_CALL_ARG_NORMAL:
                     case TCG_CALL_ARG_EXTEND_U:
                     case TCG_CALL_ARG_EXTEND_S:
                         if (arg_slot_reg_p(loc->arg_slot)) {
                             tcg_regset_set_reg(*la_temp_pref(ts),
                                 tcg_target_call_iarg_regs[loc->arg_slot]);
                         }
                         break;
                     default:
                         break;
                     }
                 }
             }
             break;
         case INDEX_op_insn_start:
             break;
         case INDEX_op_discard:
             /* mark the temporary as dead */
             ts = arg_temp(op->args[0]);
             ts->state = TS_DEAD;
             la_reset_pref(ts);
             break;
 
         case INDEX_op_add2_i32:
             opc_new = INDEX_op_add_i32;
             goto do_addsub2;
         case INDEX_op_sub2_i32:
             opc_new = INDEX_op_sub_i32;
             goto do_addsub2;
         case INDEX_op_add2_i64:
             opc_new = INDEX_op_add_i64;
             goto do_addsub2;
         case INDEX_op_sub2_i64:
             opc_new = INDEX_op_sub_i64;
         do_addsub2:
             nb_iargs = 4;
             nb_oargs = 2;
             /* Test if the high part of the operation is dead, but not
                the low part.  The result can be optimized to a simple
                add or sub.  This happens often for x86_64 guest when the
                cpu mode is set to 32 bit.  */
             if (arg_temp(op->args[1])->state == TS_DEAD) {
                 if (arg_temp(op->args[0])->state == TS_DEAD) {
                     goto do_remove;
                 }
                 /* Replace the opcode and adjust the args in place,
                    leaving 3 unused args at the end.  */
                 op->opc = opc = opc_new;
                 op->args[1] = op->args[2];
                 op->args[2] = op->args[4];
                 /* Fall through and mark the single-word operation live.  */
                 nb_iargs = 2;
                 nb_oargs = 1;
             }
             goto do_not_remove;
 
         case INDEX_op_mulu2_i32:
             opc_new = INDEX_op_mul_i32;
             opc_new2 = INDEX_op_muluh_i32;
             have_opc_new2 = TCG_TARGET_HAS_muluh_i32;
             goto do_mul2;
         case INDEX_op_muls2_i32:
             opc_new = INDEX_op_mul_i32;
             opc_new2 = INDEX_op_mulsh_i32;
             have_opc_new2 = TCG_TARGET_HAS_mulsh_i32;
             goto do_mul2;
         case INDEX_op_mulu2_i64:
             opc_new = INDEX_op_mul_i64;
             opc_new2 = INDEX_op_muluh_i64;
             have_opc_new2 = TCG_TARGET_HAS_muluh_i64;
             goto do_mul2;
         case INDEX_op_muls2_i64:
             opc_new = INDEX_op_mul_i64;
             opc_new2 = INDEX_op_mulsh_i64;
             have_opc_new2 = TCG_TARGET_HAS_mulsh_i64;
             goto do_mul2;
         do_mul2:
             nb_iargs = 2;
             nb_oargs = 2;
             if (arg_temp(op->args[1])->state == TS_DEAD) {
                 if (arg_temp(op->args[0])->state == TS_DEAD) {
                     /* Both parts of the operation are dead.  */
                     goto do_remove;
                 }
                 /* The high part of the operation is dead; generate the low. */
                 op->opc = opc = opc_new;
                 op->args[1] = op->args[2];
                 op->args[2] = op->args[3];
             } else if (arg_temp(op->args[0])->state == TS_DEAD && have_opc_new2) {
                 /* The low part of the operation is dead; generate the high. */
                 op->opc = opc = opc_new2;
                 op->args[0] = op->args[1];
                 op->args[1] = op->args[2];
                 op->args[2] = op->args[3];
             } else {
                 goto do_not_remove;
             }
             /* Mark the single-word operation live.  */
             nb_oargs = 1;
             goto do_not_remove;
 
         default:
             /* XXX: optimize by hardcoding common cases (e.g. triadic ops) */
             nb_iargs = def->nb_iargs;
             nb_oargs = def->nb_oargs;
 
             /* Test if the operation can be removed because all
                its outputs are dead. We assume that nb_oargs == 0
                implies side effects */
             if (!(def->flags & TCG_OPF_SIDE_EFFECTS) && nb_oargs != 0) {
                 for (i = 0; i < nb_oargs; i++) {
                     if (arg_temp(op->args[i])->state != TS_DEAD) {
                         goto do_not_remove;
                     }
                 }
                 goto do_remove;
             }
             goto do_not_remove;
 
         do_remove:
             tcg_op_remove(s, op);
             break;
 
         do_not_remove:
             for (i = 0; i < nb_oargs; i++) {
                 ts = arg_temp(op->args[i]);
 
                 /* Remember the preference of the uses that followed.  */
                 if (i < ARRAY_SIZE(op->output_pref)) {
                     op->output_pref[i] = *la_temp_pref(ts);
                 }
 
                 /* Output args are dead.  */
                 if (ts->state & TS_DEAD) {
                     arg_life |= DEAD_ARG << i;
                 }
                 if (ts->state & TS_MEM) {
                     arg_life |= SYNC_ARG << i;
                 }
                 ts->state = TS_DEAD;
                 la_reset_pref(ts);
             }
 
             /* If end of basic block, update.  */
             if (def->flags & TCG_OPF_BB_EXIT) {
                 la_func_end(s, nb_globals, nb_temps);
             } else if (def->flags & TCG_OPF_COND_BRANCH) {
                 la_bb_sync(s, nb_globals, nb_temps);
             } else if (def->flags & TCG_OPF_BB_END) {
                 la_bb_end(s, nb_globals, nb_temps);
             } else if (def->flags & TCG_OPF_SIDE_EFFECTS) {
                 la_global_sync(s, nb_globals);
                 if (def->flags & TCG_OPF_CALL_CLOBBER) {
                     la_cross_call(s, nb_temps);
                 }
             }
 
             /* Record arguments that die in this opcode.  */
             for (i = nb_oargs; i < nb_oargs + nb_iargs; i++) {
                 ts = arg_temp(op->args[i]);
                 if (ts->state & TS_DEAD) {
                     arg_life |= DEAD_ARG << i;
                 }
             }
 
             /* Input arguments are live for preceding opcodes.  */
             for (i = nb_oargs; i < nb_oargs + nb_iargs; i++) {
                 ts = arg_temp(op->args[i]);
                 if (ts->state & TS_DEAD) {
                     /* For operands that were dead, initially allow
                        all regs for the type.  */
                     *la_temp_pref(ts) = tcg_target_available_regs[ts->type];
                     ts->state &= ~TS_DEAD;
                 }
             }
 
             /* Incorporate constraints for this operand.  */
             switch (opc) {
             case INDEX_op_mov_i32:
             case INDEX_op_mov_i64:
                 /* Note that these are TCG_OPF_NOT_PRESENT and do not
                    have proper constraints.  That said, special case
                    moves to propagate preferences backward.  */
                 if (IS_DEAD_ARG(1)) {
                     *la_temp_pref(arg_temp(op->args[0]))
                         = *la_temp_pref(arg_temp(op->args[1]));
                 }
                 break;
 
             default:
                 for (i = nb_oargs; i < nb_oargs + nb_iargs; i++) {
                     const TCGArgConstraint *ct = &def->args_ct[i];
                     TCGRegSet set, *pset;
 
                     ts = arg_temp(op->args[i]);
                     pset = la_temp_pref(ts);
                     set = *pset;
 
                     set &= ct->regs;
                     if (ct->ialias) {
                         set &= output_pref(op, ct->alias_index);
                     }
                     /* If the combination is not possible, restart.  */
                     if (set == 0) {
                         set = ct->regs;
                     }
                     *pset = set;
                 }
                 break;
             }
             break;
         }
         op->life = arg_life;
     }
 }
 
 /* Liveness analysis: Convert indirect regs to direct temporaries.  */
@@ -4115,45 +4116,45 @@ static inline void temp_dead(TCGContext *s, TCGTemp *ts)
 /* Sync a temporary to memory. 'allocated_regs' is used in case a temporary
    registers needs to be allocated to store a constant.  If 'free_or_dead'
    is non-zero, subsequently release the temporary; if it is positive, the
    temp is dead; if it is negative, the temp is free.  */
 static void temp_sync(TCGContext *s, TCGTemp *ts, TCGRegSet allocated_regs,
                       TCGRegSet preferred_regs, int free_or_dead)
 {
     if (!temp_readonly(ts) && !ts->mem_coherent) {
         if (!ts->mem_allocated) {
             temp_allocate_frame(s, ts);
         }
         switch (ts->val_type) {
         case TEMP_VAL_CONST:
             /* If we're going to free the temp immediately, then we won't
                require it later in a register, so attempt to store the
                constant to memory directly.  */
             if (free_or_dead
                 && tcg_out_sti(s, ts->type, ts->val,
                                ts->mem_base->reg, ts->mem_offset)) {
                 break;
             }
             temp_load(s, ts, tcg_target_available_regs[ts->type],
                       allocated_regs, preferred_regs);
-            /* fallthrough */
+            fallthrough;
 
         case TEMP_VAL_REG:
             tcg_out_st(s, ts->type, ts->reg,
                        ts->mem_base->reg, ts->mem_offset);
             break;
 
         case TEMP_VAL_MEM:
             break;
 
         case TEMP_VAL_DEAD:
         default:
             g_assert_not_reached();
         }
         ts->mem_coherent = 1;
     }
     if (free_or_dead) {
         temp_free_or_dead(s, ts, free_or_dead);
     }
 }
 
 /* free register 'reg' by spilling the corresponding temporary if necessary */
@@ -4550,110 +4551,110 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
 /*
  * Specialized code generation for INDEX_op_dup_vec.
  */
 static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
 {
     const TCGLifeData arg_life = op->life;
     TCGRegSet dup_out_regs, dup_in_regs;
     TCGTemp *its, *ots;
     TCGType itype, vtype;
     unsigned vece;
     int lowpart_ofs;
     bool ok;
 
     ots = arg_temp(op->args[0]);
     its = arg_temp(op->args[1]);
 
     /* ENV should not be modified.  */
     tcg_debug_assert(!temp_readonly(ots));
 
     itype = its->type;
     vece = TCGOP_VECE(op);
     vtype = TCGOP_VECL(op) + TCG_TYPE_V64;
 
     if (its->val_type == TEMP_VAL_CONST) {
         /* Propagate constant via movi -> dupi.  */
         tcg_target_ulong val = its->val;
         if (IS_DEAD_ARG(1)) {
             temp_dead(s, its);
         }
         tcg_reg_alloc_do_movi(s, ots, val, arg_life, output_pref(op, 0));
         return;
     }
 
     dup_out_regs = tcg_op_defs[INDEX_op_dup_vec].args_ct[0].regs;
     dup_in_regs = tcg_op_defs[INDEX_op_dup_vec].args_ct[1].regs;
 
     /* Allocate the output register now.  */
     if (ots->val_type != TEMP_VAL_REG) {
         TCGRegSet allocated_regs = s->reserved_regs;
         TCGReg oreg;
 
         if (!IS_DEAD_ARG(1) && its->val_type == TEMP_VAL_REG) {
             /* Make sure to not spill the input register. */
             tcg_regset_set_reg(allocated_regs, its->reg);
         }
         oreg = tcg_reg_alloc(s, dup_out_regs, allocated_regs,
                              output_pref(op, 0), ots->indirect_base);
         set_temp_val_reg(s, ots, oreg);
     }
 
     switch (its->val_type) {
     case TEMP_VAL_REG:
         /*
          * The dup constriaints must be broad, covering all possible VECE.
          * However, tcg_op_dup_vec() gets to see the VECE and we allow it
          * to fail, indicating that extra moves are required for that case.
          */
         if (tcg_regset_test_reg(dup_in_regs, its->reg)) {
             if (tcg_out_dup_vec(s, vtype, vece, ots->reg, its->reg)) {
                 goto done;
             }
             /* Try again from memory or a vector input register.  */
         }
         if (!its->mem_coherent) {
             /*
              * The input register is not synced, and so an extra store
              * would be required to use memory.  Attempt an integer-vector
              * register move first.  We do not have a TCGRegSet for this.
              */
             if (tcg_out_mov(s, itype, ots->reg, its->reg)) {
                 break;
             }
             /* Sync the temp back to its slot and load from there.  */
             temp_sync(s, its, s->reserved_regs, 0, 0);
         }
-        /* fall through */
+        fallthrough;
 
     case TEMP_VAL_MEM:
         lowpart_ofs = 0;
         if (HOST_BIG_ENDIAN) {
             lowpart_ofs = tcg_type_size(itype) - (1 << vece);
         }
         if (tcg_out_dupm_vec(s, vtype, vece, ots->reg, its->mem_base->reg,
                              its->mem_offset + lowpart_ofs)) {
             goto done;
         }
         /* Load the input into the destination vector register. */
         tcg_out_ld(s, itype, ots->reg, its->mem_base->reg, its->mem_offset);
         break;
 
     default:
         g_assert_not_reached();
     }
 
     /* We now have a vector input register, so dup must succeed. */
     ok = tcg_out_dup_vec(s, vtype, vece, ots->reg, ots->reg);
     tcg_debug_assert(ok);
 
  done:
     ots->mem_coherent = 0;
     if (IS_DEAD_ARG(1)) {
         temp_dead(s, its);
     }
     if (NEED_SYNC_ARG(0)) {
         temp_sync(s, ots, s->reserved_regs, 0, 0);
     }
     if (IS_DEAD_ARG(0)) {
         temp_dead(s, ots);
     }
 }
@@ -5185,146 +5186,147 @@ static void load_arg_ref(TCGContext *s, unsigned arg_slot, TCGReg ref_base,
 static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
 {
     const int nb_oargs = TCGOP_CALLO(op);
     const int nb_iargs = TCGOP_CALLI(op);
     const TCGLifeData arg_life = op->life;
     const TCGHelperInfo *info = tcg_call_info(op);
     TCGRegSet allocated_regs = s->reserved_regs;
     int i;
 
     /*
      * Move inputs into place in reverse order,
      * so that we place stacked arguments first.
      */
     for (i = nb_iargs - 1; i >= 0; --i) {
         const TCGCallArgumentLoc *loc = &info->in[i];
         TCGTemp *ts = arg_temp(op->args[nb_oargs + i]);
 
         switch (loc->kind) {
         case TCG_CALL_ARG_NORMAL:
         case TCG_CALL_ARG_EXTEND_U:
         case TCG_CALL_ARG_EXTEND_S:
             load_arg_normal(s, loc, ts, &allocated_regs);
             break;
         case TCG_CALL_ARG_BY_REF:
             load_arg_stk(s, loc->ref_slot, ts, allocated_regs);
             load_arg_ref(s, loc->arg_slot, TCG_REG_CALL_STACK,
                          arg_slot_stk_ofs(loc->ref_slot),
                          &allocated_regs);
             break;
         case TCG_CALL_ARG_BY_REF_N:
             load_arg_stk(s, loc->ref_slot, ts, allocated_regs);
             break;
         default:
             g_assert_not_reached();
         }
     }
 
     /* Mark dead temporaries and free the associated registers.  */
     for (i = nb_oargs; i < nb_iargs + nb_oargs; i++) {
         if (IS_DEAD_ARG(i)) {
             temp_dead(s, arg_temp(op->args[i]));
         }
     }
 
     /* Clobber call registers.  */
     for (i = 0; i < TCG_TARGET_NB_REGS; i++) {
         if (tcg_regset_test_reg(tcg_target_call_clobber_regs, i)) {
             tcg_reg_free(s, i, allocated_regs);
         }
     }
 
     /*
      * Save globals if they might be written by the helper,
      * sync them if they might be read.
      */
     if (info->flags & TCG_CALL_NO_READ_GLOBALS) {
         /* Nothing to do */
     } else if (info->flags & TCG_CALL_NO_WRITE_GLOBALS) {
         sync_globals(s, allocated_regs);
     } else {
         save_globals(s, allocated_regs);
     }
 
     /*
      * If the ABI passes a pointer to the returned struct as the first
      * argument, load that now.  Pass a pointer to the output home slot.
      */
     if (info->out_kind == TCG_CALL_RET_BY_REF) {
         TCGTemp *ts = arg_temp(op->args[0]);
 
         if (!ts->mem_allocated) {
             temp_allocate_frame(s, ts);
         }
         load_arg_ref(s, 0, ts->mem_base->reg, ts->mem_offset, &allocated_regs);
     }
 
     tcg_out_call(s, tcg_call_func(op), info);
 
     /* Assign output registers and emit moves if needed.  */
     switch (info->out_kind) {
     case TCG_CALL_RET_NORMAL:
         for (i = 0; i < nb_oargs; i++) {
             TCGTemp *ts = arg_temp(op->args[i]);
             TCGReg reg = tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, i);
 
             /* ENV should not be modified.  */
             tcg_debug_assert(!temp_readonly(ts));
 
             set_temp_val_reg(s, ts, reg);
             ts->mem_coherent = 0;
         }
         break;
 
     case TCG_CALL_RET_BY_VEC:
         {
             TCGTemp *ts = arg_temp(op->args[0]);
 
             tcg_debug_assert(ts->base_type == TCG_TYPE_I128);
             tcg_debug_assert(ts->temp_subindex == 0);
             if (!ts->mem_allocated) {
                 temp_allocate_frame(s, ts);
             }
             tcg_out_st(s, TCG_TYPE_V128,
                        tcg_target_call_oarg_reg(TCG_CALL_RET_BY_VEC, 0),
                        ts->mem_base->reg, ts->mem_offset);
         }
         /* fall through to mark all parts in memory */
+        fallthrough;
 
     case TCG_CALL_RET_BY_REF:
         /* The callee has performed a write through the reference. */
         for (i = 0; i < nb_oargs; i++) {
             TCGTemp *ts = arg_temp(op->args[i]);
             ts->val_type = TEMP_VAL_MEM;
         }
         break;
 
     default:
         g_assert_not_reached();
     }
 
     /* Flush or discard output registers as needed. */
     for (i = 0; i < nb_oargs; i++) {
         TCGTemp *ts = arg_temp(op->args[i]);
         if (NEED_SYNC_ARG(i)) {
             temp_sync(s, ts, s->reserved_regs, 0, IS_DEAD_ARG(i));
         } else if (IS_DEAD_ARG(i)) {
             temp_dead(s, ts);
         }
     }
 }
 
 /**
  * atom_and_align_for_opc:
  * @s: tcg context
  * @opc: memory operation code
  * @host_atom: MO_ATOM_{IFALIGN,WITHIN16,SUBALIGN} for host operations
  * @allow_two_ops: true if we are prepared to issue two operations
  *
  * Return the alignment and atomicity to use for the inline fast path
  * for the given memory operation.  The alignment may be larger than
  * that specified in @opc, and the correct alignment will be diagnosed
  * by the slow path helper.
  *
  * If @allow_two_ops, the host is prepared to test for 2x alignment,
  * and issue two loads or stores for subalignment.
  */
@@ -5424,85 +5426,85 @@ static int tcg_out_helper_stk_ofs(TCGType type, unsigned slot)
 static void tcg_out_helper_load_slots(TCGContext *s,
                                       unsigned nmov, TCGMovExtend *mov,
                                       const TCGLdstHelperParam *parm)
 {
     unsigned i;
     TCGReg dst3;
 
     /*
      * Start from the end, storing to the stack first.
      * This frees those registers, so we need not consider overlap.
      */
     for (i = nmov; i-- > 0; ) {
         unsigned slot = mov[i].dst;
 
         if (arg_slot_reg_p(slot)) {
             goto found_reg;
         }
 
         TCGReg src = mov[i].src;
         TCGType dst_type = mov[i].dst_type;
         MemOp dst_mo = dst_type == TCG_TYPE_I32 ? MO_32 : MO_64;
 
         /* The argument is going onto the stack; extend into scratch. */
         if ((mov[i].src_ext & MO_SIZE) != dst_mo) {
             tcg_debug_assert(parm->ntmp != 0);
             mov[i].dst = src = parm->tmp[0];
             tcg_out_movext1(s, &mov[i]);
         }
 
         tcg_out_st(s, dst_type, src, TCG_REG_CALL_STACK,
                    tcg_out_helper_stk_ofs(dst_type, slot));
     }
     return;
 
  found_reg:
     /*
      * The remaining arguments are in registers.
      * Convert slot numbers to argument registers.
      */
     nmov = i + 1;
     for (i = 0; i < nmov; ++i) {
         mov[i].dst = tcg_target_call_iarg_regs[mov[i].dst];
     }
 
     switch (nmov) {
     case 4:
         /* The backend must have provided enough temps for the worst case. */
         tcg_debug_assert(parm->ntmp >= 2);
 
         dst3 = mov[3].dst;
         for (unsigned j = 0; j < 3; ++j) {
             if (dst3 == mov[j].src) {
                 /*
                  * Conflict. Copy the source to a temporary, perform the
                  * remaining moves, then the extension from our scratch
                  * on the way out.
                  */
                 TCGReg scratch = parm->tmp[1];
 
                 tcg_out_mov(s, mov[3].src_type, scratch, mov[3].src);
                 tcg_out_movext3(s, mov, mov + 1, mov + 2, parm->tmp[0]);
                 tcg_out_movext1_new_src(s, &mov[3], scratch);
                 break;
             }
         }
 
         /* No conflicts: perform this move and continue. */
         tcg_out_movext1(s, &mov[3]);
-        /* fall through */
+        fallthrough;
 
     case 3:
         tcg_out_movext3(s, mov, mov + 1, mov + 2,
                         parm->ntmp ? parm->tmp[0] : -1);
         break;
     case 2:
         tcg_out_movext2(s, mov, mov + 1,
                         parm->ntmp ? parm->tmp[0] : -1);
         break;
     case 1:
         tcg_out_movext1(s, mov);
         break;
     default:
         g_assert_not_reached();
     }
 }
@@ -5731,85 +5733,85 @@ static void tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst *ldst,
 static void tcg_out_ld_helper_ret(TCGContext *s, const TCGLabelQemuLdst *ldst,
                                   bool load_sign,
                                   const TCGLdstHelperParam *parm)
 {
     MemOp mop = get_memop(ldst->oi);
     TCGMovExtend mov[2];
     int ofs_slot0;
 
     switch (ldst->type) {
     case TCG_TYPE_I64:
         if (TCG_TARGET_REG_BITS == 32) {
             break;
         }
-        /* fall through */
+        fallthrough;
 
     case TCG_TYPE_I32:
         mov[0].dst = ldst->datalo_reg;
         mov[0].src = tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, 0);
         mov[0].dst_type = ldst->type;
         mov[0].src_type = TCG_TYPE_REG;
 
         /*
          * If load_sign, then we allowed the helper to perform the
          * appropriate sign extension to tcg_target_ulong, and all
          * we need now is a plain move.
          *
          * If they do not, then we expect the relevant extension
          * instruction to be no more expensive than a move, and
          * we thus save the icache etc by only using one of two
          * helper functions.
          */
         if (load_sign || !(mop & MO_SIGN)) {
             if (TCG_TARGET_REG_BITS == 32 || ldst->type == TCG_TYPE_I32) {
                 mov[0].src_ext = MO_32;
             } else {
                 mov[0].src_ext = MO_64;
             }
         } else {
             mov[0].src_ext = mop & MO_SSIZE;
         }
         tcg_out_movext1(s, mov);
         return;
 
     case TCG_TYPE_I128:
         tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
         ofs_slot0 = TCG_TARGET_CALL_STACK_OFFSET;
         switch (TCG_TARGET_CALL_RET_I128) {
         case TCG_CALL_RET_NORMAL:
             break;
         case TCG_CALL_RET_BY_VEC:
             tcg_out_st(s, TCG_TYPE_V128,
                        tcg_target_call_oarg_reg(TCG_CALL_RET_BY_VEC, 0),
                        TCG_REG_CALL_STACK, ofs_slot0);
-            /* fall through */
+            fallthrough;
         case TCG_CALL_RET_BY_REF:
             tcg_out_ld(s, TCG_TYPE_I64, ldst->datalo_reg,
                        TCG_REG_CALL_STACK, ofs_slot0 + 8 * HOST_BIG_ENDIAN);
             tcg_out_ld(s, TCG_TYPE_I64, ldst->datahi_reg,
                        TCG_REG_CALL_STACK, ofs_slot0 + 8 * !HOST_BIG_ENDIAN);
             return;
         default:
             g_assert_not_reached();
         }
         break;
 
     default:
         g_assert_not_reached();
     }
 
     mov[0].dst = ldst->datalo_reg;
     mov[0].src =
         tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, HOST_BIG_ENDIAN);
     mov[0].dst_type = TCG_TYPE_REG;
     mov[0].src_type = TCG_TYPE_REG;
     mov[0].src_ext = TCG_TARGET_REG_BITS == 32 ? MO_32 : MO_64;
 
     mov[1].dst = ldst->datahi_reg;
     mov[1].src =
         tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, !HOST_BIG_ENDIAN);
     mov[1].dst_type = TCG_TYPE_REG;
     mov[1].src_type = TCG_TYPE_REG;
     mov[1].src_ext = TCG_TARGET_REG_BITS == 32 ? MO_32 : MO_64;
 
     tcg_out_movext2(s, mov, mov + 1, parm->ntmp ? parm->tmp[0] : -1);
 }
@@ -5928,195 +5930,195 @@ void tcg_dump_op_count(GString *buf)
 int tcg_gen_code(TCGContext *s, TranslationBlock *tb, uint64_t pc_start)
 {
     int i, start_words, num_insns;
     TCGOp *op;
 
     if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP)
                  && qemu_log_in_addr_range(pc_start))) {
         FILE *logfile = qemu_log_trylock();
         if (logfile) {
             fprintf(logfile, "OP:\n");
             tcg_dump_ops(s, logfile, false);
             fprintf(logfile, "\n");
             qemu_log_unlock(logfile);
         }
     }
 
 #ifdef CONFIG_DEBUG_TCG
     /* Ensure all labels referenced have been emitted.  */
     {
         TCGLabel *l;
         bool error = false;
 
         QSIMPLEQ_FOREACH(l, &s->labels, next) {
             if (unlikely(!l->present) && !QSIMPLEQ_EMPTY(&l->branches)) {
                 qemu_log_mask(CPU_LOG_TB_OP,
                               "$L%d referenced but not present.\n", l->id);
                 error = true;
             }
         }
         assert(!error);
     }
 #endif
 
     tcg_optimize(s);
 
     reachable_code_pass(s);
     liveness_pass_0(s);
     liveness_pass_1(s);
 
     if (s->nb_indirects > 0) {
         if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_IND)
                      && qemu_log_in_addr_range(pc_start))) {
             FILE *logfile = qemu_log_trylock();
             if (logfile) {
                 fprintf(logfile, "OP before indirect lowering:\n");
                 tcg_dump_ops(s, logfile, false);
                 fprintf(logfile, "\n");
                 qemu_log_unlock(logfile);
             }
         }
 
         /* Replace indirect temps with direct temps.  */
         if (liveness_pass_2(s)) {
             /* If changes were made, re-run liveness.  */
             liveness_pass_1(s);
         }
     }
 
     if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_OPT)
                  && qemu_log_in_addr_range(pc_start))) {
         FILE *logfile = qemu_log_trylock();
         if (logfile) {
             fprintf(logfile, "OP after optimization and liveness analysis:\n");
             tcg_dump_ops(s, logfile, true);
             fprintf(logfile, "\n");
             qemu_log_unlock(logfile);
         }
     }
 
     /* Initialize goto_tb jump offsets. */
     tb->jmp_reset_offset[0] = TB_JMP_OFFSET_INVALID;
     tb->jmp_reset_offset[1] = TB_JMP_OFFSET_INVALID;
     tb->jmp_insn_offset[0] = TB_JMP_OFFSET_INVALID;
     tb->jmp_insn_offset[1] = TB_JMP_OFFSET_INVALID;
 
     tcg_reg_alloc_start(s);
 
     /*
      * Reset the buffer pointers when restarting after overflow.
      * TODO: Move this into translate-all.c with the rest of the
      * buffer management.  Having only this done here is confusing.
      */
     s->code_buf = tcg_splitwx_to_rw(tb->tc.ptr);
     s->code_ptr = s->code_buf;
 
 #ifdef TCG_TARGET_NEED_LDST_LABELS
     QSIMPLEQ_INIT(&s->ldst_labels);
 #endif
 #ifdef TCG_TARGET_NEED_POOL_LABELS
     s->pool_labels = NULL;
 #endif
 
     start_words = s->insn_start_words;
     s->gen_insn_data =
         tcg_malloc(sizeof(uint64_t) * s->gen_tb->icount * start_words);
 
     tcg_out_tb_start(s);
 
     num_insns = -1;
     QTAILQ_FOREACH(op, &s->ops, link) {
         TCGOpcode opc = op->opc;
 
         switch (opc) {
         case INDEX_op_mov_i32:
         case INDEX_op_mov_i64:
         case INDEX_op_mov_vec:
             tcg_reg_alloc_mov(s, op);
             break;
         case INDEX_op_dup_vec:
             tcg_reg_alloc_dup(s, op);
             break;
         case INDEX_op_insn_start:
             if (num_insns >= 0) {
                 size_t off = tcg_current_code_size(s);
                 s->gen_insn_end_off[num_insns] = off;
                 /* Assert that we do not overflow our stored offset.  */
                 assert(s->gen_insn_end_off[num_insns] == off);
             }
             num_insns++;
             for (i = 0; i < start_words; ++i) {
                 s->gen_insn_data[num_insns * start_words + i] =
                     tcg_get_insn_start_param(op, i);
             }
             break;
         case INDEX_op_discard:
             temp_dead(s, arg_temp(op->args[0]));
             break;
         case INDEX_op_set_label:
             tcg_reg_alloc_bb_end(s, s->reserved_regs);
             tcg_out_label(s, arg_label(op->args[0]));
             break;
         case INDEX_op_call:
             tcg_reg_alloc_call(s, op);
             break;
         case INDEX_op_exit_tb:
             tcg_out_exit_tb(s, op->args[0]);
             break;
         case INDEX_op_goto_tb:
             tcg_out_goto_tb(s, op->args[0]);
             break;
         case INDEX_op_dup2_vec:
             if (tcg_reg_alloc_dup2(s, op)) {
                 break;
             }
-            /* fall through */
+            fallthrough;
         default:
             /* Sanity check that we've not introduced any unhandled opcodes. */
             tcg_debug_assert(tcg_op_supported(opc));
             /* Note: in order to speed up the code, it would be much
                faster to have specialized register allocator functions for
                some common argument patterns */
             tcg_reg_alloc_op(s, op);
             break;
         }
         /* Test for (pending) buffer overflow.  The assumption is that any
            one operation beginning below the high water mark cannot overrun
            the buffer completely.  Thus we can test for overflow after
            generating code without having to check during generation.  */
         if (unlikely((void *)s->code_ptr > s->code_gen_highwater)) {
             return -1;
         }
         /* Test for TB overflow, as seen by gen_insn_end_off.  */
         if (unlikely(tcg_current_code_size(s) > UINT16_MAX)) {
             return -2;
         }
     }
     tcg_debug_assert(num_insns + 1 == s->gen_tb->icount);
     s->gen_insn_end_off[num_insns] = tcg_current_code_size(s);
 
     /* Generate TB finalization at the end of block */
 #ifdef TCG_TARGET_NEED_LDST_LABELS
     i = tcg_out_ldst_finalize(s);
     if (i < 0) {
         return i;
     }
 #endif
 #ifdef TCG_TARGET_NEED_POOL_LABELS
     i = tcg_out_pool_finalize(s);
     if (i < 0) {
         return i;
     }
 #endif
     if (!tcg_resolve_relocs(s)) {
         return -2;
     }
 
 #ifndef CONFIG_TCG_INTERPRETER
     /* flush instruction cache */
     flush_idcache_range((uintptr_t)tcg_splitwx_to_rx(s->code_buf),
                         (uintptr_t)s->code_buf,
                         tcg_ptr_byte_diff(s->code_ptr, s->code_buf));
 #endif
 
     return tcg_current_code_size(s);
 }
diff --git a/tcg/tci.c b/tcg/tci.c
index 4640902c88..3368941953 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -1053,269 +1053,269 @@ static const char *str_c(TCGCond c)
 /* Disassemble TCI bytecode. */
 int print_insn_tci(bfd_vma addr, disassemble_info *info)
 {
     const uint32_t *tb_ptr = (const void *)(uintptr_t)addr;
     const TCGOpDef *def;
     const char *op_name;
     uint32_t insn;
     TCGOpcode op;
     TCGReg r0, r1, r2, r3, r4, r5;
     tcg_target_ulong i1;
     int32_t s2;
     TCGCond c;
     MemOpIdx oi;
     uint8_t pos, len;
     void *ptr;
 
     /* TCI is always the host, so we don't need to load indirect. */
     insn = *tb_ptr++;
 
     info->fprintf_func(info->stream, "%08x  ", insn);
 
     op = extract32(insn, 0, 8);
     def = &tcg_op_defs[op];
     op_name = def->name;
 
     switch (op) {
     case INDEX_op_br:
     case INDEX_op_exit_tb:
     case INDEX_op_goto_tb:
         tci_args_l(insn, tb_ptr, &ptr);
         info->fprintf_func(info->stream, "%-12s  %p", op_name, ptr);
         break;
 
     case INDEX_op_goto_ptr:
         tci_args_r(insn, &r0);
         info->fprintf_func(info->stream, "%-12s  %s", op_name, str_r(r0));
         break;
 
     case INDEX_op_call:
         tci_args_nl(insn, tb_ptr, &len, &ptr);
         info->fprintf_func(info->stream, "%-12s  %d, %p", op_name, len, ptr);
         break;
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
         tci_args_rl(insn, tb_ptr, &r0, &ptr);
         info->fprintf_func(info->stream, "%-12s  %s, 0, ne, %p",
                            op_name, str_r(r0), ptr);
         break;
 
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
         tci_args_rrrc(insn, &r0, &r1, &r2, &c);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s",
                            op_name, str_r(r0), str_r(r1), str_r(r2), str_c(c));
         break;
 
     case INDEX_op_tci_movi:
         tci_args_ri(insn, &r0, &i1);
         info->fprintf_func(info->stream, "%-12s  %s, 0x%" TCG_PRIlx,
                            op_name, str_r(r0), i1);
         break;
 
     case INDEX_op_tci_movl:
         tci_args_rl(insn, tb_ptr, &r0, &ptr);
         info->fprintf_func(info->stream, "%-12s  %s, %p",
                            op_name, str_r(r0), ptr);
         break;
 
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8u_i64:
     case INDEX_op_ld8s_i32:
     case INDEX_op_ld8s_i64:
     case INDEX_op_ld16u_i32:
     case INDEX_op_ld16u_i64:
     case INDEX_op_ld16s_i32:
     case INDEX_op_ld16s_i64:
     case INDEX_op_ld32u_i64:
     case INDEX_op_ld32s_i64:
     case INDEX_op_ld_i32:
     case INDEX_op_ld_i64:
     case INDEX_op_st8_i32:
     case INDEX_op_st8_i64:
     case INDEX_op_st16_i32:
     case INDEX_op_st16_i64:
     case INDEX_op_st32_i64:
     case INDEX_op_st_i32:
     case INDEX_op_st_i64:
         tci_args_rrs(insn, &r0, &r1, &s2);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %d",
                            op_name, str_r(r0), str_r(r1), s2);
         break;
 
     case INDEX_op_mov_i32:
     case INDEX_op_mov_i64:
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
     case INDEX_op_bswap32_i32:
     case INDEX_op_bswap32_i64:
     case INDEX_op_bswap64_i64:
     case INDEX_op_not_i32:
     case INDEX_op_not_i64:
     case INDEX_op_neg_i32:
     case INDEX_op_neg_i64:
     case INDEX_op_ctpop_i32:
     case INDEX_op_ctpop_i64:
         tci_args_rr(insn, &r0, &r1);
         info->fprintf_func(info->stream, "%-12s  %s, %s",
                            op_name, str_r(r0), str_r(r1));
         break;
 
     case INDEX_op_add_i32:
     case INDEX_op_add_i64:
     case INDEX_op_sub_i32:
     case INDEX_op_sub_i64:
     case INDEX_op_mul_i32:
     case INDEX_op_mul_i64:
     case INDEX_op_and_i32:
     case INDEX_op_and_i64:
     case INDEX_op_or_i32:
     case INDEX_op_or_i64:
     case INDEX_op_xor_i32:
     case INDEX_op_xor_i64:
     case INDEX_op_andc_i32:
     case INDEX_op_andc_i64:
     case INDEX_op_orc_i32:
     case INDEX_op_orc_i64:
     case INDEX_op_eqv_i32:
     case INDEX_op_eqv_i64:
     case INDEX_op_nand_i32:
     case INDEX_op_nand_i64:
     case INDEX_op_nor_i32:
     case INDEX_op_nor_i64:
     case INDEX_op_div_i32:
     case INDEX_op_div_i64:
     case INDEX_op_rem_i32:
     case INDEX_op_rem_i64:
     case INDEX_op_divu_i32:
     case INDEX_op_divu_i64:
     case INDEX_op_remu_i32:
     case INDEX_op_remu_i64:
     case INDEX_op_shl_i32:
     case INDEX_op_shl_i64:
     case INDEX_op_shr_i32:
     case INDEX_op_shr_i64:
     case INDEX_op_sar_i32:
     case INDEX_op_sar_i64:
     case INDEX_op_rotl_i32:
     case INDEX_op_rotl_i64:
     case INDEX_op_rotr_i32:
     case INDEX_op_rotr_i64:
     case INDEX_op_clz_i32:
     case INDEX_op_clz_i64:
     case INDEX_op_ctz_i32:
     case INDEX_op_ctz_i64:
         tci_args_rrr(insn, &r0, &r1, &r2);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s",
                            op_name, str_r(r0), str_r(r1), str_r(r2));
         break;
 
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
         tci_args_rrrbb(insn, &r0, &r1, &r2, &pos, &len);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %d, %d",
                            op_name, str_r(r0), str_r(r1), str_r(r2), pos, len);
         break;
 
     case INDEX_op_extract_i32:
     case INDEX_op_extract_i64:
     case INDEX_op_sextract_i32:
     case INDEX_op_sextract_i64:
         tci_args_rrbb(insn, &r0, &r1, &pos, &len);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%d,%d",
                            op_name, str_r(r0), str_r(r1), pos, len);
         break;
 
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
     case INDEX_op_setcond2_i32:
         tci_args_rrrrrc(insn, &r0, &r1, &r2, &r3, &r4, &c);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s, %s, %s",
                            op_name, str_r(r0), str_r(r1), str_r(r2),
                            str_r(r3), str_r(r4), str_c(c));
         break;
 
     case INDEX_op_mulu2_i32:
     case INDEX_op_mulu2_i64:
     case INDEX_op_muls2_i32:
     case INDEX_op_muls2_i64:
         tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s",
                            op_name, str_r(r0), str_r(r1),
                            str_r(r2), str_r(r3));
         break;
 
     case INDEX_op_add2_i32:
     case INDEX_op_add2_i64:
     case INDEX_op_sub2_i32:
     case INDEX_op_sub2_i64:
         tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s, %s, %s",
                            op_name, str_r(r0), str_r(r1), str_r(r2),
                            str_r(r3), str_r(r4), str_r(r5));
         break;
 
     case INDEX_op_qemu_ld_a32_i32:
     case INDEX_op_qemu_st_a32_i32:
         len = 1 + 1;
         goto do_qemu_ldst;
     case INDEX_op_qemu_ld_a32_i64:
     case INDEX_op_qemu_st_a32_i64:
     case INDEX_op_qemu_ld_a64_i32:
     case INDEX_op_qemu_st_a64_i32:
         len = 1 + DIV_ROUND_UP(64, TCG_TARGET_REG_BITS);
         goto do_qemu_ldst;
     case INDEX_op_qemu_ld_a64_i64:
     case INDEX_op_qemu_st_a64_i64:
         len = 2 * DIV_ROUND_UP(64, TCG_TARGET_REG_BITS);
         goto do_qemu_ldst;
     do_qemu_ldst:
         switch (len) {
         case 2:
             tci_args_rrm(insn, &r0, &r1, &oi);
             info->fprintf_func(info->stream, "%-12s  %s, %s, %x",
                                op_name, str_r(r0), str_r(r1), oi);
             break;
         case 3:
             tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
             info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s",
                                op_name, str_r(r0), str_r(r1),
                                str_r(r2), str_r(r3));
             break;
         case 4:
             tci_args_rrrrr(insn, &r0, &r1, &r2, &r3, &r4);
             info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s, %s",
                                op_name, str_r(r0), str_r(r1),
                                str_r(r2), str_r(r3), str_r(r4));
             break;
         default:
             g_assert_not_reached();
         }
         break;
 
     case 0:
         /* tcg_out_nop_fill uses zeros */
         if (insn == 0) {
             info->fprintf_func(info->stream, "align");
             break;
         }
-        /* fall through */
+        fallthrough;
 
     default:
         info->fprintf_func(info->stream, "illegal opcode %d", op);
         break;
     }
 
     return sizeof(insn);
 }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 461f4b47ff..f60d0ba037 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -520,26 +520,26 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg)
 {
     switch (type) {
     case TCG_TYPE_I32:
 #if TCG_TARGET_REG_BITS == 64
         arg = (int32_t)arg;
-        /* fall through */
+        fallthrough;
     case TCG_TYPE_I64:
 #endif
         break;
     default:
         g_assert_not_reached();
     }
 
     if (arg == sextract32(arg, 0, 20)) {
         tcg_out_op_ri(s, INDEX_op_tci_movi, ret, arg);
     } else {
         tcg_insn_unit insn = 0;
 
         new_pool_label(s, arg, 20, s->code_ptr, 0);
         insn = deposit32(insn, 0, 8, INDEX_op_tci_movl);
         insn = deposit32(insn, 8, 4, ret);
         tcg_out32(s, insn);
     }
 }
-- 
2.39.2


