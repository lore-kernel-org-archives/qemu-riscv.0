Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2qJH-000747-0N
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 04:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2qJD-00072I-Cq; Wed, 07 Dec 2022 04:01:43 -0500
Received: from smtpbgau2.qq.com ([54.206.34.216])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2qJA-00074u-Vw; Wed, 07 Dec 2022 04:01:43 -0500
X-QQ-mid: bizesmtp64t1670403640t9aau4ii
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 Dec 2022 17:00:39 +0800 (CST)
X-QQ-SSF: 01200000000000B0C000000A0000000
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 2/2] target/riscv: Clear mstatus.MPRV when leaving M-mode for
 priv spec 1.12+
Date: Wed,  7 Dec 2022 17:00:37 +0800
Message-Id: <20221207090037.281452-2-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207090037.281452-1-bmeng@tinylab.org>
References: <20221207090037.281452-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=54.206.34.216; envelope-from=bmeng@tinylab.org;
 helo=smtpbgau2.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 07 Dec 2022 09:01:45 -0000

Since priv spec v1.12, MRET and SRET now clear mstatus.MPRV when
leaving M-mode.

Signed-off-by: Bin Meng <bmeng@tinylab.org>

---

 target/riscv/op_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index a047d38152..878bcb03b8 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -154,6 +154,9 @@ target_ulong helper_sret(CPURISCVState *env)
                         get_field(mstatus, MSTATUS_SPIE));
     mstatus = set_field(mstatus, MSTATUS_SPIE, 1);
     mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
+    if (env->priv_ver >= PRIV_VERSION_1_12_0) {
+        mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
+    }
     env->mstatus = mstatus;
 
     if (riscv_has_ext(env, RVH) && !riscv_cpu_virt_enabled(env)) {
@@ -203,6 +206,9 @@ target_ulong helper_mret(CPURISCVState *env)
     mstatus = set_field(mstatus, MSTATUS_MPIE, 1);
     mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
     mstatus = set_field(mstatus, MSTATUS_MPV, 0);
+    if ((env->priv_ver >= PRIV_VERSION_1_12_0) && (prev_priv != PRV_M)) {
+        mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
+    }
     env->mstatus = mstatus;
     riscv_cpu_set_mode(env, prev_priv);
 
-- 
2.34.1


