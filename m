Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8ACC531C9
	for <qemu-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 18:39:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wnhH9-0005en-2m; Sat, 25 Jul 2026 14:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dubdublan1987@gmail.com>)
 id 1wnfc1-0005RL-I1
 for qemu-riscv@nongnu.org; Sat, 25 Jul 2026 12:52:33 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dubdublan1987@gmail.com>)
 id 1wnfc0-0006Ww-8l
 for qemu-riscv@nongnu.org; Sat, 25 Jul 2026 12:52:33 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2ce98cb8165so17182575ad.1
 for <qemu-riscv@nongnu.org>; Sat, 25 Jul 2026 09:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784998350; x=1785603150; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PmJO0SuxHrPS+VQPA9MfrfcxKZ5WavZGciWI0XW6mz4=;
 b=Cd4IIRYCdoyATUgdAYUtX/7xCuJLGQrodrzL7+SlPqg2LAawic86i/607fob7SumGg
 kjyJN3nlpimYodkYhml7TXn5BNdzpZyTRffvmQaGybkIvkRXDZoQpf+CZoex6ZLmuS0v
 CrtMfUGb+6IWbvQulSgho2A/ORTFuGLUx+yzr67lj2WLevVkj/ljaYAkvDDJ+HQcH384
 hVnf93eoQZEQV2MS71EzaXhz7Ur3y22HpGHO50j8K2aEHUSTS/dMEQXs4nzISPNijvp6
 28q4GyAnDmDnIGWYgpemYH2h4Sunsa2ULEZ4RBo6cI0IOWmP/4UFBRWl2YNoMVEHmoG7
 uO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784998350; x=1785603150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PmJO0SuxHrPS+VQPA9MfrfcxKZ5WavZGciWI0XW6mz4=;
 b=MsrtLMR0cRAljZzmcpVnn6XHQymo1Ur14cjjq5cvPFJnCHC82c544ldlMHeqAjLc9C
 aZXSzurAxEE6XBXpkjPgbcU6ZwE91HtJ5QaGp2e38Kd0+daU+DBTGqB3l6zM6h/4zCQj
 m8kj8jQrJ/h6zKXArAs+B0irkJJQZe3ct/UPEDkFHK+nwXEO4GXboHxrN61U3bm+/vyX
 totRfcUzYr1q5nRQkv7eLlh5A9RgjsYSW2F6ENPI2nMwtevPPGKxBuLqhI5rVRMW+Z/+
 e4+Etbk5RcmjVLvlhyvfLB3TyiRNOPNdxn6G5PuVLvxT5AC4036Z2qIQMk+935D0f239
 t06g==
X-Gm-Message-State: AOJu0YycRIb1PNLwBj+GeBZOsMaLWuI797DsRy25TbqkHhmvJyXLi+wB
 d6SO879D4W90NOH4Uezt6MCJDrKxpzM8oB3BjamllF4vpsFc7dIYAIKy
X-Gm-Gg: AR+sD12ZYIIpEJWoOhYAFMVTL6zUtoju5Pkg1MWUIXq8Cms5y4Y0btJKQKxJYxYDOac
 S7V1ty668oJPvwhSksiXeUwHy8re/M7PGk+elad4fLklf+rHMKrSB4udMrPq95aqiDrAh/9FK83
 ujPGYEManqbRQQSqeqx8rYh6a8bYgLHgkp1gXNMnMUxgZYmjoEpTDY94i+sl5qxuLLcJd0v1JN2
 zYKU+ZDFc75Ok0paznBWku1r3AuJpN2tnEPLAf2GdCKb5gDEa8O4UfK7JBpauSqA+agupUIu6g4
 vUwRq/r4bqxcqak8zTIitnfPUaUDc2isqPl9YP0uoO/rDRCi/BT4VgIQPrwAqzjMXPIgHs8mHlF
 0X13kIubrQUjzEnd3no1MeDrKtc2+zB8i3EEw3Poq05tqmYbTUSmeJg7cldPGkpvY9SpU+tJJFx
 IiIKIr1hmhJCozFvVHLLOWlW6nEa9PJA==
X-Received: by 2002:a17:902:ce10:b0:2c7:c385:c5a7 with SMTP id
 d9443c01a7336-2cfd72a5398mr44873695ad.26.1784998349869; 
 Sat, 25 Jul 2026 09:52:29 -0700 (PDT)
Received: from localhost.localdomain.localdomain ([27.115.61.146])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cfde81d81csm11027105ad.80.2026.07.25.09.52.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 Jul 2026 09:52:28 -0700 (PDT)
From: lanxiaoyun <dubdublan1987@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 lanxiaoyun1 <dubdublan1987@gmail.com>
Subject: [PATCH v1 0/1] *** SUBJECT HERE ***
Date: Sun, 26 Jul 2026 00:51:17 +0800
Message-ID: <cover.1784966571.git.dubdublan1987@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dubdublan1987@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 25 Jul 2026 14:38:59 -0400
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

From: lanxiaoyun1 <dubdublan1987@gmail.com>

*** BLURB HERE ***

lanxiaoyun1 (1):
  hw/intc: resample level IRQ on PLIC completion

 hw/intc/sifive_plic.c         | 4 +++-
 include/hw/intc/sifive_plic.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.43.0


