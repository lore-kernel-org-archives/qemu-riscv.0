Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C000BC7EE25
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 06:00:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7VAZ-00052L-9r; Fri, 09 Jun 2023 02:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q7VAQ-00051j-ST
 for qemu-riscv@nongnu.org; Fri, 09 Jun 2023 02:00:14 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q7VAL-00084z-IB
 for qemu-riscv@nongnu.org; Fri, 09 Jun 2023 02:00:10 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1b0201d9a9eso3701175ad.0
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 22:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1686290397; x=1688882397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tLPcWrtRfCz5nO3qFeo6K2+fYdJKnqPcG3F0SPk7oGY=;
 b=eZOkliN+WBsLqBPxzYHaWpDTWuIYb3VR5ZecakMKxxUO9+ttpDA0222bCEI4j769FA
 g+8Ri+5v2vsT2Ju4qgECbqpBQTDxoI/bRfwKtYhuGBZoZ63SB0pAKBOnf3DZYrWsVMYP
 Mu5o5CvUwu6p7YO6YiGJUhwg5Ep87gCCWGy8pZjR8GVjRXpcMfZrnpCl0ROhPHawLj9S
 H3DuHPR/R1c8qWXyIcyO8rSwawRarC7fq2ZvyuLy+Zmpvumwi6g/lV3hzmy/vMSvyK2Q
 2nnICS5Vktb+R9IUm7vxaOTkg49OlBp/Z+7DWnyXXmX6V0IDIVsaiK0s6S7yBfZ4y4nm
 RYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686290397; x=1688882397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tLPcWrtRfCz5nO3qFeo6K2+fYdJKnqPcG3F0SPk7oGY=;
 b=hC4xiEYweax3Ip6F9islh0ugKWOx+Owd56Ezof2kwtWx8b8jk9+AtxqsspyBMKdvX2
 9QpZu29jFMeaH7IXsw9xiBnuDVq8AYDUBZhljImYxQtgOTGcKU+8Bs/IoHcb0W0tlQGd
 h/1C0p858hA6QXiBjrSfLCfXSfPzJHqAb92h/gfeouQxKJKFnDYx2IKbsse8+at49mgB
 qpY3S1zNjEDqdUM7211jOzzwT6sZQGetCqiFiKnsKSIfRqxlC6gB8o5fN75tDSHBPtnt
 8ll4BY2mlpYkHpSOHYR7/39Z3fQntI8HN9m4r93l9CxzwatE9ac4YkPlWJzwg8HJx59m
 wAkA==
X-Gm-Message-State: AC+VfDzDwX+Nnzg2/Xzw0Dg4wSIconLkQDvSrLHhJjYEaEJyfCBKkJyz
 PEp9cbLq2PQuXX0Irn5TE280rg==
X-Google-Smtp-Source: ACHHUZ6qtKvJyGUv9HQ9YJZ+ZO2SSjDz2SsLv714JaSL4mE9D7QuhOtkRYVz4dZLQgkjluMlm0AzuQ==
X-Received: by 2002:a17:902:e541:b0:1b2:5d90:fc3f with SMTP id
 n1-20020a170902e54100b001b25d90fc3fmr1035563plf.17.1686290397381; 
 Thu, 08 Jun 2023 22:59:57 -0700 (PDT)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 jg1-20020a17090326c100b001ab0b2dad2fsm2348353plb.211.2023.06.08.22.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 22:59:57 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Tommy Wu <tommy.wu@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Ivan Klokov <ivan.klokov@syntacore.com>
Subject: [PATCH] hw/intc: If mmsiaddrcfgh.L == 1,
 smsiaddrcfg and smsiaddrcfgh are read-only.
Date: Thu,  8 Jun 2023 22:59:33 -0700
Message-Id: <20230609055936.3925438-1-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=tommy.wu@sifive.com; helo=mail-pl1-x62a.google.com
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

According to the `The RISC-V Advanced Interrupt Architecture`
document, if register `mmsiaddrcfgh` of the domain has bit L set
to one, then `smsiaddrcfg` and `smsiaddrcfgh` are locked as
read-only alongside `mmsiaddrcfg` and `mmsiaddrcfgh`.

Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/intc/riscv_aplic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index afc5b54dbb..4bdc6a5d1a 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -688,13 +688,13 @@ static void riscv_aplic_write(void *opaque, hwaddr addr, uint64_t value,
          * domains).
          */
         if (aplic->num_children &&
-            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
+            !(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
             aplic->smsicfgaddr = value;
         }
     } else if (aplic->mmode && aplic->msimode &&
                (addr == APLIC_SMSICFGADDRH)) {
         if (aplic->num_children &&
-            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
+            !(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
             aplic->smsicfgaddrH = value & APLIC_xMSICFGADDRH_VALID_MASK;
         }
     } else if ((APLIC_SETIP_BASE <= addr) &&
-- 
2.31.1


