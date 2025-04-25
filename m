Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F92C369D5
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 11:38:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8HNB-00016f-Id; Fri, 25 Apr 2025 07:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u8HN6-00014S-Sb
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 07:37:35 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u8HMz-0006Vd-Ud
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 07:37:28 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-22435603572so24396025ad.1
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 04:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745581038; x=1746185838; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VxjqAUEe0f1pPvvqlknIp09bPayLFq3yGFptQ+mQZzA=;
 b=V3M53k9Yq/ar9XhVUxzcn3Hpv4ZYuCs6RWs2tRsV88AUv96xxxeGqdeVr+tT9A66Zk
 H1o9+ceOZLpF9QsqD+k3MUQjZiYmnFnOvWswfY5vylAsgLvAgr/5qnE5rGUPhzF6q8Al
 yxtIT5Mlk48tn7pAEDfYCQwPuLVYopD7lqrmSydH3ysOlqR/Z5QNgJtFk1gBHSCjaOzc
 pYmawPbLfex6JlqKx5TR8O+WYDdcFuOfm32SUBrL5Wrq9K0FEJ9wab7IEAlNYKll2SsI
 vM6T0Ii4dUNSy9m8KX41gj01KdZWp7XSgo4GQuBPf90bFQPFgoIy7Rj4zpltQnzDTlOY
 uyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745581038; x=1746185838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VxjqAUEe0f1pPvvqlknIp09bPayLFq3yGFptQ+mQZzA=;
 b=l3W7sXgEIY5ZBOu1yKSZR4TvkxvynNfjIbLIrTq9nMLV9BO7R5LyNbW7jtffwxX7bH
 pwTYYXmacY1cOI5mqrTDN1EjWTBCF4ErHlCqlf8zLoNAK46tggUjv2su/2N9MXfGDElE
 sByZ+SnrhP/qkHAZpsQIm0UAdh7NPNg/kELuajUO2mpngwBhTckyoHBB8OaKemxUiECI
 TSwcu7HuCYwboLU6lb+1c8MWb0Q5JVTkgir9FGoa63OFCPmwWTes4QJL0zMbZ/lFGcvg
 oL7jXW7moMp/VRa8witGWFmXzaKKDcL8fgXrO2e0lV768EsMveLP8I1athXsF3c0in1v
 k27Q==
X-Gm-Message-State: AOJu0Yxg3eKZU8BlwwYrQx6Wge0XKgO3s0aOwgrVFw22WN1LBZogAI/J
 Vwjf7gpLBBOEpU0sl0912Bphoa6u2MmFyyLfk/OPyePsM1Ir3mzYPPndfMpqqFA=
X-Gm-Gg: ASbGncv2gc3sceRxl1cOWzg2SUM3dElTZvB4L+xZ1HH11lbxZu5vWMcPwGwKRWrAd8v
 icqcFwv+RYMWFO5bm1lO5/VQDR4lCWqX0tyJ4ikhcbOe0jxGWcnyVh36RVaYa5qdPRua8dQL4cF
 WvpGiFNr6nN5m3I6IZUFyv2sSkVv3QGsTbib89qyxFipnbywWoN3qRFGXnthlZRPQivxa+oE2i2
 UkG1XBKH7w/tBNST+GiWWS5y+bB/65CoWr7yODMBwxS8tswS6PpCJJw0WgVW/syoYQ2Dv0RCwnX
 CtRGeY7SFdKZwiu0Tdl8PlSDn3AMnwlGNVyVxF309rUwELA4JhYUCpUY3K1dlJyJo5Lg
X-Google-Smtp-Source: AGHT+IFd3OI/CweU98rju+fjOrw5RyH0h5IHGyLwqp41halDh1/wvFHPFgO05Lz1Cjqh07w0zxpaDQ==
X-Received: by 2002:a17:903:320b:b0:220:e362:9b1a with SMTP id
 d9443c01a7336-22dbf5f9367mr31825305ad.25.1745581037963; 
 Fri, 25 Apr 2025 04:37:17 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db50e7a40sm29881055ad.147.2025.04.25.04.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 04:37:17 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/9] target/riscv/kvm: CSR related fixes
Date: Fri, 25 Apr 2025 08:36:56 -0300
Message-ID: <20250425113705.2741457-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
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

Hi,

In this second version the most noticeable changes are:

- patch "target/riscv/kvm: reset 'scounteren' with host val" was
  dropped. After the v1 reviews [1] we decided that a better way would
  be to change the default 'virt' CPU to max. This would prevent the
  error condition handled in that patch to occur in the first place;

- we're not saving the size of the CPURISCVState flags that will be used
  to store the KVM CSR regs. We'll write the flags directly;

- as a result of the aforementioned change, we're changing the size of
  scounteren from uint32_t to target_ulong. All KVM CSRs are ulongs, and
  we don't want to deal with a 64 bit CSR write into a 32 bit flag.
  mcounteren was changed for consistency;

- scounteren requires the size change to be effective before KVM can use
  it, so I've split the patch that introduced scounteren and senvcfg in
  two.

Other minor changes after feedback from v1 were also made. 

Patches based on alistair/riscv-to-apply.next branch with a build fix
(see [2] for more info). 

Changes from v1:
- patch 7 ("target/riscv/kvm: reset 'scounteren' with host val")
  - dropped
- patch 2 (new):
  - fix mem leak
- patch 5 (former 4):
  - kvm_cpu_csr_get_u32() now returns an uint32_t
  - removed prop_size attribute from KVMCPUConfig
  - use KVM_REG_SIZE to determine the read/write size of the CSR
- patch 6 (former 5):
  - rename kvm_riscv_init_multiext_csr_cfg() to kvm_riscv_init_cfg()
- patch 7 (former 6):
  - removed all tags
  - added 'Reported-by' tag
  - removed 'scounteren'
- patch 8 (new):
  - change scounteren and mcounteren to 'target_ulong'
- patch 9 (new):
  - add scounteren KVM CSR
  - added 'Reported-by' tag
- v1 link: https://lore.kernel.org/qemu-riscv/20250417124839.1870494-1-dbarboza@ventanamicro.com/ 


[1] https://lore.kernel.org/qemu-riscv/20250417124839.1870494-1-dbarboza@ventanamicro.com/
[2] https://lore.kernel.org/qemu-devel/8f3bae37-e1f3-4e55-9dc6-b7876992b47e@ventanamicro.com/

Daniel Henrique Barboza (9):
  target/riscv/kvm: minor fixes/tweaks
  target/riscv/kvm: fix leak in kvm_riscv_init_multiext_cfg()
  target/riscv/kvm: turn u32/u64 reg functions in macros
  target/riscv/kvm: turn kvm_riscv_reg_id_ulong() in a macro
  target/riscv/kvm: add kvm_csr_cfgs[]
  target/riscv/kvm: do not read unavailable CSRs
  target/riscv/kvm: add senvcfg CSR
  target/riscv: widen (m|s)counteren to target_ulong
  target/riscv/kvm: add scounteren CSR

 target/riscv/cpu.h         |   5 +-
 target/riscv/kvm/kvm-cpu.c | 331 +++++++++++++++++++++++--------------
 target/riscv/machine.c     |   8 +-
 3 files changed, 216 insertions(+), 128 deletions(-)

-- 
2.49.0


