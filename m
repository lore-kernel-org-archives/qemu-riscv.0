Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nu96x-0004GE-LM
	for mharc-qemu-riscv@gnu.org; Thu, 26 May 2022 04:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1nu96p-0004Ay-6R; Thu, 26 May 2022 04:44:47 -0400
Received: from forward108p.mail.yandex.net ([77.88.28.116]:51538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1nu96k-0004Ci-34; Thu, 26 May 2022 04:44:40 -0400
Received: from myt6-469628f636f5.qloud-c.yandex.net
 (myt6-469628f636f5.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:2324:0:640:4696:28f6])
 by forward108p.mail.yandex.net (Yandex) with ESMTP id 24155267B2EE;
 Thu, 26 May 2022 11:42:44 +0300 (MSK)
Received: from myt6-265321db07ea.qloud-c.yandex.net
 (myt6-265321db07ea.qloud-c.yandex.net [2a02:6b8:c12:2626:0:640:2653:21db])
 by myt6-469628f636f5.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 JDroL4ykdh-ggf036IF; Thu, 26 May 2022 11:42:44 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1653554564; bh=aqb2foDc0AvRksUUJIvWGE1Dqmpji7BNUauUynhu7Y0=;
 h=Date:Subject:Cc:To:From:Message-Id;
 b=M3HB2jKZDGyYdhPIzukx2R4b8B/Ja0A7o7UZNGaL7Wq1p62UHDOudCbKtoEwn1VAJ
 +sfqpz8DxgddYUhPyFwcC10ROHjguHn1ZktgYWqMF82hPSiOr78MP/g/jT6BeUGhHK
 AzIvu4AEpFTxceBJuUxCGFFgmSMaunCOPw+Hhgb8=
Authentication-Results: myt6-469628f636f5.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by myt6-265321db07ea.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id vHae99NrIF-ggjSeULn; Thu, 26 May 2022 11:42:42 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: 
Cc: atishp@rivosinc.com, linux@yadro.com, Nikita Shubin <n.shubin@yadro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] target/riscv: fix priv enum
Date: Thu, 26 May 2022 11:42:40 +0300
Message-Id: <20220526084240.31298-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.28.116;
 envelope-from=nikita.shubin@maquefel.me; helo=forward108p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 26 May 2022 08:44:49 -0000

From: Nikita Shubin <n.shubin@yadro.com>

Add PRIV_VERSION_UNKNOWN to enum, otherwise PRIV_VERSION_1_10_0 will
be overwritten to PRIV_VERSION_1_12_0 in riscv_cpu_realize.

Fixes: a46d410c5c ("target/riscv: Define simpler privileged spec version numbering")
Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
---
 target/riscv/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f08c3e8813..1f1d6589a7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -91,7 +91,8 @@ enum {
 
 /* Privileged specification version */
 enum {
-    PRIV_VERSION_1_10_0 = 0,
+    PRIV_VERSION_UNKNOWN = 0,
+    PRIV_VERSION_1_10_0,
     PRIV_VERSION_1_11_0,
     PRIV_VERSION_1_12_0,
 };
-- 
2.35.1


