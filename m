Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157EBC021A0
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 12:23:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiYEe-0001z6-3n; Thu, 13 Feb 2025 07:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYEb-0001yS-7M
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 07:22:25 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYEZ-0002Sx-GW
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 07:22:24 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaec111762bso162860966b.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Feb 2025 04:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739449341; x=1740054141; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7wSgwIZJNS5wWvbHzf6KxQQFZR0DskwF9SNahv2jROc=;
 b=i662A7aLptifJBx3QrXlvQoAykt3nAK7M52Lik+r4rrykk1aowUksff7QDRhId53y7
 xoIBlncILrfPNzN+XkKx2IZW08bHABLASLAzefTaGDVY4Pp6JKEANHc5QCTgwSckTKd3
 YRdkMjHpb74BQJQBOkW5OPtVIrOvbke7qCetZwon6qntSJDRB30m/NgsE28n7OA1Rlq+
 fdo6WNlNx+42l7PZvYzdjme+r/yTPF64JfhYKcSTqpci//9541KCRFdLqaS5AGHe0W07
 91txf0/wZJBwMT2P1Ua9Z4U1rN17RmqScED0pNvBIwwI6/Cg87WykD+vqzpm+UYBc8HC
 4zTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739449341; x=1740054141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7wSgwIZJNS5wWvbHzf6KxQQFZR0DskwF9SNahv2jROc=;
 b=LOR39tHZVN3qpqmKSfvDjhzRSiPDzZ6J2IfD/LntcKXwg5YsV0+yFefkuGvbLREgeJ
 JkcZzSN7jtVXuu1ITw+Fdn/oh2JksQHmOF6J3B6Kn+4kWYi5BffAFeGNTRVlMYja0QRn
 IMmAm/akCtHwRblWOO+UE/ZqOjfdYm15eo1OVs+DU6l5s67XbimHpGSZweK8bgkH0sjd
 DYkaI2ogUo0ykw1izVTJTUdmTIe2vcvPpY2zMiEKX/wBznpbLDz1S8Kt5X16OVY6SUvZ
 Ty56Qo66LXknZWikSowCHa2ykS3x0wF9cBU4ld6h+OyDejmibgD5wUzPR+qCH7Lu5IWz
 9OHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGrP7FRhCYDtPRVzQJxmQgX3nsk0xo1AiR9XsjoT80iydCQqDWlD66v8sUe3JnG5GtpypccdmIC9Ja@nongnu.org
X-Gm-Message-State: AOJu0Yx1AnNQ5Fxw95u14vTIjU1HHOLps/fPt8uq7JZfGNr2YvsfgeP2
 lhFPAfD6QgbGNE8Szg4j7i+7un92HzpFX6glo8VMZD5RM5d5P4B9zy2l5nxrLK8=
X-Gm-Gg: ASbGncuNZ0xm1V+H9qJ0Yj+Gx9BZsS0/LOD10RochMNuNA7rFrUbzh1L2SWkkkCLGfa
 lSuo0IcMejAWbVMPb+xzeI+NjOCIXYlp783VZ386LZeOnlLJQ0wBnE8gVa7Sv9tgHjFzFdnDBqi
 OC+qU361kHiE43lMNeOiRMO36CjOkvtKbXgp9OziBsJMaK9DoOKq5t6yl1QvPhtVJeSTaOoy3aJ
 dYYdDubpYUCJzylmlW6TEKmnHZqrOwy0zsUA4rF8wZO+WYlOWhR2QzAP/DlwQ9TyRVtzTUWQ47P
 Kdu/kpWP/146+2Dw0MqfJM1vlR29UXlsk0+B0Ch3hoz8U0OgBYD6xekzYsnk
X-Google-Smtp-Source: AGHT+IEShprbey5/yy6IiNK+WOto7g5nqUk3ldvlAZ/dqFDaTv0yRduBDi4IkAcE2yNN3VkXMB+BXw==
X-Received: by 2002:a17:907:7f27:b0:aa6:a7ef:7f1f with SMTP id
 a640c23a62f3a-ab7f3325255mr651627466b.11.1739449341337; 
 Thu, 13 Feb 2025 04:22:21 -0800 (PST)
Received: from localhost.localdomain (6.170.88.92.rev.sfr.net. [92.88.170.6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53284042sm120308366b.82.2025.02.13.04.22.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Feb 2025 04:22:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v8 0/6] hw/microblaze: Allow running cross-endian vCPUs
Date: Thu, 13 Feb 2025 13:22:11 +0100
Message-ID: <20250213122217.62654-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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

(series fully reviewed)

Since v7:
- Corrected commit descriptions
- Consider TARGET_BIG_ENDIAN for petalogix-ml605 machine (Thomas)
- Remove pointless QAPI description (Markus)

Since v6:
- Simplify MemoryRegionOps indexing (Thomas)

Since v5:
- Introduce QAPI EndianMode
- Update RISCV machine while rebasing
- Fixed INTC use on PPC (Thomas)
- Dropped patch adding more machines (Daniel)

Since v4 & v3:
- Addressed Thomas review comments

Since v2:
- Addressed Richard's review comments

Since v1:
- Make device endianness configurable (Edgar)
- Convert more Xilinx devices
- Avoid preprocessor #if (Richard)
- Add R-b tags

Philippe Mathieu-Daudé (6):
  hw/qdev-properties-system: Introduce EndianMode QAPI enum
  hw/intc/xilinx_intc: Make device endianness configurable
  hw/net/xilinx_ethlite: Make device endianness configurable
  hw/timer/xilinx_timer: Make device endianness configurable
  hw/char/xilinx_uartlite: Make device endianness configurable
  hw/ssi/xilinx_spi: Make device endianness configurable

 qapi/common.json                         | 14 ++++++
 include/hw/qdev-properties-system.h      |  7 +++
 hw/char/xilinx_uartlite.c                | 34 +++++++++-----
 hw/core/qdev-properties-system.c         | 11 +++++
 hw/intc/xilinx_intc.c                    | 59 ++++++++++++++++++------
 hw/microblaze/petalogix_ml605_mmu.c      |  5 ++
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  6 +++
 hw/net/xilinx_ethlite.c                  | 29 +++++++++---
 hw/ppc/virtex_ml507.c                    |  2 +
 hw/riscv/microblaze-v-generic.c          |  5 ++
 hw/ssi/xilinx_spi.c                      | 32 +++++++++----
 hw/timer/xilinx_timer.c                  | 43 +++++++++++------
 12 files changed, 194 insertions(+), 53 deletions(-)

-- 
2.47.1


