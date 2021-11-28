Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrKh9-0006Ap-Og
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 08:58:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mrKgi-0005vi-JG; Sun, 28 Nov 2021 08:57:55 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:34234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mrKgg-0004e9-Hx; Sun, 28 Nov 2021 08:57:52 -0500
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 338254028C;
 Sun, 28 Nov 2021 14:57:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1638107867;
 bh=YTTiHIj5r79DG4fgmzXG9MDTfCI71vsRw730fXSvdAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OIA11gAJEzf+mE8JtYHEl+P46c1TJ+nX/K7WnZ/87hmQL2H0MlcucS3mU7Cy+3lR/
 2NhUoaqIPGtpqx11qR0faalZ70wJu3IqwB8i2bUIY9NwdKMT7+mmCaZJV6L6vVdaMz
 kVxRdS/YnS9Zcn7i1QGmcFQQnzhwUsX1/AKVmYJ7L37yugHqVycZI+M6GxX3KOW5AZ
 piH16Tim8SgYFp/UxeNTySd3pRC8oCZoB7Wh1mB7iwQQwVde7aXbQB1zAdaRSGnwko
 wj4z8roLHua+RESqDIl6Eptwj5H8NkBRl3HJrlUXCiEXTtGiuJv3D/WIo8EqiGgvd5
 gC32dj4sk06UQ==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 1DE5A60067;
 Sun, 28 Nov 2021 14:57:47 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id E4B6940069;
 Sun, 28 Nov 2021 14:57:46 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v6 02/18] exec/memop: Adding signed quad and octo defines
Date: Sun, 28 Nov 2021 14:57:03 +0100
Message-Id: <20211128135719.50444-3-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 28 Nov 2021 13:58:00 -0000

Adding defines to handle signed 64-bit and unsigned 128-bit quantities in
memory accesses.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/exec/memop.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 72c2f0ff3d..2a885f3917 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -86,28 +86,35 @@ typedef enum MemOp {
     MO_UW    = MO_16,
     MO_UL    = MO_32,
     MO_UQ    = MO_64,
+    MO_UO    = MO_128,
     MO_SB    = MO_SIGN | MO_8,
     MO_SW    = MO_SIGN | MO_16,
     MO_SL    = MO_SIGN | MO_32,
+    MO_SQ    = MO_SIGN | MO_64,
+    MO_SO    = MO_SIGN | MO_128,
 
     MO_LEUW  = MO_LE | MO_UW,
     MO_LEUL  = MO_LE | MO_UL,
     MO_LEUQ  = MO_LE | MO_UQ,
     MO_LESW  = MO_LE | MO_SW,
     MO_LESL  = MO_LE | MO_SL,
+    MO_LESQ  = MO_LE | MO_SQ,
 
     MO_BEUW  = MO_BE | MO_UW,
     MO_BEUL  = MO_BE | MO_UL,
     MO_BEUQ  = MO_BE | MO_UQ,
     MO_BESW  = MO_BE | MO_SW,
     MO_BESL  = MO_BE | MO_SL,
+    MO_BESQ  = MO_BE | MO_SQ,
 
 #ifdef NEED_CPU_H
     MO_TEUW  = MO_TE | MO_UW,
     MO_TEUL  = MO_TE | MO_UL,
     MO_TEUQ  = MO_TE | MO_UQ,
+    MO_TEUO  = MO_TE | MO_UO,
     MO_TESW  = MO_TE | MO_SW,
     MO_TESL  = MO_TE | MO_SL,
+    MO_TESQ  = MO_TE | MO_SQ,
 #endif
 
     MO_SSIZE = MO_SIZE | MO_SIGN,
-- 
2.34.0


