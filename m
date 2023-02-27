Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWOK-0000QX-7I
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNU-0004i8-SO
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:49 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNQ-0007J6-FX
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:48 -0500
Received: by mail-pj1-x102c.google.com with SMTP id oj5so929005pjb.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Htwm+E7Ej5o1YDA8ZJwARbX/GtYPS7IcYCg+lmcAy3E=;
 b=cWwWaOTHYxiB+KCaN2JEQ0ZC3ql7d3B85FqiSF9BuibjXV+Ju43HfNqGM2pXZa3rw7
 WO3lyp5iktpMdSznSB0Lw1aWe09czKEUeYLayyUr+3g0tVSpn2Sr5tzoupcJHJ13chGM
 S8gqw5zieVM3wE5O13F5vxihvRQEDwvb+3sdiasrUxSdIiX1WffQcgTUEir4NvqkNBMS
 rCx/tKznFURA0OMUVhxs//Ua4Epw3SbeepGUYxRp3e6AGXB2yIhh4VVsMvUciD9obiV1
 Qlw7MV/qzty8/dQiMM9jC0n95K6e//8PQ7UmNwK8usIw+ebhnaG80XNYy+cOy1HyiBM6
 Mb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Htwm+E7Ej5o1YDA8ZJwARbX/GtYPS7IcYCg+lmcAy3E=;
 b=lfkaWgCH525PvRNh+cvoasBcNt6sBQPoK+2qqDdlMHsdAQ4/NA2ontu2xvBTVBS6Ss
 pNlOYZGaSkkitkVld1ON1+FkdJD72ipL/p9H6Pga3tv8k9bXKQUkfi32vkANKm/hDqPI
 Fk+DhU94Mb3hvVeuLU+1eYb3CZkS6gcmIf9Joqd/8pMQnvobhdq7ycitawA+1Bwy0HMh
 IvD4DkWpA1Ak6BctFv1kTM9lNQsj9fxfnmI1yKvcaWLcSoBwXxUKs95hX1ySU6VJ+AYo
 GiQ3GbWxkXeywZiLMU8+Km6lUL96tM49LPwOoGbAEvKuNjbSgmGTpLfDOtIy4JKMZeRW
 cO0Q==
X-Gm-Message-State: AO0yUKWXH8UXSTAeaLZvkqLBNS1hq8CgbZinKcdRclCmdL5GzfIkPAhE
 9bzzKmL/XAU4nSPNK+RzY0cdsA==
X-Google-Smtp-Source: AK7set9jrdmo+5D1wb5LnhBZWm7155nIRMGgv+TQ3KwYeNpoVO12kWObWUB9X8skV36L/ZRJUJ6j8Q==
X-Received: by 2002:a17:903:22cb:b0:19d:1897:8192 with SMTP id
 y11-20020a17090322cb00b0019d18978192mr1977206plg.47.1677476922275; 
 Sun, 26 Feb 2023 21:48:42 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 67/70] target/xtensa: Avoid tcg_const_i32
Date: Sun, 26 Feb 2023 19:42:30 -1000
Message-Id: <20230227054233.390271-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:48:49 -0000

All remaining uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index f906ba7ed5..0cf3075649 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1361,7 +1361,7 @@ static void translate_all(DisasContext *dc, const OpcodeArg arg[],
                           const uint32_t par[])
 {
     uint32_t shift = par[1];
-    TCGv_i32 mask = tcg_const_i32(((1 << shift) - 1) << arg[1].imm);
+    TCGv_i32 mask = tcg_constant_i32(((1 << shift) - 1) << arg[1].imm);
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     tcg_gen_and_i32(tmp, arg[1].in, mask);
@@ -1489,7 +1489,7 @@ static void translate_call0(DisasContext *dc, const OpcodeArg arg[],
 static void translate_callw(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
-    TCGv_i32 tmp = tcg_const_i32(arg[0].imm);
+    TCGv_i32 tmp = tcg_constant_i32(arg[0].imm);
     gen_callw_slot(dc, par[0], tmp, adjust_jump_slot(dc, arg[0].imm, 0));
 }
 
@@ -1537,7 +1537,7 @@ static void translate_clrex(DisasContext *dc, const OpcodeArg arg[],
 static void translate_const16(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
-    TCGv_i32 c = tcg_const_i32(arg[1].imm);
+    TCGv_i32 c = tcg_constant_i32(arg[1].imm);
 
     tcg_gen_deposit_i32(arg[0].out, c, arg[0].in, 16, 16);
 }
-- 
2.34.1


