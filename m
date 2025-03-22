Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5700C35FFC
	for <qemu-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 04:32:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tvqWV-0006sc-NN; Sat, 22 Mar 2025 00:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1tvqWT-0006rQ-Vb
 for qemu-riscv@nongnu.org; Sat, 22 Mar 2025 00:31:49 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1tvqWS-0002Ww-Cc
 for qemu-riscv@nongnu.org; Sat, 22 Mar 2025 00:31:49 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22409077c06so37099005ad.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Mar 2025 21:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1742617906; x=1743222706; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OKPlB0EQf+q0uDhRPmBQYgAEjvOxTp2VlgjpWxK8K0k=;
 b=d4lHUN7Qn8fis4aEbP111ccROkPGA2+Qnfjs9i29FZ4QpUtLxmHe8EmlUQPWhNfDt8
 y3l7NNf+p/vm5jn/2ty0QPg5f9oWA6yd2lQ1hSDRMcFg/9ki15yWYbG1NmysW7l+1zF1
 Xk6KNiA8bs/ic7SuiCkyop1f7LGxJz8a6guycxXMkXDFTSntYQiauerH2i7EENukNZVj
 fyivU6UfU7rvF97I9CG+bdlD0J1uNZ+2FgVPZMtnd0MwJixRmccTjvUk+h7f56Szk3IE
 WAX0DS5fv91bLT7apvG0OTr8TaOn7YhDrKOXKvMzs1oERWP/MZEtyWIqeUlxA5NNF5vf
 fqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742617906; x=1743222706;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OKPlB0EQf+q0uDhRPmBQYgAEjvOxTp2VlgjpWxK8K0k=;
 b=jpza17KzJ5QxmXCn5x9CNvB8uDCG6kpcqQB7BE9g2i4CzvdOhEz+8ge9t09AxLxXj7
 /48Hj9+i4ACGi0LklwhrcDyo+94sNUeosXEJVqIYpy66Npy82RI25tyBH2HgqkL1lDCG
 cnTa3CgJ2lgAwYZEwCXflVjMvdVJz3p3Sy3lIDjs1FGNkztLk/vkaEVajZP/3nSdGFdT
 TZCUl6nMAuxHF9V+lxBuxKwOvYZ6n0ftVpgiuTj17S4g4vw/iESFw13XSyvEllnQz2du
 BSeu5gXZOddMhN0KJBm2nRYmBF4Ra0fS2wBZg1sj8/yVlJ1+mNwRbJmQ6pDfSsS2qtSa
 GR7g==
X-Gm-Message-State: AOJu0YyncxKQlEZpy7Tj6LPo4BwEz8eNlR8JpP60adFn/KX8ncWAQSCa
 VxZoRqo4GRbObWQnYcn29FHhK6qdv+dwLLRoAq3X5a+/5W4y1EccvxotPCUEgS1aY2aGtYDFsSX
 bs+Q=
X-Gm-Gg: ASbGncu4LYrw172d7v3cTPx8zuYfrHO+kFPlsXHPfnuhZtGTgojqKkFFaSA2wN6HJdz
 p6ettGtAzec1323rdOTEIKsIvq9F+zaqnudWuO1VHQuqlmVx92EQp7gi2zTsB403XHkkPXDuyL0
 Cr9JCQjR3MUv2K7PnRFylvNiDf3C2I+Hwgv7ja+qmj3kWtfKqIb8ZKqrdXKlzTZCZEelB8UzHZh
 aVkry72Ogzy1yskDvDrLxNWU3fqgbYcy0BzvPBSgzPjUCQYFXhZbvx5GK+jA+WOo7IfUqNszGR4
 rV+XJS/TUR7Cimx6W62qhbWS2u4uTgLo3uLgwsHNYe0RgK6OtyauSvg=
X-Google-Smtp-Source: AGHT+IEBvHBLrpEcblsWPy049oHgchwNvkOnIs0UsJ5bTKW5kUjqiQPomXnfMfR2P3pLAhug2zhcOw==
X-Received: by 2002:a17:902:d58b:b0:215:6e01:ad07 with SMTP id
 d9443c01a7336-22780c551d0mr86504385ad.6.1742617905860; 
 Fri, 21 Mar 2025 21:31:45 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.199.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2278120a5b6sm26824645ad.252.2025.03.21.21.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 21:31:45 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v2 0/2] RISC-V: ACPI: Add support for RIMT
Date: Sat, 22 Mar 2025 10:01:36 +0530
Message-ID: <20250322043139.2003479-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62d.google.com
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

RISC-V IO Mapping Table (RIMT) is a new static ACPI table used to
communicate IOMMU and topology information to the OS. Add support for
creating this table when the IOMMU is present. The specification is
frozen and available at [1].

[1] - https://github.com/riscv-non-isa/riscv-acpi-rimt/releases/download/v0.99/rimt-spec.pdf

Changes since v1:
	1) Used g_autoptr as per Daniel's suggestion.
	2) Added R-b tag from Daniel.

Sunil V L (2):
  hw/riscv/virt: Add the BDF of IOMMU to RISCVVirtState structure
  hw/riscv/virt-acpi-build: Add support for RIMT

 hw/riscv/virt-acpi-build.c | 215 +++++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c            |   1 +
 include/hw/riscv/virt.h    |   1 +
 3 files changed, 217 insertions(+)

-- 
2.43.0


