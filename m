Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2So-00054S-1q
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2SG-0004ct-Eg
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:05:58 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2SC-0000hH-8Y
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:05:49 -0400
Received: by mail-pl1-x629.google.com with SMTP id n14so31378543plc.8
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmUvCy83uzUq+qlSl4tyoYDR2G5J3ycXbuZkZjm5Y8A=;
 b=cmOwmafpbsmaiup0Fx3Gq3QK69Vg+LMvab9ZqnBld569dNYjqMhMxSGOTKThXUHETi
 qEFszH/krJKAWg+PegHJf1jyTtVlIzrhlb1KAM5UJQI23ux5lIinr2SV9AAIXVmMK8Qz
 suIV60BPI66oQB6DSCKFUlDKX6XxDlfyqKJS5pZY7wsHbHBO9eZpR56vVwIRaG42TIok
 A7+BnyobXNovkQ/jdD5T09FWiPWKnsIyxQKr+kKLPxwAjqZcXbEZyjy7n8Rnz1k/MCZC
 TkhDzR45/sjk6KsO9yMUNMpe4qPeRpjmflXDhh1WR/lYTkUtMFBYJ5ACRs5jKFI1eqUK
 uzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wmUvCy83uzUq+qlSl4tyoYDR2G5J3ycXbuZkZjm5Y8A=;
 b=w1u0vJRxnLzeaD1eiQ/COxkYrjzB+CbhNmY3xuz+A5PynhNQ7xSH19PXyHJJvPk/pL
 yfNRKDHRj4bB46DV1harWWTnyzs3tcCBCcf75Vdz7ONfiMyXcWM51Gb/yVCEhENqQVHj
 bZpbmlr4wWHe90EOyBGjUlXKb8U8M+OKV+/aqalHKi8M9m+gj32AsdTrMQB6ORy97tEQ
 Lqu5ACChtOdb6pnb6AaFFAAafNe4bpoaWflqhQk0hX0TkbxMKQVMFGMfUldJWP/IvXpJ
 G++MbJvm0VGHRatE4u/d/tAvfHDmIxoTLBA4x+VCEMY8MmlvbfDUPkf6UYvokPIgaSGo
 peWA==
X-Gm-Message-State: AAQBX9ew/imfgx5sl2s2/vz2LI7zzgR2dDaBGQfWk3FIcXdl6K/sTIPF
 SY9GZQ6gCo5tsRJmo06PPtQmndwlagUdcwPnhLFssQ==
X-Google-Smtp-Source: AKy350aKqAJxAZkYykC2qG+p917VanIQoruXIDDeqkbMZBK0h5AQuxvKksR1NCcc9nb97b7+DV95Ww==
X-Received: by 2002:a05:6a20:6691:b0:ea:f140:c692 with SMTP id
 o17-20020a056a20669100b000eaf140c692mr1645842pzh.9.1681175146728; 
 Mon, 10 Apr 2023 18:05:46 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:05:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 12/54] tcg/riscv: Conditionalize tcg_out_exts_i32_i64
Date: Mon, 10 Apr 2023 18:04:30 -0700
Message-Id: <20230411010512.5375-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:06:03 -0000

Since TCG_TYPE_I32 values are kept sign-extended in registers,
via "w" instructions, we need not extend if the register matches.
This is already relied upon by comparisons.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 7bd3b421ad..2b9aab29ec 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -604,7 +604,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
 {
-    tcg_out_ext32s(s, ret, arg);
+    if (ret != arg) {
+        tcg_out_ext32s(s, ret, arg);
+    }
 }
 
 static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
-- 
2.34.1


