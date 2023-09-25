Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8009CE7A95
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 15:02:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkn3T-0000hP-Fd; Mon, 25 Sep 2023 10:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkn37-0008MG-BR
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:59:02 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkn2t-0002GG-4t
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:59:01 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4054496bde3so47911145e9.1
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653925; x=1696258725; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SQaKCCtPdCExPYstQ0NllKjLPtp/IcVgNdDW/2dG2tw=;
 b=dhq3eZbIsX6rub1xZBO0zWvFWXHCRafGZ2iHkOIZUsolYzqAJOY3tLjb/dsPUqy+ko
 WRbLe/L31/BgUX5n39CXgxGmbJUNH6gEp9ZLi9l7WEA29ubHzxlsWC2gSSWDwpwjU+Cz
 OuT0ZYlPALb0akBXlCQ4TgqRcrYgFDcbxFqNUkzXvGOSZXASM2sPNN6DuOwZ8sPJXmW0
 ZHPdEa5IBVi6iYnI1tacL1PNzdBRQ5npK9AvOGI2BKpG/GgiCWvd8a019hwXdP0wyjQg
 7YfxFtZNfaCCJE6NmBPC38oAqpBoA/yzDnTizyMrRXpCLbAm9o8hiq86vwInnt/2Jx/F
 hlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653925; x=1696258725;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SQaKCCtPdCExPYstQ0NllKjLPtp/IcVgNdDW/2dG2tw=;
 b=xJMPaN3ZTa+2qnjl7EGy6RQTVzllez+hSs+i0/OETs6eo7yY8lsV+tlQik4F7JQFKm
 Szl1oSmOeSy+GMf5uPZfp2TOBzCYa1Edw9GZd3FoZbT3YG59L6uC3kN56EULCFzLwXx+
 VM4W3EjuvrX7fQAUVZcScmc/lX3jSYWqQ/uaff3qgogaDJWDZFw830YI4y4BK3lYk/cU
 QXzq5UooFdKXvo2nOi5WskxxzA9kk5oO3NMLNtTgM9i3wM0V+3w+EB6ARdX5msBGVP7P
 4Pbv1CSR/Th3X06aJrfNMUKPMjZ7uw8Em5uRujGsk4q30Ky/9tTBAca55lbYpjwAzoSm
 Hglg==
X-Gm-Message-State: AOJu0Yzt7vWxwsBYU0x/pI/bZnbyxgdXzTyj2oGeukQ0SIFRRBv1N4N+
 NJPdUMkjTQPhTwvZ0DUhYLafuy/lBIxGvfR7Zss=
X-Google-Smtp-Source: AGHT+IG5H8XpO/i2Pzv7xFgguxMyyEZnV76ynGh3qBvX6EusTMWO25hHy6LCxzc3dFuvZhldDt9ZIw==
X-Received: by 2002:a05:600c:210a:b0:3fe:1cac:37d5 with SMTP id
 u10-20020a05600c210a00b003fe1cac37d5mr5768595wml.4.1695653925443; 
 Mon, 25 Sep 2023 07:58:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a1c7701000000b003fe23b10fdfsm15367489wmi.36.2023.09.25.07.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:58:42 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC8801FFC2;
 Mon, 25 Sep 2023 15:48:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas Piggin <npiggin@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 24/31] contrib/plugins: fix coverity warning in cache
Date: Mon, 25 Sep 2023 15:48:47 +0100
Message-Id: <20230925144854.1872513-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

Coverity complains that appends_stats_line can be fed a 0 leading
to the undefined behaviour of a divide by 0.

Fixes: CID 1519044
Fixes: CID 1519047
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/cache.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 4fca3edd07..9e7ade3b37 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -535,15 +535,13 @@ static void caches_free(Cache **caches)
     }
 }
 
-static void append_stats_line(GString *line, uint64_t l1_daccess,
-                              uint64_t l1_dmisses, uint64_t l1_iaccess,
-                              uint64_t l1_imisses,  uint64_t l2_access,
-                              uint64_t l2_misses)
+static void append_stats_line(GString *line,
+                              uint64_t l1_daccess, uint64_t l1_dmisses,
+                              uint64_t l1_iaccess, uint64_t l1_imisses,
+                              uint64_t l2_access, uint64_t l2_misses)
 {
-    double l1_dmiss_rate, l1_imiss_rate, l2_miss_rate;
-
-    l1_dmiss_rate = ((double) l1_dmisses) / (l1_daccess) * 100.0;
-    l1_imiss_rate = ((double) l1_imisses) / (l1_iaccess) * 100.0;
+    double l1_dmiss_rate = ((double) l1_dmisses) / (l1_daccess) * 100.0;
+    double l1_imiss_rate = ((double) l1_imisses) / (l1_iaccess) * 100.0;
 
     g_string_append_printf(line, "%-14" PRIu64 " %-12" PRIu64 " %9.4lf%%"
                            "  %-14" PRIu64 " %-12" PRIu64 " %9.4lf%%",
@@ -554,8 +552,8 @@ static void append_stats_line(GString *line, uint64_t l1_daccess,
                            l1_imisses,
                            l1_iaccess ? l1_imiss_rate : 0.0);
 
-    if (use_l2) {
-        l2_miss_rate =  ((double) l2_misses) / (l2_access) * 100.0;
+    if (l2_access && l2_misses) {
+        double l2_miss_rate =  ((double) l2_misses) / (l2_access) * 100.0;
         g_string_append_printf(line,
                                "  %-12" PRIu64 " %-11" PRIu64 " %10.4lf%%",
                                l2_access,
-- 
2.39.2


