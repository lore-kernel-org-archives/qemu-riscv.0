Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0F7C3ABC3
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 May 2025 08:35:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uEl5f-0005lW-Il; Tue, 13 May 2025 04:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEl5e-0005kd-2z
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 04:34:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEl5Y-0006Ru-NE
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 04:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747125250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUbDN78C5XcQ+ozLC+VQkgoe8ULuV9PE9shA9n7isr8=;
 b=H9tqpLtopv8IArJZdjD9OVngzyW8+ovodZpEybeAJMn3valxJcJf/k46q79H0XQI/uNNNg
 254S+3kgOVii9grYUE+nUS4oU077z7jYrC7EcG4zt0hPAZcuI8uHcYpcJBggzTZh+fnjST
 Ip5GGE9g71B594cTbBJZAlQxCnkDlaU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-MvkBfB2cN5a767_wrTOh8Q-1; Tue, 13 May 2025 04:34:09 -0400
X-MC-Unique: MvkBfB2cN5a767_wrTOh8Q-1
X-Mimecast-MFC-AGG-ID: MvkBfB2cN5a767_wrTOh8Q_1747125248
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43eea5a5d80so30301925e9.1
 for <qemu-riscv@nongnu.org>; Tue, 13 May 2025 01:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747125248; x=1747730048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4VUUz/K3vD5ynFqMRnkFNAMs82oWIMcdZAYYGqNsb/s=;
 b=jkymyzZkLQbhvItOam2U3/IqUC0G/RwAgdRKw/rPsqvZp0d8TqNw17Pk+Sj6S8VofR
 OiqblI3OZXwJ6IwLRL8BvlGEjHFxfo8nOT03/8CtyUr2qUVNzO5xtEsQdbH3Wdg433P0
 NQCfVzKBhDyD1NDX83OwfCWcYv6mGNomn6Dq9We2xBdgMmhqykMFjrwqvoMdZuGiZZ59
 /sWSu1OfPWBWZTNfgB7SRSbzX1YzIohOT790DihPGRP7JwlAuOzgwOEe5htczWO2n0Pm
 C5pkbaoDEhSgbCh3GU6CuCyw/v8yQ874X5tUHP6ir6tGjJwDZza1suyjbLnulYTew9UU
 MuKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0cV+jHDxKdTQ14BV93ocNXIBtZedAsvKkr84Erb9MMe4rtc6vdT3i4bE255oeIOdOvWeW0hlGBS/7@nongnu.org
X-Gm-Message-State: AOJu0YxnxSPMyotY/CNVK6K2ONxSMl6DhoTUr+y5nasi+bl5klRPMTs3
 X4W8kvL/wIH2z72FAx1OhDSWIJUB7oYDG7qN9HNyVHIYxUlaMbpO4nTyS/Sbd7YG9Bv4Cm3DVo/
 KXmMfz5W/6yACfRMshZZbtqpXlLIbusRlQe4NC0weVn46kcprjIVK
X-Gm-Gg: ASbGnctxHuJ9lHTGFOUs5XwelzjKicMyq2pmFCc+0K3T4SHAxt/g4Q0ldMLA7hHhRn/
 uDVDXT8q/juMRhtHk6JNui3Fm6gfzFtt0eaUy8xBCUqbs/VBOeBpCKXH6JlQKG5cxzpTmrkOlIJ
 W19FZ/7lPYi7VbJQFuW1p18Wb2eBlBo6hmDoMNTGhvWBeE33AFwh/hgZasO7V83nPfKAs3OvoBW
 lpEPPMbJ8jiLhyn4Fg7pSsf1BJLoP0n9773EwQMnNOmEywC3RooOoHhY7oDpgATLUsO6aMlagtH
 n/m2263D6dpkMunBsB2KDPt0CBO1Rdi4
X-Received: by 2002:a05:600c:628c:b0:43c:f689:dd with SMTP id
 5b1f17b1804b1-442d6d71df0mr146869885e9.19.1747125248010; 
 Tue, 13 May 2025 01:34:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSlfEs20rOFjqqrW5vXRv0rjvijsDxbmGSr2wixU5yagOHT15C4yLbypPTku5RDF+DKRHL5Q==
X-Received: by 2002:a05:600c:628c:b0:43c:f689:dd with SMTP id
 5b1f17b1804b1-442d6d71df0mr146869485e9.19.1747125247581; 
 Tue, 13 May 2025 01:34:07 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442e9d00bacsm40155815e9.12.2025.05.13.01.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 01:34:07 -0700 (PDT)
Date: Tue, 13 May 2025 10:34:05 +0200
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
 Wang <jasowang@redhat.com>, Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 14/27] hw/intc/apic: Remove
 APICCommonState::legacy_instance_id field
Message-ID: <20250513103405.6c502bbc@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-15-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-15-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AFarxgZlHyXU78RT18qzvlc24JYjtAPbdkaVQd5eIu4_1747125248
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
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Thu,  8 May 2025 15:35:37 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> The APICCommonState::legacy_instance_id boolean was only set
> in the pc_compat_2_6[] array, via the 'legacy-instance-id=3Don'
> property. We removed all machines using that array, lets remove
> that property, simplifying apic_common_realize().
>=20
> Because instance_id is initialized as initial_apic_id, we can
> not register vmstate_apic_common directly via dc->vmsd.

I think just removing this property is pretty save,
it's highly unlikely to be used by any external user
as it's purpose was to keep migration working for 2.6.
With the later gone there is not need for the property at all.
 =20

>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/i386/apic_internal.h | 1 -
>  hw/intc/apic_common.c           | 5 -----
>  2 files changed, 6 deletions(-)
>=20
> diff --git a/include/hw/i386/apic_internal.h b/include/hw/i386/apic_inter=
nal.h
> index 429278da618..db6a9101530 100644
> --- a/include/hw/i386/apic_internal.h
> +++ b/include/hw/i386/apic_internal.h
> @@ -188,7 +188,6 @@ struct APICCommonState {
>      uint32_t vapic_control;
>      DeviceState *vapic;
>      hwaddr vapic_paddr; /* note: persistence via kvmvapic */
> -    bool legacy_instance_id;
>      uint32_t extended_log_dest;
>  };
> =20
> diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
> index 37a7a7019d3..1d259b97e63 100644
> --- a/hw/intc/apic_common.c
> +++ b/hw/intc/apic_common.c
> @@ -294,9 +294,6 @@ static void apic_common_realize(DeviceState *dev, Err=
or **errp)
>          info->enable_tpr_reporting(s, true);
>      }
> =20
> -    if (s->legacy_instance_id) {
> -        instance_id =3D VMSTATE_INSTANCE_ID_ANY;
> -    }
>      vmstate_register_with_alias_id(NULL, instance_id, &vmstate_apic_comm=
on,
>                                     s, -1, 0, NULL);
> =20
> @@ -412,8 +409,6 @@ static const Property apic_properties_common[] =3D {
>      DEFINE_PROP_UINT8("version", APICCommonState, version, 0x14),
>      DEFINE_PROP_BIT("vapic", APICCommonState, vapic_control, VAPIC_ENABL=
E_BIT,
>                      true),
> -    DEFINE_PROP_BOOL("legacy-instance-id", APICCommonState, legacy_insta=
nce_id,
> -                     false),
>  };
> =20
>  static void apic_common_get_id(Object *obj, Visitor *v, const char *name=
,


