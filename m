Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2Sq-0005GX-LE
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2SN-0004eH-UP
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:00 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2SJ-0000V5-VR
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:05:58 -0400
Received: by mail-pl1-x632.google.com with SMTP id q2so11145659pll.7
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u5kfPeOZxNEGGOBoG05frDf+J9LPWAmPL1Hbxg7J1Ic=;
 b=pwXZhKpan0IPi+5Q9W/jlStrSUj+zZ9TCBlwY7LbNs0YF1GZ3cjFcZCFsjqd+OGUTk
 NGoji/Ov55oIYfoi1MI45Etd0JAE31RP3kV/NAs5qCDacNQ1jm0iL67lGpehWrvtYtHh
 +kJ9nHlZCYtFcgfsWlp1BgJASPmQA2MtBea/4WO4z1eWrH4v3QvbckJSoFLi23U32CQw
 8zGgpiFLY/O2vi/k0Q5VbQkoUVLwritOLH420cjI/ErfVkC28vhvD7uj1ieYiCqyOhfG
 Wh8KVNGrwxHFdIJ8U9n3HK/atCpYOX6KZcIn2dRNbE0WX9Pu1Fc2CviDsG/Ry9bbqyVd
 F6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u5kfPeOZxNEGGOBoG05frDf+J9LPWAmPL1Hbxg7J1Ic=;
 b=OYiPzcT0q9lfJd/CwFTVLJeq/BbQP7Kij5Rrs9TDkopEo3gg4zbBUZ8Irimm5Sm3cF
 WTvTL6KmdTzFXESa9S8VoOfzNS8INq6gAHD4BMogSbLOf78xjJLDIFOzxWZ9HLGiIR+J
 3/UhiEMA5wZOeUMS1iLLLfE/7UCGzKf61vCYRMkHWuL00YYPuYJpLPpld5JYMZmCmSbe
 GeipRrOr9bNBIEig9t+Sjs6fVr0vjIY/McojZZBVp3CA4Y1nVwb7Tfi5jaZAnf6BcNU2
 hbUVrjnklIixh0spamVz+H2vodvVfvNRwx3pbl+LfoUXZOuHLpsqEWvCZX48liekzREV
 8SgA==
X-Gm-Message-State: AAQBX9c3dDz5GZG9+aLqOPKvDMBN/8J1uW2uAvCuxYfK6us9yejSES7k
 vqmCJKmQd13gMBGDC4JEAVZHjA==
X-Google-Smtp-Source: AKy350Z9aWkHnIQe1IjMeRs24pay2g1n2X0EuVCXb9V/Jpr3NkkvO87ISMC7ovUl8QdQp9G7jClPNA==
X-Received: by 2002:a17:902:e392:b0:1a3:d5af:9b73 with SMTP id
 g18-20020a170902e39200b001a3d5af9b73mr750305ple.58.1681175154474; 
 Mon, 10 Apr 2023 18:05:54 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:05:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 14/54] tcg/i386: Conditionalize tcg_out_extu_i32_i64
Date: Mon, 10 Apr 2023 18:04:32 -0700
Message-Id: <20230411010512.5375-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:06:04 -0000

Since TCG_TYPE_I32 values are kept zero-extended in registers, via
omission of the REXW bit, we need not extend if the register matches.
This is already relied upon by qemu_{ld,st}.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 40d661072b..a156929477 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1306,7 +1306,9 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
 
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
 {
-    tcg_out_ext32u(s, dest, src);
+    if (dest != src) {
+        tcg_out_ext32u(s, dest, src);
+    }
 }
 
 static inline void tcg_out_bswap64(TCGContext *s, int reg)
-- 
2.34.1


