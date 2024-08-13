Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CE7C52D7C
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 07:14:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sdljT-00078U-UP; Tue, 13 Aug 2024 03:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sdljK-00076i-A9
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2024 03:14:07 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sdljF-0003nb-Hz
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2024 03:14:06 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7aada2358fso924468166b.0
 for <qemu-riscv@nongnu.org>; Tue, 13 Aug 2024 00:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1723533240; x=1724138040; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T+Rd5RFauzSHOwKPVhAADYZ9mLjRHH5UhS+9WA3+1qU=;
 b=ax0ylZ/BcgJJ35VTwSB/HhOeF1a8cB/OG/i4uAQJRJuLQsuvWRo+0vl3ukPSZGOblP
 G5YS9FkX5QXdYDblgDxQPZ7jbuaS4iRejDJEVrEv+6rqPTwFly7iYLU2oBq6dX2QQ9Mo
 QW6Ua4Y76FykPOrbQGAwKKwtIwNzovR+eNjHapNNhXoQ4RmdE5W2/PMJRcW0IVFWuh22
 uV22hZJAFLp8R0YIRDfPojrCYgrzXakCRJnFDKw6CWHt8dnYoDo6oU0ter3+Hw8wnMc/
 SaVw/+vjSFw2g1mH1UKj9wp0RaYEO5cB03u3LOKTSKn+mZwZx1proMgI+PNujL0NtYnW
 mFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723533240; x=1724138040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T+Rd5RFauzSHOwKPVhAADYZ9mLjRHH5UhS+9WA3+1qU=;
 b=iunmb4Bu54EJ+YWYqUnt+2uYt9Z6oAp/CpHGxPudLaapWs8Y4/3Pjhpnlj9Yj+5SgT
 ZN7tEL2cRyhxBsFUYPolqQYzA16oIX2WiOBONtosujcMmAfFgxpZV4f2IG2gNTxH2OIx
 02opfTa/zCOLfBetJ8bJtouF6VanzvVLzj7JLIVQVId5fcRUE60Lt7K8zMnJCjf+9yRm
 s2Mei+hXci4JneBsYISIkxaUmtOBIXJCcKNFTGrbv8cUIqeAP//GCAoOO+H7mZR0e1eU
 ttmU+kR7RSr7vpAOtGZS5r5KY9ug+mU39SxIx4g4du2oJwlV3QLwujqNyVjd1UwRghc2
 Hlcg==
X-Gm-Message-State: AOJu0YzOMrKP0Wu6fTbInXP82mtsYjhbeVxO2sHynJ9NdVo4maTf/345
 RXxeXzSQ5Gxj4JYwWy8jijekNGGT5V0VFZJ+1lw+armxqZc0CXKgHH6GYfc+0MbkNnf7BQs8bBF
 U3yM=
X-Google-Smtp-Source: AGHT+IG0kG4B20g2hWhMHQ2Kll7OpJhahCE3bayYlkc+7Sz11slC6Y+ZwF/yHVqvKG7752+6wmRIQw==
X-Received: by 2002:a17:906:fd8d:b0:a72:7a71:7f4f with SMTP id
 a640c23a62f3a-a80f0a854b5mr189024666b.7.1723533237725; 
 Tue, 13 Aug 2024 00:13:57 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3f4592esm45107766b.26.2024.08.13.00.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 00:13:57 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 zong.li@sifive.com, liwei1518@gmail.com, cwshu@andestech.com,
 dbarboza@ventanamicro.com
Subject: [PATCH] target/riscv32: Fix masking of physical address
Date: Tue, 13 Aug 2024 09:13:56 +0200
Message-ID: <20240813071355.310710-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62a.google.com
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

C doesn't extend the sign bit for unsigned types since there isn't a
sign bit to extend. This means a promotion of a u32 to a u64 results
in the upper 32 bits of the u64 being zero. If that result is then
used as a mask on another u64 the upper 32 bits will be cleared. rv32
physical addresses may be up to 34 bits wide, so we don't want to
clear the high bits while page aligning the address. The fix is to
revert to using target_long, since a signed type will get extended.

Fixes: af3fc195e3c8 ("target/riscv: Change the TLB page size depends on PMP entries.")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 395a1d914061..dfef1b20d1e8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1323,7 +1323,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     int ret = TRANSLATE_FAIL;
     int mode = mmuidx_priv(mmu_idx);
     /* default TLB page size */
-    target_ulong tlb_size = TARGET_PAGE_SIZE;
+    target_long tlb_size = TARGET_PAGE_SIZE;
 
     env->guest_phys_fault_addr = 0;
 
-- 
2.45.2


