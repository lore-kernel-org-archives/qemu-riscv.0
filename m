Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwjB-0002NZ-NQ
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:45:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwj7-0002Iq-9j
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwj4-000768-TK
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:33 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39583)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwj4-0006mg-Js
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:30 -0500
Received: by mail-pf1-x441.google.com with SMTP id f132so1311848pfa.6
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=1TwFMTdrijbYHJcqilfA4QcaYI5N+IsK6t29hHJjQM8=;
	b=UkqPyoUU3GK59sYZm1cDSW1rjqvYOWJ5Yga7dxsCm2+aH2JF1uemi+PujtIgBtnml8
	nKixI+g0U5AHZSr0yjP9GnC966Cmykwyol3YEPO9T7Ah6BTlRDxMB0LJHkj3ACqEiFzT
	CliaFXCLdzHWVjCF88YZ2Jvkh859Nfvirya8HkCSHCjaKfs5MEu5gRwIb+s3zALpLrxK
	FlLqI/QlZMInS/xge4vdntMEq2ujROdjTKowcq/OMUApAqidg5jqiOBNVnaQcej83Ii4
	GirTuj2EKhf1/NdrMD+scZTMpB9LpwzXnMCrn+z6mM/Kz6I/B4+zWJshYlf1tCgnYD22
	OHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=1TwFMTdrijbYHJcqilfA4QcaYI5N+IsK6t29hHJjQM8=;
	b=AsE0oM/mI+/P5yczI7H8EMnaN/nDf0wT7k7mBapaDs4KLgNhb11slrbIQjC12hWu5S
	z1rf2uENAnDkMYMBeWy2lAV3H6pzeNiWFza4A4rMLbq7LSJfvqu4j9C/WY/Q372nQ681
	7nepZFGsjNEkbRwyNjdePEpsQ7DOjjbZyuaAnqvKNe3jPQd2qLwDM7tyvQfjtDsQJ1BG
	pUlVUPksFwSKak9WBVHnkpFHn/JNz+xYOXIYLaJmz0bBFJ5nk6R1ET0drRBZybuSpq7L
	mmMS0kzCGm7/15EJRtOTCCZsATy1BRhBqp+BW4G/DoQ9BtixxUiZ2TzqSZAdMIPIeoSx
	Dayg==
X-Gm-Message-State: AHQUAuaMuSZyHpNOTnZrnwL/AXYVegTdz8Wn/T7vU6nBZMTsNqLLvGRH
	JD3xKK3iEE1CATEXItcuRBN8QRXKQ08=
X-Google-Smtp-Source: AHgI3IbaCYR3FEirvjQnJosejD79IwDirr9pLfwKd0mM1KHt8HaEryeyJ3JabEMXjEABmeBfJcbL4w==
X-Received: by 2002:a62:2702:: with SMTP id n2mr1120236pfn.29.1550072719421;
	Wed, 13 Feb 2019 07:45:19 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	o16sm18954090pgv.41.2019.02.13.07.45.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:45:18 -0800 (PST)
Date: Wed, 13 Feb 2019 07:44:49 -0800
Message-Id: <20190213154450.14749-11-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213154450.14749-1-palmer@sifive.com>
References: <20190213154450.14749-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Xi Wang <xi.wang@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-riscv] [PULL 10/11] target/riscv: fix counter-enable checks
 in ctr()
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
X-List-Received-Date: Wed, 13 Feb 2019 15:45:34 -0000

From: Xi Wang <xi.wang@gmail.com>

Access to a counter in U-mode is permitted only if the corresponding
bit is set in both mcounteren and scounteren.  The current code
ignores mcounteren and checks scounteren only for U-mode access.

Signed-off-by: Xi Wang <xi.wang@gmail.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/csr.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e72fcf1265d4..960d2b0aa951 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -56,9 +56,15 @@ static int fs(CPURISCVState *env, int csrno)
 static int ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    target_ulong ctr_en = env->priv == PRV_U ? env->scounteren :
-                          env->priv == PRV_S ? env->mcounteren : -1U;
-    if (!(ctr_en & (1 << (csrno & 31)))) {
+    uint32_t ctr_en = ~0u;
+
+    if (env->priv < PRV_M) {
+        ctr_en &= env->mcounteren;
+    }
+    if (env->priv < PRV_S) {
+        ctr_en &= env->scounteren;
+    }
+    if (!(ctr_en & (1u << (csrno & 31)))) {
         return -1;
     }
 #endif
-- 
2.18.1


