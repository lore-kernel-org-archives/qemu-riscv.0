Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BAEC369B2
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 10:54:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u5MsB-0007Ny-QU; Thu, 17 Apr 2025 06:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u5Mrv-0007Hk-2G
 for qemu-riscv@nongnu.org; Thu, 17 Apr 2025 06:53:20 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u5Mrs-0003ID-CY
 for qemu-riscv@nongnu.org; Thu, 17 Apr 2025 06:53:18 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-7399838db7fso599223b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 17 Apr 2025 03:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744887195; x=1745491995; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VWIwDHpofagJCdaNWS4Us0I4iTEd/vONX2w4rXuOZMM=;
 b=cKMS5h8OmgDaqXcbo1sk6s6oUoKi7ps3MNzOgQEhWbGVOu5MbD9gbtXAKE/3nkftBj
 uFYNv+5sOcnC52ZBx41qFmtU1bUkZwzMuM99QT41OixUsW8u7ulaX2R1vw1WdWxgW3bC
 10mq6SDbHK0EE3IJX6bbIulkAXGkAByMyE4FhVNyStUbyV8uWUTgIThJmznrhWymUVic
 pvz8JlOiJuCFugEV1yCIq27unrXIToSBm2aixcy3Nq+lHJAbMigFyC4uiZ6lXM+Lt8IC
 Nrakqk2MNl71cdblH+Q6LtkCDYcajhN2R9aZPRQkx10h1CGKRgOmJFCTMKCNRyPBIPrL
 f8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744887195; x=1745491995;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VWIwDHpofagJCdaNWS4Us0I4iTEd/vONX2w4rXuOZMM=;
 b=ipm/vocdeks5XxzBldtv1o+23UXxvcQ/2kl+PC8tvdBq/KwMWURRYFKQzJZ9y0vBok
 s3yE1yBeqiaI/YTfWnHh2Mdt5qb0f7ziWkCth8N6TZ3T9ek7HjNkEeFlSTVglV5Tphwp
 V2RZr8dMmfTXulYdY/hpZnfM0f2odMmExfOf90DmJBpVlG+E719r7bPfoxZjnh43J30k
 nLj1ywpVaMGxTEBXEltY/+YzNakmH5GyJn59EUQvLGVNN7AYpwHCLftByIEDcoHCX231
 7ajmljz9kdujXrb5LOonTB0QEA4KR/z1BehpvcGyJKDphRJ27j8XZ4tm7B7njkjfELri
 0Dvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt+L1acrFoKFS1+Br3rRTMukSHxFMVEa637WKF2U8x0ABQDFoHF1ge7+c4Ab2pH+64LnMfH9kIRJ8z@nongnu.org
X-Gm-Message-State: AOJu0Yz9ChtXqhW6b6PbYTX/dON9sfWZ3YM97Lta3l05IiAkpsP/CMMg
 BBiRBvTAoUlJcg/Hd94apTAKkXgqdW2PWrzQ7pwm9e69TE1EIky/jAyvIkV72SU=
X-Gm-Gg: ASbGncuO9WVfYG/LiXH0wKhlXmaKWPHwxh9hwmphGqbupgFswtAIOjHYIcbLdEXBj8S
 NTqZ3qXDtpWns6HesHsW4I70RZbUSFakmB8iY3GXWh/sL3wzFnfj9fEyZ41NvH4niTyI/UfYmdp
 /3Hy1sqFYwmitmV8WJgh8RNyQy/RpRDjb4Mw9pkxftH8VUKx/pmcuzevQq1CwFvzna3J4VKntJl
 6zxOeQV6Dio+RvfWejJ9tETqpbViJcGP7Btq2iOY13SxYE6l2WjJk/CKCE6Y7JJsm2pDI2lYJ8W
 xBO2Tu3uKl5rh+fGHPDrf+hQJAMraDiGGJNxS+jBVYRufs+cJ2KR3L/L9fo54Yc=
X-Google-Smtp-Source: AGHT+IFVBvQPu1wQZag/jk13aUj8YdM8a9LzgzxIFNz+TdDY6I+9SybWXHGAuIid9r0OiBCVTdammQ==
X-Received: by 2002:a05:6a00:3906:b0:736:4e14:8ec5 with SMTP id
 d2e1a72fcca58-73cf2ab9e33mr3229183b3a.11.1744887194780; 
 Thu, 17 Apr 2025 03:53:14 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd230ddaasm12366251b3a.138.2025.04.17.03.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 03:53:14 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 02/18] system/physmem: Remove the assertion of page-aligned
 section number
Date: Thu, 17 Apr 2025 18:52:33 +0800
Message-Id: <20250417105249.18232-3-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250417105249.18232-1-jim.shu@sifive.com>
References: <20250417105249.18232-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The physical section number is no longer ORed into the IOTLB entries
together with a page-aligned pointer, so it no longer needs to be
page-aligned.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 system/physmem.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/system/physmem.c b/system/physmem.c
index 70a6dd1962..da58d5c8ae 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -1016,12 +1016,6 @@ static subpage_t *subpage_init(FlatView *fv, hwaddr base);
 static uint16_t phys_section_add(PhysPageMap *map,
                                  MemoryRegionSection *section)
 {
-    /* The physical section number is ORed with a page-aligned
-     * pointer to produce the iotlb entries.  Thus it should
-     * never overflow into the page-aligned value.
-     */
-    assert(map->sections_nb < TARGET_PAGE_SIZE);
-
     if (map->sections_nb == map->sections_nb_alloc) {
         map->sections_nb_alloc = MAX(map->sections_nb_alloc * 2, 16);
         map->sections = g_renew(MemoryRegionSection, map->sections,
-- 
2.17.1


