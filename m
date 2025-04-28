Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027EEC369D5
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 19:25:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u9U5F-0003jp-1D; Mon, 28 Apr 2025 15:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9U5D-0003j8-CH
 for qemu-riscv@nongnu.org; Mon, 28 Apr 2025 15:24:03 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u9U5B-0007P5-Qp
 for qemu-riscv@nongnu.org; Mon, 28 Apr 2025 15:24:03 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2295d78b45cso74941925ad.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Apr 2025 12:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745868240; x=1746473040; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5nQvphfEuGeh2n9SYU8tx7Ki7baxefxZJJlRlKKLmGY=;
 b=G3GBfRpHnv8BI6cNuR+F0RglBZ7SabogtvUXf0/UmwZBuQyr/DCcr/p1QW6PStkTD6
 rVylcxe9TOVMdy9DdknGKlyA9tg4bPqTqSmT3w7u1ipjMmuatYM/khcJRDIGHcRiEnfj
 0p2AYn34Ze9fTzNu2lJL3jigpUWmZ16Z/W/GEiIFGwd6MNSxsYy5mpntHvlnd0sAnFOe
 mZx91ZntEGAzAPGyiicn9D5mtghEE4y76CzFjeVu/hRehoXdonuyzsREQb/1EM27r5uz
 30Sa7jz9kqTBN8h/fkRqmR2nRPuf/JPBf6AwUWez8W4T2r2jdQeIdCJJQ0nTg9GIgEI6
 u0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745868240; x=1746473040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5nQvphfEuGeh2n9SYU8tx7Ki7baxefxZJJlRlKKLmGY=;
 b=aFpr8fWb9WzyAQQRgDzm2+uHjN8/tp53ShBSbfyE1TWxjTw84AqGvcJaoozNwzV9rP
 9bHObyikWHUd0EzHcXj1GbaxkXq21GFej9J3WW3L5t6uwSlPcbg/gucu86HsflrYLXQW
 2ag095o6Z8F7eLFx8KBQnvCfEaiO0O7rWfQSwtpcy0Xl/TM40l4wlodF4L4/3kvCyWaf
 x3B38GYvTKaxvfci7+vjsdoYZoUZ2Ibc2ieUEQyjKAOIO2XNcYwxNJhSa/aOnCnmLtUu
 fdmc1bi23gBS9N1KiKls9Ml6Ta4oopKDZAZYMC59BtHOWGok1gPHp8uhaKxWMPl4IU1/
 uUwA==
X-Gm-Message-State: AOJu0YzDQG9VBGjMn95Gp71DUn+v9crQLIeWa6R7AIgSotbNyubcBszl
 obORzJ0BKl8yaC2zfHQZ57H5G3KyC0zeSVYHPVvAnTJxBeP/GmDa1Rb1TWfIhuEZ09DPPDy8PQw
 kD/E=
X-Gm-Gg: ASbGnct19FdYJ5/aqWsNGc36EGmFYjV3rXv07Yv0dkVsvrtx24QVAGf9Tkv73kXd8Gs
 aIlYmRW0MqxE1qNGJ/kK6RuMgU/Z69Se9fR5DmJaEAVukrmgC8IVrkwh1ipyXB/CPAf8ItX0GXh
 l4+dJ4Pg6/FeC173/D5Lbza8Uo7w/y17ylTVf9SL5VL23ToqIjuZQG2G+JMcP5UBeGeySUZNgfG
 yFpEP5HpTQaaija6+Uu573pwok/mARDr+oMtwfqKlESzaELWGzLSKt4XWYapG2rDk/hTC0ncdC2
 ZFdZaTkoR2Ua4bDlw43uKLZNj9SnG3AQdpr8v5X33ZFDvr9VdU++qLA=
X-Google-Smtp-Source: AGHT+IFO9/zjGz3SGatZpzmrZ+jY+EELMNE7T5WfBF2gOT1OUMsndKGSUPQW9i/qU/ct7w7WXehG1Q==
X-Received: by 2002:a17:902:ea03:b0:220:be86:a421 with SMTP id
 d9443c01a7336-22dc6a68648mr164813055ad.38.1745868240530; 
 Mon, 28 Apr 2025 12:24:00 -0700 (PDT)
Received: from grind.. ([2804:7f0:bcc0:906e:57d5:dca2:1ab3:20de])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4db99d3sm87300565ad.53.2025.04.28.12.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 12:24:00 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 9/9] target/riscv/kvm: add scounteren CSR
Date: Mon, 28 Apr 2025 16:23:23 -0300
Message-ID: <20250428192323.84992-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428192323.84992-1-dbarboza@ventanamicro.com>
References: <20250428192323.84992-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
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

Add support for the scounteren KVM CSR. Note that env->scounteren is a
32 bit and all KVM CSRs are target_ulong, so scounteren will be capped
to 32 bits read/writes.

Reported-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 53c34b43a2..209fe769df 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -251,6 +251,7 @@ static KVMCPUConfig kvm_csr_cfgs[] = {
     KVM_CSR_CFG("stval",      stval,      RISCV_CSR_REG(stval)),
     KVM_CSR_CFG("sip",        mip,        RISCV_CSR_REG(sip)),
     KVM_CSR_CFG("satp",       satp,       RISCV_CSR_REG(satp)),
+    KVM_CSR_CFG("scounteren", scounteren, RISCV_CSR_REG(scounteren)),
     KVM_CSR_CFG("senvcfg",    senvcfg,    RISCV_CSR_REG(senvcfg)),
 };
 
@@ -703,6 +704,7 @@ static void kvm_riscv_reset_regs_csr(CPURISCVState *env)
     env->stval = 0;
     env->mip = 0;
     env->satp = 0;
+    env->scounteren = 0;
     env->senvcfg = 0;
 }
 
-- 
2.49.0


