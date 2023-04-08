Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYp-00086H-NW
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYo-00082D-4y
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:14 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYI-0005cW-Si
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:13 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 60-20020a17090a09c200b0023fcc8ce113so2723847pjo.4
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xHwCzrWrjIn4aTCJiRqtc9aUATfCI30+ZXph55J2XuY=;
 b=rbnmPVRIZ/bZxKYCnI476FDVMdNONDO7jTioSCjCKdJ0qeyAni86VwohJFRA0hQDTt
 0LqUVAU/D1w1llI4kDOCpzVFY+4MBG0/GfUOwJjby66QEW2gO8n38lYNZlYKeAk8ESHB
 MSpogYUzah64ec4zyrf5NgWHVTP8xjBN3BV+xKIfBEx9QXHXWWQZOf1Q+BLIk+lu4O0T
 HtcEGWcjiDXf99mcD43kl/5IyEf51XD4OdcrBrMGES45B04Yg5IJ0fyCOisjNwbyLKHk
 UPzU6yCbRVsCZBaa0X5vldrp93ygfpWpf5YV23KnQOPq7p5MHYA8TnfPbqASdXOsn/sQ
 HQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xHwCzrWrjIn4aTCJiRqtc9aUATfCI30+ZXph55J2XuY=;
 b=ZMBtbqDLZFKUCBy0u5dRhEmeZMOHZZQkeqCyhvg8idEOusfvN8qj0gORao3LCWvvyG
 PmV4QtJvO9vCqnJSqAHiGLBVozzjk19YGYu0JGS9HdecY7EizZhbZeKpion3ObgCXtHB
 PuOt+jzWGUv2UjIqkvAqrKtKHmA+GY/V0AYpkcGCjKu6psW1CbF0WG1Fc1QeSU87Vdjh
 BvOjxTtdMyq6WhPrJwvZCN9VxqFo0m8RsNwuCY2yzA+OfsdcBWv97JMTD8uoFhvRgxDf
 O//rAEynGdhqDwicFlc8LXx34xN+eHkPYj5m7L2oso/qcaHRqPKZfplOlD84ySAka9Un
 l9Ag==
X-Gm-Message-State: AAQBX9eDdW9WtC71NKOUphS2NPGUKAoRHjLLjdrWBqSrsS9zHFwrUhH0
 aEfdacQdFyJuA1ySG7y8FwrtmiNEPKe3b7Yesso=
X-Google-Smtp-Source: AKy350YoEmvWjfZsr2qAU0aeuUZSJm3mdDlzZ5ZULk+3EMlIEIFmDgGaLAPWqKA53WxDF33bPxav2A==
X-Received: by 2002:a17:903:2347:b0:1a2:a298:6f65 with SMTP id
 c7-20020a170903234700b001a2a2986f65mr5875721plh.2.1680921822089; 
 Fri, 07 Apr 2023 19:43:42 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 29/42] tcg: Move TCGLabelQemuLdst to tcg.c
Date: Fri,  7 Apr 2023 19:43:01 -0700
Message-Id: <20230408024314.3357414-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:44:14 -0000

This will shortly be used by sparc64 without also using
TCG_TARGET_NEED_LDST_LABELS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c          | 13 +++++++++++++
 tcg/tcg-ldst.c.inc | 14 --------------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 1c11f15bce..647af6c210 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -94,6 +94,19 @@ typedef struct QEMU_PACKED {
     DebugFrameFDEHeader fde;
 } DebugFrameHeader;
 
+typedef struct TCGLabelQemuLdst {
+    bool is_ld;             /* qemu_ld: true, qemu_st: false */
+    MemOpIdx oi;
+    TCGType type;           /* result type of a load */
+    TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
+    TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
+    TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
+    TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
+    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
+    tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
+    QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;
+} TCGLabelQemuLdst;
+
 static void tcg_register_jit_int(const void *buf, size_t size,
                                  const void *debug_frame,
                                  size_t debug_frame_size)
diff --git a/tcg/tcg-ldst.c.inc b/tcg/tcg-ldst.c.inc
index 403cbb0f06..ffada04af0 100644
--- a/tcg/tcg-ldst.c.inc
+++ b/tcg/tcg-ldst.c.inc
@@ -20,20 +20,6 @@
  * THE SOFTWARE.
  */
 
-typedef struct TCGLabelQemuLdst {
-    bool is_ld;             /* qemu_ld: true, qemu_st: false */
-    MemOpIdx oi;
-    TCGType type;           /* result type of a load */
-    TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
-    TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
-    TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
-    TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
-    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
-    tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
-    QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;
-} TCGLabelQemuLdst;
-
-
 /*
  * Generate TB finalization at the end of block
  */
-- 
2.34.1


