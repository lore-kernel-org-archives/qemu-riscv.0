Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4086AC5DF67
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 20:39:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvL8k-0008Hx-GJ; Sat, 15 Aug 2026 16:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8j-0008H3-CR
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:38:01 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8c-0008M7-Ih
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:38:01 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-38dd55ad76cso2133007a91.1
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 13:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826271; x=1787431071; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=huYYxmonle9nqEQnUjnQGUQR5AICjj+SiFqAyTmaqDk=;
 b=ciNBTV24uJDwZWxz1yv8WN83AK60mqsIV8znpuvg+5m9hHhcBkXan1xXG3Ort1ozuR
 ASz7UMZ4ghS6pvMJrtlQ9FtF2Llvq+gSBy2kGwJKI/KgRusMpyqagCpYCGumt0XAmr0M
 Ifbtxeu5U2Qvsv94mmDzi+DyTU9KVQtgGpVqHICIkowaCDg++jfXuqd0ZDqvolzEdrNx
 2iAogrqUteTHD2O5gvg/MAhCQrLLky0LkJ1ay/IOg4XSEdxQ1bR5BCQmauz5kvNgZAMZ
 xrdP/R3DoP3DZ6/7oi8gJ6ZYBjGfQuOcAEp6sqw3tt30m96wuL9fcCC1ZkJPF+rhuhFR
 02Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826271; x=1787431071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=huYYxmonle9nqEQnUjnQGUQR5AICjj+SiFqAyTmaqDk=;
 b=qc2BQnJVzaq6a3f0YSg/gi+zqO9pRqIubL+C0kcHAce0sGBmpgWLMnq9w9jdam4KI1
 IQsLs7CWJcwtW9tnvgwwwfVQi1xVdPVj0tsCG5gRb8MkFKjX8ICL9c9YYb7/RyDrkJDX
 ycmxduoAWjYgsajiHZ+hwNB65Zcs5nxrDKFmRFqkDltFH49EAOBqujxymEZftN8Y6z38
 wkEm8eRuvyLmaLZs4T2VWF9HUn+dvBlUylIQGVpcNF3g1148Ju9BgadFb2ZHV3QVhwIo
 XD/EsaiSx/2O9X6NGljkP1eEp12bRXYDU6MhCjDTR1owtNPAHBxMt8TlU4/rq3WrtTuq
 nBYg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpgcwFJDj0Jukvgh0EN+9ys2DQ9Uz2KjWpk5UHbQKKxLXGP766v/pN9tXovPPz8M7SC41kJA71IGPMY@nongnu.org
X-Gm-Message-State: AOJu0Ywq38B7BW/LLBswYInTQ6y/IPKUCybWc6lCO/w+A8N0k9T5Kd/d
 T3Fgx5QC/zyhgHrHdRFiWhrWQqYWl6uFR9x6EUEhUKOr9p8/CsWpb53GLwK96E3oUXwjqEGXtED
 3yPcj
X-Gm-Gg: AR+sD13KFYO150xEyItyvSnIMwuyyXAzeUKR2dCrA43wpMFd3Foscuu4w8h8oDSqCjz
 vrvA+FZ7tdcWGBXoXzVEHdw0mYWb9eJqGujoa4rRzX1y5kQ6nXNFtG1LgkJtjChwRxXzOBUP4RG
 SGm7rGeyg3+/8YDbmz3fZMFVMNLmWA6gbVHR25Kj/+/bgoO4pjk+6OrD8RH7SZmc89dt1nMSxGx
 piXoSCpKgQ2BIdcWS4P+AcwebJ6SOIGDpx4LASnBQLGWhOa3Lo8Kci6ZluBvJTiT2sjjOAG1wNm
 nVXwCyudbGWj57KplIL7q6EkeEk/Gmu6iq3i0m0ZVLor1pWmgz2QxFh66PCBbBB/KInWuVyJnHy
 KmC3DH9/0gds7MQsRZZgOLwj4PozH20OXG/xWdQfIbuJUiJEK1lReJ995D+zHMd9Tu4DSXFAs+D
 16FQh1z/WAs8QMunZODSl3+TJa5tHYtgU5ShulGUGL99eKqf4VlFMAhEQSB9nZ98D6sFFDhULne
 AhAJX2+MvttYNZLZYjF
X-Received: by 2002:a17:90b:2e87:b0:38e:6d55:b1a6 with SMTP id
 98e67ed59e1d1-3933af038ccmr12391331a91.3.1786826271518; 
 Sat, 15 Aug 2026 13:37:51 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 15/18] target/riscv: Use boolean logic in
 pmp_hart_has_privs
Date: Sat, 15 Aug 2026 13:37:27 -0700
Message-ID: <20260815203730.1468365-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

While addition with bool variables isn't wrong, as they promote
to int, it's odd.  Use normal boolean operators instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/pmp.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
index 5ea0e5b6c3..fc035c95cf 100644
--- a/target/riscv/tcg/pmp.c
+++ b/target/riscv/tcg/pmp.c
@@ -413,16 +413,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
         s = pmp_is_in_range(env, i, addr);
         e = pmp_is_in_range(env, i, addr + pmp_size - 1);
 
-        /* partially inside */
-        if ((s + e) == 1) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "pmp violation - access is partially inside\n");
-            *allowed_privs = 0;
-            return false;
-        }
-
         /* fully inside */
-        if (s + e == 2) {
+        if (s && e) {
             /*
              * If the PMP entry is not off and the address is in range,
              * do the priv check
@@ -517,6 +509,14 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
              */
             return (privs & *allowed_privs) == privs;
         }
+
+        /* partially inside */
+        if (s || e) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "pmp violation - access is partially inside\n");
+            *allowed_privs = 0;
+            return false;
+        }
     }
 
     /* No rule matched */
-- 
2.43.0


