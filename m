Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqeZ4-0003qQ-2D
	for mharc-qemu-riscv@gnu.org; Wed, 01 Jul 2020 11:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jqeZ0-0003nV-My; Wed, 01 Jul 2020 11:22:19 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:36754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jqeYx-0004HQ-3O; Wed, 01 Jul 2020 11:22:18 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3766654|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0130619-0.00109256-0.985846;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03275; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.Hvum7gd_1593616921; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Hvum7gd_1593616921)
 by smtp.aliyun-inc.com(10.147.41.120);
 Wed, 01 Jul 2020 23:22:02 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 1/1] tcg/tcg-op: nonatomic_op should work with smaller memop
Date: Wed,  1 Jul 2020 23:21:56 +0800
Message-Id: <20200701152156.1147-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 11:22:02
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jul 2020 15:22:19 -0000

Reserve MO_SIGN in load and extend another operator val according to memop.
Thus, we can call tcg_gen_atomic_*_tl with a smaller memop.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 tcg/tcg-op.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index e60b74fb82..9a0870cb18 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3189,7 +3189,8 @@ static void do_nonatomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
 
     memop = tcg_canonicalize_memop(memop, 0, 0);
 
-    tcg_gen_qemu_ld_i32(t1, addr, idx, memop & ~MO_SIGN);
+    tcg_gen_qemu_ld_i32(t1, addr, idx, memop);
+    tcg_gen_ext_i32(val, val, memop);
     gen(t2, t1, val);
     tcg_gen_qemu_st_i32(t2, addr, idx, memop);
 
@@ -3232,7 +3233,8 @@ static void do_nonatomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
 
     memop = tcg_canonicalize_memop(memop, 1, 0);
 
-    tcg_gen_qemu_ld_i64(t1, addr, idx, memop & ~MO_SIGN);
+    tcg_gen_qemu_ld_i64(t1, addr, idx, memop);
+    tcg_gen_ext_i64(val, val, memop);
     gen(t2, t1, val);
     tcg_gen_qemu_st_i64(t2, addr, idx, memop);
 
-- 
2.23.0


