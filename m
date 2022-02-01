Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nEmwF-0007DL-0h
	for mharc-qemu-riscv@gnu.org; Tue, 01 Feb 2022 01:46:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nEmw6-00075D-Mb; Tue, 01 Feb 2022 01:46:43 -0500
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:56657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nEmvy-0000Ok-DJ; Tue, 01 Feb 2022 01:46:41 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1555593|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.157182-0.000617891-0.8422;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047187; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.MkcwDht_1643697970; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MkcwDht_1643697970)
 by smtp.aliyun-inc.com(10.147.42.135);
 Tue, 01 Feb 2022 14:46:10 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH] target/riscv: Fix vill field write in vtype
Date: Tue,  1 Feb 2022 14:46:01 +0800
Message-Id: <20220201064601.41143-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.221; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-221.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 01 Feb 2022 06:46:45 -0000

The guest should be able to set the vill bit as part of vsetvl.

Currently we may set env->vill to 1 in the vsetvl helper, but there
is nowhere that we set it to 0, so once it transitions to 1 it's stuck
there until the system is reset.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/vector_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 020d2e841f..3bd4aac9c9 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -71,6 +71,7 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     env->vl = vl;
     env->vtype = s2;
     env->vstart = 0;
+    env->vill = 0;
     return vl;
 }
 
-- 
2.25.1


