Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nx5cJ-0002vx-3U
	for mharc-qemu-riscv@gnu.org; Fri, 03 Jun 2022 07:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nx5c7-0002uR-1Y; Fri, 03 Jun 2022 07:37:15 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:51156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nx5c5-0002ct-Ef; Fri, 03 Jun 2022 07:37:10 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 3E019300089;
 Fri,  3 Jun 2022 11:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1654256224;
 bh=BHttdtJU5e81MEpKJ1ZDkGGx03lCfRWah1FH+0EKavo=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=swni6QOvj2zw5bBMQzcvN0cYB9yOBNf/kwma4h+j+NgBtM+9Z3IwqXmHFLak5LABg
 qY943RHc6oFHczDhEXtDA2toKOOEGjPJxjGRxd9W7+CjerdXZuLA7CmjDriGER28Dv
 QoP92NBKibJkLreefLDkAbQsaxqgfKRDFuSbqWY4=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 3/3] target/riscv: Deprecate capitalized property names
Date: Fri,  3 Jun 2022 20:36:44 +0900
Message-Id: <e8d4803196dfc83a48655ddf82bc3f4077be6579.1654256190.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1654256190.git.research_trasio@irq.a4lg.com>
References: <cover.1653472385.git.research_trasio@irq.a4lg.com>
 <cover.1654256190.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:2500:203:30b:4000:6bfe:4757:0;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 03 Jun 2022 11:37:20 -0000

This commit adds a deprecation note of capitalized property names of
RISC-V CPU to documentation.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 docs/about/deprecated.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index a92ae0f162..cfc9adcd4b 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -300,6 +300,16 @@ Options are:
 Device options
 --------------
 
+CPU options
+'''''''''''
+
+Capitalized property names on RISC-V ``-cpu`` (since 7.1)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Using capitalized RISC-V CPU property names like ``-cpu rv64,Counters=on`` is
+deprecated.  Use lowercase names instead (e.g. ``-cpu rv64,counters=on``).
+
+
 Emulated device options
 '''''''''''''''''''''''
 
-- 
2.34.1


