Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150DACCD185
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 13:45:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7DOt-0002D2-Vs; Fri, 10 Oct 2025 09:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DOq-0002BM-Ff
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 09:43:12 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DOV-0007lb-Ao
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 09:43:12 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3c68ac7e18aso1454689f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 06:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760103753; x=1760708553; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wozWQ4+uKhU2Woke0EiPtGgDjWqN+p+Av15OT51Ys1o=;
 b=CZyK/SYWWIqxN+JiCD0ks+wEAzbLuIBS4tJZTut0Q1ReuEWtDLuwaSTQUTFK/JK1xs
 6VyuLPFwgOqHw8F8JPWTLrOiOQtJMO3AfZLGA4R6tqLd0vTcp0xkA3JYUG8+uP+iqqG5
 hWZgWBQl4QPoqJ7zhA1bERTfkq55OOZiHESccj5nPiknrGbQALDnH8dIX7O8FVJJkUaO
 2a9HvvVGUulf+gPOPOAXqA/mh6Cqmd84S0Rn3dtSUIvRzbk+IhBEsdI+YmDdYp9CUYAX
 mXhvsWAwKKARE3Ja2BhgUh3gMy20ae9kjqM/rWXJKGVwaTQA+3VW9G/R7vETRC9qTG16
 Gb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760103753; x=1760708553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wozWQ4+uKhU2Woke0EiPtGgDjWqN+p+Av15OT51Ys1o=;
 b=Qz+Xha26UQAxI8y+DBhMFQ1TqV3L/ghAxUT5t+eO5gfxRh6iuOh2V0GbKS3Q3h79yJ
 EHI7PJoLb8z+o3LCDd24MuE6zG0No+RxGTFVN7YF0bVbLkp5Ir8+zociDeNwU3WIY2qC
 6uW28qzjqYJXMNrjqyEF6svCmEZrkEK5SQwit3gax3rLGW5SzRJDRSYUPUOHtX2KMgda
 wfqbehIRcddg3NhQga0YFA9MO71ILpddCHkTLVkSBdJ/ycZS2GZIQ8M+O72haTkvSOoY
 ITEihN3NLhASPK+VEM8TQOkNVQm2m6W2eNrgTmWHRpL0FBKQgcnm1PIH89K2Z9JRcF4g
 yJBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXad+oOQsOE7pJCoAYK8GglY/PiL+d0Hg/Mn3AZl4lYU9ie1V5NId6yZH/YqrZbuwMZkCBw5rqtmp/M@nongnu.org
X-Gm-Message-State: AOJu0YzsVwX7LKYF+PW00MN8yDLtg0/5UJHx2/yqhLgoX79SsN0ontAz
 qMChhC9OPTzQE0o0Z0WALIP99bdiwE2oVVp9fjcayZO95DZ6ClcE4HjJl9VekY73ipk=
X-Gm-Gg: ASbGncuFOzILtSqatE4dWuaOctw6s9X8bA4X1Alo3OlNvVY6P/stz62tZwdz+v0dMkv
 GBh+Rmw0ObplK3jVqWeEQ8CIZm77jX6pLkEAOpNGbu1TTkiTcClZqh8HZiaHkJ6IV0RY38iXZY7
 4zbB/I4QeIsCIKmOJXA8nqDywyfoU9W7fRl5+kYbn/bxnfM9e0cxrnhYq4YdeHX4982MK37Pdpk
 48MMf0VCkI1BFrHuvm3HzBxxpFuSeOcJLzciUqWoHy95a5u+4INeCdaQniBMzbjOMMk8qLji62X
 xzEfnLKCpMQBTedcskvG+YmkqxJwkWAwifOnh7wYmOtn1V/UURSptG9x8thQkSEnvUyPAx0pxd8
 fb9cctz02LRqHWPfhTgxu99GSBjG5/oOEapXVJc2PZR+0XmqpEsjee7T0VXr1qVRV7dZuavKZ3n
 VjByii4oELlhzE2igwFqQVqgTnifsJ2g==
X-Google-Smtp-Source: AGHT+IErZZEwB4uw1hXoXCFarD7Y+fhbeaRNLRAD8qc0l2ueYPzIctHC9WNhaN8/3Y7GMnt0v+LIkA==
X-Received: by 2002:a05:6000:2505:b0:405:3028:1be2 with SMTP id
 ffacd0b85a97d-42666ac4748mr7297622f8f.11.1760103753514; 
 Fri, 10 Oct 2025 06:42:33 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce50d70esm4457288f8f.0.2025.10.10.06.42.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 06:42:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 01/16] linux-user/arm: Checkpatch style cleanups
Date: Fri, 10 Oct 2025 15:42:10 +0200
Message-ID: <20251010134226.72221-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010134226.72221-1-philmd@linaro.org>
References: <20251010134226.72221-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

Update style in a pair of methods we are going to modify in
the following commit. No functional change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/arm/nwfpe/fpa11_cpdt.c | 66 ++++++++++++++++---------------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/linux-user/arm/nwfpe/fpa11_cpdt.c b/linux-user/arm/nwfpe/fpa11_cpdt.c
index fee525937c5..6b0317883a7 100644
--- a/linux-user/arm/nwfpe/fpa11_cpdt.c
+++ b/linux-user/arm/nwfpe/fpa11_cpdt.c
@@ -40,18 +40,18 @@ void loadSingle(const unsigned int Fn, target_ulong addr)
 static inline
 void loadDouble(const unsigned int Fn, target_ulong addr)
 {
-   FPA11 *fpa11 = GET_FPA11();
-   unsigned int *p;
-   p = (unsigned int*)&fpa11->fpreg[Fn].fDouble;
-   fpa11->fType[Fn] = typeDouble;
+    FPA11 *fpa11 = GET_FPA11();
+    unsigned int *p;
+    p = (unsigned int *)&fpa11->fpreg[Fn].fDouble;
+    fpa11->fType[Fn] = typeDouble;
 #if HOST_BIG_ENDIAN
-   /* FIXME - handle failure of get_user() */
-   get_user_u32(p[0], addr); /* sign & exponent */
-   get_user_u32(p[1], addr + 4);
+    /* FIXME - handle failure of get_user() */
+    get_user_u32(p[0], addr);       /* sign & exponent */
+    get_user_u32(p[1], addr + 4);
 #else
-   /* FIXME - handle failure of get_user() */
-   get_user_u32(p[0], addr + 4);
-   get_user_u32(p[1], addr); /* sign & exponent */
+    /* FIXME - handle failure of get_user() */
+    get_user_u32(p[0], addr + 4);
+    get_user_u32(p[1], addr);       /* sign & exponent */
 #endif
 }
 
@@ -108,16 +108,18 @@ void storeSingle(const unsigned int Fn, target_ulong addr)
 {
    FPA11 *fpa11 = GET_FPA11();
    float32 val;
-   register unsigned int *p = (unsigned int*)&val;
+   register unsigned int *p = (unsigned int *)&val;
 
    switch (fpa11->fType[Fn])
    {
       case typeDouble:
-         val = float64_to_float32(fpa11->fpreg[Fn].fDouble, &fpa11->fp_status);
+         val = float64_to_float32(fpa11->fpreg[Fn].fDouble,
+                                  &fpa11->fp_status);
       break;
 
       case typeExtended:
-         val = floatx80_to_float32(fpa11->fpreg[Fn].fExtended, &fpa11->fp_status);
+         val = floatx80_to_float32(fpa11->fpreg[Fn].fExtended,
+                                   &fpa11->fp_status);
       break;
 
       default: val = fpa11->fpreg[Fn].fSingle;
@@ -130,29 +132,31 @@ void storeSingle(const unsigned int Fn, target_ulong addr)
 static inline
 void storeDouble(const unsigned int Fn, target_ulong addr)
 {
-   FPA11 *fpa11 = GET_FPA11();
-   float64 val;
-   register unsigned int *p = (unsigned int*)&val;
+    FPA11 *fpa11 = GET_FPA11();
+    float64 val;
+    register unsigned int *p = (unsigned int *)&val;
 
-   switch (fpa11->fType[Fn])
-   {
-      case typeSingle:
-         val = float32_to_float64(fpa11->fpreg[Fn].fSingle, &fpa11->fp_status);
-      break;
+    switch (fpa11->fType[Fn]) {
+    case typeSingle:
+        val = float32_to_float64(fpa11->fpreg[Fn].fSingle,
+                                 &fpa11->fp_status);
+        break;
 
-      case typeExtended:
-         val = floatx80_to_float64(fpa11->fpreg[Fn].fExtended, &fpa11->fp_status);
-      break;
+    case typeExtended:
+        val = floatx80_to_float64(fpa11->fpreg[Fn].fExtended,
+                                  &fpa11->fp_status);
+        break;
 
-      default: val = fpa11->fpreg[Fn].fDouble;
-   }
-   /* FIXME - handle put_user() failures */
+    default:
+        val = fpa11->fpreg[Fn].fDouble;
+    }
+    /* FIXME - handle put_user() failures */
 #if HOST_BIG_ENDIAN
-   put_user_u32(p[0], addr);	/* msw */
-   put_user_u32(p[1], addr + 4);	/* lsw */
+    put_user_u32(p[0], addr);           /* msw */
+    put_user_u32(p[1], addr + 4);       /* lsw */
 #else
-   put_user_u32(p[1], addr);	/* msw */
-   put_user_u32(p[0], addr + 4);	/* lsw */
+    put_user_u32(p[1], addr);           /* msw */
+    put_user_u32(p[0], addr + 4);       /* lsw */
 #endif
 }
 
-- 
2.51.0


