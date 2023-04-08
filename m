Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkybY-00040a-8b
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkybS-0003E3-3h
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:46:58 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkybO-0007nX-MN
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:46:57 -0400
Received: by mail-pj1-x102e.google.com with SMTP id w11so238989pjh.5
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680922013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U3GQzefZ28zb/sjvcPHPQ2WB6aIN+aVY6R/9kd6URaA=;
 b=z6r62+fR/fU9gnjqCuewDYj2jsptEwsSt4+1T3QR6Pttrr7zcQPPNZZmje0/TBUugf
 9BkCKiFn99uTcUMXUYS1MrzZUMTbsIipo5TqrX4p7VSyZYtZe/or8P9wusfJN2QpeM4p
 HfSL3YGo6j1AtrKOzMeWUwLl2TmJLfGvJyQVzc5+C9H8YrGgphA/D80LHTgE7ApfbVwG
 nijMPLraV/rKqToM6REOgwYIoHIQ5bpCrRpx6y6AsoXRPBwP4Dspaky1pHirQ1CalHE4
 nh0NzDTIRXSwqGV4zu2BlkgNO3fKHmvBzOz2U7EIqr9bR6m6zLI1CPZzrDceOLIJqvjG
 umJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680922013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U3GQzefZ28zb/sjvcPHPQ2WB6aIN+aVY6R/9kd6URaA=;
 b=b+9lhyz28o8oW26p6E1wTzEt1V8JAfGeV5qy1ynLtPQO3BnA0W1/+LiiEe9stRP8SI
 3brmi60XT9xZiP44dvzH+RVCyRT8FBW4AMOECD+YO/51LBx0Xg4uv+tn1S2Lmcf8YyoL
 XdKkK8gzk2J8FP5vpZdasBH3bLfbrrOwVhZjN1ulHYgrpvS3WSH8pjBEfVVrKvNaWI7y
 OBnSr07qVSzGokxzYBqeB1xzn7capqCjVED3RJt5hcFcud84UzXnA9O1gxz8vQieh6ws
 y4WQtzM5LsqC8Rot31Q2yviDo3dmrb3gObvt4/KXNGIXspMWTwULEiuPvV/2G7uok74w
 A4Zw==
X-Gm-Message-State: AAQBX9f+6WrgJJGbu9U2CNeYWs1qRm0AALlLbwR2PZdlL1SLzbW9MWSb
 xt/UiGBPsNNOvTKzM63QKywA6az7a/5HyKiXDFk=
X-Google-Smtp-Source: AKy350Z3kpXNpfENXndLFsh9hxlTB3fKZ0TROt4ee7btuDEa2E+aC2Wxzraq+AdjO1zNy25YLMoZZw==
X-Received: by 2002:a17:902:d50a:b0:1a1:e39c:d4d1 with SMTP id
 b10-20020a170902d50a00b001a1e39cd4d1mr497545plg.67.1680922013184; 
 Fri, 07 Apr 2023 19:46:53 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a170902761000b0019aa8149cc9sm3551981pll.35.2023.04.07.19.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:46:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 41/42] tcg/sparc64: Drop is_64 test from tcg_out_qemu_ld data
 return
Date: Fri,  7 Apr 2023 19:43:13 -0700
Message-Id: <20230408024314.3357414-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 08 Apr 2023 02:46:58 -0000

In tcg_canonicalize_memop, we remove MO_SIGN from MO_32 operations
with TCG_TYPE_I32.  Thus this is never set.  We already have an
identical test just above which does not include is_64

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 086981f097..f3e5e856d6 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1220,7 +1220,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_O2, oi);
 
     /* We let the helper sign-extend SB and SW, but leave SL for here.  */
-    if (is_64 && (memop & MO_SSIZE) == MO_SL) {
+    if ((memop & MO_SSIZE) == MO_SL) {
         tcg_out_ext32s(s, data, TCG_REG_O0);
     } else {
         tcg_out_mov(s, TCG_TYPE_REG, data, TCG_REG_O0);
-- 
2.34.1


