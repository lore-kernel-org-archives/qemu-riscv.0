Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCB7C3271E
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 17:35:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sQsGt-0005nf-6o; Mon, 08 Jul 2024 13:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sQsGq-0005eL-8g
 for qemu-riscv@nongnu.org; Mon, 08 Jul 2024 13:35:24 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sQsGf-0007wM-Le
 for qemu-riscv@nongnu.org; Mon, 08 Jul 2024 13:35:23 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-652fd0bb5e6so2829230a12.0
 for <qemu-riscv@nongnu.org>; Mon, 08 Jul 2024 10:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1720460112; x=1721064912; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmgSaVL8dhq5nP6b5OzdsZKAt0sQ4+L9Gnx6E+G/OOg=;
 b=HqepzWbSg9tmDDdM7wOhY0Pmo5s4oIVl2LepvHaP3d8ntDpD8lhavCGvRm3dUXLzFS
 YKSj9I9EFKL3MO6UblujYF09AM29PAIUbqrrsbHjxJmGPiwueei8q/ftDGSi/DPFfJdj
 eR2kuQ2cEBTANvCpbtRD4cp9IizNBBGwg5civjx7vkLB0nPZm8T5GIBzrrIBhZ3zLEO2
 8r8lsMFdwgp+17NDqI6PAI1+teQKNrwqpeOwX9RXkRmw5/pWXGIzht7o1LKCizVpt6nx
 kXcYe7skUUITyjpwBvdyl0q7Nj6ScCfwW7cg2InD7wHup657qbmgQpb8+e3ch9dfPLZT
 +0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720460112; x=1721064912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wmgSaVL8dhq5nP6b5OzdsZKAt0sQ4+L9Gnx6E+G/OOg=;
 b=Qkevj+ZNLt//OBsHQiNPit1Z1tZKo8SqPZxjUVXaVrJQz8i3zsF6Wl8iCVLbFH+iey
 k1GxswYsEHoNOKuQ6YRLok0c8CCYU2dxMzf68xvrKVEUuG4H//ImrM6b9XVieHIqbQcq
 p5i2ZnY9uWsRVKcRPJM+FyLTo+iOOCVA/PDF5XddatdtQLuqA4zWamsrn4I/wV6R7OlN
 +2njLpyVYwQjbRcflV+ABnu6d1e9Ta5BuzABPkftT77erNl6HzezgpOr3+Ho9P3tQfTw
 jLSMjQ2+UT5wj1HpGq0uSzl4p9XmJjSZkC7aMASikXccX8kpv/JWym2i/8za8GLDihQR
 w/qg==
X-Gm-Message-State: AOJu0Yzn2TiSVB9VhpIFzAkx/1H7NFHPJbE994s11osN1+9ZR1Ds1rNK
 0FJTKyo7VXg+1fm/icKYRjn2GH3LJJsoNJJBp209zkaYXAwkpADqjW4DycBFzfs=
X-Google-Smtp-Source: AGHT+IEF4S/Ug02FP2cHw8eSHYhGADMaSO1eafez+93+NAlCfqxMbOGmSbiF+jQZGn/Qi2fSxQJW5A==
X-Received: by 2002:a05:6a21:186:b0:1c2:8d2f:65f5 with SMTP id
 adf61e73a8af0-1c29820b88amr114752637.15.1720460112072; 
 Mon, 08 Jul 2024 10:35:12 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([179.193.8.43])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ad3829sm1153765ad.299.2024.07.08.10.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 10:35:11 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 frank.chang@sifive.com, tjeznach@rivosinc.com, jason.chien@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 01/13] exec/memtxattr: add process identifier to the
 transaction attributes
Date: Mon,  8 Jul 2024 14:34:48 -0300
Message-ID: <20240708173501.426225-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240708173501.426225-1-dbarboza@ventanamicro.com>
References: <20240708173501.426225-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x532.google.com
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Extend memory transaction attributes with process identifier to allow
per-request address translation logic to use requester_id / process_id
to identify memory mapping (e.g. enabling IOMMU w/ PASID translations).

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jason Chien <jason.chien@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 include/exec/memattrs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 14cdd8d582..e27c18f3dc 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -52,6 +52,11 @@ typedef struct MemTxAttrs {
     unsigned int memory:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
+
+    /*
+     * PID (PCI PASID) support: Limited to 8 bits process identifier.
+     */
+    unsigned int pid:8;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
-- 
2.45.2


