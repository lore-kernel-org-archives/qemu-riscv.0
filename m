Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277F7C001DF
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:42:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtsWm-0006ou-2i; Fri, 20 Oct 2023 12:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsWT-0006AI-LD
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:38:55 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsWR-0002pw-Sq
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:38:53 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99357737980so169876766b.2
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 09:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697819929; x=1698424729; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1BNA9y4zfVXlb8HVquuGsJAgjqtZlJA+2+vEQrqSYx0=;
 b=JhPNdTocbTVArUvvsFVJtAW+R6RCySThAfEjg/8Yr0hQHwJ+VCi9TCPhjLhcRrbc80
 1o5xfXC5MsW5OJv/cQFeKpiVrE14vG1ZCV/3uPgsM0NVZrn55y1NZ4GTnivkzSBqN2p+
 6wkOJIZZs22/c9E+8kBl6p2HMvI6uLGFjgWyDcMhgRCQAe67j3vRj5A0GND7vW5Hvtue
 smuKcJlR+WeeKsMTH4AesDf/HEyAPoc2eOKXlg4WZ8jPiCzMqXgnjhUxYnXdCLtbShIv
 OZm0Mu2R6uK7egr1dT+qI/K3T2Tt/jMblVOWBzJPlTi8d6hmQdsQOLaRaHfINCS5Vun6
 aHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697819929; x=1698424729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1BNA9y4zfVXlb8HVquuGsJAgjqtZlJA+2+vEQrqSYx0=;
 b=AqjEo951LG9I9ZR3MaA42anedMOTTP5IDyf6+oVlUUQ59BFxK9je7jYvjiTHogtJsf
 L/3TB00NGd9zCZl8hqgl3hbfUNniuAKVzMAYzYAW9/ij4ONGgly2HLoAoTZJm/6oCVOg
 TdZZ1ksCaDI1O1r05ThdNONyB6RnRa+KB9lJ546CJMWQnL0tqmzeeuIZD0uR8lGL1IXg
 YGNCiv+0dWzEnG3CBswYYcT3JFhZPIxZXXbygPIamo7cpr8Io8OoFeIqHah3dLh0hoMn
 hH7vhY/Opl+Vjq7POaZXbFGFslBATuzH9Sj+cuUFvVYj8yMT+AmxrU8ORWjLgM3YFPEl
 42Ig==
X-Gm-Message-State: AOJu0YySmTzChppWdReRIORx7XRqIRQeI2vjfX0sMD+tmS8aR7ys4+Qu
 wm8vmVniqCHXtmakPCZ6s53dAw==
X-Google-Smtp-Source: AGHT+IE8pTnTm8kExFSHgwFwuE2r5IXOklMrkIbsOtRt5M7b3C9wUv/hea60CxUNlZq2FBxMZ8uDBQ==
X-Received: by 2002:a17:906:ee82:b0:9be:39a4:b440 with SMTP id
 wt2-20020a170906ee8200b009be39a4b440mr1971962ejb.76.1697819929604; 
 Fri, 20 Oct 2023 09:38:49 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 m2-20020a17090607c200b009c6a4a5ac80sm1776806ejc.169.2023.10.20.09.38.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 09:38:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH 16/19] cpus: Replace first_cpu by qemu_get_cpu(0,
 TYPE_TRICORE_CPU)
Date: Fri, 20 Oct 2023 18:36:38 +0200
Message-ID: <20231020163643.86105-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
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

Mechanical change using the following coccinelle script:

  @@ @@
  -   first_cpu
  +   qemu_get_cpu(0, TYPE_TRICORE_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/tricore/triboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/tricore/triboard.c b/hw/tricore/triboard.c
index 4dba0259cd..1fe6692f97 100644
--- a/hw/tricore/triboard.c
+++ b/hw/tricore/triboard.c
@@ -46,7 +46,7 @@ static void tricore_load_kernel(const char *kernel_filename)
         error_report("no kernel file '%s'", kernel_filename);
         exit(1);
     }
-    cpu = TRICORE_CPU(first_cpu);
+    cpu = TRICORE_CPU(qemu_get_cpu(0, TYPE_TRICORE_CPU));
     env = &cpu->env;
     env->PC = entry;
 }
-- 
2.41.0


