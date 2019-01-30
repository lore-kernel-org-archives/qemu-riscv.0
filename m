Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gotnC-0004li-Fc
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jan 2019 12:36:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gotn7-0004h0-5c
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gotn5-00008n-0A
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:49 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:35439)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gotn4-0008Vt-Nr
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:46 -0500
Received: by mail-pf1-x442.google.com with SMTP id z9so144816pfi.2
	for <qemu-riscv@nongnu.org>; Wed, 30 Jan 2019 09:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=1TwFMTdrijbYHJcqilfA4QcaYI5N+IsK6t29hHJjQM8=;
	b=R449p6EcZcCe8qKKd7DGx7lrvGNikJO4wdRMj/7q5B9//qefFps5qbHhbNPCiazAT1
	WZXZrR3NBBoPH8Kg/vlp0LVAeHLKvPlFUZdxI+I5mG03sXHtgAleraV5tTTtumoHObYY
	J3YujLsMrwkixsj9t+/DFY8qsLI1y5k2lQuDFAEyWLxnUtKqS3wFc/ygUyhBCut+78rb
	cY+k75+xr8hDPJEGRAoDv4wMNxyVXc4PG5UgQ0LgQfw1wVaBkfr0jBd5qpocBFRFtzFj
	3Xjke0lxzJ3VUwaxCmnR1wKkctB5dvnejxcIvlTzEkxNk1s65ReVP8Lj534ukBfEkA7u
	6eVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=1TwFMTdrijbYHJcqilfA4QcaYI5N+IsK6t29hHJjQM8=;
	b=XPuts4ulRMxNWU7C+HsvRqCGeBNwIA9QMvMoOJN9rg5c1lr/XJmoo3O0+nl01Cg9Xd
	c2JJVyGIYBDYBfQuFXZeCFNuBDCa+FaCcfUHH7lhVBKqeEKxJFQxgqSUcmQd6adNZf1t
	TFKdbxRGUdj0DrZM/t2mI4xGbH/ed7Fr2PZR1VStvxOYxRDLzBLgq5oyDHIsmunZ44h8
	8bxFIJPFUMs5sqZujQ4Ro+h/vn3PCrKvtBiJppePQKg8boBcwzgTY9hbE7FU4VeR+Tk5
	s0hYSnOUzTeQStO6Yk9pgAhsSygKPQdBBugh3EvoaThGxvoRvV543kDrktwFqLPe8PEV
	5ljA==
X-Gm-Message-State: AJcUukcr0LgmrjhZRjYt6QyEUt0UnHw1EJG86JH0Hc8jOxn4J5D7cuSI
	+YBv+Pk+v9qvyDSU604GPiYK2A==
X-Google-Smtp-Source: ALg8bN7amQjZQsD7uwpMSmxsxVmqiflR5+kV131L7e5L8cCKmsiyShbtkbCrrdMvce2uJDGAdx2Q6g==
X-Received: by 2002:aa7:824f:: with SMTP id e15mr30697190pfn.192.1548869796254;
	Wed, 30 Jan 2019 09:36:36 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	v89sm3574305pfj.164.2019.01.30.09.36.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 09:36:35 -0800 (PST)
Date: Wed, 30 Jan 2019 09:36:01 -0800
Message-Id: <20190130173601.3268-11-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190130173601.3268-1-palmer@sifive.com>
References: <20190130173601.3268-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Xi Wang <xi.wang@gmail.com>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-riscv] [PULL 10/10] target/riscv: fix counter-enable checks
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
X-List-Received-Date: Wed, 30 Jan 2019 17:36:51 -0000

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


