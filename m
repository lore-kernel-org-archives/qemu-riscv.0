Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqox5-0005Jt-Cf
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowz-0005Cm-C9
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:21 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowp-0004EF-B9
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:21 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so63431495e9.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314867; x=1684906867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0fR1b522KKsIelYZfiuxLUq8SgNfFMeT4gqF0CUIbNU=;
 b=RADtIJhDr5EG/Rj6SUP2fKHSeCECGxxk1crSfv3iEca5bbWFmxfcMl/nQUXMwhKIdu
 ka+YVSa2HOUpX9zyYkaC5AtVBNXpHANRhe6ezTR83p9xp5wWog1xQaPzVAYZabUpeFsB
 AIaSkriboY4DUwyt27jazZUCrs4Nyx5LjFYx6r0PQ18jJHYBoZ73BFsgShNB0H3hrtL6
 aXUONEcIiS/jgjSRSSAu24NBEXp4ryIcteF6Z1qn1FnhMHFpSlPgfMZrV3sjRC7WXn0W
 z3F+f4JXxPO4DottMedSErUN5HAS8F+VKZBWnyO+1AuuESPkKgO0GBBOJoN+OL370IYF
 eO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314867; x=1684906867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0fR1b522KKsIelYZfiuxLUq8SgNfFMeT4gqF0CUIbNU=;
 b=cUTQa4ujNZv+xQBdbe98GU6kF+ttBihDh5H5USG+/3pLfvhxIzNp1yj8MV/luT/dzC
 CYK2fsYiuu9lP+99e/CrR/+tjvay+dTS3VOaGcqzGMaTvaxy6OIBFGNc6SmoiUslqftp
 YdH+jnDC/odN6sHHddj4fGLblGsjhgUVwxQUmY0iFDZ7c91iMLe1mncS3tD0jnCjpk8L
 Wj7m3LeFto327kF/cGkbEVPWBGVd50foQljzoUbDclkIT3PS84NUbHryxYLby11COtvm
 y4o3ZpWgem5ece18ROiQV8gRjxo/EeoPA9gtom5T8YrLViushvma27Me604MwB+rsZPi
 Pj8Q==
X-Gm-Message-State: AAQBX9fqgSu5oI/gbvVokEtUAWBwsnG5Q3yb1A5/dfpd8/spg7+NopEO
 NV2nq3kX8YV4/Gf9wLzN/nxqlA==
X-Google-Smtp-Source: AKy350a7QZW5dNBt3CrI/Io1SCRyC6vUQ6U4dyvMNaZXhEHOhmHGigSaTByZDRgbx9TG1xnWS9R7vQ==
X-Received: by 2002:adf:e711:0:b0:2ef:84c:a4bc with SMTP id
 c17-20020adfe711000000b002ef084ca4bcmr13177344wrm.19.1682314867709; 
 Sun, 23 Apr 2023 22:41:07 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 02/57] tcg/mips: Conditionalize tcg_out_exts_i32_i64
Date: Mon, 24 Apr 2023 06:40:10 +0100
Message-Id: <20230424054105.1579315-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 05:41:21 -0000

Since TCG_TYPE_I32 values are kept sign-extended in registers, we need not
extend if the register matches.  This is already relied upon by comparisons.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 346c614354..a83ebe8729 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -582,7 +582,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
 {
-    tcg_out_ext32s(s, rd, rs);
+    if (rd != rs) {
+        tcg_out_ext32s(s, rd, rs);
+    }
 }
 
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
-- 
2.34.1


