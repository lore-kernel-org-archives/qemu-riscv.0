Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3833C61DD6
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 14:48:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2VCz-00034a-II; Fri, 04 Sep 2026 10:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1x2VCx-00034K-VC
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 10:47:59 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1x2VCv-0004US-98
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 10:47:59 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-855a66e5b5dso10082487b3.0
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 07:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1788533276; x=1789138076; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=OeIwGfZcFhKCOs+UVDAvPsnlUStYUGQpYr6R2DXU1ws=;
 b=NPVp9XnrLXZfjyzdqSfsEXwmvkMtUQfMOuKbogqXByH/ofgHfAC5CzoYtoYYmtJmIu
 Ln1/x3XLSaVqL6ziKPCPH4HTpZMMph9uv1a29otwez3hirbJmoabCuWB79l15gSJpH73
 /2XnwYGMryR+g+6OitUSZm98l/F3QfW3Pxhezu69+mZwez+KGoZhKDtwmp7uDuEaFdFD
 8UgP37JVTdEm9L1Hy6HgtmC6EbgWaEREaPPznnbDjgHteQkxxVCGSAsalBkNLlgxOrCC
 i4OUzPgERZcmRiCwweys0JJhnYk/EtSj3uqY8Uzi7gXsaxj3Tc8RzvVyYM9ZqZQaJbtD
 Ajaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788533276; x=1789138076;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=OeIwGfZcFhKCOs+UVDAvPsnlUStYUGQpYr6R2DXU1ws=;
 b=fpAZKdOCkm05qfnSqm2Sn1xgG+PA3bGFfx5Q59zVnSXrH/BH9RG8WXUqnGTsVh6JRV
 vDAsH2GdPMQVLzLbbWkT6tH/ie98Gntf+IKflWnW3hO58lAyHD8PzShrkWrhlhn4ab0u
 t//aHnZxwev350Xu77NAc+1C+4rVZxs8dryr/zJdaLX6nNhZRHOp7nmpsITuhsnkrApf
 gHUjhVBBIKRA9Bir20FAF7d3P9rdec8dw2tSYyUSi2trDkiIR/RBJF5fnyg72QjtHHki
 JuooppNIyU8N1L0NyT4m4g58mdAYOmgKeY91B+s0N2ilODaVN/DFDWI6mvMRDtcpXRV1
 96hg==
X-Forwarded-Encrypted: i=1;
 AKwUvBziNdR1AE4HHZZJk8DixTXzSGemQVe3/mAN/6hjQbZnF96Rq1XrIAnkifHvKCeMEn15w0Tkqr5az8+X@nongnu.org
X-Gm-Message-State: AFuF++lZPe/dnl6Co8fjxQskGnAX5LthFnnfH/D83SQHfqrjqlBwhNn/
 90JJmJ+Fdr0XmGssrhI9cEcAB8oSwWghkb3zn2trUtLIXmrZbeopZLsMxrSYENIwV9s=
X-Gm-Gg: AYBFou2hpjzHWHbeaostwYEde7lSzh5QH3vH3QAoC4uxQTUWaH3fJaUc0JpVM0auvHS
 N9+48e/YLJaeJAwZRuyj6bT/RW5+sjKszmhTgmcWBIgKe27OlTbgVqn2iwzr7ef35T2OU6rS0yy
 tp7Pz+vyLc/W6TcULEjryD7cnovRQgjxerBhYBfLgnlfunajDhesKsrfFDF9NOTAvjr+YVQSCGX
 nWYWL1UKqH/JQlIS697VB1Sa1OlPNI9i/PNt63IqbLT8yWi2lfJtKzF1qW7jAW2YkZvks/aqCgc
 6XBIiZ0qphy9/XhnZkjrjR7pYH9dhAGhhjiv/+DKDZ3+ma2xjJqTcLRU8/dxB28ch6vauIAB+eK
 7JXbkJZq5lJLbJTqTpv7yZTAVdT7tPUO7/FLvYxl9TWvX4iDxuHjBVbZK9G0GjCN4D/qidKeRcW
 bFNWb9EA6Iy5cyERn24KbhTLjmG76i3rg2Sy78Qm/kN/0aVYw3w5AdNmQqlG97G4jENei8gKnGE
 sdyqQUFUbgIyIJpXfhsPGqrNaf7JOia4QiLBK1fvBq4
X-Received: by 2002:a05:690c:e3e2:b0:81f:a9e8:f7ef with SMTP id
 00721157ae682-87125447517mr35183207b3.1.1788533275691; 
 Fri, 04 Sep 2026 07:47:55 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:6f99:bae4:e245:b362])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8714ab73f23sm19274597b3.33.2026.09.04.07.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 07:47:55 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v3 0/3] Add Model for Tenstorrent Atlantis PRCM
Date: Fri, 04 Sep 2026 09:47:27 -0500
Message-Id: <20260904-atlantis_prcm-v3-0-8bf20795a381@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP/ZmmoC/23O3wrCIBQG8FcJr3Oo++PWVe8REerOmtHcUJNi7
 N3TRQSjyw++8/vOjBxYDQ4ddjOyELTTo4kh3++Q6oW5AtZtzIgRVhHOOBb+LozX7jJZNWBZFUx
 1MudtyVG8mSx0+rl6p/Mnu4e8gfIJSY1eOz/a1zoYaOp97WZjB4oJLgmra9bkOZT0ODqXeTAJs
 GB8psYBpZXAfk5Ntz8GFp2uk4LIpigK2vx3lmV5A8HEZWgOAQAA
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yw1-x112b.google.com
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
 hw/misc/tt_atlantis_prcm.c         | 446 +++++++++++++++++++++++++++++++++++++
 hw/riscv/tt_atlantis.c             | 109 ++++++++-
 include/hw/misc/tt_atlantis_prcm.h |  51 +++++
 include/hw/riscv/tt_atlantis.h     |  28 +++
 8 files changed, 632 insertions(+), 10 deletions(-)
---
base-commit: b23a62773a7856299cbb3782e64968b6a92c792f
change-id: 20260727-atlantis_prcm-b642cfb37d57

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


