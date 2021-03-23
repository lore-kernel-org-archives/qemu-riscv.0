Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOd7o-0006G4-Tn
	for mharc-qemu-riscv@gnu.org; Tue, 23 Mar 2021 05:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1lOd7m-0006Fl-Ez; Tue, 23 Mar 2021 05:14:54 -0400
Received: from exmail.andestech.com ([60.248.187.195]:30835
 helo=ATCSQR.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1lOd7g-0002qw-Jc; Tue, 23 Mar 2021 05:14:53 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 12N9E9JW007749;
 Tue, 23 Mar 2021 17:14:10 +0800 (GMT-8)
 (envelope-from dylan@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Tue, 23 Mar 2021 17:14:10 +0800
From: Dylan Jhong <dylan@andestech.com>
To: <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>
CC: <kbastian@mail.uni-paderborn.de>, <sagark@eecs.berkeley.edu>,
 <palmer@dabbelt.com>, <alistair.francis@wdc.com>,
 <alankao@andestech.com>, <ruinland@andestech.com>,
 <x5710999x@gmail.com>, Dylan Jhong <dylan@andestech.com>
Subject: [PATCH] target/riscv: Align the data type of reset vector address
Date: Tue, 23 Mar 2021 17:14:09 +0800
Message-ID: <20210323091409.1226-1-dylan@andestech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 12N9E9JW007749
Received-SPF: pass client-ip=60.248.187.195; envelope-from=dylan@andestech.com;
 helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 23 Mar 2021 09:14:54 -0000

Although the AE350 has not been upstream (preparing for v2),
the reset vector of the AE350 is known to be at the 2G position,
so this patch is corrected in advance.

Signed-off-by: Dylan Jhong <dylan@andestech.com>
Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2a990f6253..0236abf169 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -137,7 +137,7 @@ static void set_feature(CPURISCVState *env, int feature)
     env->features |= (1ULL << feature);
 }
 
-static void set_resetvec(CPURISCVState *env, int resetvec)
+static void set_resetvec(CPURISCVState *env, uint64_t resetvec)
 {
 #ifndef CONFIG_USER_ONLY
     env->resetvec = resetvec;
-- 
2.17.1


