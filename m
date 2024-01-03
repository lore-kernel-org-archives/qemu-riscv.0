Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE46AC47073
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:49:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL5EE-0002A6-CJ; Wed, 03 Jan 2024 12:40:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5EC-0001wt-MK
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:40:28 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5E9-0001TM-LY
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:40:28 -0500
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6da47688fd9so1320934b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704303622; x=1704908422; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z7UORM0NWuS6n0uI47AynTbWu+1ee3gU4K7fSIa+SVU=;
 b=TDwlLO2B3z8v15kpfuT9cl0Akj4J+azXJtI0OZ9BNdDhJ8V9onNe4aPo17r6TGqxK3
 eiBzBFtJUUuGuF1fGATErghEZpF3idTgg/xWL/3RPiXrfvxY8WayDpwM22EmahnDDwZd
 Zpzuw1PJpuaLKDyHvGTvdJRAxJpjl19DHtzOitGhkQaN44PpMNNfXWzdjj3uuckOXgq/
 c1wY471cPjYPTPpxX/pQt58Rfhmr2gJ3sB7gl2aO7RNidf76G2oYDqRxu8T2PFEFF/bp
 efkSq/Vd/CGS1jbku7Nz6xvTpK20SBm1R8pObDuol3a84QxvdR4lWyVDIcAdIV0p4Jkf
 djiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303622; x=1704908422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z7UORM0NWuS6n0uI47AynTbWu+1ee3gU4K7fSIa+SVU=;
 b=r0QX2NcHw6128e56A+5BB2D5ZoDo2SsrJkRPGi8AmEzDLOZMZuSq9sMSBMWFyfs8x2
 psouG7bLEM944eIrxT86hbo9ojrTl/fxay/0jKj0djzVK1Mn9meJ7EhZdu2ZhWNbDwR3
 bIT/BKQxsBU0PHJVClTKdMBN/5nuME3gNGWOajk1+dKqQ8M2wKGPtZR71zTyeGMmvCtd
 6eug3nxmOhzxn6vsnGowdMYS8iNuZIJyp6YP4BWJCbBTSp2+pu2E+2+3cfVHZpqKd5YC
 2TEnejXV8ULZW4Xx2shoIUy1M0XHKmFj2sGq31hfHyGB+2/KaWEgEfr1mubIIMaodCc0
 3/pg==
X-Gm-Message-State: AOJu0Yy7KiFIJB+BW8rpdy9crosQXR2yUKeKHI8ypF77JB7nMqndS2j2
 IhHqIHYt0L/qszlZ0EEsTXAMSAIFsfoVRbyY/oSOfr26H3bL8A==
X-Google-Smtp-Source: AGHT+IGCEtG+G5I207Z0xCkQsgk1jNTVxPAuxQ/Jw0cXIszLO23gnfJLAtxLPPs2qv821lteXLzzOA==
X-Received: by 2002:aa7:888b:0:b0:6d9:bbb6:7c1a with SMTP id
 z11-20020aa7888b000000b006d9bbb67c1amr7705475pfe.14.1704303622394; 
 Wed, 03 Jan 2024 09:40:22 -0800 (PST)
Received: from grind.. ([189.79.21.107]) by smtp.gmail.com with ESMTPSA id
 v3-20020aa78503000000b006d7f1ae421csm24042050pfn.145.2024.01.03.09.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:40:22 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, vladimir.isaev@syntacore.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 00/16] target/riscv: deprecate riscv_cpu_options[]
Date: Wed,  3 Jan 2024 14:39:57 -0300
Message-ID: <20240103174013.147279-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x432.google.com
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

Hi,

In v2, after Vladimir's feedback, the following major changes were made:

- add default values in riscv_cpu_init() instead of doing gimmicks with
  setters and .set_default_value callbacks. The cost of having defaults
  for non-boolean properties in the parent class is smaller than having
  to deal with duplicated 'if cfg.prop == 0' checks in all setters;

- all properties are now being registered in the 'general_user_opts'
  hash. We were registering only the properties that KVM checks,
  Vladimir pointed out that this isn't consistent, we're making it
  consistent now.

Other smaller changes were made in patches 1, 2, 3 and 7.

Vladimir, due to the amount of changes I didn't add your "Tested-by" in
the patches. You're welcome to give this another try and add a tested-by
again :)

Patches based on riscv-to-apply.next. 

Changes from v2:
- patch 1:
  - remove 'bext_ver' from cpu.h
- patch 2 and 3: switched places
- patch 3 (former 2):
  - added hash implementation from patch 8
  - added pmu_mask setter()
  - pmu-mask and pmu-num can't be changed for vendor CPUs
- patches 4, 5, 6:
  - properties are now being added in the hash
- patch 7:
  - fixed string check in prop_vext_spec_set()
  - vext_spec is now being added in the hash
- patches 8, 9, 11, 12:
  - default values added in riscv_cpu_init()
  - no longer checking for "value == 0" in setters
- v2 link: https://lore.kernel.org/qemu-riscv/20231222122235.545235-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (16):
  target/riscv/cpu_cfg.h: remove unused fields
  target/riscv: make riscv_cpu_is_generic() public
  target/riscv: move 'pmu-mask' and 'pmu-num' to riscv_cpu_properties[]
  target/riscv: move 'mmu' to riscv_cpu_properties[]
  target/riscv: move 'pmp' to riscv_cpu_properties[]
  target/riscv: rework 'priv_spec'
  target/riscv: rework 'vext_spec'
  target/riscv: move 'vlen' to riscv_cpu_properties[]
  target/riscv: move 'elen' to riscv_cpu_properties[]
  target/riscv: create finalize_features() for KVM
  target/riscv: move 'cbom_blocksize' to riscv_cpu_properties[]
  target/riscv: move 'cboz_blocksize' to riscv_cpu_properties[]
  target/riscv: remove riscv_cpu_options[]
  target/riscv/cpu.c: move 'mvendorid' to riscv_cpu_properties[]
  target/riscv/cpu.c: move 'mimpid' to riscv_cpu_properties[]
  target/riscv/cpu.c: move 'marchid' to riscv_cpu_properties[]

 target/riscv/cpu.c           | 614 ++++++++++++++++++++++++++++++-----
 target/riscv/cpu.h           |   8 +-
 target/riscv/cpu_cfg.h       |   4 -
 target/riscv/kvm/kvm-cpu.c   |  94 +++---
 target/riscv/kvm/kvm_riscv.h |   1 +
 target/riscv/tcg/tcg-cpu.c   |  63 ----
 6 files changed, 590 insertions(+), 194 deletions(-)

-- 
2.43.0


