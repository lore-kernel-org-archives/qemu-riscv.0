Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHv0H-00017M-Gu
	for mharc-qemu-riscv@gnu.org; Tue, 17 Jan 2023 18:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv0C-000156-7j
 for qemu-riscv@nongnu.org; Tue, 17 Jan 2023 18:04:24 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv09-0008PP-7N
 for qemu-riscv@nongnu.org; Tue, 17 Jan 2023 18:04:23 -0500
Received: by mail-pj1-x102a.google.com with SMTP id b10so2458091pjo.1
 for <qemu-riscv@nongnu.org>; Tue, 17 Jan 2023 15:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b0RaJxHriq3Te1EB6P00dNqAISsg79vtZKWwbbnq+Yk=;
 b=WGlollt1g4CKFpfPYo2emR9kAiDj7nchGDk/FRN/y8gLAzGtk+4z6Xa0yVzZcb7O/m
 PQFUSmrfb8frmwjBQrTG9yNYxMKoVOTo8E9bkugBW82N53oiLbL8sRVSBnzsXInpERUc
 EDjKaZNPBYO46B/eWrrQ/exn0pGMDko1NX20P2WrV1oEjHrxweVpWjG6dCFMzkwvfUTv
 nWFT1H+lNJyHvDkjiqmCCZX8Wjtp9xZTsJuCPGjPJlI2YXkiAFhvbNwE1NyKevrtRpFe
 HQRmPQ+PvBtImm7CE8wZKArqpTlWCZ3ZqEWufm7sdjYsqs73hAsQ9+dxTJMMUDZQOvu5
 jUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b0RaJxHriq3Te1EB6P00dNqAISsg79vtZKWwbbnq+Yk=;
 b=JUy5FMk2dnijE/unHvg+yhfhWJSV9RIDzlDCZr5j6A1MoOrNsMvrJAHeZJ06qgzL+y
 TsgJlY9/AyOCd8h6nX9QYCnnin/Pxl+d0v/pLgFbK804VTI767vpCktqBdF1IXfd9D4b
 JH/DdeRO54ikFAMgIIdEAxAcrw4PPFqOdGvecEQ3qoV0Z1obreeP26L6HGARAS5/BgId
 upbfgnGgO+b5TAP2lR3+eJ6mfegQ1jjyDqX/A/EHQj13/SDCCEnYfDIrCbA0Db8EK7QY
 UOPUbKAWZOrrv8G6KHce76gjzzrC669j/rdYxl3mxUmWdACpciEZueXgg48YGxsmH4SN
 u0wA==
X-Gm-Message-State: AFqh2kpaS9pFY8Qdx3dISX7ZhPt/aDAGp+uIXxf+BBWckyqLYY9M8v9V
 FoXPquil3pl3YeZrfy7J/mGeIA==
X-Google-Smtp-Source: AMrXdXv+rod9RRDt00JJK4cjUHTk68MqtlVo0xjW96Ngz20atc5z7KTG6iav+PpI/J+lQxoYA5vJcA==
X-Received: by 2002:a05:6a21:3282:b0:b8:c29f:1c01 with SMTP id
 yt2-20020a056a21328200b000b8c29f1c01mr5809347pzb.27.1673996659490; 
 Tue, 17 Jan 2023 15:04:19 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a63e24d000000b00478eb777d18sm17996936pgj.72.2023.01.17.15.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:04:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Alistair.Francis@wdc.com
Subject: [PATCH] tcg/riscv: Use tcg_pcrel_diff in tcg_out_ldst
Date: Tue, 17 Jan 2023 13:04:15 -1000
Message-Id: <20230117230415.354239-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 17 Jan 2023 23:04:24 -0000

We failed to update this with the w^x split, so misses the fact
that true pc-relative offsets are usually small.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index fc0edd811f..01cb67ef7b 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -599,7 +599,7 @@ static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
     intptr_t imm12 = sextreg(offset, 0, 12);
 
     if (offset != imm12) {
-        intptr_t diff = offset - (uintptr_t)s->code_ptr;
+        intptr_t diff = tcg_pcrel_diff(s, (void *)offset);
 
         if (addr == TCG_REG_ZERO && diff == (int32_t)diff) {
             imm12 = sextreg(diff, 0, 12);
-- 
2.34.1


