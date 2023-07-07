Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211F5C001DC
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 12:25:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHkX0-0002ai-PP; Fri, 07 Jul 2023 08:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaoshanliukou@163.com>)
 id 1qHc4h-0004Os-Hu; Thu, 06 Jul 2023 23:24:03 -0400
Received: from m12.mail.163.com ([220.181.12.198])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaoshanliukou@163.com>)
 id 1qHc4b-0008Bk-5N; Thu, 06 Jul 2023 23:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=K1BmQ
 N6UzhwIggWAHir/kTdOpmmvmeW9cqyZO1NRX50=; b=Gn77yeFBcp4ydxanQ8UKp
 uxFLccN+hweALakVyUBpsLP04rHGiLzESUsWPZNhZDH3vKv4s+IV+Gl6dgOIo03g
 o8DsiT3xEsRv6LLMGqE2gMJNBruuSHuV64iFoQWKBgfG3ZR1+82cUFEyy7hDhGY4
 nrWGoDw5pX6ukIWDJWzQA8=
Received: from yangzhang2020.localdomain (unknown [60.24.208.92])
 by zwqz-smtp-mta-g1-4 (Coremail) with SMTP id _____wD3elEahadk1ZPOBw--.32303S2;
 Fri, 07 Jul 2023 11:23:13 +0800 (CST)
From: "yang.zhang" <gaoshanliukou@163.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com,
 "yang.zhang" <yang.zhang@hexintek.com>
Subject: [PATCH] target/riscv KVM_RISCV_SET_TIMER macro is not configured
 correctly
Date: Fri,  7 Jul 2023 11:23:06 +0800
Message-Id: <20230707032306.4606-1-gaoshanliukou@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3elEahadk1ZPOBw--.32303S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr1ktry3WFy8ZF1fGF4xXrb_yoW3uFg_Gw
 40g3WxurWjvayYvFWUAw45Cryj9r95Ka1I93WrJFsxC34jgrWUJ3ZYgFn7Aryruw4xWr93
 Zr1xJr9xCryYyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUea0P7UUUUU==
X-Originating-IP: [60.24.208.92]
X-CM-SenderInfo: pjdr2x5dqox3xnrxqiywtou0bp/1tbiUQOl8mDESKYIsgAAs1
Received-SPF: pass client-ip=220.181.12.198;
 envelope-from=gaoshanliukou@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 07 Jul 2023 08:25:46 -0400
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

From: "yang.zhang" <yang.zhang@hexintek.com>

Should set/get riscv all reg timer,i.e, time/compare/frequency/state.

Signed-off-by:Yang Zhang <yang.zhang@hexintek.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1688
---
 target/riscv/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 30f21453d6..0c567f668c 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -99,7 +99,7 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
 
 #define KVM_RISCV_SET_TIMER(cs, env, name, reg) \
     do { \
-        int ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, time), &reg); \
+        int ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, name), &reg); \
         if (ret) { \
             abort(); \
         } \
-- 
2.25.1


