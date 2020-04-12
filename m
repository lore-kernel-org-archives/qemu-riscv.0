Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNS3E-000351-E4
	for mharc-qemu-riscv@gnu.org; Sat, 11 Apr 2020 22:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46511)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jNS3C-00031C-4r
 for qemu-riscv@nongnu.org; Sat, 11 Apr 2020 22:08:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jNS3B-0000E5-90
 for qemu-riscv@nongnu.org; Sat, 11 Apr 2020 22:08:46 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:37177)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jNS38-0000Cw-D5; Sat, 11 Apr 2020 22:08:42 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1767189|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00848618-8.78409e-05-0.991426;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03302; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.HF0TmGm_1586657312; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HF0TmGm_1586657312)
 by smtp.aliyun-inc.com(10.147.42.135);
 Sun, 12 Apr 2020 10:08:33 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org,
	alistair23@gmail.com,
	palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH] linux-user/riscv: fix up struct target_ucontext definition
Date: Sun, 12 Apr 2020 10:08:30 +0800
Message-Id: <20200412020830.607-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
X-List-Received-Date: Sun, 12 Apr 2020 02:08:47 -0000

As struct target_ucontext will be transfered to signal handler, it
must keep pace with struct ucontext_t defined in Linux kernel.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 linux-user/riscv/signal.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index 83ecc6f799..67a95dbc7b 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -40,8 +40,9 @@ struct target_ucontext {
     unsigned long uc_flags;
     struct target_ucontext *uc_link;
     target_stack_t uc_stack;
-    struct target_sigcontext uc_mcontext;
     target_sigset_t uc_sigmask;
+    uint8_t   __unused[1024 / 8 - sizeof(target_sigset_t)];
+    struct target_sigcontext uc_mcontext QEMU_ALIGNED(16);
 };
 
 struct target_rt_sigframe {
-- 
2.23.0


