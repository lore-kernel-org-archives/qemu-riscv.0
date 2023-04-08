Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYN-0007PO-Le
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYJ-0007Ig-HT
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:43 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY4-0005dY-4B
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:43 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 j14-20020a17090a7e8e00b002448c0a8813so4738858pjl.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2UYA/jGhRJM+9A6MoPBOmAbOd+q/t7vvHeLmOB409P8=;
 b=u2rF4fWhJ8Ci9PeVl3IYHBgjlwfx65cS/iWcV4Yf/wusb1jy9lEIU/2jxqZYTRwQQe
 MNjWj1PLEWyipIp3wzsTClT5GnWvDW1v30qKJxQM4Ew+9dk/T1qLnWLPeDgnsu1pSHIJ
 ShlgvVC+5gcQl0Se96VPjrDHy53Im1foUBnOUNNB7mUSE12H1KBeF3ZbD82yI1vyrJjQ
 xALwavkLh70NHZWYybDgRq0qkfX/U2JfANvP+GkX4wLiKiHaVNAik75CwvvuJBUh0E8f
 OciA6Mz/z5KtKSq76AgWcA9/1E1SorIFT3AFCMv0u01PH3hU/mCGjjd6Z2beUaIt1alM
 9Hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2UYA/jGhRJM+9A6MoPBOmAbOd+q/t7vvHeLmOB409P8=;
 b=oMWNmjOSD7B6vArVOq0jHtvtkFUqtq5LWF/fGh0E+SVHPCF64HxAXyKkpnoFO9J9oV
 x9OMTbMyP9mBka4fse/hOWiJYh3kk2FyqBh5SAHkVpNOAOxTb7pU5poyc90jKsWR8q1k
 7rA+oE3XSy2Ng7xvAP57/drQCuDPFrtWIARPzugNj2LKbQ3zHwr1PQWjXMaukOA8Sksy
 KmL6a9r3NCbpFzVd1wW6jIvcGpDIvmtUfpD3eVUV/6gp1urGyvUgu9QzJsroen0z4QlA
 oz9HZQxAcrwUmOAHkHgviF1c+7wSFFU46R6nJxk0ZE/qUJpQqJIJ8FJDfj7xQGnURQat
 aMKw==
X-Gm-Message-State: AAQBX9cA06jwGlyRNYLZWUGjI+ExXfrIFSrH8RSyslH5iFxLP2EwdBV4
 SJhu4Mx5srCOJyiW+DKekas+Sg==
X-Google-Smtp-Source: AKy350Y7JQrtlrM3NuyBbmPFeS2i7QarYZzA3ZiWugdBq1ZjugNMkvOz0XDHciZlcoSOX6kKL7cRtg==
X-Received: by 2002:a17:902:d192:b0:19c:e664:5e64 with SMTP id
 m18-20020a170902d19200b0019ce6645e64mr535056plb.2.1680921806724; 
 Fri, 07 Apr 2023 19:43:26 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 11/42] tcg/mips: Conditionalize tcg_out_exts_i32_i64
Date: Fri,  7 Apr 2023 19:42:43 -0700
Message-Id: <20230408024314.3357414-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:43:43 -0000

Since TCG_TYPE_I32 values are kept sign-extended in registers, we need not
extend if the register matches.  This is already relied upon by comparisons.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index df36bec5c0..2bc885e00e 100644
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
 
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
-- 
2.34.1


