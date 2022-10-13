Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oirjV-0000E5-RV
	for mharc-qemu-riscv@gnu.org; Thu, 13 Oct 2022 02:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oirjQ-0000DU-Fp; Thu, 13 Oct 2022 02:30:12 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:52497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oirjH-00033T-Dg; Thu, 13 Oct 2022 02:30:05 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R321e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0VS2PtCj_1665642589; 
Received: from
 roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VS2PtCj_1665642589) by smtp.aliyun-inc.com;
 Thu, 13 Oct 2022 14:29:50 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 sergey.matyukevich@syntacore.com, vladimir.isaev@syntacore.com,
 anatoly.parshintsev@syntacore.com, philipp.tomsich@vrull.eu,
 zhiwei_liu@c-sky.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v1 0/4] Support native debug icount trigger
Date: Thu, 13 Oct 2022 14:29:42 +0800
Message-Id: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 13 Oct 2022 06:30:13 -0000

icount trigger set an instruction count. After one instruction retired,
the count will be decreased by 1. If the count decreased to 0, the icount
trigger will fire.

icount trigger is needed by single step ptrace system call and the native
GDB.

In this patch set, change the translation when icount trigger enabled in the
way that instruction executes one by one. After executing one instruction,
call a helper function to decrease the count for itrigger.


It also provides an accelebrated way. If QEMU executes with -icount parameter,
itrigger is simulated by a timer with the count in itrigger as the deadline.

Note the count in itrigger will only decrease when the priviledge matches, which
is also processed in this patch set.


After merging this patch set, QEMU will support type2/type6 trigger(needed by
breakpoint and watchpoint) and icount trigger(needed by single step),
which is enough for a PoC of native debug. 

LIU Zhiwei (4):
  target/riscv: Add itrigger support when icount is not enabled
  target/riscv: Add itrigger support when icount is enabled
  target/riscv: Enable native debug itrigger
  target/riscv: Add itrigger_enabled field to CPURISCVState

 target/riscv/cpu.h                            |   5 +
 target/riscv/cpu_helper.c                     |   8 +
 target/riscv/debug.c                          | 205 ++++++++++++++++++
 target/riscv/debug.h                          |  13 ++
 target/riscv/helper.h                         |   2 +
 .../riscv/insn_trans/trans_privileged.c.inc   |   4 +-
 target/riscv/insn_trans/trans_rvi.c.inc       |   8 +-
 target/riscv/insn_trans/trans_rvv.c.inc       |   4 +-
 target/riscv/machine.c                        |  15 ++
 target/riscv/translate.c                      |  33 ++-
 10 files changed, 286 insertions(+), 11 deletions(-)

-- 
2.17.1


