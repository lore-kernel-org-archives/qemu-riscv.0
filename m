Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347D1C3DA41
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 08:55:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sR6cc-0002PF-CR; Tue, 09 Jul 2024 04:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sR6ca-0002NE-DU
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2024 04:54:48 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sR6cR-0004jM-I4
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2024 04:54:48 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-70af5fbf0d5so3046122b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 09 Jul 2024 01:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1720515277; x=1721120077; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t4XOj0192kA0RnTaXr1GTQiddDsoEl68lknMyxqi+Pc=;
 b=Fq0mdzZCq8B3fM3cJ9Gxe1llZ78WncUAh5gQ58kDyTri8iqD0UM99w0DJGg5eM0nSI
 q0o86uNRLNxv1n39ATJnV6CF7FnxTFKpRxq8iBVxBtnibDm+7TPS3xf4kkAgZu5Kf/AA
 mnUQiOr3IXQGMYzIt1L8wW+IRMSOK8nmmSSkT2rkmhm2+ND+1E4VeTT9i4TXXfbWV7TO
 Q3oGFso1TjTDiDN/hMqo18EAVw5Xl4y5dxBwg29Bbub7+hapkkvxzZdkBAVo2EmQdN5j
 QPI5H5rKKdc0a0PTeqv23tKhx6JAaznzpDopSzfLPEqIFY4mxHJ2Ze6cyVdGB8sOHnJJ
 OZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720515277; x=1721120077;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t4XOj0192kA0RnTaXr1GTQiddDsoEl68lknMyxqi+Pc=;
 b=DKuN/O98Lc+RHFnHi9uEgvtZ1YmDZMBBTP/j28VLfBgpGKIAsUUN2xdGypVQGRz1hN
 nfo5i9Casl1VsSkB+tduNVWsEPw9viC2Xw7/8PUDMBIQyOdzXvlVirHvYIEOF4AHwLT/
 TbfRbf16kF95ujz60ekpXdgN0xQ6TWb6NsETuOPfwaly+yojD5GiDxXT9Y86hcU8kDnh
 OJEi7AC+CuwRB210E7owsy/YWc5BCnhSFHKN3dUtvqNEN5pBXvUafK+6oaRcBXQbYkKk
 bDyR1aO5TZDkie/If2nl5viXReATihfMnm7i0qvoKIKPZNe/ImfH7NEd7M7nGX9hTxlS
 kw2Q==
X-Gm-Message-State: AOJu0YxmAqYmbShyq/wQa47PXQjEvUnUiZ5/yyb9O4Hzl84EWrq1QeL+
 xINBYchsQ8VNP+ZZNxsotd5ApidQXT7mrHcjDYKidljA9WbrkCKVeIzx2NRVizk=
X-Google-Smtp-Source: AGHT+IHFzIljcf6zTPr4lXuYJkm5DMFriaHuEmq2CaZenhdgq2zNUl9yeUCE14AhjvakCXys9bPULg==
X-Received: by 2002:a05:6a00:22cf:b0:706:aa4b:4 with SMTP id
 d2e1a72fcca58-70b44da55abmr2510022b3a.13.1720515277063; 
 Tue, 09 Jul 2024 01:54:37 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([179.193.8.43])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b438995a8sm1316013b3a.10.2024.07.09.01.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 01:54:36 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH] target/riscv/kvm: update KVM regs to Linux 6.10-rc5
Date: Tue,  9 Jul 2024 05:54:31 -0300
Message-ID: <20240709085431.455541-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Two new regs added: ztso and zacas.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 1047961fed..f6e3156b8d 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -281,6 +281,7 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] = {
     KVM_EXT_CFG("zihintntl", ext_zihintntl, KVM_RISCV_ISA_EXT_ZIHINTNTL),
     KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINTPAUSE),
     KVM_EXT_CFG("zihpm", ext_zihpm, KVM_RISCV_ISA_EXT_ZIHPM),
+    KVM_EXT_CFG("zacas", ext_zacas, KVM_RISCV_ISA_EXT_ZACAS),
     KVM_EXT_CFG("zfa", ext_zfa, KVM_RISCV_ISA_EXT_ZFA),
     KVM_EXT_CFG("zfh", ext_zfh, KVM_RISCV_ISA_EXT_ZFH),
     KVM_EXT_CFG("zfhmin", ext_zfhmin, KVM_RISCV_ISA_EXT_ZFHMIN),
@@ -298,6 +299,7 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] = {
     KVM_EXT_CFG("zksed", ext_zksed, KVM_RISCV_ISA_EXT_ZKSED),
     KVM_EXT_CFG("zksh", ext_zksh, KVM_RISCV_ISA_EXT_ZKSH),
     KVM_EXT_CFG("zkt", ext_zkt, KVM_RISCV_ISA_EXT_ZKT),
+    KVM_EXT_CFG("ztso", ext_ztso, KVM_RISCV_ISA_EXT_ZTSO),
     KVM_EXT_CFG("zvbb", ext_zvbb, KVM_RISCV_ISA_EXT_ZVBB),
     KVM_EXT_CFG("zvbc", ext_zvbc, KVM_RISCV_ISA_EXT_ZVBC),
     KVM_EXT_CFG("zvfh", ext_zvfh, KVM_RISCV_ISA_EXT_ZVFH),
-- 
2.45.2


