Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BC6C83F12
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 08:46:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qaXtU-0006SZ-FO; Mon, 28 Aug 2023 04:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qaXtS-0006Rt-5O; Mon, 28 Aug 2023 04:46:42 -0400
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qaXtO-0008OY-GW; Mon, 28 Aug 2023 04:46:41 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R521e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=16; SR=0;
 TI=SMTPD_---0VqiO9wA_1693212384; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VqiO9wA_1693212384) by smtp.aliyun-inc.com;
 Mon, 28 Aug 2023 16:46:25 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, pbonzini@redhat.com, berrange@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 qemu-riscv@nongnu.org
Subject: [RFC PATCH v2 0/6] Add API for list cpu extensions
Date: Mon, 28 Aug 2023 16:45:30 +0800
Message-Id: <20230828084536.231-1-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.124;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-124.freemail.mail.aliyun.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Some times we want to know what is the really mean of one cpu option.
For example, in RISC-V, we usually specify a cpu in this way:
-cpu rv64,v=on

If we don't look into the source code, we can't get the ISA extensions
of this -cpu command line.

In this patch set, we add one list_cpu_props API for common cores. It
will output the enabled ISA extensions.

In the near future, I will also list all possible user configurable
options and all possible extensions for this cpu.

In order to reuse the options parse code, I also add a QemuOptsList
for cpu.

After this patch, we can output the extensions for cpu,
"""
./qemu-system-riscv64 -cpu rv64,help
Enabled extensions:
    rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zba_zbb_zbc_zbs_sstc_svadu
To get all configuable options for this cpu, use -device rv64-riscv-cpu,help
"""


v1->v2:

1) Give a hint to use -device cpu,help for configualbe options on cpu
2) Support list_cpu_props for linux user mode
3) Add default to some properties to make -device cpu,help output better


Todo:
1) Fix Daniel comments on KVM and cpu option check
2) Add support for other archs
3) Move qdev help function from qdev-monitor to qdev-property

LIU Zhiwei (6):
  cpu: Add new API cpu_type_by_name
  target/riscv: Add API list_cpu_props
  softmmu/vl: Add qemu_cpu_opts QemuOptsList
  target/riscv: Add default value for misa property
  target/riscv: Add defalut value for string property
  linux-user: Move qemu_cpu_opts to cpu.c

 cpu.c                        | 63 +++++++++++++++++++++++++++++-------
 hw/core/qdev-prop-internal.h |  2 ++
 hw/core/qdev-properties.c    |  7 ++++
 include/exec/cpu-common.h    |  3 ++
 include/hw/core/cpu.h        | 11 +++++++
 include/hw/qdev-properties.h |  8 +++++
 linux-user/main.c            | 10 ++++++
 softmmu/vl.c                 | 11 +++++++
 target/riscv/cpu.c           | 30 +++++++++++++----
 target/riscv/cpu.h           |  2 ++
 10 files changed, 128 insertions(+), 19 deletions(-)

-- 
2.17.1


