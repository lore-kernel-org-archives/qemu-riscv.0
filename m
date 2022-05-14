Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nplHz-00077V-17
	for mharc-qemu-riscv@gnu.org; Sat, 14 May 2022 02:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nplHw-000766-R3; Sat, 14 May 2022 02:30:05 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:48374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nplHu-0007fA-AM; Sat, 14 May 2022 02:30:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id DAA4B300089;
 Sat, 14 May 2022 06:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652509791;
 bh=/P19jFyyWx9h+oEi/y9EZljCHmTyp1k3AEue49z7HHs=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=U6MetrtygF/Jw6TwmpHAtbLNHtFR02lEM4Bu8OmKiZsFw7VnKgp1BYKYt22TFQB5O
 i7vZ3tVaVlfU/aADIZesQVmgWP3imawp3U56bhOymBqldoMLnd/GIsVu4MmlTqT6VB
 t50Yh7lmBUNDjqB8be5i6XcgIs0cB5+ikJuIO7c4=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 0/2] hw/riscv: Make CPU config error handling generous
Date: Sat, 14 May 2022 15:29:39 +0900
Message-Id: <cover.1652509778.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1652435235.git.research_trasio@irq.a4lg.com>
References: <cover.1652435235.git.research_trasio@irq.a4lg.com>
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
X-List-Received-Date: Sat, 14 May 2022 06:30:06 -0000

c.f.
<https://lists.gnu.org/archive/html/qemu-riscv/2022-05/msg00229.html>

This patchset is functionally equivalent to v1 but fixes commit titles.




Tsukasa OI (2):
  hw/riscv: Make CPU config error handling generous (virt/spike)
  hw/riscv: Make CPU config error handling generous
    (sifive_e/u/opentitan)

 hw/riscv/opentitan.c | 2 +-
 hw/riscv/sifive_e.c  | 2 +-
 hw/riscv/sifive_u.c  | 4 ++--
 hw/riscv/spike.c     | 2 +-
 hw/riscv/virt.c      | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)


base-commit: 178bacb66d98d9ee7a702b9f2a4dfcd88b72a9ab
-- 
2.34.1


