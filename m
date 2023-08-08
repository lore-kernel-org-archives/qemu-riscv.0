Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44248C001DB
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 09:10:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTIid-0002N2-6Y; Tue, 08 Aug 2023 05:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1qTIiV-0002JX-13; Tue, 08 Aug 2023 05:09:27 -0400
Received: from forward101b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d101])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1qTIiR-00032v-7V; Tue, 08 Aug 2023 05:09:26 -0400
Received: from mail-nwsmtp-smtp-production-main-91.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-91.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:128d:0:640:bfed:0])
 by forward101b.mail.yandex.net (Yandex) with ESMTP id A32A26002E;
 Tue,  8 Aug 2023 12:09:16 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.myt.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id E9UOW51Wo8c0-HXrwtmuZ; 
 Tue, 08 Aug 2023 12:09:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1691485755; bh=4o/WnXEKpjj00dEwZYWeKcTZhVFaWgpUE1goJry4khw=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=k/yZ7AEGebpleN9++sQ70Z2PAk5jyGkKSXIJVzsdl+F4ceW+MirAy3SeoKzRLt3HL
 E/R9/Ir9WvlWSpztI4sRpEhU3uIcNeNuCMKo99JtQTtBvq0kkH1PKCdYyJI0wLRXuD
 LBQwzMVF4kYZYseE/Wia//evygT/xKXJDTFuY634=
Authentication-Results: mail-nwsmtp-smtp-production-main-91.myt.yp-c.yandex.net;
 dkim=pass header.i=@maquefel.me
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Nikita Shubin <n.shubin@yadro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v3] target/riscv: don't read CSR in riscv_csrrw_do64
Date: Tue,  8 Aug 2023 12:09:14 +0300
Message-Id: <20230808090914.17634-1-nikita.shubin@maquefel.me>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Nikita Shubin <n.shubin@yadro.com>

As per ISA:

"For CSRRWI, if rd=x0, then the instruction shall not read the CSR and
shall not cause any of the side effects that might occur on a CSR read."

trans_csrrwi() and trans_csrrw() call do_csrw() if rd=x0, do_csrw() calls
riscv_csrrw_do64(), via helper_csrw() passing NULL as *ret_value.

Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
---
Changelog v2:
- fixed uninitialized old_value

Changelog v3:
- reword comment and commit message as Deniel suggested

---
 target/riscv/csr.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ea7585329e..c5564d6d53 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3908,21 +3908,27 @@ static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
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
+    /*
+     * ret_value == NULL means that rd=x0 and we're coming from helper_csrw()
+     * and we can't throw side effects caused by CSR reads.
+     */
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


