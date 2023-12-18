Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D6CC35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 16:35:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFGa3-0002n5-RX; Mon, 18 Dec 2023 11:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ncopa@alpinelinux.org>)
 id 1rFGOn-00078t-DV; Mon, 18 Dec 2023 11:23:22 -0500
Received: from gbr-app-1.alpinelinux.org ([213.219.36.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ncopa@alpinelinux.org>)
 id 1rFGOk-0005sD-TC; Mon, 18 Dec 2023 11:23:20 -0500
Received: from ncopa-desktop.lan (ti0056a400-5190.bb.online.no [85.167.243.86])
 (Authenticated sender: ncopa@alpinelinux.org)
 by gbr-app-1.alpinelinux.org (Postfix) with ESMTPSA id E162B22597C;
 Mon, 18 Dec 2023 16:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alpinelinux.org;
 s=smtp; t=1702916592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0FWL/8idHPFO9kfCetgnotzl224SvDQDNj5iKEvReqs=;
 b=y+6rJ1W5Jn2PBD9jOtN6DJj+cZeZcNI7BIKUBXz7L060DZ+lRukWerQXtyR6igOOrKO3Mt
 IcHgk6Hn4AbATuEYeke0InYZMUiu1SmC08h3yNUMZNdw9j6vETy+sxFqVzl7TpbnX3PsZE
 JxMnEnasHUA662MiJ9UmdHoiQKO7EuY=
From: Natanael Copa <ncopa@alpinelinux.org>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, qemu-trivial@nongnu.org,
 Natanael Copa <ncopa@alpinelinux.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_np()
Date: Mon, 18 Dec 2023 17:22:44 +0100
Message-ID: <20231218162301.14817-1-ncopa@alpinelinux.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=213.219.36.190;
 envelope-from=ncopa@alpinelinux.org; helo=gbr-app-1.alpinelinux.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Dec 2023 11:34:59 -0500
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

strerrorname_np is non-portable and breaks building with musl libc.

Use strerror(errno) instead, like we do other places.

Cc: qemu-stable@nongnu.org
Fixes: commit 082e9e4a58ba (target/riscv/kvm: improve 'init_multiext_cfg' error msg)
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2041
Buglink: https://gitlab.alpinelinux.org/alpine/aports/-/issues/15541
Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
---
 target/riscv/kvm/kvm-cpu.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 45b6cf1cfa..117e33cf90 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -832,9 +832,8 @@ static void kvm_riscv_read_multiext_legacy(RISCVCPU *cpu,
                 multi_ext_cfg->supported = false;
                 val = false;
             } else {
-                error_report("Unable to read ISA_EXT KVM register %s, "
-                             "error code: %s", multi_ext_cfg->name,
-                             strerrorname_np(errno));
+                error_report("Unable to read ISA_EXT KVM register %s: %s",
+                             multi_ext_cfg->name, strerror(errno));
                 exit(EXIT_FAILURE);
             }
         } else {
@@ -895,8 +894,8 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
          *
          * Error out if we get any other errno.
          */
-        error_report("Error when accessing get-reg-list, code: %s",
-                     strerrorname_np(errno));
+        error_report("Error when accessing get-reg-list: %s",
+                     strerror(errno));
         exit(EXIT_FAILURE);
     }
 
@@ -905,8 +904,8 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
     reglist->n = rl_struct.n;
     ret = ioctl(kvmcpu->cpufd, KVM_GET_REG_LIST, reglist);
     if (ret) {
-        error_report("Error when reading KVM_GET_REG_LIST, code %s ",
-                     strerrorname_np(errno));
+        error_report("Error when reading KVM_GET_REG_LIST: %s",
+                     strerror(errno));
         exit(EXIT_FAILURE);
     }
 
@@ -927,9 +926,8 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
         reg.addr = (uint64_t)&val;
         ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
         if (ret != 0) {
-            error_report("Unable to read ISA_EXT KVM register %s, "
-                         "error code: %s", multi_ext_cfg->name,
-                         strerrorname_np(errno));
+            error_report("Unable to read ISA_EXT KVM register %s: %s",
+                         multi_ext_cfg->name, strerror(errno));
             exit(EXIT_FAILURE);
         }
 
-- 
2.43.0


