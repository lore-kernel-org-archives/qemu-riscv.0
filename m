Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE36D637A1
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 17:18:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBH0K-00007X-2q; Wed, 13 Nov 2024 12:18:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tBH0I-000078-Cx
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 12:18:06 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tBH0G-0003j8-Sx
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 12:18:06 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-21116b187c4so58042355ad.3
 for <qemu-riscv@nongnu.org>; Wed, 13 Nov 2024 09:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1731518283; x=1732123083; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UHVe9CY4lpulvqbim1lRpytAm970j/RmzHBlLdorJnY=;
 b=Z49xI/dEzLG1J+G+VI6p6xPseqEcjMpZpq7i4AIdd/l7OOS7IcOiQOpZoILlApWhNU
 nI3H4DEyPNyXmEQ/B6B7CGq2/8Kyxfj7l+E/qzVcjLCRf38jIO2Vx1+6KF1I2+8/tdkN
 Ec8AxMjoOpxes6RFD/VNQPMQ+apY2aG2SW8bfbU+IWga6gRPInnRfv/f1LX/fqfj1lBe
 NSIB3s+dH8fEzP+kQP0GTuLdN6LwCCCKPDxCD7yTnh31M+mD5BJzzYNRHCaUrfYc4vMU
 TiJZlf9l85saDL3HiA5+kHK1kkce0akIlDrDjJRX218KORLHF8rWYiMH99376VCqyN9F
 WAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731518283; x=1732123083;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UHVe9CY4lpulvqbim1lRpytAm970j/RmzHBlLdorJnY=;
 b=vBzPyohsHVP8Fc2+qIBdJazXPU1w/Fai8W/5WQahV0vGlxKNbRdgf7+mqiMXCE25Jy
 MvxLqeF5+CF6Sh5R4GJ2xLbZXA06S+0xhBmhDx4cJTxJ7I+heaTL9Wu3dBZj9AYGG7yX
 kUG7oxtD5i/wvdlZhAt9eQ72eztFwVeHwGosLRTdvCp+J4Cr5C/4AWBi8kifHCbmjQkM
 i05QWlhDwR0atPpx5+EMtcd6njPBpIQwcNXV2bpes6Dx67m6yO3dGF10l+eUhOMkVvdc
 UibNSeeV8AZCqhp+Hxz6ziF0vaqCC2PWk3Xq4jeS48/U9Fj69glE2S3IkKtBAmr4EZx3
 F3aw==
X-Gm-Message-State: AOJu0YwN8LX1nxnws6kC+ZlB7sLp43A1g8IC8+Ccc1UCo4FTKTAn167e
 C8F9SHZfIhqb1stLluaUr7//s3q5wtZL7LaeD1j8TotgUUcIUoOYGchnsWYL0DDCQsKHP636pCQ
 Q
X-Google-Smtp-Source: AGHT+IG0mN+hz2Gg84ojNR+hBWeZDwlQmQmVDDzIdAy8QmB/bBciIOSV/wiPQXTE4rwlpbBNOaiXUg==
X-Received: by 2002:a17:902:d54e:b0:20b:6d82:acb with SMTP id
 d9443c01a7336-21183d56cf7mr268638065ad.23.1731518283244; 
 Wed, 13 Nov 2024 09:18:03 -0800 (PST)
Received: from grind.. ([187.101.65.72]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724078a9063sm13392889b3a.75.2024.11.13.09.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 09:18:02 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-10.0 0/9] target/riscv: add 'sha' support
Date: Wed, 13 Nov 2024 14:17:46 -0300
Message-ID: <20241113171755.978109-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
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

'sha' is defined in RVA22 as "augmented hypervisor extension" and
consists of a set of named features that must be enabled.

RVA23 makes 'sha' mandatory, so let's add official support for it in
preparation to support RVA23 later. 

Most of the named features added here are always implemented by TCG.
Only 'ssstateen' has a runtime dependency. 


Daniel Henrique Barboza (9):
  target/riscv/tcg: hide warn for named feats when disabling via
    priv_ver
  target/riscv: add ssstateen
  target/riscv: add shcounterenw
  target/riscv: add shvstvala
  target/riscv: add shtvala
  target/riscv: add shvstvecd
  target/riscv: add shvsatpa
  target/riscv: add shgatpa
  target/riscv/tcg: add sha

 target/riscv/cpu.c         | 10 ++++++++++
 target/riscv/cpu_cfg.h     |  2 ++
 target/riscv/tcg/tcg-cpu.c | 30 ++++++++++++++++++++++++++----
 3 files changed, 38 insertions(+), 4 deletions(-)

-- 
2.47.0


