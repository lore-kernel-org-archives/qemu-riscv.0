Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW6T-00066w-Fy
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5n-0003VP-Un
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:30:34 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5j-0000HX-Ox
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:30:31 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso920927pjb.2
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UK5XBu9I0qQAdw4Q425WvErokLkPdiRiycNWgpiEkiU=;
 b=WmAqjwD1PuKe2f7xS4exrvzgYW90qw8kJlV03HSq2I/gXWo5gbG9o6lgKitvbzrcKO
 MA8vJwv0GTWj47gGDNzSNwven5B9wteVhuBjLYT9AzF8/te25ocfksHYLB6nPSDN5NG1
 DRO775S78W0KlEpGhLQEjFwH5J1QZHwIUsoih2vLkU6Wav/oB7QYjtTXWb2w4rP0yoiX
 o9cWnpMqi6w8fO38G13VZRuKP/FeRraaRZ8HGbX79ZyziFm5SLC0mw5VQ9ehfVwG5aLJ
 kDOSFC8b+Z5nI272TmfA3a1sqHTPy+TudbsZ63v47ASbtY+PRnofrVYgSel0wE9nafYf
 AkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UK5XBu9I0qQAdw4Q425WvErokLkPdiRiycNWgpiEkiU=;
 b=2HXUq5v8TxTYrlxNRwT1ImXhW8x2OPmfvKPsvzewgBIfbElTmflh+m1g9pmmlAmoLD
 aoaP6yPZjMLxDxNQyw0LsGZewyhANr8YVclWZ+h9gDrVeHqEj5VAFL8t0mf46mZcZjUQ
 YmHqm4JCJIX1jd0MpjgjsUnKOe10smhVH+RmTT6q3UX89/MJigqyQ7kNXdZP+QtSV6pm
 tPQRciOOEhFru2JbuxI2HSqxNWlcel8gDb7kyq1i/HCVNfUclPwYCycQt3zYAy5cBq3P
 QaA2S93SXVAj9UZ2+0TDyn9UAswjRfVaqENW0cafjtODJzhA/LozgGCHjpx/XdzcfGRs
 OYMg==
X-Gm-Message-State: AO0yUKW+cJpbFvKA7okBTXqVy37D3nTHrJIZ50q9lHHaAzJsLJhXxs5j
 Qf1G3dzJdBDP7r4+4SV3n4VC4Q==
X-Google-Smtp-Source: AK7set/IrDK3p9XcSSOBcnGKeOqqXs3fAhcUlVKA3a5Z3jSDV56hr0eTdZLwxzKC9f/aJqNOMo0U4g==
X-Received: by 2002:a17:90b:1b4e:b0:237:29b1:1893 with SMTP id
 nv14-20020a17090b1b4e00b0023729b11893mr21604139pjb.46.1677475826758; 
 Sun, 26 Feb 2023 21:30:26 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 49/76] target/openrisc: Drop tcg_temp_free
Date: Sun, 26 Feb 2023 19:24:38 -1000
Message-Id: <20230227052505.352889-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:30:43 -0000

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


