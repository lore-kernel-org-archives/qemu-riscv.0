Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150DCC5AC80
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 11:47:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wt1yq-000308-A7; Sun, 09 Aug 2026 07:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <0860734llx@gmail.com>)
 id 1wswu9-00080S-Sm
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 02:21:05 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <0860734llx@gmail.com>)
 id 1wswu8-0005sQ-8A
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 02:21:05 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2ceaf8a1265so13555975ad.2
 for <qemu-riscv@nongnu.org>; Sat, 08 Aug 2026 23:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786256459; x=1786861259; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=xYDxUzufOV0PG6l3Lj3peaKR66dPAO7VhKJbyoGdL/0=;
 b=Q7N1DACBAGv9hbQPTGPRF1nkVGGyt2HOwU7YVXHBMMDhPykTk4hhzSmBN4IBe+4/kN
 Uo2L/9/Lznr2+qMSbTsBGDLVMWaABKh7CSJb65cEopkEPTj3YyPCHMQEqBlwatooyY/3
 ROO+aopLzvpOlnOR8SoG4jWvwRjqjOn0kGfySqycQ0OoxzmXU1HMujw+jSeQMzXb/XTA
 QdBVTv1g5XwjKmtKQIMqCafpCT1mmSsi7XyM2xSidXvQGL2Ru5sNhurAzojh5Q3ZGYzA
 s9etg/x/F0tzYS/JnozMxLZShn2aSd3068fA71RZ/dAZkOk3Gtcs2GCU2Y2NBPCa370X
 MHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786256459; x=1786861259;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=xYDxUzufOV0PG6l3Lj3peaKR66dPAO7VhKJbyoGdL/0=;
 b=HGVCLXlDC4Ek5J+3uhAyo6S3WoQ3TS3Ecgf2LruBtqWqFhnIcURJHqa3UC/XJy311q
 EX1ZsnAm10g+S6pRdaW6NpOh9nNQUV54eRsn0/nO6s3SzMtgNIuW/CZKr3vC5Hp6Qb5T
 RfpWUrCGGSvE7S12HGDNCVhwdEkDRcVtdLRelaIwHrle+gVL9QhP+IJm2OCG8BWNHB2k
 Zi40SO82TRR4L0N9gwevSfKyjk8XbNZ0+vTniASwAcBDCOC/cVBOkxMfd59iXn1rTxk6
 afnIIAOx2s+oNf77ow7KGISkXCglDyaetu+TkZ2/a5h/Jgw8ncpwM3hOE6oW/rhX1ZXl
 tFHg==
X-Gm-Message-State: AOJu0Yy6fiCw06zNxROKzW7CG2bT7yRYoPislyhVA2LWB6h3cFgwyErs
 LjsFY7lLoduhZ+TLPvRcDjs5vy4Z/kkDVUUobZ3eH+d1NPrPpf/gmYRn
X-Gm-Gg: AR+sD10PUN2Y2hpJbKVw0JGjMWplnlQIp+QnkAVoTpd4t/ds3Fjsrn7mHI9uP66fiwE
 g7l5/z05BClTdsSQhr5vihZNtZQ3XopLU/vfqOigfIo7D91zX3aysDTmXgdkY4sEkDChACktw1C
 rS9smzF53ceZejoZb3uXkrlVdNzsNjhWqYVlK4o+MyCA7k/7AZzBWyXGW3s0juIWmb4ptC5XxMP
 kgX+aUX0m56IKFmPg5O/RFHwhU66+nPeOe6RRUycAByd9ydIBJe7WaxldMSgGTEMGYJZAvITAPL
 xekfBC3RthzmWK4JcdobZgpb8jYidV7Rn9yGQ33cCBfZwhMHCN2B6oN2wVG98M04XP7S94reSZU
 LgsNCosVPWTha+wFiSOEMBz027FmK0Se3L4eJldtsJlIGFLhZGIUgvm4T3+Yw0dmS9GPGbXw8Qo
 hc9vfJyZt4b90VD/j1+bqR5Br/U9r17zRl1u85LgiIcb6XCWpq9tc9DdWLftnDBRekdw+SDouog
 quuTON8mbk/IdQM+WDAKfFhcGaH9Uuu/w==
X-Received: by 2002:a17:902:e84b:b0:2c9:b396:1a55 with SMTP id
 d9443c01a7336-2d0ca76a3bamr369185835ad.12.1786256459458; 
 Sat, 08 Aug 2026 23:20:59 -0700 (PDT)
Received: from localhost.localdomain ([159.75.12.57])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d14ccac6d7sm21805265ad.6.2026.08.08.23.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 23:20:58 -0700 (PDT)
From: Simon Law <0860734llx@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, chao.liu@processmission.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 pierrick.bouvier@oss.qualcomm.com
Subject: [PATCH 0/4] Kendryte K230 CMU register model
Date: Sun,  9 Aug 2026 14:20:40 +0800
Message-ID: <20260809-feat-k230-cmu-v1-0-8792982c446c@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=0860734llx@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 09 Aug 2026 07:45:59 -0400
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

The Kendryte K230 machine currently lacks the Clock Management Unit (CMU)
  register interface required by the K230 SDK U-Boot and the Linux K230 clock
  driver. As a result, software probing the PLL and sysclk providers cannot
  observe the expected reset values or register update semantics.

  This series adds a minimal, deterministic K230 CMU model.

  The model covers:

  - four PLL register blocks at 0x91102000..0x9110203f;
  - the defined sysclk registers in the 0x91100000 window;
  - the software-visible SPI2AXI_CLK_DIV register at sysclk offset 0x108;
  - reset values and writable/reserved/read-only masks;
  - PLL control write-enable semantics;
  - write-one-to-trigger update behavior;
  - deterministic PLL lock and initialization status;
  - VMState for stable PLL and sysclk register state;
  - qtest coverage for reset, masks, write-enable, W1T, status, sysclk
    updates, unknown offsets, and system reset;
  - K230 machine wiring and user-facing documentation.

  The model intentionally does not propagate clock frequencies to QEMU devices or
  change CPU execution speed. Peripheral reset, power control, and the
  guest-initiated K230 reboot backend remain outside the scope of this series.
  Those functions require separate reset/power models and a matching OpenSBI
  backend.

  The implementation is based only on the existing K230 machine and does not
  depend on unmerged RMU, Timer, SPI, or SDHCI device series.

  Testing:
  - QTEST_QEMU_BINARY=/workspace/qemu/build/qemu-system-riscv64
    /workspace/qemu/build/tests/qtest/k230-cmu-test
    (10/10 subtests passed)
  - QTEST_QEMU_BINARY=/workspace/qemu/build/qemu-system-riscv64
    /workspace/qemu/build/tests/qtest/k230-wdt-test
    (7/7 subtests passed)
  - K230 direct Linux boot and K230 U-Boot boot
  - Linux K230 clock probe and clk_summary validation
  - CMU source/destination migration smoke

Signed-off-by: Simon Law <0860734llx@gmail.com>
---
Simon Law (4):
      hw/misc: model K230 CMU registers
      hw/riscv: connect the K230 CMU
      tests/qtest: add K230 CMU coverage
      docs/system/riscv: document K230 CMU support

 MAINTAINERS                 |   4 +
 docs/system/riscv/k230.rst  |  22 ++
 hw/misc/Kconfig             |   3 +
 hw/misc/k230_cmu.c          | 881 ++++++++++++++++++++++++++++++++++++++++++++
 hw/misc/meson.build         |   1 +
 hw/misc/trace-events        |   9 +
 hw/riscv/Kconfig            |   1 +
 hw/riscv/k230.c             |  14 +-
 include/hw/misc/k230_cmu.h  |  58 +++
 include/hw/riscv/k230.h     |   2 +
 tests/qtest/k230-cmu-test.c | 310 ++++++++++++++++
 tests/qtest/meson.build     |   3 +-
 12 files changed, 1302 insertions(+), 6 deletions(-)
---
base-commit: f893c46c3931b3684d235d221bf8b7844ddbf1d7
change-id: 20260809-feat-k230-cmu-9b62e6dd23f3

Best regards,
-- 
Simon Law <0860734llx@gmail.com>

