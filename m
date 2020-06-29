Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jptVn-0008K8-3Z
	for mharc-qemu-riscv@gnu.org; Mon, 29 Jun 2020 09:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jptVl-0008Gd-9e; Mon, 29 Jun 2020 09:07:49 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:48628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jptVg-0003Y8-Nd; Mon, 29 Jun 2020 09:07:49 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3082795|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.010747-0.000981833-0.988271;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03297; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.HucVN.U_1593436054; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HucVN.U_1593436054)
 by smtp.aliyun-inc.com(10.147.44.145);
 Mon, 29 Jun 2020 21:07:35 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 1/2] tcg/tcg-op: Fix nonatomic_op load with MO_SIGN
Date: Mon, 29 Jun 2020 21:07:30 +0800
Message-Id: <20200629130731.1080-2-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200629130731.1080-1-zhiwei_liu@c-sky.com>
References: <20200629130731.1080-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 09:07:36
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
X-List-Received-Date: Mon, 29 Jun 2020 13:07:49 -0000

As an op follows load, MO_SIGN should not be cleared. Thus, we
can call tcg_gen_atomic_*_i64 with a smaller Memop than MO_Q.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 tcg/tcg-op.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index e60b74fb82..75b31048f5 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3189,7 +3189,7 @@ static void do_nonatomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
 
     memop = tcg_canonicalize_memop(memop, 0, 0);
 
-    tcg_gen_qemu_ld_i32(t1, addr, idx, memop & ~MO_SIGN);
+    tcg_gen_qemu_ld_i32(t1, addr, idx, memop);
     gen(t2, t1, val);
     tcg_gen_qemu_st_i32(t2, addr, idx, memop);
 
@@ -3232,7 +3232,7 @@ static void do_nonatomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
 
     memop = tcg_canonicalize_memop(memop, 1, 0);
 
-    tcg_gen_qemu_ld_i64(t1, addr, idx, memop & ~MO_SIGN);
+    tcg_gen_qemu_ld_i64(t1, addr, idx, memop);
     gen(t2, t1, val);
     tcg_gen_qemu_st_i64(t2, addr, idx, memop);
 
-- 
2.23.0


