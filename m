Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAa5y-0002jZ-Ln
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAa5x-0002gz-3q; Fri, 12 Feb 2021 10:10:57 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:50699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAa5t-00078D-S9; Fri, 12 Feb 2021 10:10:56 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1636807|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0202074-0.000563671-0.979229;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JYH-.kU_1613142640; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYH-.kU_1613142640) by smtp.aliyun-inc.com(10.147.40.2);
 Fri, 12 Feb 2021 23:10:41 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 03/38] target/riscv: Fixup saturate subtract function
Date: Fri, 12 Feb 2021 23:02:21 +0800
Message-Id: <20210212150256.885-4-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210212150256.885-1-zhiwei_liu@c-sky.com>
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 12 Feb 2021 15:10:57 -0000

The overflow predication ((a - b) ^ a) & (a ^ b) & INT64_MIN is right.
However, when the predication is ture and a is 0, it should return maximum.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 9371d70f6b..9786f630b4 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2425,7 +2425,7 @@ int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
     int8_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT8_MIN) {
-        res = a > 0 ? INT8_MAX : INT8_MIN;
+        res = a >= 0 ? INT8_MAX : INT8_MIN;
         env->vxsat = 0x1;
     }
     return res;
@@ -2435,7 +2435,7 @@ int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
 {
     int16_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT16_MIN) {
-        res = a > 0 ? INT16_MAX : INT16_MIN;
+        res = a >= 0 ? INT16_MAX : INT16_MIN;
         env->vxsat = 0x1;
     }
     return res;
@@ -2445,7 +2445,7 @@ int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
 {
     int32_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT32_MIN) {
-        res = a > 0 ? INT32_MAX : INT32_MIN;
+        res = a >= 0 ? INT32_MAX : INT32_MIN;
         env->vxsat = 0x1;
     }
     return res;
@@ -2455,7 +2455,7 @@ int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
 {
     int64_t res = a - b;
     if ((res ^ a) & (a ^ b) & INT64_MIN) {
-        res = a > 0 ? INT64_MAX : INT64_MIN;
+        res = a >= 0 ? INT64_MAX : INT64_MIN;
         env->vxsat = 0x1;
     }
     return res;
-- 
2.17.1


