Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jSlcd-0008K0-Kv
	for mharc-qemu-riscv@gnu.org; Sun, 26 Apr 2020 14:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair@alistair23.me>) id 1jSlcb-0008Gt-QR
 for qemu-riscv@nongnu.org; Sun, 26 Apr 2020 14:03:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair@alistair23.me>) id 1jSlcb-0008Ar-DM
 for qemu-riscv@nongnu.org; Sun, 26 Apr 2020 14:03:17 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:39553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1jSlcZ-0008AA-ST; Sun, 26 Apr 2020 14:03:15 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2695A5C00A4;
 Sun, 26 Apr 2020 14:03:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sun, 26 Apr 2020 14:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=UU0FRAkADueGV
 GnvDO1YKP2XHBjzPc0YVUe1BTNexo0=; b=Pvgf6rUjAKZHDZvOuGN8Ustrl+1w2
 uhIppfGTv+ASbSX7QEWbzQw6YC17VP2r+ffcc8tIukIBleOqgWY5lItJSco7qCR9
 +01NpYaEfs8AkklQbAxRqkvl5pWbVo5GVWrraYX6vGVruMhuGlNxM+Qu6XOVzQ24
 HoDroFtD792g81BhkGfbJ/tEeEe0kPzHvgsj4htpc4gV6/EOVNVtVrSl5g3NbrM4
 ZfIRB2EdYOK3jj51R4QcavMiwTpsjuW+EJ1Xxm8D9wowHXuuVhDtx3U8Ally88np
 Qi/lqQBNWQzUWoM1XLT+FTA2NaBCRM5Dlcml3yVgZSgMUxf7D0j6x8SMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=UU0FRAkADueGVGnvDO1YKP2XHBjzPc0YVUe1BTNexo0=; b=UBWmyRJ7
 bsJrEMsYqTIBR2BSq19Q5wOl9vicr+xoyCRAxT31CZMLU5Kjrm/+kdIRHE2SsOI8
 nY025FUyK+564umY5ybBNZ/AjUT4oMZCa5hwjsCPISe1JKaPLKwrc5+yOoKCkLHm
 kW0QCceaoybvYsl/Gf25mXZG+D2QJ8ZknOqluprXVvhKcQLZGbLvfO8O3vhFeSUT
 9cVfBr1SZayo0yT2f+fxg42ug0z2XT0utrpwCxjngT1Td2XSf+jszOd2kcSl4A5W
 lXIrf9nQxJASRYvMMM6E+l+XEzG3IwHyPX71OCs0oDJQyOAzbBzQPwFj4fqJEVb8
 dbH1a4gEiKB1fg==
X-ME-Sender: <xms:4sylXioF-fMYhrtXKzOjqX93Hr6zkrEHq0Yb2c_YZgo_DyJrTaemkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrheejgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
 ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucfkphepjeefrdelfedrkeegrddvtdekne
 cuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomheprghlihhs
 thgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:4sylXmpmZaNW5cZKSFIpdmXQkiB2RH6V_FqUebMEaB9dkZwM7iBlGg>
 <xmx:4sylXiBAqJWBMuIq1Ov85sFgApZe7nlPVUAd-t-t8TWh8M8wQLmT3g>
 <xmx:4sylXkseMoJP2Zfa34TtGM5gqF4fOZorGVBJx7hnCEaXV74mQabKqg>
 <xmx:4sylXtDilGeWoDsVAoC6M0ltQEkvnBWa3hnCg2wWWAmEEm5c2uPkKg>
Received: from ThinkpadX1Yoga3.localdomain (c-73-93-84-208.hsd1.ca.comcast.net
 [73.93.84.208])
 by mail.messagingengine.com (Postfix) with ESMTPA id 594063065E37;
 Sun, 26 Apr 2020 14:03:13 -0400 (EDT)
From: Alistair Francis <alistair@alistair23.me>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v1 9/9] target/riscv: Use a smaller guess size for no-MMU PMP
Date: Sat, 25 Apr 2020 04:29:33 -0700
Message-Id: <e5aa799cb3d51513c7b7700e89625d4108e2fe66.1587920572.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1587920572.git.alistair.francis@wdc.com>
References: <cover.1587920572.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=66.111.4.29; envelope-from=alistair@alistair23.me;
 helo=out5-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 14:02:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 66.111.4.29
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Apr 2020 18:03:18 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 0e6b640fbd..5aba4d13ea 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -233,12 +233,21 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
         return true;
     }
 
-    /*
-     * if size is unknown (0), assume that all bytes
-     * from addr to the end of the page will be accessed.
-     */
     if (size == 0) {
-        pmp_size = -(addr | TARGET_PAGE_MASK);
+        if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+            /*
+             * if size is unknown (0), assume that all bytes
+             * from addr to the end of the page will be accessed.
+             */
+            pmp_size = -(addr | TARGET_PAGE_MASK);
+        } else {
+            /*
+             * If size is unknown (0) and we don't have an MMU,
+             * just guess the size as the xlen as we don't want to
+             * access an entire page worth.
+             */
+            pmp_size = sizeof(target_ulong);
+        }
     } else {
         pmp_size = size;
     }
-- 
2.26.2


