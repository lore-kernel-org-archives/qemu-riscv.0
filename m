Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW6H-0004aM-Re
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5m-0003QH-Hj
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:30:30 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5h-0000ST-CT
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:30:30 -0500
Received: by mail-pj1-x1041.google.com with SMTP id kb15so4887158pjb.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K1ileFl21ILOYbNN9ovAoll/bN96IaNdlVWGUtxEAQo=;
 b=IAQaN99+tYacpAyS3FYNrMOGwp1LvuIcKcnEdERuzDStzC51VA1NvJn/w+KK7ARSqR
 fxyn4tGvX4Ktdz8TU++w62gFPaCAW+CcZEv+8wPIQLJuuQIBsQ8sCS6wN0De4j7y/Jsx
 Dqtm0R4uK90EE2CpcC37FtBNMZToTEVfld/TU/cePEKNriCc7qCsUk/NMqCsfNe1zIKJ
 bjLfV6vEKiPy6Hd4YmYDcW9m9R7RYa9Rnyollyw4fCY1WjjvzHF2ZHAeNqt0EdvEiPQ+
 GlcHoGmDHqL+qKRYkg/0Xqkz33Gc9e9hyckULqOVs7LHXdokihFpP97+vRxFukNsbxkp
 nWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K1ileFl21ILOYbNN9ovAoll/bN96IaNdlVWGUtxEAQo=;
 b=fDFoQNzM1Z/RcigRZmxScSTFqTweu7whYwouaKDgES9/Y9mRxpgDhpNOojuGX39+rK
 PcIUtBDaPieQd+M+LmHxDD6wcGtGs401wjYEvy/Ka77mvxVNtenD6EloPzVTUyVggIl7
 SzIhqbdUtVE1IwQuA8sluw6upMXB3w76rNBsGx63qk6q8czJrMgVuew/M4XamHwj46YN
 8BXDOJBdlgBRIPlgyRatBbrGhI2eLnKHuO7b4RhZ7/LgPg5891YCeTClDaDQ0PM0e2Re
 7xAkfz25e+KVWiyJDa/rbV+oL1TNlKChtQN6PpQZ9x7IuUhrxJ+V1OtkUxpyvlE+f1YG
 Qa9A==
X-Gm-Message-State: AO0yUKUJf6zKPZsI2uqQPrU/u+GIqk6IJfcisjuSSiQ0GTCiS8uwlN5K
 2yvdZEpsmPGofwqTkKYPQ/42zA==
X-Google-Smtp-Source: AK7set+83fvTqdjAd4U6ztEA2Z36FPlG1ST3dO5Hyc/wlAkGnAHVsJO84Wum3ZlFb+N1Durru5cw+A==
X-Received: by 2002:a17:90b:33c8:b0:237:aa9f:968c with SMTP id
 lk8-20020a17090b33c800b00237aa9f968cmr9357027pjb.34.1677475824069; 
 Sun, 26 Feb 2023 21:30:24 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 48/76] target/nios2: Drop tcg_temp_free
Date: Sun, 26 Feb 2023 19:24:37 -1000
Message-Id: <20230227052505.352889-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:30:31 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 140bc31017..6610e22236 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -233,7 +233,6 @@ static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
 
     tcg_gen_andi_tl(test, dest, 3);
     tcg_gen_brcondi_tl(TCG_COND_NE, test, 0, l);
-    tcg_temp_free(test);
 
     tcg_gen_mov_tl(cpu_pc, dest);
     if (is_call) {
@@ -300,7 +299,6 @@ static void gen_ldx(DisasContext *dc, uint32_t code, uint32_t flags)
 
     tcg_gen_addi_tl(addr, load_gpr(dc, instr.a), instr.imm16.s);
     tcg_gen_qemu_ld_tl(data, addr, dc->mem_idx, flags);
-    tcg_temp_free(addr);
 }
 
 /* Store instructions */
@@ -312,7 +310,6 @@ static void gen_stx(DisasContext *dc, uint32_t code, uint32_t flags)
     TCGv addr = tcg_temp_new();
     tcg_gen_addi_tl(addr, load_gpr(dc, instr.a), instr.imm16.s);
     tcg_gen_qemu_st_tl(val, addr, dc->mem_idx, flags);
-    tcg_temp_free(addr);
 }
 
 /* Branch instructions */
@@ -500,7 +497,6 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
         TCGv tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_ESTATUS]));
         gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_EA));
-        tcg_temp_free(tmp);
     } else {
         gen_helper_eret(cpu_env, load_gpr(dc, R_SSTATUS), load_gpr(dc, R_EA));
     }
@@ -530,7 +526,6 @@ static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
     TCGv tmp = tcg_temp_new();
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_BSTATUS]));
     gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_BA));
-    tcg_temp_free(tmp);
 
     dc->base.is_jmp = DISAS_NORETURN;
 #endif
@@ -597,8 +592,6 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
         tcg_gen_ld_tl(t1, cpu_env, offsetof(CPUNios2State, ctrl[CR_IPENDING]));
         tcg_gen_ld_tl(t2, cpu_env, offsetof(CPUNios2State, ctrl[CR_IENABLE]));
         tcg_gen_and_tl(dest, t1, t2);
-        tcg_temp_free(t1);
-        tcg_temp_free(t2);
         break;
     default:
         tcg_gen_ld_tl(dest, cpu_env,
@@ -662,11 +655,9 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
                 tcg_gen_ld_tl(o, cpu_env, ofs);
                 tcg_gen_andi_tl(o, o, ro);
                 tcg_gen_or_tl(n, n, o);
-                tcg_temp_free(o);
             }
 
             tcg_gen_st_tl(n, cpu_env, ofs);
-            tcg_temp_free(n);
         }
         break;
     }
@@ -753,7 +744,6 @@ static void do_rr_mul_high(DisasContext *dc, uint32_t insn, GenFn4 *fn)
 
     fn(discard, dest_gpr(dc, instr.c),
        load_gpr(dc, instr.a), load_gpr(dc, instr.b));
-    tcg_temp_free(discard);
 }
 
 #define gen_rr_mul_high(fname, insn)                                        \
@@ -771,7 +761,6 @@ static void do_rr_shift(DisasContext *dc, uint32_t insn, GenFn3 *fn)
 
     tcg_gen_andi_tl(sh, load_gpr(dc, instr.b), 31);
     fn(dest_gpr(dc, instr.c), load_gpr(dc, instr.a), sh);
-    tcg_temp_free(sh);
 }
 
 #define gen_rr_shift(fname, insn)                                           \
@@ -990,10 +979,6 @@ static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     instr = &i_type_instructions[op];
     instr->handler(dc, code, instr->flags);
-
-    if (dc->sink) {
-        tcg_temp_free(dc->sink);
-    }
 }
 
 static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


