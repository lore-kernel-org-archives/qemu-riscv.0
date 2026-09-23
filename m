Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A172C98302
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:35:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9Mzx-0003mD-Be; Wed, 23 Sep 2026 09:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mvs-0004K2-Kz
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:22:48 -0400
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mvr-0007km-7i
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:22:44 -0400
Received: by mail-dy2-x10.google.com with SMTP id
 5a478bee46e88-328664dbe2dso384604eec.0
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 06:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169752; x=1790774552; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WqXX4SX3rjdHTToJvg98g4i7PWcyKUf7129uvkL7/uk=;
 b=A3ubRTPFXn+gaF+WSe23G+iYOx5xI/zlN5xfU4teR70rvQOHq/duPa3UbtUTW0IoHY
 Cy/1p0ON+FfPJFB/qgcq7JMvBH+kbIDivYLDMvM+5XYqttpmsLCbOE01aumu3DHlenB2
 ICwOlcNFBowwrymRCKZ0E5Nn8f431qOR+0dhnGwaLM9tWuANjDFC5rdTl8UM2G22Oyrv
 VurbRj11+9Q/VTJS1w3KYe3ayywUNpVmB7nepsj5xy3ll4is4RecC7J/NXMLKILOIdm8
 HLNmBNmuJBpDA5igCK2Gyhce8Xtsx70iiWP2CNoo3qmODGg0tnS4qiHuUclg17aHYyqM
 p77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169752; x=1790774552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WqXX4SX3rjdHTToJvg98g4i7PWcyKUf7129uvkL7/uk=;
 b=sUGPE7+THkT2tISmSz0NVbh33hpDnanGfN9MkazZWphHaeAbBcQN3Bh0J5S819EiGK
 eS/so+y1kDDzAGfj0XV4oGCr1sfWUhIm6peTrMbf4fqtkpsturavgROykOvwNlpTxfna
 MxgrdWn+imesxbNnaGjVbbrX/oGYeWxebiNUZsdlWNABT3EjLXE/gK4IwtbmbY6O2ibw
 SBH5AH4ubsijMhAahjkdS+bgts6CUNHm/reQQgTJIquuwFmjr3puUFFidunXFh0Oie4s
 ZXuSb8U0dGsxLISG2hmJRuUkzuJNeQLgQa0cD6/MVLZfBF+1LyhI+xrCZjBA8wf2FKmH
 eghg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzMIAHkAog1sjj+ktg8x+jDsS8aK7BZujjVfV4qOQQSALitrSPlYWt5kwpax8xP6vgJOSG1iJXmxxcp@nongnu.org
X-Gm-Message-State: AFuF++nfl+3DcsF+WwHXYKM0SVu+FWkppn4JtdIj+1vC8zevPv3j8XyZ
 8W3Sjqt2enNEkONtCDDlt/ONk+c87Fcc982c28P3a87aubg6I70XfRVO
X-Gm-Gg: AYBFou0R5lIxbwA37R05st5FjGISlrHQLSS4TQY13xrSYAgt4wkWhj+7BKXMFz+zYTz
 mly48ks1VR3JFbibu9lRToDFBBxNax+SKZJmBU3RTeAgEXRw6B82tbqYMyfyy9eWoj8WzMDAslX
 1TfGj8pt0YxdMpjxuD7iq01tK92HorYQQtrHde1JsKPdGxXabRWDsZq35BMtIYMmVasnlVDFWdi
 b4LhvMYeK6G3XmoeAwWZkq+8RrdoX9Zjc7zIeKSoq8/MW1zBPAFZ/EdPTRXXKlNqLvHnf3exC1K
 3Q+op691whcze+E7Lz8XCl5WWoRXAfjKJy+i/GvZSPrzhI9mOUFlDJ5c1UOOpXNogNR0z85YHwZ
 2Fbpi0gsbvdPgV1w/owIcVPPTZAEy/lzi1susQJ7P60meqHUzRoEoDRAkqWlorLMVddEYfeK5MY
 S+UcBgJFvA6aaGpmUb3qS3AvmoYKpELBSvjFnt1pWz90pi08H6YgS09XW0YS5FVGRkx98UdhkC+
 oqXNjJiIYeuZrog
X-Received: by 2002:a05:693c:8814:20b0:33e:5e42:e0f9 with SMTP id
 5a478bee46e88-33e7a4d6cd5mr2603893eec.6.1790169751387; 
 Wed, 23 Sep 2026 06:22:31 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:22:30 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 034/114] target/riscv: Include migration/vmstate.h instead
 of migration/cpu.h in machine.c
Date: Wed, 23 Sep 2026 21:15:08 +0800
Message-ID: <20260923131635.1894-35-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

already uses fixed-width VMSTATE_* macros and does not need TARGET_LONG_BITS UINTTL helpers.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index bf203bffcef..00805745fbf 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -21,7 +21,7 @@
 #include "qemu/error-report.h"
 #include "system/kvm.h"
 #include "system/tcg.h"
-#include "migration/cpu.h"
+#include "migration/vmstate.h"
 #include "exec/icount.h"
 #include "target/riscv/tcg/debug.h"
 #ifdef CONFIG_KVM
-- 
2.52.0.windows.1


