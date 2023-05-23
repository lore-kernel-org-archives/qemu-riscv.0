Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BA0C7EE26
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 08:50:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1Nht-0008Cq-Ds; Tue, 23 May 2023 04:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q1Nhr-0008Bh-Qo
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 04:49:23 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q1Nhp-0004GR-4R
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 04:49:23 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-64d1e96c082so3971541b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 23 May 2023 01:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1684831759; x=1687423759;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IU5w0oS9yyZnRCqR1VucKJ53fqo8Yk2+asoGMqr5q10=;
 b=bvZFc0QhejOiCeiQyDhh4Knb0k3cD3/bp6WONGQYpIOlwECLDV+kLPoKWfvLPyVAGc
 Jo6z+v2dbRyCYQulnPe7A9Q9C0WmsLX0D8vrhq8AeN6Mrz9HSBorUKqjNGIo6wkw7WrD
 R5l0QQsnvvLHe7Bpz9EtO8jCweqeI58xAkBb/TnLH4i2QhEFFnziKuz7kq9Ki211gNth
 RS30lv25dXC+AmqVmawu5ZqGY44sEFci8LSBnqUlYp5pYrfH9iCfMwwIg6W207WP7Pqs
 hkQgfIvGIDWyfX3nv9VECge+bdbPz/XSJsfthGGzFTLfAwcL4KvQ2FUo+th2KZmC0hcQ
 x9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684831759; x=1687423759;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IU5w0oS9yyZnRCqR1VucKJ53fqo8Yk2+asoGMqr5q10=;
 b=TJBYLmeYL5FN9OSDQ/+q5aWW2UIkbIXk4O99PGzVA3+CtEEmZ5xS/YDCS2emlgJdUD
 ZbqYOnHQn9AMaOMLFcIvfCRvtrRimxxPB4AK2IsOFQ5ndLYINOx4dHpmKofwYs4f24hY
 0maEG8u3USlNAEAswC6Xd0vKLlqN2AfTL5jg3QMVoPaFBC5gbHzchNNBO8MADTZoDCV5
 Fv62w7y4pRtxSlzEC2rpLa7ilibnk6JTo1m55OXTP7EXftN3+Ab/cegT14Yc6MZSl3pB
 exPojPO4XN+RdvqajU2nScfR+bBRH4KYP4ext6dXqno/MWg1PlWHQfP5CkCAhlbRYKwz
 q7IA==
X-Gm-Message-State: AC+VfDxlUUcK0QR8dCceVJG3FeGScLy4nea0oI6mhPHBIWrY/Osg7zBP
 KF6S0SqitMuobkaPAJvINow5Mw==
X-Google-Smtp-Source: ACHHUZ7qYDiIqnesRpAinU+JbBwwUOn+G1PIQHttkgpyKssTB9e5Zv0+WR9T0wNYBBMtqnEauvWg8A==
X-Received: by 2002:a05:6a20:5482:b0:10b:71c:20c5 with SMTP id
 i2-20020a056a20548200b0010b071c20c5mr9956005pzk.51.1684831759479; 
 Tue, 23 May 2023 01:49:19 -0700 (PDT)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a635118000000b0052858b41008sm5634475pgb.87.2023.05.23.01.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 01:49:19 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, thuth@redhat.com,
 liweiwei@iscas.ac.cn, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v4 0/3] Implement the watchdog timer of HiFive 1 rev b.
Date: Tue, 23 May 2023 01:49:07 -0700
Message-Id: <20230523084910.304679-1-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=tommy.wu@sifive.com; helo=mail-pf1-x42f.google.com
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

The HiFive 1 rev b includes a watchdog module based on a 32-bit
counter. The watchdog timer is in the always-on domain device of
HiFive 1 rev b, so this patch added the AON device to the sifive_e
machine. This patch only implemented the functionality of the
watchdog timer, not all the functionality of the AON device.

You can test the patchset by the QTest tests/qtest/sifive-e-aon-watchdog-test.c

Changes since v1 ( Thank Alistair for the feedback ):
- Use the register field macro.
- Delete the public create function. The board creates the aon device itself.
- Keep all variable declarations at the top of the code block.

Changes since v2 ( Thank Alistair for the feedback ):
- Delete the declaration and definition of the create function.

Changes since v3 ( Thank Alistair and Thomas for the feedback ):
- Use `device_class_set_props()` for the properties in sifive_e_aon device.
- Add SPDX identifier in QTEST.
- Use libqtest.h in QTEST.
- Let the statements on one line as long as they still fit into 80 columns.

Tommy Wu (3):
  hw/misc: sifive_e_aon: Support the watchdog timer of HiFive 1 rev b.
  hw/riscv: sifive_e: Support the watchdog timer of HiFive 1 rev b.
  tests/qtest: sifive-e-aon-watchdog-test.c: Add QTest of watchdog of
    sifive_e

 hw/misc/Kconfig                          |   3 +
 hw/misc/meson.build                      |   1 +
 hw/misc/sifive_e_aon.c                   | 326 ++++++++++++++++
 hw/riscv/Kconfig                         |   1 +
 hw/riscv/sifive_e.c                      |  13 +-
 include/hw/misc/sifive_e_aon.h           |  60 +++
 include/hw/riscv/sifive_e.h              |   8 +-
 tests/qtest/meson.build                  |   3 +
 tests/qtest/sifive-e-aon-watchdog-test.c | 450 +++++++++++++++++++++++
 9 files changed, 860 insertions(+), 5 deletions(-)
 create mode 100644 hw/misc/sifive_e_aon.c
 create mode 100644 include/hw/misc/sifive_e_aon.h
 create mode 100644 tests/qtest/sifive-e-aon-watchdog-test.c

-- 
2.27.0


