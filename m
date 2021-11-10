Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkhlM-0002Hn-Rz
	for mharc-qemu-riscv@gnu.org; Wed, 10 Nov 2021 02:11:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkhlI-0002Dx-1d; Wed, 10 Nov 2021 02:11:12 -0500
Received: from out28-99.mail.aliyun.com ([115.124.28.99]:34714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkhlF-0004t4-Up; Wed, 10 Nov 2021 02:11:11 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07457498|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0446471-0.000322164-0.955031;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LqV1pok_1636528264; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LqV1pok_1636528264)
 by smtp.aliyun-inc.com(10.147.40.233);
 Wed, 10 Nov 2021 15:11:04 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 12/14] target/riscv: Split out the vill from vtype
Date: Wed, 10 Nov 2021 15:04:50 +0800
Message-Id: <20211110070452.48539-13-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.99; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-99.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Nov 2021 07:11:14 -0000

We need not specially process vtype when XLEN changes.
Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.h           |  1 +
 target/riscv/csr.c           | 15 ++++++++++++++-
 target/riscv/machine.c       |  1 +
 target/riscv/vector_helper.c |  7 ++-----
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 73d7aa9ad7..e67531deab 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -121,6 +121,7 @@ struct CPURISCVState {
     target_ulong vl;
     target_ulong vstart;
     target_ulong vtype;
+    target_ulong vill;
 
     target_ulong pc;
     target_ulong load_res;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 59e368f004..33e342f529 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -286,7 +286,20 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
 static RISCVException read_vtype(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
-    *val = env->vtype;
+    target_ulong vill;
+    switch (cpu_get_xl(env)) {
+    case MXL_RV32:
+        vill = env->vill << 31;
+        break;
+#ifdef TARGET_RISCV64
+    case MXL_RV64:
+        vill = env->vill << 63;
+        break;
+#endif
+    default:
+        g_assert_not_reached();
+    }
+    *val = vill | env->vtype;
     return RISCV_EXCP_NONE;
 }
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 19e982d3f0..cc4dda4b93 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -104,6 +104,7 @@ static const VMStateDescription vmstate_vector = {
             VMSTATE_UINTTL(env.vl, RISCVCPU),
             VMSTATE_UINTTL(env.vstart, RISCVCPU),
             VMSTATE_UINTTL(env.vtype, RISCVCPU),
+            VMSTATE_UINTTL(env.vill, RISCVCPU),
             VMSTATE_END_OF_LIST()
         }
 };
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 51bcf63d65..7d7b554789 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -45,11 +45,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     }
     if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
         /* only set vill bit. */
-        if (xlen < TARGET_LONG_BITS) {
-            env->vtype = FIELD_DP64(0, VTYPE, VILL_XLEN32, 1);
-        } else {
-            env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
-        }
+        env->vill = 1;
+        env->vtype = 0;
         env->vl = 0;
         env->vstart = 0;
         return 0;
-- 
2.25.1


