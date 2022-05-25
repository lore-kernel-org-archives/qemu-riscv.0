Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntnjZ-0006C1-CQ
	for mharc-qemu-riscv@gnu.org; Wed, 25 May 2022 05:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1ntnjO-00066B-C7; Wed, 25 May 2022 05:55:08 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:49130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1ntnjL-0002YU-GN; Wed, 25 May 2022 05:55:06 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 81C01300089;
 Wed, 25 May 2022 09:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1653472491;
 bh=aPT907jUC1fOJnRcxI2P8RDobjdc7uAzY01nZ1acQ1g=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=tAXooULk68VTdqYlCHPrfPB7IbGMSh8pqxOn2yGJkV4ikH3zYWPuvSyqM6cXLN6Hc
 hymktV/k8x1bi1PT53rrcW0BHgiSlSBqKeFCa8q+UsbKmOjwkCyYtmZrENr6jP/ZaU
 VLV2U84eMdKQWGnr7rbh7Ax70epv4aAjdLD8rGj4=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 0/3] target/riscv: Make CPU property names lowercase (w/
 capitalized aliases)
Date: Wed, 25 May 2022 18:54:40 +0900
Message-Id: <cover.1653472385.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1652435208.git.research_trasio@irq.a4lg.com>
References: <cover.1652435208.git.research_trasio@irq.a4lg.com>
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
X-List-Received-Date: Wed, 25 May 2022 09:55:08 -0000

v1:
<https://lists.gnu.org/archive/html/qemu-riscv/2022-05/msg00227.html>

Hello,

This is a refined version of the patch to RISC-V CPU property names.
See v1 for background.

[Changes: RFC PATCH (v1) -> PATCH v2]

-   Reorganized all properties for clarity and extensibility
    (PATCH 1/3, not actually a point of this patchset but worth doing)
-   Reworded for correctness and clarity
    (it's the first time for me to use Grammarly)
-   Added a deprecation note to documentation (PATCH 3/3)

[RFC: PATCH 3/3]

1. Which is a better section to add a deprecation note?

-   "System emulator command line arguments" or
-   A new section under "Device options" (THIS PATCH)

2. Is it okay to use the word "7.1" (an unreleased version number)?




Tsukasa OI (3):
  target/riscv: Reorganize riscv_cpu_properties
  target/riscv: Make CPU property names lowercase
  target/riscv: Deprecate capitalized property names

 docs/about/deprecated.rst | 10 +++++
 target/riscv/cpu.c        | 79 +++++++++++++++++++++++++--------------
 2 files changed, 61 insertions(+), 28 deletions(-)


base-commit: 0cac736e73723850a99e5142e35d14d8f8efb232
-- 
2.34.1


