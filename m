Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0E4C5DF97
	for <qemu-riscv@archiver.kernel.org>; Sun, 23 Aug 2026 15:19:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wy9y3-0008U2-EA; Sun, 23 Aug 2026 11:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wy9nq-0007RD-VA
 for qemu-riscv@nongnu.org; Sun, 23 Aug 2026 11:08:06 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wy9np-0008KO-CU
 for qemu-riscv@nongnu.org; Sun, 23 Aug 2026 11:08:06 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-39266382df6so2011903a91.3
 for <qemu-riscv@nongnu.org>; Sun, 23 Aug 2026 08:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787497684; x=1788102484; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ySPa6h2ifrYJcA6pQJgvXQ8WNCjDkVVB+L9hgfcGq1Y=;
 b=h5HjiKu9/FE1JZpnGIPt+zwVwuYMgjahJIZKOgJdymhCMC1PzOy6IpLcqrv1dplge4
 mebmgellNfLjjSkas2FRr+z7CmjGJnPu9UwJpudHQ/WO3iTKefMXXzlPTbkCiR5UWP6t
 NJs4Ftxko8ShIBBP6nl+xF9Bg/BmOCbLx69HU8hMBP1kc1B4z/VoaHyl3ou/zR5wZrXt
 ulykdFmQ2LLfxFoydAilip49XzCGpXXulz+Z6dx+byK+qjclOGguNB0FvaMJjmBu1ZrS
 aNaKkeyhfCFTXTekhimQ+vbEXWq2UYR3XPd9WbwzDiqmReH2btYqP/EbH0C3nCzIEuy6
 dDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787497684; x=1788102484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ySPa6h2ifrYJcA6pQJgvXQ8WNCjDkVVB+L9hgfcGq1Y=;
 b=WI4XeD9i/xRf7Jh2rQFZmddnMmBLaI8yxNEK6px9g9nnQI3U2uY2It45eXkl7FYzlb
 Q8+jm2QQdH0dGeUcz+gBy/AgWAjZIkJAAKVHaVGX8iXP0V9bsqlZ6c7efJ15omqQXSqG
 vVJ/kdrtp9dz0e3RQC8+CGFO4yBagfhEunZXyyVtfmZ2VyMq7GsizhwHcNwuLrHY8tq8
 QWNTXhOYVNg5Q45jYvQ+b2POP10PbUj14KRT4CNAO2YQipONCEpo3N7KUyuw263UVqLv
 xZy9jLbzbo/00uXwZJWcRSJtx4MMNN1wvNiGPWyJJgfASvf6btHO3o8JT/9ilUundDnm
 CV/g==
X-Forwarded-Encrypted: i=1;
 AHgh+RoQIiTjGzJw6u7d/9geY0+xh8b147CYkyIIa4MI1p2JXFo2LAi9l2oqieifS6JeGGjLhlLTlyLKa2vt@nongnu.org
X-Gm-Message-State: AFuF++lIBYExX5C2yHFvU4MUrLyP9O5zfsAljL11+nkEP4RYQ8JzVsmu
 2PhMHjZbS4CmQSgH+k6xJ2KyTAZIlFeTZwQcw7dnErIDjMJl9V3lTFWH
X-Gm-Gg: AR+sD121AezhG0ECarG8BZVqQVOpKEoSfAie05ZpYyMfJVTpcAhYvpykVCjlEqV1OeS
 kpzo7rPwHf9m8Sf2PutalcuK8h4100Y4B56GB7SuBpfcj9WTEqJZJnebxmHcZzbBW2b4eCMc/DU
 +U6PTF52KZm0a9prqJtdFlQCt8JcSOLnENB+gZjAfjgCjoc4gSsuPn5Tdab8c+wiQ08PGEM0OmT
 B64bZ/aFnLzfQMiqaBQs9Ye6LuYmVRELY8ycA4KdMqv4Snl32z7Ps8V9g7IwAUM/cV0U2sRF6jL
 YdWU5/EyAx0pc9sj4g9RUrwEQfJ6Nqhxl4JQudOiyW2AAQVukVQgkzqIuRcB/kbBWQSYs19ORrS
 jUvWtBycwMnuCuU3yS7oHxzlAxZvp2YWUft2ilH1TjHFSc5G4oW36YRuMue/a/cYtnFbUuKCHiD
 dp2SCqq+3eZ65AyFZqkg4O22aqGT6TxvsqfIACNxLUtzC3IFV4HVq/OzFYQIyIM9q/769+UoUKt
 /t2TNPZBLKHP81Aj9NVtjPjkPg1BYCy
X-Received: by 2002:a17:90b:3902:b0:395:bbfe:fc6f with SMTP id
 98e67ed59e1d1-395c333710emr32506801a91.3.1787497683982; 
 Sun, 23 Aug 2026 08:08:03 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1418619d6ecsm16024511c88.14.2026.08.23.08.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 08:08:02 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Sunil V L <sunilvl@ventanamicro.com>,
 qemu-riscv@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
Subject: [PATCH 02/12] hw/riscv/virt: use unique QOM name and target filter
Date: Sun, 23 Aug 2026 23:07:20 +0800
Message-ID: <20260823150731.896-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260823150731.896-1-luoyonggang@gmail.com>
References: <20260823150731.896-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 23 Aug 2026 11:18:31 -0400
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

- Set TYPE_RISCV_VIRT_MACHINE to MACHINE_TYPE_NAME("riscv-virt") so
  RISC-V virt no longer collides with ARM virt-machine in one process.
- Register TYPE_TARGET_SPECIFIC with is_available = target_base_riscv.
- Keep -machine virt via mc->alias after the selected target is applied.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/riscv/virt.c         | 6 +++++-
 include/hw/riscv/virt.h | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2d242ef71a5..1b672b2169d 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -22,6 +22,7 @@
 #include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qemu/guest-random.h"
+#include "qemu/target-info.h"
 #include "qapi/error.h"
 #include "hw/core/boards.h"
 #include "hw/core/loader.h"
@@ -1718,7 +1719,9 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
+    TARGET_SPECIFIC_CLASS(oc)->is_available = target_base_riscv;
     mc->desc = "RISC-V VirtIO board";
+    mc->alias = "virt";
     mc->init = virt_machine_init;
     mc->max_cpus = VIRT_CPUS_MAX;
     mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
@@ -1782,7 +1785,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
 }
 
 static const TypeInfo virt_machine_typeinfo = {
-    .name       = MACHINE_TYPE_NAME("virt"),
+    .name       = TYPE_RISCV_VIRT_MACHINE,
     .parent     = TYPE_MACHINE,
     .class_init = virt_machine_class_init,
     .instance_init = virt_machine_instance_init,
@@ -1790,6 +1793,7 @@ static const TypeInfo virt_machine_typeinfo = {
     .instance_size = sizeof(RISCVVirtState),
     .interfaces = (const InterfaceInfo[]) {
          { TYPE_HOTPLUG_HANDLER },
+         { TYPE_TARGET_SPECIFIC },
          { }
     },
 };
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 36a2def4109..5559783aebb 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -30,7 +30,7 @@
 #define VIRT_SOCKETS_MAX_BITS          2
 #define VIRT_SOCKETS_MAX               (1 << VIRT_SOCKETS_MAX_BITS)
 
-#define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
+#define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("riscv-virt")
 typedef struct RISCVVirtState RISCVVirtState;
 DECLARE_INSTANCE_CHECKER(RISCVVirtState, RISCV_VIRT_MACHINE,
                          TYPE_RISCV_VIRT_MACHINE)
-- 
2.52.0.windows.1


