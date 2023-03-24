Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfaAc-00055t-Pz
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 01:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfaAa-00053y-F5; Fri, 24 Mar 2023 01:40:56 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfaAU-0005er-6v; Fri, 24 Mar 2023 01:40:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679636450; x=1711172450;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4erKGshSeu+jur82KPiXLX3OT89NMAtRcw2WODELJPg=;
 b=UmO6wGUDiOhhRW+NL7JqTYWhTntBm4a34Q1JqziK3y2hWnZr1Q2jzozD
 90ZUJD7nwVH+W6fzrx3B2+PQkzHbd1PvtjfXVuuXl2oRGnd2Bssz1m49f
 zkCC3POsMRIgt9sdA0oxjdZfEQ1+Czl+FR3hHJ1kLc+8aeUvsKPpPlO/Z
 f1GRFrgsb7LnnMWaZ8CZfK9GOAYbyqpnUUjrg8Fx4NT3jMTCpycHA+n7T
 E5gD29tql2TmkgfQCXW9HPT5SZvrjsKJon3hIuUjISOn4fCrMUr0Yh69g
 rtH8X+RC5XMA/UPtY6jFp49ygIQ1NGadNmDefRRJCRK7GMy2JwkD6floA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="339730544"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="339730544"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 22:40:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="712954708"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="712954708"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by orsmga008.jf.intel.com with ESMTP; 23 Mar 2023 22:40:02 -0700
From: Fei Wu <fei2.wu@intel.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, liweiwei@iscas.ac.cn
Cc: Fei Wu <fei2.wu@intel.com>
Subject: [PATCH v5 0/2] target/riscv: reduce MSTATUS_SUM overhead
Date: Fri, 24 Mar 2023 13:41:52 +0800
Message-Id: <20230324054154.414846-1-fei2.wu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=fei2.wu@intel.com;
 helo=mga14.intel.com
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
X-List-Received-Date: Fri, 24 Mar 2023 05:40:57 -0000

v4 -> v5:
* add priv to tb_flags

v3 -> v4:
* seperate priv from mmu_idx
* use index 2 for S+SUM mmu_idx
* no tlb_flush for MPRV / MPP changes


Fei Wu (2):
  target/riscv: separate priv from mmu_idx
  target/riscv: reduce overhead of MSTATUS_SUM change

 target/riscv/cpu.h                            |  3 +--
 target/riscv/cpu_helper.c                     | 21 ++++++++++++++++---
 target/riscv/csr.c                            |  3 +--
 .../riscv/insn_trans/trans_privileged.c.inc   |  2 +-
 target/riscv/insn_trans/trans_rvh.c.inc       |  4 ++--
 target/riscv/insn_trans/trans_xthead.c.inc    |  7 +------
 target/riscv/internals.h                      | 14 +++++++++++++
 target/riscv/op_helper.c                      |  5 +++--
 target/riscv/translate.c                      |  3 +++
 9 files changed, 44 insertions(+), 18 deletions(-)

-- 
2.25.1


