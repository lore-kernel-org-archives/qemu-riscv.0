Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWJT-0007l4-TF
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJM-00077D-LX
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:44:32 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJA-0005Xa-Sz
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:44:30 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 132so2822953pgh.13
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4GAyAzn2ZAR1Xu40Rif6JsZO69wqLVIHDcxI5i2jvKA=;
 b=akYJCbEx4Mz8DVowhrD2O3jxEtkwnC/v46zN4VlbzCODRxaAu9HTPum1MzvvBSAVTm
 Bkl+CkiJi+c4+EyW+gkoMC3Mbar5T5aJ7UKgg1UgFs4AX3Z3D93Y95pvB/luRK+HJfuj
 UIkGV9IJ87f/+8XomXrRDMKzBrhlkwYNTcycmM5Ykzpmdib/YlCTiSkPqF6G1U0DQmAN
 geb1D/IdUBzpXlxfFiKTAabrSqj2CuyA5JOoWsIanOgGEOESoomEmSM+d53SNuZwf7kI
 YRhPvX9XvBG+UfLuLago5o+U3tRe5ukzapOEPL/9vZ0uWX+Mjm3MehhnHVc6SF8ubJwh
 h5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4GAyAzn2ZAR1Xu40Rif6JsZO69wqLVIHDcxI5i2jvKA=;
 b=j1sO4r4Db2sA5SvYjDxiWDgcAkVaWDUM2WnhMow3qjjZRLM50Pd/64sRrtg/QPE4TQ
 C9zWqCooqghBK3yhMu05Y9jPaaK5cQp0S2I1HLw6AED7jwh0w3qkDtEvUGqzUoVadEL/
 Xvw6EpQ3M10OW+cfB1k1i7TsJpFYqRsBTpGYDLj7NUSU6S+9B0GHZZHhSZgT2PHlCvvr
 Nod8SWiyln3kVgX5uK2XokjVL+nDaqXurYnEgmqb0XZBAChsAjT6Re5zSqjJaUA6vP4k
 hf+uEUFGbU6YKttcN2+sz+UkAQJ6zwI/p75PEtubW387fZj9159l2gmXVd4QZ9sXyl8d
 l4cw==
X-Gm-Message-State: AO0yUKWKX1PzDfmLZ2+5MHo2oL6KbRm7l0cMVzYMrb3K76UVgcaehZm5
 zxT365i07V05FEFgtss/d7H5zQ==
X-Google-Smtp-Source: AK7set8D9QmFnAJBxjZ5ruC6nBxqWl0y6q/o5fdlTZR3Yfz6T0+AL/yobqfUdsoxOtUrJ5XB9QnIZw==
X-Received: by 2002:aa7:8ecc:0:b0:5a8:bcf2:125 with SMTP id
 b12-20020aa78ecc000000b005a8bcf20125mr18566963pfr.21.1677476658975; 
 Sun, 26 Feb 2023 21:44:18 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:44:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 36/70] target/ppc: Avoid tcg_const_i64 in do_vcntmb
Date: Sun, 26 Feb 2023 19:41:59 -1000
Message-Id: <20230227054233.390271-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:44:33 -0000

Compute both partial results separately and accumulate
at the end, instead of accumulating in the middle.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/vmx-impl.c.inc | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 7af6d7217d..ca27c11d87 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2236,24 +2236,25 @@ static bool trans_MTVSRBMI(DisasContext *ctx, arg_DX_b *a)
 
 static bool do_vcntmb(DisasContext *ctx, arg_VX_mp *a, int vece)
 {
-    TCGv_i64 rt, vrb, mask;
-    rt = tcg_const_i64(0);
-    vrb = tcg_temp_new_i64();
+    TCGv_i64 r[2], mask;
+
+    r[0] = tcg_temp_new_i64();
+    r[1] = tcg_temp_new_i64();
     mask = tcg_constant_i64(dup_const(vece, 1ULL << ((8 << vece) - 1)));
 
     for (int i = 0; i < 2; i++) {
-        get_avr64(vrb, a->vrb, i);
+        get_avr64(r[i], a->vrb, i);
         if (a->mp) {
-            tcg_gen_and_i64(vrb, mask, vrb);
+            tcg_gen_and_i64(r[i], mask, r[i]);
         } else {
-            tcg_gen_andc_i64(vrb, mask, vrb);
+            tcg_gen_andc_i64(r[i], mask, r[i]);
         }
-        tcg_gen_ctpop_i64(vrb, vrb);
-        tcg_gen_add_i64(rt, rt, vrb);
+        tcg_gen_ctpop_i64(r[i], r[i]);
     }
 
-    tcg_gen_shli_i64(rt, rt, TARGET_LONG_BITS - 8 + vece);
-    tcg_gen_trunc_i64_tl(cpu_gpr[a->rt], rt);
+    tcg_gen_add_i64(r[0], r[0], r[1]);
+    tcg_gen_shli_i64(r[0], r[0], TARGET_LONG_BITS - 8 + vece);
+    tcg_gen_trunc_i64_tl(cpu_gpr[a->rt], r[0]);
     return true;
 }
 
-- 
2.34.1


