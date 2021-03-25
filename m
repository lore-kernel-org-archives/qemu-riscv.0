Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lPMW6-0007Gi-5Y
	for mharc-qemu-riscv@gnu.org; Thu, 25 Mar 2021 05:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1lPMW4-0007GB-0p; Thu, 25 Mar 2021 05:43:00 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:21007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1lPMW0-0002Xn-S0; Thu, 25 Mar 2021 05:42:59 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 12P9gM7G052255;
 Thu, 25 Mar 2021 17:42:22 +0800 (GMT-8)
 (envelope-from dylan@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Thu, 25 Mar 2021 17:42:24 +0800
From: Dylan Jhong <dylan@andestech.com>
To: <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>, <palmer@dabbelt.com>,
 <Alistair.Francis@wdc.com>, <sagark@eecs.berkeley.edu>,
 <kbastian@mail.uni-paderborn.de>
CC: <ruinland@andestech.com>, <alankao@andestech.com>, <x5710999x@gmail.com>, 
 <bmeng.cn@gmail.com>, Dylan Jhong <dylan@andestech.com>
Subject: [PATCH V3] target/riscv: Align the data type of reset vector address
Date: Thu, 25 Mar 2021 17:41:50 +0800
Message-ID: <20210325094150.28918-1-dylan@andestech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 12P9gM7G052255
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
X-List-Received-Date: Thu, 25 Mar 2021 09:43:00 -0000

Signed-off-by: Dylan Jhong <dylan@andestech.com>
Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
---
 target/riscv/cpu.c | 6 +++++-
 target/riscv/cpu.h | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6ed80f6b..8a5f18bcb0 100644
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
@@ -554,7 +554,11 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+#if defined(TARGET_RISCV32)
+    DEFINE_PROP_UINT32("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
+#elif defined(TARGET_RISCV64)
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
+#endif
     DEFINE_PROP_END_OF_LIST(),
 };
 
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


