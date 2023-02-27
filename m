Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW6F-0004NS-D8
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:30:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5U-0002vi-Lr
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:30:13 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5Q-0000HT-Lg
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:30:11 -0500
Received: by mail-pl1-x632.google.com with SMTP id i3so5537197plg.6
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sG9cqgyja8wZFxXAESY3FM7IJYCLVD/+8GYVn1Dmh4s=;
 b=yCJe8I2rbmzaLFi6KoVGoDRbmJajAYfrmzGP2oByx1QR+RW3IxRKDNIK+2JbN0PVDc
 Cak9P5Eo1RKe9V9/NfZh3mQi0o4zskeHB/VMRub3DF/EKf8DCI9L5Is+5QGex0LDjNS1
 qOsMa3jDMWjSl2Ob0+a0DfroxADZw1PKRF9DA/wxG+cJ6DcJXTA1vwcrNG1RbF2XiBmz
 rvx/ddn+G7cMx2z5lzqLl4TYIdWed+mxJFieiVJYbnGQDDgSAs1XG2vDPJ2EeUVLOIC8
 fmmkJ8vZC+TpnB1yo9SVw8Do51HPFI9z6l3p9Ft2fdwWuF7MGzkDqtS2N+DDtxMBNGC3
 AraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sG9cqgyja8wZFxXAESY3FM7IJYCLVD/+8GYVn1Dmh4s=;
 b=huOEM3sebrO6gkygcNJyaDLxZ11B2qwapF6u7fLBmD+qoFttEJBQ4gj0zgCf0duSvw
 J/oY+9/IRmpSvu5GDrHdPO7LMlKRGRhAyvDdINHd3YeB4HuEUVy/Hfwz9rPPXxktO7bB
 bRctArqqeIEB4htPOKfut+vnUfDfEdmuy54svBcNApgVJ8wS27Thy5BAlc7dQ4T3u+eW
 dv0W8mV0e+QL6aQD3rXDDvaeUBYlCC5+2rabuMng0QFHyNo2Ro/yQEQkq0vftjwqinnQ
 qNXERiMMExBhOC5me7rmkf8UYAiADgF/juYvgpCtt9KfMv8++HKM643DroAaT+NO+fV+
 3NdQ==
X-Gm-Message-State: AO0yUKWMH61+QKaoP80Wo4flof+1HsM7dZeDocYNC/ilejW45wjXY/Bo
 NRx74vDnGcZHh2a/nNt7KNprzw==
X-Google-Smtp-Source: AK7set/7Y86hC0OSR9e1OeIpptIqQgInmxP1c+wdT5ltBAnebfgw1c3P6edprCm7ib0G6xEAFVp0/Q==
X-Received: by 2002:a17:90b:3b8d:b0:234:a299:b50a with SMTP id
 pc13-20020a17090b3b8d00b00234a299b50amr8447764pjb.2.1677475806933; 
 Sun, 26 Feb 2023 21:30:06 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 42/76] target/mips: Drop tcg_temp_free from
 octeon_translate.c
Date: Sun, 26 Feb 2023 19:24:31 -1000
Message-Id: <20230227052505.352889-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:30:14 -0000

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


