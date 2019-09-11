Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7wDd-00076X-DL
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 02:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38432)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1i7wDY-0006yZ-0W
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 02:35:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1i7wDW-0007p3-3O
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 02:35:03 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:35531)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1i7wDT-0007iz-6j; Wed, 11 Sep 2019 02:34:59 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0409334|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.275102-0.0298298-0.695068; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03276; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=11; RT=11; SR=0;
 TI=SMTPD_---.FSRC1sE_1568183690; 
Received: from localhost(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.FSRC1sE_1568183690)
 by smtp.aliyun-inc.com(10.147.43.230);
 Wed, 11 Sep 2019 14:34:50 +0800
From: liuzhiwei <zhiwei_liu@c-sky.com>
To: Alistair.Francis@wdc.com, palmer@sifive.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, riku.voipio@iki.fi, laurent@vivier.eu,
 wenmeng_zhang@c-sky.com
Cc: wxy194768@alibaba-inc.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Date: Wed, 11 Sep 2019 14:25:26 +0800
Message-Id: <1568183141-67641-3-git-send-email-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 121.197.200.217
Subject: [Qemu-riscv] [PATCH v2 02/17] RISC-V: turn on vector extension from
 command line by cfg.ext_v Property
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
X-List-Received-Date: Wed, 11 Sep 2019 06:35:06 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.c | 6 +++++-
 target/riscv/cpu.h | 2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f8d07bd..9f93ce7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -109,7 +109,7 @@ static void set_resetvec(CPURISCVState *env, int resetvec)
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVU | RVV);
     set_priv_version(env, PRIV_VERSION_1_11_0);
     set_resetvec(env, DEFAULT_RSTVEC);
 }
@@ -406,6 +406,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_u) {
             target_misa |= RVU;
         }
+        if (cpu->cfg.ext_v) {
+            target_misa |= RVV;
+        }
 
         set_misa(env, RVXLEN | target_misa);
     }
@@ -441,6 +444,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
+    DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, true),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c992b1d..2c7072a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -67,6 +67,7 @@
 #define RVC RV('C')
 #define RVS RV('S')
 #define RVU RV('U')
+#define RVV RV('V')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -250,6 +251,7 @@ typedef struct RISCVCPU {
         bool ext_c;
         bool ext_s;
         bool ext_u;
+        bool ext_v;
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
-- 
2.7.4


