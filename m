Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56EDC7EE23
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 09:37:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1ORA-0006rU-7b; Tue, 23 May 2023 05:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q1OR9-0006qO-0u; Tue, 23 May 2023 05:36:11 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q1OR5-0007Ui-Uy; Tue, 23 May 2023 05:36:10 -0400
Received: from localhost.localdomain (unknown [61.165.37.98])
 by APP-05 (Coremail) with SMTP id zQCowABXXYn8iGxkwiCaAw--.15216S2;
 Tue, 23 May 2023 17:35:58 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 0/8] Add support for extension specific disas
Date: Tue, 23 May 2023 17:35:31 +0800
Message-Id: <20230523093539.203909-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABXXYn8iGxkwiCaAw--.15216S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1fWF1rtF4ktF1DXFyrZwb_yoW8AF48pr
 4fGry3Kr4DArZ7ur1fWr1UWr4Yy39Yga13Kwn7Jw48Jw43AryUXrn7Jr18A348GFyfCFyj
 9a15Cry3uw4kAaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
 6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbU
 UUUUU==
X-Originating-IP: [61.165.37.98]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Some extensions have conflict encodings, such as
 * Z*inx reuse the same encodings as normal float point extensions.
 * Zcm* reuse the some encodings of Zcd.
 * Custom extensions from different vendors may share the same encodings.
To resolve this problem, this patchset tries to pass RISCVCPUConfig as disasemble_info.target_info to support extension specific disas, which means that the disas for this extensions is supported only when the related extension is supported.
This patchset also fixes some style problems in disas/riscv.c.

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-disas-upstream-v2

v2:
 * Split the RISCVCPUCfg declarations from cpu.h into the new cpu_cfg.h header
in a separated patch 2 and add a 2023 copyright (Suggested-by: Daniel Henrique Barboza)
 * Check Zcm* and avoid changing the other lines in patch 4 (Suggested-by: Daniel Henrique Barboza)

Weiwei Li (8):
  disas: Change type of disassemble_info.target_info to pointer
  target/riscv: Split RISCVCPUConfig declarations from cpu.h into
    cpu_cfg.h
  target/riscv: Pass RISCVCPUConfig as target_info to disassemble_info
  disas/riscv.c: Support disas for Zcm* extensions
  disas/riscv.c: Support disas for Z*inx extensions
  disas/riscv.c: Remove unused decomp_rv32/64 value for vector
    instructions
  disas/riscv.c: Fix lines with over 80 characters
  disas/riscv.c: Remove redundant parentheses

 disas/riscv.c           | 1194 +++++++++++++++++++++------------------
 include/disas/dis-asm.h |    2 +-
 target/riscv/cpu.c      |    1 +
 target/riscv/cpu.h      |  114 +---
 target/riscv/cpu_cfg.h  |  136 +++++
 5 files changed, 785 insertions(+), 662 deletions(-)
 create mode 100644 target/riscv/cpu_cfg.h

-- 
2.25.1


