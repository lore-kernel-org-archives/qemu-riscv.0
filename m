Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8B8E7716E
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 16:47:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tJF10-0006Ck-Im; Thu, 05 Dec 2024 11:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJF0y-0006BQ-EY
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 11:47:44 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJF0w-0001Ae-P7
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 11:47:44 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d0bf80972dso1348212a12.2
 for <qemu-riscv@nongnu.org>; Thu, 05 Dec 2024 08:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733417261; x=1734022061; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vKoZnZtieEW2hN260R2q1BP0rtYxvl3swlzNxzYrLeQ=;
 b=GsjuUaCGtYIZiyJpVzl/4bfuGelkA546RJGfpNpZ+gX2fBGNJ7fNAv6F4tca7Q4r5c
 Rpxt+cO06YG6RUrXqpGU7ZVlGkFjz8sfBWdl3AtWDz4ekNC4nfeQf4nq7ol81WHNj85c
 aGQcJtj0qUk/JpeRqmeBGsXj+uMpANOdUJqZH07kTpz7u83ACtK1hzbUmeUqO6zXViX7
 42FUxz2qtiLJaXMNHCyIZkNKt3gkOqXAp3DPhGIybuhDaljPlCGudd4mSwUSwQQbBBnH
 iT7+myplFjVV9AKaKWmXSGLXpUalobW0wXJfLrJ+1Xm2S10L+t+r8yfngXBdwljL9LKv
 ESDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733417261; x=1734022061;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vKoZnZtieEW2hN260R2q1BP0rtYxvl3swlzNxzYrLeQ=;
 b=ha7dby5FdL/HuPpo0lj2GTgsvGHALxxAztT4T2lpW/1u7kIWdFG7Nda/tyOIsUk/2A
 c2SklaJTLnS0YPwI5cixkb+6IQjBuEWKkoLUD/n06p7SotlibsIwxYzz7Qr5i4LBlsxB
 O1D5Q1UIJJi6lfaHNTvgz4VAmk1G4pN0aI+jC/6TNylZ1zbhtZa91IwYBknjjxnvQjTd
 rt982P0wWNY3NNsT92TfMXdee4SGZJXnc35Q6leH3gdlx2sJS7Hqu3IxKHlP7UfkrSd7
 NTp/3NAvUILPdllStpgL1RFzFTrvvlTVdccEQEhAT1Jwm7W+iUR25R3j/boeqMcG19bx
 B6KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq76OfvcnNPenrZouE0tbVwcjlWAee1XSJKJoRkQHRJXDaM8FDP+d2k62GtcIz981puigGsBORulzk@nongnu.org
X-Gm-Message-State: AOJu0YwtecrVKDZ9k7Nli4bF7nzsOaR3Kg4Id43fQ2/JULYnpiIypjpy
 FZaQjGQhOkKWi6ckr0KTwlrgewa1pFIMqxF3p5Yj3LrR5xlLquU9IGvKbW/FvQWHG3Rfdhxnz0G
 82S2wYZI1RS/6vWf9rxqhzzeIfYVqsopYltDihw==
X-Gm-Gg: ASbGncufh9MhdfpPyPLfAhrHwERwGUfU7wzOaeaAVE0rF3nJ7wXWdYWW/vE3WC39/h7
 0RBG0k4Pwn0P20s6trEeNZeCKdUGd6VLW
X-Google-Smtp-Source: AGHT+IHVi9+YLyz3Jeq96LN5Io7yPcSVDzHst7VdSr/46DG4MmRQfikCRh7gvhMzS+4T8xHKlWw1p/354wKr9Rxd7W4=
X-Received: by 2002:aa7:d455:0:b0:5d0:fb56:3f with SMTP id
 4fb4d7f45d1cf-5d10cb5649emr16758787a12.12.1733417261056; 
 Thu, 05 Dec 2024 08:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20241126112212.64524-1-philmd@linaro.org>
 <20241126112212.64524-11-philmd@linaro.org>
In-Reply-To: <20241126112212.64524-11-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 16:47:30 +0000
Message-ID: <CAFEAcA8Wm7dq--481ZJMb+fN7MsR9FJuB6hqRC4fW7ZBE5KYXw@mail.gmail.com>
Subject: Re: [PATCH-for-10.0 v2 10/13] hw/pci-host/gpex: Expose
 'refuse-bar-at-addr-0' property
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-riscv@nongnu.org, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Tue, 26 Nov 2024 at 11:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Expose the "refuse-bar-at-addr-0" property so machines
> using a GPEX host bridge can set this flag on the bus.
> While the default property is set to 'false', all caller
> set it to 'true' so there is no logical change so far.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/hw/pci-host/gpex.h | 1 +
>  hw/arm/sbsa-ref.c          | 2 ++
>  hw/arm/virt.c              | 2 ++
>  hw/i386/microvm.c          | 2 ++
>  hw/loongarch/virt.c        | 2 ++
>  hw/mips/loongson3_virt.c   | 2 ++
>  hw/openrisc/virt.c         | 2 ++
>  hw/pci-host/gpex.c         | 4 +++-
>  hw/riscv/virt.c            | 2 ++
>  hw/xen/xen-pvh-common.c    | 2 ++
>  hw/xtensa/virt.c           | 2 ++
>  11 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index dce883573ba..44c6463afb3 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -64,6 +64,7 @@ struct GPEXHost {
>      int irq_num[GPEX_NUM_IRQS];
>
>      bool allow_unmapped_accesses;
> +    bool refuse_bar_at_addr_0;
>
>      struct GPEXConfig gpex_cfg;
>  };
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index e3195d54497..f6cf43cf0c9 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -647,6 +647,8 @@ static void create_pcie(SBSAMachineState *sms)
>      int i;
>
>      dev =3D qdev_new(TYPE_GPEX_HOST);
> +    object_property_set_bool(OBJECT(dev), "refuse-bar-at-addr-0",
> +                             true, &error_fatal);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>
>      /* Map ECAM space */
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 1a381e9a2bd..06affc3638b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1510,6 +1510,8 @@ static void create_pcie(VirtMachineState *vms)
>      MachineClass *mc =3D MACHINE_GET_CLASS(ms);
>
>      dev =3D qdev_new(TYPE_GPEX_HOST);
> +    object_property_set_bool(OBJECT(dev), "refuse-bar-at-addr-0",
> +                             true, &error_fatal);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>
>      ecam_id =3D VIRT_ECAM_ID(vms->highmem_ecam);

These don't look right, because both virt and sbsa-ref
set mc->pci_allow_0_address =3D true. And in the next
patch you delete them again...

-- PMM

