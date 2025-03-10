Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA2BC282DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 05:03:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trVEV-0003Bm-9b; Mon, 10 Mar 2025 00:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVEP-0002yG-Pv
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:59:13 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVEM-0008Hr-N4
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:59:13 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2feb91a25bdso5710860a91.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Mar 2025 21:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741582749; x=1742187549; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yo5TAW5cQeh1DHP1d5HtuffIuVKJac+rUoQhULbtd80=;
 b=jLPqevBtlhY7745DKYvPHrRFxIFvApoW5Sal+uA+E2NTEbez2Qc4GUaEoDpLXoE34U
 +gbOrOh+awYNhahSqzxyPecPvCd+E/qxcm2x1xdwEbnC91krU9iYUYCdK745ub8/Dwch
 DO3u2zoVwar4c9WDX2zqxD8peyjJUtjEyO8mtsrXX1AAI22tf8BnTpfG6Ai1FLODEbCg
 e81B2IWDcm3CVd8E1lm6VoeykiGI2OdpBUkqb/oCmOq/dHcFeJ3KfneyG96NISUQ+UHE
 PPRND3AQ9ZY8yuH03DiQMRhcz/BU6pWTWCkT0zuyryj3aoXfa7v98JAVLeQ0mvt2vbnB
 awEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741582749; x=1742187549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yo5TAW5cQeh1DHP1d5HtuffIuVKJac+rUoQhULbtd80=;
 b=AMHJuKgJHTmZpyFkiYfothxPaY7RbipCyTcsPrcS3JVNlJOp385LH729xwmRj0FUsK
 XrbbLo5WN5SjIM406cXXHKpglphF8qyV5tMwD3fSd3AcYFtiKSC0aNpCkiZYhIv8VcAv
 zpYqWZHtK6Aiu0lCcbhpHNElgS98uFI/KgXI6qjLN3EnkViYrcs2uplFy3d4RWFqnj3o
 hytUWaox7BYlIg4c2mB/McO2bvssjlIFXNtD0/qIOtC62Ptf8w4TgSyQ1Sd8FrpqZk8V
 NmAJjYxFNgJcak2r3ZPqB1SRDge4PKt4nXluwk/N4NgmS93VPGVIeXkXoAlfVNxx9Mfg
 rMbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvF6CNYsYsk/B8QXNVr78M/XttVs+J/uWDPuibOOHdutEz6yHfDSt2FInLShBaMvAUPtS1bUc5jtzt@nongnu.org
X-Gm-Message-State: AOJu0Yxb+0cBjG5kG4QTjcMrPho9S4+3erQADoAutmCoL7pHd/FwDypD
 3KiEBZ/BBFKf712WbiIwf+/DQ0VZ25APhNNOdZ7z9oCepq12ya3h29FDmT52sDc=
X-Gm-Gg: ASbGncseFewEs5aCrgFtXmShTtJWnE/Bc0oa94gfnngRXGUwVsFY/874o4P7weLd+S3
 EelJD7YcXKoajuJzHGt5+D5EgQ+nd8fKaU+RhGrgG+oMKE/A+ZZiJoqAMsasdCWLU9pmn4mLc/N
 976xsDPoq1b5x7NsisZ2A3Gp2ZxFhJQplxIU4U6qCbQjnfpNH+UgtVuEq6nwgGGLmHS2z2Behtm
 /aMQnQ5qR12U6NNDtwmkBbDgWoh1o6+m8yK+1CqrrjF3xzbCHGacxYKOo5jIMWllz+aPCh4obKP
 vmBpw4tph1GlvQhRmlX1wKBxUQk64m5R2cVKcKnGJPLf
X-Google-Smtp-Source: AGHT+IE5gWrqVh7MPBsCW9xpH4WbBfOw86WZFsUWQXQSa3FRghy/XQpC1OkuRKA1xd7a02NCd2RqPg==
X-Received: by 2002:a05:6a21:6e93:b0:1f5:6e00:14da with SMTP id
 adf61e73a8af0-1f56e0016d7mr7868375637.40.1741582749217; 
 Sun, 09 Mar 2025 21:59:09 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:59:08 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 manos.pitsidianakis@linaro.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 16/16] system/ioport: make compilation unit common
Date: Sun,  9 Mar 2025 21:58:42 -0700
Message-Id: <20250310045842.2650784-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102c.google.com
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
index 881cb2736fe..3faec7e4dfb 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -1,6 +1,5 @@
 specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'arch_init.c',
-  'ioport.c',
 )])
 
 system_ss.add(files(
@@ -12,6 +11,7 @@ system_ss.add(files(
   'dirtylimit.c',
   'dma-helpers.c',
   'globals.c',
+  'ioport.c',
   'memory_mapping.c',
   'memory.c',
   'physmem.c',
-- 
2.39.5


