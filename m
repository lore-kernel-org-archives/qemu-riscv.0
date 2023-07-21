Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FFEEB64DC
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 13:34:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMqH2-00009h-Si; Fri, 21 Jul 2023 09:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMqH0-00007t-EZ
 for qemu-riscv@nongnu.org; Fri, 21 Jul 2023 09:34:22 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMqGw-0000Ee-W7
 for qemu-riscv@nongnu.org; Fri, 21 Jul 2023 09:34:20 -0400
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3a1d9b64837so1362966b6e.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Jul 2023 06:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689946457; x=1690551257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JALTysngirI9WWGONOD2vSVPmQgQOUhlUq5WZ5H9fSc=;
 b=AejBhJRKWlqKn8YfUaJkYPpBFa8sVUM16iYh4eXp5FEEYMuKmcA0lpUr3kCVdbdbax
 cs6006M4x6ssvgpdQW4tqmIlkiYNXfzCx+zNio/bBBBphjb4Al+o7rgoWkarYzswgyDo
 dzEQkERURqg70Ofp6s7GV/WwCuPe0SikwquXJl0skgTyjJZPUc1l0s8056AU/YekPE12
 AWoHLY1+ILhLxFBBlmwEezr/xUCPIkXEYupKQfSqQ/ZeoapGkIaqMgTh47PcKMQymx56
 9mOLi34uw14dN4q2LbRcTV8h3KPhZ/zf1BPFnAmwwa05bmQhYValJ8I2poGQeY8Klay3
 woNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689946457; x=1690551257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JALTysngirI9WWGONOD2vSVPmQgQOUhlUq5WZ5H9fSc=;
 b=JuvAAzKHMGclKjkV4F1eqYh05oFWShhjQpyB2o0lRz/BdxNg7ZZzx5vdjWZohggmjz
 ew15WYQaPcEvhA7kCM9CTJLwRKCxAWbIoq3bvxYpD2YNUo31wQhOIOefapJ3CYEc+r4w
 xrunrM1KGjuSMkjVh3IfEUp1U9Gyj+LlcFcb4zgNgqv6Mw28AKL08WyOMZTNSJY3janj
 9KE6RtTYShwz9bfaGwJ2DlPQ+zmeWPebIZCzRrArC8JmbIOO3csxtkU6C1wHbiOvv1c/
 c1w8rNqw781ltQijebKNBPzt8Il0m8L6G220w//MPZJlBkkV/sH+C0vjnbpQOb7WvseP
 qs+Q==
X-Gm-Message-State: ABy/qLbhXydldWSsmD4ukfgET6NTY0a5Ebh8RDD9Z1WKtHXOgkSuaW+n
 k6OhPO/KIZVebzoS9OzXDwohHw==
X-Google-Smtp-Source: APBJJlFpRrC+OEvvM29KipvNtjmI/V5wS0D8NrAuWKmIAlZw7ToyHrB6m4opH75Jivppg9HgBMFzHw==
X-Received: by 2002:a05:6808:8d:b0:3a5:9363:ef1 with SMTP id
 s13-20020a056808008d00b003a593630ef1mr2158793oic.55.1689946457357; 
 Fri, 21 Jul 2023 06:34:17 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (201-69-66-211.dial-up.telesp.net.br. [201.69.66.211])
 by smtp.gmail.com with ESMTPSA id
 bc13-20020a056808170d00b003a3ff661368sm1394714oib.54.2023.07.21.06.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 06:34:17 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH] target/riscv/cpu.c: do not run 'host' CPU with TCG
Date: Fri, 21 Jul 2023 10:34:11 -0300
Message-ID: <20230721133411.474105-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The 'host' CPU is available in a CONFIG_KVM build and it's currently
available for all accels, but is a KVM only CPU. This means that in a
RISC-V KVM capable host we can do things like this:

$ ./build/qemu-system-riscv64 -M virt,accel=tcg -cpu host --nographic
qemu-system-riscv64: H extension requires priv spec 1.12.0

This CPU does not have a priv spec because we don't filter its extensions
via priv spec. We shouldn't be reaching riscv_cpu_realize_tcg() at all
with the 'host' CPU.

We don't have a way to filter the 'host' CPU out of the available CPU
options (-cpu help) if the build includes both KVM and TCG. What we can
do is to error out during riscv_cpu_realize_tcg() if the user chooses
the 'host' CPU with accel=tcg:

$ ./build/qemu-system-riscv64 -M virt,accel=tcg -cpu host --nographic
qemu-system-riscv64: 'host' CPU is not compatible with TCG acceleration

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6b93b04453..08db3d613f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1395,6 +1395,11 @@ static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
 
+    if (object_dynamic_cast(OBJECT(dev), TYPE_RISCV_CPU_HOST)) {
+        error_setg(errp, "'host' CPU is not compatible with TCG acceleration");
+        return;
+    }
+
     riscv_cpu_validate_misa_mxl(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.41.0


