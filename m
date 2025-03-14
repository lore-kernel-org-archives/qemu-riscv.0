Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8065DC35FF1
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 17:33:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tt8uL-0006eL-QM; Fri, 14 Mar 2025 13:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt8tK-0005gA-1Q
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 13:32:16 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt8tF-0008Jl-1c
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 13:32:13 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-225e3002dffso13001325ad.1
 for <qemu-riscv@nongnu.org>; Fri, 14 Mar 2025 10:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741973525; x=1742578325; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pdsNHldr91xnqdGHk1DTLXuYnmkD/cCe/HKmA2EoKL4=;
 b=o0TsBlHvwzPry7dZIYBB3/tKrBPkA7Ip6AGgpw4DSKNlQHzaP33D1IE4bMMxdgunbE
 B2Q25p2kCZ/nrs1vAxfSmIziSaUFerD6z8YZWZf/+LICU2IqZMTqCpdCCqQFMTfQD3aC
 h/scudom0yreY/ubpMqpBndAnObPEhYLwV43uJR1DMqbnUqGYXkOZ1dgMLKmRbC1PG+Y
 M4SL8SX5Db9nt6oIBaFMG+1+VHFHh22PUMkwKXZkXva4v9h9Y5tgNYuOYOw/et4By5sZ
 TEjNrc313mc25N/WBE5SU2NiUxb8mBj6LfxHUjox82uZfAdGQs3Qa0AZyk8HVqi9mo5S
 iMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741973525; x=1742578325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pdsNHldr91xnqdGHk1DTLXuYnmkD/cCe/HKmA2EoKL4=;
 b=JhZeEAdTJc6oUEmO9jiiBwEtn0oEKQkCf6so+yY7CTY3b00nYksJ2HqU1xMi6iQ0d/
 hCD+yNNubSq7M3EYj/7mZg0/3dOSihqqOlvSKjv9ntUjheIUg5oGBSuZ2lvUNpsTezH+
 4dNnre2lNePXyqsAXl2a84KScnyHx1pKsHLNSvmFgPT1ki1ZN1QobYIldl6+ujVGRnDJ
 eFzWffOxTGk+0YGkavO0JDqnmZYorDZ1ZLI+zXK29Kq/7dduC6Gukl2Aa8YUOWl0nxtq
 7IX8NskFihBl/LlbBnSQ2JF4OOIbGRKM/CKGQyx8QN1a2zYD4LAvVmRHLJ3Ue4+vZ3c5
 CgQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbzB68rt+BNLY54y4BiF7sFVc8xOmy8OrW4y9cgY05gcCXXUHVvpt8NSsAZObcPTuMC/tejLDb1UzG@nongnu.org
X-Gm-Message-State: AOJu0YwO+8PxyKzuojK6taRizdDdQqgkYAwznS3Q8cnmdhprHfXBCsvK
 3e4Su4vSlsHaNpdMf20ibuLWj5yIy8pb/iGUzk7ph4QsaWKTtDTSbaz+bZ0+6oA=
X-Gm-Gg: ASbGncv2ytedv6U18CVtt/Lv1n0sNH2UawpUVzvomLsJd4fgdPgR4xIh/wJ0E3rvviQ
 fJlQUScIqC3hZfgT+OUm8L7XOGuHZrEenYQiEpTy6c3w+cwkD2VKeIuyFoF3S6DxodIeRmEizZk
 /sCykMEDBjLYJwp10ZGO5qVAz0yrFTaatMgNVb3PEyT4PUD53r8f+acVru7stCSXJ5tPxgGlxz6
 E1aVO8HLgGvlaI8QDSqNMUOrP++527x0i6k8TLP49Yj6MjiQlbptIrItONu+9hRaKJ+QlRuRhaB
 GveBNXY8aAKdtOecTAbJ5K3Qxai5zc3tv+ktZcbh9wzw
X-Google-Smtp-Source: AGHT+IHKE9NhNFaDqc44peROMWsjYJioKgZvs6KA5f3lAVTw3ISh5g4Lmu4Vqxy0jtgBCp9rXQffRQ==
X-Received: by 2002:a05:6a21:1f81:b0:1f5:75a9:5257 with SMTP id
 adf61e73a8af0-1f5c1174fd0mr5240657637.13.1741973524846; 
 Fri, 14 Mar 2025 10:32:04 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:32:04 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-riscv@nongnu.org,
 manos.pitsidianakis@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Anthony PERARD <anthony@xenproject.org>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 17/17] system/ioport: make compilation unit common
Date: Fri, 14 Mar 2025 10:31:39 -0700
Message-Id: <20250314173139.2122904-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62b.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/ioport.c    | 1 -
 system/meson.build | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/system/ioport.c b/system/ioport.c
index 55c2a752396..89daae9d602 100644
--- a/system/ioport.c
+++ b/system/ioport.c
@@ -26,7 +26,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
 #include "exec/ioport.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
diff --git a/system/meson.build b/system/meson.build
index 4f44b78df31..063301c3ad0 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -1,6 +1,5 @@
 specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'arch_init.c',
-  'ioport.c',
   'globals-target.c',
 )])
 
@@ -13,6 +12,7 @@ system_ss.add(files(
   'dirtylimit.c',
   'dma-helpers.c',
   'globals.c',
+  'ioport.c',
   'memory_mapping.c',
   'memory.c',
   'physmem.c',
-- 
2.39.5


