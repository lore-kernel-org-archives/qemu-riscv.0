Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0kFL-0008Iq-Rl
	for mharc-qemu-riscv@gnu.org; Thu, 01 Dec 2022 09:09:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kFG-0008HW-O1; Thu, 01 Dec 2022 09:08:59 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kFE-0008GB-U3; Thu, 01 Dec 2022 09:08:58 -0500
X-QQ-mid: bizesmtp72t1669903724tadmcrwk
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 01 Dec 2022 22:08:44 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: IV30oiqrgAa+0dsgYF9KtMezA4Dc+jQBtbzAxOOo25lDsYucdjq1lzk2PFmG1
 PV9DBzEhuubsrZM5/68CO9a/NnIF7mge3BAiTc71JhCKHqfUz6xGXbz+H/RKfaO8seqlwxY
 H4gL+0j+TMIk7ykw/ck0nzBnNJsFxXcLKr5RxxMunEL1yruo2ITWGYDpit4gV4IYfDor6oH
 UwQ2MpbBSIgHkOca+pLhhAsL/IxIqjcGA6MogSgGveSKAm9PkRpanJ+cw1LdbHiYiE5rYtg
 GD9429aJxzGGl4L4v1vbDQpxz5zG41Ogtc0fOFURmaCmtWO/T5s/9eITLsJeODUoAprI/6L
 vwFJBS9E6uNb+QOJCpqEogE76JetRNZdpMJgnz0wGbSqLLQCcY=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 14/15] hw/riscv: opentitan: Drop "hartid-base" and
 "priority-base" initialization
Date: Thu,  1 Dec 2022 22:08:10 +0800
Message-Id: <20221201140811.142123-14-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201140811.142123-1-bmeng@tinylab.org>
References: <20221201140811.142123-1-bmeng@tinylab.org>
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
X-List-Received-Date: Thu, 01 Dec 2022 14:09:01 -0000

"hartid-base" and "priority-base" are zero by default. There is no
need to initialize them to zero again.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 hw/riscv/opentitan.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index be7ff1eea0..da73aa51f5 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -165,10 +165,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
 
     /* PLIC */
     qdev_prop_set_string(DEVICE(&s->plic), "hart-config", "M");
-    qdev_prop_set_uint32(DEVICE(&s->plic), "hartid-base", 0);
     qdev_prop_set_uint32(DEVICE(&s->plic), "num-sources", 180);
     qdev_prop_set_uint32(DEVICE(&s->plic), "num-priorities", 3);
-    qdev_prop_set_uint32(DEVICE(&s->plic), "priority-base", 0x00);
     qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 32);
-- 
2.34.1


