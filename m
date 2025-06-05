Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A076DC5B559
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 09:30:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uN6u7-0004gh-2t; Thu, 05 Jun 2025 05:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uN6u4-0004fo-TF
 for qemu-riscv@nongnu.org; Thu, 05 Jun 2025 05:28:52 -0400
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uN6u2-0003Ov-DR
 for qemu-riscv@nongnu.org; Thu, 05 Jun 2025 05:28:52 -0400
Received: by mail-vk1-xa41.google.com with SMTP id
 71dfb90a1353d-53090b347dfso296662e0c.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Jun 2025 02:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1749115728; x=1749720528; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jmx69lwkESXfBB9x/EiovtvbSsz4EmBDYVpw+Vz8XpE=;
 b=Xbb+kmH/KZhJ19XJyZ0bZJ2eGXuu/gpt8gp9HHBi7jBMxZaENR9uDoEN6+tJdFZ6vB
 aXI4f0A4+k8TiIBuj+2i4d2uaWwmHUtpk40zByQEhQDLaAhPvC+8HYMZfN/+kNOfyr5U
 w8H/Y6VoODDuBwssz0Z1rFVEUFwmfcblpwz/12E7ooLeMVq2SDFR98kfrgiEget7Fy8j
 44segeg6T6Nw33wFyyMOSKQt5ZkGi2rDmSf1BwHMjH94BBQIHl3ui8f65rv8uShJNQCx
 0hTr7Nj5j/gqJK5EWa7v5InfPm+I/mgCi9kTt3LY4Jz5BCojyix12g3h+/OCg3CVtT+F
 c20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749115728; x=1749720528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jmx69lwkESXfBB9x/EiovtvbSsz4EmBDYVpw+Vz8XpE=;
 b=njjveRWD5J90LcRj7omRcqmK+vlt9+zDlaz8YewUoFUe6QuGxM1TO30fBQTRPYpynT
 w9vU27eRF5vFhDMJtiPA6SHNs4zCr81GfwwhO3+sWMxZMkGNphY+KsFpaWErqsICvzfE
 pWqxmA0QxaW3lZKhzb7lzkk3BPMNS9sXLNRS1+SYtZxIxb4srP0xUEJ5CsKPsOyRyr05
 Ej78aziuw30kWnQ3quywn+sA+ieF3en9hjoeMWbzl5PPVpQptQankKS/B1GGRMvzW25l
 7S2UQNqhrtR/kwcuCOQCW/vRrAbtXLs1+q8aL1N1C3DgnZxHqBuuHXBvFWzmlWLiH2e8
 JpPg==
X-Gm-Message-State: AOJu0YzMCsJ1Mha/rJnx0Ga2FX0b7XoavQnjMXArPbC+wA0qT4e0JjLx
 X7O9iAQ+KMRW2sfdyO/3UqCvFfNWBiWx6Pxl03hW4Rl4Rkaa7hEi2TlIM1iD1iRTvhU=
X-Gm-Gg: ASbGncuI8f5GXBdfDR8zV2JpbBkkx3SPO7LSfzFAuOoUGpr0j8+T+G8Sn5AlKOp9b54
 nE7ED9A/15UO+E5zP3noLJnkA/fTPqVqpszuiXyaJzBF7Tbsm2Ex/OyHoIRrmkudF2DJf611cFA
 G8RSzeM7nCbKrfJNM8uIxr3W7Ks6WPuyPVl9kwbO4FZnNFSnkur2jxj/ypsoJfPZc8IUBhRBdxk
 He8BO361V5RoMAlf7vOS97kWfwo1+odPL4t2J+IWRAPkmKzVWjTvKHwoNM4Mp1Nq19xKkn1KKRj
 ta5oxmeOUBUD0Zxf+pOz5y3KIYBPOhVxEZasvGtIpEupYvfvW3O4zOv01kIfBfSK7hYA835Ezac
 GHTt1
X-Google-Smtp-Source: AGHT+IGEq0jCySR3m7l2PYmtI6bOr5cyNoR7jyViDp34F3FoQ2kh7pkC3csCkYYKkMw3CUIbrsVgsg==
X-Received: by 2002:a05:6122:311a:b0:52d:bbab:2055 with SMTP id
 71dfb90a1353d-530c895d2eemr4274031e0c.10.1749115728119; 
 Thu, 05 Jun 2025 02:28:48 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.188.133.196])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-53074bf86b1sm12311772e0c.36.2025.06.05.02.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 02:28:46 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 0/3] target/riscv: add missing named features
Date: Thu,  5 Jun 2025 06:28:33 -0300
Message-ID: <20250605092836.1383882-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a41;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vk1-xa41.google.com
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

New version where typos in patch 1 were fixed. No other changes made.

All patches acked.

Changes from v2:
- patch 1
  - fixed typos dince -> since and specd -> spec
- v2 link: https://lore.kernel.org/qemu-riscv/20250604174329.1147549-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (3):
  target/riscv/cpu.c: add 'sdtrig' in riscv,isa
  target/riscv/cpu.c: add 'ssstrict' to riscv,isa
  target/riscv/cpu.c: do better with 'named features' doc

 target/riscv/cpu.c                |  16 ++++++++++++++--
 target/riscv/tcg/tcg-cpu.c        |   9 +++++++++
 tests/data/acpi/riscv64/virt/RHCT | Bin 400 -> 416 bytes
 3 files changed, 23 insertions(+), 2 deletions(-)

-- 
2.49.0


