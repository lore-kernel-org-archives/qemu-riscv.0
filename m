Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2812CC3ABC3
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 May 2025 10:49:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uEnCF-0007ZB-6n; Tue, 13 May 2025 06:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEnBu-0007Xq-Bp
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 06:48:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEnBs-00039W-9Z
 for qemu-riscv@nongnu.org; Tue, 13 May 2025 06:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747133330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V5wZkatGsRPVmSLTP/nz6nayAB3lh6xoeog/xPUt+VI=;
 b=QwPzFYmUqLXYl4YCZMR0rY+V89ofheSWtqbptzE/PcAqtb5HTUG3X4HH1dNJQgxydnJqQ1
 lL+h3FU3Y8DQ7+heCosKv36VMjssl4p4B/abqF/gldhTZOivIkikMHy5QkvsjRGb+NBYOd
 ACFc8e73p8HgI9GLv0rtYoW9Gk4b8BU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-oq7VNeSIP9aNGPe2jZRxfA-1; Tue, 13 May 2025 06:48:49 -0400
X-MC-Unique: oq7VNeSIP9aNGPe2jZRxfA-1
X-Mimecast-MFC-AGG-ID: oq7VNeSIP9aNGPe2jZRxfA_1747133328
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43f405810b4so27200225e9.1
 for <qemu-riscv@nongnu.org>; Tue, 13 May 2025 03:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747133328; x=1747738128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gz6YcumP7UgPrL/99BZYderRp5B/M2Kk31LyOBDbBAY=;
 b=wL3c8YJpxqqTZSiMpY0wZ/V1bcCaDP4sK6aTf44GRDMGGOH/OZue4M/ZrR49vV5C0J
 +32cckMaQ5jNb8Tmx4FdEhJGxa15SHmqyEY4Ktkaw7Q9HarsqRDr+i+j6SLKxq6N96zm
 1461+Xq/zs87oghKEPiMjZU4aZqbbRfJSMdX1L6y8fP9dMJlBfxP+Fx4rMwwT46AUkb+
 q+RSAheFkC2tou7spVVL9JHbSUy5Xf4IvRZEa8JCpjUQWsQlpe3k/StIPoxp+NENNA5O
 0BH6nVYHm7xwIKXuyW4G47+4vXCD0oJMxq2vjH9u6i8XFR9kgN4w/IrUMVO7hfL+xNyg
 NQBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6Dw+Eu0DPZiVutayobOH7oNZxOxC7VSuUMHn9p4LTKWPRkVdPXfXqJBUkj+65wCvxJofM9Q7OhO5R@nongnu.org
X-Gm-Message-State: AOJu0Yw6oHHNoVUJfgatJd8c8h1U7VAgWqsaM8eLiP7+A6FGrLhCWp2A
 BA9OviTLMfwrdssazrXHhW9xm4+5o1B4QHIWk9SW3plSGGchSNXFmMdR61Xs6ZWW51WGcUy65+y
 y+2KcCJdSBRamwvJb4wk3l53OJ2TWMk+HoE2SrGeDXckrUyFkQU3l
X-Gm-Gg: ASbGnctBoBH0Cd4OyNh5kdHi4u7/wNVHSuBUqFnCaY4fz7nJgl9ehId+EB7KThCRHeL
 VY5v03TvHCMcPvRW3zv6EXIxtkIJXcu6I20lZQOnr0/6ugT1KzpmDvb+jdHRcj8unmXl1dt1rus
 9szhsJd/K/l0l6oneBBOnXmvk2sHMX+/sEqTdT8gpte94KEVMU1UJ8Ajy5j/oilzF5Bz5guVO9R
 kjFpzX8nw58D+txaE8eFWS6ZbwkVFV2P1whDP9PLIHCW+qAiVUqpv3b/wHkBMFP0YCoREdANTLU
 qIHLY4n/pMtaqufqY1tudC+dhNEpIWpy
X-Received: by 2002:a05:600c:528a:b0:43d:abd:ad0e with SMTP id
 5b1f17b1804b1-442d6d6b6ecmr146027845e9.18.1747133328274; 
 Tue, 13 May 2025 03:48:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcwjBFTjV45mCS7DLcHQ0i7qrk4kDcqsqOuuofJLKIQCV8x75e3d1qbOKxSD4iBS2kSrMvQw==
X-Received: by 2002:a05:600c:528a:b0:43d:abd:ad0e with SMTP id
 5b1f17b1804b1-442d6d6b6ecmr146027595e9.18.1747133327880; 
 Tue, 13 May 2025 03:48:47 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d67df639sm162625765e9.13.2025.05.13.03.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 03:48:47 -0700 (PDT)
Date: Tue, 13 May 2025 12:48:45 +0200
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
Subject: Re: [PATCH v4 27/27] hw/virtio/virtio-pci: Remove
 VIRTIO_PCI_FLAG_PAGE_PER_VQ definition
Message-ID: <20250513124845.0399f5f1@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-28-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-28-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7TXshFHIi5KR7dBVsAcH1iyiX_kW4ODm25dlbzczSb4_1747133328
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

On Thu,  8 May 2025 15:35:50 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> VIRTIO_PCI_FLAG_PAGE_PER_VQ was only used by the hw_compat_2_7[]
> array, via the 'page-per-vq=3Don' property. We removed all
> machines using that array, lets remove all the code around
> VIRTIO_PCI_FLAG_PAGE_PER_VQ (see commit 9a4c0e220d8 for similar
> VIRTIO_PCI_FLAG_* enum removal).
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  include/hw/virtio/virtio-pci.h |  1 -
>  hw/display/virtio-vga.c        | 10 ----------
>  hw/virtio/virtio-pci.c         |  7 +------
>  3 files changed, 1 insertion(+), 17 deletions(-)
>=20
> diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pc=
i.h
> index 9838e8650a6..8abc5f8f20d 100644
> --- a/include/hw/virtio/virtio-pci.h
> +++ b/include/hw/virtio/virtio-pci.h
> @@ -33,7 +33,6 @@ enum {
>      VIRTIO_PCI_FLAG_BUS_MASTER_BUG_MIGRATION_BIT,
>      VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT,
>      VIRTIO_PCI_FLAG_MODERN_PIO_NOTIFY_BIT,
> -    VIRTIO_PCI_FLAG_PAGE_PER_VQ_BIT,

there is also=20

/* page per vq flag to be used by split drivers within guests */           =
     =20
#define VIRTIO_PCI_FLAG_PAGE_PER_VQ \                                      =
     =20
    (1 << VIRTIO_PCI_FLAG_PAGE_PER_VQ_BIT)=20

left behind


nevertheless, I'm not sure if we should remove this at all,
it seems that there are external users
https://bugzilla.redhat.com/show_bug.cgi?id=3D1925363

>      VIRTIO_PCI_FLAG_ATS_BIT,
>      VIRTIO_PCI_FLAG_INIT_DEVERR_BIT,
>      VIRTIO_PCI_FLAG_INIT_LNKCTL_BIT,
> diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
> index 40e60f70fcd..83d01f089b5 100644
> --- a/hw/display/virtio-vga.c
> +++ b/hw/display/virtio-vga.c
> @@ -141,16 +141,6 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *=
vpci_dev, Error **errp)
>                                 VIRTIO_GPU_SHM_ID_HOST_VISIBLE);
>      }
> =20
> -    if (!(vpci_dev->flags & VIRTIO_PCI_FLAG_PAGE_PER_VQ)) {
> -        /*
> -         * with page-per-vq=3Doff there is no padding space we can use
> -         * for the stdvga registers.  Make the common and isr regions
> -         * smaller then.
> -         */
> -        vpci_dev->common.size /=3D 2;
> -        vpci_dev->isr.size /=3D 2;
> -    }
> -
>      offset =3D memory_region_size(&vpci_dev->modern_bar);
>      offset -=3D vpci_dev->notify.size;
>      vpci_dev->notify.offset =3D offset;
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 7c965771907..4e0d4bda6ed 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -314,12 +314,9 @@ static bool virtio_pci_ioeventfd_enabled(DeviceState=
 *d)
>      return (proxy->flags & VIRTIO_PCI_FLAG_USE_IOEVENTFD) !=3D 0;
>  }
> =20
> -#define QEMU_VIRTIO_PCI_QUEUE_MEM_MULT 0x1000
> -
>  static inline int virtio_pci_queue_mem_mult(struct VirtIOPCIProxy *proxy=
)
>  {
> -    return (proxy->flags & VIRTIO_PCI_FLAG_PAGE_PER_VQ) ?
> -        QEMU_VIRTIO_PCI_QUEUE_MEM_MULT : 4;
> +    return 4;
>  }
> =20
>  static int virtio_pci_ioeventfd_assign(DeviceState *d, EventNotifier *no=
tifier,
> @@ -2348,8 +2345,6 @@ static const Property virtio_pci_properties[] =3D {
>                      VIRTIO_PCI_FLAG_BUS_MASTER_BUG_MIGRATION_BIT, false)=
,
>      DEFINE_PROP_BIT("modern-pio-notify", VirtIOPCIProxy, flags,
>                      VIRTIO_PCI_FLAG_MODERN_PIO_NOTIFY_BIT, false),
> -    DEFINE_PROP_BIT("page-per-vq", VirtIOPCIProxy, flags,
> -                    VIRTIO_PCI_FLAG_PAGE_PER_VQ_BIT, false),
>      DEFINE_PROP_BIT("ats", VirtIOPCIProxy, flags,
>                      VIRTIO_PCI_FLAG_ATS_BIT, false),
>      DEFINE_PROP_BIT("x-ats-page-aligned", VirtIOPCIProxy, flags,


