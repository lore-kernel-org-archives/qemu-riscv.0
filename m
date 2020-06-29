Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jptVm-0008IV-Dz
	for mharc-qemu-riscv@gnu.org; Mon, 29 Jun 2020 09:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jptVj-0008Dc-LI; Mon, 29 Jun 2020 09:07:47 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:39536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jptVf-0003Xu-R9; Mon, 29 Jun 2020 09:07:47 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3852587|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_news_journal|0.0631693-0.000208245-0.936622;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03268; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.HucVN.U_1593436054; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HucVN.U_1593436054)
 by smtp.aliyun-inc.com(10.147.44.145);
 Mon, 29 Jun 2020 21:07:35 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 0/2] target/riscv: fixup atomic implementation
Date: Mon, 29 Jun 2020 21:07:29 +0800
Message-Id: <20200629130731.1080-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 09:07:36
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jun 2020 13:07:48 -0000

When I tested RVA with RISU, I found there is something wrong.
In particular, amo*.w instructions should only operate the lowerest 32
bits. However, the current implementation uses the whole XLEN bits.

LIU Zhiwei (2):
  tcg/tcg-op: Fix nonatomic_op load with MO_SIGN
  target/riscv: Do amo*.w insns operate with 32 bits

 target/riscv/insn_trans/trans_rva.inc.c | 60 +++++++++++++++++++------
 tcg/tcg-op.c                            |  4 +-
 2 files changed, 49 insertions(+), 15 deletions(-)

-- 
2.23.0


