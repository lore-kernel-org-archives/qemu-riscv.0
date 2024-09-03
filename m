Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27B7CD37AC
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 20:19:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1slZxH-00045y-IN; Tue, 03 Sep 2024 16:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1slZxG-00043v-VQ
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 16:16:46 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1slZxF-0004Oz-Fk
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 16:16:46 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2053525bd90so28845395ad.0
 for <qemu-riscv@nongnu.org>; Tue, 03 Sep 2024 13:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1725394604; x=1725999404; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmgSaVL8dhq5nP6b5OzdsZKAt0sQ4+L9Gnx6E+G/OOg=;
 b=eeHlHTthbQ57VvVpdiARffVNrW26mkKLwIu4ZJsYysiVoXvvj3Ddb3C69LkHSoatU4
 M2ATA+fi20HnatDXvdZVSHRKdOWcQ97kilDQMKjfCOOLofSoTkhhoru/tmaJQ/KKR7Fj
 1CY3VnFjpWUekMtB0xK01HdjWZrBZqDbSLX53BMKZol3brj/x4BhznDTpWqdlvjlLBEp
 GydwR99PtTwiEniFi85sp47gL/R29GGNwoT6Y5RSt8uQVj8YcQ2X8wCDJt3kYBHM8IdQ
 V7SMIQe0qulx8tTY+z0OH937KEKTujxab4SAWgZgbZ4l8QFIp/uGNh9AYTxHZToKuBbA
 AkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725394604; x=1725999404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wmgSaVL8dhq5nP6b5OzdsZKAt0sQ4+L9Gnx6E+G/OOg=;
 b=rIj3DSb3cKV+1suu0qbAgao5fgrydWoK6/yUwsMVWNjRW58bOrYBtqMSRQjj7hHyNt
 Ysvgi5jRiKDXs/z0LR40OpX15paDusPWuaEvsWIx+V5D/KFdsbfVdsZmhoqW1UXzQg5K
 fxO6bDZXJSK3gsM3uZoRW+mKSs60OZPQ8sZaFSc8zZPXH+KCzY+3aYYaTxpplzTmmkBT
 nQ9Cg3nk/e98uk8f066WTmbw2YCteAhi1/GtX8kGuUCY7ok3YSY/8DhIULv7iCEkfgiY
 kbiDxyM+u3+IOwRrr2hdv5K+iNhCAh0cq7uc+lQ/AhXrXH6PtsGkgP0t5azELl5WoTff
 46TA==
X-Gm-Message-State: AOJu0Yw8xAjpruXj8KM7fPBI++ecpzvnZ5fGe73r3oSy6k0yNJYu0vm3
 NLeLaIoN7jPSsTtzqoTuThQnzpXiAj5YSJQcuse/Wuy/YckvDOpCglzghw/l6co=
X-Google-Smtp-Source: AGHT+IGBMtSKH4L/TYTxOSRldmppXXru6UH6XYsqPaVcdDl9/6kE0Vc+tzmA1UlsVS/jvVgOeif+yA==
X-Received: by 2002:a17:902:d2c9:b0:1fb:6d12:2c1c with SMTP id
 d9443c01a7336-2054bcbbec8mr130431685ad.19.1725394604103; 
 Tue, 03 Sep 2024 13:16:44 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.170.227.130])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206aea531b3sm2189745ad.216.2024.09.03.13.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 13:16:43 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, tjeznach@rivosinc.com,
 Frank Chang <frank.chang@sifive.com>, Jason Chien <jason.chien@sifive.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 01/12] exec/memtxattr: add process identifier to the
 transaction attributes
Date: Tue,  3 Sep 2024 17:16:20 -0300
Message-ID: <20240903201633.93182-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903201633.93182-1-dbarboza@ventanamicro.com>
References: <20240903201633.93182-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
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


