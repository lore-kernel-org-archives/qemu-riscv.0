Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1AFC3ABC0
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 May 2025 13:44:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uD1Xv-0000cW-NJ; Thu, 08 May 2025 09:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1Xu-0000VQ-Id
 for qemu-riscv@nongnu.org; Thu, 08 May 2025 09:44:18 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1Xs-0004ww-FQ
 for qemu-riscv@nongnu.org; Thu, 08 May 2025 09:44:18 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b074d908e56so613702a12.2
 for <qemu-riscv@nongnu.org>; Thu, 08 May 2025 06:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711855; x=1747316655; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gMLC32cD5rQa4ngqh9n69biVbtvyYihadQEH/qk7LQg=;
 b=dTWvQ8bjrLumrHb0Cg/sgd0tPT7FLfbCLx5UwPeoOKUxxcgM6Zg0hVNtW2fj61CmMh
 Pt4aMkvbBJ/DzW5apd3hv5W6yTmUe7bw+JTMutNIgXxTCyusKWjwR1u8L8zA48dJP7aH
 +IPK04VXLkQzBv5l50a/ue/CwL398lkL7EjEXgh8zQukJSwcylfbUld/42kpbzhgtmX4
 tZ3PHvyQTJWL4EFuHPfoVv8bWTowfb3ixt6QCLqHhZMKFr4WSXbWl5fCc7fXlidLlRXA
 jrGQNKfQUsmIgDeh9uvseMR+l6N1dzwQrlY8wxX6EDeuw7DSIDgCxpUxSfCTA9zQOBRa
 FnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711855; x=1747316655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gMLC32cD5rQa4ngqh9n69biVbtvyYihadQEH/qk7LQg=;
 b=AO0SR8wrKAai7tn4bfpzs1/AXDbNRxidItmB38FCsFEq3H8hYhSl8wPMQl2FQoB3tZ
 YKKK5EZ8VuuhEEwb2bE4l5P8q469vC2baE2Coxm90JI2NZY95fizij+6FMTotXmQSRZI
 36qBhKjp/59iexSdgd01Kz5Rcj5y8/vqQBfRrxMOv16tFjp8qsp5TK348kUmttaBDJeS
 r21XkKh/9OdFTRDZlTDUUj0ZWAFqrNuVybrCh1vkNfHwWI3nETC5haX7HzOldzuoIxSX
 y5A39Mlr9QT0ZvWGOYu7x+pXHIWps8H5//VU8Xjwmzkv8GzixU4+cDrQU3V0HpUcMLkB
 Ic4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZb6BdeDR75xuXJJUHtYjxMYW0y/34sBZm+3qIfeB32uH2cW4Zpb1JQ9ITcy+DOvDe4onLDKa7LuN/@nongnu.org
X-Gm-Message-State: AOJu0YxhXgxDPlIZiCxI2mQQnuFyF7Yyto8ys8z2M1GzZ0ivX3qg/fEa
 Ku850BhfeE/M8+iWCWMPLUyy0jE9FMIzBlAOrThtM5uiVxm/5C5gJc8hcS6+XPo=
X-Gm-Gg: ASbGncvOAXC9U8EoVaYKktrOY+iy2rz6nFipjuPYLtLlARWLJdT54IS/I17X7iQqccp
 QvbKsliuC4vkdpjuJdfnpwt0JkT0rL5QkxIVd4LUzIJ525rzFT3YpbHFZzy/K6G00n3XIHlIGUL
 301tbllh/o9iAM+pKue2TW7kPAve+4VQcGsPScjNYpGGmeI8zZSXnxtLC5cBOUy/6JKpH9Qw8jH
 a6fRex7vcekQplW54h4LhXa57DuMZ4iDAWQ6dA+aYf+qwDG1bjkO74CLGYgmpwE+LDlEFY/Mvbf
 dwESvT38oo80LQLw5sczY+wV5e3qJSIH6m+01xC8TBxXuqL44O6odmzRzdGRX7B6Rx/H1cyhq7N
 PN7TC81UzQle4ogU=
X-Google-Smtp-Source: AGHT+IHMW98LKLrBk/HrYfcCCVQ80r3nhlUHxeo5FoUvbXLo766SGUMibKHsMA0gfPKgCoMTxObdMg==
X-Received: by 2002:a05:6a21:6e41:b0:1f5:852a:dd81 with SMTP id
 adf61e73a8af0-2148d52bbe3mr13246245637.34.1746711854843; 
 Thu, 08 May 2025 06:44:14 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74058df2a6csm13272789b3a.81.2025.05.08.06.44.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:44:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: [PATCH v4 22/27] hw/core/machine: Remove hw_compat_2_7[] array
Date: Thu,  8 May 2025 15:35:45 +0200
Message-ID: <20250508133550.81391-23-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-pg1-x529.google.com
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

The hw_compat_2_7[] array was only used by the pc-q35-2.7 and
pc-i440fx-2.7 machines, which got removed. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
---
 include/hw/boards.h | 3 ---
 hw/core/machine.c   | 9 ---------
 2 files changed, 12 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index a881db8e7d6..77707c4376a 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -838,7 +838,4 @@ extern const size_t hw_compat_2_9_len;
 extern GlobalProperty hw_compat_2_8[];
 extern const size_t hw_compat_2_8_len;
 
-extern GlobalProperty hw_compat_2_7[];
-extern const size_t hw_compat_2_7_len;
-
 #endif
diff --git a/hw/core/machine.c b/hw/core/machine.c
index ce98820f277..bde19a2ff67 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -266,15 +266,6 @@ GlobalProperty hw_compat_2_8[] = {
 };
 const size_t hw_compat_2_8_len = G_N_ELEMENTS(hw_compat_2_8);
 
-GlobalProperty hw_compat_2_7[] = {
-    { "virtio-pci", "page-per-vq", "on" },
-    { "virtio-serial-device", "emergency-write", "off" },
-    { "ioapic", "version", "0x11" },
-    { "intel-iommu", "x-buggy-eim", "true" },
-    { "virtio-pci", "x-ignore-backend-features", "on" },
-};
-const size_t hw_compat_2_7_len = G_N_ELEMENTS(hw_compat_2_7);
-
 MachineState *current_machine;
 
 static char *machine_get_kernel(Object *obj, Error **errp)
-- 
2.47.1


