Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9722C0218C
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 17:07:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taHi2-0003w6-Gw; Tue, 21 Jan 2025 12:06:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1taHi0-0003vp-R4
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 12:06:36 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1taHhz-0006ZD-4i
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 12:06:36 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-216281bc30fso136457625ad.0
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 09:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1737479193; x=1738083993; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gHtnZktuBnihk542tjTsfi+VPekmIj93OjcuzPODl6g=;
 b=Yd+ih52/n/5Qe8qgNVlmKsOBVwAtsGTi2VF0ELGFKqdrD2W550Vjp+fWb8lgzgPK1P
 YgXqkXuHqCg7Xg/pCeHOv94XHPUxlhzeExnIQalmGRp7LW8NEhVZfAVvjIejymzUePec
 jb4X6o32A5indl6jHmjNyBoy5eILsfVRNDs1MPGJY6RSrIaG6v1crKq4njnSM9Sf9ssN
 m4UE68HJ8ub1ESeHEGKsDrgmQFAQE3iPwH/nwwNBChx4ayXv//UQUMGTNtAEamELRDjh
 KVk5D1s89KJoPctA8me4pOkhiSRl7rBLqMeW9R8dI67CPZ/V7zCcZcukk7wyzTO6EpZX
 vZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737479193; x=1738083993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gHtnZktuBnihk542tjTsfi+VPekmIj93OjcuzPODl6g=;
 b=Ts1+HWJbzN1QluNI4jDu1TSNLRNpFNtHMgf61cDg+3JM3fUPz51z/oNK1nyKi+9o16
 EARcygLSQmLlYtYAxTL3ovpLy0eKx5Ho0GnId0QUepPhdWBod7lhEpVJ+KbbYN5S+T6/
 hhEXdrm18CuSzolQeojMgibfhFFlygzFw4efs6+V44DgTt7EnMw6gqamuj/krE7MNClK
 3u7pbTD/JhnPJPXZ5KtETZf3BUe+sRdqqiumJCc4rblZBrh+rQU97i/Ldu5Ype/vUBu5
 ACyd9hpc0qaKUo//ZnwMTAFxrkx3ADi4dyIkWEbVoMKUKKsM79tHb1gZKNaxB42/Ra+i
 7pjw==
X-Gm-Message-State: AOJu0YxuLzUXVnciyTfmirrTfxhnDB6PNz+r0YQj6nVimXnCMsgLEV50
 z+4Yra33FwNJR8RBSYbAQbGFFIhLC5+mVrVElnE/lAAs1iYEPApHa/0C0ZQELvQ=
X-Gm-Gg: ASbGnctecI9dWd8YnLzUYHMvgg49q4cGiY8GBMov+UR5WHff99BSUeV/X1GZ+jkV4Pe
 T186qml/kbCaJcLYP8HTMa9BSaC/VsJrlkfID1QPCphitRsaytGJar0J9WcTxT79xEwHjxtKOVm
 6dXigCqiYivgu/YOhoqcnHqx1y9a3W3pllWr1T/IWZoa5p17NLBp9Td2CkKaj1t3Kbqicc4/+I/
 tt2C2hWMAYHGGyuQnYDHg0aquMpdGrsn9U2xpk0Mk2Sl03HNRFPs+Bc9/1mEsTGNqMyQXd7
X-Google-Smtp-Source: AGHT+IHoaH8ClTaqo3K8Zm6uGWM92wJ//rBzw4nn0xeoG/Ujxp9DSCmr0AGgV+Ffj8Dc9w+Amqoq8g==
X-Received: by 2002:a17:903:32ce:b0:215:b190:de6 with SMTP id
 d9443c01a7336-21c3553b341mr260716655ad.3.1737479193403; 
 Tue, 21 Jan 2025 09:06:33 -0800 (PST)
Received: from grind.. ([191.202.238.10]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2cfbbdf0sm80657825ad.105.2025.01.21.09.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 09:06:32 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 0/2] target/riscv: throw debug exception before page fault
Date: Tue, 21 Jan 2025 14:06:24 -0300
Message-ID: <20250121170626.1992570-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x629.google.com
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

Hi,

In this new version, in patch 2,  we're using the address 'size' val from
riscv_cpu_tlb_fill() instead of infering it from the CPU XLEN.

No other changes made. Patches based on master.

Changes from v2:
- patch 2:
  - use 'size' instead of infering wp_len using the CPU XLEN
- v2 link: https://lore.kernel.org/qemu-riscv/20250120204910.1317013-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (2):
  target/riscv/debug.c: use wp size = 4 for 32-bit CPUs
  target/riscv: throw debug exception before page fault

 target/riscv/cpu_helper.c | 18 ++++++++++++++++++
 target/riscv/debug.c      |  6 ++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

-- 
2.47.1


