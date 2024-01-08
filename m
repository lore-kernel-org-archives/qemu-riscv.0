Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AC8C47073
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 00:14:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMdGz-0005yC-Pf; Sun, 07 Jan 2024 19:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rMdGx-0005xi-VY; Sun, 07 Jan 2024 19:13:44 -0500
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rMdGs-0000IA-Pb; Sun, 07 Jan 2024 19:13:43 -0500
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3606dda206aso10137245ab.3; 
 Sun, 07 Jan 2024 16:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704672817; x=1705277617; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RdseOl1DREt2QPEx4VVrIOrovikEcM7HY7xBvXj9yw0=;
 b=mrpheOYS7O+OMt5d/LLm00Qw1Kp/Nvlpin1buw49UWyApldh/gx6d6MiBe7RkdC0X6
 TYM+CxfaZjv1Y4f4koJOK7ik2HSLNaFNJ+6esWW4gQ0BhGA0C1+/hgQFsiQz6BTR8nyq
 Q/foUuUlsIAzKPwAZ18rVtewKCLnvXPiE+5XxNHx4ijmJxxMMy+YkvvwWX1WmmMbnhrR
 8JlBDHYDGEPEtN9fVYlcxzHILtXVqXoDzwrj0JRREMPkgKbShFe41+0mvfp8ht4tpNAU
 tXD+fLO978nLnYoP6Q+TkW13fWUTa41ATUhdTznDIBZeO0aSub7tX9Irrz0N4TGF+pPg
 9Gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704672817; x=1705277617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RdseOl1DREt2QPEx4VVrIOrovikEcM7HY7xBvXj9yw0=;
 b=cjlzDVgAfsK0GgYYJtpSr9nw0qXX2c/V2MLdWPOT7sZ396dE/qa3ajuZGGQ+id3aI0
 +Hpt7xC7SwXvuwI0mdjNvu4fM+nWcs7sdYfJG2hPOFoiu0482asF4W8LKVcXWsiOUoR/
 TNWYXWYBi7PN1dqa9Be5VDPCgDBbpDqtiEv/9/sJiBdNJrg4XuyzQWjVWbV5drY+9MnK
 gQUEf/TpPmA7kwEgdvCGy9DBDCDUjkK3nx3Em3Y/2WfZP95AjuMl7CDkVrjgyMFigrxp
 NAEhRj6N9uqMEEAk1Zzbu5QD8HQZyo+DMcXd2h2fTUUtWPoQQVHxImp2pceXfFqr44ce
 HNiQ==
X-Gm-Message-State: AOJu0Yz6PJQWaO3CYF96Op5e8BAFX1QpwMC/NHN+L3f1BCI2v6Vt2FDt
 gkrILW5oXLQ3jq69wcvQaBg=
X-Google-Smtp-Source: AGHT+IF3TexSiCvfCZOoyLZE5FcBEj83rGarJ9D32KH3i7k0Qe1t9Ns/ajWIV2y1PqPlgxfGZCbrqA==
X-Received: by 2002:a05:6e02:12cf:b0:360:e2:bfed with SMTP id
 i15-20020a056e0212cf00b0036000e2bfedmr5809839ilm.61.1704672816956; 
 Sun, 07 Jan 2024 16:13:36 -0800 (PST)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a170902b70f00b001d4974385d4sm4943434pls.250.2024.01.07.16.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 16:13:36 -0800 (PST)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, palmer@dabbelt.com,
 dbarboza@ventanamicro.com, bin.meng@windriver.com, qemu-devel@nongnu.org,
 liwei1518@gmail.com
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 0/3] target/riscv: A few bug fixes and Coverity fix
Date: Mon,  8 Jan 2024 10:13:25 +1000
Message-ID: <20240108001328.280222-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

A few bug fixes for some Gitlab issues and a Coverity fix

Alistair Francis (3):
  target/riscv: Assert that the CSR numbers will be correct
  target/riscv: Don't adjust vscause for exceptions
  target/riscv: Ensure mideleg is set correctly on reset

 target/riscv/cpu.c        | 8 ++++++++
 target/riscv/cpu_helper.c | 4 ++--
 target/riscv/csr.c        | 5 ++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.43.0


