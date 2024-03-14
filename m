Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FA2C54E5D
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 19:01:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkqJY-0000wh-Os; Thu, 14 Mar 2024 15:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rkqJJ-0000u7-RU
 for qemu-riscv@nongnu.org; Thu, 14 Mar 2024 15:00:14 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rkqJI-0001Bw-8n
 for qemu-riscv@nongnu.org; Thu, 14 Mar 2024 15:00:13 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1dde367a10aso1049945ad.0
 for <qemu-riscv@nongnu.org>; Thu, 14 Mar 2024 12:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710442810; x=1711047610; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7PdUtes9ZeJi0r/RaS+r6xezQWnZNbnpGDB/vC3+/Kw=;
 b=jEEmYD4DFCU7O4aXkOZocF4O/RdqG/9+HP08Nqc2/DKcvQCpjeUaSWdMY35G0e/V8W
 uP0rxmuJyQFrlLF7ypQXrZh++f2pqAneBLoLbrbTLQ2zf/cisQnriIFT2G44AB+Mq48Z
 ePe4NNnFwa6zWq/rqttkPGS0HfE2SLHJjkARKOeYjfvMBXYfVJAbQntbM5rnWzMhA9vi
 2L9Iwj4UPVEdBlxWC0QiZlThIsB+ABJ0HWOW8dGZzeaCqDuRiTYIMOYMWtznrmmrgqFz
 aEbrKzr6ASeT1xZS7ND8a8M+aubsk+28PPpz4Cj4k9UX1L0gpjROW7kkX+ygX3sJ5qKm
 QWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710442810; x=1711047610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7PdUtes9ZeJi0r/RaS+r6xezQWnZNbnpGDB/vC3+/Kw=;
 b=spvKx178HaQGF4S2WI4pA0RrH7/HnNKd3S177S+MahrgKeo8IV97qNyWv1riRojVAC
 S+DrY5m7EHbFqQHZcDs6fJsh4qD9hno1g/0Mu0jfudOtPJhiDqiVQgazC4xsXWCzQXBa
 s1HmMumrlW7IMP7byBSVtPuXq3D6TI11n28Dp4B0FcJJxRzxiBznBC+PFBt1IRMN6HFk
 0/t08YT5VsEOugxA9Jo44aFLLDq81FgpNby9EQ5b7PSeFYSbnfODUhy/1AIwWtMOsDEL
 YMT6joezKNG2V038+h2xFiRmsZKvZESn4gwyoSrca2mo18ShsiWhIRzeg9UF4ZleAiQ0
 Z7Jw==
X-Gm-Message-State: AOJu0YymEY5B07HBrKCCWPTMHPNVf6DeTZUtn8U+reVk5N/xCaUVFQi7
 CdnNNTYUkSzvBDkjP3V3uA6nI6z5P+0KND5J+KFRao2EwMNejUVnIWDGriBvoJOkWx08xJGRpvx
 YTas=
X-Google-Smtp-Source: AGHT+IFQHmlW28X5dP8uE7vZ3eMNuwm37pY0qeYuTiWzScGee5MtyP3VzZO8uKn4iD58GGZEN/95WA==
X-Received: by 2002:a17:903:1386:b0:1de:ddc6:27a6 with SMTP id
 jx6-20020a170903138600b001deddc627a6mr2193638plb.2.1710442810384; 
 Thu, 14 Mar 2024 12:00:10 -0700 (PDT)
Received: from aryabhatta.. ([49.37.251.185]) by smtp.gmail.com with ESMTPSA id
 e8-20020a170902784800b001dd1096e365sm2105732pln.281.2024.03.14.12.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 12:00:09 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: ajones@ventanamicro.com
Subject: [PATCH v7 4/4] target/riscv: Enable sdtrig for Ventana's Veyron CPUs
Date: Fri, 15 Mar 2024 00:29:57 +0530
Message-Id: <20240314185957.36940-5-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314185957.36940-1-hchauhan@ventanamicro.com>
References: <20240314185957.36940-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-pl1-x630.google.com
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

Ventana's Veyron CPUs support sdtrig ISA extension. By default, enable
the sdtrig extension and disable the debug property for these CPUs.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4231f36c1b..c9dda73748 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -569,6 +569,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
     cpu->cfg.cbom_blocksize = 64;
     cpu->cfg.cboz_blocksize = 64;
     cpu->cfg.ext_zicboz = true;
+    cpu->cfg.ext_sdtrig = true;
     cpu->cfg.ext_smaia = true;
     cpu->cfg.ext_ssaia = true;
     cpu->cfg.ext_sscofpmf = true;
-- 
2.34.1


