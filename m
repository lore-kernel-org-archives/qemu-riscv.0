Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqk1-0000qK-7q
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:21:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjV-00074o-Qj
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:45 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjQ-0003AW-SC
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:45 -0500
Received: by mail-pf1-x431.google.com with SMTP id fd25so867220pfb.1
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ynjwWGgj/GWnEPQQaPLH0AnCGUIHagoL6cGCq3NhAGI=;
 b=KrDXayeb9vas0zc5uqAJyddUpBGhrFYNxF5dprxpTAOZaJ4Vm7hvlIoqESaneeEFq7
 sD9k+zvhj2Ls4vrqCKYimKAdCC4QI2YNljYZ4z+ye1dRaSE9ayMXIk9Ll2DQzPVY/rDU
 AcNiUpzAA+9cV3ffVrTxh9eyaTBewNYz7CF2w1OlY686lFaeKqnq0GXLU3rucQTuKepJ
 lS+pMZTWbcjcfrwXKr7Lpsp1tzb7xfYK8fcWru8YkX0KPhYTvQ23cMmQ01k9MbzBpCa7
 711equ4A1C5mr6t7zI6JY6CwFGXyyxduFREpsYAr1mASqE2ZJjGRu68z/B2z80uC8iND
 7rTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ynjwWGgj/GWnEPQQaPLH0AnCGUIHagoL6cGCq3NhAGI=;
 b=7KhsSJ285UdH5TMsaobdOp0HhpbOnjPliL8Ut9WskdguLXgFznQWxp1/90vwNQsjGy
 9wd1EdSDJNXaHQKqReEyWztSBen04sKqviiFCweYw9JJ8W+ANo0sd1CkcXsjk4bJZd6L
 JA9e5AYRNkwbxFPIAt1k+8SKK22fyPZS6stYXNLgx9UBlmETi35H9qCKJV/hAGrHz3dP
 x46VlgmE0meKqiOaC9SnVeWI5B0E5zwdsl7z3ws60mU99gK6nfCC+fLg/ehM00Tlh/wg
 WwaaEo3jhp4pV9X1Ot9W3Ax5JWDzv6BK6UVlidOG1Or7dr9CCAFPwoJAcJGifuYWJb7Y
 Cy+Q==
X-Gm-Message-State: AO0yUKWxIs0J7yunSfteeeXiEAn+KxArYM72gE8TRs6TGHB3QgfZQpSL
 U6pHVg75BbK8TNFKKsQPVEpcwA==
X-Google-Smtp-Source: AK7set9TvEt+CiLtsYvXw/UAcozOw18T7q/pO0+3yV76FWg+M0rXyFD54NB5I2aK/b5LxbM/aZABXg==
X-Received: by 2002:a62:6454:0:b0:5a9:c2b0:428f with SMTP id
 y81-20020a626454000000b005a9c2b0428fmr17724854pfb.31.1677316837811; 
 Sat, 25 Feb 2023 01:20:37 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 71/76] target/sparc: Drop reset_sar_tracker
Date: Fri, 24 Feb 2023 23:14:22 -1000
Message-Id: <20230225091427.1817156-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:20:46 -0000

Translators are no longer required to free tcg temporaries.
Remove sar_m32_allocated, as sar_m32 non-null is equivalent.

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


