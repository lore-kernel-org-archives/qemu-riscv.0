Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8399DEB64DA
	for <qemu-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 05:44:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qI0jv-0002TR-Sj; Sat, 08 Jul 2023 01:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reaperlu@hust.edu.cn>)
 id 1qI0ju-0002JT-2D; Sat, 08 Jul 2023 01:44:14 -0400
Received: from mail.hust.edu.cn ([202.114.0.240] helo=hust.edu.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reaperlu@hust.edu.cn>)
 id 1qI0jr-0002Ec-Fi; Sat, 08 Jul 2023 01:44:13 -0400
Received: from localhost.localdomain ([10.12.190.169])
 (user=reaperlu@hust.edu.cn mech=LOGIN bits=0)
 by mx1.hust.edu.cn  with ESMTP id 3685giX2008244-3685giX3008244
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 8 Jul 2023 13:43:10 +0800
From: Ruibo Lu <reaperlu@hust.edu.cn>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, luruibo2000@163.com, alistair.francis@wdc.com,
 liweiwei@iscas.ac.cn,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 1/2] target/riscv: Remove redundant check in pmp_is_locked
Date: Sat,  8 Jul 2023 13:36:30 +0800
Message-ID: <20230708054236.18353-1-reaperlu@hust.edu.cn>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: reaperlu@hust.edu.cn
Received-SPF: pass client-ip=202.114.0.240; envelope-from=reaperlu@hust.edu.cn;
 helo=hust.edu.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

the check of top PMP is redundant and will not influence the return
value, so consider remove it

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1733
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Ruibo Lu <reaperlu@hust.edu.cn>
---
 target/riscv/pmp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 9d8db493e6..1a9279ba88 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -49,11 +49,6 @@ static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
         return 1;
     }
 
-    /* Top PMP has no 'next' to check */
-    if ((pmp_index + 1u) >= MAX_RISCV_PMPS) {
-        return 0;
-    }
-
     return 0;
 }
 
-- 
2.41.0


