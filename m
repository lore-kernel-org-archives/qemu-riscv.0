Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8mpr-0005jK-3P
	for mharc-qemu-riscv@gnu.org; Tue, 26 Mar 2019 10:13:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kito@andestech.com>) id 1h8ixV-0004jh-O7
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 06:05:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kito@andestech.com>) id 1h8ipS-0008Ff-R2
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 05:57:11 -0400
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]:12638
	helo=ATCSQR.andestech.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kito@andestech.com>)
	id 1h8ipQ-0008AT-KE; Tue, 26 Mar 2019 05:57:10 -0400
Received: from ATCSQR.andestech.com (localhost [127.0.0.2] (may be forged))
	by ATCSQR.andestech.com with ESMTP id x2Q9Q7gA073351;
	Tue, 26 Mar 2019 17:26:07 +0800 (GMT-8)
	(envelope-from kito@andestech.com)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
	by ATCSQR.andestech.com with ESMTP id x2Q9Pt2v073318;
	Tue, 26 Mar 2019 17:25:55 +0800 (GMT-8)
	(envelope-from kito@andestech.com)
Received: from atccpl07.andestech.com (10.0.15.80) by ATCPCS16.andestech.com
	(10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Tue, 26 Mar 2019
	17:26:26 +0800
From: Kito Cheng <kito@andestech.com>
To: <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>, <palmer@sifive.com>
CC: Kito Cheng <kito.cheng@gmail.com>
Date: Tue, 26 Mar 2019 17:27:17 +0800
Message-ID: <1553592437-109191-1-git-send-email-kito@andestech.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.80]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x2Q9Pt2v073318
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 59.120.53.16
X-Mailman-Approved-At: Tue, 26 Mar 2019 10:13:50 -0400
Subject: [Qemu-riscv] [PATCH] target/riscv: Fix wrong expanding for c.fswsp
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
X-List-Received-Date: Tue, 26 Mar 2019 10:05:37 -0000

From: Kito Cheng <kito.cheng@gmail.com>

base register is no rs1 not rs2 for fsw.

Signed-off-by: Kito Cheng <kito.cheng@gmail.com>
---
 target/riscv/insn_trans/trans_rvc.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvc.inc.c b/target/riscv/insn_trans/trans_rvc.inc.c
index 5819f53..ebcd977 100644
--- a/target/riscv/insn_trans/trans_rvc.inc.c
+++ b/target/riscv/insn_trans/trans_rvc.inc.c
@@ -337,7 +337,7 @@ static bool trans_c_fswsp_sdsp(DisasContext *ctx, arg_c_fswsp_sdsp *a)
 {
 #ifdef TARGET_RISCV32
     /* C.FSWSP */
-    arg_fsw a_fsw = { .rs1 = a->rs2, .rs2 = 2, .imm = a->uimm_fswsp };
+    arg_fsw a_fsw = { .rs1 = 2, .rs2 = a->rs2, .imm = a->uimm_fswsp };
     return trans_fsw(ctx, &a_fsw);
 #else
     /* C.SDSP */
-- 
1.8.3.1


