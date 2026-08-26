Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920CBC5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 18:43:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzIaX-0007A4-Nc; Wed, 26 Aug 2026 14:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIaW-00076D-0w
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 14:43:04 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIaT-0002GL-5N
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 14:43:03 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2d71ae3455aso9408875ad.1
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 11:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787769780; x=1788374580; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=A8nlgx+yI5uXCE0ljkSUS5BHCQ1iuqkZ8gRew5LCZY4=;
 b=EHr5ul7Ii9DpZ/MRkDioZ8O4L8eWXRHxRqdkJ8H4LdLEycoGEgeljAdjHh6wWAkjkI
 bAEbjHBabo6Z9Ae0YdUw4070oLch7Yp6/DKDPRNywIEzsttSxco73thkYU5NjpK1mImh
 zZYI9jTgIrY+trLwypz2FEUUUtH0vKYVyZp88s4yzJO+3fy+Ie1fOVb++AIHRTHlAUTE
 A1DUBaVqR6sa/EHxGo+SPhzNUstfN6wfZKZ93WNJ0UJh2UxmM/MSvJyzN8Gg5uQuxwef
 YjMe7ioiahZivcAu1c2sdid2OsedYNRTshQ9HY+oTqUqQKZgdeFAsnyeqrblcGUbuIK9
 7JDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787769780; x=1788374580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=A8nlgx+yI5uXCE0ljkSUS5BHCQ1iuqkZ8gRew5LCZY4=;
 b=l7+wo+gEw4j2gLDJ5YGxK1fzZScYiolAPmSISHzoHlGIpCuwxbdrrWf7LyR/vld5cd
 5OI/Jsm9zdi/aA601bPCNjtPJawz6Oj8fCDsCizvlNAI/pvCnX+6qaMvEt8Ox1JthBuA
 BTnheDKL82zenOjehhWE0wRljBIuhSJb4vf1FDxAdjDjtxiXCsmxS9accH0+MtYqRDHV
 CcvuKb+IwWizU6eXzQFHIPAeQdHhg6UkpwgX7NNMelYUP3gocvqJBBql2SP5Azh+jIPO
 bpmzcdkraQtYSswcZFmZXwaL4bSvz18SuuP82yPpfn2eNJFr78YYVS8qG61xhAc5n9jW
 PhXg==
X-Forwarded-Encrypted: i=1;
 AHgh+RridMz+j4klzkkhz90jKwkBiMXYZ95ZqUNPtT81ZxevYqnIbSlbL00VhCvP47M54kCAHw5osRwwXjON@nongnu.org
X-Gm-Message-State: AFuF++kqrxOEx6ClkR1Lun9dXS7qa14mRavtuhSYOZkCxbYNumbLA9hF
 loQId6FN6xxSE3wdvvH8RPNK9SRi94KCGVNhnelhGe+Ry9Mg2DtqJQS1
X-Gm-Gg: AR+sD10/xOXOL1qq073sHR/SQOAny57Yf+zI3xP+QZJFTZ7y/Z309g0xphDOOOWtptJ
 Ts7Izd18PwAQPftUcUzDexJ9/dW/5p0S9IacsD7RH9cQGe8bQNsuMto1xeBzS9ZWPr54/0SSpBY
 /jQ0qKU2coniKxkCAKio1Q8Q8AXNhSLBasAX6eBBA5LcCAJz9XsZ2kMSh7LU7YBOIgHd533tGSU
 kRQcSFFLiFtXTIPzzYaK+NGsvUvURzjUlzb7N+sq+WMYk/THpuUM6nAyq3mj4hpmxGvJNI9EFsv
 1DzAG6CxgOP4PUaou4AY9oOObDc6BKMMz88hiVfxohkZRU6pjDn2M52Me53yW1ONNHskqj43oTm
 YL7Dr+x0lXpSzbZIOeLEDJ62tPP9o5cHOBvLvNtL86wQyWIpd3LB6nR0LlLw7JodEnrwzZ8nFLk
 ZrjDS4RdmNhnRZoTQGPa++L2YwBOjGhSEh5plLdeIYghNFKLeR06WFBDImBo7ryfW5Qa42ptlo/
 ZkCu6JwxiqhsZJ+4fI/JA==
X-Received: by 2002:a17:903:3c46:b0:2ca:4f33:e86f with SMTP id
 d9443c01a7336-2d707b416famr168344225ad.12.1787769779699; 
 Wed, 26 Aug 2026 11:42:59 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-3283d60c291sm17681846eec.6.2026.08.26.11.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 11:42:58 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 Xianglai Li <lixianglai@loongson.cn>, David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bibo Mao <maobibo@loongson.cn>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alexander Bulekov <alxndr@bu.edu>, Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Ani Sinha <anisinha@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 02/13] hw/riscv/virt: register TYPE_TARGET_SPECIFIC
Date: Thu, 27 Aug 2026 02:42:16 +0800
Message-ID: <20260826184229.1145-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260826184229.1145-1-luoyonggang@gmail.com>
References: <20260826184229.1145-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hide the RISC-V virt machine when the selected target is not RISC-V
in a combined qemu-system binary.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/riscv/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2d242ef71a5..b767c5434a0 100644
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
@@ -1718,6 +1719,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
+    TARGET_SPECIFIC_CLASS(oc)->is_available = target_base_riscv;
     mc->desc = "RISC-V VirtIO board";
     mc->init = virt_machine_init;
     mc->max_cpus = VIRT_CPUS_MAX;
@@ -1790,6 +1792,7 @@ static const TypeInfo virt_machine_typeinfo = {
     .instance_size = sizeof(RISCVVirtState),
     .interfaces = (const InterfaceInfo[]) {
          { TYPE_HOTPLUG_HANDLER },
+         { TYPE_TARGET_SPECIFIC },
          { }
     },
 };
-- 
2.52.0.windows.1


