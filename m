Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7D8CCD184
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 15:57:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBEil-0000rr-3q; Tue, 21 Oct 2025 11:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1vBEib-0000pf-LU
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 11:56:17 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1vBEiZ-0007kx-LS
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 11:56:13 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-77f67ba775aso7486363b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 21 Oct 2025 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1761062170; x=1761666970; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ItEDascWURdtiJBIFOxPqFxdsposkPVgAOSmqvZV7F4=;
 b=VZGkaLV7jqRVLYo7QXIMCTZ34wg0JdWFhmfdkcVggYH6gDbZXau1MDyIXdBNo3W9/S
 lf/vKTnunIWw5jkVsqgmaWGhJutaEEc6p9PGrpoCqZIItNKMklYbXVtGiAwoOYv12M4i
 N52tZLNAvg8Xby8zj8EUARr5Uf3WaYmCwJ+7lCp/b3+EGtn+syQCjo0KX/SDbZyJ2Vkh
 hc3X8ZMOq2/EzAVXF9oYDoc7Nlfs0PrVSaN9YCRa7AZn9YI6+Z7c9HeV4I9E92cfcyo+
 V1qpB/SESY9G10x7Z8VqCgVPNCIXn5rd6ALWaGzBHzFIw85vxqfpjvM/tN2nBF+iWhip
 WaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761062170; x=1761666970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ItEDascWURdtiJBIFOxPqFxdsposkPVgAOSmqvZV7F4=;
 b=g9QueyI/tPx6Uy3iD/yHlQSzcXy/1Usf70CIXTARnFk9NBNIIrDvQQNy+QyjPo5/J/
 nll+D+GErHPtDcLzk6RU7OJNnjliUy4vUoDnO5CtPuyjl5bY+nX4daUthI3+HgrvfBSb
 oZuRHq+pyvOnjRpz8K7aK0YlekNhBWBiZCRcgM/0zRMp0kYiJExqMEXACyxmiYsBpobI
 0NV61ql4FLA7NzuJfBUl4Ld2967p7oUaevFrWqWe/NaKu5J5pYP6rcuus3OqL6IjEQru
 KLSEr0j8Tq+bSoQ4w27R3Vx1VYo64hN8AbIh+bM9AxFrVKtzchdd9Easgu3xBtDCBq7s
 ys2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuxpDo7/UEUuqwfcpcR1R2ubbMGIFUWiD+4k9O20bXcygBUoz/zsVTS2xVcwJNbzEe2jtoHW2UDdKE@nongnu.org
X-Gm-Message-State: AOJu0Yy/xHc7Sq6t/z/myShU5NdytRgiLVd4xSRZ/PH5P6kyt1JGzyqh
 MxgHiUJkSuWUu7hlSqRucUd0nr0XwHwYYYbQY9TX4VheQnxrEwymMr9sd8+VAP/trgE=
X-Gm-Gg: ASbGnctjE0lDVG9Snr7f6gjVRLg/ixEM2+mDduZsT5SgyrrVr3xBkuQNl9S/Skn+l/V
 OkPNtW2pbqHmh39dYsZmje/4ShOYw9p9W55KUvhlxLjySwDpk2mJFvi+9Y0coq6mdxvE75+0vzC
 qqlZiZ4EDTVmOTO9TeVCoBgbIAmM7ZDp13XanTdQC6U18vXOXuPx9EZWHsGZGf/cE51qAg0U9mq
 BhZIzEK1IdkLVGNlIcY1UgeK434DL6+3P5Nk2hoS4LJhWpe74SLOGJ9q9XIQkHfvT3HkQTw4Bny
 Rj5KebmYiGzjBmPs9muzgxL1Dffn1uIJpJs1zXL9HrXexyZTg63vtS09VEJugxTCijqfFXmGYpk
 3NfqQ4n4ZgLCXD3a8LfOtRBNhZCrK10acelOw1Af/djjfMNGzJ4aaYFSIZbwsHjcpd6VvBkr+Ca
 tD3nbWA0RJP/ZMBk34l2JUyYCgEKn1gwig
X-Google-Smtp-Source: AGHT+IEn0Qt6Oo+4e0ngsjIqW8GIuRuTZTtXWnxt3lGQr7smV5xgsnGddwfD17jHYxwNbaGUbIg5Ag==
X-Received: by 2002:a05:6a20:158a:b0:2e5:655c:7f93 with SMTP id
 adf61e73a8af0-334a8616c19mr24469072637.33.1761062169916; 
 Tue, 21 Oct 2025 08:56:09 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33d5de11392sm11490177a91.7.2025.10.21.08.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 08:56:09 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 02/18] system/physmem: Remove the assertion of page-aligned
 section number
Date: Tue, 21 Oct 2025 23:55:32 +0800
Message-ID: <20251021155548.584543-3-jim.shu@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021155548.584543-1-jim.shu@sifive.com>
References: <20251021155548.584543-1-jim.shu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index c163d6b856..23d9b92954 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -1305,12 +1305,6 @@ static subpage_t *subpage_init(FlatView *fv, hwaddr base);
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
2.43.0


