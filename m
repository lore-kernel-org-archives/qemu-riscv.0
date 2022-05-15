Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nq4Qp-0003eU-FI
	for mharc-qemu-riscv@gnu.org; Sat, 14 May 2022 22:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nq4Qn-0003dd-G9; Sat, 14 May 2022 22:56:29 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:53432
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nq4Qk-0005I5-5Q; Sat, 14 May 2022 22:56:28 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 04D8C300089;
 Sun, 15 May 2022 02:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652583379;
 bh=GaJdDHdgnpR0ABjDusdzHmy7p/jRmKE0H5TZ4zlfax4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=ewwkhtQ2W4E7w5tNg7JWviDq1dtdQa1XCrq6PwvF8UoXsK6hJJZcaLI4R/5qheAeb
 TQsI4GF6tAv1nICXdPgFXA6rkHAuRA0yHWJ0qA96NdNW+IeBvJR4gqPz1xvLxdX3P1
 h3YSuAQc5GocH+BH2iCmTbWXA1X/B9Pt+T6vhpqo=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 0/5] target/riscv: Enhanced ISA extension checks
Date: Sun, 15 May 2022 11:56:06 +0900
Message-Id: <cover.1652583332.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1652435138.git.research_trasio@irq.a4lg.com>
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
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
X-List-Received-Date: Sun, 15 May 2022 02:56:29 -0000

c.f.
<https://lists.gnu.org/archive/html/qemu-riscv/2022-05/msg00221.html>

I was obviously drunk when finalizing PATCH v1.

[BUGS in PATCH v1 (fixed in v2)]
PATCH 1: My English was (or, "is"?) broken
         (commit subject and message is rewritten)
PATCH 4: Zfinx requirement test were in the wrong place
PATCH 5: Zfinx/F exclusivity test was completely wrong
         I meant Zfinx&&F but when finalizing my patchset, I somehow
         changed this place to Zfinx&&!F.




Tsukasa OI (5):
  target/riscv: Fix coding style on "G" expansion
  target/riscv: Disable "G" by default
  target/riscv: Change "G" expansion
  target/riscv: FP extension requirements
  target/riscv: Move/refactor ISA extension checks

 target/riscv/cpu.c | 63 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 17 deletions(-)


base-commit: 178bacb66d98d9ee7a702b9f2a4dfcd88b72a9ab
-- 
2.34.1


