Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6F4C7EE2E
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 16:46:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7Ill-0006ZW-0i; Thu, 08 Jun 2023 12:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q7Ilj-0006YY-AF
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 12:45:51 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q7Ilg-0004zB-Kc
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 12:45:51 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6af7593ed5fso464638a34.0
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 09:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1686242747; x=1688834747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dbyg+3rLiafmftEC2QBZoCf8N+IfPj0zZvJkRSWlBzk=;
 b=QzxKym2bES8nRKZZGOZhG/1+WPXrSSnwzcNm9jORewQSed4Azfys4f2l8CxhFfIYsN
 3aM9V9lCQup5/5QpvCWoCMXChM0RLNr02iRge1DdpteGCW2ldetmI+OR5j2hrmrFnyGN
 SKSDei0onwHIrR2xmT3aWSKe/ddc2T/7FilfYTLDyWIkj2l0Nm4ei/Tbg5zAxbYpexpx
 5njpAxYU/700DwqA3OjHI3+oSk3yXSl98DRgtmmmyDvloEygdt/vt0ttkdGVuJNCjLmd
 w9Hef+e5V0I5v+mHO7cZywm1FBD9Bb0YF7XR9cvtDDfsPVvDW2mF5dbhF5AqWiiT67w5
 WQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686242747; x=1688834747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dbyg+3rLiafmftEC2QBZoCf8N+IfPj0zZvJkRSWlBzk=;
 b=KMQ7ZSDVtuc2zpzOB39rBe65Ijit1U2OgsSVAPxJwjTr3+Ot3LM/cnZHmPO+rrJvur
 vVEhctu2Aj+Bi7JjfvLl+s+e+awKwg6yNQoZrlZAxjek1e1SJotmViUoz+6I1VcRzdf1
 u7HGl4MM5Vd1J1WdvbGJ8OJXBraJIb2D1wzOu+aDKukKg36w5J1RLl6C4IOU7wUAzHCf
 HPcyHebFLgqpYohbdD58mm65vWqb8PqH/rlatl76LqEgqo5QXSEH7UtUxs5FU5IUgWIE
 9R5YRQcZgvvNTItPNf1iDEYlu8y44cU76D34vU0GBr5O9/KTwWGoHuzJSw7HbEHcLiUd
 Ab6Q==
X-Gm-Message-State: AC+VfDyuYtrWzX+dL25MxKo1CafchePqiZm46IMiDRIHsEMUaedc6mae
 qMpIjbfiWkhibKxo//y/9sSuwA==
X-Google-Smtp-Source: ACHHUZ7CcT58ehiIeJQXhEoD/6Avraa51wgketaook68ALorFQuTJmVZ54unAGf2otXvQS0MvOzyCA==
X-Received: by 2002:a05:6870:d892:b0:1a3:5f63:b4b3 with SMTP id
 dv18-20020a056870d89200b001a35f63b4b3mr2302677oab.56.1686242746609; 
 Thu, 08 Jun 2023 09:45:46 -0700 (PDT)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a4adb8c000000b0054574f35b8esm9107oou.41.2023.06.08.09.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 09:45:46 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, liweiwei@iscas.ac.cn,
 philmd@linaro.org, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v5 0/3] Implement the watchdog timer of HiFive 1 rev b.
Date: Thu,  8 Jun 2023 09:45:39 -0700
Message-Id: <20230608164542.3675619-1-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=tommy.wu@sifive.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Changes since v4 ( Thank Phil for the feedback ):
- Improve code style consistency.
- Move the timer create function to the sifive_e_aon_init.
- Allocate the sifive_e_aon device state in the SoC.

Tommy Wu (3):
  hw/misc: sifive_e_aon: Support the watchdog timer of HiFive 1 rev b.
  hw/riscv: sifive_e: Support the watchdog timer of HiFive 1 rev b.
  tests/qtest: sifive-e-aon-watchdog-test.c: Add QTest of watchdog of
    sifive_e

 hw/misc/Kconfig                          |   3 +
 hw/misc/meson.build                      |   1 +
 hw/misc/sifive_e_aon.c                   | 319 ++++++++++++++++
 hw/riscv/Kconfig                         |   1 +
 hw/riscv/sifive_e.c                      |  17 +-
 include/hw/misc/sifive_e_aon.h           |  60 +++
 include/hw/riscv/sifive_e.h              |   9 +-
 tests/qtest/meson.build                  |   3 +
 tests/qtest/sifive-e-aon-watchdog-test.c | 450 +++++++++++++++++++++++
 9 files changed, 858 insertions(+), 5 deletions(-)
 create mode 100644 hw/misc/sifive_e_aon.c
 create mode 100644 include/hw/misc/sifive_e_aon.h
 create mode 100644 tests/qtest/sifive-e-aon-watchdog-test.c

-- 
2.27.0


