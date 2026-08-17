Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2EAC5DF66
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 14:44:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvyYP-0001GR-Ns; Mon, 17 Aug 2026 10:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1wvyYF-0001AI-3r
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 10:43:00 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1wvyYC-0001Lw-8B
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 10:42:57 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-66c70d1672cso3498691d50.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 07:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1786977774; x=1787582574; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=S3TM5L+qmZZCn6pYKyHl43Pn4nMf7PNXQDIr08eAAQQ=;
 b=G3ecnbP1h56XYWVD4vQTk7sCOKWtnn4Gx3qOD/3+WTtxxczdFoMzB9Mr7W0FtfogtO
 BoXsaG3TRGYs3AzhrovGYm8RY/wMsMu0MW1HbPtvHBrBNTzUtKiZ6dJgRpOiYlHW1FYG
 jYWX0xmjUBf1HcrimLbotLy+Aw2Sggv5RduyPVVMMwxURa2KILt4iBMetlAIHl15wTGx
 3xFfxaeiqIe0cIixXKafqdE8C3zF2j0ExilDJqQeXeE1uO190TeN4X2RYUpKHe/Qa0GF
 0Te0XCajwL++YHVFb0fPE2milEFSv6Qe8F9y8Uw1ua5Y+tST5Av2a86dKCRFEZjmOI63
 1qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786977774; x=1787582574;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=S3TM5L+qmZZCn6pYKyHl43Pn4nMf7PNXQDIr08eAAQQ=;
 b=XbyiVMmauAHUZca5/KLcNAFIAgsZb/kjVxbWAaUm2+GvvVjK8/8G4Z9MHCi6mrAEXL
 gCbdmSyCkww6NrbBnKGeT0P6uUy6+eb1yTy5vwTCdzswo2hh5g5H9Y/9PNBLz7dRA7L4
 2SS0V+WEtHPFxX6mI8KGqWo7qB/NzGrA2QVl4ia04tHE4qKSEN7DsOXqVwBmhZY8ddkS
 1SVctuHPgO2FRW4wEZbBokWcVB+g5fxaCr5480VUgg7Pct8xM6vLC8hQGbu0DjlQu+F+
 gSD7QddbcBu1Vi+zh98ozjLjfomkor7Ou5P4QjGjFulcbMOTb5N34fh+xjW9BdOv0sAq
 HFQQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoEVufoPXjUdtvHP9++03t4qtTLsFvf4zK/v7VnmDFhZ6vXmCG8w6ETrAY+lr6cIfj3T9gLKO1gGUYW@nongnu.org
X-Gm-Message-State: AOJu0YzMP21zJzJRz40YQMW6E9NIkunr4IMRBzPdTAtc6mBToQKVmqNS
 KPWhAGZYqfgYh1bkAbiabXLLgz5bpVWKDxk3Utu0nCjpBSSrq9OT2VKvVWdBfrZNUb2O0HPiuKG
 Wbi/tVfg=
X-Gm-Gg: AR+sD12q3Of7+zoE5X/DfYLOBNqDEl4YnrhY3g7deVZs9Vtf5H0NZzc75+lW2RbIpPd
 MbD3MVdZ0Z4JkgWcvwhKoToUaxwQC5PoJimfu50IrMWpx+rsQHbwgYbihFSNz1pubQqMfCHL7+4
 2oX6VGgNVAQtGtDdF4U0bZVuh4SNsy6n7RuPltnrps0XJ26T5rwJXqNR5CZOd18EZ/5yY9ZKAM0
 sq0FgnxX2J9VtsfLHHVCGuoCW19863DJfm1yVLq2ip8E0AWkYhxg/3HsZcWUcUiGw9DupiHLLZl
 wwqBAC1ZHw0nwEp0iBftdATDuJgF+ZDK6dcbse5uvi9MnwXW3MnHRtJ+oS1MfZej8YR0kdCLWP2
 LtSzCc6TtfjjpjAAi/fjMUCtZtCV2sE1yIR0YrYyFqTmOs5PdTw2dfrF2KZlZqwYUjiUpbT6CWA
 uMmp0GaTEssqAIq47VB6kSsyyY1fG6v+ln9Wq7W3we3LDJOOOzepOtNXFERcU3FQNfzB9KyPXrW
 p8UPHQqxhMyl/HxRFyiKfpbOm6xdb+bp6sQ7Mvi
X-Received: by 2002:a05:690e:10:b0:666:396e:bf59 with SMTP id
 956f58d0204a3-66cb9d4a184mr328205d50.1.1786977774388; 
 Mon, 17 Aug 2026 07:42:54 -0700 (PDT)
Received: from [10.200.24.109] ([12.55.13.134])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-66cb47809d1sm904104d50.13.2026.08.17.07.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 07:42:54 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v2 0/2] Add Model for Tenstorrent Atlantis PRCM
Date: Mon, 17 Aug 2026 09:42:43 -0500
Message-Id: <20260817-atlantis_prcm-v2-0-ffba0b944419@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOMdg2oC/13NQQ6CMBCF4auQri0pg1Bw5T0MMbQMUiMt6VSiI
 dxdinHj8k/efLMwQm+Q2ClZmMfZkHF2CzgkTA+tvSE33dYMBJRCguRteLQ2GLpOXo9clUfQvcp
 lV0i23Uwee/PavUvzbXqqO+oQkbgYDAXn3/vDOYu7n13/2XPGBS8EVBXUeY5FdnZEaUAbAY82p
 NqNrFnX9QP4IKVAxgAAAA==
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yx1-xb12c.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Changes in v2:
- Coding style edits based on Chao Liu's feedback
- Changed prcm to use Resettable inferface instead of legacy reset
- Edits requested by Daniel related to tracing, pll_en logic and unnecessary switch/case statement
- Added comments to some of the magic numbers in the reset values for PRCM registers
- Link to v1: https://lore.kernel.org/qemu-devel/20260729-atlantis_prcm-v1-0-502882933e51@oss.tenstorrent.com

---
Anirudh Srinivasan (2):
      hw/misc: Add Tenstorrent Atlantis PRCM model
      hw/riscv/tt-atlantis: Add PRCMs to tt-atlantis model

 MAINTAINERS                        |   2 +
 docs/system/riscv/tt_atlantis.rst  |   1 +
 hw/misc/meson.build                |   1 +
 hw/misc/trace-events               |   4 +
 hw/misc/tt_atlantis_prcm.c         | 442 +++++++++++++++++++++++++++++++++++++
 hw/riscv/tt_atlantis.c             |  94 ++++++++
 include/hw/misc/tt_atlantis_prcm.h |  51 +++++
 include/hw/riscv/tt_atlantis.h     |  19 ++
 8 files changed, 614 insertions(+)
---
base-commit: 499039798cdad7d86b787fec0eaf1da4151c0f05
change-id: 20260727-atlantis_prcm-b642cfb37d57

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


