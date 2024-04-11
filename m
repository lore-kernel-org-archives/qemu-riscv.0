Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DDBCD1292
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 10:46:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ruruw-0003Nw-1j; Thu, 11 Apr 2024 06:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurut-0003M3-Rx
 for qemu-riscv@nongnu.org; Thu, 11 Apr 2024 06:44:27 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurus-0004Nn-8P
 for qemu-riscv@nongnu.org; Thu, 11 Apr 2024 06:44:27 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-343f1957ffcso449743f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Apr 2024 03:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712832265; x=1713437065; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xiqqVJM+uSsQysg2/XmJ/Md8TLOTVsfYAw0sKCriLiE=;
 b=GZeFCtW9AOmnpwAxKfWv9ISvHo97cnyH/2SgCnGbG8O41ShKUf87tOeZFwkDYtNGwF
 a6/z6Pp8NPeWLcsXQm1nmM3Onw58KbDYigvUXot1c8FDcroYsGvgEWBpK8IM4Cc7lFAG
 iRvGJIjBdjA5zm0WnTHqUawBCvZCh+vLhC5dsO974tlMfnYXOBWlB6fVN9yjsbV0Qgvt
 m47JjFs6OYT1ic7MO+RiQa2EQvt1xwb9X419iK9mwSGJNW53SJT3PuCaIzqkYQf2PjNL
 Hz5aQQPQZh8BACQwP+bXUpYitcYFZ3sbWWBoFm+To7w9/La2P9o7fAEih4fqh+XDnYun
 FIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712832265; x=1713437065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xiqqVJM+uSsQysg2/XmJ/Md8TLOTVsfYAw0sKCriLiE=;
 b=H6OZe/Im0c6uEJH9I3b4uRPn2f7jHBhWMv+TRWYFV0YhkhUIgHUTeHuWWmEWfvAUX3
 XWMt2lS/DTtgale7jGm5p//y3clZLrIJhaAKVujO+6fmAP8mYQ/y2GkzYDnAFQDrZ1Hy
 +nK4VmjH88TLed4EXAj+ZFYQxCSF7YYRzg/4TlBMN8MfRD/n+X3p4dr5C86j8eb9FPAb
 ewST/FYm5mn8+OJD8aCyHA57iZIppYLB98R6J1zCGP6hXqqczwL2swykh79LLp3PTmAe
 jOSKL0i+hOMXDezzr0wxOWJKfolpGm5krj2tC9vKla4c5RABBDWu1nHEPV9A9lKmO09q
 P8qA==
X-Gm-Message-State: AOJu0YyigFMh/cs88m9JUlZr7kIw0925BGmxy5iOoT6VCjUXvj7W3nwY
 FoA8pvXrQ2QCn5+LCDTMlrGN4ejRjG0ivmMQh+GQ8zX7nzmLJUBD2yMqSS4NbpQ=
X-Google-Smtp-Source: AGHT+IH5WdsUCy2YrTa1nAFk+W2+biINtYu7zSxeIY94sdIWWeUx9VCNP2h+PHW444Y+DBkdVr0M3g==
X-Received: by 2002:a5d:46c4:0:b0:343:44cd:7d1e with SMTP id
 g4-20020a5d46c4000000b0034344cd7d1emr2084780wrs.17.1712832264913; 
 Thu, 11 Apr 2024 03:44:24 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a5d6245000000b0034334af2957sm1470365wrv.37.2024.04.11.03.44.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:44:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 7/9] hw/riscv/virt: Replace sprintf() by snprintf()
Date: Thu, 11 Apr 2024 12:43:38 +0200
Message-ID: <20240411104340.6617-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411104340.6617-1-philmd@linaro.org>
References: <20240411104340.6617-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience. Use snprintf() instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d171e74f7b..b3fede1207 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1619,7 +1619,7 @@ static char *virt_get_aia_guests(Object *obj, Error **errp)
     RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
     char val[32];
 
-    sprintf(val, "%d", s->aia_guests);
+    snprintf(val, sizeof(val), "%d", s->aia_guests);
     return g_strdup(val);
 }
 
@@ -1785,7 +1785,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_str(oc, "aia-guests",
                                   virt_get_aia_guests,
                                   virt_set_aia_guests);
-    sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid value "
+    snprintf(str, sizeof(str),
+                 "Set number of guest MMIO pages for AIA IMSIC. Valid value "
                  "should be between 0 and %d.", VIRT_IRQCHIP_MAX_GUESTS);
     object_class_property_set_description(oc, "aia-guests", str);
     object_class_property_add(oc, "acpi", "OnOffAuto",
-- 
2.41.0


