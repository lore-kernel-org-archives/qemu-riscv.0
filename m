Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4031C021A4
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 12:31:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmXcZ-0004aV-7X; Mon, 24 Feb 2025 07:31:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tmXcU-0004Zx-FP
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 07:31:34 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tmXcS-0007de-Qw
 for qemu-riscv@nongnu.org; Mon, 24 Feb 2025 07:31:34 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-220d28c215eso64166795ad.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Feb 2025 04:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740400290; x=1741005090; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cSfscRVCfJGOaupLnjlhY6p/zAXuZzDO5Ha2A5lVBLs=;
 b=Vp719NkFB76AJPN0MjS7plT5LOijhEH4gxmwS74wdjv+jDwlzaPo9aPy5jD1+AD7gL
 J5EugLygUwI+7+FfNz9pkwud21wH6TiEenIwO009q0GybdKBBSBAsqb5KNyYReGMeVnH
 +Cm8Lmcgcb9PGFXQHct50IhueZ6xvLVzhPamW503BhXZ8xn6X/dLrRitfbfmzYcTz1OA
 WFMk9s15z/L62N4I4R5e9OfIRaocMxux+fD6sfhpK4A1ItVnpbGbSxoXkidLOsOftyMN
 V+1tbKtzbu6ytxG2GE/uDfYvBa0Ir0dtsrZjIwGDaJqMVDbZhfbtLzBvud7N+l05RBp9
 oaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740400290; x=1741005090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cSfscRVCfJGOaupLnjlhY6p/zAXuZzDO5Ha2A5lVBLs=;
 b=RtxR2fvjFgApcU1TxXu0xOjOjF08hm1JJqjaW6KqpLmF2GVpvKhi+GL1ttKWujHkeW
 LbY1Hh5R77xRzKQMTk1gBLHNqyqqAQbrXw6EL/wXCmFIXkqw1t3dyKG7TLEVBOvDAkDz
 d0BdMNr5NlfHtXWRX+0qoUKc/YTHm5moZIyWb4pBrS4toaHE4uXeg3iPD60vuxMRf4L/
 /mCNVf+PZ3/mAyyu9GKqxn9wz8WJeT/Ow+/QTNgSk3D6slxovRmdzzqTjY1F9yONW++S
 hyX05z0QUEZe9xQ3T4dl7fciFYz+6wygGtgBtz4OlOcASzbZceBa9aoUkJThdIaUJ1zg
 zr0A==
X-Gm-Message-State: AOJu0Yz9NKzJ/gPjf6ar3oCUw8V1hRnUcJRmf5BMa5ymzKnji9eeA15X
 GllX0GLcfq/S0GpwTO8SDZiWjQwxAK4mbELhKf+QqpGogpyCIkmsEx6046dNtgtVGijfQ74/Gg+
 7
X-Gm-Gg: ASbGncu4n16iztfO+MXPRls2bC8Mgx1laak/RDV+jN85gJBcwg/7zVbCzgFwIi89WZ+
 lVBRDG80bp2eEhr/n1gOevLPDLFoMlJ24ADxFfGezmo4JMja8QAu0t2U2WsIUh7L2L6Js2FrK+b
 auf5vHnkOBe/+9l6+w5qtKTy8eUOM6qerSjYgaEnbTju3WoFmhJFCHo2FiyKKPgaP0pf3kGAkuD
 FTod+B8VDJQ239YX6lKVvLoyED+NbWl07eY7yn6NBedDYYQ4SS3ObwLoTcmn8jlEtp7Nc6XOt4R
 2O4o7FsvqBqvZVzx/UzY7lA+c+oMdA==
X-Google-Smtp-Source: AGHT+IElbJQ0HqRhVwrvgEIDn5K06ZY8B3rry8ORAJ2ZqqDWOGUt+E2L2FF9xeEFzOk+TJzRK0Q28Q==
X-Received: by 2002:a05:6a00:3e14:b0:730:7d3f:8c7d with SMTP id
 d2e1a72fcca58-73426d7279bmr20561142b3a.15.1740400290204; 
 Mon, 24 Feb 2025 04:31:30 -0800 (PST)
Received: from grind.. ([177.170.227.219]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73242568af8sm20554470b3a.48.2025.02.24.04.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 04:31:29 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 1/3] target/riscv/cpu: remove unneeded !kvm_enabled() check
Date: Mon, 24 Feb 2025 09:31:18 -0300
Message-ID: <20250224123120.1644186-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224123120.1644186-1-dbarboza@ventanamicro.com>
References: <20250224123120.1644186-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62b.google.com
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

Remove the !kvm_enabled() check in kvm_riscv_reset_vcpu() since the
function is already being gated by kvm_enabled() in
riscv_cpu_reset_hold().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 471fd554b3..19bb87515b 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1606,9 +1606,6 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
     CPURISCVState *env = &cpu->env;
     int i;
 
-    if (!kvm_enabled()) {
-        return;
-    }
     for (i = 0; i < 32; i++) {
         env->gpr[i] = 0;
     }
-- 
2.48.1


