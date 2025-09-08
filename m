Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFAACA101F
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 02:53:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uvRys-0004lR-Uj; Sun, 07 Sep 2025 22:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uvRyp-0004aj-Mq
 for qemu-riscv@nongnu.org; Sun, 07 Sep 2025 22:51:43 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uvRyg-0003j7-6l
 for qemu-riscv@nongnu.org; Sun, 07 Sep 2025 22:51:40 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-7728815e639so2048230b3a.1
 for <qemu-riscv@nongnu.org>; Sun, 07 Sep 2025 19:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1757299884; x=1757904684; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xP9a8Kw49JWphmuuT6z7629GJ1vhcNYD+R1e6O3zS5s=;
 b=MhaI00NyElft157OdU539civVtgTyLtEos0rJwYSs6r/b/k+85eNhAkz9wXXM8jk+W
 qLk4rP1cIylFPewOmbmKUaperDRp7y3bNmJzVGKqgAX6k7tTkKmi76jyYyD+TUKCon6e
 4y0sn6w8OWBzserxkLyt9YPfM73vNNZFEMzasUaFpwBC4thENQUhxhFR4TRPynWo2Iur
 32Zb4YaIlTMcdUWH0eEbw0QQYt1L9qQhGUrsPC9a32y3OlKRRyXZkGCNBljKR/U2Vch2
 sJvoCemA8i5chg6T1pAAWycfSTSnWixydbDVP99eQZq9p6jcfsz/PpzJF1dmfVHEQDDv
 Ny4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757299884; x=1757904684;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xP9a8Kw49JWphmuuT6z7629GJ1vhcNYD+R1e6O3zS5s=;
 b=AWDC7Z3iIyGfMF+GblpqlWYCZSXHZaSjIVcZbQpNmFrnvkyVV2G1r+EQdTq+srv9mW
 HsMbmHV7Cb0fwlQHbJMOSvNDfaOPLn0rVaRztdqw7kBPn+6D+lfx0ObRBbu5QX9L5JUv
 RhLzF6HG0eSsUJekPf/p5IwAWZD3w0Jnfof4kEg4HirxmgDd6s7aUcD/MosrHK5I6pOV
 wX6OmsIz/mZqcXwtdImVGlVy8K2bdCwvY1I5ROIR7PQFR4Kzj/2EBhWzI0bQTKNafCs2
 0Vjrr2Tc/W94KuuJE0KlIwdmwwzNSXQpyLyAfoU6o6Y94NfgvwTue6UYvc8UQWSd9oP6
 R+Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9LWCmkz8f45YIWbjUY2qUhbd9YoPnhqKo7MVwifURatURGtJ8xFZ7EiYG1BrAg2JkCRCke4jy88ql@nongnu.org
X-Gm-Message-State: AOJu0YwfhlBPY6tYUNPRzY6fO/vVyG/971LJvivmycyNw3bHyiqKfoeW
 WzfQk22814eRo9z8N0Ipz7rJdQkT1/ZDjEHH0yxvGpeuP75t3KOme9vvrh/Vm502QnA=
X-Gm-Gg: ASbGnctRQZWQUI6ofbMR8ZtvzgZxzBA4ZDLNCC6HCkTdEVJFNiuhaI4HYYvzhoJCedJ
 d+a+TFo9i+ptl4r4x884nqqLo+Mbq1ID//D1mmnegKayJg9SF68jsKlpNRPBv8noGI2FTAUndJp
 zHKh1pBY8SV17xqEbhtrBWuWEfM87wjIt2BGSgZ/dw9G98FEBJaVHtPHlJ6Re3DMYJyuSr/rnNn
 iRO6WrFy8FWne846/+dQEF20KEFXaVtljjE+n51ggZ7qxFBe7CmyzeJ+kjqHyOI51xRuVj3ZE3s
 coIFMtH0vRv6vUefnAteQK0tAcoRKjSfFqdLQ4itUCENFKi915X+YbxF7VJRbYkBMQdCxC63p9l
 UHDaw8cf8a8OnEkfT8c0mArDIB/tu5tWr/2eai8CZ+9RULhfaUtBRLp/kjKIZHwxxETwbCHB/LC
 y8QQ==
X-Google-Smtp-Source: AGHT+IFgOmjiGAXzD5dJjA9n1n8ZJI1uTj6N5/XQ9idKdtMRIA2l0muAQTj0zPucvjjp4RX4ADA6tA==
X-Received: by 2002:a05:6a00:17a8:b0:772:5165:3f68 with SMTP id
 d2e1a72fcca58-7742de615c8mr6479526b3a.27.1757299884246; 
 Sun, 07 Sep 2025 19:51:24 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-772306a1870sm26823834b3a.75.2025.09.07.19.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Sep 2025 19:51:23 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH v4 0/3] Add Zvqdotq support
Date: Mon,  8 Sep 2025 10:51:14 +0800
Message-ID: <20250908025117.1728895-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x432.google.com
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

This patch series adds Zvqdotq support.

The isa spec of Zvqdotq extension is not ratified yet, so this patch series
is based on the latest draft of the spec (v0.0.2) and make the Zvqdotq
extension as an experimental extension.

The draft of the Zvqdotq isa spec:
https://github.com/riscv/riscv-dot-product

v4:
* Update the PRIV_VERSION (Thanks for Daniel Henrique Barboza's suggestion)

v3:
* Fix casting and simplify vs1/vs2 access (Thanks for Richard Henderson's
  suggestion)

v2:
* Remove unnecessary variable and mask (Thanks for Richard Henderson's
  suggestion)

Max Chou (3):
  target/riscv: Add Zvqdotq cfg property
  target/riscv: rvv: Add Zvqdotq support
  target/riscv: Expose Zvqdotq extension as a cpu property

 target/riscv/cpu.c                            |  2 +
 target/riscv/cpu_cfg_fields.h.inc             |  1 +
 target/riscv/helper.h                         | 10 +++
 target/riscv/insn32.decode                    |  9 +++
 target/riscv/insn_trans/trans_rvzvqdotq.c.inc | 61 +++++++++++++++++++
 target/riscv/tcg/tcg-cpu.c                    |  5 ++
 target/riscv/translate.c                      |  1 +
 target/riscv/vector_helper.c                  | 57 +++++++++++++++++
 8 files changed, 146 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzvqdotq.c.inc

--
2.39.3


