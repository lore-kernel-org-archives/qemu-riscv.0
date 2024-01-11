Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CE1C47077
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 12:04:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNtm5-0002qG-3N; Thu, 11 Jan 2024 07:03:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNtlw-0002nm-8A
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 07:02:56 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNtle-0007Ih-W3
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 07:02:51 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-336755f1688so4443477f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 04:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704974546; x=1705579346; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Np3VcKjCEmoCcQ1sC27/JjnaozcQhcX+4VGjkjhIPyU=;
 b=Fm6SGHQrC1MbNDRTPbmjoH8rDsqJhozLT53Z2n5Ihczo6xJJWHPnjb4eupB6qALs/T
 qmP6+QHFgBnplg8RSm1fRxeR/q0b5v8kXDhGd0FEIL50FLn9ikmCS9Lt0YzOx16GgntL
 5LJCze9y0+nZOfZXgymt1gkVt50FvnaL0iG4+oDvq0SHApxZykMkpsyeIzcxYVWEONEd
 +QkIf+zoGVKoRpGMBvDg48t+S6JK+J7Wxt4ffz0pa9UUM68nrpIUQoReQEbQ6q1tgvdv
 rRpE+b4+k2HG0ZIaGaJnQfiRa67aSUswMRViaHcIaDziWsU4YIstsHeaSIxISH1h3cb9
 /R5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704974546; x=1705579346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Np3VcKjCEmoCcQ1sC27/JjnaozcQhcX+4VGjkjhIPyU=;
 b=dZ/sorj38DBwS9NzXRz4bhad/Mq5F8l5qE0jVHtUUqDGg5wVbvEx1I2hZcLN2SEOWQ
 0jMc3/3zs137sE7AkHtG2ypajrsiOWmtz8KSvBSd6aUMxWjrX/p8KdzojdtNC4L8rzvB
 TdYp22hiF/OZmLUItefWJbvuunjq9msX4rshLc41GOgmAS0OCf9Hkk61v0NCMnKrv+40
 N0RJEmC1My5+dSK3VqHrTygNEndszCBJJtZsw1IPFi9vLbXDLHCEfio6PoZUCkJOTqH+
 +eRha/ALJsKAnzmv+t1epj7Mjj9XYKmnpc6KDj0LTidQLB/WII62tg/PuVTaq1Douzf0
 D1mw==
X-Gm-Message-State: AOJu0YyogSgHG3jOqd93D1N/PUs5ftFNd0i3VwhIwoumvQDdX6UgFdUJ
 LG1W045o2NwWeVnklp1sIMKM68XCv9TpKg==
X-Google-Smtp-Source: AGHT+IGW98HvKQmBMk05A28qpHHkj3PVNY44IdoDoGHUxvKU5rKjCPlJBlyDMJB6qIIZkmTH/bQVYw==
X-Received: by 2002:a05:600c:314c:b0:40d:8590:a310 with SMTP id
 h12-20020a05600c314c00b0040d8590a310mr309464wmo.88.1704974545898; 
 Thu, 11 Jan 2024 04:02:25 -0800 (PST)
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr.
 [176.184.43.236]) by smtp.gmail.com with ESMTPSA id
 f10-20020adfb60a000000b003368849129dsm1050123wre.15.2024.01.11.04.02.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Jan 2024 04:02:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-trivial@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] misc: Trivial code rename cleanup
Date: Thu, 11 Jan 2024 13:02:16 +0100
Message-ID: <20240111120221.35072-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Rename some code names to ease navigating / grepping
the code.

I plan to queue these patches once reviewed.

Thanks,

Phil.

Philippe Mathieu-Daudé (5):
  accel: Rename accel_init_ops_interfaces() to include 'system'
  hw/core/cpu: Rename cpu_class_init() to include 'common'
  hw/s390x: Rename cpu_class_init() to include 'sclp'
  target/i386: Rename tcg_cpu_FOO() to include 'x86'
  target/riscv: Rename tcg_cpu_FOO() to include 'riscv'

 accel/accel-system.h       |  2 +-
 accel/accel-system.c       |  2 +-
 accel/accel-target.c       |  2 +-
 hw/core/cpu-common.c       |  4 ++--
 hw/s390x/sclpcpu.c         |  4 ++--
 target/i386/tcg/tcg-cpu.c  | 32 ++++++++++++++++----------------
 target/riscv/tcg/tcg-cpu.c | 28 ++++++++++++++--------------
 7 files changed, 37 insertions(+), 37 deletions(-)

-- 
2.41.0


