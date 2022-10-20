Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1olT0g-0006YQ-9n
	for mharc-qemu-riscv@gnu.org; Thu, 20 Oct 2022 06:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1olT0K-00069y-23; Thu, 20 Oct 2022 06:42:32 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:42585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1olT0B-0003lY-01; Thu, 20 Oct 2022 06:42:23 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VSerkpG_1666262517; 
Received: from
 roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VSerkpG_1666262517) by smtp.aliyun-inc.com;
 Thu, 20 Oct 2022 18:41:58 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, lzw194868@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH 0/3] Fix some TCG RISC-V backend bugs 
Date: Thu, 20 Oct 2022 18:41:51 +0800
Message-Id: <20221020104154.4276-1-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
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
X-List-Received-Date: Thu, 20 Oct 2022 10:42:44 -0000

This patch set fix some bugs in RISC-V backend. It includes:
1. guest regiser using bug in tcg_out_qemu_ld and tcg_out_qemu_st
2. immediate range bug in tcg_out_opc_imm
3. a wrong optimization in tcg_out_addsub2

After this patch set, I can run the 400.perlbench case(spec2006-simple). Besides,
it seems that we can also run RISU on qemu-aarch64(risc-v) now.

I try to run RISU on qemu-aarch64(x86) and qemu-aarch64(risc-v). But this caused
an segment fault. And it's confusing that RISU running on two qemu-aarch64(x86-64)
also caused a segment fault.

LIU Zhiwei (3):
  tcg/riscv: Fix base regsiter for qemu_ld/st
  tcg/riscv: Fix tcg_out_opc_imm when imm exceeds
  tcg/riscv: Remove a wrong optimization for addsub2

 tcg/riscv/tcg-target.c.inc | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

-- 
2.25.1


