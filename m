Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BC9C3ABCB
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 May 2025 15:24:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uEV1L-0005D9-D0; Mon, 12 May 2025 11:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEV1I-000590-L8
 for qemu-riscv@nongnu.org; Mon, 12 May 2025 11:24:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEV1H-0005UO-3P
 for qemu-riscv@nongnu.org; Mon, 12 May 2025 11:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747063482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0uPxPAlbokCBFELfvxkftEEGEGO3nEqu1EeO7daiHGU=;
 b=Z+mOpSMJKTMJimYuvq5k9a6shYdc6nwNxO47ZaK3pZ/VCeLOGSRMpizQdUVhcnwpB4+VbA
 CpG/gODayZ7gCaY6lqVwpA2CjikN8mUWDhm086NFHeCklVnKBGXtAq/Fbg8pRVlFk7Y3jW
 hUAqQuat/eT8/7yAsMQs0ZVzpIMnYCU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-9JqjE1aUO2WX4toxwWxetA-1; Mon, 12 May 2025 11:24:40 -0400
X-MC-Unique: 9JqjE1aUO2WX4toxwWxetA-1
X-Mimecast-MFC-AGG-ID: 9JqjE1aUO2WX4toxwWxetA_1747063479
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43ce8f82e66so23752585e9.3
 for <qemu-riscv@nongnu.org>; Mon, 12 May 2025 08:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747063479; x=1747668279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0uPxPAlbokCBFELfvxkftEEGEGO3nEqu1EeO7daiHGU=;
 b=qT1C7ksR6bMVG8Q7Cb40JsPZcsya/nGlviMY1kx5WGBwCweFFnFOBvLzq0FTsD5wQ4
 7YYncNOstusRZRTMJC2i4tqxmUn/sx6oYaRbc3cDKwZZEPrzrUhadm+9DCplPpEgAlDW
 FcMIFPK9k06SfYHM2Er+HSQMp4cP1aB7XXnS8V0QdZChP8Tcqolc67WwkSisnSK3UpjX
 dJBrR2RGFcFRCYhuDYdlOy7M3HMP2WddfeOpEa34MU0URPMHre8R6DWigCEuO4TQlv1x
 jLENzkSJfGRyZeuZDotVYzHZ/2Nm+bindE0BYKsJ4kuwSMrHLpftKV4g/IZhqqpam63F
 mgVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWLqxves2EjFMqWp87znxo5FScHoplCsYw1zqTxwCdxOai6zc0U8XhUgImQ9xJSRbWA788LR2GoNBJ@nongnu.org
X-Gm-Message-State: AOJu0YzbBk3egWXgGA86N5b95RC2valX7nW7XKCdGcnMQGG9XFLGR2me
 OFSUsb59rsFPBLE7HYTKnuQbjZsvj8Dxbjjbk793J6PsXEtl20nHT67BBLTCIB8n1AomYJrouRO
 QFjsBbQUbAe+F51A5E9Vuh1ewEFSDP2g1tuXk8rK2gLgvFtZcNChs
X-Gm-Gg: ASbGncvObndvXpzWZ3X8C5W5DM6dWv9k+HUa6ACqWtfHTKT5tuQvpYSYpvGeE+y6xSX
 hmGTww6OBvjhXrYPdndfuNnC7bXn7oFZ3+HmUEO0teALxsRzz8CaJdZo2L/zyPm4UlktynZSj52
 0i2PudOm987iA76WcVsKoqJ8KMPW5kFiZvyh9OyqtXe9f1wZgogcIC6HZo5Zd8aMEgfb8ZSP9uB
 b3jGUJA2SaiEV9Vq/LNjybTYfy+AGFZSfKFbPyH3PzZJ49uQd5/w0Q7N9RP87qNarVj7LpdP1zh
 mlNTnPk3hcT5cVqcApwD0g+gVSVleViL
X-Received: by 2002:a05:6000:1868:b0:3a0:b392:c2f with SMTP id
 ffacd0b85a97d-3a1f648782cmr10140814f8f.44.1747063479034; 
 Mon, 12 May 2025 08:24:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRwsDfeYtYF+7qmQcCxF1BK6h492q4dwhfvDuSeqqhilSyAsRupcamC17OhxBDNUZGCm4Q8g==
X-Received: by 2002:a05:6000:1868:b0:3a0:b392:c2f with SMTP id
 ffacd0b85a97d-3a1f648782cmr10140783f8f.44.1747063478678; 
 Mon, 12 May 2025 08:24:38 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3aeb26sm173676635e9.29.2025.05.12.08.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 08:24:38 -0700 (PDT)
Date: Mon, 12 May 2025 17:24:35 +0200
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
 Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 13/27] target/i386/cpu: Remove
 CPUX86State::fill_mtrr_mask field
Message-ID: <20250512172435.6ad4cbbc@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-14-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-14-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oSklDgGJF_YHCm3eAT74hqpZSfM2RdxaqevPi-nCV9Y_1747063479
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.551,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu,  8 May 2025 15:35:36 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> The CPUX86State::fill_mtrr_mask boolean was only disabled
> for the pc-q35-2.6 and pc-i440fx-2.6 machines, which got
> removed. Being now always %true, we can remove it and simplify
> kvm_get_msrs().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/i386/cpu.h     |  3 ---
>  target/i386/cpu.c     |  1 -
>  target/i386/kvm/kvm.c | 10 +++-------
>  3 files changed, 3 insertions(+), 11 deletions(-)
>=20
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 06817a31cf9..7585407da54 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -2253,9 +2253,6 @@ struct ArchCPU {
>      /* Enable auto level-increase for Intel Processor Trace leave */
>      bool intel_pt_auto_level;
> =20
> -    /* if true fill the top bits of the MTRR_PHYSMASKn variable range */
> -    bool fill_mtrr_mask;
> -
>      /* if true override the phys_bits value with a value read from the h=
ost */
>      bool host_phys_bits;
> =20
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6fe37f71b1e..fb505d13122 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -8810,7 +8810,6 @@ static const Property x86_cpu_properties[] =3D {
>      DEFINE_PROP_UINT32("guest-phys-bits", X86CPU, guest_phys_bits, -1),
>      DEFINE_PROP_BOOL("host-phys-bits", X86CPU, host_phys_bits, false),
>      DEFINE_PROP_UINT8("host-phys-bits-limit", X86CPU, host_phys_bits_lim=
it, 0),
> -    DEFINE_PROP_BOOL("fill-mtrr-mask", X86CPU, fill_mtrr_mask, true),

same as previous patch, deprecate 1st then remove

>      DEFINE_PROP_UINT32("level-func7", X86CPU, env.cpuid_level_func7,
>                         UINT32_MAX),
>      DEFINE_PROP_UINT32("level", X86CPU, env.cpuid_level, UINT32_MAX),
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index c9a3c02e3e3..87edce99e85 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -4635,13 +4635,9 @@ static int kvm_get_msrs(X86CPU *cpu)
>       * we're migrating to.
>       */
> =20
> -    if (cpu->fill_mtrr_mask) {
> -        QEMU_BUILD_BUG_ON(TARGET_PHYS_ADDR_SPACE_BITS > 52);
> -        assert(cpu->phys_bits <=3D TARGET_PHYS_ADDR_SPACE_BITS);
> -        mtrr_top_bits =3D MAKE_64BIT_MASK(cpu->phys_bits, 52 - cpu->phys=
_bits);
> -    } else {
> -        mtrr_top_bits =3D 0;
> -    }
> +    QEMU_BUILD_BUG_ON(TARGET_PHYS_ADDR_SPACE_BITS > 52);
> +    assert(cpu->phys_bits <=3D TARGET_PHYS_ADDR_SPACE_BITS);
> +    mtrr_top_bits =3D MAKE_64BIT_MASK(cpu->phys_bits, 52 - cpu->phys_bit=
s);
> =20
>      for (i =3D 0; i < ret; i++) {
>          uint32_t index =3D msrs[i].index;


