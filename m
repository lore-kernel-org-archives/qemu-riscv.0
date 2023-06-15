Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819E1EB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 06:34:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9gYe-00073c-NC; Thu, 15 Jun 2023 02:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9gXs-0006SN-Cf; Thu, 15 Jun 2023 02:33:24 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9gXp-00049D-L1; Thu, 15 Jun 2023 02:33:24 -0400
Received: from localhost.localdomain (unknown [117.61.111.213])
 by APP-05 (Coremail) with SMTP id zQCowAD3_h6isIpkuxShAg--.21989S3;
 Thu, 15 Jun 2023 14:33:10 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 1/6] target/riscv: Add properties for BF16 extensions
Date: Thu, 15 Jun 2023 14:32:57 +0800
Message-Id: <20230615063302.102409-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615063302.102409-1-liweiwei@iscas.ac.cn>
References: <20230615063302.102409-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3_h6isIpkuxShAg--.21989S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4rGFyrZFyfAFWUKr4fGrg_yoW8uw13pr
 srGas0kryDJr9rC343JFyUtw1UCws29w4xK393t3WxZFWfX3y5JF1qkw1jgr4UJF4ruF4a
 9w47uFWUursrZa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBE14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
 xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
 6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
 Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
 Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
 IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUqAp5UUUUU
 =
X-Originating-IP: [117.61.111.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Add ext_zfbfmin/zvfbfmin/zvfbfwma properties.
Add require check for BF16 extensions.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c     | 20 ++++++++++++++++++++
 target/riscv/cpu_cfg.h |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 881bddf393..dc6b2f72f6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1059,6 +1059,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zfbfmin && !riscv_has_ext(env, RVF)) {
+        error_setg(errp, "Zfbfmin extension depends on F extension");
+        return;
+    }
+
     if (riscv_has_ext(env, RVD) && !riscv_has_ext(env, RVF)) {
         error_setg(errp, "D extension requires F extension");
         return;
@@ -1109,6 +1114,21 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvfbfmin && !cpu->cfg.ext_zfbfmin) {
+        error_setg(errp, "Zvfbfmin extension depends on Zfbfmin extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zvfbfmin && !cpu->cfg.ext_zve32f) {
+        error_setg(errp, "Zvfbfmin extension depends on Zve32f extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zvfbfwma && !cpu->cfg.ext_zvfbfmin) {
+        error_setg(errp, "Zvfbfwma extension depends on Zvfbfmin extension");
+        return;
+    }
+
     /* Set the ISA extensions, checks should have happened above */
     if (cpu->cfg.ext_zhinx) {
         cpu->cfg.ext_zhinxmin = true;
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index c4a627d335..7d16f32720 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -75,6 +75,7 @@ struct RISCVCPUConfig {
     bool ext_svpbmt;
     bool ext_zdinx;
     bool ext_zawrs;
+    bool ext_zfbfmin;
     bool ext_zfh;
     bool ext_zfhmin;
     bool ext_zfinx;
@@ -84,6 +85,8 @@ struct RISCVCPUConfig {
     bool ext_zve64f;
     bool ext_zve64d;
     bool ext_zmmul;
+    bool ext_zvfbfmin;
+    bool ext_zvfbfwma;
     bool ext_zvfh;
     bool ext_zvfhmin;
     bool ext_smaia;
-- 
2.25.1


