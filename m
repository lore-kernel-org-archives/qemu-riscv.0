Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4721C28B30
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 05:17:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tsxOa-0005iU-AV; Fri, 14 Mar 2025 01:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1tsxOU-0005h2-EI
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 01:15:41 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1tsxOS-0006tG-SB
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 01:15:38 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-224171d6826so42722175ad.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 22:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1741929335; x=1742534135; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cRaJn/P+x+6WN/SFVe2m4RS+pjGn4ofoWNcOqY5FHzM=;
 b=Qf+ojujV4bRovx7QdD4C0nIAuro8HKyRiCqW7FW3gNz3uUJRH8xSGFSEIEYltyxjaH
 WCJZeZ48k/o0VfZ+40bPj9OMcToRAg9we4Wz8bRGi3KKJMlbgu56k6/SDGqQVQc9f+cx
 FOm6czHjPgQobvm45KIrG+GjsT9pD1nQO3FKMy6TuwNwSo4nUQ6bueLk04HSna2VKXwn
 b4H2/NOyN2IYzqbbQpty97H8Zmcup7WukYzwAHGKNXD3Mk+g1h+sppItRsyVkuIyRx6D
 StDtLvImfsjJzdC0gexTjYp+IWCxznAHv9IuUozjjZtD2FqW+7Y1tTKO1i0kPLPZlHbt
 D9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741929335; x=1742534135;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cRaJn/P+x+6WN/SFVe2m4RS+pjGn4ofoWNcOqY5FHzM=;
 b=ovAXLT21Zjl7ZWCHd+MU+/XrPmQF39xmV3HdZqvYOWXN+TlDc3Oy4iLrE16zGZXCp7
 qfKe+SI/YyWxJ1HmJ1kYBU6BgV0BcSF9XQy5sG5/ZciaBDKJ5H//1Q28Kiw6w8z8/J7h
 VPLThVQ/GrGilS1PKvQL2PBd1CCGhjnmEqy1B+oBr18dP3vsKN2UEgaPiE39iGoQwV6h
 DaB+KXIX5Ws7U/tV+sRwDkBMndP/4R7i09iQu5LA9S16Fp0soAXQbLmODLiA7Yq7okXN
 ogmHHoojptZJE+G5X/N+wfIEjZxdklMWzP4fPF/6ASNOu085IxP38Lt5RG2tEskXEeu4
 /gRw==
X-Gm-Message-State: AOJu0YwCLbiQviWGOQ02YkQFhHM4a+mmF5NSC5K+fIdFLPJg3C7b6SDI
 j3N2imnmn+tb22OsFB8Qjj7V/W/sX9WvG25KnF9Wx+7C2vrXoJXXQo8p+dlTVGZ1ZRDmesgTunN
 JMs8=
X-Gm-Gg: ASbGncukFvWQF5jreTpRHSMzMH+5o27PSIE6boXwaqfTVozmPc3OM/YEvBwGC/T2BfN
 BVL1BZ4zkzRb0us7vxMAKYAHI9QybZm5djB/tc3PF7qvJalZUfLbJFzGjq7cu/B7XHD6G7utVFj
 ZbM6nKumXvmS45v0TO7f1WStlitcQjtC/rlAJt4AGRmtUs4knCmbFhyMzk8MtYiANr91MILBwVU
 4W8VxutspQ4eCvkP1cTuvfT90Zt+lYC0YwPSStaVBkhfdHaVIQLnxBAeSK/TEEQ7ItRDmympT8Q
 bgYYd5a2I8n4AHplg3SFyqPM0HMqyBQ4XLHGR1Z8XJCHr2mdXGiIVTw=
X-Google-Smtp-Source: AGHT+IHL3/s1OGomVkiP0UOA6VoDm23gGxk3h1gP2xwWhR/UqusTH5CcSOXaNOeu6s/6AnISrfJitQ==
X-Received: by 2002:a17:902:e5cb:b0:224:1001:677c with SMTP id
 d9443c01a7336-225e0a62fcfmr17249915ad.9.1741929334649; 
 Thu, 13 Mar 2025 22:15:34 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.199.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6bbeb94sm22278225ad.199.2025.03.13.22.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 22:15:34 -0700 (PDT)
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
Subject: [PATCH 0/2] RISC-V: ACPI: Add support for RIMT
Date: Fri, 14 Mar 2025 10:45:25 +0530
Message-ID: <20250314051527.1892488-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x631.google.com
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

Sunil V L (2):
  hw/riscv/virt: Add the BDF of IOMMU to RISCVVirtState structure
  hw/riscv/virt-acpi-build: Add support for RIMT

 hw/riscv/virt-acpi-build.c | 215 +++++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c            |   1 +
 include/hw/riscv/virt.h    |   1 +
 3 files changed, 217 insertions(+)

-- 
2.43.0


