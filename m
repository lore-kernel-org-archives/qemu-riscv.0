Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B544AC54E65
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 May 2025 07:55:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uI0m4-0001VT-I6; Thu, 22 May 2025 03:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1uI0m2-0001UN-Ej
 for qemu-riscv@nongnu.org; Thu, 22 May 2025 03:55:30 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1uI0m0-0001V5-AB
 for qemu-riscv@nongnu.org; Thu, 22 May 2025 03:55:30 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-73972a54919so7127023b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 22 May 2025 00:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1747900526; x=1748505326; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Mu6AfoBVMkxINx+ncdManjd0C82uug4yj5uCXmP/iAE=;
 b=Bk2ZY36O9edQyjRCFbmHMmnezQDiusr0L+wlf7yueCsquBDoheMt3kTfHTNTfiYMNW
 /tVF8OhXQ/iR7JPhK1wnBaJ4SNn5rx8k3Ecou5p0qYaqF6An73Zj5gw9khjbVtcNyhyV
 3YfzilOooTlyfSRSdTLDhp8hHzcO8vk3PnCdioH1huEhze+FTRZBrK9psmdSnUDl+K5l
 2C4ztu0RpihDV/F9QVIeX8NT6nK3qJHTj3Qf8yUO0Oa0FAG7m71YQYsTXHhxiefyioJo
 TQwpqCyO/nqfdyukh6Skpbyc3Y4x9DyvvFCPJJOanCHUf8tIIFeO40Efilug5K3VR6gK
 ctxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747900526; x=1748505326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mu6AfoBVMkxINx+ncdManjd0C82uug4yj5uCXmP/iAE=;
 b=Y9hoGsDb2Ed88lyYELhr33F24vSxbD5vryR675qYiiEoD27da+TXL8yB1QP5NekgS0
 FYamDuG1iTYUiNdHgFxZj209YQ/nsvDxjmoTavB8qk/V6Ak/j63w6o7t+lyMJgoMGFKB
 tQrQnoAibciq5e0FVH3vPwuAWvJlvbI7BuFi8VoHA/HjGw/WZYPb2jM/EkNA7HBFKkwy
 ekoRLXb+Vk5SJLGUospsxdUP54iEB4RqT3hkzc8RuBy7k8OS/sRSY+QAWlaGaMwuBeVU
 S8QgJr9sohQnwvRrOTsq/sIni/+xsP3WJ6aH3zr5XqBQLXMMOg39m4gpQHEA+yvIxfQn
 vgGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaa1JfUvUEVSUFuErviGjBNniQxfWRukdMU1UsdbpL4U+0FqSQHRCke/ytrct36ACx4Z59InaIKhOg@nongnu.org
X-Gm-Message-State: AOJu0YyCeImR2pzFaUyMpJGy9+NPV2SsU1gILM53qQcoRNrpYStC/qhe
 /4SilPejVpg+5hn2skioiEeHG5H/Vf7G3ag2KHSGApBVM9rFX3BYVdec9QjX9WCUHwk=
X-Gm-Gg: ASbGncvI0l7uk8hbOYG+iuEsxg5jYgxK5N3fYROtHgIDFbcP49GP9LqkRmri9x1l0XG
 tOdgSGP2Rgcfytyn7s/bA29UYqYCepYJbfvG1fqL61TIGAmoadD8DWK1dGCCpfQOfK8dxzebYf9
 j1gVZOjNs1jxMpRplRt/nTNnYVuK+65GMGcTErI5qUBRQAacVBRxBASCaJKadqnvg7GBnk6flHC
 GychJZ7Alm0gTED7kpFiTfIFkXLiR6SJHSfxiry6b5c4es6dCJsrfpzc+MsVIYqlcgjKkelEJEw
 hFcmqRDGNDPAwpGevJvGP806U7TuyX4bnv7Kl+KXQx9FDAbndTjIc+li9JkTOK2LYRgjTsYpk21
 Nm2lx7nhPHtkGx40=
X-Google-Smtp-Source: AGHT+IH7xDOTblVGjNWOmzudz92vA2fy7ouejGaNek1lkT2WsGmqIwOyTQE4IMfqp67MVdhJogQhXg==
X-Received: by 2002:a05:6a00:3921:b0:736:34ca:dee2 with SMTP id
 d2e1a72fcca58-742a97740damr32982600b3a.4.1747900526100; 
 Thu, 22 May 2025 00:55:26 -0700 (PDT)
Received: from jchang-1875.internal.sifive.com ([136.226.240.172])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a970bd2asm10692963b3a.44.2025.05.22.00.55.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 May 2025 00:55:25 -0700 (PDT)
From: Jay Chang <jay.chang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jay Chang <jay.chang@sifive.com>
Subject: [PATCH v3 0/2] Extend and configure PMP region count
Date: Thu, 22 May 2025 15:55:18 +0800
Message-ID: <20250522075520.89527-1-jay.chang@sifive.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=jay.chang@sifive.com; helo=mail-pf1-x42b.google.com
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

The first patch extends the number of PMP regions supported up to 64,
following the RISC-V Privileged Specification (version >1.12), where
RV32 can have up to 64 PMP regions configured through 16 CSRs.

The second patch makes the PMP region count configurable via a new
CPU parameter `num-pmp-regions`. This allows platforms to adjust
the number of PMP regions without relying on a fixed default value.
If unspecified, the default remains 16 to preserve compatibility.

Change log:
  V3:
  * Changed `pmp_regions` type from `uint16_t` to `uint8_t`
  * Introduced `OLD_MAX_RISCV_PMPS` macro

Jay Chang (2):
  target/riscv: Extend PMP region up to 64
  target/riscv: Make PMP region count configurable

 target/riscv/cpu.c                |  54 ++++++++++++-
 target/riscv/cpu.h                |   3 +-
 target/riscv/cpu_bits.h           |  60 ++++++++++++++
 target/riscv/cpu_cfg_fields.h.inc |   1 +
 target/riscv/csr.c                | 129 +++++++++++++++++++++++++++++-
 target/riscv/machine.c            |   3 +-
 target/riscv/pmp.c                |  28 ++++---
 7 files changed, 262 insertions(+), 16 deletions(-)

-- 
2.48.1


