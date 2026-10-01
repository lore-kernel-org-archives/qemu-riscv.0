Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B46BCA5FD2
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 13:53:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCHD4-0001wr-4a; Thu, 01 Oct 2026 09:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xCHD3-0001wY-53
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 09:52:29 -0400
Received: from mail-yx2-x2a.google.com ([2607:f8b0:4864:41::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xCHD0-0000Pm-Lx
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 09:52:28 -0400
Received: by mail-yx2-x2a.google.com with SMTP id
 00721157ae682-8ab41af29caso31200567b3.3
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 06:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1790862745; x=1791467545; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=QeHXIKOndEh8UofaOXrQ/46qeOt4qDlXAHo7DT2xHn8=;
 b=GYLmzu1807qadMmgbDgH3F7SuRNQ7Al5zISPuQMwEH6960KJy/D/ocWMHV6wyTq/70
 JuwkbNEnaY/30JjhxnCKKPNiieSEJcOSvefMMbCUt6IB8wtBpqFFeFdsJG2bPqiUgWwF
 4voUwplyQEbidl106awOFbUuo3kSHMWFJeeDV239NZ82SZMHYSITAK0LdET2St9tO5d+
 Pdml+I+Y4dhBcilrIW6xwYP9FEIvauHJin3mfbCFV6BmnLSGTFIpv08hGV3yZl7+d2p/
 AgyrcBM8nJ01FBA61C2xZbcjDSf6NC49uneQxshGfE061RRb+Qis4+Me2AbzJiOv6MUA
 bNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790862745; x=1791467545;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=QeHXIKOndEh8UofaOXrQ/46qeOt4qDlXAHo7DT2xHn8=;
 b=QlCkZP1i/qom0ADOa1AFyLWPR+OAEf9Is7G5/Mexpdr8bfNLQoJ7kcYuC/PCyAx6iU
 J5BrXiWudzSo5taQtM8e59g91EGmUtsuVoswPdC4xYzqh8qSoI1zCXlQ5GfisQTflxpm
 B/cnnXAW8cupaMxAGku1JX1Fbo2ri8MH+hQzt7LvNoJ23E1LX/er/EDamv+UWoINAOoN
 WXsL/2i1NVx4Qye6Tr3HKUOiAXyIyQSzHbjFdkvE52MX8haK9+xKACuvEXyGRQFFkIpc
 acBugezB2Y65dyTJl05kLaQFWYL6GSjif4IanrzCbD9okGuUs5i4KbpvBFJ2QHF3pxxt
 /VBA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzSOa3QLffCZ1nUliFB2yINv2AeXJuMC3Pvhi+Ww9+Z9Lvb6ognApiC+WF1+PVs6b0Lg59A2NEYhsHw@nongnu.org
X-Gm-Message-State: AFq9FYJlnLEnQT3v8zErqL+zxg/YVpL7iRhjHTO7xt7M3Gg+ce7h9sT8
 UdBJIWKs8xtGDy6cegHcpn4iPG76wRYtOGPpIOQcNe/ztmdyqYNvJBvNrj/MdCajfoo=
X-Gm-Gg: AYBFou3qaoNOmrMeK5km32g+tvmH3M1t7w7XXhEZMiGtJrEQP765JigOmukwvahQwTH
 4PQuxfuzr3ie90V2KOXdOsxmsZigJ269UflFnFh+BVS4QFiigBPYgjKQarfXcy63ACc6KRPAgdU
 gMRMQbL3PX0UjvKB8MPzdCGYePQufZaFgXP/Wu8pV5Hhc7enO9cIe0iO1U0+QgeUHZvppOevLVv
 U4fNeq074KgWX1f91z7z8M/imi6U/A8SPmn9t8RjRPpKq7KOtqGycFkS0jV0PKO9+60fcg+DtMK
 uYx56Iug4a4GBU2BJNor/OPgiJoEyu4bluEE/LE56ACJkg0bp27oN43HV7uSbZY882/IBi0jDag
 hIL37Tm8458VvwuXG0yyT47CUX8wQPa9HkYuULE8Z83bsKd4VodJFkGERYePq2EMzfnDliFZQW4
 tDy3BU7lrOahaMYp5Df9pJhZ6lPZJ5lGQDdYSIHtFlWBL3XuCBIDBltZzLIiQ3Ql4I2iVrLcS8E
 UfNtROs9N+EnlYgzlXcRF7R8vLgZPBcwDJukVZlq/tOvKuR
X-Received: by 2002:a05:690c:e650:10b0:8ab:359f:ed19 with SMTP id
 00721157ae682-8ac92c2adcfmr17358807b3.33.1790862745049; 
 Thu, 01 Oct 2026 06:52:25 -0700 (PDT)
Received: from [10.200.24.109] ([12.55.13.134])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8acdac9e4d6sm10587707b3.11.2026.10.01.06.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 06:52:24 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v4 0/3] Add Model for Tenstorrent Atlantis PRCM
Date: Thu, 01 Oct 2026 08:52:07 -0500
Message-Id: <20261001-atlantis_prcm-v4-0-95d33c470eeb@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIdlvmoC/3XO0WoDIRAF0F8JPtegoxs1T/2PEoqasbE0blAjL
 WH/vZpSAgt5vHDn3LmRgjliIfvNjWRsscQ59SBfNsSfbPpAGo89E2CwYwoUtfXLphrL+yX7M3U
 7CT44oY6TIv3mkjHE77v3dvjL5eo+0deBjMYpljrnn/tg46P3b5uV3ThldGKgNRghcOKvcynbi
 mkAGVPd+vlMxkqDh6P5+scG3QnBWeaMlJKb5454OIbJtSO6o10ApsxkhX7yz7Isv/mU7g5WAQA
 A
X-Change-ID: 20260727-atlantis_prcm-b642cfb37d57
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Michael Ellerman <mpe@kernel.org>, 
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
Received-SPF: pass client-ip=2607:f8b0:4864:41::2a;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yx2-x2a.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This series adds a qemu model for the PRCM blocks present in Tenstorrent
Atlantis. This block controls clock, reset and other misc functionality
in the SoC. Linux support for the Clocks/Resets served by the RCPU PRCM
was added in [1]. This PRCM model has been tested with a linux DT that
enables the PRCM and sets the UART clk to the one provided by the PRCM.
This DT will be sent out shortly.

[1] https://lore.kernel.org/linux-riscv/20260306-atlantis-clocks-v8-0-6c9b14a4aa8e@oss.tenstorrent.com/

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
Changes in v4:
- Addressed style comments from Joel's review
- Added error handling for sysbus_realize calls
- Dropped redundant realize/ops setting lines for PRCM subclasses
- Updated PRCM min_access_size to allow byte accesses
- Added back clock-frequency prop to UART node to allow linux boots without clk driver
- Added back bus clock-frequency prop to I2C node
- Link to v3: https://lore.kernel.org/qemu-devel/20260904-atlantis_prcm-v3-0-8bf20795a381@oss.tenstorrent.com

Changes in v3:
- Rebase on top of Joel's socify series v3 https://lore.kernel.org/qemu-riscv/20260903055131.257903-1-joel@jms.id.au/T/#t
- I2C and UART now use clk provided by PRCM, and periph_clk is dropped
- Addressed style edit comments from Joel (comment about clk IDs coming from DT bindings,) and Alistair (drop size from trace prints, move decalartions to top of function, use PRCM_DOMAIN enums)
- Link to v2: https://lore.kernel.org/qemu-devel/20260817-atlantis_prcm-v2-0-ffba0b944419@oss.tenstorrent.com

Changes in v2:
- Coding style edits based on Chao Liu's feedback
- Changed prcm to use Resettable inferface instead of legacy reset
- Edits requested by Daniel related to tracing, pll_en logic and unnecessary switch/case statement
- Added comments to some of the magic numbers in the reset values for PRCM registers
- Link to v1: https://lore.kernel.org/qemu-devel/20260729-atlantis_prcm-v1-0-502882933e51@oss.tenstorrent.com

---
Anirudh Srinivasan (3):
      hw/misc: Add Tenstorrent Atlantis PRCM model
      hw/riscv/tt-atlantis: Add PRCMs to tt-atlantis model
      hw/riscv/tt-atlantis: Update UART and I2C to use clk from PRCM

 MAINTAINERS                        |   2 +
 docs/system/riscv/tt_atlantis.rst  |   1 +
 hw/misc/meson.build                |   1 +
 hw/misc/trace-events               |   4 +
 hw/misc/tt_atlantis_prcm.c         | 428 +++++++++++++++++++++++++++++++++++++
 hw/riscv/tt_atlantis.c             | 125 ++++++++++-
 include/hw/misc/tt_atlantis_prcm.h |  51 +++++
 include/hw/riscv/tt_atlantis.h     |  28 +++
 8 files changed, 632 insertions(+), 8 deletions(-)
---
base-commit: b23a62773a7856299cbb3782e64968b6a92c792f
change-id: 20260727-atlantis_prcm-b642cfb37d57

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


