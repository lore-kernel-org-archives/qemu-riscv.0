Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5562DC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:22:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCnj8-0003Pr-Hy; Mon, 11 Dec 2023 16:22:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnj7-0003Iw-HI
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:22:09 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnj4-0005h5-TP
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:22:09 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a22deb95d21so42279466b.3
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702329725; x=1702934525; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U3EU22bNfiIc1b+ZyOtnWaIQVzLfNzz6gZyDB25Dnbs=;
 b=Y3wkVg3XNYjJIvA9dxOqQT23TFfDeKNAX4AYoe6SXSn7gY5l7j8HgGDtYSnBDI7LjY
 s9k19FUQFLsjKdpkCJ3D0rZs6oPmEZ6DfqijnVSmFxd4pY5K3YGO9eiBoWAvuKR739VY
 H8pbthaN/4bujicNaAX+iYD2AAGjK7uogsib7NCOpJy4v0AHam1qt9eQbuSxMjXUsIDP
 JQJSBbUCMg3yCC01DmwAvJITKWXRpsnGxO1uYKntvpgUBDODrjVOJ0rlocVHhr1r4sQW
 zrm+RFXLaLLWrV5uZkJ6CGN23/+ZtKVAJofbJEWCRNJX1itB1NkePPFgBwewfE1d+GA7
 ZN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702329725; x=1702934525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U3EU22bNfiIc1b+ZyOtnWaIQVzLfNzz6gZyDB25Dnbs=;
 b=qCg4Nhz+drO+FmeGeDyM/7iZtZfYRHfjxM6UMHvA1yVC5uiUoDcIWL6SLnTwZnno0N
 1f9ITMVDZY+jJc3sHI63vVcEKFXM3o85KYyvURbt3V+6X5h4vUQunpMuBgymB71KD24T
 SaEsQSB966wDvvJy73HXSAlAiN1qtHob9wHnTEXmejDi8CtgxatX9PUX1VJgkPR6LdkP
 V7RUBOvN/3yh50Cjf1XdAJtiG/nKnos5eULbGRLH4Xr81EfLIDnxgWNCXsBe1ZpcgWBZ
 ODcTNkoi52em85lx4Q7GGakZpFw2BuBiuxvm91Yud3tDxPpfytSFB6w+gVBL3teqUCjm
 RVdg==
X-Gm-Message-State: AOJu0Yw4zBz3D4poKCK9HGohO/DhUaK4zlSLJ46S+ihlN0G88NY+gZbz
 ZVeiQxm9Lw/Y8dkHDbUJgPNTKw==
X-Google-Smtp-Source: AGHT+IGzl3xQjm7C+9LNWEf4YaTjOxsCCunkMYfPCy1U1wU+AE7F8A7uN4M+yUT3A/jdokc1MR9z5A==
X-Received: by 2002:a17:906:c2d6:b0:a1c:1f65:f4b6 with SMTP id
 ch22-20020a170906c2d600b00a1c1f65f4b6mr3223070ejb.144.1702329725658; 
 Mon, 11 Dec 2023 13:22:05 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 rm6-20020a1709076b0600b00a1db194b777sm5310183ejc.78.2023.12.11.13.22.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Dec 2023 13:22:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Claudio Fontana <cfontana@suse.de>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 14/24] gdbstub: Include missing 'hw/core/cpu.h' header
Date: Mon, 11 Dec 2023 22:19:51 +0100
Message-ID: <20231211212003.21686-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
---
 gdbstub/gdbstub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 46d752bbc2..034a4ac211 100644
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


