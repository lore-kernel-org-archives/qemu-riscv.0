Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E824C2BD09
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 20:19:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sLq9H-00044v-J0; Mon, 24 Jun 2024 16:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sLq9G-00044e-DQ
 for qemu-riscv@nongnu.org; Mon, 24 Jun 2024 16:18:46 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sLq9E-0003d7-Rp
 for qemu-riscv@nongnu.org; Mon, 24 Jun 2024 16:18:46 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-70670fb3860so1550887b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Jun 2024 13:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719260323; x=1719865123; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KXZEaW8kJ9wYM42MqQ/SuBXV/YuiRmuYFpGffR5Igkw=;
 b=cOtSypwlxBOTbAmpI9vJNipzrxKS9SpaNF43eUP6Wc/vQ4vhBMHZ9QhIS9b524vu87
 VU26VNdPUlkzvvTgwFHJZg8DbbJrgjaanj4uRpaBu4EzLC4rJEJJsg0ixz8Y221TXO49
 dmE8Xm4t1RHW8wA9Oi9CPzCp2npwlDwyXAmQ+g/rpIX0DrnocFlxivTVfgZDz/LGrs65
 jfYjAFY9uuMmup464bnitnNLRf5VodKAh02FyfyYg7zSkhyzrRvPDMY8yB1AbxA9D4ni
 gm/AZ8ODI/IJQw0UlN5+o3LEBApgrxL3hU//y1C0jahlefytAgaEvkvLFvQ/plMIcB2z
 3Iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719260323; x=1719865123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KXZEaW8kJ9wYM42MqQ/SuBXV/YuiRmuYFpGffR5Igkw=;
 b=gaHAZcux6nPvSD9wDVSQyKyzfC17Ht0sv3rR7x/Ky3EiAcDYjEdaGBZ/sQonSargz0
 D4lzzWIk5NWW5uSd5JanxtdC9mfAttpkhlBErbne4An+yHeAbAUZ5DxPX1GFhutgDTSd
 K+SiZyWLUTtWnNSU653h23PLEQXD0MX8TLvvf5iMkluZsZE4OTt48KyH8wFYecVf1iXj
 nx0LFJ/9d4vDkfqUX4tV/vhfZbyUTv1qu/jClpUcOjA6itsnXhraMUTNrHS46a6C9DcL
 eeYr2eilCkoo0UZLk29eVLWsPTlM8u/5U00FlMUW+iOZIHEJvnwijK+0B68/tkhDtzmE
 vNng==
X-Gm-Message-State: AOJu0YwRJ0gU+aUx5mAGnzChjXxtpjg9X3VlyKRqQEFi5V6a8V8pOPvy
 2wcOknlsplF6ZBa33yj1GN3dNsTB+jIeUV9Sgmgtmi3Tw6vCnUm2j/TRZr4kTEKz49Hw0+TBXJX
 Q
X-Google-Smtp-Source: AGHT+IGTAY89UC17S9mC0+1DNZnvIXqIUSU002QZA69tdglSGfRMm//MpbGFAuWpNaxc4fXb9vJVmw==
X-Received: by 2002:aa7:9a5b:0:b0:6e7:20a7:9fc0 with SMTP id
 d2e1a72fcca58-7066e67aab7mr5041362b3a.34.1719260323337; 
 Mon, 24 Jun 2024 13:18:43 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 ([2804:7f0:bcc0:1aea:63a7:288e:eb77:fe54])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70688f2d76bsm1927091b3a.41.2024.06.24.13.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 13:18:43 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, tjeznach@rivosinc.com, frank.chang@sifive.com,
 jason.chien@sifive.com
Subject: [PATCH v4 01/14] exec/memtxattr: add process identifier to the
 transaction attributes
Date: Mon, 24 Jun 2024 17:18:11 -0300
Message-ID: <20240624201825.1054980-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624201825.1054980-1-dbarboza@ventanamicro.com>
References: <20240624201825.1054980-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42e.google.com
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
2.45.2


