Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79B6D6C28C
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Nov 2024 19:17:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tDTjG-0002nD-FU; Tue, 19 Nov 2024 14:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tDTjD-0002mc-Lf
 for qemu-riscv@nongnu.org; Tue, 19 Nov 2024 14:17:35 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tDTjC-0007gn-0M
 for qemu-riscv@nongnu.org; Tue, 19 Nov 2024 14:17:35 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-71e52582cf8so2601224b3a.2
 for <qemu-riscv@nongnu.org>; Tue, 19 Nov 2024 11:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1732043852; x=1732648652; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AtwIk6HkYOGhU19AjHqQe2GTivk7yu3nAfc701TP3rY=;
 b=SFhUoCFtiyJkooZ1abyOYMckkBAhSb2QVkIs5A8oxNlcz+Vkrk3YciRqC2Ajpa9g53
 zxWlWxeADQkn7H3RHHeYgXavc91+A0Su69VxhFDfffuefBgxPKk8pNeHIyyDKbAjcyeC
 +xwykqy87c9NTnfXW9bfvbR2JPd3+8do1Vn2LXlpOWvMRsZmP4ePOtqMHl8KwRJHcQFc
 wRj7y2fo1xHWXlQs5x7FMpy+leSsxFgUr6d1fWlzDmBCW47njotYA+aEAuCcjWYly1TA
 P5fvzVanrpu100JeMePP42UreHQq+vQIAED7Md7STfUPBvD4P2gQ5HpkvS4Daguv2amp
 tzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732043852; x=1732648652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AtwIk6HkYOGhU19AjHqQe2GTivk7yu3nAfc701TP3rY=;
 b=JoE8T7TrdOp3Jh35ZQjClj0wzVKg9bpWkcoEYb/cfkJhTWKkgxyW5d23BiEPLqZHlQ
 f0mvnMhYVS1geTnQ5miWfWyMkRFvyA9R0KkLYBvivHj7+kVcnSwPdKY5x8XYQstii/HY
 1G0AfOGztJ1kuze+3PhRH2lX1NU68Kwb5EI1RpAaq/pKK2lfi3EegJFc+udlKOtg06w0
 uiu2pjLRSVfiQpsqpSrdSZVKaZw1UCZyk1QdZmdCtqjonv44e5XHmVrK26s6Ib6BVTHL
 nTgjvdh4q/xXNALeYMBcUbMR8YLXk/e4U+0/xE43YdB7lFfuVcIjgSE8s28lRw4ZTl7Z
 KZmA==
X-Gm-Message-State: AOJu0YzjyoxAkYI7PoLPYQiYwxN12WmcTIhIjv5aQtqWn7c9DS92xwLh
 7buhfIFX5XEMtqIMOheRFuuA0dDBK9PWX+W2en3A2biVdTnVfCvVepPsJvw45GY=
X-Google-Smtp-Source: AGHT+IFJ7QTNystlVZ/PA1M42dL8S4Kpg058GD/3NGQH57Q90TlCuRQ2Edmv3MwHWx3o0Zuo7P5fOA==
X-Received: by 2002:a05:6a00:1311:b0:724:5aac:1687 with SMTP id
 d2e1a72fcca58-724bed54e77mr175242b3a.20.1732043852617; 
 Tue, 19 Nov 2024 11:17:32 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724beeb82f2sm24271b3a.35.2024.11.19.11.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 11:17:32 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-10.0 v2 7/8] target/riscv/kvm: remove irqchip_split()
 restriction
Date: Tue, 19 Nov 2024 16:17:05 -0300
Message-ID: <20241119191706.718860-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119191706.718860-1-dbarboza@ventanamicro.com>
References: <20241119191706.718860-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42f.google.com
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

Remove the 'irqchip_split()' restriction in kvm_arch_init() now that
we have support for "-accel kvm,kernel-irqchip=split".

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm/kvm-cpu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index a9680f2447..aaff4a0f42 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1408,11 +1408,6 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
 
 int kvm_arch_irqchip_create(KVMState *s)
 {
-    if (kvm_kernel_irqchip_split()) {
-        error_report("-machine kernel_irqchip=split is not supported on RISC-V.");
-        exit(1);
-    }
-
     /*
      * We can create the VAIA using the newer device control API.
      */
-- 
2.47.0


