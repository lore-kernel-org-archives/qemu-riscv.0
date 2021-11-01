Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhU8o-0001z5-47
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 06:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8l-0001md-2t; Mon, 01 Nov 2021 06:02:07 -0400
Received: from out28-171.mail.aliyun.com ([115.124.28.171]:59615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8b-0001VJ-Aq; Mon, 01 Nov 2021 06:02:06 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2718527|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0413834-0.000279369-0.958337; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.LlcGtUT_1635760905; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LlcGtUT_1635760905)
 by smtp.aliyun-inc.com(10.147.43.230);
 Mon, 01 Nov 2021 18:01:51 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 13/13] target/riscv: Enable uxl field write
Date: Mon,  1 Nov 2021 18:01:43 +0800
Message-Id: <20211101100143.44356-14-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.171; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-171.mail.aliyun.com
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
X-List-Received-Date: Mon, 01 Nov 2021 10:02:07 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/csr.c                      | 6 ++++--
 target/riscv/insn_trans/trans_rvi.c.inc | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9f41954894..471c10acf6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -543,14 +543,16 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
          * add them to mstatush. For now, we just don't support it.
          */
         mask |= MSTATUS_MPV | MSTATUS_GVA;
+        if ((val ^ mstatus) & MSTATUS64_UXL) {
+            mask |= MSTATUS64_UXL;
+        }
     }
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
-        /* SXL and UXL fields are for now read only */
+        /* SXL fields are for now read only */
         mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
-        mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
     }
     env->mstatus = mstatus;
 
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index bd9d50bb94..880026f13d 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -475,7 +475,7 @@ static bool do_csrrw(DisasContext *ctx, int rd, int rc, TCGv src, TCGv mask)
 
 static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
 {
-    TCGv src = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
     /*
      * If rd == 0, the insn shall not read the csr, nor cause any of the
-- 
2.25.1


