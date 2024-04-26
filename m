Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B07EC4345F
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 19:42:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s0RT2-0000bz-Ti; Fri, 26 Apr 2024 15:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RT0-0000b2-RK
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:42:42 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RSz-0002vU-0x
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:42:42 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a51a7d4466bso303373066b.2
 for <qemu-riscv@nongnu.org>; Fri, 26 Apr 2024 12:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160559; x=1714765359; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4X/VhmwXvkdhIQuo7rHVj9w7BkqzRhVw95Tx0jafh5o=;
 b=l9DqV5US4XkYQL/ZnZc0L9FJ61xIS7vuMqTfa7mzfRLeohtqgjPS9ATJzwIkSvJfKC
 bQcqvM8U4/mVaNOeei/kl+dRPTE8aeV6JM4KkeOfTKyDfJnacmFXj+4PGsnn+9jn9fEG
 VatWhEfItd20RGFa6E9sy6/2YY+R9bCssHVMGWAtJprHvlq2vrw7PlKp9DZZtbK5aQuN
 PO4VJG4KzUGrbHrZH3Q29CaJBoQIo850T8wEdjbP3COASE2+23OUT6ImGfYNnzu9/ZsY
 JuLEw32lXebkM2Iuah7oPowiYuzN6V5SSIh9TPl9TvSzlK8ttRnVdLkAn2xu8CVjy0J+
 lVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160559; x=1714765359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4X/VhmwXvkdhIQuo7rHVj9w7BkqzRhVw95Tx0jafh5o=;
 b=u0YyEOJw8j8MQBHzz+P1GI2o0kguX/qNxEaK0AM7vKOaHeElmDBrwaxEgMVmvCPYIy
 Ub0ou8gC+16EXkaKfzITIjShKaEy7V/9jJMLM0hDXjyXuQQ+sKfjcCT5ATXHuH7FCfIu
 mybIT6gdSNMRrUGajzUYm3Or/g36ShyfYZ205uP149BRJ8/2nr7CXHpEWhHKzFYXM3Rw
 Dh0aOLVlGHPwFIdU0beTCycj+S9nMyQIVI1gO3m7jDxUUrEFQ+D8kb9CAg7/SLh/3Lu+
 FQ5TuNbXnNPgX0JYu1PIHU42kIlECgseRkxckJelUpvwTO5b5ovp3E+X2nYdI8po7bIO
 x6dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9fyc0Q+PpCC/0ddj3/7txXN2U5vl5cPuxJH2M5GlbUkxy7k79ok65TqRoL+03NtDSgZLgfEzHllvsc+sAOuJ5W3UpUdM=
X-Gm-Message-State: AOJu0Yzro8m4KIEjop6EvPMdwkx1FEE5tjtyS9eDTmaS5Ui0cOS8M7Ke
 AyjKK9JDBWtVGUEPQcGfszW7K5VdDkTFmjE2oDGUE3VsnwmKdSBvea+RMmwB+P4=
X-Google-Smtp-Source: AGHT+IGxJBhgvUwhhWCAgenYBiSIUi2w5crKR0/10WrNMXoZqN9Fol3uSvd/ZTOG18vXH6erYN0+GQ==
X-Received: by 2002:a17:906:28d9:b0:a55:63de:9aa9 with SMTP id
 p25-20020a17090628d900b00a5563de9aa9mr2581937ejd.49.1714160559645; 
 Fri, 26 Apr 2024 12:42:39 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 n11-20020a170906b30b00b00a5242e285aesm10798927ejz.184.2024.04.26.12.42.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:42:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 06/38] gdbstub: Include missing 'hw/core/cpu.h' header
Date: Fri, 26 Apr 2024 21:41:26 +0200
Message-ID: <20240426194200.43723-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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

Functions such gdb_get_cpu_pid() dereference CPUState so
require the structure declaration from "hw/core/cpu.h":

  static uint32_t gdb_get_cpu_pid(CPUState *cpu)
  {
    ...
    return cpu->cluster_index + 1;
  }

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20231211212003.21686-15-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 gdbstub/gdbstub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 9c23d44baf..9c2b8b5d0a 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -37,6 +37,7 @@
 #include "hw/cpu/cluster.h"
 #include "hw/boards.h"
 #endif
+#include "hw/core/cpu.h"
 
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-- 
2.41.0


