Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F74CC6B1F
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:43:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGvVl-0002ne-2C; Wed, 14 Oct 2026 05:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvVd-0002jE-Qc
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:42:55 -0400
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvVZ-0001g7-NP
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:42:52 -0400
Received: by mail-dl1-x122d.google.com with SMTP id
 a92af1059eb24-17bc533fda3so754335c88.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 02:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791970967; x=1792575767; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UMv3P7LT5eVeaLvzcHhKXPCVXwqK6FvuxNT3/ZpShFM=;
 b=Sr1SLthT5dT4d9y603sBsDCyRfbin4szv7Ivv/1w1uNXV0NxnPnSevDDZ40kImTE12
 wBuuFSx9rFI4cWu+s8qHNAqWFMsSDz7Wax8m8qnITtl8pxpgE8motXXUaU7bn3ITOQkp
 d6vUg3VF6IgQy7KJnmixPMr4cTQNUmKSnozDWxLj4aoXrqGVUQigTYZxpGTTbU7nh921
 hJCw6CFCTuDOeu3P91VqJJn8ZhSZrDOThsQA2c4oXBubjTUr2mCGgsc/K45KhRglbuM/
 68CNNjmq81g8yzBvmv8Glu1KrKDCJ0Gbf0uXu0w2aNlQGIPYsyNcRtI6GZdy8Ze1JMFY
 fXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791970967; x=1792575767;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UMv3P7LT5eVeaLvzcHhKXPCVXwqK6FvuxNT3/ZpShFM=;
 b=j4SXQDUAb6Z2gwVwgKTxZR6Bp/TqzArFVAL3/UnHZ08yygzMwYxbiaCiFK00ccDVBQ
 mv6Sb/iOMfMZYrUOz2B5cVegdIbtqLrbfq8BL73bvybxlDnErGbm5DvBrVQCvnX+Fxhx
 g8sz2lV6VR9rpvXE3jfSpr4rMiKg7mN9loxXZ2AhLL0P9XUuFk8oBh2laOVLndwHc4KQ
 /aojDUS5ehiJXFd6HDObigqRW01SWS8/C94evvX3W5hvSKcTGzSu/QcIWD3LBwiShknq
 sLLllit8eP8L+0Xfl0k+87m5Yr0ETXYstChD7qoTANYKHwoaFGyPARKqZ59zclGiIi5j
 UQZg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxOpyx7UW9Y3IN2irhvvanRztThF6nmAinPnZKBJ6jBaeweVHwr/Pd1s+EfvzUA2pyipPCSP++ht4zT@nongnu.org
X-Gm-Message-State: AFq9FYLBQUHfs6/Pdjfnc1ZUDWS3MjPV4GBTFZdg6aKHDdwM+dTgEyoy
 eQAV7zRLbaCbbhyfAmfgASLvSduZsCqXWDsy6fVHZHkSFypof8nIMOPh
X-Gm-Gg: AYBFou2XsZZ+C5ydd5tsKOQ16/130LYhU8mP9H3URqp/+ef7NjxP6nvhcABYYhysZbk
 G3GrR9sGa8EgWqrnCpVRAQExMy0X9T7vq9nLtzs5lESyCTi25r+6R6ELV5uUSD1H/xmTkjvGDur
 9eeJ8wCg074y3hlpcYQoppYmJ7+y79kdDkqMkIbB5WzKb8PoX7kzdDN9QuH7bQH12gRpkvPC5fU
 9XRaCdBzcgsPhoFdaSBZk6P6veS7NC5cNNQIWg1pr5BLhObOPHlpJ3dVlAsTeYYwY3TYDSNtb/n
 EE+sDucfXKtbu+wW1Gi+weoarfl/iM1sAbDEF5PIEEbFInnMwO69b/wjlU3UVCHMMHNZJ8cZsDo
 r3/oZpZRbacrdhsZWeDwtS8/LcCNgpUyxJpN0RNODI6rXIWSuCrOw3yWlVMsyUkFRrzsLYtEtqJ
 /9y3YvVhaICKf9x6JJDfE4PGnwNLJMfJPBrimqbKB9qqscKONh1dotUM7qRvr0eFRKYCc9N8GGR
 swY6oRDwF4kkjblQQ==
X-Received: by 2002:a05:701b:2403:b0:145:152:b547 with SMTP id
 a92af1059eb24-16a56ab0d40mr20014077c88.1.1791970966688; 
 Wed, 14 Oct 2026 02:42:46 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-169a31f6f5csm44348380c88.11.2026.10.14.02.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:42:45 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, Eric Blake <eblake@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 David Hildenbrand <david@kernel.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Fabiano Rosas <farosas@suse.de>,
 Song Gao <17746591750@163.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH 17/34] target-info: add a combined-binary query stub
Date: Wed, 14 Oct 2026 17:41:32 +0800
Message-ID: <20261014094224.1976-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014094224.1976-1-luoyonggang@gmail.com>
References: <20261014094224.1976-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122d;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122d.google.com
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

Declare target_combined_binary() in target-info.h and provide a stub
implementation in stubs/target-info.c that returns false.

This lets target-independent tools and single-target binaries use the
query without a combined qemu-system implementation. A combined binary
can provide its own implementation returning true.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 MAINTAINERS                |  1 +
 include/qemu/target-info.h |  7 +++++++
 stubs/meson.build          |  1 +
 stubs/target-info.c        | 10 ++++++++++
 4 files changed, 19 insertions(+)
 create mode 100644 stubs/target-info.c

diff --git a/MAINTAINERS b/MAINTAINERS
index fc60193aa3f..669814d29c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2146,6 +2146,7 @@ TargetInfo API
 M: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
 M: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
 S: Supported
+F: stubs/target-info.c
 F: include/qemu/target-info*.h
 F: target-info*.c
 F: tests/unit/test-multi-targets.c
diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index adda363ac39..9704ee32605 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -42,6 +42,13 @@ const char *target_cpu_type(void);
  */
 bool target_big_endian(void);
 
+/**
+ * target_combined_binary:
+ *
+ * Returns: %true if this is the combined qemu-system binary.
+ */
+bool target_combined_binary(void);
+
 /**
  * target_base_arm:
  *
diff --git a/stubs/meson.build b/stubs/meson.build
index 29b6644b254..ed7aeb61d0d 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -3,6 +3,7 @@
 # below, so that it is clear who needs the stubbed functionality.
 
 stub_ss.add(files('cpu-get-clock.c'))
+stub_ss.add(files('target-info.c'))
 stub_ss.add(files('fdset.c'))
 stub_ss.add(files('iothread-lock.c'))
 stub_ss.add(files('is-daemonized.c'))
diff --git a/stubs/target-info.c b/stubs/target-info.c
new file mode 100644
index 00000000000..8873aa21594
--- /dev/null
+++ b/stubs/target-info.c
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include "qemu/osdep.h"
+
+#include "qemu/target-info.h"
+
+bool target_combined_binary(void)
+{
+    return false;
+}
-- 
2.55.0.windows.3


