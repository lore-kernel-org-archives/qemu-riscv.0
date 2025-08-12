Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E3ACA0EC4
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 14:01:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ulpYo-0005dd-1C; Tue, 12 Aug 2025 10:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulpYm-0005d0-SO
 for qemu-riscv@nongnu.org; Tue, 12 Aug 2025 10:01:04 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulpYb-0007Bt-QM
 for qemu-riscv@nongnu.org; Tue, 12 Aug 2025 10:01:04 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a12b3f4b3so5017685e9.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Aug 2025 07:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755007249; x=1755612049; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cKcO64ShFrfRsSCI/jgxMemhLXevpF/HYu5Ube0T9Dw=;
 b=PJFV4IBWQ5piAcmGmjDVpUQvYxpaNjipUxDTBfOkDHNwdeex2TWp85uefMLFcGFGb8
 spDS4U6qWawtf2tSj4sW89pK5Kr1nUC8Cb5X2LJz38uYDpwvcA0PDYXblOeYreV4kN9s
 7djDelokyG6wfuozeNVUIxv9sE4Lo8KPV/DyHlWubtx7dAwEIB7jgMzWHi8vzTPf1Rhg
 AVcW6csDlBmdx61IM+eQNw73f1M6lMxX54ZMTZXqJgN3o1JvF7Kt+2ETggyUWU1wgwrW
 XYCIp9Wpas7Q/c7NeypvhLbM3F4i6fNU8ChhBv5bQ8SrtVkJwk6URcI4jL0ExTvhjh47
 mAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755007249; x=1755612049;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cKcO64ShFrfRsSCI/jgxMemhLXevpF/HYu5Ube0T9Dw=;
 b=l5VdueD1NJVZ/K64ANbqQvIU46lzjWsIfFehVsqNkDThX1L0pTjnvq4muOyU8b5fnQ
 OBF90Mpqx06l7hBCM1TIW5tOLsp7v+FMurTNQb6JIOLvbI3mCCynJB/HsFIdPsv+TYe7
 GJoOurqWCqDnhOClt9aKZ1Pe0lIUhuH2CgPZ40key5K87Dh8+UtANancXXXhd+BwjCyD
 HOCE7s/ks0NsfFspE8W/BWouaCP7QYGPQBWYbkvcKDeBbyLJbKUJFYo4r7YY6u9wikEv
 yiimAVicCtaooOTg9H3ovYyHmwenOwzZDDedKULRbMh035jj1jibM5Jv+eeGOH/6e8XM
 gzSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBta6zk2YRo6lNWUPNA1XQ2lviWEz1O9OdaTCr6hSUeBMGDUosaEtrxi5d7N3XYcOVy/1okigcILfC@nongnu.org
X-Gm-Message-State: AOJu0YxjGx5R5/Jbqg+o1ueFr9GS98HUoVY6S57njs5bYGReCoJ/aD2c
 354xAA332+6UVssGbKfvuh+AuuCqe5k57+ANAObjc/Oj3blDCrCuWmYk5HwrVwcxWkOcvC0YKXe
 uAjYL
X-Gm-Gg: ASbGnctgRE4KMNHQWzQUR63RsD67t1XM1gStPsE7szdCH4B+CuiSR+izbSTqV2PrdbU
 OL2lN+ptCos7IqEyGZnk1ToOZY+T/mVw85ec+KYTr6HrwL+297ihl8URRxC/BD9mSCfAVx0Anaj
 D0wVzQEbQYzLdNzlh0B0p6Etm1oJo1Q4fbeLzYtFTHbX0FDaHrF37lsNZELDM3XCi3VZEVWAWTi
 AxmFoiuORyArCc+shioD7hxiaRF2a48R+s6Fj7a+cCX0zeKQyqDXEGfuJGrAgKR2M75r2E9J/GU
 qJbIBVoOo7HA0ARA/NVwswAvwq4kAzpaz1lGGBwfBvrc6V2nvSiUs4cL502xVDqglcHu6j7S0Kb
 4PbA3Kc/RxdUMl8dVLknYF6e92X82cFQorVSt4uDZS5+fjoptOe0uKKV/DFOdc+qMy6j7k81W
X-Google-Smtp-Source: AGHT+IH1SgMhBFenxJ5qd81QB8jXh9ysMsBnjh3FYmowxd/kLndpFVeLC+aRRV2NoBAgMRhceJ/X7w==
X-Received: by 2002:a05:6000:144f:b0:3b7:886b:fb8d with SMTP id
 ffacd0b85a97d-3b9110047d0mr2868098f8f.31.1755007249191; 
 Tue, 12 Aug 2025 07:00:49 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4a2848sm43714065f8f.71.2025.08.12.07.00.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Aug 2025 07:00:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH-for-10.1 RESEND v2 0/3] hw/sd/ssi-sd: Return noise (dummy
 byte) when no card connected
Date: Tue, 12 Aug 2025 16:00:44 +0200
Message-ID: <20250812140047.69834-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Trivial fix for the issue reported by Guenter here:
https://lore.kernel.org/qemu-devel/5b2dc427-f0db-4332-a997-fe0c82415acd@roeck-us.net/

- Return dummy byte when no card is connected
- Add a test
- Document ssi_transfer()

Since v1:
- Reworded patch #1 description (Alex)
- Removed '_' test method prefix (Alex)

Philippe Mathieu-Daudé (3):
  hw/sd/ssi-sd: Return noise (dummy byte) when no card connected
  tests/functional: Test SPI-SD adapter without SD card connected
  hw/ssi: Document ssi_transfer() method

 include/hw/ssi/ssi.h                      | 14 ++++++++++++++
 hw/sd/ssi-sd.c                            |  4 ++++
 tests/functional/test_riscv64_sifive_u.py | 22 +++++++++++++++++-----
 3 files changed, 35 insertions(+), 5 deletions(-)

-- 
2.49.0


