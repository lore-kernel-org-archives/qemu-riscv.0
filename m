Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC26CC02194
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 18:20:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tg6T7-0008OJ-NP; Thu, 06 Feb 2025 13:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg6T4-0008Hq-1M
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 13:19:15 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg6Sx-0006sG-03
 for qemu-riscv@nongnu.org; Thu, 06 Feb 2025 13:19:08 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38db34a5c5fso614720f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Feb 2025 10:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738865945; x=1739470745; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cvk5XVWM6B/U3edLFXPiRke7Pe808hVHpTM0rnQwgtQ=;
 b=SVIQACkHxIxHQXcjc1ksIuC4CypjMF+czbB9r4LmfXrZNM1d+hCDdgrzgZMSgtN/1/
 jjWPWNFTzb/YWWv3ts5ruL80JDW9XgCFF/hPnX1ub8ycVwoYLv89B8fTyheym9KnWuPm
 uWJk3h+Fj86prAJeHuh2dNPoY+x0s2cOcZNIdwKYEc/fBHlPUPmXnPcigbS/6PrhogLh
 8RVXXaBoa8t0wJRSe5IOMTvsBG8fQkDYnXOFvAxX/WR5fV3hGbSdMdX7IhYZ1IqeroNx
 ELuC8MIvwzY2ym+T/Qo559luruWDRnwY4RWdc/IvU4r3yevVEzqlFDWAlXHjyiKA5bd3
 a33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738865945; x=1739470745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cvk5XVWM6B/U3edLFXPiRke7Pe808hVHpTM0rnQwgtQ=;
 b=ehu+/t5bIbT7heCYIh6SGnmzPwK9a6+tohQMbZvjo5Dy7BdNaB9aW4UhFivws5h+fm
 qvjSwNdth/dSaPabGi6qzFQf4WQ1/xSI87iujb/ezq8KLErHz+j2QkweYAJ8onGPiFrs
 sCb6e1IYkSGICjjWyPOjR2xl7Xc9KavMYNKp+eESQ0Gx8LdUklN3KYglBFM+XErdEVsE
 2f/H7nox/gOx7FfF02wAqrGmRxdMfRGyscAhR0DvD16F2yW3nN1sdxVPabgNrWHoPH34
 qW0bz8nzGFXU7otTfCQP70xeRpEMTozcdCyB8QZ388eSnwNM9S4963sokvMX86PfW3wb
 5X/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJUqznqg0S+poofMID2YejgOZfUsEtxw3p6gYY53+TTkfzc6NF+IgxpxsHm9pdIMolxGSluy7XsMRq@nongnu.org
X-Gm-Message-State: AOJu0YxpCgCG00UlyyH091AV+qb7JxpvO8xfOeEt/kpfKxaTxd4f1rBF
 LVmCOYgg6MbAMDkIEcYK7AcYaydif6JqubmlSsuYvCbL1r4HJFu5rEGQNBqCe0U=
X-Gm-Gg: ASbGncu4p36zpQksfXl0YD8nZxYlda1BmmVyyn6lXLNyk7N0xVD6+BGq/nR49Kd6r5t
 +YDQk4WcKoTyanAllWnw37gXGtlNrdDwAVFqCm0YuGOL/HDVrDvUdRslPzaMgKg+SaQZSZf/kqf
 r0WZ5YcBB3nsG3gi9ge/k5vy13I+LSnK0PgztOdG1dEgKtbZPWMJa6T0DPZdUxlC1kJdVKBJ6fz
 t3TPV0TDH89PdQdNKWYW9skapIbTBVQebQ1t+aEGBuWof98ZTk12T/LEe+3WtUqlSXUTNLCHq5H
 0rMzoRtECwHy42Bruq85ICVeTR6PyJs0GciG8HjVBMDwL9c22BzwPlkAzrVnHvWsAA==
X-Google-Smtp-Source: AGHT+IEISMzuba5y5/a/hV1oFvHOX1dJCnIqiaCa55m0+aDk27ImuF5o9z6OsKXLJ5E4PHf3A2yCLA==
X-Received: by 2002:adf:e30e:0:b0:38d:c85c:f917 with SMTP id
 ffacd0b85a97d-38dc85cf9f1mr99566f8f.55.1738865945467; 
 Thu, 06 Feb 2025 10:19:05 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd1c151sm2310535f8f.7.2025.02.06.10.19.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 06 Feb 2025 10:19:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/7] hw/riscv: Move few objects to common_ss[] to build them
 once
Date: Thu,  6 Feb 2025 19:18:27 +0100
Message-ID: <20250206181827.41557-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206181827.41557-1-philmd@linaro.org>
References: <20250206181827.41557-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

opentitan.c, riscv-iommu-pci.c, riscv-iommu-sys.c don't depend
on target-specific knowledge. Move them to common_ss[] to build
them once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/meson.build | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index 3c7e083aca1..ff578a2e01a 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -2,7 +2,7 @@ riscv_ss = ss.source_set()
 riscv_ss.add(files('boot.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_NUMA', if_true: files('numa.c'))
 riscv_ss.add(files('riscv_hart.c'))
-riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
+common_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
 riscv_ss.add(when: 'CONFIG_SHAKTI_C', if_true: files('shakti_c.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
@@ -10,7 +10,8 @@ riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
 riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
 riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
 riscv_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
-riscv_ss.add(when: 'CONFIG_RISCV_IOMMU', if_true: files('riscv-iommu.c', 'riscv-iommu-pci.c', 'riscv-iommu-sys.c'))
+riscv_ss.add(when: 'CONFIG_RISCV_IOMMU', if_true: files('riscv-iommu.c'))
+common_ss.add(when: 'CONFIG_RISCV_IOMMU', if_true: files('riscv-iommu-pci.c', 'riscv-iommu-sys.c'))
 riscv_ss.add(when: 'CONFIG_MICROBLAZE_V', if_true: files('microblaze-v-generic.c'))
 
 hw_arch += {'riscv': riscv_ss}
-- 
2.47.1


