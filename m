Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfaUB-0006wu-DU
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 02:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfaU9-0006ui-GW; Fri, 24 Mar 2023 02:01:09 -0400
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfaTt-0004RX-Qd; Fri, 24 Mar 2023 02:01:09 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R701e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VeWZyW2_1679637604; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeWZyW2_1679637604) by smtp.aliyun-inc.com;
 Fri, 24 Mar 2023 14:00:05 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 qemu-riscv@nongnu.org, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 0/4] Fix tb flags use 
Date: Fri, 24 Mar 2023 13:59:50 +0800
Message-Id: <20230324055954.908-1-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.113;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-113.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Fri, 24 Mar 2023 06:01:09 -0000

We have found two places that misuse the fields from env.
The patch set fixes two of them. The first is virt_enabled. And another is vstart.

And for easy moving the tb flag fields, I also make the FS and VS in tb flags
positions changable.

LIU Zhiwei (4):
  target/riscv: Extract virt enabled state from tb flags
  target/riscv: Add a general status enum for extensions
  target/riscv: Encode the FS and VS on a normal way for tb flags
  target/riscv: Add a tb flags field for vstart

 target/riscv/cpu.c                      |  2 +-
 target/riscv/cpu.h                      | 45 +++++++++++++++----------
 target/riscv/cpu_bits.h                 |  6 ----
 target/riscv/cpu_helper.c               | 14 +++++---
 target/riscv/csr.c                      | 14 ++++----
 target/riscv/insn_trans/trans_rvv.c.inc | 22 ++++++------
 target/riscv/translate.c                | 34 +++++++------------
 7 files changed, 69 insertions(+), 68 deletions(-)

-- 
2.17.1


