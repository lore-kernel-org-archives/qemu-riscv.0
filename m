Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C9EC71133
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 12:19:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZVlO-00018e-46; Fri, 25 Aug 2023 08:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qZVlN-00018F-Cc; Fri, 25 Aug 2023 08:18:05 -0400
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qZVlH-0003rB-V4; Fri, 25 Aug 2023 08:18:05 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R391e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
 TI=SMTPD_---0VqXSP-4_1692965860; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VqXSP-4_1692965860) by smtp.aliyun-inc.com;
 Fri, 25 Aug 2023 20:17:41 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 richard.henderson@linaro.org, pbonzini@redhat.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org,
 ajones@ventanamicro.com
Subject: [RFC PATCH 0/3] Add API for list cpu extensions
Date: Fri, 25 Aug 2023 20:16:48 +0800
Message-Id: <20230825121651.1534-1-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.119;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-119.freemail.mail.aliyun.com
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
    Enable extension:
            rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zba_zbb_zbc_zbs_sstc_svadu
"""

Notice currently this patch is only working for RISC-V system mode.

Thanks Andrew Jones for your suggestion!

Todo:
1) Output all possible user configurable options and all extensions.
2) Add support for RISC-V linux-user mode
3) Add support for other archs


LIU Zhiwei (3):
  cpu: Add new API cpu_type_by_name
  target/riscv: Add API list_cpu_props
  softmmu/vl: Add qemu_cpu_opts QemuOptsList

 cpu.c                     | 39 +++++++++++++++++++++++++++------------
 include/exec/cpu-common.h |  1 +
 include/hw/core/cpu.h     | 11 +++++++++++
 softmmu/vl.c              | 35 +++++++++++++++++++++++++++++++++++
 target/riscv/cpu.c        | 10 ++++++++++
 target/riscv/cpu.h        |  2 ++
 6 files changed, 86 insertions(+), 12 deletions(-)

-- 
2.17.1


