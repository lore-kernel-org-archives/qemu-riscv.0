Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pEu3Y-0000BO-2J
	for mharc-qemu-riscv@gnu.org; Mon, 09 Jan 2023 10:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pEu3W-00007s-0i; Mon, 09 Jan 2023 10:27:22 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pEu3Q-0004mb-9V; Mon, 09 Jan 2023 10:27:18 -0500
X-QQ-mid: bizesmtp63t1673278017tgq0rfh0
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 09 Jan 2023 23:26:55 +0800 (CST)
X-QQ-SSF: 01200000002000C0C000B00A0000000
X-QQ-FEAT: aBJFcW+uBGY6e7Ss6CavoxlfO09rPEQZXsKF/PrBVtVz3BBTPBOTUL6Kp35xw
 alb4/KkOXSa7kOSMtFZUP1mS+h4ONfvNkgMtzfvJi2LrG0NSkHrCv6fgxbY6owRK59qnDzq
 V2RygLIOrtHzksACKWd/wDZsD2U+Xz9InnEu163CbvoM7Yage2QsqVWlcit3uGBwrvSvUP3
 RuLQGJpF5r4o0NpkoXOgDS/7Puj85fqG++3stZeA2mVR4fmilDowyAbrKxS2mgVTW1OHQcW
 P7jaJwyI761BjVyQEIhsg7gIdx63FUu8RsMEcEX6REQD7RbveJZA9p1ylr9Qg91RdRjxP5J
 KZ/uQA8DBvJI8Pk7Es=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: Use TARGET_FMT_lx for env->mhartid
Date: Mon,  9 Jan 2023 23:26:55 +0800
Message-Id: <20230109152655.340114-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 09 Jan 2023 15:27:22 -0000

env->mhartid is currently casted to long before printed, which drops
the high 32-bit for rv64 on 32-bit host. Use TARGET_FMT_lx instead.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 target/riscv/cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cc75ca7667..a5ed6d3f63 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -660,9 +660,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             (env->priv_ver < isa_edata_arr[i].min_version)) {
             isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
 #ifndef CONFIG_USER_ONLY
-            warn_report("disabling %s extension for hart 0x%lx because "
-                        "privilege spec version does not match",
-                        isa_edata_arr[i].name, (unsigned long)env->mhartid);
+            warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
+                        " because privilege spec version does not match",
+                        isa_edata_arr[i].name, env->mhartid);
 #else
             warn_report("disabling %s extension because "
                         "privilege spec version does not match",
-- 
2.34.1


