Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8625C5DF9D
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 05:12:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzSNl-0002Zu-Pj; Thu, 27 Aug 2026 01:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSNi-0002XW-9q
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:10:30 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSNg-00042R-Qu
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:10:30 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-396750cfee6so1499773a91.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 22:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787807427; x=1788412227; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5bkCYeMhO7/zC3uMA+VZFpZtFUWR2ZdudiB4U3VtuDk=;
 b=C+VFqoSJx6ySmnz0hGIs9tEavgHwK5algRgh3gVPwdmg90stCx/m5uyZtIlggQLrlU
 RZC+6EvcbCJ/wtCckrynkLhVf5laCuJcrZ70M9Am9qnDZXBciK+HVFegnuybonXsylvv
 dyAWuyoPn1jQarw/jQYGF294MER+lEeve1Cav19nuQQJ2QQhGByQEz9eyfRyyR7XFh+e
 2GKH2Nf0wakedQ1bmxm7mn82jRFLflOnJiIA1x4rQNNiiZP5KQYZqnGsp1JHHgnlJJMW
 lii5PDNulC+u8kOGw6XAZbuME860QOAztej+2D6MIP477lMuHCCJ1ziWdw1Aup//hCy9
 cUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807427; x=1788412227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5bkCYeMhO7/zC3uMA+VZFpZtFUWR2ZdudiB4U3VtuDk=;
 b=sf+fHE5eM+wyraRxTqoqSmu63X0S7xKKRAZN9T0BIMg97r6yet7ujhAfeO106er61X
 20XeoUw4E9Ik0UC0v0H9o7CznQrHfoWC+xqVCaF7IWt8BGh98Mnbk5v7bHeSGPPTwRL5
 xg2RhYD/uRsO39kiuZwycruHOvybX+7aQQCzKOd1tTB3cDO655xZ+nLQkyHrmnEypOUd
 u0he993lsXHeF6LPQ+yEYuAH4PB525tarZh5cjGAPwEKJYlyUBKuZDtQWvODPsy5nQWi
 Eldpjnp3IDljC0THp58QLA6f2N37ktEX7wL5ZyCA4kN4kyA2pfcAoGQmpAhRw6JNj7+g
 bMpg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqJ8IvLikSe1Hw8QRL6hYT1rF5yjFq27Jw4maPZOiCbIDbk6kVu2e5abh/x6PinSzCb26JQY3fi2MUf@nongnu.org
X-Gm-Message-State: AFuF++nFdh1HN/MVu9+KjA/ekIPg9aP9MgDcfrkg3rVs6YO/VBS+G5O5
 0tOrHRzmn0ISiyvDQDaMCMMYFljxETgrW84Vfd9mSI25mgmX85o0qGUX
X-Gm-Gg: AR+sD134evkWC57MLgBJ3taBIc6q2/XkVKckIwmKRjjZ9uKntdUPTTUtyeGsRXnCTv3
 74iiZCwUPOjTRqNSN4brKwtHkFVQjNsGm9odeAm8KqiptCotpbbN96VwPxzKponu6U1Lj6FLXn2
 Z7lPW7G7GcpeBkrZ+UEYXVecEmnMai0XUVqsTifRXqfPBBCytcgop6Fnt/zMnVUVjGAgQ6WAugy
 BDI0Or42SJDoucguI+I8ugxFbIyXYJ278Z9pyZXzTtDhEdg58IT5TRRaa3EY0R1mCzUNs8qeyoz
 aOnYJ/6cgF981jDoUbwgQARg3HNr4Sj6JkmK2nd9OfIqBDaslTzedFNyHPDkLEAYNJ8mxWe+Zow
 dOmC3JnNJCzBqMpFKyCtfGhunSqnp8UH4cbdRGF4HrBvUN7N/GhPOjDjT1FgYCUWrysRDyAvBzM
 6mlqdYVpVoBreYol1BhGJEnGyWyquvZbJ6EYl8Py7vQ75aq8ahabhF0tmhYkwRuENqvkeGm9TjF
 K0S10Q6Y5nHCUCdm03fAFYB+9T/zbUGmZ0n/Ywq4Kw3flebXAyc2yrgMkQyKK2dI0HMfHZL898F
 P9nUuw6y6UX4235UdOKvJahwyGWBsqk=
X-Received: by 2002:a17:90b:4acc:b0:396:5c22:b1f1 with SMTP id
 98e67ed59e1d1-3966d413283mr24086293a91.8.1787807427473; 
 Wed, 26 Aug 2026 22:10:27 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39670599275sm2210473a91.0.2026.08.26.22.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 22:10:25 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH 02/12] tests/tcg/riscv64: Clean up semicall.h inline asm
Date: Thu, 27 Aug 2026 14:39:41 +0930
Message-ID: <20260827050953.67184-3-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827050953.67184-1-joel@jms.id.au>
References: <20260827050953.67184-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Make __semi_call static inline so semicall.h can be included more
than once in a program.

Use .option push/pop rather than leaving norvc set for the rest of
the file.

Set the constraints for the asm block.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/tcg/riscv64/semicall.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/riscv64/semicall.h b/tests/tcg/riscv64/semicall.h
index 2fdd322af91f..34e87332de44 100644
--- a/tests/tcg/riscv64/semicall.h
+++ b/tests/tcg/riscv64/semicall.h
@@ -8,16 +8,19 @@
  */
 #include <stdint.h>
 
-uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
+static inline uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
 {
     register uintptr_t t asm("a0") = type;
     register uintptr_t a0 asm("a1") = arg0;
-    asm(".option norvc\n\t"
+    asm(".option push\n\t"
+        ".option norvc\n\t"
         ".balign 16\n\t"
         "slli zero, zero, 0x1f\n\t"
         "ebreak\n\t"
         "srai zero, zero, 0x7\n\t"
-        : "=r" (t)
-        : "r" (t), "r" (a0));
+        ".option pop\n\t"
+        : "+r" (t)          /* Output: read as input, written as return value */
+        : "r" (a0)          /* Input: arg0 */
+        : "memory");        /* Clobber: may modify memory, depending on type */
     return t;
 }
-- 
2.47.3


