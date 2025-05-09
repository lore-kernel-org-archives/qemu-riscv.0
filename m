Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B97C3ABBC
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 May 2025 16:02:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uDQA6-0008F9-Eo; Fri, 09 May 2025 12:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uDQ9n-0007lh-UC
 for qemu-riscv@nongnu.org; Fri, 09 May 2025 12:01:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uDQ9j-00042F-HJ
 for qemu-riscv@nongnu.org; Fri, 09 May 2025 12:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746806458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1l2f1VTt8XFWF8y5nnU3g+hJzfAgoHTdTr9qTI5UxXU=;
 b=K/4Wt74AVUuStY2qeO+6aPFi2IjHrEYfpP2Pb1TJCskT21VaCuOYHkwoRoJCBpjx5AVbiq
 4s9LhmPFyhzUspNFDSSWqFigpXXjZUq8bLGyzPvuq5mV34RcJUmLsUZ2jh97GGKO0R8geQ
 yeICVryiEijKDB9k0oTLu4fI9z5d2wI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-_LrDhKn8OYuNqWPfHVNVWw-1; Fri, 09 May 2025 12:00:55 -0400
X-MC-Unique: _LrDhKn8OYuNqWPfHVNVWw-1
X-Mimecast-MFC-AGG-ID: _LrDhKn8OYuNqWPfHVNVWw_1746806455
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43ea256f039so17435405e9.0
 for <qemu-riscv@nongnu.org>; Fri, 09 May 2025 09:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746806455; x=1747411255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pp1R+sHe0G6QXL8IYhdEIVqTNgya/k6FcsiXO1F4Qzc=;
 b=Hp2P944JPBZ9vL1zfJ3/VioctxA5ybW867W0u2ZpdW5dnvyjIytVLGLB8mUQihEIRp
 6vxT7lzWk1ERrQ88QbmIe5Xd3phZyavi5wZO6D3lFiodScW4ULE9ddI00FT814SGZ66A
 41oJPgOtK4RcVyUBMjy/jGPOI79NLbfR7o9jJn6Q16g/p/ec9ZM/4upE+LA1aJnY4E5U
 EB1Y8dwLrd0iehGHIPdYFshCy9xDpEFs0OTCMXNgfTBeUi7uI+3N0UacBjPU2OWGq3Xc
 iF2ujGMIzwiJm6ep/7HcgxvqRrKrZBgiaqrpbDQ7+Jjf7d3TMTzPAh/zAg+ADom0pk49
 tPrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5XPWPfZKObI1Ec+D83kTJPdBKLyX1fjvoT3ZbtUS7MRLyQWza+5yzS1ned3Nyl1r4hiUJo9cwbo1A@nongnu.org
X-Gm-Message-State: AOJu0Yz/8fWTi02Fet3JjmlH2sNM6YcyWECeIL7UClDzKYV/ItmrOoPj
 O47du1jFA60vKuIFD0KmM7QB5sjeE/MRtQ55mzMwOqpqZcZ2tE2AllgZa9m4UR1+aP2uFaX/eU7
 6bPNd7Gty37e2s0cda5K7gAEgI/oQ4hzmLrB+YJFSZQbZVZLsYugw
X-Gm-Gg: ASbGncudT3HIYXjnmN1vEb44hQmivre5xhC6cU7nf/GYqq7DwZzzGYZqhEBq/shOjSK
 sMunlPvWQ+T7F2yrgXO8UPOXgwFE8sNyVbzywji28fzyHdCGnUa/C31WmifSnLLbbhjcTKgyCp0
 f4rPYMxRWAzBlKc4oSsjomH/DYWHdWHNH7zyds1q5CUF1JZxE96wFcCp+xaGhyNS5N3JzanTqTt
 1tRxM1AYI4p6VqFv4HOhfnI+AQrCGOH7wAwlCa30yH07sqK8EindJn5IB4RxyXArlTIQVK2RbMV
 hIAq2XO4m656sZMvPdLjRZtqEYKxuyaZ
X-Received: by 2002:a05:600c:699a:b0:43c:ee3f:2c3 with SMTP id
 5b1f17b1804b1-442d6d18b4dmr37308365e9.7.1746806454575; 
 Fri, 09 May 2025 09:00:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS6pTd6+VJXAdfrY7kXu0jP714J0Kn35h7fvaLNzrQyXsYvefWneKyFITxNj+O58PDLW9NnQ==
X-Received: by 2002:a05:600c:699a:b0:43c:ee3f:2c3 with SMTP id
 5b1f17b1804b1-442d6d18b4dmr37307645e9.7.1746806454010; 
 Fri, 09 May 2025 09:00:54 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d67df5ecsm33860625e9.9.2025.05.09.09.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 09:00:53 -0700 (PDT)
Date: Fri, 9 May 2025 18:00:50 +0200
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
Subject: Re: [PATCH v4 09/27] hw/nvram/fw_cfg: Remove
 fw_cfg_io_properties::dma_enabled
Message-ID: <20250509180050.0b91cef1@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-10-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-10-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: STW3KCZnyfowRfjxigPKvxb9-mHgZkhrXmtYqDQZW8Y_1746806455
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.413,
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

On Thu,  8 May 2025 15:35:32 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> Now than all calls to fw_cfg_init_io_dma() pass DMA arguments,
> the 'dma_enabled' of the TYPE_FW_CFG_IO type is not used anymore.
> Remove it, simplifying fw_cfg_init_io_dma() and fw_cfg_io_realize().
>=20
> Note, we can not remove the equivalent in fw_cfg_mem_properties[]
> because it is still used in HPPA and MIPS Loongson3 machines:
>=20
>   $ git grep -w fw_cfg_init_mem_nodma
>   hw/hppa/machine.c:204:    fw_cfg =3D fw_cfg_init_mem_nodma(addr, addr +=
 4, 1);
>   hw/mips/loongson3_virt.c:289:    fw_cfg =3D fw_cfg_init_mem_nodma(cfg_a=
ddr, cfg_addr + 8, 8);
>=20
> 'linuxboot.bin' isn't used anymore, we'll remove it in the
> next commit.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  hw/i386/fw_cfg.c     |  5 +----
>  hw/i386/x86-common.c |  5 +----
>  hw/nvram/fw_cfg.c    | 26 ++++++++------------------
>  3 files changed, 10 insertions(+), 26 deletions(-)
>=20
> diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
> index 5c0bcd5f8a9..1fe084fd720 100644
> --- a/hw/i386/fw_cfg.c
> +++ b/hw/i386/fw_cfg.c
> @@ -221,10 +221,7 @@ void fw_cfg_add_acpi_dsdt(Aml *scope, FWCfgState *fw=
_cfg)
>       * of the i/o region used is FW_CFG_CTL_SIZE; when using DMA, the
>       * DMA control register is located at FW_CFG_DMA_IO_BASE + 4
>       */
> -    Object *obj =3D OBJECT(fw_cfg);
> -    uint8_t io_size =3D object_property_get_bool(obj, "dma_enabled", NUL=
L) ?
> -        ROUND_UP(FW_CFG_CTL_SIZE, 4) + sizeof(dma_addr_t) :
> -        FW_CFG_CTL_SIZE;
> +    uint8_t io_size =3D ROUND_UP(FW_CFG_CTL_SIZE, 4) + sizeof(dma_addr_t=
);
>      Aml *dev =3D aml_device("FWCF");
>      Aml *crs =3D aml_resource_template();
> =20
> diff --git a/hw/i386/x86-common.c b/hw/i386/x86-common.c
> index 27254a0e9f1..ee594364415 100644
> --- a/hw/i386/x86-common.c
> +++ b/hw/i386/x86-common.c
> @@ -991,10 +991,7 @@ void x86_load_linux(X86MachineState *x86ms,
>      }
> =20
>      option_rom[nb_option_roms].bootindex =3D 0;
> -    option_rom[nb_option_roms].name =3D "linuxboot.bin";
> -    if (fw_cfg_dma_enabled(fw_cfg)) {
> -        option_rom[nb_option_roms].name =3D "linuxboot_dma.bin";
> -    }
> +    option_rom[nb_option_roms].name =3D "linuxboot_dma.bin";
>      nb_option_roms++;
>  }
> =20
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 51b028b5d0a..ef976a4bce2 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -1026,12 +1026,9 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, ui=
nt32_t dma_iobase,
>      FWCfgIoState *ios;
>      FWCfgState *s;
>      MemoryRegion *iomem =3D get_system_io();
> -    bool dma_requested =3D dma_iobase && dma_as;
> =20
> +    assert(dma_iobase);
>      dev =3D qdev_new(TYPE_FW_CFG_IO);
> -    if (!dma_requested) {
> -        qdev_prop_set_bit(dev, "dma_enabled", false);
> -    }
> =20
>      object_property_add_child(OBJECT(qdev_get_machine()), TYPE_FW_CFG,
>                                OBJECT(dev));
> @@ -1042,13 +1039,10 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, u=
int32_t dma_iobase,
>      memory_region_add_subregion(iomem, iobase, &ios->comb_iomem);
> =20
>      s =3D FW_CFG(dev);
> -
> -    if (s->dma_enabled) {
> -        /* 64 bits for the address field */
> -        s->dma_as =3D dma_as;
> -        s->dma_addr =3D 0;
> -        memory_region_add_subregion(iomem, dma_iobase, &s->dma_iomem);
> -    }
> +    /* 64 bits for the address field */
> +    s->dma_as =3D dma_as;
> +    s->dma_addr =3D 0;
> +    memory_region_add_subregion(iomem, dma_iobase, &s->dma_iomem);
> =20
>      return s;
>  }
> @@ -1185,8 +1179,6 @@ static void fw_cfg_file_slots_allocate(FWCfgState *=
s, Error **errp)
>  }
> =20
>  static const Property fw_cfg_io_properties[] =3D {
> -    DEFINE_PROP_BOOL("dma_enabled", FWCfgIoState, parent_obj.dma_enabled=
,
> -                     true),

in 7/27 you still have, fw_cfg_dma_enabled(fw_cfg) which works around
now missing property (in IO case) in obscure way.
that is also used in bios_linker_loader_can_write_pointer().

It would be better to get rid of fw_cfg_dma_enabled() as well
or keep property as RO and replace fw_cfg_dma_enabled() with property
accessor if both calls can happen on nondma path                     =20


>      DEFINE_PROP_UINT16("x-file-slots", FWCfgIoState, parent_obj.file_slo=
ts,
>                         FW_CFG_FILE_SLOTS_DFLT),
>  };
> @@ -1207,11 +1199,9 @@ static void fw_cfg_io_realize(DeviceState *dev, Er=
ror **errp)
>      memory_region_init_io(&s->comb_iomem, OBJECT(s), &fw_cfg_comb_mem_op=
s,
>                            FW_CFG(s), "fwcfg", FW_CFG_CTL_SIZE);
> =20
> -    if (FW_CFG(s)->dma_enabled) {
> -        memory_region_init_io(&FW_CFG(s)->dma_iomem, OBJECT(s),
> -                              &fw_cfg_dma_mem_ops, FW_CFG(s), "fwcfg.dma=
",
> -                              sizeof(dma_addr_t));
> -    }
> +    memory_region_init_io(&FW_CFG(s)->dma_iomem, OBJECT(s),
> +                          &fw_cfg_dma_mem_ops, FW_CFG(s), "fwcfg.dma",
> +                          sizeof(dma_addr_t));
> =20
>      fw_cfg_common_realize(dev, errp);
>  }


