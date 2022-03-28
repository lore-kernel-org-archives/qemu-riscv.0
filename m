Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYp9o-0003DO-MV
	for mharc-qemu-riscv@gnu.org; Mon, 28 Mar 2022 09:11:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nYp9j-000350-09; Mon, 28 Mar 2022 09:11:35 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:63827
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nYp9h-0004Ud-4I; Mon, 28 Mar 2022 09:11:34 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id DB4DE300089;
 Mon, 28 Mar 2022 13:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1648473091;
 bh=8XjPTSCgvJ2zXdwJphhhu+q0qX8Ez19jJaKG41vPCNk=;
 h=From:To:Cc:Subject:Date:Message-Id:Mime-Version:
 Content-Transfer-Encoding;
 b=HQzco3LxVj6aQGzbVJsK4nheXqC8OEWfi0A1b0p6nSy8WmtjY9add1Mh0pxT3EeFP
 /g10CgZnGVX6DRXYxvYQzz5rjnOX3W/dfV42Lh5hPTded6YPo0Y0xo8+X8Bd49F/ak
 SyPsaFRGC/EVU6PcyfyVyonGO0oUVAQYcVH4dgfA=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 0/1] target/riscv: misa to ISA string conversion fix
Date: Mon, 28 Mar 2022 22:11:22 +0900
Message-Id: <cover.1648473008.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=153.120.152.154;
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
X-List-Received-Date: Mon, 28 Mar 2022 13:11:35 -0000

[v1] https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg06350.html

S and U are misa bits but not extensions (instead, they are supported
privilege modes).  Thus, they should not be copied to the ISA string.

[CHANGES: v1 -> v2]

I also removed almost all reserved/dropped single-letter "extensions"
from the list.

-   "B": Not going to be a single-letter extension (misa.B is reserved).
-   "J": Not going to be a single-letter extension (misa.J is reserved).
-   "K": Not going to be a single-letter extension (misa.K is reserved).
-   "L": Dropped.
-   "N": Dropped.
-   "T": Dropped.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>




Tsukasa OI (1):
  target/riscv: misa to ISA string conversion fix

 target/riscv/cpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)


base-commit: 3d31fe4d662f13c70eb7e87f29513623ccd76322
-- 
2.32.0


