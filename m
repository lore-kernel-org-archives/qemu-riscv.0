Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nx5cK-0002wY-IB
	for mharc-qemu-riscv@gnu.org; Fri, 03 Jun 2022 07:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nx5c6-0002uN-8A; Fri, 03 Jun 2022 07:37:15 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:51132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nx5bv-0002Gy-5S; Fri, 03 Jun 2022 07:37:02 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id BEB2F300089;
 Fri,  3 Jun 2022 11:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1654256207;
 bh=7wBERQB/bQy84ufiZszOanYF5nRBIrszan3J5VXk6f8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=MkZSl9mdcCnb3knVMWZru1xawg/Dd5BJ+XXAU69b2bGCffWfgdoOCFxzthVoqdtpY
 bDZBJlSFdhPoMXxzvRFTaKg8R63UeuyI14POVgqXyUg1akHg+R3sJrBbbB5obO/u0k
 BayOvdQSuzDYSrYuKWRqvDgdOZtpkkG5mpu8XSdk=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 0/3] target/riscv: Make CPU property names lowercase (w/
 capitalized aliases)
Date: Fri,  3 Jun 2022 20:36:41 +0900
Message-Id: <cover.1654256190.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1653472385.git.research_trasio@irq.a4lg.com>
References: <cover.1653472385.git.research_trasio@irq.a4lg.com>
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
X-List-Received-Date: Fri, 03 Jun 2022 11:37:20 -0000

v1: <https://lists.gnu.org/archive/html/qemu-riscv/2022-05/msg00227.html>
v2: <https://lists.gnu.org/archive/html/qemu-riscv/2022-05/msg00411.html>
v2.1: <https://lists.gnu.org/archive/html/qemu-riscv/2022-05/msg00417.html>

Hello,

This is v3 of the patch to RISC-V CPU property names.
See v1 for background.

[Changes: PATCH v2 -> PATCH v3]

-   Rebased to newer master
-   Fixed a typo
-   Clarified intent of PATCH 1/3




Tsukasa OI (3):
  target/riscv: Reorganize riscv_cpu_properties
  target/riscv: Make CPU property names lowercase
  target/riscv: Deprecate capitalized property names

 docs/about/deprecated.rst | 10 +++++
 target/riscv/cpu.c        | 79 +++++++++++++++++++++++++--------------
 2 files changed, 61 insertions(+), 28 deletions(-)


base-commit: c9641eb422905cc0804a7e310269abf09543cce8
-- 
2.34.1


