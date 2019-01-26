Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gnZxm-0008Cm-FQ
	for mharc-qemu-riscv@gnu.org; Sat, 26 Jan 2019 21:14:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xi.wang@gmail.com>) id 1gnX8R-0001vr-8G
	for qemu-riscv@nongnu.org; Sat, 26 Jan 2019 18:13:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xi.wang@gmail.com>) id 1gnWzF-0007yx-K1
	for qemu-riscv@nongnu.org; Sat, 26 Jan 2019 18:03:43 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:36409)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <xi.wang@gmail.com>)
	id 1gnWz8-0007pn-Ep; Sat, 26 Jan 2019 18:03:36 -0500
Received: by mail-pg1-x544.google.com with SMTP id n2so5643932pgm.3;
	Sat, 26 Jan 2019 15:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HefkbKfM92zlHKIzhy9dWc38Q8zM7GhMNdqduiXZb/g=;
	b=nfEpvZCwCpWpPNeXrKMxHzutG8sm9D1tLou25/oAhfdzm8tjVHGCn55mEH2sQOF23Z
	bCIdRw+k2TtZgt+2Cet8apElcqUlqo7KyH8AoNzH9Tncc29QxTo6xeIKq/0far/rwP1X
	ig52ZzPs6Jmc5jwp2Ot9b/h12QaTbHBn1inubuFT3Yct2bro/NH9yQIw5DG0nMMkzO0K
	E6MHNuI7JHdQtbfmyByQHcmX6h68Y+THJmI+143/91zWXO8xSSOZq55QWofEPJGXSRsg
	22Lgl3DuPV8TyapJS8lCEbvPhDtESsJitagVdCbaAZjalLb8qlUbRRCujEWBbqq9Bdw4
	SNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HefkbKfM92zlHKIzhy9dWc38Q8zM7GhMNdqduiXZb/g=;
	b=Y9X1b1Rp98bmyYWxeSXxB+ZU0gka1Pgp+qRL3RKQHzx1ogbivJd3Xc3JNOA7pTrshE
	3Ms2RQt4pQQwMEGovctSB11tE+wqQ4CffA1YugFeNpjfkSKMS5AONquhF/U1Vn9ahTq3
	X1idz6hw3FabwwIS1jQaWuCPI+SJmGmUt1xJTGvkd/eujWEecL/Fq6XLnULbWwV/8WMd
	nlMPHoWHP2nm8E/k+txJekGHrmEpxk6WmPJYz+DvoqJ6qk7VFdyxLrI3sDfeUmNAsODA
	OT4Z0FiwLtZA76iA1QHt10J+ENvjxJ1PNBrxsLBAe84EbOH2wpQ8jGNVEJq995SI7/qB
	UdZg==
X-Gm-Message-State: AJcUukeBp+qzwPMjS8ynP4vk3DbFCET2QGS/dOJKxXUhDbapIxp3r+rJ
	FHDsN24NEcu0limKGV/UeqiGnWQU
X-Google-Smtp-Source: ALg8bN4Pi9waG2YLiz2nqYhB2eY8FQu0KRaCusD3zBwberyK4YylZftjV3WXxXNY3Aq00Pz6jYd6dg==
X-Received: by 2002:a63:4665:: with SMTP id v37mr15011438pgk.425.1548543801093;
	Sat, 26 Jan 2019 15:03:21 -0800 (PST)
Received: from kaby.cs.washington.edu ([2607:4000:200:15:6070:48b1:4858:942f])
	by smtp.gmail.com with ESMTPSA id
	w128sm36783248pfw.79.2019.01.26.15.03.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Jan 2019 15:03:20 -0800 (PST)
From: Xi Wang <xi.wang@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Xi Wang <xi.wang@gmail.com>, Michael Clark <mjc@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Sat, 26 Jan 2019 15:02:56 -0800
Message-Id: <20190126230256.10983-1-xi.wang@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
X-Mailman-Approved-At: Sat, 26 Jan 2019 21:14:18 -0500
Subject: [Qemu-riscv] [PATCH] target/riscv: fix counter-enable checks in
 ctr()
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
X-List-Received-Date: Sat, 26 Jan 2019 23:13:12 -0000

Access to a counter in U-mode is permitted only if the corresponding
bit is set in both mcounteren and scounteren.  The current code
ignores mcounteren and checks scounteren only for U-mode access.

Signed-off-by: Xi Wang <xi.wang@gmail.com>
---
 target/riscv/csr.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5e7e7d16b8..133f2ff7e2 100644
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
2.19.1


