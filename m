Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CC4C3ABC0
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 May 2025 13:41:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uD1V6-000164-GZ; Thu, 08 May 2025 09:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1V3-0000zC-GY
 for qemu-riscv@nongnu.org; Thu, 08 May 2025 09:41:21 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1Uz-0004Yh-UC
 for qemu-riscv@nongnu.org; Thu, 08 May 2025 09:41:21 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b200178c011so404333a12.3
 for <qemu-riscv@nongnu.org>; Thu, 08 May 2025 06:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711676; x=1747316476; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GfnNMh8um2i71NVQR7Vo7AAo9gkZrP7mDUQkPEIxOEM=;
 b=HPKYNVL/Oo3D9bI81bb6wIyVbcgPC0g8Qdd4/aj+veIe0nnneDIBgm0zxzhNlEdmHF
 QhA+uAdq7HzTNb9kdyNWfPEYDIajoWakuUrrI6Q+28+Z0U+zxjMErE+MCzp9OuhEhS4r
 EvoCxDiW3iVND21Fnu2v/BDy1GHZz7g28CpcmdFgPSFuhDxReM62i1p1KA04Y839355y
 XAiCsW14q56WCviGKwrfgmsWQ4jfUPaCnxT4v9iNNuGqEp2jztLzOxkKHkmDhxjnbnqM
 NUWQo60rCgPvLyGzauGTNA0qjEhz2X9eG90YNAPotdwpuKbEixlS9i2XCf7qLOQMwlmU
 oYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711676; x=1747316476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GfnNMh8um2i71NVQR7Vo7AAo9gkZrP7mDUQkPEIxOEM=;
 b=YCVXF3CDcbfaNsSJecS9UPrq534K4EpyC7qzpyovYM/BBLcjoYulaaG7Iay1b+NPeO
 tXGmJ4g/kHAeQQa6di/fjZAK32j3MQUXjuMlJKd+yHetDpyDqGYdY/aEh7MykkRUdaWb
 zOhE/KGvBXqF490tdkC7YTbwCfiUxM7x6Q0tQBd5U+dzmVj6bLN4/E4y5Yic14voVVvs
 y1S/NuYyXDeUcSppzpksPuZ5SN+ZaGQNKCtnAqJa8Gn62ddUPTJEnVGRuYxq4qeowsVa
 5Jr0mPrNyxIV9uptXr2I9LcCZRs+eNABgKRmxOgwqlT0uyPLdfM/PF9vkigf0wKptx2H
 NMXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2CPX2bZJLnfBCdZpLRInEJu+tfZJXJXIZsVgZmOu2R6h+Afuahho/D3x+0wmCAe9BrvkQY4lbkxuX@nongnu.org
X-Gm-Message-State: AOJu0YxQ21BX+Bqgtyi2w9GEHaQP8Ki99eltPaE2Z8eZwZcHr5qp3Mzx
 E13eW1kcDknott3Rxv4CxwTTB5kBMRTH2Nc/o0aqYU3XR7JKaYTOeBRnvtmGPkE=
X-Gm-Gg: ASbGnctI3eAF067SxY+FHM5SPS45hnthCiVxwc30AiJi0intJwE8JX7ibxZ6aZUBR+L
 9zwZObxjEAc+7geHlD+G9HfnfBujsTx+/XvI2CQiL6FWYKCxowhwuzVLP6fRqog+Ce0PIUpNzS/
 hXR4qoriLgzdZ4vR4sWfd561oi6EnzwbLC3oUoaZ2dxCYx5aGdZkFQDQCMe8hdCkQBVhsBnu8um
 KHMNXmMN+nfEhrOrVbSzBKbWPurxQYBBXpyatGBW7k5iRbb15MLStZNpNukt2YdGle91riwdCM4
 9+VNb6z0y1iYprCZLitLYPeGMRJuFDfd1pkJ6khYJqfiOCOmAUteXqsSujMHPMjEk83FaqssY+l
 nE5JcSsHfHppTFlY=
X-Google-Smtp-Source: AGHT+IFQ8LW9RTSMx316iiBnCrKC++OfGZqWRTBj59NXdQh9cJmdJ08Q8za3gukxznk5+tstJeDxpA==
X-Received: by 2002:a17:90b:278e:b0:2fa:1a23:c01d with SMTP id
 98e67ed59e1d1-30aac1b407amr10664017a91.21.1746711675615; 
 Thu, 08 May 2025 06:41:15 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30ad4d56981sm2115127a91.28.2025.05.08.06.41.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:41:15 -0700 (PDT)
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
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 14/27] hw/intc/apic: Remove
 APICCommonState::legacy_instance_id field
Date: Thu,  8 May 2025 15:35:37 +0200
Message-ID: <20250508133550.81391-15-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-pg1-x534.google.com
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

The APICCommonState::legacy_instance_id boolean was only set
in the pc_compat_2_6[] array, via the 'legacy-instance-id=on'
property. We removed all machines using that array, lets remove
that property, simplifying apic_common_realize().

Because instance_id is initialized as initial_apic_id, we can
not register vmstate_apic_common directly via dc->vmsd.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/i386/apic_internal.h | 1 -
 hw/intc/apic_common.c           | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/include/hw/i386/apic_internal.h b/include/hw/i386/apic_internal.h
index 429278da618..db6a9101530 100644
--- a/include/hw/i386/apic_internal.h
+++ b/include/hw/i386/apic_internal.h
@@ -188,7 +188,6 @@ struct APICCommonState {
     uint32_t vapic_control;
     DeviceState *vapic;
     hwaddr vapic_paddr; /* note: persistence via kvmvapic */
-    bool legacy_instance_id;
     uint32_t extended_log_dest;
 };
 
diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 37a7a7019d3..1d259b97e63 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -294,9 +294,6 @@ static void apic_common_realize(DeviceState *dev, Error **errp)
         info->enable_tpr_reporting(s, true);
     }
 
-    if (s->legacy_instance_id) {
-        instance_id = VMSTATE_INSTANCE_ID_ANY;
-    }
     vmstate_register_with_alias_id(NULL, instance_id, &vmstate_apic_common,
                                    s, -1, 0, NULL);
 
@@ -412,8 +409,6 @@ static const Property apic_properties_common[] = {
     DEFINE_PROP_UINT8("version", APICCommonState, version, 0x14),
     DEFINE_PROP_BIT("vapic", APICCommonState, vapic_control, VAPIC_ENABLE_BIT,
                     true),
-    DEFINE_PROP_BOOL("legacy-instance-id", APICCommonState, legacy_instance_id,
-                     false),
 };
 
 static void apic_common_get_id(Object *obj, Visitor *v, const char *name,
-- 
2.47.1


