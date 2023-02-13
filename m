Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRdAk-0003Fo-J6
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 13:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRdAf-0003DH-Uj; Mon, 13 Feb 2023 13:03:23 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRdAd-0001LW-Ud; Mon, 13 Feb 2023 13:03:21 -0500
X-QQ-mid: bizesmtp62t1676311381tykhei98
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 14 Feb 2023 02:03:00 +0800 (CST)
X-QQ-SSF: 01200000000000C0D000000A0000000
X-QQ-FEAT: 9fp+MOMfZT38O25zMZxb6wkx2tUfPBoqmOOK8LK6MS9dBO/MmUMzjt2QX51np
 VomaEjrjCGzUGg+V8BoqoqYeR1tMzk0PpQVYiSN9TWOKSk3beAoEXbYGPhpwwDLfCuysxt7
 nXQdLU7TqdxmCU9QC4faOscBmRRrBWCodAuUDWzzpjF62VNdOvdlz/lVPn61ljfkc0U4fXV
 yxFL+nWHuyDsB7O7YIarKUqftYNeEDU89StYoC2QJryU9a33GlZeAwzzEJODKhjxgH00Naa
 lFTDdNsRX5ZhGpsvt/dcySY7tyYJBFzIcDAKM16npJla8r+MPwsfUDcdsC3edt8rJ3RYVze
 MwNewfj5LOTqbMfpiPX5hbnz0TwopFloOHkTbQMUtUD7yT4A0vnUG9s3Jp3EA==
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH 06/18] target/riscv: Use 'bool' type for read_only
Date: Tue, 14 Feb 2023 02:02:02 +0800
Message-Id: <20230213180215.1524938-7-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213180215.1524938-1-bmeng@tinylab.org>
References: <20230213180215.1524938-1-bmeng@tinylab.org>
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
X-List-Received-Date: Mon, 13 Feb 2023 18:03:24 -0000

The read_only variable is currently declared as an 'int', but it
should really be a 'bool'.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index cc74819759..8bbc75cbfa 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3778,7 +3778,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
                                                RISCVCPU *cpu)
 {
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
-    int read_only = get_field(csrno, 0xC00) == 3;
+    bool read_only = get_field(csrno, 0xC00) == 3;
     int csr_min_priv = csr_ops[csrno].min_priv_ver;
 
     /* ensure the CSR extension is enabled. */
-- 
2.25.1


