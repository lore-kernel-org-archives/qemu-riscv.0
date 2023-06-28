Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6C3EB64D7
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 06:32:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEOjM-0002dS-UR; Wed, 28 Jun 2023 02:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEOjK-0002cq-Pk
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 02:32:42 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEOjJ-0002k1-1E
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 02:32:42 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-313e1c27476so504898f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 23:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687933958; x=1690525958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w/a5B7ueBaDGLM1E0Zx9Ja1fFo71IXXbChenEJIm/yg=;
 b=hywqkcIu+gV8llYI++B+InjuVQB3qyh59ZmIcFNpihTwVEXl21bIK/ChS1hNLm9nap
 ywhfBOcoGWrX6DIVhBwgs9z7p3gVuODDu/ZAPJ6i9LjwqZFvQfLsdB9jMRZRJ1ebbuHw
 1XaCY/lgHQjJl7XUfBUxtOvjicYwMafc5ZZbHMWfEzDU/pguYFIN/oxcT0YTrLiSqKQz
 n6l2eWAd3yuLqHOQv6xivOuLG0Fc6sawyZUPOBzXG48Hz5cpDJ/DJzm6wuNQAECAyA2I
 YBVSiCFZQ0n9rGoPIITAtEHm76o1VJ2wAurYNjCZSuZfGTxEnE9CPhcL3qbnCzwfDKk+
 R9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687933958; x=1690525958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w/a5B7ueBaDGLM1E0Zx9Ja1fFo71IXXbChenEJIm/yg=;
 b=VUCzIwhrBoL2eruQBpvzzVJYYK+AIKIpgVSV6qLsETRjk2H/v0xyCLvgzsRASxREk7
 LVbUY0lwpjnN1Qzl1FEOqh/kuL6EwC5kSA3Itd6xOzKTeaJIEp7deyRCCJk3+/0gM94+
 yTvcniPNoo7S+NgaAktQz7yvEGBIkhjtFEJpDn+iX7P3cU+ceZDuJEk7xZ8XRSlYzRQa
 q63yh+nEtVgmxBAunJWvqyoeqlX7FbdQNb2cqH/h5LFn5H1ggzTzLfnAWCkPw3tjjYJZ
 d22dH3nJRck00/v67WBa7hl9PaiI4YovQGLhTHRXGF8hP9E/W9mDkbxQbtNlLqToOTlc
 jVnw==
X-Gm-Message-State: AC+VfDwQGNL8BLUkPscflbIQCCm8eYXJp4lDcc5bJx3OGD7LusGjAnPY
 YoK8Ds6dQo6o0+GrQxvBdm4r+s6UiWWNp2C1Zxk=
X-Google-Smtp-Source: ACHHUZ5yNOYbXUg3lpxqEkLwKCMwM4uCRUNIcJvDz+m2hlxkmSWPZunGsc69p1aC9joP9jL3NAtmKQ==
X-Received: by 2002:adf:fa52:0:b0:313:f5ea:44f7 with SMTP id
 y18-20020adffa52000000b00313f5ea44f7mr453961wrr.35.1687933958187; 
 Tue, 27 Jun 2023 23:32:38 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.207.229])
 by smtp.gmail.com with ESMTPSA id
 cw8-20020a056000090800b00311d8c2561bsm12365018wrb.60.2023.06.27.23.32.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Jun 2023 23:32:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/4] target/riscv: Misc header cleanups
Date: Wed, 28 Jun 2023 08:32:30 +0200
Message-Id: <20230628063234.32544-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

As requested by Daniel in [1], these patches are extracted from
my "target/riscv: Allow building without TCG (KVM-only so far)"
series and cleanly rebased onto Alistair's riscv-to-apply.next.

[1] https://lore.kernel.org/qemu-devel/59b5b342-8940-5ac1-0cec-8c136c4916d8@ventanamicro.com/
[2] https://lore.kernel.org/qemu-devel/20230626232007.8933-1-philmd@linaro.org/

Philippe Mathieu-Daudé (4):
  target/riscv: Remove unused 'instmap.h' header in translate.c
  target/riscv: Restrict sysemu specific header to user emulation
  target/riscv: Restrict 'rv128' machine to TCG accelerator
  target/riscv: Restrict riscv_cpu_do_interrupt() to sysemu

 target/riscv/cpu.h        |  5 +++--
 target/riscv/cpu.c        | 20 ++++++++++++++------
 target/riscv/cpu_helper.c |  9 ++++-----
 target/riscv/csr.c        |  2 ++
 target/riscv/translate.c  |  1 -
 5 files changed, 23 insertions(+), 14 deletions(-)

-- 
2.38.1


