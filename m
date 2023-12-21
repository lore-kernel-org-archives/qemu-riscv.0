Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C34C35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 09:51:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGFhk-0006P1-5m; Thu, 21 Dec 2023 04:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <duchao@eswincomputing.com>)
 id 1rGFhZ-0006Mu-Hj; Thu, 21 Dec 2023 04:50:49 -0500
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <duchao@eswincomputing.com>)
 id 1rGFhX-0002XK-5q; Thu, 21 Dec 2023 04:50:49 -0500
Received: from localhost.localdomain (unknown [10.12.130.31])
 by app1 (Coremail) with SMTP id TAJkCgAHk_0TCoRlUowCAA--.24821S6;
 Thu, 21 Dec 2023 17:49:11 +0800 (CST)
From: Chao Du <duchao@eswincomputing.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 alistair23@gmail.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org
Subject: [RFC PATCH 2/4] target/riscv/kvm: implement
 kvm_arch_update_guest_debug()
Date: Thu, 21 Dec 2023 09:49:21 +0000
Message-Id: <20231221094923.7349-3-duchao@eswincomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231221094923.7349-1-duchao@eswincomputing.com>
References: <20231221094923.7349-1-duchao@eswincomputing.com>
X-CM-TRANSID: TAJkCgAHk_0TCoRlUowCAA--.24821S6
X-Coremail-Antispam: 1UD129KBjvdXoWrKryrCrWDuFWDKF47uFykKrg_yoW3Gwc_Cr
 WxuF18GryUWFy0gayDCw13AFy3G3yfC3W7t3WxAFyUCryDWrWkJws5W3W7Zry7urWxCFZr
 JrsrXFZxCry5GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbq8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
 IE14v26r15M28IrcIa0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CE
 w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6x
 kF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
 c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
 8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
 s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY02
 Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
 67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
 W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7iFx
 UUUUU
X-CM-SenderInfo: xgxfxt3r6h245lqf0zpsxwx03jof0z/
Received-SPF: pass client-ip=206.189.21.223;
 envelope-from=duchao@eswincomputing.com;
 helo=zg8tmja2lje4os4yms4ymjma.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Set the control flag when there are active breakpoints. This will
help KVM to know the status in the userspace.

Signed-off-by: Chao Du <duchao@eswincomputing.com>
---
 target/riscv/kvm/kvm-cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index e9110006b0..94697b09bb 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1598,5 +1598,7 @@ void kvm_arch_remove_all_hw_breakpoints(void)
 
 void kvm_arch_update_guest_debug(CPUState *cs, struct kvm_guest_debug *dbg)
 {
-    /* TODO; To be implemented later. */
+    if (kvm_sw_breakpoints_active(cs)) {
+        dbg->control |= KVM_GUESTDBG_ENABLE;
+    }
 }
-- 
2.17.1


