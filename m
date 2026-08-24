Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F2DC5DF8C
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 05:58:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyNgi-00009f-Ip; Mon, 24 Aug 2026 01:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wyNgC-0008SV-ED
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 01:57:13 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wyNgA-0004E4-64
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 01:57:07 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-8486672f03cso3092130b3a.0
 for <qemu-riscv@nongnu.org>; Sun, 23 Aug 2026 22:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787551023; x=1788155823; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=Urw+TPvG2B1ng41zr1P/WXr1QBJ22AO4z2NlpERbuIk=;
 b=f+xOUq3e8OAqwMCiOSHSjMjdBTAdTICEFePqGlv5RH+NEGeotjoLBKAlzAHJpZvZgP
 Lr3N0zQp2a0c+MMaFak7vi+xEXCKND+6v1+/JBA+qiE45k8MsSexaBmizxKSBFPDRqNL
 6x1hhhqNPtrFemKXTlr3MFbSqjP5C3gN+vnit6E4JItv1ZiArEesPLdQ90g0q3hBbD+i
 V8cS11e2FE2h3lSre/XZYXVBpUs0TLCOTKAAp9c1V9tFWSsEnOwEybnBSvWXchJe420P
 uhjUnvS8qQSgOUsyVgyvLaaux3avy7H3fst3SzCEvSpkH/P6bKfUYDDFFOEAF4sVXKJB
 4T3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787551023; x=1788155823;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Urw+TPvG2B1ng41zr1P/WXr1QBJ22AO4z2NlpERbuIk=;
 b=EDe2QuHbHSeyWlPPwkNQxUQxOQ21cvj1Lzny9r6gLQ+rPbxFZTJAL4bJ72ohTpuCFN
 5gbONzvkOlIHGVR3K15K6tWcoKv/PkCRCsKi1UT+CQA8EUJjiHmlJ6mBiLV3iO5rFY1x
 NQ3f1zpsHUl0K3WO19Zm7uQKUaRvD2vq/pvMIguqlAgahUaMZJVaSrtO+lLzaxCVNyDB
 SvQw1w9B7FG7yfPGj73GYZZ+rgHD8hwlzWxbqZz/QQAjDLrn5uAnz4eL45xqW9QF0Loh
 hiG+mvpzpRuT7TbxyCYskZtFXzQm/bFnqQvCo3eWTZrBDQwLPFW83JUEgqJxUFDAb4Gq
 RuyA==
X-Forwarded-Encrypted: i=1;
 AHgh+RosSJjZPaEQCESbtPI3uxKb+H1j2avbdSev5T283gO0tXXXwwG4EM8pXwBjjhNHzf1YGQZSDtMobnAa@nongnu.org
X-Gm-Message-State: AFuF++mpjfdgCIX/E5G38ZlHO0yqDfy2ENDLkNJkiP3glrhEqdp4qJtn
 zJ4kmkSx8kBB2Wk+B5m1Cex8NzCewKrB9L103mPkWjy4mmJ/3WPjsYPq
X-Gm-Gg: AR+sD13hcFgie4kCred+CMAcijIkHYR6TBMCncPp2FGUQTsQsizRV2vHi3Zg34g0o4W
 QJsJf7Fc6XZR2KuWNyPaSYivRZfZPhqT0MR76nqYRKDxUSO8BiN/6A4PHeteZm+H2oOOpvfq6zn
 wRAmzwbHC83Ek51aRr0tbT7triHuW5xcXSZVC4NQN7CsdaLZxdKYyGGN6DTRYBCEE54L+mhFgIu
 uEuN1uKrkeVS+uLc0XSBKxvfWsEUoHcthqWBx6uJ/Jwe2VD/XuKJ8RB/PmlpovKE2aEZcS5cW4V
 +rl43dFN/RVs84mmRFWsEhzpnqxfynNISNsEFLl6bljVaYDh41t4tcc85g6b2xcfBuO4YkfGcbM
 F+TfW7iWrW3lkD2R6hS93YNDaHgXADQD3yOBXKSbst0xDqQpTnAKGFv/Hmn2m4YlElHILD9qun0
 G6vFcZb2ihCIKdFmus+F+iEP3wIx/1yWuXYRkmtoLFG+A8oXPhPdD/6n0yHDHGqZ4Fr/xYY81Y3
 w8ygwKVohQiG8l2GG8b97MT9mtx4rUfO+cH+wsySJcLeMThEbZeLVjwivZalf80UlcGrhgyr/3p
 JMr+WI6NIP3t5uPZzxDoAw==
X-Received: by 2002:a05:6a00:2d86:b0:84e:24f:2677 with SMTP id
 d2e1a72fcca58-8520b966111mr26176715b3a.4.1787551023463; 
 Sun, 23 Aug 2026 22:57:03 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8520f03b494sm1583474b3a.33.2026.08.23.22.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 22:57:03 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 0/4] hw/riscv: Post-review cleanups 
Date: Mon, 24 Aug 2026 15:26:36 +0930
Message-ID: <20260824055642.41098-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Phil made a bunch of suggestions during the Atlantis review for things
to clean up afterwards. Here are those cleanups. The patches are
otherwise unrelated.

Joel Stanley (4):
  hw/riscv/boot: Make RISCVBootInfo const where possible
  hw/riscv/virt: Use hwaddr for IMSIC device tree address
  tests/functional: Avoid unnecessary removal of scratch files
  hw/riscv/atlantis: Document QEMU-only I2C device tree nodes

 include/hw/riscv/boot.h                   |  6 +++---
 hw/riscv/boot.c                           |  6 +++---
 hw/riscv/tt_atlantis.c                    |  1 +
 hw/riscv/virt.c                           |  5 +++--
 tests/functional/arm/test_bpim2u.py       | 11 -----------
 tests/functional/arm/test_orangepi.py     |  9 ---------
 tests/functional/riscv64/test_sifive_u.py |  4 ----
 7 files changed, 10 insertions(+), 32 deletions(-)

-- 
2.47.3


