Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831B6C83F22
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 15:01:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uc3bt-0000yO-PL; Wed, 16 Jul 2025 10:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uc3KZ-0000Vc-Nc
 for qemu-riscv@nongnu.org; Wed, 16 Jul 2025 10:42:01 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1uc3KW-0004CP-0Y
 for qemu-riscv@nongnu.org; Wed, 16 Jul 2025 10:41:58 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-3138e64b42aso16329a91.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Jul 2025 07:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1752676914; x=1753281714; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B95TER2TcKimiRD9j9giEaFaJKGt9AxRul3WkJKBO6s=;
 b=G37CL/gKdkucjmqdfWtuLg9AXE2ZclqFZmjLHIG9KxDiKY+0k+3jvrxFMa4nEYVW99
 iR2poK/HH51O1TqEiQgP/9UTeGtgfmnD2ocWR9bH2PcWbpQXiPTuM3XWrYpPnqO8PnJh
 aV5lOCnEnOy0Cj1QVXvgAkhLsRZq4iiaDUtxrolrLgC1HvMPC7xlqtn2+WYCD2Ir7/K8
 4xLgquROMP1/I0xV4VHoJYoidppEfvxWG5uMZwLfiXr2YwaKBL2Dp9nsWDChRqeCGj9I
 lgEUxdOOygkBLi4t2iJ3wR5luzRM2JCMIdGqrX1Ls3+iit/BYHMY5fNGpsVPE5sBFQG3
 Z4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752676914; x=1753281714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B95TER2TcKimiRD9j9giEaFaJKGt9AxRul3WkJKBO6s=;
 b=UItoVdPcw5WIaneI7fxpuLKe93uWuq2BcAkWjytsy/K12KfeoSZ5xPZChqx2nf9F0d
 LtfF48LQjxe0z8d+ZIR1Bjj8cr9JwbaYvHfLNmnuuqPmMyEn8iMnqWBrOezPQ2Qi7cIw
 TeOpw7lOG5aklJCtIYHKhN3mVXTC2QTeU3E6dvnSvk7rXQrfl8GMODYZesLyKg/ULpat
 yKEy36zjf2cNTsDxDOkCfh4+DiVGj9CqSnvszaTz1HbMOZONICcNbWxel7iE86DT58Lf
 14Aplsa94FKtXt6Q2G3tb9c+Zi3/TUPlhxUp3PlrCKkgBXkutsbvC/DVdISoQvhSvYC9
 trGg==
X-Gm-Message-State: AOJu0Yx1lX9EacsnWQ2jnziMqMo9Ws2awv4EHK1YDj+6Z/4/7aNZ/22X
 lIvhH2/CLgXKws14Z+6PPPn6bFcjmOSwym1OX3IOjyF62rws5G8PeNNn5ZJhio1hFun21fGJRBh
 gqMQXJD4=
X-Gm-Gg: ASbGncuCBCBNXjfPCrXjqYtcI/94wsiAd4fI03qoz8TY8lQlM1bvHrp+V7o8PZfu4gi
 Ye8S+4r8dubSOiCamY3sClPkkCF2vT0WX9Zx98OIUjTw1RYz39XNnwtw/vKC1V0vniIX2F862zf
 r0I0OpkXAGYx5agpzaKTHSFDFf9cpfyOG0w3+IXkD+ERgk3cFEcNrrd3zse0NpP6kgKCEz86FZ9
 8nU0v7x/hTI+kqu89SAMbxoTb4cqcId3vlDGuUGg+v7VVXvXnujfJ6l6tujwyoJol2UH2capXKX
 ixZwyV/vwDwGtYUTYMjJjcRM05rzN+lCThJmv4hEzBOFBwVFAA6kmzZxiHwk4V/NzDg5rlXZL5S
 sNiVCV51odBVWfOtrh8Hk/KxfysHZdxNn
X-Google-Smtp-Source: AGHT+IEnr023aD4YgpnuDbaVrNKiUXCkioEoByCMcGC8718abXaY1Pd8Cj9IxhHjh/2otm2mP3F2vg==
X-Received: by 2002:a17:90b:1c0c:b0:313:f883:5d36 with SMTP id
 98e67ed59e1d1-31c9e6ed711mr4440833a91.1.1752676913629; 
 Wed, 16 Jul 2025 07:41:53 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.195.230])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f2879fcsm1622950a91.28.2025.07.16.07.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 07:41:53 -0700 (PDT)
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
Subject: [PATCH 1/3] bios-tables-test-allowed-diff.h: Allow RISC-V FADT and
 MADT changes
Date: Wed, 16 Jul 2025 20:11:38 +0530
Message-ID: <20250716144140.3954431-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716144140.3954431-1-sunilvl@ventanamicro.com>
References: <20250716144140.3954431-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102f.google.com
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

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..0c3f7a6cac 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/riscv64/virt/APIC",
+"tests/data/acpi/riscv64/virt/FACP",
-- 
2.43.0


