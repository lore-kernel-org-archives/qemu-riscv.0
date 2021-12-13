Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mwoLh-00031o-VV
	for mharc-qemu-riscv@gnu.org; Mon, 13 Dec 2021 11:38:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mwoLg-0002yY-AZ; Mon, 13 Dec 2021 11:38:48 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:46206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mwoLd-0003Xh-Ln; Mon, 13 Dec 2021 11:38:48 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id D7414402FC;
 Mon, 13 Dec 2021 17:38:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1639413519;
 bh=zwYQGveedQZ6qCLzSyubR6sZG021WHOxUKMx/6y7pUE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iTbxSyd+GXfB11zCBsZ6SGuHH+W7E5ZHVncd5llDYiQbtOakSIyvJhR6bRYvWHdpK
 G1x0l4PqVGZAui82ru+18DrAZUEno/10N1Sf7ZWuRhDcKTscyNps9wTQXUulg5wOel
 x1wQekTYQViMZWbmpsclDs1UkNAB0tDWEQraMS7iLo+1VYliLWjnutN4KsJeOvSVGu
 hO7yed7ivThwQ0Lmo0XYYjBEHE8ICwrkc+PwZ2txEHvub8czbc7M+VDE+eshcvnGWg
 KirskX2uUCm3QGihJ6r5UDrnaUFPtOZcOTL/Wxat/3uHkMMQk8rFcU0cksf9DcTDcl
 mDtEB1xj+soMQ==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id C07D560066;
 Mon, 13 Dec 2021 17:38:39 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 9044314005C;
 Mon, 13 Dec 2021 17:38:39 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v7 02/18] exec/memop: Adding signed quad and octo defines
Date: Mon, 13 Dec 2021 17:38:18 +0100
Message-Id: <20211213163834.170504-3-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
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
X-List-Received-Date: Mon, 13 Dec 2021 16:38:48 -0000

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
2.34.1


