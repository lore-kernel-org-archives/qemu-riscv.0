Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mp76X-0001dY-N0
	for mharc-qemu-riscv@gnu.org; Mon, 22 Nov 2021 06:03:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mp76W-0001X7-1Q; Mon, 22 Nov 2021 06:03:20 -0500
Received: from out28-76.mail.aliyun.com ([115.124.28.76]:44924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mp76U-0001iY-3O; Mon, 22 Nov 2021 06:03:19 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4138104|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0148652-0.000520523-0.984614;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LxASxkD_1637578992; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LxASxkD_1637578992)
 by smtp.aliyun-inc.com(10.147.41.143);
 Mon, 22 Nov 2021 19:03:12 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 1/5] target/riscv: Check PMP rules num before propagation
Date: Mon, 22 Nov 2021 19:02:26 +0800
Message-Id: <20211122110230.38783-2-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122110230.38783-1-zhiwei_liu@c-sky.com>
References: <20211122110230.38783-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.76; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-76.mail.aliyun.com
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
X-List-Received-Date: Mon, 22 Nov 2021 11:03:20 -0000

When an address is in [0-4K) and no pmp rule configured, the tlb_size will
be set to 1.

This is caused by pmp_get_tlb_size return a value 1.

if (pmp_sa >= tlb_sa && pmp_ea <= tlb_ea) {
    return pmp_ea - pmp_sa + 1;
}

Here pmp_sa == 0 and pmp_ea == 0.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/pmp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 54abf42583..190ff59fab 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -627,6 +627,10 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
     target_ulong val;
     target_ulong tlb_ea = (tlb_sa + TARGET_PAGE_SIZE - 1);
 
+    if (pmp_get_num_rules(env) == 0) {
+        return false;
+    }
+
     for (i = 0; i < MAX_RISCV_PMPS; i++) {
         val = pmp_get_tlb_size(env, i, tlb_sa, tlb_ea);
         if (val) {
-- 
2.25.1


