Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mq9UV-0006lY-Ul
	for mharc-qemu-riscv@gnu.org; Thu, 25 Nov 2021 02:48:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9UR-0006kj-Pf; Thu, 25 Nov 2021 02:48:21 -0500
Received: from out28-122.mail.aliyun.com ([115.124.28.122]:53848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9UC-0005c6-RN; Thu, 25 Nov 2021 02:48:17 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.09694179|-1; CH=green;
 DM=|CONTINUE|false|; DS=||; FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203;
 MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=8; RT=7; SR=0;
 TI=SMTPD_---.Lyyv4YS_1637826479; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lyyv4YS_1637826479)
 by smtp.aliyun-inc.com(10.147.41.178);
 Thu, 25 Nov 2021 15:48:00 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 15/22] target/riscv: Fix RESERVED field length in VTYPE
Date: Thu, 25 Nov 2021 15:39:44 +0800
Message-Id: <20211125073951.57678-16-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.122; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-122.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
X-List-Received-Date: Thu, 25 Nov 2021 07:48:23 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1e56405243..2cee98f152 100644
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


