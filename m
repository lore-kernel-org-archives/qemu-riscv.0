Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF82C19F32
	for <qemu-riscv@archiver.kernel.org>; Sun,  2 Mar 2025 13:58:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tojqB-0001m1-F0; Sun, 02 Mar 2025 08:58:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hemanshu.khilari.foss@gmail.com>)
 id 1toiVF-0007Ev-GO
 for qemu-riscv@nongnu.org; Sun, 02 Mar 2025 07:33:05 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hemanshu.khilari.foss@gmail.com>)
 id 1toiVD-00087T-9G
 for qemu-riscv@nongnu.org; Sun, 02 Mar 2025 07:33:04 -0500
Received: by mail-pj1-x1044.google.com with SMTP id
 98e67ed59e1d1-2fec3176ef3so2698563a91.1
 for <qemu-riscv@nongnu.org>; Sun, 02 Mar 2025 04:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740918781; x=1741523581; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I717ThhCHMHXaLzr82CQoevh9Tv9rqnCvSSdwP9fxSI=;
 b=RPaplD0ri68wQS8Jvw3m5WkmN95CrQFym235eO+/+VzZ8pS5frX/EfvMOqMj2Gtbci
 2HBlODqzjCfT7CQQ7ZqPKkyEnO7x27kDfS4E5XiyquhoqcFhHFuUVy4NKkLtAfiRktoD
 8idj+jmUdADJrupIcEcsent9U855cNcrAwUSmoe2dvBFKtjhTJ2PKRsBaEhoTSgCLQrp
 YpQLFEdFib/a2q6Jm90sUSdhOKPSZmImNyZPM+CvRfH3CtwvHFScRbM/y3Md9zJkM/RX
 +Tnk7ji1YXQ2+MJ7umCcnD436R8mjheum4tggv28Pg4+YK2I4ZUsSM2V/4wRWMTnGGku
 cWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740918781; x=1741523581;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I717ThhCHMHXaLzr82CQoevh9Tv9rqnCvSSdwP9fxSI=;
 b=vVhJiOVGV3rwWIcLatvmzX14H4E97o1Z26RmLdksyvH6kU5kv32eRpF3FJojP5v44m
 qTjwX7J4wSVM7xRXdYaCdqzd6vJwtk6p068AYwtsIwBl7GKGVLsg0GwLgQPKgGYZgbCK
 FshNGc2fScY2PLA+VVBY0mgXgD+EfT4fLHDzNf6IfZi5heghME8o6ITzXZRfAn0oZ7Af
 FvVT651kCM2n8BVyYXGSo7tXv5sh6dOQolYOVHO2oy9YsMPEI/OXwuZ7Ah01gFEbhmQJ
 VdPg8ftSvjSyMe2/VUHuHOJwMGIV5Gl/OExWY3MyncSslYMyANMiA1ZA0fwDtuta9DMJ
 iSww==
X-Gm-Message-State: AOJu0Yx8ZSoz2eaILsAfJt8QzBigQncVMtl8u3lAprGARFY2xrDPtulB
 3tp9ZzpwpLLszX2Av4lckGh51J9JAyWd6MvyE1/8UOAy3w2Zegg7
X-Gm-Gg: ASbGnct8mQ77ly27YdZGwZ1NY+KvEZffG7UTVzuTPvp5p38MrUeQ8ywiKIGfCwajW1g
 Ibfq2ozzDfslYkADRZ3QuLkAhdzZ+HN9t0VpaW+cJvQt3rwJ6MoLXLuWZbg8F2CV5ayEDAV/6c7
 7uRTIuBqVyBo/913wF5t1cLHOLN7vnBJu/aIdHURImXuXiLdQscCtamZh11Ov/RlAtgGotqrzSj
 oe/lyPCRTrB687+sguQiRYQ4UI/8RYLGJnHPHMVZyNht70mkAHCKZ2VkJLy7f1urU02ONsyO1iG
 CVOKtZII6jYmprVVHdp9Udkv9yhwyIlk5npsrdpqxZQX6nZKU2+/dUG+6qrMChq/egyMjFF7hg=
 =
X-Google-Smtp-Source: AGHT+IE8NzDI16Du80QWtgYYGwUaUEi0J85q4ApowGaGoKpD/8TNQS6LnlWbpa8ujegNdlDlgbFH0w==
X-Received: by 2002:a17:90b:1645:b0:2ea:5dea:eb0a with SMTP id
 98e67ed59e1d1-2febab300damr14418218a91.4.1740918779682; 
 Sun, 02 Mar 2025 04:32:59 -0800 (PST)
Received: from localhost.localdomain ([160.202.36.167])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fec63c0cfcsm4169897a91.17.2025.03.02.04.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 04:32:59 -0800 (PST)
From: "hemanshu.khilari.foss" <hemanshu.khilari.foss@gmail.com>
To: hemanshu.khilari.foss@gmail.com
Cc: qemu-riscv@nongnu.org
Subject: [PATCH] docs/specs/riscv-iommu: Fixed broken link to external risv
 iommu document
Date: Sun,  2 Mar 2025 18:02:45 +0530
Message-ID: <20250302123245.24568-1-hemanshu.khilari.foss@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=hemanshu.khilari.foss@gmail.com; helo=mail-pj1-x1044.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 02 Mar 2025 08:58:36 -0500
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

The link to riscv iommu specification document is incorrect. This patch
updates the said link to point to correct location.

Cc: qemu-riscv@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2808
Signed-off-by: hemanshu.khilari.foss <hemanshu.khilari.foss@gmail.com>
---
 docs/specs/riscv-iommu.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/specs/riscv-iommu.rst b/docs/specs/riscv-iommu.rst
index b1538c9ead..772145e8d7 100644
--- a/docs/specs/riscv-iommu.rst
+++ b/docs/specs/riscv-iommu.rst
@@ -4,7 +4,7 @@ RISC-V IOMMU support for RISC-V machines
 ========================================
 
 QEMU implements a RISC-V IOMMU emulation based on the RISC-V IOMMU spec
-version 1.0 `iommu1.0`_.
+version 1.0 `iommu1.0.0`_.
 
 The emulation includes a PCI reference device (riscv-iommu-pci) and a platform
 bus device (riscv-iommu-sys) that QEMU RISC-V boards can use.  The 'virt'
@@ -107,7 +107,7 @@ riscv-iommu options:
 - "s-stage": enabled
 - "g-stage": enabled
 
-.. _iommu1.0: https://github.com/riscv-non-isa/riscv-iommu/releases/download/v1.0/riscv-iommu.pdf
+.. _iommu1.0.0: https://github.com/riscv-non-isa/riscv-iommu/releases/download/v1.0.0/riscv-iommu.pdf
 
 .. _linux-v8: https://lore.kernel.org/linux-riscv/cover.1718388908.git.tjeznach@rivosinc.com/
 
-- 
2.42.0


