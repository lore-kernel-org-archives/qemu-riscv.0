Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mq9VU-0000PF-Vl
	for mharc-qemu-riscv@gnu.org; Thu, 25 Nov 2021 02:49:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9VH-0000IM-Am; Thu, 25 Nov 2021 02:49:12 -0500
Received: from out28-98.mail.aliyun.com ([115.124.28.98]:48632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9VD-0005iO-VY; Thu, 25 Nov 2021 02:49:10 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1607588|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0730665-0.000540345-0.926393;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047187; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=7; SR=0; TI=SMTPD_---.Lz-1h4A_1637826542; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lz-1h4A_1637826542)
 by smtp.aliyun-inc.com(10.147.44.129);
 Thu, 25 Nov 2021 15:49:03 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 17/22] target/riscv: Remove VILL field in VTYPE
Date: Thu, 25 Nov 2021 15:39:46 +0800
Message-Id: <20211125073951.57678-18-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.98; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-98.mail.aliyun.com
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
X-List-Received-Date: Thu, 25 Nov 2021 07:49:12 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ef1d87af38..347428ffdc 100644
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


