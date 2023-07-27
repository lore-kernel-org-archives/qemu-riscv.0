Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3100CC05052
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 08:22:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qOwBn-0008Gp-Fv; Thu, 27 Jul 2023 04:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1qOwBl-0008GX-JY; Thu, 27 Jul 2023 04:17:38 -0400
Received: from forward101b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d101])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1qOwBj-0002r0-J8; Thu, 27 Jul 2023 04:17:37 -0400
Received: from mail-nwsmtp-smtp-production-main-19.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-19.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c14:4081:0:640:557:0])
 by forward101b.mail.yandex.net (Yandex) with ESMTP id 922D36002A;
 Thu, 27 Jul 2023 11:17:29 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-19.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id QHHwHgAWlqM0-Xwqvk00K; 
 Thu, 27 Jul 2023 11:17:28 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1690445848; bh=RGdYSjHGGqifIjc3/r+ll9smtzIvtH4Fkid/+ELLMNE=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=qO8k9wqJTDbOIbflL8PWXNwqZ9+xT9dbUsxT9dMnbyhAlxlOdcVeHdjnk4IunG0vb
 IFvchIWnOSF9W5RdVmYyqcK8CVt/PTnia+RFBQicmE2Ju8sprboD98pjQDG1YnfNzY
 aBKTV7Yuu7Lh16yqEV0q9ggFlZBgrdkurGGrsffM=
Authentication-Results: mail-nwsmtp-smtp-production-main-19.sas.yp-c.yandex.net;
 dkim=pass header.i=@maquefel.me
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Nikita Shubin <n.shubin@yadro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2] target/riscv: don't read write-only CSR
Date: Thu, 27 Jul 2023 11:17:26 +0300
Message-Id: <20230727081726.12650-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:d101;
 envelope-from=nikita.shubin@maquefel.me; helo=forward101b.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Nikita Shubin <n.shubin@yadro.com>

In case of write-only CSR don't return illegal inst error when CSR is
written and lacks read op.

Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
---
Changelog:
- fixed uninitialized old_value

Anyway it not might be a good idea to read CSR when we are not asked
for, during CSRRW or CSRRWI:

"For CSRRWI, if rd=x0, then the instruction shall not read the CSR and
shall not cause any of the side effects that might occur on a CSR read."

May be i am missing something of course.
---
 target/riscv/csr.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ea7585329e..3f0b3277e4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3908,21 +3908,24 @@ static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
                                        target_ulong write_mask)
 {
     RISCVException ret;
-    target_ulong old_value;
+    target_ulong old_value = 0;
 
     /* execute combined read/write operation if it exists */
     if (csr_ops[csrno].op) {
         return csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
     }
 
-    /* if no accessor exists then return failure */
-    if (!csr_ops[csrno].read) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-    /* read old value */
-    ret = csr_ops[csrno].read(env, csrno, &old_value);
-    if (ret != RISCV_EXCP_NONE) {
-        return ret;
+    /* don't read if ret_value==NULL */
+    if (ret_value) {
+        /* if no accessor exists then return failure */
+        if (!csr_ops[csrno].read) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+        /* read old value */
+        ret = csr_ops[csrno].read(env, csrno, &old_value);
+        if (ret != RISCV_EXCP_NONE) {
+            return ret;
+        }
     }
 
     /* write value if writable and write mask set, otherwise drop writes */
-- 
2.39.2


