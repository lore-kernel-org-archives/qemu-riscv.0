Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlCTT-0007xK-2r
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 10:58:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCTR-0007rk-QT; Thu, 11 Nov 2021 10:58:49 -0500
Received: from mail142-26.mail.alibaba.com ([198.11.142.26]:51162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCTP-0000IO-PO; Thu, 11 Nov 2021 10:58:49 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1025722|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.102209-0.000802693-0.896988;
 FP=12026156497004830519|2|2|6|0|-1|-1|-1; HT=ay29a033018047207;
 MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.LrJ-ux7_1636646315; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LrJ-ux7_1636646315)
 by smtp.aliyun-inc.com(10.147.43.230);
 Thu, 11 Nov 2021 23:58:35 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v4 13/20] target/riscv: Fix RESERVED field length in VTYPE
Date: Thu, 11 Nov 2021 23:51:42 +0800
Message-Id: <20211111155149.58172-14-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.26; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-26.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 11 Nov 2021 15:58:50 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 52ce670cbe..b48c7c346c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -105,7 +105,7 @@ typedef struct CPURISCVState CPURISCVState;
 FIELD(VTYPE, VLMUL, 0, 2)
 FIELD(VTYPE, VSEW, 2, 3)
 FIELD(VTYPE, VEDIV, 5, 2)
-FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
+FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 8)
 FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 
 struct CPURISCVState {
-- 
2.25.1


