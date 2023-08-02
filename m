Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6F0C04A94
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 18:01:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRGA2-0008Im-Sl; Wed, 02 Aug 2023 14:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qRG9r-0008HG-To
 for qemu-riscv@nongnu.org; Wed, 02 Aug 2023 14:01:19 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qRG9o-0003yC-RY
 for qemu-riscv@nongnu.org; Wed, 02 Aug 2023 14:01:15 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6b9cf1997c4so115031a34.3
 for <qemu-riscv@nongnu.org>; Wed, 02 Aug 2023 11:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690999268; x=1691604068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZbCdS8/CIvr20XcpwDEnPJ9tjc+DYre0UOSVutoJ5Lk=;
 b=EBu0DJ43oTwVWvq6W4vDPfUYRgN5Mw8ZVyNlvdtelslyOf7tAM8fgJbT1z5QP6WQh8
 y8vhpd2toLKXOs82YQh4/bx7uNmN+eY6ZwU8EAVSv8T906jGcy05w5d4s6IhNcpBPxlC
 KzU6Dpv0/fR6SAxcu04v0vhTjROQ+9KFHkwokU1WSIY9zL+5HkrPjMU0hMDWQATlRQUB
 3aH3SMFbNOrgdla59nH2TDHfM5V+YAaah/nbyAdu1SrO9Jrlm94WXGUID5GoEFMv/5a1
 JJAPx1sy0mMBfoGXcL3a17FbjyLt5Zz5Tx8Df2su/0CA1fIduCaNc0LCgMl908GNxfDq
 n35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690999268; x=1691604068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZbCdS8/CIvr20XcpwDEnPJ9tjc+DYre0UOSVutoJ5Lk=;
 b=PN3ulZRlYvA1EdA+A5QF/gqMwWoNNeElCkm2ZxxzhN0PUbhxPG0HKnS/cwTb0HKyOp
 6AqBZGYyPAg1P9RD4kuLS2AtKKeyFulELouebA5VqUdSqCM9P02hgkKFO9XuCyeVvabX
 TZDoVAggs5n9fLAv7XwevDDIWSsb2jYvb39OONh7jB2COGt2EFEBMvJPWOxBvLrhIB2W
 Au91qG1Hca+swC2Epy2rlsvBhsZPHw4gwmk3WcZGCxzDzBoJ+hv7SRva2hhvhv6TqlXf
 k3XiT/h+Gjf+IWze11BC/upaXLmvc3IFSGjtjsp45Z+NTU/5fq3NSuVXeSCOZXBRHaox
 HVJw==
X-Gm-Message-State: ABy/qLZfwVqZV3GIx8SpZzqZRHbrhf3TO21PCS+vvEY8k4DmnROQJj4Z
 G8N2ytqzZWdBRWU/GrpUb5hnWA==
X-Google-Smtp-Source: APBJJlGgCQaaPj9xU2opLgitpkONCyQ3dKVYPoPYnWrlJcdP22LddhRbf728v6E1jeu/GFmidYeiXw==
X-Received: by 2002:a9d:7554:0:b0:6b7:52ce:ff38 with SMTP id
 b20-20020a9d7554000000b006b752ceff38mr15540841otl.16.1690999268117; 
 Wed, 02 Aug 2023 11:01:08 -0700 (PDT)
Received: from grind.. ([187.11.154.63]) by smtp.gmail.com with ESMTPSA id
 b23-20020a056830105700b006b8c6eb962esm6149906otp.52.2023.08.02.11.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 11:01:07 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH] target/riscv/kvm.c: fix mvendorid size in
 vcpu_set_machine_ids()
Date: Wed,  2 Aug 2023 15:00:58 -0300
Message-ID: <20230802180058.281385-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

cpu->cfg.mvendorid is a 32 bit field and kvm_set_one_reg() always write
a target_ulong val, i.e. a 64 bit field in a 64 bit host.

Given that we're passing a pointer to the mvendorid field, the reg is
reading 64 bits starting from mvendorid and going 32 bits in the next
field, marchid. Here's an example:

$ ./qemu-system-riscv64 -machine virt,accel=kvm -m 2G -smp 1 \
   -cpu rv64,marchid=0xab,mvendorid=0xcd,mimpid=0xef(...)

(inside the guest)
 # cat /proc/cpuinfo
processor	: 0
hart		: 0
isa		: rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
mmu		: sv57
mvendorid	: 0xab000000cd
marchid		: 0xab
mimpid		: 0xef

'mvendorid' was written as a combination of 0xab (the value from the
adjacent field, marchid) and its intended value 0xcd.

Fix it by assigning cpu->cfg.mvendorid to a target_ulong var 'reg' and
use it as input for kvm_set_one_reg(). Here's the result with this patch
applied and using the same QEMU command line:

 # cat /proc/cpuinfo
processor	: 0
hart		: 0
isa		: rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
mmu		: sv57
mvendorid	: 0xcd
marchid		: 0xab
mimpid		: 0xef

This bug affects only the generic (rv64) CPUs when running with KVM in a
64 bit env since the 'host' CPU does not allow the machine IDs to be
changed via command line.

Fixes: 1fb5a622f7 ("target/riscv: handle mvendorid/marchid/mimpid for KVM CPUs")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 9d8a8982f9..b1fd2233c0 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -852,12 +852,19 @@ void kvm_arch_init_irq_routing(KVMState *s)
 static int kvm_vcpu_set_machine_ids(RISCVCPU *cpu, CPUState *cs)
 {
     CPURISCVState *env = &cpu->env;
+    target_ulong reg;
     uint64_t id;
     int ret;
 
     id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
                           KVM_REG_RISCV_CONFIG_REG(mvendorid));
-    ret = kvm_set_one_reg(cs, id, &cpu->cfg.mvendorid);
+    /*
+     * cfg.mvendorid is an uint32 but a target_ulong will
+     * be written. Assign it to a target_ulong var to avoid
+     * writing pieces of other cpu->cfg fields in the reg.
+     */
+    reg = cpu->cfg.mvendorid;
+    ret = kvm_set_one_reg(cs, id, &reg);
     if (ret != 0) {
         return ret;
     }
-- 
2.41.0


