Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nIr3o-0005Yb-3M
	for mharc-qemu-riscv@gnu.org; Sat, 12 Feb 2022 06:59:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nIr3l-0005Uc-OG
 for qemu-riscv@nongnu.org; Sat, 12 Feb 2022 06:59:25 -0500
Received: from [2401:2500:203:30b:4000:6bfe:4757:0] (port=46696
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nIr3i-0006Vd-2L
 for qemu-riscv@nongnu.org; Sat, 12 Feb 2022 06:59:25 -0500
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Authentication-Results: mail-sender-0.a4lg.com;
 dkim=permerror (bad message/signature format)
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: qemu-riscv@nongnu.org
Subject: [RESEND PATCH 0/1] target/riscv: misa to ISA string conversion fix
Date: Sat, 12 Feb 2022 20:59:09 +0900
Message-Id: <cover.1644667142.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2401:2500:203:30b:4000:6bfe:4757:0 (failed)
Received-SPF: pass client-ip=2401:2500:203:30b:4000:6bfe:4757:0;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, TO_EQ_FM_DIRECT_MX=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 12 Feb 2022 11:59:26 -0000

S and U are misa bits but not extensions.  Thus, they should not be
copied to the ISA string.

I am truly surprised that this patchset is the THIRD attempt to fix this
longstanding problem.

(1) August 2019: by Palmer Dabbelt
<https://lists.nongnu.org/archive/html/qemu-riscv/2019-08/msg00165.html>
<https://lists.nongnu.org/archive/html/qemu-riscv/2019-08/msg00141.html>
<https://lists.nongnu.org/archive/html/qemu-riscv/2019-08/msg00259.html>

(2) April 2021: by Emmanuel Blot
<https://lists.nongnu.org/archive/html/qemu-riscv/2021-04/msg00248.html>

(3) February 2022: by me (this patchset)

I feel this is urgent to eliminate this bug now considering it required
a workaround to RISC-V Linux kernel as I pointed out:
<http://lists.infradead.org/pipermail/linux-riscv/2022-February/012252.html>


Though my patchset is first developed independently, this submitted
version is influenced by (2) Emmanuel Blot's patchset.  Thanks to this,
constant "[n]" can now be variable "[]".

It also fixes an ordering issue where 'C' should be preceded by 'L'
(order: 'L' -> 'C') as per the RISC-V ISA Manual (version 20191213),
Table 27.1.

It clarifies the role of `riscv_exts'.  It's a single-letter extrension
ordering list.




Tsukasa OI (1):
  target/riscv: misa to ISA string conversion fix

 target/riscv/cpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)


base-commit: 0a301624c2f4ced3331ffd5bce85b4274fe132af
-- 
2.32.0


