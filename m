Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lPIvg-0000JI-Pp
	for mharc-qemu-riscv@gnu.org; Thu, 25 Mar 2021 01:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1lPIve-0000J8-Te; Thu, 25 Mar 2021 01:53:10 -0400
Received: from exmail.andestech.com ([60.248.187.195]:17814
 helo=ATCSQR.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1lPIva-0001jS-M9; Thu, 25 Mar 2021 01:53:09 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 12P5qMjR086974;
 Thu, 25 Mar 2021 13:52:22 +0800 (GMT-8)
 (envelope-from dylan@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Thu, 25 Mar 2021 13:52:23 +0800
From: Dylan Jhong <dylan@andestech.com>
To: <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>, <palmer@dabbelt.com>,
 <Alistair.Francis@wdc.com>, <sagark@eecs.berkeley.edu>,
 <kbastian@mail.uni-paderborn.de>
CC: <ruinland@andestech.com>, <alankao@andestech.com>, <bmeng.cn@gmail.com>,
 <x5710999x@gmail.com>, Dylan Jhong <dylan@andestech.com>
Subject: [PATCH V2] target/riscv: Align the data type of reset vector address
Date: Thu, 25 Mar 2021 13:52:13 +0800
Message-ID: <20210325055213.13464-1-dylan@andestech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 12P5qMjR086974
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
X-List-Received-Date: Thu, 25 Mar 2021 05:53:11 -0000

Signed-off-by: Dylan Jhong <dylan@andestech.com>
Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
---
 target/riscv/cpu.c | 2 +-
 target/riscv/cpu.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6ed80f6b..4ac901245a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -137,7 +137,7 @@ static void set_feature(CPURISCVState *env, int feature)
     env->features |= (1ULL << feature);
 }
 
-static void set_resetvec(CPURISCVState *env, int resetvec)
+static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
 {
 #ifndef CONFIG_USER_ONLY
     env->resetvec = resetvec;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba..d9d7891666 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -303,7 +303,7 @@ struct RISCVCPU {
         uint16_t elen;
         bool mmu;
         bool pmp;
-        uint64_t resetvec;
+        target_ulong resetvec;
     } cfg;
 };
 
-- 
2.17.1


