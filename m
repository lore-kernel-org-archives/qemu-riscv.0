Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B01CC02180
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:43:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tY8MT-00081V-3e; Wed, 15 Jan 2025 13:43:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tY8MR-00081C-BD
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 13:43:27 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tY8MP-00035Q-NJ
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 13:43:27 -0500
Received: by mail-oi1-x244.google.com with SMTP id
 5614622812f47-3eb939021bfso72958b6e.3
 for <qemu-riscv@nongnu.org>; Wed, 15 Jan 2025 10:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736966603; x=1737571403; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4fFUGZQsFHRzLCcx9U1SO5cv91pLUKQEMj+p1DkwAeY=;
 b=aWhF1BS6Sj5AU9v5MbqqwnOJWm7ZytcCOA2Iy1pKqAJvdnrLGnvdMWPqRdEt2KAuqC
 pogD4EgjvSgvLkAo694XnuiQrZlGHxCVB0FjpeXToALwplNYNyd5oJkSp5WfNoiu0GZL
 51IKVqyykx3F8MCaIh3Y+IDzIFvLIs3YmT0f5mTWZ3WkvStUcxPAvpkOsRTobQflJCE8
 iWpB+WIpzZdKNp/1Y42IuZHQM3TFL5sKS75LXT5WiEU+mlSiIEjs3yQYLsvLPcFw6mQD
 T3h5k5OPQ0Ou1BFXBsh5Bu+Xi/TWcmSOjsdqZGXWinPHdYoNHPz7dqJeFu5yiZLdygdz
 gVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736966603; x=1737571403;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4fFUGZQsFHRzLCcx9U1SO5cv91pLUKQEMj+p1DkwAeY=;
 b=kWotNaGED6+7NRKbgV+AMwu8WZM1xs4ERzeBPgouh7JcpFzGEtQbkaom12YX4a07NG
 JyUw6ZDJ1c9CF7WZ7vsE32mRKnCaUx6kAqr7EN0t5c850cSvGiKoQqKE+5hKOfsORf0r
 ymTHLQB+2NOXHapLpDFvq+XHIaImE7YR/lpbt1pz4s4kIEPT9Wule2S+ixPMCUA/+AWV
 e+N+nMvJIZyukUoHFKed6S9oiGptkrLjHq+WPD8NsPSLsHIIx3o+GW1yW+Kdl5YHzfI2
 3Pt2sGJXjHMjS7H99bDHdr3NkozssVEcqV0XjpJYVtd6hFZRTH1yZQsujVOovvXGvj/A
 MYPQ==
X-Gm-Message-State: AOJu0Yz8IruaRFimUK7nqitS21vPjA6kmJY5O7RPrjBWz1NzA22Cp5fc
 gnjM614Jhtivrn7/addtXpVTD3aLU26rO5j8eenm4nRpgC676XZqXQ/TwynJdKs=
X-Gm-Gg: ASbGnctyAJZtxaCGXJR1EA5je0a0NhKVPXfgw16PCD7F3DWLaa+ZG16mToclin92Lzn
 RGHGY9XlMUlrTrRXsDTSh09jv9/DvpWNarR3Atzo7bX0AbX9Vt0ZL3wAiCRDAKZUWE1FY7zPWa/
 mX7wWQDz2/vPSy6hFl118ZKyED23MqW038Tj3x90Z+LIEuO1ZzaSu2pHVeMqawWIl7zvq4N0ajJ
 Bp1lQdmcYXVcE6p9bq2z3Di6VxDWFM6F9caCOTLdziwWkLfLdRhXY7/0E4=
X-Google-Smtp-Source: AGHT+IHuzwDkydhaUvkUyKUs3fHHYPnx5Pf2pDW6nt2Y1LKnoBMEUmfVlkMjojCGMQAiTfcRjp0FXQ==
X-Received: by 2002:a05:6808:144c:b0:3eb:62d4:7092 with SMTP id
 5614622812f47-3ef2eda23afmr19296638b6e.27.1736966603406; 
 Wed, 15 Jan 2025 10:43:23 -0800 (PST)
Received: from grind.. ([191.202.238.10]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2ad80a5cb64sm6539196fac.47.2025.01.15.10.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 10:43:22 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 0/6] target/riscv: RVA23 profile support
Date: Wed, 15 Jan 2025 15:43:10 -0300
Message-ID: <20250115184316.2344583-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x244.google.com
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

This new version has tweaks suggested by Drew in v3. No major changes
were made.

Patches based on alistair/riscv-to-apply.next.

All patches acked.

Changes from v3:
- patch 3:
  - fix commit msg
  - drop the 'profile->enabled &&' check from riscv_cpu_check_parent_profile()
- patch 6:
  - fix RVA23U64 -> RVA23S64 comment in the profile description
- v3 link: https://lore.kernel.org/qemu-riscv/20250115134957.2179085-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (6):
  target/riscv: add ssu64xl
  target/riscv: use RVB in RVA22U64
  target/riscv: add profile u_parent and s_parent
  target/riscv: change priv_ver check in validate_profile()
  target/riscv: add RVA23U64 profile
  target/riscv: add RVA23S64 profile

 target/riscv/cpu-qom.h            |   2 +
 target/riscv/cpu.c                |  81 ++++++++++++++++++++++++++++--
 target/riscv/cpu.h                |   3 +-
 target/riscv/tcg/tcg-cpu.c        |  37 ++++++++++----
 tests/data/acpi/riscv64/virt/RHCT | Bin 390 -> 400 bytes
 5 files changed, 109 insertions(+), 14 deletions(-)

-- 
2.47.1


