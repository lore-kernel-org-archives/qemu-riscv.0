Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqiP-0004DX-T7
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiE-0003kK-Lt
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:19:28 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiB-0002tO-KQ
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:19:26 -0500
Received: by mail-pj1-x102a.google.com with SMTP id kb15so1446244pjb.1
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sG9cqgyja8wZFxXAESY3FM7IJYCLVD/+8GYVn1Dmh4s=;
 b=EVOFLCnbGHjQIDFCEf7AyRffiWssRsWDeaz73VnqUwylWBLc5px1NIr/rNUrJW/mLo
 jP63ff/+NxoTnjA7yV61bWW3H3FixSrp+qDcBWAB7BZpX/QvOtpmTVoM6n3v3nyjD1MZ
 Us7zhdFiOoQ3naoU8CWI2EtJioi3io8hfAeJVXdY1R9NtpwrTz7YIdyasT6woRUPf+K7
 DHaWC/WAI3l6TL+hBxL3vFOaD0eaL0WietF9n9OCRR4R5AcUX7Da7eb2ZrhUDmvTlvAf
 lFp9uUxFnSARQIHZaMF6ix/x8035yUPXqUrqW8BF+PRmNaLj01gMZxt+/MJfuR4i3iJU
 ICxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sG9cqgyja8wZFxXAESY3FM7IJYCLVD/+8GYVn1Dmh4s=;
 b=frj/CHvfu6WT1mbmQPkYMNFCbtWTPkU9PoU5U/0/Zn4UBp08rjAKCleprT0ex15LZ3
 Cc7hdYypx16yS8l/S+xd4UkVwklM7/3ssbuGUmDK4Nre4e3HvcjmEbiebPxVYUDbFfLA
 wD83c+8+PnIORajpW79VH5PwG7vCnKHydr7JD91N7d1u+NOCW1s7sIGxhOzD1U4K/uRJ
 8vQihIFkQkJWPFeT7F5O73i/vaSFM9A43hd65lJoARvZaX5U4qQFJutvgHi2k7qJuFWT
 3LZdyrTLrRA+KF6ScHGymAmtJL7uKPsYYLgb8LGFOACh2GymPHEykUCBrr8XvU0QHiT3
 CKRA==
X-Gm-Message-State: AO0yUKWvwM7da0VdcpeFyvO79WGFXHFReg/AIWYboKF6MbLNLx1Ka41b
 wYe6i+xbq2y8q6f3hrGTAwUayw==
X-Google-Smtp-Source: AK7set99WGROTjg8xCkQc5mZVeCHmIUfK54AD3HSAdONnIzfBhjtPDbqzMd+s/piAgG02WFbRPt7EA==
X-Received: by 2002:a05:6a20:3d89:b0:bc:a9f2:9355 with SMTP id
 s9-20020a056a203d8900b000bca9f29355mr12687491pzi.9.1677316761985; 
 Sat, 25 Feb 2023 01:19:21 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:19:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 42/76] target/mips: Drop tcg_temp_free from octeon_translate.c
Date: Fri, 24 Feb 2023 23:13:53 -1000
Message-Id: <20230225091427.1817156-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:19:29 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/octeon_translate.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octeon_translate.c
index 6a207d2e7e..103c304d10 100644
--- a/target/mips/tcg/octeon_translate.c
+++ b/target/mips/tcg/octeon_translate.c
@@ -40,8 +40,6 @@ static bool trans_BBIT(DisasContext *ctx, arg_BBIT *a)
     ctx->hflags |= MIPS_HFLAG_BC;
     ctx->btarget = ctx->base.pc_next + 4 + a->offset * 4;
     ctx->hflags |= MIPS_HFLAG_BDS32;
-
-    tcg_temp_free(t0);
     return true;
 }
 
@@ -61,10 +59,6 @@ static bool trans_BADDU(DisasContext *ctx, arg_BADDU *a)
 
     tcg_gen_add_tl(t0, t0, t1);
     tcg_gen_andi_i64(cpu_gpr[a->rd], t0, 0xff);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
@@ -83,10 +77,6 @@ static bool trans_DMUL(DisasContext *ctx, arg_DMUL *a)
     gen_load_gpr(t1, a->rt);
 
     tcg_gen_mul_i64(cpu_gpr[a->rd], t0, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
@@ -103,8 +93,6 @@ static bool trans_EXTS(DisasContext *ctx, arg_EXTS *a)
     gen_load_gpr(t0, a->rs);
     tcg_gen_sextract_tl(t0, t0, a->p, a->lenm1 + 1);
     gen_store_gpr(t0, a->rt);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -121,8 +109,6 @@ static bool trans_CINS(DisasContext *ctx, arg_CINS *a)
     gen_load_gpr(t0, a->rs);
     tcg_gen_deposit_z_tl(t0, t0, a->p, a->lenm1 + 1);
     gen_store_gpr(t0, a->rt);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -142,8 +128,6 @@ static bool trans_POP(DisasContext *ctx, arg_POP *a)
     }
     tcg_gen_ctpop_tl(t0, t0);
     gen_store_gpr(t0, a->rd);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -167,10 +151,6 @@ static bool trans_SEQNE(DisasContext *ctx, arg_SEQNE *a)
     } else {
         tcg_gen_setcond_tl(TCG_COND_EQ, cpu_gpr[a->rd], t1, t0);
     }
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
@@ -194,8 +174,5 @@ static bool trans_SEQNEI(DisasContext *ctx, arg_SEQNEI *a)
     } else {
         tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_gpr[a->rt], t0, imm);
     }
-
-    tcg_temp_free(t0);
-
     return true;
 }
-- 
2.34.1


