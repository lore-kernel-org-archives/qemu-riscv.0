Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A45CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 08:04:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDefg-0005va-BK; Tue, 28 Oct 2025 04:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDefd-0005uZ-Fc
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:03:09 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDefZ-0000mz-Vi
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:03:09 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47109187c32so30440745e9.2
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 01:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761638580; x=1762243380; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AaJsVvVhH+hhDSMcy010RCCK5d+kbdBS7ibwzW1yshc=;
 b=Y+DsDo206vPP3uUwmVtqRs/En0wyYN+LfiISrBOjJbE5oy8hJ1S4vYtuJqhpIQIpqp
 qoq7S72J5pRlRsBLuPJMBXEN5hptHNK8HgXKHePkHn+VHbwQhiiiOLrU49SKXpPYwu0q
 dMshZX79bhsKr5HyYtTb017jsMKiTUZv1wcE02DWdli8cv3tkRl6oQv/W0xKunIk/iqg
 x1KxtVgM2ffql1mAlkHBwiserIHW/x+3J5cxAdqLqlaXan4i8J/6tFaa+d2fCmKhoT9A
 Z+6yDjSenOtsxqnUAOoio72GeLwT6SgJzaNPolfy5xKP+/JW1k5yaJBNnPn/iV5AmDIb
 i8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761638580; x=1762243380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AaJsVvVhH+hhDSMcy010RCCK5d+kbdBS7ibwzW1yshc=;
 b=Hm0aCsHF5JY/Ry6GaE+2ZoGoA1f2igrox0uzhY0YCZHKzyRvc7ecAcso7jj1mcJYGe
 /31xCsZBDtG4GWQXVuXA484thbTzhmVbvIa6os6HJhSDSTZfMW/ssJ8b3ti0fY6Yi7K1
 im1+5H16goEWfbN4z4XBpUm5Jq7LSKQiURIQokonXHh8OLkG7iDWsi/JAg0YCeVXgn75
 4dCmao4e6uBDyodBc0JfRttu7epSnofQyAV5yJF9RGTtIj/ossm0jdp7yvk8JyPMZKYR
 PcLO7gS9jamO/bygXuhnU/w1FDXKynDfPteGWErQpfkMZkw/G6rekKfg5Xp1FAjKV4FR
 Ifcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY4LD0/HIvYwY8rQb0gdQaRXh8GywZ2Wlg4sgyo6iF7Qu9NwEjUyLeL347JHhnZjReL01vwJkKSXHk@nongnu.org
X-Gm-Message-State: AOJu0YzyYVIbW87AVNrqnalh4SsnZ/BA9GkpY3LZ3Wbuv8LIbeDn4eNm
 EdjebAO3mzpYf2MnRhMJpxjQNdsgoBdImr9R25GtToUiP9CN4Zua61qWSZ+Qu+G1Pxk=
X-Gm-Gg: ASbGncu2dWYgbs7GEZINFHtmYRdAHdVyvAICDLMVVteIb1jHMhwixvP9V5Deh/bIi0D
 qZcAHhU69Y83GEeCjSCCmIIkWMXG1Qu3pWCmJwJjGozXViU4VEGoxuNkPi/w5s9Xi9XGjPnuuO6
 NJbnfaU2mwTMgvVYqJAs0GI7GC+cnganKZSIoCU3ivpaoA4/oL2R0pyL+wX5czbfy2yIryR4jM4
 F5K0YL947NJHqT2OVHlWCoofeqEyeu87+19dNFIomirt/AZjIVs2hY4oni4TaYYV+5DybrnjFzJ
 ArKzsgeRcLo8Rg0ty15svNtOokU1BcbuKLIYZYuhICsWeJPjaZ9ls2P4IcwFfJIfj920jQBtfFo
 XQnZ8hPh8AvyfsqdR0DRwKWVUbR/splfJbklz5wG3D1TasCjYWG5+MQ8J1CvDZ0l8K00yGq+7by
 f0y/OldpRyb/YbPRV/BDe6z4fzYlFf/5ba28quDR2iIxFr1X9UJkQ93s0=
X-Google-Smtp-Source: AGHT+IGZM8eE80Fn5hYe80UZn4EAKsdHfpdOu90kdDQpegzFsSjxJ/7R/M8IKMSRaLGVuejV4l/b7A==
X-Received: by 2002:a05:6000:2c0e:b0:429:89c2:d944 with SMTP id
 ffacd0b85a97d-429a7e56654mr2358787f8f.15.1761638580022; 
 Tue, 28 Oct 2025 01:03:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5678sm18629797f8f.22.2025.10.28.01.02.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 01:02:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/7] hw/sysbus: Spring cleanups (part 1)
Date: Tue, 28 Oct 2025 09:02:50 +0100
Message-ID: <20251028080258.23309-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

- Use proper SysBus accessors

Since v1:
- Reduce series

Philippe Mathieu-Daudé (7):
  hw/sysbus: Use memory_region_name()
  hw/i386/microvm: Use proper SysBus accessors
  hw/i386/ioapic: Use proper SysBus accessors
  hw/timer/hpet: Use proper SysBus accessors
  hw/acpi/cxl: Use proper SysBus accessors
  hw/ppc/e500: Use proper SysBus accessors
  hw/pci-bridge/pci_expander_bridge: Use proper SysBus accessors

 hw/acpi/cxl.c                       | 2 +-
 hw/core/sysbus.c                    | 2 +-
 hw/i386/kvm/ioapic.c                | 3 ++-
 hw/i386/microvm-dt.c                | 6 ++++--
 hw/pci-bridge/pci_expander_bridge.c | 6 +++---
 hw/ppc/e500.c                       | 2 +-
 hw/timer/hpet.c                     | 3 ++-
 7 files changed, 14 insertions(+), 10 deletions(-)

-- 
2.51.0


