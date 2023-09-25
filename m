Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3811BCE7A81
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 04:32:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkdFP-0002y0-71; Mon, 25 Sep 2023 00:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkdFN-0002vC-Cv; Mon, 25 Sep 2023 00:31:01 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkdFD-0007Wc-BZ; Mon, 25 Sep 2023 00:30:53 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2773523b2b6so886258a91.2; 
 Sun, 24 Sep 2023 21:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695616249; x=1696221049; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vbzU6PuAtTUzb6Apd7sQVmg+mcHLI4MPchfruHrfnq4=;
 b=CCFKEMd151qE4fEBGJzbESBuSZAkWVKr+PtMf9CMFlrvvOeVUl08zdymkICfDWmi1m
 fkmdtKFMLwM/MRtoy4QsgnMzyuUeLlyENE/1a2Pq7FNX3pYa61Hm+KuTjnHZd5BP6dUa
 9qLpyhefA2HMKD44kHQkGjltCv7AtX4piVg9DHNdvaSIyERb3azuA0PmNp1IvMxQhcgO
 CcFRgtcMuvmwuzSLiEj7n2UjaHbox/DOmo4NuBCQVka1LhtebWV6l7P/QrreUpWoQ7Bw
 A2z28qobBjJgGCHoE4rZqxPqyJt4I2p2ZNdCbC8ZxMVtau4/Bv6G86AWz34IrjM905k7
 p+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695616249; x=1696221049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vbzU6PuAtTUzb6Apd7sQVmg+mcHLI4MPchfruHrfnq4=;
 b=odZSudU4tRu7HM6U4eMSdG66LuAOGRVpMhDapRjqvHvt7hW+1ty7UpRRfoPJvs0oxB
 3nv8IhQ76thq03PgPsE0VV8w9K3P0CVb/NZXLz6+REopvTEipCFsSmiqyiIn0+5gMEbP
 G+1sdsge9XevRvvqUc/yfqHd3gRC9Y+b3HJHee2eHiBSCIQyuO73j8wweRd+lbIT7iOn
 RnjXU83TTPoi+Iyk+KodYgWvXOgyhADJU3BJYosAIqtmK22RbJrB8ka3CHMcrhUjwBdp
 yPve6AW0lE+dvEkdSShU0KD8rRtqRr7+ihymABcjEttGZdQrlVkbGo4UdvWEY8qnmA+U
 sa3g==
X-Gm-Message-State: AOJu0YyLa03N51P11Pm4X3RhRIYoijO7vj6c7DYsdUQ6wqWSNqnTXZDM
 /bucHS/hPWYuYfBrUgy+qpo=
X-Google-Smtp-Source: AGHT+IF2MFlbGEMFluAhFsg0/sJ9YANolk5k0QJe81NJ8MLRdR9quSLqHuSpx6rHbxORHb8guZ/tQQ==
X-Received: by 2002:a17:90a:f016:b0:26d:3ad:7c83 with SMTP id
 bt22-20020a17090af01600b0026d03ad7c83mr3241519pjb.13.1695616249409; 
 Sun, 24 Sep 2023 21:30:49 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a17090a134e00b00276fef82025sm6002161pjf.35.2023.09.24.21.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 21:30:48 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: david@gibson.dropbear.id.au, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com, alistair.francis@wdc.com,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, palmer@dabbelt.com,
 alistair23@gmail.com, dbarboza@ventanamicro.com,
 Alistair Francis <Alistair.Francis@wdc.com>, liweiwei@iscas.ac.cn,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 3/4] target/riscv: vector_helper: Fixup local variables
 shadowing
Date: Mon, 25 Sep 2023 14:30:22 +1000
Message-ID: <20230925043023.71448-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925043023.71448-1-alistair.francis@wdc.com>
References: <20230925043023.71448-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Local variables shadowing other local variables or parameters make the
code needlessly hard to understand.  Bugs love to hide in such code.
Evidence: "[PATCH v3 1/7] migration/rdma: Fix save_page method to fail
on polling error".

This patch removes the local variable shadowing. Tested by adding:

    --extra-cflags='-Wshadow=local -Wno-error=shadow=local -Wno-error=shadow=compatible-local'

To configure

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 3fb05cc3d6..cba02c1320 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -516,7 +516,7 @@ ProbeSuccess:
                 k++;
                 continue;
             }
-            target_ulong addr = base + ((i * nf + k) << log2_esz);
+            addr = base + ((i * nf + k) << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
             k++;
         }
@@ -4791,9 +4791,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
     uint32_t vta = vext_vta(desc);                                        \
     uint32_t vma = vext_vma(desc);                                        \
-    target_ulong i_max, i;                                                \
+    target_ulong i_max, i_min, i;                                         \
                                                                           \
-    i_max = MAX(MIN(s1 < vlmax ? vlmax - s1 : 0, vl), env->vstart);       \
+    i_min = MIN(s1 < vlmax ? vlmax - s1 : 0, vl);                         \
+    i_max = MAX(i_min, env->vstart);                                      \
     for (i = env->vstart; i < i_max; ++i) {                               \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
             /* set masked-off elements to 1s */                           \
-- 
2.41.0


