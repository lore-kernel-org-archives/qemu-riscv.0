Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129C7C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 10:27:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNVnE-0001UP-1D; Wed, 10 Jan 2024 05:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1rNVn8-0001SJ-Hd; Wed, 10 Jan 2024 05:26:35 -0500
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1rNVn2-00026j-Br; Wed, 10 Jan 2024 05:26:34 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8BFF6CE1C0C;
 Wed, 10 Jan 2024 10:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FAEC433C7;
 Wed, 10 Jan 2024 10:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704882374;
 bh=qQo0z5VeRugsMfTD4pCLnLTMqhP4pK6EO4qOpKu4gpM=;
 h=From:To:Cc:Subject:Date:From;
 b=njtpegWUPANro10rLfG+edlRcv8mawREsT6u8fkVoubSm6B0jKh0RSBmm5woj6y3h
 xVwVqiZOtvJRVAaZT3H5xPhnMqqedOUKov92dZxZ97DeZilYjNuSWhYrmbuNz3j8vi
 n9Q867jD8fxBWqQzPs0jYDc+Lwdkqzbq4Zm3J4ngmfFOscp01vqWzSE6bX/TNT49V7
 URkj4XFFkCVlVEeJSj7TOt0I4mwObC1SasxWtsE6tqfK6ICfgEeY3NmAaedlgbFDkq
 +UaBotepmKhPh3DHofOQ/k/c2JMNYWYnpgF1DAyQ273bsnyjLCrqlHV+fP1BMbAbUA
 7WM72af/yh5wg==
From: Conor Dooley <conor@kernel.org>
To: qemu-riscv@nongnu.org
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] riscv: support new isa extension detection devicetree
 properties
Date: Wed, 10 Jan 2024 10:25:35 +0000
Message-Id: <20240110-mold-renovate-256db1b5c70e@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399;
 i=conor.dooley@microchip.com; h=from:subject:message-id;
 bh=SGk1+8de3oU+Fn0dFVDmqD2FY+x6i5sAPRF04PaNVao=;
 b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnzCuaVP5auCFKbKNT6ZqeevobHlUfCDwLzU3SWXdRTq
 lhjVWTbUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIlYVDMyHPe5dXHdDNsV6xpX
 piR7uFcn6l1QeHGm9Wza2c3RvxV3aTIy/DM4MueFpXRfS+mhYgemCye/vt8Xt9fnXXbz5dUPN8V
 MZgEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp;
 fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:40e1:4800::1;
 envelope-from=conor@kernel.org; helo=sin.source.kernel.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.493,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Conor Dooley <conor.dooley@microchip.com>

Making it a series to keep the standalone change to riscv_isa_string()
that Drew reported separate.

Changes in v3:
- g_free() isa_extensions too
- use misa_mxl_max rather than the compile target for the base isa
- add a new patch changing riscv_isa_string() to do the same
- drop a null check that cannot be null
- rebased on top of Alistair's next branch

Changes in v2:
- use g_strdup() for multiletter extension string copying
- wrap stuff in #ifndef to prevent breaking the user mode build
- rename riscv_isa_set_props() -> riscv_isa_write_fdt()

CC: Alistair Francis <Alistair.Francis@wdc.com>
CC: Bin Meng <bin.meng@windriver.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Weiwei Li <liwei1518@gmail.com>
CC: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
CC: qemu-riscv@nongnu.org
CC: qemu-devel@nongnu.org

Conor Dooley (2):
  target/riscv: use misa_mxl_max to populate isa string rather than
    TARGET_LONG_BITS
  target/riscv: support new isa extension detection devicetree
    properties

 hw/riscv/sifive_u.c |  7 ++----
 hw/riscv/spike.c    |  6 ++---
 hw/riscv/virt.c     |  6 ++---
 target/riscv/cpu.c  | 57 ++++++++++++++++++++++++++++++++++++++++++++-
 target/riscv/cpu.h  |  1 +
 5 files changed, 63 insertions(+), 14 deletions(-)

-- 
2.39.2


