Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806B5CDB474
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 22:13:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qssJ4-0001k0-I5; Tue, 17 Oct 2023 18:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qssJ1-0001fE-Vo
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 18:12:52 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qssJ0-0002Y5-I9
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 18:12:51 -0400
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-79f9acc857cso223589139f.2
 for <qemu-riscv@nongnu.org>; Tue, 17 Oct 2023 15:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697580769; x=1698185569; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tu1uQppmcaudXCZ6wZyPs+oZqs9eNWAN3vjDAnHlDMw=;
 b=I3fDPaHJ4uV9CvaCKB+RF83NuEcyUa+/itVLJuJfDXa7rpD7+hvUXxtpHMeB1+xE3+
 nxE7bDWc1KqxIQqOjl7cEZxWN0iSIizOPLfhVRQmKmsMOysB6YeIWxSS4rFBIDCxU6Iq
 y6ojwfq43INK6gHQHEkyC1izMXmkYmUovmkSJHL9s96QA/3iC2sE922OOekjKHJtyZz8
 xfHc38Ik32n7JFERrHmTqMKa90PErl8xC+LeZDLY16vDUw4be5vdP04HGZcHKQrbdmHG
 ax83YByN79yV0wZsJQPRuOsFn76AdDcI6Sv8EwbGbu4mwdxPe63eTYXHftg8oX2WCsbE
 fdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697580769; x=1698185569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tu1uQppmcaudXCZ6wZyPs+oZqs9eNWAN3vjDAnHlDMw=;
 b=SFp691NgKcq50aFDOGBhtQ83wYjGV5z1OAD6dtgWCQboyqrFT993PNp7plwCpWQ1Hm
 hqiiUlCtg5x2l2IgltehB2fWvOrRd65TCPw3N2zyve6wLNYIFCOzRLOWpmkEwO8kbivm
 Ii5YQ671DcTQ9Vhz3GVXIMcU+aFAJptDKyJKqTtyjn8sxMjx4RbmvwHtRQc3gyt3WpW/
 v5VJrO6oqXp4cO2ABDJWm/armzz3VCecLdrsqZjGd2xC/kRV5SliXmLzpkbmvDrHVp5I
 DSfuEKx4qozjfmBBF4+mXQcku7GynXzbRyx9Ktftyv1y+LpE+wsXg+Wom0eyFQFF7ntx
 H6HQ==
X-Gm-Message-State: AOJu0Yw0oc6Vf1Ok8HcU86Tv/KIYk1leH7AuvR5BqCbOlS92Rf3r7ndC
 K0qz7PpJn9AHuDZQo5Ifz9CUIA==
X-Google-Smtp-Source: AGHT+IEgHkSaUJ+tzrikgdyRVO/qigwx8IgeyH5JPHSaAKB9FfwsiwqUKDcarl77j7c38i+aVerA6Q==
X-Received: by 2002:a05:6e02:1546:b0:357:6410:9494 with SMTP id
 j6-20020a056e02154600b0035764109494mr5115257ilu.15.1697580769242; 
 Tue, 17 Oct 2023 15:12:49 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.45.186.249])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a62d14d000000b006be077531aesm2011023pfl.220.2023.10.17.15.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 15:12:48 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 6/6] target/riscv/kvm: add zihpm reg
Date: Tue, 17 Oct 2023 19:12:26 -0300
Message-ID: <20231017221226.136764-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017221226.136764-1-dbarboza@ventanamicro.com>
References: <20231017221226.136764-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Add zihpm support in the KVM driver now that QEMU supports it.

This reg was added in Linux 6.6.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 6c2a92d171..5246fc2bdc 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -217,6 +217,7 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] = {
     KVM_EXT_CFG("zicboz", ext_zicboz, KVM_RISCV_ISA_EXT_ZICBOZ),
     KVM_EXT_CFG("zicntr", ext_zicntr, KVM_RISCV_ISA_EXT_ZICNTR),
     KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINTPAUSE),
+    KVM_EXT_CFG("zihpm", ext_zihpm, KVM_RISCV_ISA_EXT_ZIHPM),
     KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
     KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
     KVM_EXT_CFG("sstc", ext_sstc, KVM_RISCV_ISA_EXT_SSTC),
-- 
2.41.0


