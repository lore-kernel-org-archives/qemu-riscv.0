Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD3DC0015E
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 05:39:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qOAl7-0000tx-Dr; Tue, 25 Jul 2023 01:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1qOAkX-0000nK-SW; Tue, 25 Jul 2023 01:38:22 -0400
Received: from forward103c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d103])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1qOAkU-0001T1-IR; Tue, 25 Jul 2023 01:38:21 -0400
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:1e2b:0:640:94b5:0])
 by forward103c.mail.yandex.net (Yandex) with ESMTP id D239060024;
 Tue, 25 Jul 2023 08:38:08 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id 6cClcVZDfuQ0-WdPkXeM7; 
 Tue, 25 Jul 2023 08:38:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1690263488; bh=qBO2Omcn5BargoaMfiM6gEzoIgFTjptpKB2sMLMlBk0=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=GjibuyiM0Td72mliUJ4qIQmVxaCUgFBJO/scaMnVOEyCaWoTfKtnK3ztiNzY9Yi33
 +Ajfy6ySCMr9FL7r+y8ZE7/MkT4cZRo+WCntTqa5BosNudHEYENzukx+3gFVMgw7mT
 BQncMoqJRt5Z7SClVGTYLN6OxnLRKXKM+2CfowBQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net;
 dkim=pass header.i=@maquefel.me
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: linux@yadro.com,
	Nikita Shubin <n.shubin@yadro.com>
Subject: [PATCH] target/riscv: don't read write-only CSR
Date: Tue, 25 Jul 2023 08:38:06 +0300
Message-Id: <20230725053806.9463-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:d103;
 envelope-from=nikita.shubin@maquefel.me; helo=forward103c.mail.yandex.net
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
Anyway it not might be a good idea to read CSR when we are not asked
for, during CSRRW or CSRRWI:

"For CSRRWI, if rd=x0, then the instruction shall not read the CSR and 
shall not cause any of the side effects that might occur on a CSR read."

May be i am missing something of course.
---
 target/riscv/csr.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ea7585329e..6d6a8821a8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3915,14 +3915,17 @@ static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
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


