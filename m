Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60983C3ABC9
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 May 2025 09:03:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uElX5-0006vA-K8; Tue, 13 May 2025 05:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uElX2-0006tr-Oo
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 05:02:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uElX0-0000bu-C5
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 05:02:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747126952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HE5E63A6rmg07JemaPIfncFI01OB8TrlgBKDzNGQzCc=;
 b=FlqB2w1FxAvztT4Ph7UpEnufeCeGaunFAlrLwYroSRoTuEg8AztzMsIn1UJWYEeETyPUwz
 2dcOdTaxcMjNOvj0WJl+2qXk29nv1rk/TuxBfmzaiVEWn/jJ2JiYURS0GWzTSajPQlD424
 LlHTOYAqqRJmEHlZSLiGiD1yukdqm88=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-LO1Y3VZbO9CCEjdTUaF5sQ-1; Tue, 13 May 2025 05:02:30 -0400
X-MC-Unique: LO1Y3VZbO9CCEjdTUaF5sQ-1
X-Mimecast-MFC-AGG-ID: LO1Y3VZbO9CCEjdTUaF5sQ_1747126950
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a1f9ddf04bso2220941f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 13 May 2025 02:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747126949; x=1747731749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HE5E63A6rmg07JemaPIfncFI01OB8TrlgBKDzNGQzCc=;
 b=AEGVrQz5PUBpTKLPaVevYfoKpHAplUqFq6BYkdbbmn9kY0NLjQBNTsy4AQ7k5hKJHX
 TGMkPeDH9JnsXoVSOiZh47Bj+UEWPh3ChUu58wGtgA8R5mlt9eh6FJQsGeuMGn2vS5G3
 6dLQD5XgK3saE+wpVm/S+Lj8ah0vA77teW/gZ76Y3QYLIhxSaNoGErEJB1cBMMjcjRYP
 SWIkk/SduL38nHhGziJg8dweFBQamiyJXbrG9hkUuVMho90rDD2cMSpqJ2fT3b1/5XkL
 1Qg3oMz//82CiWtXDm5m5ccWY70KogaUsclFwQgGbha79POuYGaD3T9xxjymS+9/1Jdn
 1qgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqkxvbw7YUR2s+mmzLzrmAt8WSrYFs0vrVpNs7O48cIO82RBW7yb+wTrAQ+fl8T+FRjFzwGrX+qI+N@nongnu.org
X-Gm-Message-State: AOJu0Yz3JD27HZe/4IcdGRwheSgmUwzjRRyDITzzy+aPgEnPtUNRoDY0
 LlbzofQpxh+/IGbLmKhERtC1Jsqz0JURcXqh27nkBbalKh2+lHK/3O3uTRuZHD6pG170ubVDmf2
 3VAlqvPhqOoDMWge3Txnmako64R1AjZgDlL30Zog1K7bLo2eM0qkp
X-Gm-Gg: ASbGncspr4YR4MTRPqlsRs3y7rdybTSHHJamfzfyp6Ia8F3BuJK1kXDFHn2iBHwSi30
 rZpp1rYTLQQf9gNSfjMgB1S5smxZcY2quPqPfY+2rMxBS32bgBT53P75HNMis5NuKpyM4XmHceB
 N2ovimnPF+SyVa+Tr8e6UNbbn8OB8v5S7CgZpeOFOoufyQTVCzlLef8oB7woEClyD0DX7xTPMIS
 Nqt7/uTVTNXy14JQ1U06Fylw7/TljQdvM7G+aWoB6nElOf+LTlotKcopJpkmT062mexLXAj0dli
 EHChWpemgFDMUJh13L27hoy3mCUzeBZC
X-Received: by 2002:adf:f687:0:b0:3a1:fa6c:4735 with SMTP id
 ffacd0b85a97d-3a1fa6c4838mr8573380f8f.35.1747126949667; 
 Tue, 13 May 2025 02:02:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuyZeASJoiDIgAZ42Fslx6v9M83ncZUjLwgaiHV4EALKZNgG04LuVa4ibD678KGNhv6DCCrw==
X-Received: by 2002:adf:f687:0:b0:3a1:fa6c:4735 with SMTP id
 ffacd0b85a97d-3a1fa6c4838mr8573329f8f.35.1747126949240; 
 Tue, 13 May 2025 02:02:29 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f296csm15256712f8f.47.2025.05.13.02.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 02:02:28 -0700 (PDT)
Date: Tue, 13 May 2025 11:02:27 +0200
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
Subject: Re: [PATCH v4 21/27] hw/audio/pcspk: Remove PCSpkState::migrate field
Message-ID: <20250513110227.04d709b2@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-22-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-22-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v5Y2zf81eCeW8Kk-Z8OPuVptI4PQTNushZ8BgHh2118_1747126950
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

On Thu,  8 May 2025 15:35:44 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> The PCSpkState::migrate boolean was only set in the
> pc_compat_2_7[] array, via the 'migrate=3Doff' property.
> We removed all machines using that array, lets remove
> that property, simplifying vmstate_spk[].

same as 14/27, it should be safe to remove without deprecation

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

=20
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/audio/pcspk.c | 10 ----------
>  1 file changed, 10 deletions(-)
>=20
> diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
> index a419161b5b1..0e83ba0bf73 100644
> --- a/hw/audio/pcspk.c
> +++ b/hw/audio/pcspk.c
> @@ -56,7 +56,6 @@ struct PCSpkState {
>      unsigned int play_pos;
>      uint8_t data_on;
>      uint8_t dummy_refresh_clock;
> -    bool migrate;
>  };
> =20
>  static const char *s_spk =3D "pcspk";
> @@ -196,18 +195,10 @@ static void pcspk_realizefn(DeviceState *dev, Error=
 **errp)
>      pcspk_state =3D s;
>  }
> =20
> -static bool migrate_needed(void *opaque)
> -{
> -    PCSpkState *s =3D opaque;
> -
> -    return s->migrate;
> -}
> -
>  static const VMStateDescription vmstate_spk =3D {
>      .name =3D "pcspk",
>      .version_id =3D 1,
>      .minimum_version_id =3D 1,
> -    .needed =3D migrate_needed,
>      .fields =3D (const VMStateField[]) {
>          VMSTATE_UINT8(data_on, PCSpkState),
>          VMSTATE_UINT8(dummy_refresh_clock, PCSpkState),
> @@ -218,7 +209,6 @@ static const VMStateDescription vmstate_spk =3D {
>  static const Property pcspk_properties[] =3D {
>      DEFINE_AUDIO_PROPERTIES(PCSpkState, card),
>      DEFINE_PROP_UINT32("iobase", PCSpkState, iobase,  0x61),
> -    DEFINE_PROP_BOOL("migrate", PCSpkState, migrate,  true),
>  };
> =20
>  static void pcspk_class_initfn(ObjectClass *klass, const void *data)


