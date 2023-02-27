Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWOG-000899-Dr
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNG-0004E1-5J
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:37 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNC-00073M-56
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:31 -0500
Received: by mail-pl1-x634.google.com with SMTP id p6so4725158plf.0
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t+5KFxEM4lJEelpxdqt9pc+tgTO1lJZXj+S0G2tDTgY=;
 b=gwflLolh8YvPq4+xsyTBSIjeo9lSGPuBFC+o2Rgq7feae4/Q4AJhdlDq9aizYXngE4
 sct7Ln+UnM3vYKWxFE23+Y/PmC7y7pycYRXFX+KXDx8J8vqUtZX3K8zDAd3CYxvjWKrN
 5WQxVjbvclkLY9iqCe3muD5BN/zMu6f/l82GPrtXbn6SlaCx4zP6IuL5QJVe0yLXBqQD
 TRyp8zX3tNRZRq0Esi8zK01OkjW907RJH7i7ubUWrVlvthwLJwX8ch95U8O5rXKqg8U3
 Y3FrfWF9SMZI9z2q7SozjdHkrxBOxHs1pQ3ByTt+di1v7ndsDNyHdeLRfBij4vbXo+F6
 xW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t+5KFxEM4lJEelpxdqt9pc+tgTO1lJZXj+S0G2tDTgY=;
 b=58NT0UvBzFZ2IgIgAX3DaF24JvBh70t5y8A3CDbxkyMQ5lxWTMU7ahvTS3VjzfII9n
 mzJfdufSCTA9U854ix53Na3JLQyg5wP0eqNEWy/WKtb8ywMBvQ9ZLKmvslkdGzbaLryc
 7pG2XyClVP8bWFpz1TYkI7D/rv4duYHx05TnI0vvwaTLjHcdfq0VfHjdhtQw041uP4XU
 zJyyRtZy2SROekgImn38KGRhryDo/zZxGYnKnCdhosx6SgDj+kItIdNOwifgUOqzdzHv
 BYfdvGsMi5b6MXPNly9xnKI4W7E/F9iXZiVab3qa48M4/HWiHcbSHUaAcvDWkS58uYbx
 YAQw==
X-Gm-Message-State: AO0yUKVzQ45vI/9stJ4L5RG0+lqfTHR1W0p8AgrOiR2IziK/u+5j2N0x
 tRfovTyX+K3i7518B8AyjmOZPg==
X-Google-Smtp-Source: AK7set9M0C9yM3FDz/8WI0HTV5l9du7uMeidziF6O5TWrZy93nLvSPbagLCP999z1M7JO3EVz0AxUw==
X-Received: by 2002:a17:902:f544:b0:19d:138b:7c4a with SMTP id
 h4-20020a170902f54400b0019d138b7c4amr3097982plf.3.1677476909172; 
 Sun, 26 Feb 2023 21:48:29 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 62/70] target/xtensa: Tidy translate_bb
Date: Sun, 26 Feb 2023 19:42:25 -1000
Message-Id: <20230227054233.390271-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 05:48:40 -0000

Replace ifdefs with C, tcg_const_i32 with tcg_constant_i32.
We only need a single temporary for this.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 3ea50d8bc3..e3fcd50691 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1406,19 +1406,15 @@ static void translate_b(DisasContext *dc, const OpcodeArg arg[],
 static void translate_bb(DisasContext *dc, const OpcodeArg arg[],
                          const uint32_t par[])
 {
-#if TARGET_BIG_ENDIAN
-    TCGv_i32 bit = tcg_const_i32(0x80000000u);
-#else
-    TCGv_i32 bit = tcg_const_i32(0x00000001u);
-#endif
     TCGv_i32 tmp = tcg_temp_new_i32();
+
     tcg_gen_andi_i32(tmp, arg[1].in, 0x1f);
-#if TARGET_BIG_ENDIAN
-    tcg_gen_shr_i32(bit, bit, tmp);
-#else
-    tcg_gen_shl_i32(bit, bit, tmp);
-#endif
-    tcg_gen_and_i32(tmp, arg[0].in, bit);
+    if (TARGET_BIG_ENDIAN) {
+        tcg_gen_shr_i32(tmp, tcg_constant_i32(0x80000000u), tmp);
+    } else {
+        tcg_gen_shl_i32(tmp, tcg_constant_i32(0x00000001u), tmp);
+    }
+    tcg_gen_and_i32(tmp, arg[0].in, tmp);
     gen_brcondi(dc, par[0], tmp, 0, arg[2].imm);
 }
 
-- 
2.34.1


