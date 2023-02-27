Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWI4-0002xl-Hd
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWI3-0002u0-1T
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:11 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHx-0004lW-V0
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:10 -0500
Received: by mail-pf1-x433.google.com with SMTP id fd25so2815662pfb.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0nmZI0+w1F7+8GnTL6IOgNGmXVjRV/sPnzdawMkimPw=;
 b=K8J/HxW0kYm5MJYbIN1+NHclfSdEHUG7kRD5dK3ljLUzPY/O/eS3zPjZU+6C1MksUe
 jZXDFI76tpfAUMvXWXMBcmY7+9ZYWk55GyUsveT5VUhhl8MxDy7BkSafu0jgsVH7ytwS
 A29yeGul3VsuxaAg4Sc8Ng+tkVqjgKDH3HOHx/fQBK6IIFaPRpunAnngWTIH9TtEsc6T
 t2AxIQoXlQk5I93wYlyXRqyC7HhwPw9MUQHDk4JWgsmYI64owIOpubEgVmKO6y4qQrhe
 Mbsv9Z7exMhrsI3MLdVRgMKjPG9OdgYTpocZiVrhDqesaU/CEUStYA6urFMfQ7dobHfi
 i/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0nmZI0+w1F7+8GnTL6IOgNGmXVjRV/sPnzdawMkimPw=;
 b=nFb5II94+N5yGPS+ze2hqMQyJMl6ySHmlS/QvG+k4e2L33oO0nls3/moUJ6bBKIWQ6
 qKTIlaNWc53nbIoYH4xRsROq4XyVp712Zw8UcEtj3FaatVreqTzTf2YthAHk8G5ms26u
 wRg3IkLCUvUF96qLx6tAkqYYdHB/ZqTcn2qS/nXSqYWun294dZp8BS8p+AMVzDu6SZ0H
 t7N+yOMQYmc3qUfd1qbEni8Drn31zKNzeCUefPm9jqujws0TMhCyK5gnQYRVLncTwcgT
 MzHQEySiyn3hwPRmMH2a8RGIzQNj2M+C/D7u9tk6AUjoFjYN0LDcCgVqOSUbeCTSVJkh
 BhXg==
X-Gm-Message-State: AO0yUKULVLKLgU0B6LseNYwTjfaNMMxfQJE/At6cpgouWvV/bcKMqrKN
 MSO6NwvDlO1gSnVBT4nAfBtv1w==
X-Google-Smtp-Source: AK7set8/XKone4qDcYcLd3GNYQG8GsiZhURoLkiZubfYsD+C8MXBPbhLIsMeQPbbPmFALgnG165eJA==
X-Received: by 2002:aa7:96a1:0:b0:5f1:468b:c88 with SMTP id
 g1-20020aa796a1000000b005f1468b0c88mr3280250pfk.27.1677476585074; 
 Sun, 26 Feb 2023 21:43:05 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 08/70] target/arm: Avoid tcg_const_* in translate-mve.c
Date: Sun, 26 Feb 2023 19:41:31 -1000
Message-Id: <20230227054233.390271-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:43:11 -0000

All uses are in the context of an accumulator conditionally
having a zero input.  Split the rda variable to rda_{i,o},
and set rda_i to tcg_constant_foo(0) when required.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-mve.c | 54 ++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 9744bf3de0..31fb2110f1 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1150,7 +1150,7 @@ static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenLongDualAccOpFn *fn)
 {
     TCGv_ptr qn, qm;
-    TCGv_i64 rda;
+    TCGv_i64 rda_i, rda_o;
     TCGv_i32 rdalo, rdahi;
 
     if (!dc_isar_feature(aa32_mve, s) ||
@@ -1177,21 +1177,22 @@ static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
      * of an A=0 (no-accumulate) insn which does not execute the first
      * beat must start with the current rda value, not 0.
      */
+    rda_o = tcg_temp_new_i64();
     if (a->a || mve_skip_first_beat(s)) {
-        rda = tcg_temp_new_i64();
+        rda_i = rda_o;
         rdalo = load_reg(s, a->rdalo);
         rdahi = load_reg(s, a->rdahi);
-        tcg_gen_concat_i32_i64(rda, rdalo, rdahi);
+        tcg_gen_concat_i32_i64(rda_i, rdalo, rdahi);
     } else {
-        rda = tcg_const_i64(0);
+        rda_i = tcg_constant_i64(0);
     }
 
-    fn(rda, cpu_env, qn, qm, rda);
+    fn(rda_o, cpu_env, qn, qm, rda_i);
 
     rdalo = tcg_temp_new_i32();
     rdahi = tcg_temp_new_i32();
-    tcg_gen_extrl_i64_i32(rdalo, rda);
-    tcg_gen_extrh_i64_i32(rdahi, rda);
+    tcg_gen_extrl_i64_i32(rdalo, rda_o);
+    tcg_gen_extrh_i64_i32(rdahi, rda_o);
     store_reg(s, a->rdalo, rdalo);
     store_reg(s, a->rdahi, rdahi);
     mve_update_eci(s);
@@ -1258,7 +1259,7 @@ static bool trans_VRMLSLDAVH(DisasContext *s, arg_vmlaldav *a)
 static bool do_dual_acc(DisasContext *s, arg_vmladav *a, MVEGenDualAccOpFn *fn)
 {
     TCGv_ptr qn, qm;
-    TCGv_i32 rda;
+    TCGv_i32 rda_i, rda_o;
 
     if (!dc_isar_feature(aa32_mve, s) ||
         !mve_check_qreg_bank(s, a->qn) ||
@@ -1278,13 +1279,14 @@ static bool do_dual_acc(DisasContext *s, arg_vmladav *a, MVEGenDualAccOpFn *fn)
      * beat must start with the current rda value, not 0.
      */
     if (a->a || mve_skip_first_beat(s)) {
-        rda = load_reg(s, a->rda);
+        rda_o = rda_i = load_reg(s, a->rda);
     } else {
-        rda = tcg_const_i32(0);
+        rda_i = tcg_constant_i32(0);
+        rda_o = tcg_temp_new_i32();
     }
 
-    fn(rda, cpu_env, qn, qm, rda);
-    store_reg(s, a->rda, rda);
+    fn(rda_o, cpu_env, qn, qm, rda_i);
+    store_reg(s, a->rda, rda_o);
 
     mve_update_eci(s);
     return true;
@@ -1396,7 +1398,7 @@ static bool trans_VADDV(DisasContext *s, arg_VADDV *a)
         { NULL, NULL }
     };
     TCGv_ptr qm;
-    TCGv_i32 rda;
+    TCGv_i32 rda_i, rda_o;
 
     if (!dc_isar_feature(aa32_mve, s) ||
         a->size == 3) {
@@ -1413,15 +1415,16 @@ static bool trans_VADDV(DisasContext *s, arg_VADDV *a)
      */
     if (a->a || mve_skip_first_beat(s)) {
         /* Accumulate input from Rda */
-        rda = load_reg(s, a->rda);
+        rda_o = rda_i = load_reg(s, a->rda);
     } else {
         /* Accumulate starting at zero */
-        rda = tcg_const_i32(0);
+        rda_i = tcg_constant_i32(0);
+        rda_o = tcg_temp_new_i32();
     }
 
     qm = mve_qreg_ptr(a->qm);
-    fns[a->size][a->u](rda, cpu_env, qm, rda);
-    store_reg(s, a->rda, rda);
+    fns[a->size][a->u](rda_o, cpu_env, qm, rda_i);
+    store_reg(s, a->rda, rda_o);
 
     mve_update_eci(s);
     return true;
@@ -1436,7 +1439,7 @@ static bool trans_VADDLV(DisasContext *s, arg_VADDLV *a)
      * No need to check Qm's bank: it is only 3 bits in decode.
      */
     TCGv_ptr qm;
-    TCGv_i64 rda;
+    TCGv_i64 rda_i, rda_o;
     TCGv_i32 rdalo, rdahi;
 
     if (!dc_isar_feature(aa32_mve, s)) {
@@ -1458,28 +1461,29 @@ static bool trans_VADDLV(DisasContext *s, arg_VADDLV *a)
      * of an A=0 (no-accumulate) insn which does not execute the first
      * beat must start with the current value of RdaHi:RdaLo, not zero.
      */
+    rda_o = tcg_temp_new_i64();
     if (a->a || mve_skip_first_beat(s)) {
         /* Accumulate input from RdaHi:RdaLo */
-        rda = tcg_temp_new_i64();
+        rda_i = rda_o;
         rdalo = load_reg(s, a->rdalo);
         rdahi = load_reg(s, a->rdahi);
-        tcg_gen_concat_i32_i64(rda, rdalo, rdahi);
+        tcg_gen_concat_i32_i64(rda_i, rdalo, rdahi);
     } else {
         /* Accumulate starting at zero */
-        rda = tcg_const_i64(0);
+        rda_i = tcg_constant_i64(0);
     }
 
     qm = mve_qreg_ptr(a->qm);
     if (a->u) {
-        gen_helper_mve_vaddlv_u(rda, cpu_env, qm, rda);
+        gen_helper_mve_vaddlv_u(rda_o, cpu_env, qm, rda_i);
     } else {
-        gen_helper_mve_vaddlv_s(rda, cpu_env, qm, rda);
+        gen_helper_mve_vaddlv_s(rda_o, cpu_env, qm, rda_i);
     }
 
     rdalo = tcg_temp_new_i32();
     rdahi = tcg_temp_new_i32();
-    tcg_gen_extrl_i64_i32(rdalo, rda);
-    tcg_gen_extrh_i64_i32(rdahi, rda);
+    tcg_gen_extrl_i64_i32(rdalo, rda_o);
+    tcg_gen_extrh_i64_i32(rdahi, rda_o);
     store_reg(s, a->rdalo, rdalo);
     store_reg(s, a->rdahi, rdahi);
     mve_update_eci(s);
-- 
2.34.1


