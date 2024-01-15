Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DA1C3DA79
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 16:25:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPPmI-0005mK-73; Mon, 15 Jan 2024 11:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rPPmH-0005m4-0s
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 11:25:33 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rPPmE-00050t-9K
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 11:25:32 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e80046275so3637185e9.2
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 08:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705335928; x=1705940728;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9D00xa+XSCxC87F1u0Bt2vd0mnLwvfxAGy7bIuFsaVk=;
 b=yQcnb0x7dmd/K8b+dnx22MzyONkDClqb9cX3dST0XoNjU7FOJHFy5TT3TfymiynwaU
 63L6ZII1Ji0TezOrKd3U7fkSW7ud15KohcvyjeRylGduNbYRSavwGnbbNo+PAA4K/Jdf
 7b1IcdyKqbNxCLwtQF5SwuRMqYFujtH2OnND0jfejw6j4PgG8ZTgxhJ3Z/RdGYP0/Mt6
 8qQYl5vS9XubDLpLR4zVzGy4xWfO/kUpKIzF8dHkB9PoHRPb25J2HJLDRj7q8VfveJp0
 OIUfqVf7/1dp1+js75/6EWza5J5cDSU5v9VWdHCZwfbeqXBrXQ8RSAehMbpPTgjgyOx8
 8Ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705335928; x=1705940728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9D00xa+XSCxC87F1u0Bt2vd0mnLwvfxAGy7bIuFsaVk=;
 b=LHqptQkL0fjFQ9ncQQsx2/dWB6kWvCas6dWBpxDYpG+Ec9moq/8VsUnd/4JzGG1IrQ
 /E98VB1r15G9nVPNEtcNBarS5FNf8sI4SLPdwu8LyM9EvQ8/Qig0gKDFYmp4T22WxM9n
 uW2UNgB4+ayeRT0J9hKNDNuAJFc7uqBd77IOGpjYGlWnhm8ZEy8Vo0hAsXcIdZ0FvQ2v
 8Zc8HT9/UsozkaMeT2C1Z8jOoEWYNEN85p6rLtD+2cRIlV2+dSVSy71vY4/cgVJevsiB
 hmcAnB+YJqzcZPTRlA6iCiWLOkXZOL9l4eNTdb+dJuhmRF0KZ0FnpbIwa7Ry3vAO3OV2
 FtBA==
X-Gm-Message-State: AOJu0Yx4wkTTEkh1VLDqqTZEJYNXhEpLJ3TgqA6zufedUa+kQynineEZ
 0nZ0l1dqnBrZ8nYNOWK9Zhgj06xXFBMgprg4uoIp/0oqqPJx4Q==
X-Google-Smtp-Source: AGHT+IGXA0z+9mf2JktUwdNKNF2ls6r9p9A+RCWbyaqAO90hhFaE8jU/mscLyeZA3n024YbtUwQUxw==
X-Received: by 2002:a7b:c453:0:b0:40e:42b4:23b6 with SMTP id
 l19-20020a7bc453000000b0040e42b423b6mr3758905wmi.55.1705335928187; 
 Mon, 15 Jan 2024 08:25:28 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c4f9000b0040d62f97e3csm20274444wmq.10.2024.01.15.08.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 08:25:27 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH 0/2] target/riscv: Add support for Zaamo & Zalrsc
Date: Mon, 15 Jan 2024 16:25:23 +0000
Message-ID: <20240115162525.63535-1-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Introduce support for the proposed new (fast-track) Zaamo and Zalrsc
extensions [1] which represent the AMO and LR/SC subsets of the A
extension.  

The motivation for the subsets being available separately is that
certain classes of CPUs may choose to only implement a subset for
architectural convenience.

Since this extension is not frozen these are advertised by "x-zaamo" and
"x-zalrsc" options. Beyond adding the extension infrastructure the only
changes required are to allow the atomic instructions under either A or
the appropriate subset extension.  To ensure compatibility enabling the
A instruction does not enable these two extensions - future hardware may
choose to advertise support for A and both these extensions for maximum
software support.

This patch is based off riscv-to-apply.next due to conflicts with
existing patches.

Cheers,

Rob

[1] - https://github.com/riscv/riscv-zaamo-zalrsc

Rob Bradford (2):
  target/riscv: Add Zaamo and Zalrsc extensions
  target/riscv: Check 'A' and split extensions for atomic instructions

 target/riscv/cpu.c                      |  5 +++
 target/riscv/cpu_cfg.h                  |  2 +
 target/riscv/insn_trans/trans_rva.c.inc | 56 +++++++++++++++----------
 3 files changed, 41 insertions(+), 22 deletions(-)

-- 
2.43.0


