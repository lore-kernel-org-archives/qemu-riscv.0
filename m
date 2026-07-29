Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02B1C53219
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 17:14:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wp7qn-0006Fa-58; Wed, 29 Jul 2026 13:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1wp670-0007kd-M0
 for qemu-riscv@nongnu.org; Wed, 29 Jul 2026 11:22:26 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1wp66y-0006pq-E9
 for qemu-riscv@nongnu.org; Wed, 29 Jul 2026 11:22:26 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-6aaf2f9ce3dso507310eaf.1
 for <qemu-riscv@nongnu.org>; Wed, 29 Jul 2026 08:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1785338542; x=1785943342; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=CBmdf56EYLwZeQDdu0YfiTsea5ggFrXhk0M3G8m9ebk=;
 b=UcdDlvdofghiz6S1RSOYKG000ydIqiyQ7OK+n2bvYPfNW/H47peMSa1BUaHMLln9Co
 D/mlEITtbprQrP9JJmDFxeyn3l/t7TTaK/QixapjJfLLeecpkZHBXBbkNjGIINPHDWkh
 wy/an3e/k1uQt91TprIbFZBKxUgnByfibyzEklZ3kT+hPKCpLJS8dEEbHYmKVThotVIe
 9fPbT7oH0+vZFYxoqB5aJdWBAB559D1AzjEptgZbEajXCi9ndUYPBJ3XJ+ADVRtrP9CA
 TMQy67lCaVsu+iX/7LnhC7mkq+PnBFSM1Kv/ZAU8ULiKo+EWg6HXFlHyEJVi5a1Ws63k
 ambw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785338542; x=1785943342;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=CBmdf56EYLwZeQDdu0YfiTsea5ggFrXhk0M3G8m9ebk=;
 b=ALXSX7d6Em5/989BJZEJC4mTsbKpShVaV8BU5d1Z+LGOJBhOba5StHLocbwWiYFp90
 JL6FAf63Dsppi2wxFX0NLFyfxBHaZcJ1R5EFop6TQvY1Pyj7VS3171C/8Cgj5vwX3NVZ
 /j/HzP81rThBMqHXg6vlc2Ropef0mhF7RsFKsyI03t/gp+Xe2xNnUugLnhQRMa1JX38U
 f60vPN8lyzfi3vmYk9hshZMOnF4j8wtn5u77M9r25kkzPkMhc4ShMPaPZAixtN92+GPa
 P057vIYQFB9Hod7jVYo+eTsPJQVUBYSSjcpjLMQBrqw4vimrvaNaNOgTUiG5GNYlip1o
 DEKQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpIzPVxI/o/icXuxsKVDbqpd+15NQq3uGSJ6zQxblfJstPkoFPSWf6CD7IxWNQbitgAyT2IEqspFI7N@nongnu.org
X-Gm-Message-State: AOJu0YykMDN79LEQISFlxjbYRVN4SC3vDEZf7DhnHQVSr+GeXfqvMS/E
 GcwDwUQO+imeBLThLptDk1GJ7ZFWpoFwShz7Snpi+Qi0ilTzI7rymwU4CP99AgpTSTs=
X-Gm-Gg: AR+sD10jeJmDnTKXz3ZvD4Sx5WSedA7lr+/FFOS68tTsam+j3JkMJbFvWxC+TknD2Wb
 /Up5RLBqLHDKYI4P6q8KzFe1jhK/mEhOCYkJ1u+Ke5sx/S2IpzbKUECskvMudCgCo3WfRu8X1if
 TIwbk8I7Wz8giTVqJTUOSWhTw2LeCwySraD06H40Av2MyxP/Fg7CuOgl1rpOa7wHLhdNxPiHLbA
 TTIigohdzlBa2NRZh2CGqIzV5z62KyF+yczthdZQfwvpv9DXzV4swhRvYXaHypxj3JVI0Le88iR
 rj/tqCP3syP84hVD237XCBWhkThNlkIaHVFkegM6U+HBp2xiDfHfCnVcjz5tunfPNSAksxUgRRm
 QmCY0Gdxi8KjVOgIbGZf/yArGgwzjfdLj+4tH3XzbXxwiOIjN4m3y3c77Aur6cbBxxB+spjebPh
 4oI3bffacKNRrHwTKZqeygFrhqlU9enbeei5fNougwKgZlFoz19Q7yUvmMLZ57QuFD1QMJTMXWf
 +vg5QbW4l//6MNCmfkX+1ELm5hV5m5IJfL4xA==
X-Received: by 2002:a05:6820:f0a:b0:6a1:44aa:86ce with SMTP id
 006d021491bc7-6ac96a07437mr2988543eaf.22.1785338542233; 
 Wed, 29 Jul 2026 08:22:22 -0700 (PDT)
Received: from [10.200.56.99] ([12.55.13.134])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-458867fb651sm2476451fac.11.2026.07.29.08.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 08:22:21 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH 0/2] Add Model for Tenstorrent Atlantis PRCM
Date: Wed, 29 Jul 2026 10:21:33 -0500
Message-Id: <20260729-atlantis_prcm-v1-0-502882933e51@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH0aamoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNz3cSSnMS8kszi+IKi5FzdJDMTo+S0JGPzFFNzJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAKx8ne1xAAAA
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 29 Jul 2026 13:13:47 -0400
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
Anirudh Srinivasan (2):
      hw/misc: Add Tenstorrent Atlantis PRCM model
      hw/riscv/tt-atlantis: Add PRCMs to tt-atlantis model

 MAINTAINERS                        |   2 +
 docs/system/riscv/tt_atlantis.rst  |   1 +
 hw/misc/meson.build                |   1 +
 hw/misc/trace-events               |   4 +
 hw/misc/tt_atlantis_prcm.c         | 436 +++++++++++++++++++++++++++++++++++++
 hw/riscv/tt_atlantis.c             |  92 ++++++++
 include/hw/misc/tt_atlantis_prcm.h |  51 +++++
 include/hw/riscv/tt_atlantis.h     |  19 ++
 8 files changed, 606 insertions(+)
---
base-commit: 499039798cdad7d86b787fec0eaf1da4151c0f05
change-id: 20260727-atlantis_prcm-b642cfb37d57

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


