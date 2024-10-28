Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5AAD339AF
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 18:22:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t5UMQ-0000Zq-0w; Mon, 28 Oct 2024 14:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t5UMG-0000Vg-IQ
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2024 14:20:52 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t5UME-0003cN-Sn
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2024 14:20:52 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-20c803787abso36679215ad.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Oct 2024 11:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1730139649; x=1730744449; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6z6DcRjVJWOSMzlRK4IW4vk/uBL6nDh9i3CjYrjeC0=;
 b=DVeFrG3Tcx/cUZ2K2EFwql9COxjcBQvpbRoFtGX5UhZMFdqHCg19ROX+YYJwMMgsya
 z93mflaHJOq23N/yow25ZsH5/zgNP2gOqltNnvxYFmUy2BF8j49ctsl8+aqe1t2fHdgw
 RPNt3kyFOVYxtdqHmIGcxxmZogPUOIr9ObqyGQz8llEH43PK3BipvCSl4HfsziPYUSi8
 pBGkNkc3+HftVtbP6KBXDJCVm5AIT2EGIlfpYMljCpipGxZgO6lqDyXe1qfYiiMB0oQJ
 IC4A+DUmGg24nDMZrXx7srKn0QNREVpnksmt+iGnTZjwVfY230Z17s1yMPfMVHyqxGry
 YtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730139649; x=1730744449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i6z6DcRjVJWOSMzlRK4IW4vk/uBL6nDh9i3CjYrjeC0=;
 b=M/aZD+sbK4HHcSowfwEcdeK65sEcjnXpgM5Zrgv1yiUUOqlWMU9z6w+MYPvWCWrV4c
 NH5JdETobtTy/bKBF1/ESvGGXdAiCzNkJtkTyO4CJuTpwX8lwzPdysTe+mqgws4ndEKN
 FIJb8aUFPVCgh/J617SNuP4SzFMa3MFSL0uLYR+OoMpUP9//oVZGkne9/luOji0nBoY4
 GoMPfQxOByN0Ls8KXdJ9JUrQHaOXSRbUxWpYaTOYMglUUjDjjP49zsWpckjHvqWTW5mr
 fWTlpIgiPxGgFEZ+h0DBDTGLDt1gSWTcJVxafLSHGxOKdhJDDs7dvneBXW+PRVm6/vaN
 OI6A==
X-Gm-Message-State: AOJu0YzLFpi05m0/I9hj0H3SGP8RFkWcgX3GO2f1qClT0p36aUOYpSTF
 lrH5MS/Uo2i+8UvTldXQ99J9A5aV4VfoK92dNuVX4SeUWMpX0amRYFoM+2uAgZA=
X-Google-Smtp-Source: AGHT+IGsGMCZum3jRv5h4vlecPmDxM+iPbO5ZodIqejCaKpmel0YdmnDMMi3HgLEViNtEqjtMOtxNQ==
X-Received: by 2002:a17:902:db07:b0:20b:6c1e:1e13 with SMTP id
 d9443c01a7336-210e902a3f2mr7089495ad.23.1730139649453; 
 Mon, 28 Oct 2024 11:20:49 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.8.109.222])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bbf471fesm53637505ad.51.2024.10.28.11.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 11:20:49 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 2/2] target/riscv/kvm: clarify how 'riscv-aia' default works
Date: Mon, 28 Oct 2024 15:20:37 -0300
Message-ID: <20241028182037.290171-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241028182037.290171-1-dbarboza@ventanamicro.com>
References: <20241028182037.290171-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x635.google.com
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

We do not have control in the default 'riscv-aia' default value. We can
try to set it to a specific value, in this case 'auto', but there's no
guarantee that the host will accept it.

Couple with this we're always doing a 'qemu_log' to inform whether we're
ended up using the host default or if we managed to set the AIA mode to
the QEMU default we wanted to set.

Change the 'riscv-aia' description to better reflect how the option
works, and remove the two informative 'qemu_log' that are now unneeded:
if no message shows, riscv-aia was set to the default or uset-set value.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm/kvm-cpu.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index acc713c56a..cbda4596da 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1676,9 +1676,9 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
     object_class_property_add_str(oc, "riscv-aia", riscv_get_kvm_aia,
                                   riscv_set_kvm_aia);
     object_class_property_set_description(oc, "riscv-aia",
-                                          "Set KVM AIA mode. Valid values are "
-                                          "emul, hwaccel, and auto. Default "
-                                          "is auto.");
+        "Set KVM AIA mode. Valid values are 'emul', 'hwaccel' and 'auto'. "
+        "Changing KVM AIA modes relies on host support. Defaults to 'auto' "
+        "if the host supports it");
     object_property_set_default_str(object_class_property_find(oc, "riscv-aia"),
                                     "auto");
 }
@@ -1712,10 +1712,7 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
         exit(1);
     }
 
-    if (default_aia_mode == aia_mode) {
-        qemu_log("KVM AIA: using default host mode '%s'\n",
-                  kvm_aia_mode_str(default_aia_mode));
-    } else {
+    if (default_aia_mode != aia_mode) {
         ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
                                 KVM_DEV_RISCV_AIA_CONFIG_MODE,
                                 &aia_mode, true, NULL);
@@ -1727,9 +1724,6 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
 
             /* failed to change AIA mode, use default */
             aia_mode = default_aia_mode;
-        } else {
-            qemu_log("KVM AIA: setting current mode to %s\n",
-                     kvm_aia_mode_str(aia_mode));
         }
     }
 
-- 
2.45.2


