Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otqfG-0005pG-Ab
	for mharc-qemu-riscv@gnu.org; Sat, 12 Nov 2022 08:35:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1otqet-0005jJ-LN; Sat, 12 Nov 2022 08:34:57 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1otqeq-0001zu-7e; Sat, 12 Nov 2022 08:34:54 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C99FBB80835;
 Sat, 12 Nov 2022 13:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6495C433D6;
 Sat, 12 Nov 2022 13:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668260087;
 bh=25htjiXiYVuMtYAGafmaraJrEDTK5skDb8jIY9KhjuM=;
 h=From:To:Cc:Subject:Date:From;
 b=m9q4ZVHdDOcHiuDoSmEBm2fqhF0wO8Od4k73J6uANvhWLfbcW+fEkGZ23Yoj95G83
 1q+Ud7DkbXHrPM86vTLRdO4jRB3RX5l05btpXpghstv/tUC8rdsUs6g1IytOPsXHF/
 UyrxKAypLlykykBYQ79tLaj+h0YrDak+n6tNtDzpCN9qwYHrk8hdfrvk1MS21Wgzb+
 OSJGrnwPHeuA0EH28tz6GAJN3noy2uZYJK50IXQhAQ32MNxCwZqXX1Fwzv9sIrNCOw
 cDqvknlMy4FJd7kPNsDeVqa4KppVf5/LStlM7oYkFQCO6hc0kzy00wtA9PcW1d713k
 kMc/MFe+DsHSg==
From: Conor Dooley <conor@kernel.org>
To: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 0/3] Add (more) missing PolarFire SoC io regions
Date: Sat, 12 Nov 2022 13:34:12 +0000
Message-Id: <20221112133414.262448-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=conor@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 12 Nov 2022 13:35:07 -0000

From: Conor Dooley <conor.dooley@microchip.com>

Hey all,
But of a v2 of what I sent the other day [0]..
Apart from DDR (see [1]), these should be the last bits needed to get
recent Linux kernels booting again for Icicle/PolarFire SoC. Previously,
I had been disabling the hwrng and PCI but I keep forgetting that is
required and decided to fix that.

I'm not entirely sure if I have done some sort of no-no thing by
registering the same interrupt with both the IOSCB and SYSREG regions.
The interrupt is raised after the system controller handles a service
via the mailbox. The mailbox's status, control and mailbox registers
are all part of the IOSCB region. It's cleared by a write to a register
in the SYSREG region.
Since my goal here is to add the regions/peripherals without actually
implementing them so that Linux etc, I'm just raising an interrupt
once a guest requests a service & reporting a status indicating that the
service request failed.

Thanks,
Conor.

0 - https://lore.kernel.org/qemu-devel/20221109190849.1556711-1-conor@kernel.org/
1 - https://lore.kernel.org/all/Y2+dUCpd8OP52%2FDJ@spud/

Conor Dooley (3):
  hw/misc/pfsoc: add fabric clocks to ioscb
  hw/riscv: pfsoc: add missing FICs as unimplemented
  hw/{misc,riscv}: pfsoc: add system controller as unimplemented

 hw/misc/mchp_pfsoc_ioscb.c          |  65 ++++++++++++++-
 hw/misc/mchp_pfsoc_sysreg.c         |  19 ++++-
 hw/riscv/microchip_pfsoc.c          | 121 ++++++++++++++++------------
 include/hw/misc/mchp_pfsoc_ioscb.h  |   4 +
 include/hw/misc/mchp_pfsoc_sysreg.h |   1 +
 include/hw/riscv/microchip_pfsoc.h  |   3 +
 6 files changed, 155 insertions(+), 58 deletions(-)

-- 
2.37.2


