Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93916C3ABC9
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 May 2025 08:36:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uEl7o-00089E-9b; Tue, 13 May 2025 04:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEl7m-00088y-TO
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 04:36:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEl7k-0006ik-Up
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 04:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747125387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=waSgGfWHGn1OSz/MfNcOFXc00Gs+iYB5Eoow1XSEdBU=;
 b=iETUal/7EXUoVEjuC10+g2XqooHefpILF70yZ3t6Jc7T9dynV7xtBoA9Vk5Tz4CYAoE937
 JlxKg1144B+JwdzY9rts89C3VGqB8/u9LR7MXj2pN63THX+VbCcGB3/+qeIP+bsjQ4li4c
 GyYk551k0K2vlv+8C30ozdpkwPAkmJg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-NbpiCmoAPXKsZGks7pX_Rw-1; Tue, 13 May 2025 04:36:26 -0400
X-MC-Unique: NbpiCmoAPXKsZGks7pX_Rw-1
X-Mimecast-MFC-AGG-ID: NbpiCmoAPXKsZGks7pX_Rw_1747125385
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a0bd786a53so2221669f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 13 May 2025 01:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747125385; x=1747730185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wVAl0zVgqH87YvdqKchpA84YKh5NANrF4mrLmsOjL/k=;
 b=Pjd5SiNyxJIRFmKxe21s6cxkAVFVXpofzj2bzmhwEtMFGNepL3ABTVrVh+Bh1x1lpM
 z+QtuDUWDfCUIHDQH6mRQUlttLYMJwN7RFZ6DeCh+Ip7oG4KZhQwaJkyCa2y5d+ilUzy
 OtVk3lrSYHAp8abstxv+MofdqnH6fO3zleim7xe5J87F7H3SNGabK/VKTkrz3NZF+Dnk
 8lp8Mn+NsmlxW9yru5RgZd7kS69/OYr5PgGoUTPdhNxS2p5WqQPgLpAV/qFBvPgkFlGz
 StQEY/jDrEfs2oEr/xanyFNIE2YkXfHa1ufAyecYAE71DJ/JqbuxBlboEfNuCUfzqP3w
 geOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+U1hS3Izkmh23NZ6X/si9QXe0XLjWYpcTT88t2d7o0YkgEAns9LWiGJxwtaM5+oEC3TbPCmSYA6pJ@nongnu.org
X-Gm-Message-State: AOJu0Yz4F0ocawey9K1rWuwidR45CHgDkbMJ+tLyROCdFNZG1S7fG1LJ
 5Uui//lTQUdhnYcBIXbmMU2TYoPCHTRLYnuMp85/aAu/VSIDM41hXkP7AskREAxJ3zLkgS14HUq
 wuouJ0uqYd8VfbCtZ2G7EccJBxkymBXfe6h2jZrMX4IoWKmBl+LLl
X-Gm-Gg: ASbGnctQr3XOlFkgb7lsuYy7RHh1e9aKdzi2W8x4Y6hp+o5XNfObqWUbjtbx9TR+PWl
 GxntphVKK73oQSns5AQPrah3Iee6LtQnhHmvez0Vf7tQx99lAs0LvImhtai3XbUmDRv0LiZ66p+
 V4cjiN0JULkhFBsb9k3Cnsw0T+hYKBvbIVefzm5sBxqZIQTH7mmyviC80RGuaHksgiPpRMlOlfp
 PJlROeWBK2eOrsXTgeYjBn6fEgOfyveGQmvwZYhvtMoXJEWo+GkjLwb7r4v+4m4Oxott9EigV1z
 iWUAt9N+4uGx9b4Ieb1XUb6Wnl23IDj9
X-Received: by 2002:a5d:64ac:0:b0:3a1:1229:8fe0 with SMTP id
 ffacd0b85a97d-3a1f6482c15mr14480699f8f.38.1747125384927; 
 Tue, 13 May 2025 01:36:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgEYDVr7iQlgSKGrFECgtHY6riy1T/KVm0n7Q+QhUYIat1jVjUcti8+9lRaaJT6mKdrN8lsQ==
X-Received: by 2002:a5d:64ac:0:b0:3a1:1229:8fe0 with SMTP id
 ffacd0b85a97d-3a1f6482c15mr14480634f8f.38.1747125384492; 
 Tue, 13 May 2025 01:36:24 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f57ddde0sm15646436f8f.14.2025.05.13.01.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 01:36:24 -0700 (PDT)
Date: Tue, 13 May 2025 10:36:22 +0200
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
Subject: Re: [PATCH v4 15/27] hw/core/machine: Remove hw_compat_2_6[] array
Message-ID: <20250513103622.07e2fce4@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-16-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-16-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QKYQaUdlpuOgSHTEXvpdCyStQQ-NLptygIVK182ncxI_1747125385
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

On Thu,  8 May 2025 15:35:38 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> The hw_compat_2_6[] array was only used by the pc-q35-2.6 and
> pc-i440fx-2.6 machines, which got removed. Remove it.

see my comment in 1/27

>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/hw/boards.h | 3 ---
>  hw/core/machine.c   | 8 --------
>  2 files changed, 11 deletions(-)
>=20
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 5f1a0fb7e28..a881db8e7d6 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -841,7 +841,4 @@ extern const size_t hw_compat_2_8_len;
>  extern GlobalProperty hw_compat_2_7[];
>  extern const size_t hw_compat_2_7_len;
> =20
> -extern GlobalProperty hw_compat_2_6[];
> -extern const size_t hw_compat_2_6_len;
> -
>  #endif
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index e7001bf92cd..ce98820f277 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -275,14 +275,6 @@ GlobalProperty hw_compat_2_7[] =3D {
>  };
>  const size_t hw_compat_2_7_len =3D G_N_ELEMENTS(hw_compat_2_7);
> =20
> -GlobalProperty hw_compat_2_6[] =3D {
> -    { "virtio-mmio", "format_transport_address", "off" },
> -    /* Optional because not all virtio-pci devices support legacy mode *=
/
> -    { "virtio-pci", "disable-modern", "on",  .optional =3D true },
> -    { "virtio-pci", "disable-legacy", "off", .optional =3D true },
> -};
> -const size_t hw_compat_2_6_len =3D G_N_ELEMENTS(hw_compat_2_6);
> -
>  MachineState *current_machine;
> =20
>  static char *machine_get_kernel(Object *obj, Error **errp)


