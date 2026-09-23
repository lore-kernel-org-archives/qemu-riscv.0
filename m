Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD4EC9830D
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:29:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9My5-0002IZ-Ed; Wed, 23 Sep 2026 09:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MwH-0005Vd-U9
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:23:10 -0400
Received: from mail-dl2-x2b.google.com ([2607:f8b0:4864:38::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MwG-0007tI-43
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:23:09 -0400
Received: by mail-dl2-x2b.google.com with SMTP id
 a92af1059eb24-1438cb9b3a3so944126c88.2
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 06:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169786; x=1790774586; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=B9wmWDAGxCIEbiXb+JeTWZOg+WBaBPZDk+tkeJy0Fzg=;
 b=V+DFLLe29Dnq1BdeA7tYCZpdQjaJHGLZlOQQjf74jx5bdlsFPS5f4MjrU+s+wQLOVB
 9qdCBfbVZVHhE1Jnsa71ScdM+dtEqudGUQwkCbugVC1c8fUaP9wU37uy/udAYAZ/ZCxt
 zKo2rz8Hsx+CIioJaXns9RlpkPbl1pnaMRAv0/n+Q05Wb/JzmsuobfsgNaMZ+MgPjjV8
 LuDRtjr5LAUAggchCc6xkOjW0B6p4lf+gk+8XW1kVNtKJ2yjHvet++XfyxyalYqFJ5Xw
 UmuT9vNgDXlTmPJSuYwPKeBqNCK57x6mlxnKc1mUVqgkMj/XmcE+hRl95PaY+sJ73GSV
 tMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169787; x=1790774587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=B9wmWDAGxCIEbiXb+JeTWZOg+WBaBPZDk+tkeJy0Fzg=;
 b=X1aAgh9wLeqoz41Mpn1IsybAcAswg1SzlbeJY8LsXAcgVIFTHZ9NBUvY+xvdNrlg7b
 emZnqWbOkZSTmoQfQSwE+bhaHVKQERGdthhJNyB1iA/k4jyJjIRXShL1gZSYnW4yPGLj
 WDfftKf2ACcAEHNZ2AMR6GgIjUBZl89x7i1mWXo/7ArsAYgnGTy68JRzfpvO9xX//4/+
 /YX+HarQa1ubWfmq2xDH/ZAx9G26z6jtPzeG+0IXQ9YkJ0o6+UaibXGa9SMpOjSkVbQk
 zyQ07r5qeHx/rsKivL66u8j6ZJgsO9NW236npwFPofgt70AmgqXIyCuAyx8gK5f9amg0
 /R+A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxig8/+1RiHgg5WwrtcEU7gIdBehjYtfpb6LXWiV5CtVS/0jrQ6daTfIWiwoMfFO87NG2JSWgMZArS2@nongnu.org
X-Gm-Message-State: AFuF++l7Vf9Lhhngzoq8mN+6n5k7NOoxBkDlqELLHwcxpfuwKxN2Cf8r
 utjmG5j7lm88PCxrfb5UMXActxRRp5VMQHonSkd6YBZM/XwG7zSR9PYX
X-Gm-Gg: AYBFou1LulY/PqNQWh63y+ESpnUxl30q3dKN0B+cu53bwt9ly30YSSDitQ4Q4u4knH5
 473tEkcQnlGQX4iK0jhYDlMxbsu6navTEB1HCyr3odN0xEIN5C1u8QuA8HITKp2yiBsowQB2xxk
 iODm7EoSJp/oscRcrA/AWpbgnw1ydgo46pWTkrf3Q63v1zJjnCS8GKXtHBV5ecujA83Tg/9v+zj
 ZfntA/R2yt/TxmB5j9m06+wb5ZMLGsu+QOJYaGZyUn6ORiG/HFBkLZPdqz2TsvUvpxPTjx+jT5d
 xzfFtjKmV4xADcMubcrk29uNzX4CXGw27Kh/tMfL6fM3l/Iau5RVVVbaQxviR+aj4jhAjy38ZSa
 YK6mKD8AmKJy9LRNNR7jFRFwrQxK75NIgBrqNeIPEAORcgOm3osVsHdGdQIWZv/B2DI1NxiMZea
 xbtErPa10zsdnOe75ifecr0Ia8UEA0jk8xYJXPfsATX0awWiY/OJGv7Z1+ZgeALuceTx9FSpgfj
 xp7FMfY5HhxvS4jthKIUuf9vhYRduW9AqKZIhVRUA==
X-Received: by 2002:a05:693c:88c6:10b0:33c:e93:764b with SMTP id
 5a478bee46e88-33e8e3add75mr2436826eec.37.1790169785754; 
 Wed, 23 Sep 2026 06:23:05 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:23:04 -0700 (PDT)
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
Subject: [PATCH v3 038/114] target/riscv: use target_long_bits in pmpaddr
 granule checks
Date: Wed, 23 Sep 2026 21:15:12 +0800
Message-ID: <20260923131635.1894-39-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::2b;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

- Replace TARGET_LONG_BITS with target_long_bits() for TOR/NAPOT
  PMP address masking.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/tcg/pmp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
index 41b55519a8e..03ee7c74300 100644
--- a/target/riscv/tcg/pmp.c
+++ b/target/riscv/tcg/pmp.c
@@ -23,6 +23,7 @@
 #include "qemu/log.h"
 #include "qapi/error.h"
 #include "cpu.h"
+#include "qemu/target-info.h"
 #include "target/riscv/tcg/csr.h"
 #include "trace.h"
 #include "exec/cputlb.h"
@@ -643,14 +644,14 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
             /* fallthrough */
         case PMP_AMATCH_TOR:
             /* Bit [g-1:0] read all zero */
-            if (g >= 1 && g < TARGET_LONG_BITS) {
+            if (g >= 1 && g < target_long_bits()) {
                 uint64_t granule = 1ULL << g;
                 val = ROUND_DOWN(val, granule);
             }
             break;
         case PMP_AMATCH_NAPOT:
             /* Bit [g-2:0] read all one */
-            if (g >= 2 && g < TARGET_LONG_BITS) {
+            if (g >= 2 && g < target_long_bits()) {
                 val = deposit64(val, 0, g - 1, -1ULL);
             }
             break;
-- 
2.52.0.windows.1


