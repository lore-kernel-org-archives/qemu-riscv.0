Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfAui-0000Ag-Ha
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 22:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfAud-0000AH-PI; Wed, 22 Mar 2023 22:42:48 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfAub-0007HI-Vf; Wed, 22 Mar 2023 22:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679539366; x=1711075366;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OtliJv0j6cMBQyx+8x87fkBvL9HT2VKkhB2pK+xwhgU=;
 b=J3ys6Biqcv2PN2aNuOAnCWNic/wHuLr+O/H0E5rTAbtE/vwR1iQNhilo
 SQl6WlZM4tSLdUNc1svG3NYvjNS2+eGw1Xyk1mFxgZ8NvsGPnqwltAwSE
 1QlbAA8x096Sx9UKO/HJRh026Qn+gtnjrI9ZpqNIDklo3Gt/8JRHB5SWT
 XbdB6hLalD0yrJ9im9ZafKXJyCLA46B12Kqt+ld4HLGrFzKnjUs915la6
 /pmLBABmmZAzf2W3gU2p++Y8czPdmpEPcCxbuEe1QG+9svJgwPEBTxQyC
 bNi51p1aaHomxECUH/XARJF/IYQ/+bKgZYmbZa5v2dhcrJorhs7Md3OBj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="338100171"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="338100171"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 19:42:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="712491263"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="712491263"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by orsmga008.jf.intel.com with ESMTP; 22 Mar 2023 19:42:27 -0700
From: Fei Wu <fei2.wu@intel.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fei Wu <fei2.wu@intel.com>
Subject: [PATCH v4 0/2] target/riscv: reduce MSTATUS_SUM overhead
Date: Thu, 23 Mar 2023 10:44:10 +0800
Message-Id: <20230323024412.324085-1-fei2.wu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=fei2.wu@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 23 Mar 2023 02:42:49 -0000

v3 -> v4:
* seperate priv from mmu_idx
* use index 2 for S+SUM mmu_idx
* no tlb_flush for MPRV / MPP changes

Fei Wu (2):
  target/riscv: separate priv from mmu_idx
  target/riscv: reduce overhead of MSTATUS_SUM change

 target/riscv/cpu.h                            |  2 --
 target/riscv/cpu_helper.c                     | 19 ++++++++++++++++---
 target/riscv/csr.c                            |  3 +--
 .../riscv/insn_trans/trans_privileged.c.inc   |  2 +-
 target/riscv/insn_trans/trans_rvh.c.inc       |  4 ++--
 target/riscv/insn_trans/trans_xthead.c.inc    |  7 +------
 target/riscv/internals.h                      | 14 ++++++++++++++
 target/riscv/op_helper.c                      |  5 +++--
 target/riscv/translate.c                      |  3 +++
 9 files changed, 41 insertions(+), 18 deletions(-)

-- 
2.25.1


