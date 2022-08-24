Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQsKF-0000Hr-NJ
	for mharc-qemu-riscv@gnu.org; Wed, 24 Aug 2022 11:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oQq8A-0008Mv-CV; Wed, 24 Aug 2022 09:09:14 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:44983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oQq86-0006ha-Pl; Wed, 24 Aug 2022 09:09:12 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VN7XDd6_1661346226; 
Received: from
 roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VN7XDd6_1661346226) by smtp.aliyun-inc.com;
 Wed, 24 Aug 2022 21:03:47 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH 0/4] Support multiple deocde path for RISC-V
Date: Wed, 24 Aug 2022 21:03:27 +0800
Message-Id: <20220824130331.21315-1-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.44;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-44.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 24 Aug 2022 11:29:46 -0400
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
X-List-Received-Date: Wed, 24 Aug 2022 13:09:14 -0000

The patch set add support for disassembling XVentanaCondOps instructions.
And we can also extend it to disassemble the other custom extensions.

The target_info field in struct disassemble_info is intended to be used
by targets in any way they deem suitable. We encode the custom extension
in this field and decode the custom instructions according to this information.

LIU Zhiwei (4):
  target/riscv: Use xl instead of mxl for disassemble
  disas/riscv: Move down the struct rv_decode
  disas/riscv: Add used_opcode_data field
  target/riscv: Support Ventana disassemble

 disas/riscv.c         | 103 +++++++++++++++++++++++++++++++++---------
 target/riscv/cpu.c    |  22 ++++++++-
 target/riscv/custom.h |  25 ++++++++++
 3 files changed, 127 insertions(+), 23 deletions(-)
 create mode 100644 target/riscv/custom.h

-- 
2.25.1


