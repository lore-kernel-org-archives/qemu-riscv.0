Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h7R9L-00014l-38
	for mharc-qemu-riscv@gnu.org; Fri, 22 Mar 2019 16:52:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1h7R9H-0000ro-Uy
	for qemu-riscv@nongnu.org; Fri, 22 Mar 2019 16:52:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1h7R0z-0001l5-B5
	for qemu-riscv@nongnu.org; Fri, 22 Mar 2019 16:43:47 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:39909)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1h7R0d-0001CS-7d; Fri, 22 Mar 2019 16:43:36 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id DB8EB21F0C;
	Fri, 22 Mar 2019 16:43:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Fri, 22 Mar 2019 16:43:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	from:to:cc:subject:date:message-id; s=mesmtp; bh=3tZ7/H+hBqLudgB
	8BJbBT8zdL1HYX7xB/pWkNrjYPXU=; b=pZLdtwb31mPRliN030eoQQa3MaGfPKa
	IwQz3MvOkmbx/L2gHkr8KxkgKkQ0Q6DHVJRh0o9LUx6qAAuVJwHHYQYkh9TwVQb0
	K5kY1TfjKIkj3tbg6eI8Jql/5wCKo6u5FolTvV3mm4jApvBKdFvDIJTzJRA0zsMB
	HQzzDi8ikByU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=3tZ7/H+hBqLudgB8BJbBT8zdL1HYX7xB/pWkNrjYPXU=; b=B6XHno9T
	MwUKgPzKWrNpkqa4CDcdvSWnduBIuwh7hcsdegeAJZysuQBp2VBj2yfuUtGVnMrF
	Vp+yfatV0qu2TrducI++V49VP21RR1mVEdgdTG96EPn3It7Y+FrIrTHQEnsXcfwV
	/6CgIQ8JBAi3mEXlIOkpX1al22X4cW0DzB/nNrBQWk66B+2Y53Eg4wR7jnEtGMvw
	fa0bPgqAVugq0TGhtYczvEYAWWi7IH/qWpfuwrx2cxZFdBM18nDshcM3R+kkAfaF
	wKVjdQZT2noqRI96PgCpjhWEkdMUwkbX6AHpCy3JJ90lsyhid9zZSpRTLcosMERD
	k7U6jigsKjhXqw==
X-ME-Sender: <xms:6UiVXBs7QFUYfM8UL6SEkk6ZGQqLagNlHaSk5VDALxki6GwS1z-qbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrjedugddugeefucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhephffvufffkffosedttdertdertddtnecuhfhrohhmpedfgfhmihhlihhoucfi
	rdcuvehothgrfdcuoegtohhtrgessghrrggrphdrohhrgheqnecukfhppeduvdekrdehle
	drvddtrddvudeinecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohhtrgessghrrggrphdr
	ohhrghenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:6UiVXBGG8jPgU6XjUk8TdkURFi2mp6xkWZ0SAAb6T4P7aBytOMrvew>
	<xmx:6UiVXL5IoMwoNkJRLcKoKPcssVORy10_QkPo7u4Zz-qTAkyKUSVVXQ>
	<xmx:6UiVXFKEaEAwmj95LZB9J_DWMcNJwN6JI5OBMHe2ozrqF-0lduguHg>
	<xmx:6UiVXNyvbrhN4CgNS7PXvnpeEbC8tojqkH-OB7UX3-Ljp1xDHFAeEw>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id A7A46E46B8;
	Fri, 22 Mar 2019 16:43:20 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Kito Cheng <kito.cheng@gmail.com>, qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Mar 2019 16:43:20 -0400
Message-Id: <20190322204320.17777-1-cota@braap.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.27
Subject: [Qemu-riscv] [PATCH v2 for-4.0] hardfloat: fix float32/64 fused
 multiply-add
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
X-List-Received-Date: Fri, 22 Mar 2019 20:52:21 -0000

From: Kito Cheng <kito.cheng@gmail.com>

Before falling back to softfloat FMA, we do not restore the original
values of inputs A and C. Fix it.

This bug was caught by running gcc's testsuite on RISC-V qemu.

Note that this change gives a small perf increase for fp-bench:

  Host: Intel(R) Core(TM) i7-4790K CPU @ 4.00GHz
  Command: perf stat -r 3 taskset -c 0 ./fp-bench -o mulAdd -p $prec

- $prec = single:
  - before:
    101.71 MFlops
    102.18 MFlops
    100.96 MFlops
  - after:
    103.63 MFlops
    103.05 MFlops
    102.96 MFlops

- $prec = double:
  - before:
    173.10 MFlops
    173.93 MFlops
    172.11 MFlops
  - after:
    178.49 MFlops
    178.88 MFlops
    178.66 MFlops

Signed-off-by: Kito Cheng <kito.cheng@gmail.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 fpu/softfloat.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 4610738ab1..2ba36ec370 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1596,6 +1596,9 @@ float32_muladd(float32 xa, float32 xb, float32 xc, int flags, float_status *s)
         }
         ur.h = up.h + uc.h;
     } else {
+        union_float32 ua_orig = ua;
+        union_float32 uc_orig = uc;
+
         if (flags & float_muladd_negate_product) {
             ua.h = -ua.h;
         }
@@ -1608,6 +1611,8 @@ float32_muladd(float32 xa, float32 xb, float32 xc, int flags, float_status *s)
         if (unlikely(f32_is_inf(ur))) {
             s->float_exception_flags |= float_flag_overflow;
         } else if (unlikely(fabsf(ur.h) <= FLT_MIN)) {
+            ua = ua_orig;
+            uc = uc_orig;
             goto soft;
         }
     }
@@ -1662,6 +1667,9 @@ float64_muladd(float64 xa, float64 xb, float64 xc, int flags, float_status *s)
         }
         ur.h = up.h + uc.h;
     } else {
+        union_float64 ua_orig = ua;
+        union_float64 uc_orig = uc;
+
         if (flags & float_muladd_negate_product) {
             ua.h = -ua.h;
         }
@@ -1674,6 +1682,8 @@ float64_muladd(float64 xa, float64 xb, float64 xc, int flags, float_status *s)
         if (unlikely(f64_is_inf(ur))) {
             s->float_exception_flags |= float_flag_overflow;
         } else if (unlikely(fabs(ur.h) <= FLT_MIN)) {
+            ua = ua_orig;
+            uc = uc_orig;
             goto soft;
         }
     }
-- 
2.17.1


