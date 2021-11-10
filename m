Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkhju-0007zD-BH
	for mharc-qemu-riscv@gnu.org; Wed, 10 Nov 2021 02:09:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkhjs-0007rZ-Mk; Wed, 10 Nov 2021 02:09:44 -0500
Received: from out28-197.mail.aliyun.com ([115.124.28.197]:41867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkhjq-0004gu-EJ; Wed, 10 Nov 2021 02:09:44 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3011507|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0189165-0.00166077-0.979423;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LqU9ybw_1636528172; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LqU9ybw_1636528172) by smtp.aliyun-inc.com(10.147.40.7);
 Wed, 10 Nov 2021 15:09:32 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 09/14] target/riscv: Relax debug check for pm write
Date: Wed, 10 Nov 2021 15:04:47 +0800
Message-Id: <20211110070452.48539-10-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.197; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-197.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Wed, 10 Nov 2021 07:09:45 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/csr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9f41954894..74c0b788fd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1445,6 +1445,9 @@ static bool check_pm_current_disabled(CPURISCVState *env, int csrno)
     int csr_priv = get_field(csrno, 0x300);
     int pm_current;
 
+    if (env->debugger) {
+        return false;
+    }
     /*
      * If priv lvls differ that means we're accessing csr from higher priv lvl,
      * so allow the access
-- 
2.25.1


