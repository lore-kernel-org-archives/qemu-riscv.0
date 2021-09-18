Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mRVbS-0002WY-NV
	for mharc-qemu-riscv@gnu.org; Sat, 18 Sep 2021 04:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTqC-0002gl-Jm; Sat, 18 Sep 2021 02:28:48 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTqB-0003A3-89; Sat, 18 Sep 2021 02:28:48 -0400
Received: by mail-pf1-x431.google.com with SMTP id w14so730138pfu.2;
 Fri, 17 Sep 2021 23:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Hoil6t6vGDo7tQoCRnUVu4aITmil+jgKZTVBnbTPVHw=;
 b=BI9wz36wUuCeop2fEZj+LP8tQ2OiKkgT7t+3G+qL/CcfoY5i804UzlBalRbwOhuni2
 TehaqWQ3KCMy2Xpce2fcM25K4vWp5DoEy9991CDLYSmlrT9LcwWn8HhmBPNhYUALU8uy
 56OLgIFzNPF6JWCm44T8S2Ybppi2QSU1k/6aziRkZgrPRkwu72miGdovuw8U2tRa/+nX
 AH5M0xrfCau+Ew2oNKdTRdp0XMkG/B2DNcwSwyxtl6zklO55g5UI3X1jXtrs/mUhE3dB
 mYEbGTK0haJi7xjanRpVg/o616KJtpacLIpCpmavte1a5mjKFAYfwsrtLfgOSDCdjNFh
 wZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Hoil6t6vGDo7tQoCRnUVu4aITmil+jgKZTVBnbTPVHw=;
 b=wRS9QxVWyj1KypcLfSvrJPHgppgXGRFDge6/4IcUh0ZY/VO1NlY4+SYwd21nyBqCgM
 XbvIac2V0svvUWjDr8w0HbnL2sde3lIzh3QO3Za1HAInmOhGfYPqhBAopDDOP4jAiBCg
 UoDnJQCCQB1Lw4AyHsG93iTyqyUuSRz6FP0mTiX6KBsMjptq/aP4k00/HJXQUm9n0ySd
 EH4PDfJAjs54+2aeAGM+gXwlN4v7DjJQatvKJukF8Kd5V1V2dXOzNjw93KPS8VdNsEVT
 ASADw+ApKIZliTv3Z5e8HtI+vGSteswV0US2bp7Xt17AL/tzvblnBk2MCaMzFvtY98+2
 0Ybg==
X-Gm-Message-State: AOAM532OJ1vKbV8IEWpIFwaeYt/yBCsrxlgHMS8oednnTZfv6r24C4J7
 dIB1uYjVAiCa2UVwcw/YDk5aHB8vhNGoo4V4
X-Google-Smtp-Source: ABdhPJy+8HcYgbSa+y+X8zb9tKME+tZxgcy3NkfOE4wc7ik0U1Ut2Ocju6eqEEUbi0XbFZzOxMtTng==
X-Received: by 2002:a63:3c5d:: with SMTP id i29mr13225022pgn.415.1631946525418; 
 Fri, 17 Sep 2021 23:28:45 -0700 (PDT)
Received: from eric-OptiPlex-7080.starfivetech.com (ip164.ip-51-195-37.eu.
 [51.195.37.164])
 by smtp.gmail.com with ESMTPSA id f27sm8126432pfq.78.2021.09.17.23.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 23:28:45 -0700 (PDT)
From: Eric Tang <tangxingxin1008@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	bin.meng@windriver.com
Subject: [RFC 01/10] target/riscv: rvb: fixed an error about srow/sroiw
 instructions
Date: Sat, 18 Sep 2021 14:28:07 +0800
Message-Id: <20210918062816.7546-2-tangxingxin1008@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210918062816.7546-1-tangxingxin1008@gmail.com>
References: <20210918062816.7546-1-tangxingxin1008@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=tangxingxin1008@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 18 Sep 2021 04:21:40 -0400
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
X-List-Received-Date: Sat, 18 Sep 2021 06:28:48 -0000

    According to spec, these instructions ignore the upper 32 bit of
    their input and sign-extend their 32 bit output values. Fixed the
    output's error when their input values greater than 0xffffffff.

Signed-off-by: Eric Tang <tangxingxin1008@gmail.com>

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index b72e76255c..96b6fcb41d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -484,12 +484,32 @@ static bool trans_sloiw(DisasContext *ctx, arg_sloiw *a)
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_slo);
 }
 
+static void gen_srow(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_not_i32(t1, t1);
+    tcg_gen_shr_i32(t1, t1, t2);
+    tcg_gen_not_i32(t1, t1);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
 static bool trans_srow(DisasContext *ctx, arg_srow *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
     ctx->w = true;
-    return gen_shift(ctx, a, EXT_ZERO, gen_sro);
+    return gen_shift(ctx, a, EXT_ZERO, gen_srow);
 }
 
 static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
@@ -497,7 +517,7 @@ static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
     ctx->w = true;
-    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_sro);
+    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_srow);
 }
 
 static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
-- 
2.17.1


