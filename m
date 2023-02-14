Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRjr9-0000WF-8c
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 20:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRjr3-0000Va-UM; Mon, 13 Feb 2023 20:11:34 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRjr0-0004Wq-DF; Mon, 13 Feb 2023 20:11:32 -0500
X-QQ-mid: bizesmtp79t1676337061tf5r9wvl
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 14 Feb 2023 09:09:17 +0800 (CST)
X-QQ-SSF: 01200000000000C0D000000A0000000
X-QQ-FEAT: 239gR2IZrlthjCVlM4o7gGOaP8j8RynC/RGXnT7SOzKX3IUPixvOvw08eY09k
 L7GlZEZc/Iu8/vI4yPjlQvdoVeFAnzpkbtknKe5g6/GeQehvRHLjXI/BPfABWVZaBu5gd9o
 IrxBkQtTWa+nNABV2pL6hsw1ApNUTvXyQwzKdUEmzjAhP6qw38kbXhbf+aeZ43hMK3IKprc
 t+qVRjANGVF/AZFWwtl63yDCXQAF7/vaYx852QF8n9/ncb6IT5E3iiifdT/OW+WDmYW71TM
 jEKmVBOJS4rJuNHXK4KE7RtOReQayjy0vlF8xf+7vGIat/aVuK5UIFQgBMDEY8s50Eq6LCy
 baOzf3tC1aNH5glfB1Ntg9jAv2qJOKYS5yUslYMUu0YiFLrbo4=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH 12/18] target/riscv: Allow debugger to access user timer and
 counter CSRs
Date: Tue, 14 Feb 2023 09:09:10 +0800
Message-Id: <20230213180215.1524938-13-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213180215.1524938-1-bmeng@tinylab.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
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
X-List-Received-Date: Tue, 14 Feb 2023 01:11:36 -0000

At present user timer and counter CSRs are not reported in the
CSR XML hence gdb cannot access them.

Fix it by addding a debugger check in their predicate() routine.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 target/riscv/csr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 749d0ef83e..515b05348b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -131,6 +131,10 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 
 skip_ext_pmu_check:
 
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
     if (env->priv < PRV_M && !get_field(env->mcounteren, ctr_mask)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
-- 
2.25.1


