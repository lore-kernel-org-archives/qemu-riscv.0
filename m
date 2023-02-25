Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqjS-0006hq-E7
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqid-0004ta-Lr
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:19:51 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiT-0002tQ-FM
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:19:45 -0500
Received: by mail-pl1-x62b.google.com with SMTP id p20so665088plw.13
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UK5XBu9I0qQAdw4Q425WvErokLkPdiRiycNWgpiEkiU=;
 b=Z1kUVXisKAZnkYE7tk9Ya3MOFhochbTb7mRMzjflgEyVb7HWZJ0cjqobXgxXFrDeSe
 CfNYeomGc8QLwrvMbLx2/C+m6NjiM4YrHcRn+hX8uDL7/gIT7GHvQiiO/qHfZbA/blxJ
 g4q75g9CTBkBq0sMjqh6G6wkdUC/Wz8c6vJZkG8I35NLUCXyPysjfcJF+3n6cp0jHbvl
 B//QdItsUy0J0HYH6B9yXTC8q0iBJhjOdlrVN320pFRRMqaZ88W4la+xz0aREXS+U46K
 GSOan+eg/bIN8FLrn3/J+m1gNHA3GkKKORpCEKOJFZotjtR1vwESXBGmLecdLAYcT71K
 Q9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UK5XBu9I0qQAdw4Q425WvErokLkPdiRiycNWgpiEkiU=;
 b=SJcpYsy2spjDfbTs+Vc1F9jQlGfyR6VOzRNMjcfxeQCR74V+nlGJHZT30ofcB4+JZc
 SuhsmpE2CVM8sTpdjhCh45kR1jCO/AWDW0nPuWALGGm50Q3JUZ+ZcJ7U+Q0Y7dqueOzT
 Js+oi53RJ8XMSaRQ+4JYpJ1IttrdqMqMQU9M/117jiOFEkV49bMSxS/CJREqI0C5WoPW
 zIgFfAln+coGXG9MGlwnNPVAsjl3e915YGviomibfZxinM+QMtlm+i7krGPjpnYux/R8
 qUrY5+0O5Dj4JpDvfB7tI196jL6FY3A//YtiY8YuEWqn/7s9OUDR7mxl/D00V66li8+n
 mS2w==
X-Gm-Message-State: AO0yUKWo7CTXG9p2mH3k0UqsN73gBG/SSyyWPQNmQxF9RySax1eaPAuD
 MnqTYZXvM3spj+uIW8wTGdPejA==
X-Google-Smtp-Source: AK7set/bPq1uaUqMRNx51HBb4l53fE6AgHtQZ2LC38SZ3L0Bqum7tibZqoCPcacnIcOhnlEJPGK+vQ==
X-Received: by 2002:a05:6a20:3d17:b0:cc:75b8:7cba with SMTP id
 y23-20020a056a203d1700b000cc75b87cbamr6301849pzi.43.1677316780584; 
 Sat, 25 Feb 2023 01:19:40 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:19:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 49/76] target/openrisc: Drop tcg_temp_free
Date: Fri, 24 Feb 2023 23:14:00 -1000
Message-Id: <20230225091427.1817156-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:19:52 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/translate.c | 39 -------------------------------------
 1 file changed, 39 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index b8cd8e0964..76e53c78d4 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -206,10 +206,8 @@ static void gen_add(DisasContext *dc, TCGv dest, TCGv srca, TCGv srcb)
     tcg_gen_xor_tl(cpu_sr_ov, srca, srcb);
     tcg_gen_xor_tl(t0, res, srcb);
     tcg_gen_andc_tl(cpu_sr_ov, t0, cpu_sr_ov);
-    tcg_temp_free(t0);
 
     tcg_gen_mov_tl(dest, res);
-    tcg_temp_free(res);
 
     gen_ove_cyov(dc);
 }
@@ -224,10 +222,8 @@ static void gen_addc(DisasContext *dc, TCGv dest, TCGv srca, TCGv srcb)
     tcg_gen_xor_tl(cpu_sr_ov, srca, srcb);
     tcg_gen_xor_tl(t0, res, srcb);
     tcg_gen_andc_tl(cpu_sr_ov, t0, cpu_sr_ov);
-    tcg_temp_free(t0);
 
     tcg_gen_mov_tl(dest, res);
-    tcg_temp_free(res);
 
     gen_ove_cyov(dc);
 }
@@ -243,7 +239,6 @@ static void gen_sub(DisasContext *dc, TCGv dest, TCGv srca, TCGv srcb)
     tcg_gen_setcond_tl(TCG_COND_LTU, cpu_sr_cy, srca, srcb);
 
     tcg_gen_mov_tl(dest, res);
-    tcg_temp_free(res);
 
     gen_ove_cyov(dc);
 }
@@ -255,7 +250,6 @@ static void gen_mul(DisasContext *dc, TCGv dest, TCGv srca, TCGv srcb)
     tcg_gen_muls2_tl(dest, cpu_sr_ov, srca, srcb);
     tcg_gen_sari_tl(t0, dest, TARGET_LONG_BITS - 1);
     tcg_gen_setcond_tl(TCG_COND_NE, cpu_sr_ov, cpu_sr_ov, t0);
-    tcg_temp_free(t0);
 
     tcg_gen_neg_tl(cpu_sr_ov, cpu_sr_ov);
     gen_ove_ov(dc);
@@ -278,7 +272,6 @@ static void gen_div(DisasContext *dc, TCGv dest, TCGv srca, TCGv srcb)
        Supress the host-side exception by dividing by 1.  */
     tcg_gen_or_tl(t0, srcb, cpu_sr_ov);
     tcg_gen_div_tl(dest, srca, t0);
-    tcg_temp_free(t0);
 
     tcg_gen_neg_tl(cpu_sr_ov, cpu_sr_ov);
     gen_ove_ov(dc);
@@ -293,7 +286,6 @@ static void gen_divu(DisasContext *dc, TCGv dest, TCGv srca, TCGv srcb)
        Supress the host-side exception by dividing by 1.  */
     tcg_gen_or_tl(t0, srcb, cpu_sr_cy);
     tcg_gen_divu_tl(dest, srca, t0);
-    tcg_temp_free(t0);
 
     gen_ove_cy(dc);
 }
@@ -314,14 +306,11 @@ static void gen_muld(DisasContext *dc, TCGv srca, TCGv srcb)
         tcg_gen_muls2_i64(cpu_mac, high, t1, t2);
         tcg_gen_sari_i64(t1, cpu_mac, 63);
         tcg_gen_setcond_i64(TCG_COND_NE, t1, t1, high);
-        tcg_temp_free_i64(high);
         tcg_gen_trunc_i64_tl(cpu_sr_ov, t1);
         tcg_gen_neg_tl(cpu_sr_ov, cpu_sr_ov);
 
         gen_ove_ov(dc);
     }
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
 }
 
 static void gen_muldu(DisasContext *dc, TCGv srca, TCGv srcb)
@@ -340,12 +329,9 @@ static void gen_muldu(DisasContext *dc, TCGv srca, TCGv srcb)
         tcg_gen_mulu2_i64(cpu_mac, high, t1, t2);
         tcg_gen_setcondi_i64(TCG_COND_NE, high, high, 0);
         tcg_gen_trunc_i64_tl(cpu_sr_cy, high);
-        tcg_temp_free_i64(high);
 
         gen_ove_cy(dc);
     }
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
 }
 
 static void gen_mac(DisasContext *dc, TCGv srca, TCGv srcb)
@@ -362,14 +348,12 @@ static void gen_mac(DisasContext *dc, TCGv srca, TCGv srcb)
     tcg_gen_add_i64(cpu_mac, cpu_mac, t1);
     tcg_gen_xor_i64(t1, t1, cpu_mac);
     tcg_gen_andc_i64(t1, t1, t2);
-    tcg_temp_free_i64(t2);
 
 #if TARGET_LONG_BITS == 32
     tcg_gen_extrh_i64_i32(cpu_sr_ov, t1);
 #else
     tcg_gen_mov_i64(cpu_sr_ov, t1);
 #endif
-    tcg_temp_free_i64(t1);
 
     gen_ove_ov(dc);
 }
@@ -382,13 +366,11 @@ static void gen_macu(DisasContext *dc, TCGv srca, TCGv srcb)
     tcg_gen_extu_tl_i64(t1, srca);
     tcg_gen_extu_tl_i64(t2, srcb);
     tcg_gen_mul_i64(t1, t1, t2);
-    tcg_temp_free_i64(t2);
 
     /* Note that overflow is only computed during addition stage.  */
     tcg_gen_add_i64(cpu_mac, cpu_mac, t1);
     tcg_gen_setcond_i64(TCG_COND_LTU, t1, cpu_mac, t1);
     tcg_gen_trunc_i64_tl(cpu_sr_cy, t1);
-    tcg_temp_free_i64(t1);
 
     gen_ove_cy(dc);
 }
@@ -407,14 +389,12 @@ static void gen_msb(DisasContext *dc, TCGv srca, TCGv srcb)
     tcg_gen_sub_i64(cpu_mac, cpu_mac, t1);
     tcg_gen_xor_i64(t1, t1, cpu_mac);
     tcg_gen_and_i64(t1, t1, t2);
-    tcg_temp_free_i64(t2);
 
 #if TARGET_LONG_BITS == 32
     tcg_gen_extrh_i64_i32(cpu_sr_ov, t1);
 #else
     tcg_gen_mov_i64(cpu_sr_ov, t1);
 #endif
-    tcg_temp_free_i64(t1);
 
     gen_ove_ov(dc);
 }
@@ -432,8 +412,6 @@ static void gen_msbu(DisasContext *dc, TCGv srca, TCGv srcb)
     tcg_gen_setcond_i64(TCG_COND_LTU, t2, cpu_mac, t1);
     tcg_gen_sub_i64(cpu_mac, cpu_mac, t1);
     tcg_gen_trunc_i64_tl(cpu_sr_cy, t2);
-    tcg_temp_free_i64(t2);
-    tcg_temp_free_i64(t1);
 
     gen_ove_cy(dc);
 }
@@ -672,7 +650,6 @@ static bool trans_l_lwa(DisasContext *dc, arg_load *a)
     tcg_gen_qemu_ld_tl(cpu_R(dc, a->d), ea, dc->mem_idx, MO_TEUL);
     tcg_gen_mov_tl(cpu_lock_addr, ea);
     tcg_gen_mov_tl(cpu_lock_value, cpu_R(dc, a->d));
-    tcg_temp_free(ea);
     return true;
 }
 
@@ -684,7 +661,6 @@ static void do_load(DisasContext *dc, arg_load *a, MemOp mop)
     ea = tcg_temp_new();
     tcg_gen_addi_tl(ea, cpu_R(dc, a->a), a->i);
     tcg_gen_qemu_ld_tl(cpu_R(dc, a->d), ea, dc->mem_idx, mop);
-    tcg_temp_free(ea);
 }
 
 static bool trans_l_lwz(DisasContext *dc, arg_load *a)
@@ -734,13 +710,11 @@ static bool trans_l_swa(DisasContext *dc, arg_store *a)
     lab_fail = gen_new_label();
     lab_done = gen_new_label();
     tcg_gen_brcond_tl(TCG_COND_NE, ea, cpu_lock_addr, lab_fail);
-    tcg_temp_free(ea);
 
     val = tcg_temp_new();
     tcg_gen_atomic_cmpxchg_tl(val, cpu_lock_addr, cpu_lock_value,
                               cpu_R(dc, a->b), dc->mem_idx, MO_TEUL);
     tcg_gen_setcond_tl(TCG_COND_EQ, cpu_sr_f, val, cpu_lock_value);
-    tcg_temp_free(val);
 
     tcg_gen_br(lab_done);
 
@@ -757,7 +731,6 @@ static void do_store(DisasContext *dc, arg_store *a, MemOp mop)
     TCGv t0 = tcg_temp_new();
     tcg_gen_addi_tl(t0, cpu_R(dc, a->a), a->i);
     tcg_gen_qemu_st_tl(cpu_R(dc, a->b), t0, dc->mem_idx, mop);
-    tcg_temp_free(t0);
 }
 
 static bool trans_l_sw(DisasContext *dc, arg_store *a)
@@ -866,7 +839,6 @@ static bool trans_l_mfspr(DisasContext *dc, arg_l_mfspr *a)
 
         tcg_gen_ori_tl(spr, cpu_R(dc, a->a), a->k);
         gen_helper_mfspr(cpu_R(dc, a->d), cpu_env, cpu_R(dc, a->d), spr);
-        tcg_temp_free(spr);
     }
     return true;
 }
@@ -897,7 +869,6 @@ static bool trans_l_mtspr(DisasContext *dc, arg_l_mtspr *a)
         spr = tcg_temp_new();
         tcg_gen_ori_tl(spr, cpu_R(dc, a->a), a->k);
         gen_helper_mtspr(cpu_env, spr, cpu_R(dc, a->b));
-        tcg_temp_free(spr);
     }
     return true;
 }
@@ -1349,8 +1320,6 @@ static bool do_dp3(DisasContext *dc, arg_dab_pair *a,
     load_pair(dc, t1, a->b, a->bp);
     fn(t0, cpu_env, t0, t1);
     save_pair(dc, t0, a->d, a->dp);
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
 
     gen_helper_update_fpcsr(cpu_env);
     return true;
@@ -1372,7 +1341,6 @@ static bool do_dp2(DisasContext *dc, arg_da_pair *a,
     load_pair(dc, t0, a->a, a->ap);
     fn(t0, cpu_env, t0);
     save_pair(dc, t0, a->d, a->dp);
-    tcg_temp_free_i64(t0);
 
     gen_helper_update_fpcsr(cpu_env);
     return true;
@@ -1399,8 +1367,6 @@ static bool do_dpcmp(DisasContext *dc, arg_ab_pair *a,
     } else {
         fn(cpu_sr_f, cpu_env, t0, t1);
     }
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
 
     if (inv) {
         tcg_gen_xori_tl(cpu_sr_f, cpu_sr_f, 1);
@@ -1457,7 +1423,6 @@ static bool trans_lf_stod_d(DisasContext *dc, arg_lf_stod_d *a)
     t0 = tcg_temp_new_i64();
     gen_helper_stod(t0, cpu_env, cpu_R(dc, a->a));
     save_pair(dc, t0, a->d, a->dp);
-    tcg_temp_free_i64(t0);
 
     gen_helper_update_fpcsr(cpu_env);
     return true;
@@ -1476,7 +1441,6 @@ static bool trans_lf_dtos_d(DisasContext *dc, arg_lf_dtos_d *a)
     t0 = tcg_temp_new_i64();
     load_pair(dc, t0, a->a, a->ap);
     gen_helper_dtos(cpu_R(dc, a->d), cpu_env, t0);
-    tcg_temp_free_i64(t0);
 
     gen_helper_update_fpcsr(cpu_env);
     return true;
@@ -1502,9 +1466,6 @@ static bool trans_lf_madd_d(DisasContext *dc, arg_dab_pair *a)
     load_pair(dc, t2, a->b, a->bp);
     gen_helper_float_madd_d(t0, cpu_env, t0, t1, t2);
     save_pair(dc, t0, a->d, a->dp);
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t2);
 
     gen_helper_update_fpcsr(cpu_env);
     return true;
-- 
2.34.1


