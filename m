Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EE9C001DE
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 07:42:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qOZ8x-0000Tz-0L; Wed, 26 Jul 2023 03:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qOZ8t-0000Tb-Km
 for qemu-riscv@nongnu.org; Wed, 26 Jul 2023 03:41:08 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qOZ8o-0000QH-Bc
 for qemu-riscv@nongnu.org; Wed, 26 Jul 2023 03:41:06 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-55b0e7efb1cso3326291a12.1
 for <qemu-riscv@nongnu.org>; Wed, 26 Jul 2023 00:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1690357257; x=1690962057;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=40LOwnc1UWDl12YW5Q5RKLcgakfGkbBCBb3K1zYDCDc=;
 b=MPZRSL4paZJZ7ap7tOOzQO6YwIdT9Hp9CjKxYZU0WWORDRsroegDnANhj4FeaDvSWZ
 R4nflDXdHqGa0cEgAulggBQwsgz1m0M+8E2ZfrLpfLrNfKWuX1NyDsR2izVil0gTdHTX
 JLPtl+infjksnR4LwooK28ax69nFIvZymejcEcW9NPdv8kTES+55YSzmRfusVtg3Jkjb
 WidAeLq7iHNRMFQzIZ12ViH2AkuqKemCU5GSoA0w5mibcTKpbh2te1sn/v/HYEw45pGO
 8lgVzq2AQrgHZyPfBnLcxXqV6T1toaCnMB15SAC7IKYbbrHY+ivVHKAuq3PuhuYQJ7YO
 1sPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690357257; x=1690962057;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=40LOwnc1UWDl12YW5Q5RKLcgakfGkbBCBb3K1zYDCDc=;
 b=mIKamTDCnFCVez1Hs+8itY202IbOcInidBUt900eieN5jH4/Omq+F3UYwFkuIoTvHh
 Ay1kyNxkH9bJkp7DNyZRX7745WBf5qWS0xBmvfGV165gzi6iGFBnncJgpFe4JMn2IYdq
 Z5fSIJQ/Sn1+GvyZQxeMVvZ58vGy5J+acxR20DJzISNZnqow6Iwp1CjjHU0VjyneIFk5
 4RTQ6yx95LbUHyoqZg1zfsc0AO6QQZC9ufwlcNLorpEwGsABm7O4+DMFOZCROEzNhHUr
 txGe6ooYUMJL/vvE2+lANOJwaYXjmuXfJfg9lFfX9ZQ1vd3E31v6fvYnVtFJUjk0Ctyz
 Qqkw==
X-Gm-Message-State: ABy/qLYH8M6Iv+xAOdwYQ9zjPFcQyXcC5Pdq9E/alcMSFPytkepC+iKM
 uENChxiVsQkcqfIeW4hYYY3v1A==
X-Google-Smtp-Source: APBJJlHGQKkmjFPcCCs56G1H0o6R0yc9brmhpheJ+M1bQOy7BnavYILcVMZ5B/Cmzbmi/TNNv8F0+A==
X-Received: by 2002:a05:6a20:7348:b0:134:eee2:f9ce with SMTP id
 v8-20020a056a20734800b00134eee2f9cemr1141528pzc.11.1690357256937; 
 Wed, 26 Jul 2023 00:40:56 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 g18-20020aa78752000000b00686c40ccaf2sm756523pfo.9.2023.07.26.00.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:40:56 -0700 (PDT)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>
Subject: [RESEND PATCH v3 0/1] target/riscv: Add Zihintntl extension ISA
 string to DTS
Date: Wed, 26 Jul 2023 07:40:45 +0000
Message-Id: <20230726074049.19505-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=jason.chien@sifive.com; helo=mail-pg1-x52f.google.com
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

In v2, I rebased the patch on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next
However, I forgot to add "Reviewed-by" in v2, so I add them in v3.

Jason Chien (1):
  target/riscv: Add Zihintntl extension ISA string to DTS

 target/riscv/cpu.c     | 2 ++
 target/riscv/cpu_cfg.h | 1 +
 2 files changed, 3 insertions(+)

-- 
2.17.1


