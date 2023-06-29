Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6F7EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 12:03:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEqMZ-0002LK-9V; Thu, 29 Jun 2023 08:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEqMY-0002Km-6X
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 08:03:02 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEqMW-0005FI-KV
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 08:03:01 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-313f3cd6bb4so552894f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 05:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688040178; x=1690632178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rtqq+hD2yz2b0nLytSPEROIxhKxIpnYBcjnLBP197u4=;
 b=bdMgOZ46UsRRCYKPKEupFJ8Qlv7XLB8/ZPw6FPBHm4Q7B+KEjr9boECzlUK5s3dAUA
 gpgkpgKmBKNCJyVw274T1ZoEfgTQ+spY9Rqbadh5D4qNufyfVa5P4pMH/Pz/EK8WbUfl
 DLntgBij/byAOn8TJru/R51Zg9SAg1CV/gasQn5FQoEjuuwD+/k0O0GBybUL8dx6BBbu
 qMpOTnjArA1sqhqpuSG3ualrQLEppNcFYk+0QJt1/0mDlgTCXxttFpsHbkSbjDHNpI9O
 uxpxDgidfqV9aZIFDxP4Ru+JDm8HJrR8TcVGw9RECKINSpn5vsM2IqBRRLvBhAlToY+I
 cybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688040178; x=1690632178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rtqq+hD2yz2b0nLytSPEROIxhKxIpnYBcjnLBP197u4=;
 b=eOTf51wruTIvvVHhSaUzVigX9t/KqpNT+VDU72Jn0dR/Ex/+YYRhzuyvcPbOf9sj14
 twXTNoW42peoF83KxpA9Lt4tVbMELeCda0xhB7TUVIEe1b5dXOvH25E/4bBlRH3cxLBz
 j3oJzDJlqfMnljYsD4D3suSG8ST/5aVcy4yPKx1+ODedCLzsatKpGm6jzhSAT/T3bY3c
 aNeTe40tWrxjbqxuii+K6BNH6Vrd45FPz/+SaMhrKyQJkeGbjoiC5He1Fol47DlpgBZH
 g+332/srghB+zIjN/XFCqv9j1ypQUkxkB9NOJ0XHMyRaYmVFLkjZlYx3WwTmON2CgQEi
 xaEw==
X-Gm-Message-State: AC+VfDygj0xgsXWXyTrZTFZmpWHwtAaS0mlZGupZdF09OIFMtYk+0Eym
 O/bkUT1SI6UTM5xpy4QbwEXc5Q==
X-Google-Smtp-Source: ACHHUZ4pNJs1sHotE5LPL1332jgUjS9dZAE9K5EV450ITiaDxwt5CUtP8lJOQ5az7Oofzw4k0GFBVg==
X-Received: by 2002:a5d:500e:0:b0:314:f8c:a06f with SMTP id
 e14-20020a5d500e000000b003140f8ca06fmr3244011wrt.57.1688040178635; 
 Thu, 29 Jun 2023 05:02:58 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.242])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d58ca000000b0031128382ed0sm15680406wrf.83.2023.06.29.05.02.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Jun 2023 05:02:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 0/2] accel/tcg: Remove qemu_tcg_mttcg_enabled()
Date: Thu, 29 Jun 2023 14:02:53 +0200
Message-Id: <20230629120255.85581-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Remove qemu_tcg_mttcg_enabled():
- check for CF_PARALLEL in riscv cpu_init(),
- directly check 'mttcg_enabled' in TCG code.

Philippe Mathieu-Daudé (2):
  target/riscv: Check for CF_PARALLEL instead of qemu_tcg_mttcg_enabled
  accel/tcg: Replace qemu_tcg_mttcg_enabled() by mttcg_enabled

 accel/tcg/tcg-accel-ops-mttcg.h | 8 ++++++++
 include/hw/core/cpu.h           | 9 ---------
 accel/tcg/tcg-accel-ops.c       | 2 +-
 target/riscv/cpu.c              | 2 +-
 tcg/region.c                    | 3 ++-
 5 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.38.1


