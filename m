Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F3FC87FC5
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 11:04:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uetk7-0007Uf-AO; Thu, 24 Jul 2025 07:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uetk2-0007Fr-HN
 for qemu-riscv@nongnu.org; Thu, 24 Jul 2025 07:04:03 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uetk0-0000YD-Bi
 for qemu-riscv@nongnu.org; Thu, 24 Jul 2025 07:04:01 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-748fe69a7baso770936b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 24 Jul 2025 04:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1753355038; x=1753959838; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hBMx1ZFliy34yrVUFuRLjpCpKWV+U6kEM0DDy4g1qqY=;
 b=Uo4QNjRBPa0HBdpcPF0LcgdFMRZxR9ueg6+3/HAHeo7WOXFM2cY9jnG1ymGhIzvw06
 Q8ByWypKEY4tFEzBECeb0jm12zWXVbAAOFi9IXtV7gOEtjo3myOu1g5yzPvOybBX+v3p
 //CzLX0kT37ByakkdTYQG+JEEih0IM4spHawgJjOYKzB5N0ysYRTdR2TMKwft/VEmaut
 8zNHr1XXzsQvsfvv4E1wA7JckBgamV8I4Hg7/9tviSUkji9K0dk3xAAgrNlkXysI2gLU
 Pt8OA2Duz5Ofiz63gcL8m5WiLSeKDILmeU90dI9RVSM5dp1D/m70tTZIy4dmxRyzBKGH
 Dtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753355038; x=1753959838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hBMx1ZFliy34yrVUFuRLjpCpKWV+U6kEM0DDy4g1qqY=;
 b=Uk37wtHKhOnb5pEQb0m6vEdObS3SCL2lKdsELgWg4YHkAKhQndcYePrWyXW31kFLot
 P1rvc73udDQINdmGe6SmzTEeY0MlmWkK+ol/Qgcc7iTGIieS46UImBPU/zaA27oeJJ5M
 ha2USJ6UYclxnFXXLagCnWd/7xWgOvE/Hg4iV82JaPrwf5OOAQBdn3ob8zTNoKtsgMcH
 JFhupbJaymHAodChITwDC7hRDmz3bpXsmqOl9lyr6LCab8Nq0t4YEpUcH+JMoItuFK8C
 AqYN/BIDBt2hgjIBsSYkaNjbh430Bf93jrTDav5oqOlQMbuDNj7mSa0LYMxhQ4DDVFrJ
 0AAA==
X-Gm-Message-State: AOJu0YwLeroq+5dUcso+A5rih302FCFVrSJaaz0QrhZKbRYVkve+KYaN
 MwXa2t8PXUEndlVhMUeU2HTYUNSVM3AOu/4o68wxEyjErpkEm848yabcQUfUUntTdVOdPBhu5Va
 RSCC+Tbc=
X-Gm-Gg: ASbGncvedgb6XjG2UF4liRSX3giWFakeuI8twoZ3Pot177M9k90Q0DCx+4KpZo0jKdH
 btFmjPOaMujKztabPkzXI3HqjU5BKAxoMCNmI0Bz/zv6JIPhJcEpLVGyHI6uSFi0YpXQLcQShgm
 LrOfLAkk8eiVE/HfkQx/IY5hVtMitQC/ov8nuqb3d7qxty4M6q4sitT46UQ0+LfBA+MP5u1xIHg
 gWV3vNs/SsjLR9b+wK/pTH4QpyHoYXFd3x5mjmbzmP+QITJPEp7z4R4P94T+nPJO2oeqXsA9b5q
 jWQDyoZfY3HAMX10sxemg1FqpdRWVAry93/aVM51gBCRhSY2gFSM5trgWpqU9ZNud2l3AR0okrQ
 7VjpPdUeWvpCBr2cOg1Fc1WTnWJTJ1kSGhSI7cwNtt3D/b78R
X-Google-Smtp-Source: AGHT+IF/Q3qUB3u9FBCxsaqywOnvvPhKV2G6wFV9t7+kZdgbV/b5sajpx6NG5lGc25YqdoE20XRP+w==
X-Received: by 2002:a05:6a00:22d2:b0:746:227c:a808 with SMTP id
 d2e1a72fcca58-760367de961mr9472647b3a.24.1753355037942; 
 Thu, 24 Jul 2025 04:03:57 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.219])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-761add64fd1sm1430578b3a.13.2025.07.24.04.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 04:03:57 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v2 0/3] RISC-V: ACPI: Update FADT and MADT versions
Date: Thu, 24 Jul 2025 16:33:47 +0530
Message-ID: <20250724110350.452828-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x436.google.com
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

Since RISC-V support is added only in ACPI 6.6, it should adhere to the
expected FADT and MADT versions. Update them.

Changes since v1:
	1) Updated code comments to reflect ACPI 6.6 chapter number.
	2) Added Michael's Ack.
	
Sunil V L (3):
  bios-tables-test-allowed-diff.h: Allow RISC-V FADT and MADT changes
  hw/riscv/virt-acpi-build.c: Update FADT and MADT versions
  tests/data/acpi/riscv64: Update expected FADT and MADT

 hw/riscv/virt-acpi-build.c        |  25 ++++++++++---------------
 tests/data/acpi/riscv64/virt/APIC | Bin 116 -> 116 bytes
 tests/data/acpi/riscv64/virt/FACP | Bin 276 -> 276 bytes
 3 files changed, 10 insertions(+), 15 deletions(-)

-- 
2.43.0


