Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWxQN-0003Ue-Sx
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 05:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWxQ7-0002ua-Am; Tue, 28 Feb 2023 05:41:19 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pWxQ0-0002I1-1P; Tue, 28 Feb 2023 05:41:19 -0500
X-QQ-mid: bizesmtp68t1677580844teii81de
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 28 Feb 2023 18:40:36 +0800 (CST)
X-QQ-SSF: 01200000000000D0E000000A0000000
X-QQ-FEAT: 1U/NVTUyJNTPTOgNDZ5SZYMBFtcuX5KxzMlVyClyAR0C06d/jEgmyn/hrfFIz
 vO+IeRZlqr7S/mHdFpC/SXlSF+3cvhpOEpJSSPqYx01urnTXK1xY/0tWRrIDvjsdYiOK3KW
 PFOXgjoy/wdIk/YarGru1UXjFI7BvmdM2nPKw/4AnbFUsW4vRGCp7708qgEEoFq21f95LzD
 3BEpu3BYddqefzpb+buqzKrlEJrfvk7xQWLP253PBpRpBx13lm4LUIVKuWFsYKVXICVdBC1
 aXS5j2DLVIUemx2BdYTPMs6qKcZm1IHDgtrX7v5S1tzGmLseM/pmrzwhpu1jgKBH/b6NxJK
 v70q5s0ZLjdSDppAKRIHuzE98ugQw==
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 00/18] target/riscv: Various fixes to gdbstub and CSR access
Date: Tue, 28 Feb 2023 18:40:16 +0800
Message-Id: <20230228104035.1879882-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 28 Feb 2023 10:41:29 -0000

At present gdbstub reports an incorrect / incomplete CSR list in the
target description XML, for example:

- menvcfg is reported in 'sifive_u' machine
- fcsr is missing in a F/D enabled processor

The issue is caused by:
- priv spec version check is missing when reporting CSRs
- CSR predicate() routine is called without turning on the debugger flag

This series aims to generate a correct and complete CSR list for gdbstub.

This series is rebased against Daniel's FEATURE_* clean-up series v7.
Based-on: 20230222185205.355361-1-dbarboza@ventanamicro.com

Changes in v2:
- keep the original priority policy, instead add some comments for clarification
- new patch: Use assert() for the predicate() NULL check
- keep the 'RV128 restriction check' todo comment
- move smstateen_acc_ok() to near {read,write}_xenvcfg()
- drop patch "target/riscv: Move configuration check to envcfg CSRs predicate()"

Bin Meng (18):
  target/riscv: gdbstub: Check priv spec version before reporting CSR
  target/riscv: Add some comments to clarify the priority policy of
    riscv_csrrw_check()
  target/riscv: Use g_assert() for the predicate() NULL check
  target/riscv: gdbstub: Minor change for better readability
  target/riscv: gdbstub: Do not generate CSR XML if Zicsr is disabled
  target/riscv: Coding style fixes in csr.c
  target/riscv: Use 'bool' type for read_only
  target/riscv: Simplify {read,write}_pmpcfg() a little bit
  target/riscv: Simplify getting RISCVCPU pointer from env
  target/riscv: Avoid reporting odd-numbered pmpcfgX in the CSR XML for
    RV64
  target/riscv: gdbstub: Turn on debugger mode before calling CSR
    predicate()
  target/riscv: gdbstub: Drop the vector CSRs in riscv-vector.xml
  target/riscv: Allow debugger to access user timer and counter CSRs
  target/riscv: Allow debugger to access seed CSR
  target/riscv: Allow debugger to access {h,s}stateen CSRs
  target/riscv: Allow debugger to access sstc CSRs
  target/riscv: Drop priv level check in mseccfg predicate()
  target/riscv: Group all predicate() routines together

 target/riscv/csr.c     | 341 ++++++++++++++++++++++-------------------
 target/riscv/gdbstub.c | 100 +++---------
 2 files changed, 201 insertions(+), 240 deletions(-)

-- 
2.25.1


