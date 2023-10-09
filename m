Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42147CD610B
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 16:43:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qptLf-00089C-Bx; Mon, 09 Oct 2023 12:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptK4-0005OW-52
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:41:37 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptJg-0001Wt-Ft
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:41:30 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4065dea9a33so46024855e9.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 09:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696869670; x=1697474470; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNHX4JyhoYexAQqB9a7CrjUa8yJRKrNW0ix3Ut30RxE=;
 b=Td5guE2RPTMNdyZTQzZUcI77K5oCS1CwjUIA7yICrXN2HJqRdEzSZBLsE4HWTw2xbd
 Y/NX9X5jUJXURijIVTdrROB9O2e98JbwvSxTS4lTJ5aDOoa+fwV0h+9JjHeVUzZBxGXT
 v93E8QLzKm9rynwuT2mt+nkmXQouYgq7y5u1t4Hq9JAsvB4vl1WHJJQeF4wpZOi1ywSk
 xhF7L9uNJ5UPF/CzNG5LOvl8ksGFLg1oWeKF6jwSlRsPhpX+/taurfHM8JzJHoOUjFSE
 lF4+1X1z17fJRDh6QKQ45PiR5WxeR26WGtvlzYcv/3uDHD69SH0NnARr05DtsB5i0ElR
 npew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696869670; x=1697474470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kNHX4JyhoYexAQqB9a7CrjUa8yJRKrNW0ix3Ut30RxE=;
 b=KrYDf5g5OxrbvUZPtCHPHDlH9zxZicTuV/hCizypirDRUBneVAquI7uO/GLdE7R+xg
 p6FT+6TDRmO1Q/mgaNewsrypQflellfQiDrRvZbN63MTv6PK77lhpXkOcads1REYkoDW
 TDGcolekAD6byo58xP6JCbVTD9wft6Sg74daJeboVqhgO1K9WLVW+eFL8cHg2wvfy+H4
 Z1MXNkd4Pb7YpdoFymhW1tOB2YlgYg1qcnHbmczQE9qWkdR21a2plwkFI1im4+S5K8pe
 pAZvJnXVpByNl4Zp38UAZe10lGwse5+OGnPb51fWNyW036+CVm0fDPGmFTo3LvHGnXFv
 qMSw==
X-Gm-Message-State: AOJu0YwUdpJGBWRzbVyZtAbB78JzEuSPwJOm3tbqrrDD5zZksBeAK/aw
 aRxrHk2OoHLrKX1QnccV9+rpoA==
X-Google-Smtp-Source: AGHT+IEZzzazV8rQyOOoyQLJ7Uxqh6UC8+1qjne8WqehmY2jmS1dp8on60ZHA68rYHTOIzLc3O8VoA==
X-Received: by 2002:a05:6000:12cd:b0:320:976:f942 with SMTP id
 l13-20020a05600012cd00b003200976f942mr14088178wrx.7.1696869670278; 
 Mon, 09 Oct 2023 09:41:10 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a5d538c000000b0032769103ae9sm10094218wrv.69.2023.10.09.09.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 09:41:07 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 13F561FFBB;
 Mon,  9 Oct 2023 17:41:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, Radoslaw Biernacki <rad@semihalf.com>,
 David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 08/25] gdbstub: Fix target_xml initialization
Date: Mon,  9 Oct 2023 17:40:47 +0100
Message-Id: <20231009164104.369749-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

target_xml is no longer a fixed-length array but a pointer to a
variable-length memory.

Fixes: 56e534bd11 ("gdbstub: refactor get_feature_xml")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230912224107.29669-2-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/softmmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 9f0b8b5497..42645d2220 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -292,7 +292,7 @@ static int find_cpu_clusters(Object *child, void *opaque)
         assert(cluster->cluster_id != UINT32_MAX);
         process->pid = cluster->cluster_id + 1;
         process->attached = false;
-        process->target_xml[0] = '\0';
+        process->target_xml = NULL;
 
         return 0;
     }
-- 
2.39.2


