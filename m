Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F087BCCA476
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 13:45:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7DR0-0003sS-JG; Fri, 10 Oct 2025 09:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DQx-0003kh-Tj
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 09:45:24 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DPn-0008JN-Ci
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 09:45:20 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e491a5b96so11501735e9.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 06:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760103835; x=1760708635; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vkc03exu55eBo9yCSXwIrehmGU4C40E+gstJ6ZsPFco=;
 b=ViYQxAlXIuHm+peN7hK2vZC/MQLY3/HG7I1eqO0yvqYFbe8XPmcozGImxLScoZ9ADy
 LaJUPH6Mv4MnuPWw+WZXzJQsEj1y3ucvLUTQoFBTUSjGFtFAkIniQXGx2ZEtsRqKUXjr
 2Ncj3r41G+KecIaAX8ZFMdoXyMb+PdHSX/ufmibc4TMg+PpPER1xNCtkJnToLUMkf0aq
 R+UY47vauQzk9vnJPr+LWPPRG2Z0FRvuiY/aqhQ9feMaeed8XIOBoFgY3GysdCQl5hRA
 JCOJktpe0LTfXACmV5Dx98z2DMCeweV1dJH5bJZyGBLB0qMkbO8vEwNYmdGBSxLhgR/B
 tj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760103835; x=1760708635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vkc03exu55eBo9yCSXwIrehmGU4C40E+gstJ6ZsPFco=;
 b=Upl2zwrMJaIEv2ObizcH4Izp5izc8BPpC9ZudsCSWAjRXLiGumIkZ+96c/fBqHfKJI
 ntUeoZHCQHmL5RcqKWY9yqDIMNzv7L67Y/tziqLzOeY1+6g6zo0K+P/b6Qnw67nEY3Lt
 Xfv66Ro9o+tu882SrGuAuyMfOjNKOJhmfrwWdF/k2T1tgQqZ1eC/YgEII8FeMVH1ccmp
 ofYcr650TY0Bej86Y6M6oTlkCzaI2A9Xula0W283EYsF4gZRbsJbZGOI3gUKHSiNrpCv
 0EEB+WVdC1ZZoeROiEixlGdLnjnDS/0s17RkLzVBpnCcw7pldAtCvSiemBVGiYRO/E3g
 IqEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCViiU5y0r8Ixw6X+8s1pvTvtW37eelkGU5ylFT3VcKqmu7/924e152Wua6o2VQIeUgqG4HUVhjy+gYn@nongnu.org
X-Gm-Message-State: AOJu0Ywk1lTLyDK/Nqms/tKAU9zWyc8NzClvQLn+8t3E7uQHh20ncahP
 x4Xg+jrMwGkdyI1NdkFw8rVCIVR+kqkq3mU5NmMS5Ajsk5/b8wHTCyoYq52sBaHp1Jnm5LVhlpK
 y7kYBmotmtQ==
X-Gm-Gg: ASbGncskHElidDHalzfQ92DjZ65Uldz+fvu29IbJoZSJBRTA6JHLEhTDCdE5loZD+54
 CGmEeQ/0IwdhmW8+9hE7oSz+WXS0azt0S3G7aJ5yYV8iYLfcjlycov7ZeJdClLVMdiegeIKdwT4
 6NV6kswYekUP7vgI++Cf+cnLbcbvZUoIxs1J8VdAUJb5sPxXYFFJjMb/C1ref4U72uk+SLfLuwD
 UcoZj7Tk31huA1A/Qk482cZu60nuJpItZoKDHAuPDOpQUcrqC+Z6URARIL4wEGo7HHTzOLvf17t
 TELge4Xwf7+y1vfZRvqnalIE/A1Dnl3awlhoFFnR7HJDfSQy50qcySoCuLgQQ2qPn6rGKGW1yhd
 33rK6G+CYGfn6qorubYZzNBCPkVZDPVvlkUx/AxX/6FuLYwXdcUmcNpfArKzJ8wHmVRFc3VL3uG
 e6m6kWZrBaRhcwMTF7Zra5Vu6qkWDfOQ==
X-Google-Smtp-Source: AGHT+IE6LY1k+UfqIuVIOh4wE/dwJvXWsQQBI7D27IlvBg6zUbG4pRugCrmKqq6Tynirh0fqhPm1NQ==
X-Received: by 2002:a05:600c:37c9:b0:46e:477a:f3dd with SMTP id
 5b1f17b1804b1-46fa9b1b18emr83406515e9.36.1760103835401; 
 Fri, 10 Oct 2025 06:43:55 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57d4bbsm4347777f8f.2.2025.10.10.06.43.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 06:43:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 16/16] util/bitmap: Replace HOST_BIG_ENDIAN #ifdef with
 runtime if() check
Date: Fri, 10 Oct 2025 15:42:25 +0200
Message-ID: <20251010134226.72221-17-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010134226.72221-1-philmd@linaro.org>
References: <20251010134226.72221-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SUSPICIOUS_RECIPS=2.51,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Replace compile-time #ifdef with a runtime check to ensure all code
paths are built and tested. This reduces build-time configuration
complexity and improves maintainability.

No functional change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 util/bitmap.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/util/bitmap.c b/util/bitmap.c
index 8d12e90a5a4..2346159116e 100644
--- a/util/bitmap.c
+++ b/util/bitmap.c
@@ -421,19 +421,14 @@ static void bitmap_to_from_le(unsigned long *dst,
 {
     long len = BITS_TO_LONGS(nbits);
 
-#if HOST_BIG_ENDIAN
-    long index;
-
-    for (index = 0; index < len; index++) {
-# if HOST_LONG_BITS == 64
-        dst[index] = bswap64(src[index]);
-# else
-        dst[index] = bswap32(src[index]);
-# endif
+    if (HOST_BIG_ENDIAN) {
+        for (long index = 0; index < len; index++) {
+            dst[index] = (HOST_LONG_BITS == 64) ? bswap64(src[index])
+                                                : bswap32(src[index]);
+        }
+    } else {
+        memcpy(dst, src, len * sizeof(unsigned long));
     }
-#else
-    memcpy(dst, src, len * sizeof(unsigned long));
-#endif
 }
 
 void bitmap_from_le(unsigned long *dst, const unsigned long *src,
-- 
2.51.0


