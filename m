Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW7h-0001nq-Br
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6Q-0005gH-4Y
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:10 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6M-0000p2-45
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:09 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so8898405pjb.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wYL+y8pL8fUeyYxKPpZSV5KcdIFrgA/ShmRzCV44YVg=;
 b=gY/f9RH0zoGxslOmVnxn5fElATJ1Mu5GqwOu9nQFTT1Z/tQV4RtpXM978qtozChTh7
 cAYZ1jFOU0fNvmOOo43Yew+qHc7SIhH2pOFil4tYrfZIl5F1aZmbS3+6ZCNEDu0kWwvo
 QOrt6S/KElakDkVWfUiMst2RnH8jeWpAOLPCg2Lz4Ikv2CUHAxespFrEkwr53mGEMZx/
 tDe+vev1GkaeSrsfCT9cF0sTib4k27/qh1B04GUiuUyLzOOeUs+GZkIXdD4RZvj1A/14
 dMmerC41rhPfz+bAB7CHGhbzGs6NpXYcEpEUpxymqXBu0Z6IOasvURdhnUCadSY9x5Hi
 htKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wYL+y8pL8fUeyYxKPpZSV5KcdIFrgA/ShmRzCV44YVg=;
 b=Nzd2yP8Ade6qZlIyMdQe1A1qpAAorqhOGzNiuveIQVS5tw8uHN0/JDV2Rt8GHpj2cX
 l2WIgDTRic1uuPdffP7OVd9bVUMzpc8Wib9LKvCuC2xVA9DNTEcg+TeFGJHVhzOKEN8o
 4nKDjMwfMNXytUhRHdVzhVFhDWGKCLG/lBmw5OxVqXt4ppFaFIPphHCA0OAAadHnHocd
 fHqWJTsF4/q5nCmiJ83GHGWMYX+gsZbhQtx7Fm1akxZ0jzt7gxiXxAx5B0BnSNBGK5k9
 ZAMJ4ioKNQxGFladiP6xBUWdQJaE3HNISebAfWp6sbBHxmo5jeC1RgotRL1tpVq+1hbo
 2f5A==
X-Gm-Message-State: AO0yUKW6VKXXEpxHOcDNXd3rTOhk+FBdLij1HQQsmV+AsrdrWyX8tdeJ
 +GUgMGX8zro0/9e6N1BJlBVIlA==
X-Google-Smtp-Source: AK7set+MiPgvM3bLJo7lTQ1TaVXF2EZoKpC4bq5hn94QDr18RNOkcUvfKFcxbCSrZ/G3YmhveLml2A==
X-Received: by 2002:a17:90b:4a43:b0:233:f365:1d0b with SMTP id
 lb3-20020a17090b4a4300b00233f3651d0bmr24346398pjb.5.1677475864543; 
 Sun, 26 Feb 2023 21:31:04 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 62/76] target/s390x: Remove assert vs g_in2
Date: Sun, 26 Feb 2023 19:24:51 -1000
Message-Id: <20230227052505.352889-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:31:10 -0000

These were trying to determine if o->in2 was available for
use as a temporary.  It's better to just allocate a new one.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index beccd3429e..c431903c67 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1428,11 +1428,11 @@ static DisasJumpType op_andi(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_ori_i64(o->in2, o->in2, ~mask);
-    tcg_gen_and_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_ori_i64(t, t, ~mask);
+    tcg_gen_and_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
@@ -3520,10 +3520,10 @@ static DisasJumpType op_ori(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_or_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_or_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
@@ -4832,10 +4832,10 @@ static DisasJumpType op_xori(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_xor_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_xor_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
-- 
2.34.1


