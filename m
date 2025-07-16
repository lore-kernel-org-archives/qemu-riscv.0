Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B77C83F1B
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 15:00:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uc3bt-0000xJ-A5; Wed, 16 Jul 2025 10:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uc3KY-0000VM-31
 for qemu-riscv@nongnu.org; Wed, 16 Jul 2025 10:42:00 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uc3KT-0004C1-Jx
 for qemu-riscv@nongnu.org; Wed, 16 Jul 2025 10:41:57 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-31329098ae8so849603a91.1
 for <qemu-riscv@nongnu.org>; Wed, 16 Jul 2025 07:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1752676909; x=1753281709; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sBiX9Qv2y3zYZPcpMCcNdMelG6HGZjKASmpE9pXFX6c=;
 b=TJ1lPCzr864IDk0vl4aTUiWRBL5gqS+ZiPlNhnewAYBWfa+cfYO9JlnxArshOKPE2q
 Ua0BTwC8par83FWrby5Isi8x+asRIk79pHgT8yFumBKjy5zsKPeGoP5SrDQtPk0VqbvG
 NfhokdQ533p7gPTpbbyMFYomqU8CgB98BCHmFFPwLtqPtVtqTccDCM15eEf8eAnN7Hsw
 UsD40XNTOTIukBmnAu3xi+1CtT3Bi/5BG2myZG3BOeZLkx1lJlJ+25k/DSBv3HOH/HWh
 4Uh9IIURn6rjxj/mnP2Xfp5uS/0t0XpOjB/Fk5ZbeD7ycKd1kflvpggpLtYxME+QprIL
 5sUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752676909; x=1753281709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sBiX9Qv2y3zYZPcpMCcNdMelG6HGZjKASmpE9pXFX6c=;
 b=TETYsF5gDDweKawqsqmH4fCKB374vEnJ1Nlo8Qc7N1bNwjKJyuweXfOIKM76JCPKOS
 7K0fbeZJEMOugQx5sE3CO5KSWTu1E0NJAiXE1pm6MOoCXc0KawH2ubKYo1HTGFtX/fUH
 RvRNwN07ex2MZjwruV1/2ZLRLOlF8dZ854ZbysxAqV5Y4+qpNKdbVMR3fbaCzGh7/WFi
 seqhZQNQosUm3Qx2iQD0EFVevls6UiGAO1s82XVhKjfWLPmHRYPeTK/GQ1zAYuHjWUar
 oBGjwru9I4uz/sUKVdOfiurz7ZX3vkqW98OIUjv5a4VMfH+dovSD3Yd/uYCKUSuzmWKF
 3UJw==
X-Gm-Message-State: AOJu0YyG90AqkQ3zQ3jy00njGQzOFPjZECTUVeb3pU3f6yvIFFUQjLuM
 W+WQuaV1JsIlgXvDd1wRIr7NaGdmQ+xIKpA5dMhW0HTnkIC/qcqLuZcM/AfSNb9KRlAZrkdRyNs
 zZvp2atM=
X-Gm-Gg: ASbGnctdlEqYG5DS3VbD1U/RKEaOQA+600oKyrUdXVzOg7/IqtXHy1WkYbo1hilQVA4
 2sWlx1ilP3TS00bMskhahdO5cr2SDLUw7bGC4KIOh344A1BybCn58zizVGAvKnkPO5xEl8C9Wwa
 xvhCSRQz4tEO3HyssOdLaSFvIpXtZYkdEhC7C/FhCk6exgfYYYC0j/0MYJG6BPmL09L/KjoPTBF
 KwAFoFhpyvAPjAroOeIjAIvw1NFEixTR/fKLrT7dfN/Dh1/uA08JwQCSET4AYHHobW3IBnZxmtF
 yvKI4yP6hWEnFMDzUpLmlT574J6WPA04M2vY7c7M6DwS5q0/uRA1bKu6l0LAbBa1upjJTPBgwW/
 8mlBG0C2+U8nj/6ID620sEGwXgBpEROUQ
X-Google-Smtp-Source: AGHT+IFXxgy9VmS/fdIfJkVrDghoxLMv8+ztk1vVXfWTeLKn1JR8efa6KrQCL6YvWShMGmRZy51yNg==
X-Received: by 2002:a17:90b:4cd2:b0:31c:39c2:b027 with SMTP id
 98e67ed59e1d1-31c9e6e4200mr4995522a91.7.1752676909388; 
 Wed, 16 Jul 2025 07:41:49 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.195.230])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f2879fcsm1622950a91.28.2025.07.16.07.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 07:41:48 -0700 (PDT)
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
Subject: [PATCH 0/3] RISC-V: ACPI: Update FADT and MADT versions
Date: Wed, 16 Jul 2025 20:11:37 +0530
Message-ID: <20250716144140.3954431-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1031.google.com
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

Sunil V L (3):
  bios-tables-test-allowed-diff.h: Allow RISC-V FADT and MADT changes
  hw/riscv/virt-acpi-build.c: Update FADT and MADT versions
  tests/data/acpi/riscv64: Update expected FADT and MADT

 hw/riscv/virt-acpi-build.c        |   4 ++--
 tests/data/acpi/riscv64/virt/APIC | Bin 116 -> 116 bytes
 tests/data/acpi/riscv64/virt/FACP | Bin 276 -> 276 bytes
 3 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0


