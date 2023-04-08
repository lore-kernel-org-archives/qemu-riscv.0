Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYJ-0007IF-7C
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYI-0007HJ-Cj
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:42 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY3-0005cy-8I
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:41 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 90-20020a17090a0fe300b0023b4bcf0727so223754pjz.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xzu39GMRV6RuI6NlIOVSyEEbNk34csPDYcvNvBnA8aU=;
 b=BV4QZLoD9jWd/KXOoAfWwR5QX2ZB5xwkbSayYZPtKFJA7xaXLzTS5HqJyGZPLYlOm2
 dNfmSkrBjBUqD/vKNXWMPv0ZBfxpU2GmNNAhhaZpdxqKYcZoFfYW/pqwtQYtmKU6FaOL
 9k+grM5btznLFtRGn10n4ASK4z4v6zk5JwwuUpfenyBGsPISlJ0koP0ZLSK9hOzK+LeW
 f5781+DGyR48TS2OAUabQUWlK52TxLbY2bzlt85j2Oj3IBFYwXsGnLxZ5CCbw9XMaDuc
 p60Pvtg7tS8bL/6+B9+3kxiUzfsngtCpnK7NS/KcZlzM/cCSHWtnoUH4cvFnBp9MP5ST
 R8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xzu39GMRV6RuI6NlIOVSyEEbNk34csPDYcvNvBnA8aU=;
 b=8SVjX4ZWTTw2dSI98TmQBbq/OROfByYubkWWNTnbd5O1xCJVd9W/GIcFB2CZhwxQ+P
 ssqWdQZ5Z2HXvwBJG3m6rmcA9XNVSIu0Nmu3n+GYW305+riIBqLxiO9eEeCB77sKYoYM
 FdggM55nJU/s9pNahq50S+i3RJDLP2jeRpvxMtkkSDJKSGFwZbcQG3NCgA+BGOwR05Au
 w9UYIG4mGL/QWi7gR7T6WU4UMQo1DCpkEr+3ZqClsNCh/sab7iuVPgOTa7r2EwnNMU/g
 IZpffYuZ61AQV+vAI3uELDyHnt/FYKKq9GPLxLsa0fqsSf8ODGDLAWCWarWJIozysqHq
 PqYA==
X-Gm-Message-State: AAQBX9fcaXWUGEXWUIeEsnI7jIyBRf60Owd92HXuUNo8mdk/uhtsvxox
 J4fgoTa9aCnPdT8ti+O8PydET0p1yJdBvKyMwQc=
X-Google-Smtp-Source: AKy350bjlN+g2dEDL+Z3hNVyW7nM9r6v61fMZl9pFSqzL5F7FEXY6cKd1tSdEX94EpmipjKaNZB7PA==
X-Received: by 2002:a17:903:68d:b0:1a5:f:a7c7 with SMTP id
 ki13-20020a170903068d00b001a5000fa7c7mr4317569plb.0.1680921805877; 
 Fri, 07 Apr 2023 19:43:25 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 10/42] tcg/loongarch64: Conditionalize tcg_out_exts_i32_i64
Date: Fri,  7 Apr 2023 19:42:42 -0700
Message-Id: <20230408024314.3357414-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:43:42 -0000

Since TCG_TYPE_I32 values are kept sign-extended in registers,
via ".w" instructions, we need not extend if the register matches.
This is already relied upon by comparisons.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 989632e08a..b2146988be 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -458,7 +458,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
 {
-    tcg_out_ext32s(s, ret, arg);
+    if (ret != arg) {
+        tcg_out_ext32s(s, ret, arg);
+    }
 }
 
 static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
-- 
2.34.1


