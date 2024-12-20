Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55BBE77188
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 16:49:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tOgBO-0004kC-2g; Fri, 20 Dec 2024 11:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roan.richmond@codethink.co.uk>)
 id 1tOfZf-0004lI-8s
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 11:09:59 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roan.richmond@codethink.co.uk>)
 id 1tOfZd-0004by-Qs
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 11:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TrR4bLNurjXoV26OcDsJ3dmPu+oRhL8OWtvGnD2L9Dg=; b=LiZb8acCoIm8ukkMYzItOprKQ8
 R4Ht5l37qT5X8ceZjoGoJXMNjbnwV25JX/DCcm5JHBdfQP9JDK+mlA2bX2azDgcNEdRC3ls3mI/he
 +gDP8Fhm/21u4Yk/KSzM9A4MtDiRyjOLYXcLzDds9ChU3teoU7qBve8XB3xHibFU/7P64OPlhP+5Q
 zR0TpN45JxaOAm1qTOBFIjLv55BND1MKC+nAdVHlzPBSHSnAlFV22kfZwHU/Mk9S/GnO7GjcNdnsl
 Mlpt6F2ZXllw68jHFqNvTwJoWgHfBbxQxwM1iiScGKSTXfLREy4sjMchRGMyKM8p1nIVOpIPU/DjE
 AWFO3BlQ==;
Received: from [167.98.27.226] (helo=codethink.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1tOfCy-00ACav-Qm; Fri, 20 Dec 2024 15:46:32 +0000
From: Roan Richmond <roan.richmond@codethink.co.uk>
To: qemu-riscv@nongnu.org
Cc: lawrence.hunter@codethink.co.uk, ben.dooks@codethink.co.uk,
 felix.chong@codethink.co.uk, sagark@eecs.berkeley.edu, palmer@dabbet.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Roan Richmond <roan.richmond@codethink.co.uk>
Subject: [RFC PATCH 0/7] Add RISCV big endian support
Date: Fri, 20 Dec 2024 15:45:28 +0000
Message-ID: <20241220154616.283933-1-roan.richmond@codethink.co.uk>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=roan.richmond@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 20 Dec 2024 11:48:54 -0500
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

This is part of our project to investigate big endian on RISC-V.
The full information is documented on our gitlab[1] which includes
source repositories, build information and project documentation.

We have a minimal buildroot, qemu and kernel working on QEMU.

As this is a work in progress any review or help is appreciated.

[1] https://gitlab.com/CodethinkLabs/riscv_bigendian

Ben Dooks (2):
  target/riscv: Add big endian check for atomic ops
  taregt/riscv: Add big endian checks for pagetable

Lawrence Hunter (3):
  target/riscv: Add SSTATUS_UBE
  target/riscv: Add sfence.vma for endian change
  target/riscv: Add big endian CPU target

Roan Richmond (2):
  target/riscv: Add riscv MSTATUS_xBE CSR support
  target/riscv: Add riscv big endian data flag into DisasContext

 target/riscv/cpu-qom.h                      |  1 +
 target/riscv/cpu.c                          |  8 +++++
 target/riscv/cpu.h                          |  2 ++
 target/riscv/cpu_bits.h                     |  3 ++
 target/riscv/cpu_helper.c                   | 34 ++++++++++++++++-----
 target/riscv/csr.c                          | 19 ++++++++++--
 target/riscv/insn_trans/trans_rva.c.inc     |  4 +++
 target/riscv/insn_trans/trans_rvi.c.inc     |  6 ++++
 target/riscv/insn_trans/trans_rvzacas.c.inc |  8 ++---
 target/riscv/translate.c                    |  5 +++
 10 files changed, 76 insertions(+), 14 deletions(-)

-- 
2.43.0


