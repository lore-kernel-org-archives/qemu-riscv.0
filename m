Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYETk-00081k-I1
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETc-0007xA-F1; Wed, 06 Oct 2021 17:29:26 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETZ-0007uU-3T; Wed, 06 Oct 2021 17:29:24 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 9B5CA40FE2;
 Wed,  6 Oct 2021 23:29:19 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 84A9E60067;
 Wed,  6 Oct 2021 23:29:19 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 4E55714005C;
 Wed,  6 Oct 2021 23:29:19 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 01/27] memory: add a few defines for octo (128-bit) values
Date: Wed,  6 Oct 2021 23:28:07 +0200
Message-Id: <20211006212833.108706-2-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 06 Oct 2021 21:29:27 -0000

Introducing unsigned quad, signed quad, and octo accesses types
to handle load and store by 128-bit processors.
This is just a small addition to Richard's patch not yet upstreamed
https://lore.kernel.org/qemu-devel/20210818191920.390759-24-richard.henderson@linaro.org/
Note that the patch must be applied first for the rest to compile

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 include/exec/memop.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 04264ffd6b..9297f58a39 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -85,10 +85,13 @@ typedef enum MemOp {
     MO_UB    = MO_8,
     MO_UW    = MO_16,
     MO_UL    = MO_32,
+    MO_UQ    = MO_64,
     MO_SB    = MO_SIGN | MO_8,
     MO_SW    = MO_SIGN | MO_16,
     MO_SL    = MO_SIGN | MO_32,
+    MO_SQ    = MO_SIGN | MO_64,
     MO_Q     = MO_64,
+    MO_O     = MO_128,
 
     MO_LEUW  = MO_LE | MO_UW,
     MO_LEUL  = MO_LE | MO_UL,
@@ -105,9 +108,12 @@ typedef enum MemOp {
 #ifdef NEED_CPU_H
     MO_TEUW  = MO_TE | MO_UW,
     MO_TEUL  = MO_TE | MO_UL,
+    MO_TEUQ  = MO_TE | MO_UQ,
     MO_TESW  = MO_TE | MO_SW,
     MO_TESL  = MO_TE | MO_SL,
+    MO_TESQ  = MO_TE | MO_SQ,
     MO_TEQ   = MO_TE | MO_Q,
+    MO_TEO   = MO_TE | MO_O,
 #endif
 
     MO_SSIZE = MO_SIZE | MO_SIGN,
-- 
2.33.0


