Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRjrB-0000Wy-9x
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 20:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRjr3-0000VZ-Rq; Mon, 13 Feb 2023 20:11:34 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRjr0-0004Wr-Ub; Mon, 13 Feb 2023 20:11:33 -0500
X-QQ-mid: bizesmtp79t1676337067tkf0rqd6
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 14 Feb 2023 09:11:04 +0800 (CST)
X-QQ-SSF: 01200000000000C0D000000A0000000
X-QQ-FEAT: CR3LFp2JE4kzWfmvcx7PnMd75xGL/kcYSZCfu3y9DsmsqZ8+16MurSdNZ81UB
 fu8xg3JpkEKfr1c8hcoUdPS3OP7m1PEGZzxvs/Kc4dRzxETNkn9OX+mxFDyyFxzAWfHnHim
 sXYM/z3NOObCQpiAol9OhM1eDIuKRcXIENIcLV8/scuSeDgqE280zW8RPYACoxn4vEXvyqd
 4SVY7WVr53Ihtk4ZB1ozVSeT5edT1R4uiQRvGbTIhMTVr4iVIfcO8mp+gJOOohJJRtsbBhH
 //m6Pk/xcvFBWcVEVVPTpwbXHOuL/FF0tXoD5KESzc4X1dq8u3RvgRbXQNZvSEsDyrk4klN
 AdZQoo15KjWsTvbH9SZfQj+qPkOFnEOCnp/YUQFpf67MPqILh16+vlD6rKbVg==
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH 13/18] target/riscv: Allow debugger to access seed CSR
Date: Tue, 14 Feb 2023 09:09:11 +0800
Message-Id: <20230213180215.1524938-14-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213180215.1524938-1-bmeng@tinylab.org>
References: <20230213180215.1524938-13-bmeng@tinylab.org>
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
X-List-Received-Date: Tue, 14 Feb 2023 01:11:36 -0000

At present seed CSR is not reported in the CSR XML hence gdb cannot
access it.

Fix it by addding a debugger check in its predicate() routine.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 target/riscv/csr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 515b05348b..f1075b5728 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -458,6 +458,10 @@ static RISCVException seed(CPURISCVState *env, int csrno)
     }
 
 #if !defined(CONFIG_USER_ONLY)
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
     /*
      * With a CSR read-write instruction:
      * 1) The seed CSR is always available in machine mode as normal.
-- 
2.25.1


