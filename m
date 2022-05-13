Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npRsM-00056t-0f
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 05:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRsK-00051p-10; Fri, 13 May 2022 05:46:20 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:53432
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRsF-0004mO-Vl; Fri, 13 May 2022 05:46:19 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 80FFE300089;
 Fri, 13 May 2022 09:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652435168;
 bh=B7LTSaaTu/21PNbpmGJXTyanogzoM29EKfKxS3/w1Zc=;
 h=From:To:Cc:Subject:Date:Message-Id:Mime-Version:
 Content-Transfer-Encoding;
 b=W0RUHEdtJUqFxYHpe5zkIhwf+NqfDReBAGz5RtGUOwt1R03dSn8FPC3Z8YJzSABBv
 xCAG/IjJxSM/rD42+RUavBETZQMHNfCqxFfoWRIT0StWcAN3PjwR9kHfJ5cjNXWMlI
 kGs0CCPCkTAWkzzICUAqhBYbf5eLvm4gwubm55YU=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 0/5] target/riscv: Enhanced ISA extension checks
Date: Fri, 13 May 2022 18:45:45 +0900
Message-Id: <cover.1652435138.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=153.120.152.154;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 13 May 2022 09:46:20 -0000

Hello,

This is another patchset for RISC-V ISA extension / feature handling.

Aside from coding style fix / refactoring patch (PATCH 1 and 5), this
patchset contains two changes:



1. "G" extension handling

1.A. "G" extension expansion (PATCH 3)

On ISA version 20190608 or later, "G" expands to "IMAFD_Zicsr_Zifencei",
not just "IMAFD" (this is because "Zicsr" and "Zifencei" extensions are
splitted from "I").  Because both "Zicsr" and "Zifencei" are enabled by
default, it should be safe to change "G" extension expansion.

1.B. Disable "G" by default (PATCH 2)

This seems quite odd but I have a good reason.  While "G" is enabled by
default, all "I", "M", "A", "F", "D", "Zicsr" and "Zifencei" are also
enabled by default, making default "G" expansion useless.

There's more.  If we want to change detailed configuration of a RV32/RV64
CPU and want to disable some, for example, "F" and "D", we must also
disable "G".  This is obviously bloat.

This doesn't work:
    -cpu rv64,f=off,d=off

This does work (but bloat):
    -cpu rv64,g=off,f=off,d=off

Disabling "G" suppresses such problem and mostly harmless, too.



2. Floating point arithmetic consistency (PATCH 4)

With -cpu option, we can configure details of RISC-V CPU emulated by QEMU.
However, we can set some invalid combinations that would make FP arithmetic
effectively unusable (and invalid on RISC-V ISA specification).

-   F requires Zicsr
-   Zfinx requires Zicsr
-   Zfh/Zfhmin require F
-   D requires F
-   V requires D

Reproducing this kind of problem requires manually disabling certain
extensions (because all "Zicsr", "F" and "D" are enabled by default).  So,
I consider that just making an error message (when unsatisfied) should be
enough, not implying related extensions like "zk*" properties.


Note that this checking only works on any, rv32 and rv64.  On other CPUs
(for example, sifive-u54), it sets nonzero `misa' value on corresponding
`set_misa' call (c.f. in rv64_sifive_u_cpu_init in target/riscv/cpu.c) and
consistency checks are skipped (because nonzero `misa' value is set prior
to RISC-V CPU realization process).

I think we generally use generic "rv32" or "rv64" on heavy customizing so I
don't think this is not a big problem.  Still, we could fix this later
(e.g. by setting properties on CPU init function or by checking some
consistency problems even if previously-set `misa' is nonzero).




Tsukasa OI (5):
  target/riscv: Fix "G" extension expansion typing
  target/riscv: Disable "G" by default
  target/riscv: Change "G" expansion
  target/riscv: FP extension requirements
  target/riscv: Move/refactor ISA extension checks

 target/riscv/cpu.c | 62 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 17 deletions(-)


base-commit: 178bacb66d98d9ee7a702b9f2a4dfcd88b72a9ab
-- 
2.34.1


