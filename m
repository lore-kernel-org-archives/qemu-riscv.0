Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A35ECDB474
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:41:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtsWq-0007OZ-Dn; Fri, 20 Oct 2023 12:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsWi-0006WR-Nx
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:39:10 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsWh-0002tr-0T
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:39:08 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9b9faf05f51so155443666b.2
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 09:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697819943; x=1698424743; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DwpnvxLwaI95t3fo0bAhEO0dcxZPMEfx1RWmGk2WvB8=;
 b=Xr29MCCKrphnTBEUOCv1rm9Zx2q9loF4d4rUJqbYKPPd+OxCN01x5rMFb5T+ygKQEj
 BUUaHkZ+Dk+YkbT0bfX8IjuYImBemIvNq7OyMHSG7lkFyzr44VIu8a1og/b4uQPOtsJw
 8KeyaWpemNkS5FWfVSbTj92MyyH3FLg6zGz8Uzu4+lTwvg/8eu59vGS4Y9xBS4Rx17ky
 AkIepag9lUxTi5utxKt5EEu/hdxdfUVpE4z+RhGWRlti6af4KwMSyyOfntXK2t7Yn3/D
 Se9n83NF/CzaxhHDUTAf3so8Eza2LnmXM7OUKJ7vIOnd8YYCz7VFDFd+HHAhgC6cVkRB
 rXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697819943; x=1698424743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DwpnvxLwaI95t3fo0bAhEO0dcxZPMEfx1RWmGk2WvB8=;
 b=suyEu50aDqlzsDxWcEAyZYcuzAL0ClJJPrzKOUvFefH4QjqKRtVYClzDl8yZiSW7N+
 KGeKA2wDUDluditvyRXWov3XG0G81YBiqmceRXja8jiYnP0pC4g4LwgR9cVr9ZNTW6fO
 OgYmQ+YBJ1iv80qc+vgM8JYaF8UlhBExTRTnDbKmwDYpjETM+wjU0VaArLaIASeO5mi2
 FzSKpqNBW8Gf/OoHbKS9cYVGafqfBJ+rSIpT9rCi9IQFDNISckWsKdFQ12aELTA4ES0i
 Draa292NPtOobB5a+JSvoXI1lPAiFwjwlOgyfQZfwH5MnD+bucQYzmgSI2a5Lx8Tdwoo
 7KIg==
X-Gm-Message-State: AOJu0Ywcsh3nX4YCkPkxXujHwxzeCe+Lyix8xNHUjI7D7reyHWSy6k2A
 2KAVBPqE1hmaa50hpWtou9aVcg==
X-Google-Smtp-Source: AGHT+IExBZusHKFknVzBT00DgnJ+sQMCFL/rUyxfIHrHrCZVWnyLQwtly/bAYRyP1CNICc3Jx8Qc4w==
X-Received: by 2002:a17:907:80e:b0:9b2:aa2f:ab69 with SMTP id
 wv14-20020a170907080e00b009b2aa2fab69mr1819995ejb.30.1697819943414; 
 Fri, 20 Oct 2023 09:39:03 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 16-20020a170906019000b009b2c9476726sm1819672ejb.21.2023.10.20.09.39.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 09:39:03 -0700 (PDT)
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
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH 18/19] cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_RX_CPU)
Date: Fri, 20 Oct 2023 18:36:40 +0200
Message-ID: <20231020163643.86105-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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
  +   qemu_get_cpu(0, TYPE_RX_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/rx/rx-gdbsim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 47c17026c7..091f83cc60 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -126,7 +126,7 @@ static void rx_gdbsim_init(MachineState *machine)
          * the latter half of the SDRAM space.
          */
         kernel_offset = machine->ram_size / 2;
-        rx_load_image(RX_CPU(first_cpu), kernel_filename,
+        rx_load_image(RX_CPU(qemu_get_cpu(0, TYPE_RX_CPU)), kernel_filename,
                       SDRAM_BASE + kernel_offset, kernel_offset);
         if (dtb_filename) {
             ram_addr_t dtb_offset;
@@ -152,7 +152,7 @@ static void rx_gdbsim_init(MachineState *machine)
             qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                                 rom_ptr(SDRAM_BASE + dtb_offset, dtb_size));
             /* Set dtb address to R1 */
-            RX_CPU(first_cpu)->env.regs[1] = SDRAM_BASE + dtb_offset;
+            RX_CPU(qemu_get_cpu(0, TYPE_RX_CPU))->env.regs[1] = SDRAM_BASE + dtb_offset;
         }
     }
 }
-- 
2.41.0


