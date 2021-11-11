Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml3Du-0000it-Rp
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 01:06:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml3Dq-0000fF-DP; Thu, 11 Nov 2021 01:06:06 -0500
Received: from out28-218.mail.aliyun.com ([115.124.28.218]:36141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml3Da-00045Y-Jr; Thu, 11 Nov 2021 01:06:06 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1839589|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0861623-0.000514328-0.913323;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047206; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.Lr1RmV._1636610741; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lr1RmV._1636610741)
 by smtp.aliyun-inc.com(10.147.41.178);
 Thu, 11 Nov 2021 14:05:42 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 15/20] target/riscv: Remove VILL field in VTYPE
Date: Thu, 11 Nov 2021 13:57:55 +0800
Message-Id: <20211111055800.42672-16-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.218; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-218.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 11 Nov 2021 06:06:08 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b48c7c346c..5f35217f7d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -106,7 +106,6 @@ FIELD(VTYPE, VLMUL, 0, 2)
 FIELD(VTYPE, VSEW, 2, 3)
 FIELD(VTYPE, VEDIV, 5, 2)
 FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 8)
-FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 
 struct CPURISCVState {
     target_ulong gpr[32];
-- 
2.25.1


