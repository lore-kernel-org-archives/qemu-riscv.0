Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWIF-0003cd-I4
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:43:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWID-0003TP-TF
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:21 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIC-000504-1G
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:21 -0500
Received: by mail-pg1-x535.google.com with SMTP id p6so2882982pga.0
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TREbAd+70LxESacRUJBX2SCfwkFxNEG89YG9D3Coqs4=;
 b=u91QM0vZV0sU5gQYlowKL8wPNntK0dCJfYlWxQ4bex6qA+S09hppHLJiHNq4bzb6gt
 Evaa81Qm76aMzImAZxxHVah3f6S/2jz6TPsWogQDTYz8xoJ9ReGhXTmhlh0ORLHF70FS
 1HSIkdl5R1SvWxPF55/FvuzSTgE8IyMMHNf6cYdC97eiBklGsbfhb+a+m9d1UZuknd61
 qN5Rz1FAaNLGKVlDT78kdy3KKEK1xdsjkrPYnf57l5VdABuJTu4w/6Yykjo/oEKHFdBD
 O7/MK0RpUPTnocvKnmCGKde82kuCxRNvFn9MZPP0ojO63kTGhlvXTmtT/Xkg8dMlKKtt
 etoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TREbAd+70LxESacRUJBX2SCfwkFxNEG89YG9D3Coqs4=;
 b=7CuYOMdG6SeDyKc/LHZZOzy9cly6F6paIhhrbDwbH0XMcX+Vx1BFbOrXC6MM1TY745
 8ysCksh+qo+TYVZ+yJRUCbJMGtZ+DrRl2U6eb+c18gKxwRtq52E5aHEjHoQoW1nzL2GW
 bf1DYBcXGuEJkKiamyt6w4hECB9T86OO32YGUb8aqWDzvKd9rZbzso/EfmHM9TfY9/7+
 ioLcIDDyK3MPpEaXo4jBveEJVc/iEeoM4GpDxC+6bFasYq2C3bQh97UtXGfshcSE01t8
 Y/oUYZ1+NgZocHK9Yukhba7vVEADl0Tzk+gsm5C+Jx8DCmxgxKoxURxPkUrUO1nqfQGy
 5fQA==
X-Gm-Message-State: AO0yUKWKCq9x7dCVjh26WcKKbWTDj+xUBa2aB1tCV8pxb863eRE75vvu
 bkjkhyAvyqur3Da2LUKvtm25YK2XejWoi5D+MSc=
X-Google-Smtp-Source: AK7set9Bm4FHptm4TqueIFWmi1FWYKB1qXBjprjEUKWxwt8rTf7pOy3bNfBp37aal2V0XjCLllVZWg==
X-Received: by 2002:a62:1946:0:b0:5a8:bd6e:90fb with SMTP id
 67-20020a621946000000b005a8bd6e90fbmr17879877pfz.19.1677476596145; 
 Sun, 26 Feb 2023 21:43:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 12/70] target/avr: Avoid use of tcg_const_i32 in SBIC, SBIS
Date: Sun, 26 Feb 2023 19:41:35 -1000
Message-Id: <20230227054233.390271-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:43:22 -0000

The use of separate data/port variables is existing
practice elsewhere, e.g. SBI, CBI.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index b9506a8d86..190d0c3f97 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1288,12 +1288,13 @@ static bool trans_SBRS(DisasContext *ctx, arg_SBRS *a)
  */
 static bool trans_SBIC(DisasContext *ctx, arg_SBIC *a)
 {
-    TCGv temp = tcg_const_i32(a->reg);
+    TCGv data = tcg_temp_new_i32();
+    TCGv port = tcg_constant_i32(a->reg);
 
-    gen_helper_inb(temp, cpu_env, temp);
-    tcg_gen_andi_tl(temp, temp, 1 << a->bit);
+    gen_helper_inb(data, cpu_env, port);
+    tcg_gen_andi_tl(data, data, 1 << a->bit);
     ctx->skip_cond = TCG_COND_EQ;
-    ctx->skip_var0 = temp;
+    ctx->skip_var0 = data;
 
     return true;
 }
@@ -1305,12 +1306,13 @@ static bool trans_SBIC(DisasContext *ctx, arg_SBIC *a)
  */
 static bool trans_SBIS(DisasContext *ctx, arg_SBIS *a)
 {
-    TCGv temp = tcg_const_i32(a->reg);
+    TCGv data = tcg_temp_new_i32();
+    TCGv port = tcg_constant_i32(a->reg);
 
-    gen_helper_inb(temp, cpu_env, temp);
-    tcg_gen_andi_tl(temp, temp, 1 << a->bit);
+    gen_helper_inb(data, cpu_env, port);
+    tcg_gen_andi_tl(data, data, 1 << a->bit);
     ctx->skip_cond = TCG_COND_NE;
-    ctx->skip_var0 = temp;
+    ctx->skip_var0 = data;
 
     return true;
 }
-- 
2.34.1


