Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF750CAC5AE
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 16:46:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v1Sci-0000r9-5f; Wed, 24 Sep 2025 12:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1ScZ-0000nV-CG
 for qemu-riscv@nongnu.org; Wed, 24 Sep 2025 12:45:37 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1ScO-0001XO-De
 for qemu-riscv@nongnu.org; Wed, 24 Sep 2025 12:45:34 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b85so80080f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 24 Sep 2025 09:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758732318; x=1759337118; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fJDjLaqDrT1Kwj06nE5tXpI7qFJWEHwPlMG5H+rhwMc=;
 b=tBhf3S7Vr7k43YqTl/9RnjGVdNQzIpeHEk8sludXgeeeC0OGoaPNAlU2xbR9s9NNVE
 PhLP3ZJdMJpzdtyOpVF4cKannP4Omi2BtDtXGTjTfNCFkLafzZ+RvPUf+2tpoEOK313/
 IDtmXF7iHrurZrhOfzPaX9m7z8Q7AorHgwSSekKsh9rzSWj+idTy7k/HWTKf05uZnY7A
 3VKT6sQQ3HoC1gi2WAtCi4SGEX6Fr4Lq0P1CbjfGxteh99m7su/9De5lpdry1OkKkLID
 R9eHXi1LwHh3rksRt+RCjDaQz8npcaGyAQv50+LQjdVSyvYIvK05eI0CQZ1RKncKWs9b
 Onsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758732318; x=1759337118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fJDjLaqDrT1Kwj06nE5tXpI7qFJWEHwPlMG5H+rhwMc=;
 b=nqHEYjRxK7MfVaiJLWKSoUmTaTcBoPexGGAr+TzGGjybxk7xCbkAovdo701O7L9+Hz
 36F2PMugJRSrfplxLm5ZDKVjdx3jtgvMcNYPX/G4ZGXP6ckpWeC0h07KE7UlkW52VKGB
 22tDa5cbJmBE96ZkAixYwqWSPdJRg0BiBwO5m+iAA6PO6yxmA3KeQYEcYAAmRPOr4zRD
 xACgWlHdNCoHPQuxV/JBLZkhJ7RD4wXgrKz1JghNlc7DxS6hdLOH2V+qAcwQi7w/kOtD
 zMv6QQMNGs2MQNLqaBVAteweO7NtzhvRP0ArX8VeAb8qlnip2F0Cuaj8AfS9Ck2R2Iwd
 URJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNFRDRmrrKf5x4PENa47ELgUOYQTbGVU6FoG1wgfmqzvaBSGxWYwmM9HZJ+feNkIYSEOHR/YGb9BoR@nongnu.org
X-Gm-Message-State: AOJu0YyLsstoBcTRrBNrj3x93vfLYR3oGhqWsDM7behIZIOonn7gDOMw
 ea5HzqnLbUAHfIaj/2J6Bxp1dbvU7AQLHFHwUQGD7C+F56cEw+Zgwr5LcGJ8zfarxGE=
X-Gm-Gg: ASbGncvoTxBjo9UGjN/5mwup5hAQJLBqzDBVshRd5+g3lmXkKr/xO+hTeq/hzHaqseQ
 brTf253SyRvSI0BKjF6nDFpTA0ZLnmPhDynpidUO4FIowdn3Z3effyFbiGGYnQeVVIlajmIC2yS
 gig9y+DHucl63WzCf8ZVe827CiSshR7fUJgLw/r09QBAP0JjvpOHIMI+UrsP9WnU3ULrhw4Mdb1
 VabXyBzyVilcrRM3ohyDQWHruaJL+8+K8aBCplwL5BS/YB8eAw2RFMkSGBArxVBOTRFwp40UcXE
 KKkv7sb3YhYeVNTNrb2ylpmdewR1Yim/e3wteYlcqeCkWTvIogPWQyJgGUbuzpvXqJJ96tZ88mn
 RYpZF7/kyDj+0ZTRYZl6whIIbFoQ1wgcw7iMOhMV0P6v39Y3JByPZIeX1slv2Gu4zbDimJV5U
X-Google-Smtp-Source: AGHT+IGViBzUYt/AwSQi6NlO+9vCYTlKwDsq4C3l/nDiDb3tCHuWf9tjhkSER/fuYDoonnoRgORrOA==
X-Received: by 2002:a05:6000:2484:b0:3f0:9bf0:a369 with SMTP id
 ffacd0b85a97d-40e43b08823mr611401f8f.14.1758732317640; 
 Wed, 24 Sep 2025 09:45:17 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-402188ef7b2sm10187658f8f.34.2025.09.24.09.45.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Sep 2025 09:45:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] target/riscv/kvm: Use riscv_cpu_is_32bit() when handling
 SBI_DBCN reg
Date: Wed, 24 Sep 2025 18:45:15 +0200
Message-ID: <20250924164515.51782-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Use the existing riscv_cpu_is_32bit() helper to check for 32-bit CPU.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/kvm/kvm-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 5c19062c19b..187c2c9501e 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1588,7 +1588,7 @@ static void kvm_riscv_handle_sbi_dbcn(CPUState *cs, struct kvm_run *run)
          * Handle the case where a 32 bit CPU is running in a
          * 64 bit addressing env.
          */
-        if (riscv_cpu_mxl(&cpu->env) == MXL_RV32) {
+        if (riscv_cpu_is_32bit(cpu)) {
             addr |= (uint64_t)run->riscv_sbi.args[2] << 32;
         }
 
-- 
2.51.0


