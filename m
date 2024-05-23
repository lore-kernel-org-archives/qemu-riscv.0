Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91103C25B75
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 May 2024 17:42:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sACRP-0000wi-7t; Thu, 23 May 2024 13:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sACQW-0000Zg-AV
 for qemu-riscv@nongnu.org; Thu, 23 May 2024 13:40:28 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sACQN-0001Su-8U
 for qemu-riscv@nongnu.org; Thu, 23 May 2024 13:40:24 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1ecc23e6c9dso121672135ad.2
 for <qemu-riscv@nongnu.org>; Thu, 23 May 2024 10:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716486011; x=1717090811; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z7l0hoTJ7iFjvbNzeKREC+Ij2HQdhAEwhnOBTbzD//A=;
 b=Jw5Q5NUhM6CSk/W2UDIiNiHgTOTQcsdjpZhIyoF2SpG179lOiOHCUOg8lIfX28FMpu
 MJqXdoFxXmMovVXbN7QPY5Ycci2zKLHaSDsq2MTP9gC9B8kyqxkchlw46fXlSyyE6qb9
 LWelQFpJ1ebASLDMc5hBikDWwXQJ/kQ7xEKjZ30P4tva6FZqc1Lg+bG+GPUdqMQM+mcQ
 VFxt34TPPbf0ag3xcUPMajy5/zZ9KoLaqHJXHgG8uNhUs2XAZMyc7zWgP3xMCZn5dCWZ
 FZReiYGylLmfSrX2891pG/AcyGE/5ii0DgVZUHPUEx05mtSg3Vwpq7hrc2oICVUax7k9
 cjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716486011; x=1717090811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z7l0hoTJ7iFjvbNzeKREC+Ij2HQdhAEwhnOBTbzD//A=;
 b=qcAIBcZclegn6wto4AyzKY+T3biapbrsu64RnIB9YNKQcCxXyY9+HYbi7t7pU7J0tw
 1HgexQ8rA5Hzrq/MZMaAvEG8QpqYjIm53rAuI+qFhMwtDLFkLZCwxBaI0fys1Uk4isma
 eVbvbgqJvseAgvvdJNEgIIFdY56Wi50h2FWFWKTSq1QPTVli6gTt1Xpm5Z48wgQzvWoH
 LYnoSyB+6jdFjlYxparQACM0XoJfQT4DR26C4BxVQvbbDOjIREVyaA5FTj4xu8iKcrPn
 Wduoaqrnyotq9eRow42IwLbUOwVddoaaS5++MY1tYFFEha49GKvB9X1FM6xnCEhHasW3
 Iw2w==
X-Gm-Message-State: AOJu0Yz/jA6NR/pKOL1yTIDJAEw7yxrrHpS0AJdCeOquIhsf+2s/f3hh
 asQKDpIVJJnHNjY4NWBRm34cQwJcgpxObv4woR5mp/Pvx9C510owTcVklDqluGY=
X-Google-Smtp-Source: AGHT+IHwDCdkGx4u9n3TkQ0Mn8M9WQ6mIRZMjon5kyrtc2cIz8DO4nd3iok1Q3A8zNkiDQrZ0RQWrQ==
X-Received: by 2002:a17:902:ea0a:b0:1f2:fd9a:dbf3 with SMTP id
 d9443c01a7336-1f4486d1fa4mr27115ad.11.1716486011313; 
 Thu, 23 May 2024 10:40:11 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.42.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f2fb4ca0ebsm81246535ad.119.2024.05.23.10.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 10:40:10 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 tjeznach@rivosinc.com, ajones@ventanamicro.com, frank.chang@sifive.com
Subject: [PATCH v3 01/13] exec/memtxattr: add process identifier to the
 transaction attributes
Date: Thu, 23 May 2024 14:39:42 -0300
Message-ID: <20240523173955.1940072-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240523173955.1940072-1-dbarboza@ventanamicro.com>
References: <20240523173955.1940072-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Extend memory transaction attributes with process identifier to allow
per-request address translation logic to use requester_id / process_id
to identify memory mapping (e.g. enabling IOMMU w/ PASID translations).

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 include/exec/memattrs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 14cdd8d582..46d0725416 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -52,6 +52,11 @@ typedef struct MemTxAttrs {
     unsigned int memory:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
+
+    /*
+     * PCI PASID support: Limited to 8 bits process identifier.
+     */
+    unsigned int pasid:8;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
-- 
2.44.0


