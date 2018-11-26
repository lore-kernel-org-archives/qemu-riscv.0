Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRHGb-0006wn-9D
	for mharc-qemu-riscv@gnu.org; Mon, 26 Nov 2018 08:49:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gR7SY-0003JH-CR
	for qemu-riscv@nongnu.org; Sun, 25 Nov 2018 22:21:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>) id 1gR7SX-000218-Pn
	for qemu-riscv@nongnu.org; Sun, 25 Nov 2018 22:21:18 -0500
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:19232)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maozhongyi@cmss.chinamobile.com>)
	id 1gR7SR-0001md-CW; Sun, 25 Nov 2018 22:21:12 -0500
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by
	rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id
	2ee65bfb669478f-255a4; Mon, 26 Nov 2018 11:20:52 +0800 (CST)
X-RM-TRANSID: 2ee65bfb669478f-255a4
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.149])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id
	2ee95bfb668fb25-950e8; Mon, 26 Nov 2018 11:20:52 +0800 (CST)
X-RM-TRANSID: 2ee95bfb668fb25-950e8
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: mjc@sifive.com, palmer@sifive.com, Alistair.Francis@wdc.com,
	sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
	philmd@redhat.com, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Date: Mon, 26 Nov 2018 11:20:38 +0800
Message-Id: <20181126032038.22044-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.80
X-Mailman-Approved-At: Mon, 26 Nov 2018 08:49:36 -0500
Subject: [Qemu-riscv] [PATCH] riscv/cpu: use device_class_set_parent_realize
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
X-List-Received-Date: Mon, 26 Nov 2018 03:21:19 -0000

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 target/riscv/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a025a0a3ba..5e8a2cb2ba 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -330,8 +330,8 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
 
-    mcc->parent_realize = dc->realize;
-    dc->realize = riscv_cpu_realize;
+    device_class_set_parent_realize(dc, riscv_cpu_realize,
+                                    &mcc->parent_realize);
 
     mcc->parent_reset = cc->reset;
     cc->reset = riscv_cpu_reset;
-- 
2.17.1




