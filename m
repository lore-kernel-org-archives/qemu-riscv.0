Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noO3O-0001Pf-HI
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 07:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1noO3J-0001NB-Ek; Tue, 10 May 2022 07:29:18 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:47814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1noO3H-0005Vh-9t; Tue, 10 May 2022 07:29:16 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id B64C9300089;
 Tue, 10 May 2022 11:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652182151;
 bh=G45xiydDiRFwRiJiSXc65cqV4GEzTprrtsGFNdgpA4s=;
 h=From:To:Cc:Subject:Date:Message-Id:Mime-Version:
 Content-Transfer-Encoding;
 b=pz5w0rLqz/fuLkJ1B7ZasugPyGjo+LMQf0jqEzTYZoM6Mo/hXjb858zwnckHPHaZr
 S9HwdoLRPvhxGHxOugGktuOvBUYXJdUK9vWdL2hKQhHcSh1T6lggNHq1N3C5xepgoD
 5AV9++jmNehy7XqcmIB70VojvirzicN8zikf3OvU=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 0/2] target/riscv: ISA string conversion fix and enhancement
Date: Tue, 10 May 2022 20:29:06 +0900
Message-Id: <cover.1652181972.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:2500:203:30b:4000:6bfe:4757:0;
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
X-List-Received-Date: Tue, 10 May 2022 11:29:19 -0000

Hello,

There is two issues related to RISC-V ISA extension string
I want to be fixed before QEMU 7.1 release.

This is PATCH v2.

For details, see cover letter of PATCH v1.
<https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg03817.html>



PATCH v1 -> PATCH v2:

I decided to "move" Zhinx*, not to remove them tentativelly.

Because, although I disagree with Weiwei's opinion (on canonical
ordering, Z* multi-letter extensions are ordered by second character;
that should reflect closely related single-letter extension but that
didn't happened on Zhinx*), ordering of "H" is reviewed and going to be
right after "V".

I considered this is safe enough (despite its "unratified" status):

1.  Zhinx and Zhinxmin are minor extensions
2.  Extension ordering is going to be not that important in the future
    (by upcoming rules) but we have reasons to make extension ordering
    canonical as possible for toolchain compatibility (for now).




Tsukasa OI (2):
  target/riscv: Move Zhinx* extensions on ISA string
  target/riscv: Add short-isa-string option

 target/riscv/cpu.c | 9 ++++++---
 target/riscv/cpu.h | 2 ++
 2 files changed, 8 insertions(+), 3 deletions(-)


base-commit: 178bacb66d98d9ee7a702b9f2a4dfcd88b72a9ab
-- 
2.34.1


