Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml399-0003hF-TG
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 01:01:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml398-0003dp-5t; Thu, 11 Nov 2021 01:01:14 -0500
Received: from out28-169.mail.aliyun.com ([115.124.28.169]:36971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml395-0003bg-7t; Thu, 11 Nov 2021 01:01:13 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2787421|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0189165-0.00166077-0.979423;
 FP=2590121777638770114|2|2|6|0|-1|-1|-1; HT=ay29a033018047211;
 MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.Lr1-t1N_1636610466; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lr1-t1N_1636610466)
 by smtp.aliyun-inc.com(10.147.41.143);
 Thu, 11 Nov 2021 14:01:06 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 06/20] target/riscv: Relax debug check for pm write
Date: Thu, 11 Nov 2021 13:57:46 +0800
Message-Id: <20211111055800.42672-7-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.169; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-169.mail.aliyun.com
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
X-List-Received-Date: Thu, 11 Nov 2021 06:01:14 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


