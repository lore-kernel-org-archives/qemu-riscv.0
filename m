Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW84-0003w1-H9
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6p-0008S3-SY
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:38 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6l-0000R3-TT
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:35 -0500
Received: by mail-pj1-x1030.google.com with SMTP id oj5so898576pjb.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=agy/u0GMKA+XJZ7eZrr4m/SwvDijeZedhgSDznlTFuI=;
 b=fuzeETEEiQNzPI/I3KBVJ2gdT9a3y7Fyf1C1b8rQsWfmz46+tqtnXPdBMD9rBztO0s
 qW5KJLjvnr2Ym7HGWF51s1XPMnN0sybTDOC7v86zLOcZnZrVGvZ4952exU3Lz2vQL6bn
 BkcfMO5q/XS6qM5lxvLovvw8YYiX6GQARJ/i85DvFDsBjVX6K7ZPQdMWix015b+JZnZX
 52sVGZpBAPvNnjPfMVan4GlQq1DSEWBOdVU61rrkUAxYesEp1MGu0vN5GYurR9AsiWZZ
 de5dD/u2/QGVHGlZRiHTh/+nUUbrSvM+z0STomXVGS9AMOufo7t+VCMCXUfV6J8CICnG
 9X7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=agy/u0GMKA+XJZ7eZrr4m/SwvDijeZedhgSDznlTFuI=;
 b=RUgF0PCSPVePNHjPGoZUvalS9fmzHZ+76q8+G28XDBivBewTjsUhHTwlKzSFUFiNYM
 v/Wp7r1Afnye0yQIkBw2PVtlpAb8VNmiQUDZ2g9RbPtzmByjWNXl1rEN1/lt30gmbX8B
 FcuQ+8jOAlvNnkVcjU2s/r1EQWuYv0K6OV12i8DSc8T9WW26P5vXNZFA+70+JNKWWuZk
 +EsYBYDa6KBCK5MHDcIFiae+6lyFeumsCbZkE+MzDlYbZ4GjGgZJuY0hWeoi+xqeGOpn
 zdfeRvdY5VO3JVvvCn1pyUf6WXYiIL3KeXenQ92BqqQpPddB/XxnqyvON3x4VG5OC7iR
 P3jA==
X-Gm-Message-State: AO0yUKUJ1XnOu/JrXQ09WidKmpDs7BE0WWdISYE25oGT9D0IQxQSRWqH
 XwByUZT0ojkH2DV5Wdlap3KhfQ==
X-Google-Smtp-Source: AK7set9bYL8FG+IZiUFnUy/jQO+95TRQp33CwPaBWy9mx+7DkeYE0bT0UXX6oMVnBI8UQ2zoSQqXxQ==
X-Received: by 2002:a17:90b:180c:b0:237:d867:222c with SMTP id
 lw12-20020a17090b180c00b00237d867222cmr5447629pjb.42.1677475890878; 
 Sun, 26 Feb 2023 21:31:30 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 71/76] target/xtensa: Drop reset_sar_tracker
Date: Sun, 26 Feb 2023 19:25:00 -1000
Message-Id: <20230227052505.352889-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:31:40 -0000

Translators are no longer required to free tcg temporaries.
Remove sar_m32_allocated, as sar_m32 non-null is equivalent.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 4af0650deb..910350dec6 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -57,7 +57,6 @@ struct DisasContext {
 
     bool sar_5bit;
     bool sar_m32_5bit;
-    bool sar_m32_allocated;
     TCGv_i32 sar_m32;
 
     unsigned window;
@@ -284,14 +283,7 @@ static void init_sar_tracker(DisasContext *dc)
 {
     dc->sar_5bit = false;
     dc->sar_m32_5bit = false;
-    dc->sar_m32_allocated = false;
-}
-
-static void reset_sar_tracker(DisasContext *dc)
-{
-    if (dc->sar_m32_allocated) {
-        tcg_temp_free(dc->sar_m32);
-    }
+    dc->sar_m32 = NULL;
 }
 
 static void gen_right_shift_sar(DisasContext *dc, TCGv_i32 sa)
@@ -306,9 +298,8 @@ static void gen_right_shift_sar(DisasContext *dc, TCGv_i32 sa)
 
 static void gen_left_shift_sar(DisasContext *dc, TCGv_i32 sa)
 {
-    if (!dc->sar_m32_allocated) {
+    if (!dc->sar_m32) {
         dc->sar_m32 = tcg_temp_new_i32();
-        dc->sar_m32_allocated = true;
     }
     tcg_gen_andi_i32(dc->sar_m32, sa, 0x1f);
     tcg_gen_sub_i32(cpu_SR[SAR], tcg_constant_i32(32), dc->sar_m32);
@@ -1247,7 +1238,6 @@ static void xtensa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    reset_sar_tracker(dc);
     if (dc->icount) {
         tcg_temp_free(dc->next_icount);
     }
-- 
2.34.1


