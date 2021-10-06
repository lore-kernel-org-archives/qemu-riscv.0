Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYAe3-0008CW-Kk
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 13:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdb-0007Dg-Qf
 for qemu-riscv@nongnu.org; Wed, 06 Oct 2021 13:23:28 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdX-000858-OK
 for qemu-riscv@nongnu.org; Wed, 06 Oct 2021 13:23:27 -0400
Received: by mail-pf1-x435.google.com with SMTP id q19so2482422pfl.4
 for <qemu-riscv@nongnu.org>; Wed, 06 Oct 2021 10:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3/8TAKIkdBI5Fmcc2hxFYFpwlGKE6ZLuHF22xUwszzo=;
 b=Kcr5hPwYUnrvHNdzXhMMwuDtBXf86y1qMe/BaxHaw2/PQsgpzrBkp34mnYV99pYSfI
 WlGIWhOXriUKWMBCQrtmBkXFXVz8+sEEKmOqr7efI+0O2RcOTQ3wZbb+U2ZIEHEjMLIu
 a+jMJlevtJJRxh3fDodsonarSWvL20cJPEFxg6riiDn80fxe8yK6rx3+1nP3+AIMaljJ
 tByCCYzW6JHimCvcdHgrLZZz91eKTlrfspGKund6xdkFPtjM/UDP2thGjWtbOYkeXKIu
 306+wxtx5632hZCJMHlAnpPpyu2OW63Q9Vpmc+yoYA/Nw367y+X8le1LuAk9B9PqQfWg
 Zhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3/8TAKIkdBI5Fmcc2hxFYFpwlGKE6ZLuHF22xUwszzo=;
 b=VXj+BliDEMqzwN//+ulz4BdZuPrvYPGNLlr4rL6nKa81Z/ZniEOdRASvtHi0fsGQ3Q
 QGZiUaOhaCGnxMYLxaBGi9rCNaB9ltTM1w/c01u90jpfUIyig6c4S3k9VqPmvlD/6v4E
 4fhbW0cFSN+t2t0mNOMkElKQ/BIUXkUGjhk7apL9SkwzUh2sY1375FEO9UcQOqQMlVhS
 fWg1N47XVuafqLjK9AnwpW/h7VXXrLXDOxwm1TDIXtnzz/IhzjoEuyNUCr+mJqApgfb8
 1B7r32BhbSLxtaAvVMoOOZZ7WZVxyKbt5HfaWus9p0c02r3CwcWxLD5iBVVsHXA6qh/4
 vwyA==
X-Gm-Message-State: AOAM532wtzxjreWtjsHV9XpyTchm0vvrPwaUQpGd/YsRLUsYkaDtnOnZ
 6xl/vCPJZ5CadUwQD8+eS9xDJA==
X-Google-Smtp-Source: ABdhPJxg9AlfFuUEpBeU0HgcJg6Qf8N66EN+HnaMKPLxxItyhLrphrdGlVVGQuK+y2GeGkR7nfpcEw==
X-Received: by 2002:a63:205a:: with SMTP id r26mr21806850pgm.62.1633541002439; 
 Wed, 06 Oct 2021 10:23:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v4 17/41] linux-user/host/riscv: Improve host_signal_write
Date: Wed,  6 Oct 2021 10:22:43 -0700
Message-Id: <20211006172307.780893-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Oct 2021 17:23:28 -0000

Do not read 4 bytes before we determine the size of the insn.
Simplify triple switches in favor of checking major opcodes.
Include the missing cases of compact fsd and fsdsp.

Cc: qemu-riscv@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/riscv/host-signal.h | 83 ++++++++++-------------------
 1 file changed, 28 insertions(+), 55 deletions(-)

diff --git a/linux-user/host/riscv/host-signal.h b/linux-user/host/riscv/host-signal.h
index 5860dce7d7..ab06d70964 100644
--- a/linux-user/host/riscv/host-signal.h
+++ b/linux-user/host/riscv/host-signal.h
@@ -17,65 +17,38 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
 
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
-    uint32_t insn = *(uint32_t *)host_signal_pc(uc);
-
     /*
-     * Detect store by reading the instruction at the program
-     * counter. Note: we currently only generate 32-bit
-     * instructions so we thus only detect 32-bit stores
+     * Detect store by reading the instruction at the program counter.
+     * Do not read more than 16 bits, because we have not yet determined
+     * the size of the instruction.
      */
-    switch (((insn >> 0) & 0b11)) {
-    case 3:
-        switch (((insn >> 2) & 0b11111)) {
-        case 8:
-            switch (((insn >> 12) & 0b111)) {
-            case 0: /* sb */
-            case 1: /* sh */
-            case 2: /* sw */
-            case 3: /* sd */
-            case 4: /* sq */
-                return true;
-            default:
-                break;
-            }
-            break;
-        case 9:
-            switch (((insn >> 12) & 0b111)) {
-            case 2: /* fsw */
-            case 3: /* fsd */
-            case 4: /* fsq */
-                return true;
-            default:
-                break;
-            }
-            break;
-        default:
-            break;
-        }
+    const uint16_t *pinsn = (const uint16_t *)host_signal_pc(uc);
+    uint16_t insn = pinsn[0];
+
+    /* 16-bit instructions */
+    switch (insn & 0xe003) {
+    case 0xa000: /* c.fsd */
+    case 0xc000: /* c.sw */
+    case 0xe000: /* c.sd (rv64) / c.fsw (rv32) */
+    case 0xa002: /* c.fsdsp */
+    case 0xc002: /* c.swsp */
+    case 0xe002: /* c.sdsp (rv64) / c.fswsp (rv32) */
+        return true;
     }
 
-    /* Check for compressed instructions */
-    switch (((insn >> 13) & 0b111)) {
-    case 7:
-        switch (insn & 0b11) {
-        case 0: /*c.sd */
-        case 2: /* c.sdsp */
-            return true;
-        default:
-            break;
-        }
-        break;
-    case 6:
-        switch (insn & 0b11) {
-        case 0: /* c.sw */
-        case 3: /* c.swsp */
-            return true;
-        default:
-            break;
-        }
-        break;
-    default:
-        break;
+    /* 32-bit instructions, major opcodes */
+    switch (insn & 0x7f) {
+    case 0x23: /* store */
+    case 0x27: /* store-fp */
+        return true;
+    case 0x2f: /* amo */
+        /*
+         * The AMO function code is in bits 25-31, unread as yet.
+         * The AMO functions are LR (read), SC (write), and the
+         * rest are all read-modify-write.
+         */
+        insn = pinsn[1];
+        return (insn >> 11) != 2; /* LR */
     }
 
     return false;
-- 
2.25.1


