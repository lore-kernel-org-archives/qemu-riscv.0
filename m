Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21923C197A0
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 12:08:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r532s-0006Re-Cm; Mon, 20 Nov 2023 07:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1r532q-0006Pg-5g; Mon, 20 Nov 2023 07:06:28 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1r532o-0004pp-3w; Mon, 20 Nov 2023 07:06:27 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 68044C0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1700481980;
 bh=1USLZICoNyGl/Aj6fw7aad1YgVd4Gh3mnvyk74c47Cw=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=s62iMZ+oKEERq0LRy3qkEiwMkr+1uFo6JTh4dAdAhtIKpd2w+zT/Z3569Ymb5mzqN
 kbKBwSBd8Qx4TBqwghJdBpsPvUgAJeavM6TpAzdVdORKut3FH0blNa6YTol/44cMtE
 FKOpUzjiPC9vRQAuMQ/4nyBTeUw3X2rHNcdM8HYdT3209gy4ZmgzoKBZiuIY2yvkn+
 W2Qsxvcujq3lL33+1CVR0VniWkLvsBgfjN9nR1bnCwHWfP8e717h2z93TMgSfBt1hy
 Chy2wzgnZip1uLYgErKfBkJzhA0U8jY2WDBWck+dVg0vUFnqvY4pdBK0FGif7W0ppg
 /QzKIzJYjVTsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1700481980;
 bh=1USLZICoNyGl/Aj6fw7aad1YgVd4Gh3mnvyk74c47Cw=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=bFel4Sd0lZSCzF/dHU/ZHPgyLTZX6aYzqiSx92a5RyzJw9CObtqXI6FzycBbO1EAk
 A9nFfX+tIDzH1wR+RmgicZCfNU3hBEOUZ6MgvHgD55XREweidj1Z5qbRpdtnN44pNk
 9fgV6HGGUfPHp3vy9+efR9xcDpDGrPgE59bpPg1gqMS2des6xhY/4zQZPcyvzxOEJ1
 Hq1boPlVtA4JUAJhAHOiDayH+W+PsJtKAtYv5JB/dMollQyIhz0BY4gxjXCRLztPYZ
 b2dkaMAt9kYRWwU+6l7npSLAOe8B/cmXAp+/ea5gXkCRe55x55SldxXPzNcV9Mmji/
 m0QzCZiJNvYpA==
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <palmer@dabbelt.com>, <alistair.francis@wdc.com>, 
 <bin.meng@windriver.com>, <liwei1518@gmail.com>,
 <dbarboza@ventanamicro.com>, 
 <zhiwei_liu@linux.alibaba.com>, Ivan Klokov <ivan.klokov@syntacore.com>
Subject: [PATCH 0/2] Fix mmu translation with H extension
Date: Mon, 20 Nov 2023 15:06:07 +0300
Message-ID: <20231120120609.37960-1-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: T-Exch-05.corp.yadro.com (172.17.10.109) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
Received-SPF: permerror client-ip=89.207.88.248;
 envelope-from=ivan.klokov@syntacore.com; helo=mta-04.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

A series of patches that correct the conversion of virtual addresses 
to physical ones. Correct exception for mbare mode and fix MXR bit 
behavior with MPV\MPV bits.

Ivan Klokov (2):
  target/riscv/cpu_helper.c: Invalid exception on MMU translation stage
  target/riscv/cpu_helper.c: Fix mxr bit behavior

 target/riscv/cpu_helper.c | 54 +++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

-- 
2.34.1


