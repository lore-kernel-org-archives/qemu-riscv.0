Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9528C369B5
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 21:30:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u4RNp-0006D5-Fg; Mon, 14 Apr 2025 17:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1u4RNn-0006Ch-6q
 for qemu-riscv@nongnu.org; Mon, 14 Apr 2025 17:30:23 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1u4RNk-0001x7-W6
 for qemu-riscv@nongnu.org; Mon, 14 Apr 2025 17:30:22 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-72c14235af3so2820970a34.3
 for <qemu-riscv@nongnu.org>; Mon, 14 Apr 2025 14:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1744666218; x=1745271018; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rSotBaFUmmKWr89h4uQGHoagPTJq+4FsRSbwdeSTqUo=;
 b=WVy2Q03j93QHzMKt+HPYP03TQRkjB+UOxhgxFvpCnOstqNecNGCYFGKMFWn5/hDDZm
 Ti5JNUCifgZQyjWSSLNf7uPJPjSLCXCeV/YhbzscE6RYAyiRDacXQ+8k8UC3wplqzsL8
 9212qG4RzXvhXAAi06Jdc41uqL0bylqbBnVL3n2wzmT3gP8LbzDwum3zNldZgsJp5TuC
 eeKuCOpX+MqM7kLxTELbndOaJTqrdFSrl/C9oAmPbkwO1TAsaUjRj7hsHRUAh+R4Q652
 sh74J0il5zxfgNvow+obIWIgBsdJzuf1qstbnGHzzcLCbv2Xard6ftoI4jiK4QWvpS7s
 401A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744666218; x=1745271018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rSotBaFUmmKWr89h4uQGHoagPTJq+4FsRSbwdeSTqUo=;
 b=c/QD0axuIpEHIQlnhh6sumGAY4kwy6+RtHawRUeku10F+USAe72Oya8+xVIBCxCjQa
 rMifjZNjwvLJoUPCnt1Fu6Yy/MeIaOn88hICsqsuJHzY/0LYAF6b3UBsAdonJX6xoXSX
 gFg7DeDZ2HnbfeiET/cPUh/EMyoqdEafDg2gzO+sH9pXAhZYF6bX5iFEUacE9BqTrzzm
 u+JvfYe9eA0fW3cD1iOLu+P6eU2MmBdt2mGLMVDgffP9mDDpzZ7CYEHltLBo84dlMS5i
 1a+E6HgSAL9GsrC9nQDIkbnhoqgq0SFr8tt2haX0M9VUWvV9rtqYHkzh8Lns/efA3lyA
 HTrQ==
X-Gm-Message-State: AOJu0YyF5eOymj0o7mDoldfNMLK6keaUYCpyniyMcsBSAIx+kEed4EAd
 MRq0t7UmzxNy92Dm6bk8VslZWf++S/eJJLGcRdYiDRB9vpK1W8HhA9JHR01HMVoXg/VuuxFQ6Si
 o5jg=
X-Gm-Gg: ASbGncsR6rza5JROqSkzUf1Qlt1iekJQrpU0lObgghNxc2gxGTpo7zJLLyMtBAaStxK
 oESdpBtlOd5TSJuVv0avjSIpph4aE51a4dR6KtT8yARstj609rGwrcCn4DEGhMmk3/mnjceel7Y
 beXzVtnmrK419rpfDaV0Zvyn0GECJhEnk1AHAnZSHbqFAdzDOsugAPW0twSnbaR3tqsxs+kEJNk
 1GXrVx4hIfxjo126mOA8vuXcfOWKBFcA/0yAPUOlk1teSA3QyG07imiIhwwP0ZaNY9aXrLiG7Xn
 4T+SrXnQ0IpPEETlLRfX/neRlZdinzsoT6Oaa2+c6KoyXIdmiH3fONkws6WoQ04JmosfjMjMdGA
 =
X-Google-Smtp-Source: AGHT+IEkVa2S+U01stfqgQn76gV6oe8pSub133NcxE+NMQ92oq8B9w+toXaXzmbKP5Xac8+7hE1RRw==
X-Received: by 2002:a05:6830:6812:b0:727:3e60:b44b with SMTP id
 46e09a7af769-72e86331a84mr7800038a34.14.1744666218315; 
 Mon, 14 Apr 2025 14:30:18 -0700 (PDT)
Received: from ausc-rvsw-c-01-anton.tenstorrent.com ([38.104.49.66])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-72e73e4d7e2sm2168999a34.45.2025.04.14.14.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 14:30:17 -0700 (PDT)
From: Anton Blanchard <antonb@tenstorrent.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Anton Blanchard <antonb@tenstorrent.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] target/riscv: Fix vslidedown with rvv_ta_all_1s
Date: Mon, 14 Apr 2025 21:30:06 +0000
Message-Id: <20250414213006.3509058-1-antonb@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=antonb@tenstorrent.com; helo=mail-ot1-x32e.google.com
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

vslidedown always zeroes elements past vl, where it should use the
tail policy.

Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
---
 target/riscv/vector_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 67b3bafebb..1012d38c8a 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -5113,9 +5113,11 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     }                                                                     \
                                                                           \
     for (i = i_max; i < vl; ++i) {                                        \
-        if (vm || vext_elem_mask(v0, i)) {                                \
-            *((ETYPE *)vd + H(i)) = 0;                                    \
+        if (!vm && !vext_elem_mask(v0, i)) {                              \
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
+            continue;                                                     \
         }                                                                 \
+        *((ETYPE *)vd + H(i)) = 0;                                        \
     }                                                                     \
                                                                           \
     env->vstart = 0;                                                      \
-- 
2.34.1


