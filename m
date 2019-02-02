Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gprzS-0007Fr-Fd
	for mharc-qemu-riscv@gnu.org; Sat, 02 Feb 2019 04:53:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gprzG-0006z8-Ko
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:53:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gprqB-0005kf-Qk
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:44:01 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:37759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gprq7-0005fV-SE
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:43:57 -0500
Received: by mail-ed1-x542.google.com with SMTP id h15so7476001edb.4
	for <qemu-riscv@nongnu.org>; Sat, 02 Feb 2019 01:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=1TwFMTdrijbYHJcqilfA4QcaYI5N+IsK6t29hHJjQM8=;
	b=jWBNFlIVUxSieGn9yNzTnZEDPVPQ3Ks0r0SgzxEXpIyvwLHqdBH6g0d4jYsypX09Yy
	gOshzZBYNQanbq5t5Hobhke3RWgUsPU8noExHPscxrJR/SdBReEEhfcjcC8zeRALXNzL
	RUkLt1I08BQ2uFMrpkn07sMTONPf2Z/+F84YRpQebpdhxovFfpIF6MPaW7So5pHk3sp9
	bpmMWBEu5v7UBCQtN6Me42sfy7CPUv39Nm1aPKmRz6pEoLg65DEn/FIfIv652/vYYiA9
	awUJIYSmke7fCwOg7fknUYXqclle1Lw+wk6eCpcgA0n1Gysw2rIKvKhoMFqZx845QlYH
	IWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=1TwFMTdrijbYHJcqilfA4QcaYI5N+IsK6t29hHJjQM8=;
	b=tBMiByFe5Sczr2w1ueSAh4fYmXCF27vTbbl2mMA61fEmXvjWzThHC0MkcRCqCUA/EA
	8ifXO0M5kHAs8Z0Eg5pXVBxaPaDghdu/6kNV23eTSDCKXfAJF9P6TGDMi4l7Hw3rfaRX
	xjsNFXjZlGU/pXhaNWwmCuAcVuote5bosBRqkmeowy08BBauaP0YcJ3lBYiOB4aaQWHI
	O/RaWa+mS5c7IzVyIewk3gq1Kwrs2L5IxFDxqQVU6Cw6TAM5YBr//1xNSfnN/F/enbDd
	UDoYnJMSYnqqXY9OpfLXvCdg/H3h+bQVJl6GhiLTZ+r69gFUaGASk89QQzJZobqbEUIf
	a/Rw==
X-Gm-Message-State: AHQUAuZUCJRbnSqg1Ak2H4AvLhlpCv7kjMj8Ot63JabB0ITYSvvSN7E8
	4yFL8484Ik6ZO4UQbclKXxPO90JIcjgqJQ==
X-Google-Smtp-Source: AHgI3IZDqO6NitwchuKzB4GZC46FAm5XWCX43ElSO7el/ed2OYCx5YQ0ZGBJXsbE7kKykjFTBJDEwg==
X-Received: by 2002:a50:d753:: with SMTP id i19mr18349810edj.75.1549100633570; 
	Sat, 02 Feb 2019 01:43:53 -0800 (PST)
Received: from localhost ([2001:67c:1810:f051:fd32:55e2:f60b:183b])
	by smtp.gmail.com with ESMTPSA id
	r51sm2682281eda.64.2019.02.02.01.43.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Feb 2019 01:43:52 -0800 (PST)
Date: Sat,  2 Feb 2019 01:43:29 -0800
Message-Id: <20190202094329.22874-11-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190202094329.22874-1-palmer@sifive.com>
References: <20190202094329.22874-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Xi Wang <xi.wang@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::542
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
X-List-Received-Date: Sat, 02 Feb 2019 09:53:23 -0000

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


