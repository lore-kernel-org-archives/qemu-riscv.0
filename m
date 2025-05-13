Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4FCC3ABC9
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 May 2025 09:16:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uElkP-0005tU-9z; Tue, 13 May 2025 05:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uElkN-0005t5-Jk
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 05:16:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uElkL-0002IZ-JW
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 05:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747127779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v31MioDOVgoqh4rKpjITKNEs7rYnhOhzHg49WrhLJCA=;
 b=HglpLuPaXetyo/6DwsLr3wZXSCA4Ce3+gtEG9ADeHyq80vZXisBZoZ3Hq2OO6vvaQm7qNW
 aebRtKEkytIEIYM7v2pFKCPKDeuAMqr9iZFDp/IBzX7wgw3FyYgdCV+SPvCODHLoXcMDFS
 PAU3gFMFmnXjuUSpwMUqoLar+yPBx8I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-Rwzk46QsPJyObl2eZO4hvA-1; Tue, 13 May 2025 05:16:17 -0400
X-MC-Unique: Rwzk46QsPJyObl2eZO4hvA-1
X-Mimecast-MFC-AGG-ID: Rwzk46QsPJyObl2eZO4hvA_1747127777
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43ea256f039so39710775e9.0
 for <qemu-riscv@nongnu.org>; Tue, 13 May 2025 02:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747127777; x=1747732577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HlADszS+Jp7Q3TGl9uZ1eHzM09x0nyHrIGrUpdW9aBo=;
 b=TH03vI0TIpoh5gfbPvD0euHJhjuY1mI9eyHvrYaiTZHURtqSQoqDEpOVSMylCou1Xc
 EI2kxnI2K0CJo1sYzHxSjrqdOvzDWpatMO8PzUyekxM0/uRgh0E0Y0uGPt6jzZ9kAN3z
 swbhhsa7vHvA6pAq6CAcoZfyMhfb5eZC97hhcubNnnQDZYJgsEFlqP5nggS/wQYJnNbt
 FlEijXdmiGwo09+ZQ8sKW+l6u1RVXQuF8rQqIHu54DmA0xqSgujHb9LnQdbyl50s05hl
 VAjo3HTXP75LzaYfzQwzlJIWaDNlIDstjW7rP97vttrjzhP4ptftRTP+eHIBGhr0HmdF
 C02A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBeymImpApdSAYkvXee1kOY6BRA/Y+fLeW83+G89qLZ6/w4a/qQOpMNhfZP93Gf+0+b4Q9IX+3CzLs@nongnu.org
X-Gm-Message-State: AOJu0YyKMr7MZWhcmaZR1bP+L6ZjxNJuX/cYXEPMIQrsDD+4JkcwRx/Q
 bzFwTitBUsgOReCtlp7FM0HnXFvTQUm+mbmGrpOmPV5C8tcMr/fcl5OC+2K6Ji4CLWQH74TLM+K
 5piOwXYWn8w5WcmTzJ+LbmuUyrCmDQX71pLdo8bnbyDG+2sQH1ORt
X-Gm-Gg: ASbGncv18mLqavl+IEAD5jYnwJl8qQuXXZqueNwzGmxXrcfjY59T6urquJLI3Z6zQAY
 YZBAfRu0k1PJv7uMWvgpp+HYlCXk9toe+Xfjm8HEvPvylq/Yd7ZnxDiat1gwfKik0HI+6PzOzKt
 bvVS2trhEGB8hc51ch87qFes5WZpt6EoGyifUKRautbud5jEbCtPX4ehsHUrdtc2h+hzAXrpTwy
 8pHikphCBAo1Yqi6mJSIuh2ICdrjkzj0yxhpOg5VZTqa/zeps4wUbW7xh69ZBQLIUYyLjjqz1In
 hXj4/WUbR/wE+SSayiFkjARECsZTYBzd
X-Received: by 2002:a05:600c:6308:b0:43c:fe15:41c9 with SMTP id
 5b1f17b1804b1-442d6d3e6d9mr160272765e9.9.1747127776783; 
 Tue, 13 May 2025 02:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1T/5gFVuk4ijjzA9YbA5QxEtUdD+KlrGtP96PmXtcNzFC1cX7Zq93bTxtyhDRAIbOqgjkbg==
X-Received: by 2002:a05:600c:6308:b0:43c:fe15:41c9 with SMTP id
 5b1f17b1804b1-442d6d3e6d9mr160272145e9.9.1747127776344; 
 Tue, 13 May 2025 02:16:16 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f2f65sm15734373f8f.55.2025.05.13.02.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 02:16:15 -0700 (PDT)
Date: Tue, 13 May 2025 11:16:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent
 Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu
 <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, Zhao Liu
 <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>, Helge Deller
 <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, Jason
 Wang <jasowang@redhat.com>, Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: Re: [PATCH v4 23/27] hw/i386/intel_iommu: Remove
 IntelIOMMUState::buggy_eim field
Message-ID: <20250513111614.31479c42@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-24-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-24-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k4pckiIiH1toPUeC-JaRGk99BHgiPe5EsMVHDO483bU_1747127777
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.551,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu,  8 May 2025 15:35:46 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> The IntelIOMMUState::buggy_eim boolean was only set in
> the hw_compat_2_7[] array, via the 'x-buggy-eim=3Dtrue'
> property. We removed all machines using that array, lets
> remove that property, simplifying vtd_decide_config().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/i386/intel_iommu.h | 1 -
>  hw/i386/intel_iommu.c         | 5 ++---
>  2 files changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.=
h
> index e95477e8554..29304329d05 100644
> --- a/include/hw/i386/intel_iommu.h
> +++ b/include/hw/i386/intel_iommu.h
> @@ -303,7 +303,6 @@ struct IntelIOMMUState {
>      uint32_t intr_size;             /* Number of IR table entries */
>      bool intr_eime;                 /* Extended interrupt mode enabled *=
/
>      OnOffAuto intr_eim;             /* Toggle for EIM cabability */
> -    bool buggy_eim;                 /* Force buggy EIM unless eim=3Doff =
*/
>      uint8_t aw_bits;                /* Host/IOVA address width (in bits)=
 */
>      bool dma_drain;                 /* Whether DMA r/w draining enabled =
*/
>      bool dma_translation;           /* Whether DMA translation supported=
 */
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 5f8ed1243d1..c980cecb4ee 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3823,7 +3823,6 @@ static const Property vtd_properties[] =3D {
>      DEFINE_PROP_UINT32("version", IntelIOMMUState, version, 0),
>      DEFINE_PROP_ON_OFF_AUTO("eim", IntelIOMMUState, intr_eim,
>                              ON_OFF_AUTO_AUTO),
> -    DEFINE_PROP_BOOL("x-buggy-eim", IntelIOMMUState, buggy_eim, false),
>      DEFINE_PROP_UINT8("aw-bits", IntelIOMMUState, aw_bits,
>                        VTD_HOST_ADDRESS_WIDTH),
>      DEFINE_PROP_BOOL("caching-mode", IntelIOMMUState, caching_mode, FALS=
E),
> @@ -4731,11 +4730,11 @@ static bool vtd_decide_config(IntelIOMMUState *s,=
 Error **errp)
>      }
> =20
>      if (s->intr_eim =3D=3D ON_OFF_AUTO_AUTO) {
> -        s->intr_eim =3D (kvm_irqchip_in_kernel() || s->buggy_eim)
> +        s->intr_eim =3D kvm_irqchip_in_kernel()
>                        && x86_iommu_ir_supported(x86_iommu) ?
>                                                ON_OFF_AUTO_ON : ON_OFF_AU=
TO_OFF;
>      }
> -    if (s->intr_eim =3D=3D ON_OFF_AUTO_ON && !s->buggy_eim) {
> +    if (s->intr_eim =3D=3D ON_OFF_AUTO_ON) {
>          if (kvm_irqchip_is_split() && !kvm_enable_x2apic()) {
>              error_setg(errp, "eim=3Don requires support on the KVM side"
>                               "(X2APIC_API, first shipped in v4.7)");


