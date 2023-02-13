Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRdAi-0003ET-1v
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 13:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRdAZ-00037d-5i; Mon, 13 Feb 2023 13:03:18 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRdAW-0001Il-I0; Mon, 13 Feb 2023 13:03:14 -0500
X-QQ-mid: bizesmtp62t1676311361tkf80wrv
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 14 Feb 2023 02:02:16 +0800 (CST)
X-QQ-SSF: 01200000000000C0D000000A0000000
X-QQ-FEAT: ZGSGcAjExT9xc0SIyGJOu4cARvV8y0TJUAriy/Swp2bpXfW437wM4lDGjV0u/
 DX5PMcA8mBYVSEpEoHVi9cxUxzX0ITtl30JlRphzpyN7ZkOTdNS/CaER3EA1CS6aK8/fktE
 zAaFHxXzCI16XfnZLZA36XXpJ7Mq6Wovj4/rVm3D78B2gYBhRlUaqycMpEtnx/eToY8g9XV
 +j/5e4InpoTyyVCBCxhl5SG9hI+ugVvsvUIa2nnu7hpsb6rgAEkDfcaZgZgcyhbdqEirtHd
 FSeg3TGcEYBN/r1LPpamN8yd6JJcgVOhXMsI5xYrSg0GqdGY/tCdS9UXnqPKmxrn4hPjF+8
 elJkpck96nbMldFn5BfTq32O7GmYw==
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH 00/18] target/riscv: Various fixes to gdbstub and CSR access
Date: Tue, 14 Feb 2023 02:01:56 +0800
Message-Id: <20230213180215.1524938-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
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
X-List-Received-Date: Mon, 13 Feb 2023 18:03:19 -0000

At present gdbstub reports an incorrect / incomplete CSR list in the
target description XML, for example:

- menvcfg is reported in 'sifive_u' machine
- fcsr is missing in a F/D enabled processor

The issue is caused by:
- priv spec version check is missing when reporting CSRs
- CSR predicate() routine is called without turning on the debugger flag

This series aims to generate a correct and complete CSR list for gdbstub.


Bin Meng (18):
  target/riscv: gdbstub: Check priv spec version before reporting CSR
  target/riscv: Correct the priority policy of riscv_csrrw_check()
  target/riscv: gdbstub: Minor change for better readability
  target/riscv: gdbstub: Do not generate CSR XML if Zicsr is disabled
  target/riscv: Coding style fixes in csr.c
  target/riscv: Use 'bool' type for read_only
  target/riscv: Simplify {read,write}_pmpcfg() a little bit
  target/riscv: Simplify getting RISCVCPU pointer from env
  target/riscv: Avoid reporting odd-numbered pmpcfgX in the CSR XML for
    RV64
  target/riscv: gdbstub: Turn on debugger mode before calling CSR
    predicate()
  target/riscv: gdbstub: Drop the vector CSRs in riscv-vector.xml
  target/riscv: Allow debugger to access user timer and counter CSRs
  target/riscv: Allow debugger to access seed CSR
  target/riscv: Allow debugger to access {h,s}stateen CSRs
  target/riscv: Allow debugger to access sstc CSRs
  target/riscv: Drop priv level check in mseccfg predicate()
  target/riscv: Group all predicate() routines together
  target/riscv: Move configuration check to envcfg CSRs predicate()

 target/riscv/csr.c     | 360 +++++++++++++++++++++++------------------
 target/riscv/gdbstub.c | 100 +++---------
 2 files changed, 221 insertions(+), 239 deletions(-)

-- 
2.25.1


