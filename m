Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h7OBO-0004PY-3E
	for mharc-qemu-riscv@gnu.org; Fri, 22 Mar 2019 13:42:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <npickito@gmail.com>) id 1h7OBJ-0004Mr-56
	for qemu-riscv@nongnu.org; Fri, 22 Mar 2019 13:42:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <npickito@gmail.com>) id 1h7O8s-0007cK-Ou
	for qemu-riscv@nongnu.org; Fri, 22 Mar 2019 13:39:43 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:43691)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <npickito@gmail.com>)
	id 1h7O8p-0007Oc-Tq; Fri, 22 Mar 2019 13:39:41 -0400
Received: by mail-wr1-x443.google.com with SMTP id d17so3225732wre.10;
	Fri, 22 Mar 2019 10:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=JSoN7f9QkT3lcw9+F8G1hSeLONiyvWz6vPe2yIMOcfM=;
	b=WuMsqQzJyqdcRZclpwDoj8CFMeA9MS43gie0V1tkOqZZrV6nZ3qZl4fsYXAydm4Uqr
	wI9lq8l4piyllFqxMaS+gTj1ZtF57axTwRuSmXBl3Vcft1xkLvt4iadTArTS4VF8U9JX
	FLH4EE2Vj8ovejyEnOx+Xlsz76Nl1JvZF2mRHUuS3/2ahUzUr91DqTobftgOtDRwakfu
	evglS2GVU49Gih5GfO1D+7Zx3+XJNe9ExdFicqW/aVIgvv9BKKIq7ZGppkp7CHzV3rn5
	oMGNZePybAZEsvLkxe80liGXxyylzRGAK+7VAqQKmqLqU7lLBU5Lz5T51K1c9+nxUJra
	vfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=JSoN7f9QkT3lcw9+F8G1hSeLONiyvWz6vPe2yIMOcfM=;
	b=tfGuAjO9g/eQjcSxQZON5puKd9Dx6LjtUnuG01VM5jfMVPZAF5QN0KW/3Z3/Fj4zW8
	fSSwFEo72THFutWeN1zWLZ2hezGjO7ljJbX2E1oHwHcIM/8Qvvi1EcSjmKRBrnuMHAgC
	HoDhH/wznKev9tOGjenZMF3Nz/BAMcyp/mEC7zQAt8NJgoOL4wqP/SA23BkFBgc9uhL2
	LSKh5xOY8uXYt4/84tsaofXpjQtATE8H47e9KL8iiKDSp/bPQS9+dzUri/7lecL/WsEO
	meCCnJe5x418NIo7g89d6Z6bmBlg2AvjtMZZu0MbRx7Jry7bkYO4WlBsK3DvsRdwi33r
	3hPA==
X-Gm-Message-State: APjAAAWcf/tAvfRHvaViTYipbx/3yrxVHyqe4M6p962Giw7OQnjSXxO9
	eMpdx9+htUHbZuIelfifBIryxA0TqwtU1EDD21gDxGcA
X-Google-Smtp-Source: APXvYqziraxUmlNLwc89t9sMTthRtLUUZWyfy2BvoK+ZK2x8blHArTVt3juZoMbxuLt9+T0onU24y+pDunltEpdvxsU=
X-Received: by 2002:a5d:6207:: with SMTP id y7mr7029994wru.60.1553276377419;
	Fri, 22 Mar 2019 10:39:37 -0700 (PDT)
MIME-Version: 1.0
From: Kito Cheng <kito.cheng@gmail.com>
Date: Sat, 23 Mar 2019 01:39:26 +0800
Message-ID: <CA+yXCZBs2KDYzJz=--5SjyEJz8s8sn_jtvjDyrU0dJL+L+=MzA@mail.gmail.com>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, cota@braap.org
Cc: qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-riscv] [PATCH] hardfloat: fix float32/64 fused multiply-add
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2019 17:42:17 -0000

hardfloat fused multiply-add might fallback to softfloat mode in some
situation, but it might already changed the value of input operands,
so we must restore those value before fallback.

This bug is catched by running gcc testsuite on RISC-V qemu.

Signed-off-by: Kito Cheng <kito.cheng@gmail.com>
---
 fpu/softfloat.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 4610738..f53f391 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1596,6 +1596,7 @@ float32_muladd(float32 xa, float32 xb, float32
xc, int flags, float_status *s)
         }
         ur.h = up.h + uc.h;
     } else {
+        union_float32 ux = ua, uy = uc;
         if (flags & float_muladd_negate_product) {
             ua.h = -ua.h;
         }
@@ -1608,6 +1609,8 @@ float32_muladd(float32 xa, float32 xb, float32
xc, int flags, float_status *s)
         if (unlikely(f32_is_inf(ur))) {
             s->float_exception_flags |= float_flag_overflow;
         } else if (unlikely(fabsf(ur.h) <= FLT_MIN)) {
+            ua.h = ux.h;
+            uc.h = uy.h;
             goto soft;
         }
     }
@@ -1662,6 +1665,8 @@ float64_muladd(float64 xa, float64 xb, float64
xc, int flags, float_status *s)
         }
         ur.h = up.h + uc.h;
     } else {
+        union_float64 ux = ua, uy = uc;
+
         if (flags & float_muladd_negate_product) {
             ua.h = -ua.h;
         }
@@ -1674,6 +1679,8 @@ float64_muladd(float64 xa, float64 xb, float64
xc, int flags, float_status *s)
         if (unlikely(f64_is_inf(ur))) {
             s->float_exception_flags |= float_flag_overflow;
         } else if (unlikely(fabs(ur.h) <= FLT_MIN)) {
+            ua.h = ux.h;
+            uc.h = uy.h;
             goto soft;
         }
     }

