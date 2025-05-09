Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C50C3ABC3
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 May 2025 15:39:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uDPoc-0005dW-Vz; Fri, 09 May 2025 11:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uDPob-0005d2-PL
 for qemu-riscv@nongnu.org; Fri, 09 May 2025 11:39:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uDPoa-0001Ew-74
 for qemu-riscv@nongnu.org; Fri, 09 May 2025 11:39:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746805147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0q9Jy98uK5VZ3vYkkKTg9elLrKYm7ghVzOBceZF6LV8=;
 b=WgEP3s46w6bYHfxeuGbQtopCjCfY1CsvwZ3ARZovjM1bLRyF3ZqC3NXhN874zp5z66gjwi
 mVvkZBycO97uQrb+Or/m1arVlHUuKf6mbJxjps9Upwc5wxnyjaoV9uKcbNG8+2RnpVOLPu
 Skb9L5HY8XyengAbxy5GXb5lbLrtix8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-biE6kR_VPciGuw-y7mfx3w-1; Fri, 09 May 2025 11:39:06 -0400
X-MC-Unique: biE6kR_VPciGuw-y7mfx3w-1
X-Mimecast-MFC-AGG-ID: biE6kR_VPciGuw-y7mfx3w_1746805145
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a1fc08c424so194417f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 09 May 2025 08:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746805145; x=1747409945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XjfMm92yDrp8r2ZOJnfR/TKWAwp/QZ0ox7aMgUojhHI=;
 b=KcX5AxaDZGnPAAnpaH4jB8mGCT2XDnP0mC56xU+YOsgPyN0PBEZlyl8+dMfWAuOEk2
 rG+E5igaOcy4fPcVHbRZVarlKcteVQd7BOFiHTccACoHTghhLgKwLqznQqd0CCz0KRg4
 LD7YF6cXEMh7PppXZmC9/lvKaTzPWY1CcjN1mEBhA7ZPCz5/QjczZvBCVx7wNOtVYjSJ
 0RKwMx6YhO6lV19HJLx03hpBd2BvS3mDfXdgMpzdjyQc0ckRxAYqN2UXaLjjqONGGuHw
 w/wLncTasLvQwmYG4DvojaXO/6jQ6Te6B60BBWUeQZLEADs81BWMjqOUruWSYpn0aRv4
 45BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyVwGSfOAzmc8oTAjG5/TlVp9SzVw4TsHJbvq13LSBkns3WDN6NifgJ2NxcGRC5WBvq0es6eKxqErV@nongnu.org
X-Gm-Message-State: AOJu0YweWuWUTTO/sjlcd3ldvLjo8whiUqzEJhgecnY/iHmR91SaAJxx
 450Vb67EM/k5Grow5eaEfyKHUPWteqmjWNVM6UNe3jjwVhDt8Z1I2JiA0s7G2TRbojwNrhnkka8
 N0UDlGkNmSszPn27FEoZBxi82tMYe/7ZqHA1AicEbTc3dl7Q8LNfF
X-Gm-Gg: ASbGncusEuofFPFQvRTuBd0hHk6R0ccJTSob1az4asNAXnR9QceKXnzqv/6GStzJPUW
 GldBsv0079TOQZkoQMzoTyG4WzurB/IUaOfRI2fDCFswCKpun5LQo2MJXLkwH+LShhNZF0iGvLK
 KlEBRljc18kwNiA6MAarxwj/p36o27Bysh8ILevWrKaCxuejTb/vUiU3T8R+ODjG7/Gq6ZU3Pt4
 AhQ9Vl4NAId1zUDNFHEdXuV5f/bB2DiTQdn9MLVTDOxucNks5dRnpTgZsgpYMg6+7ac1hI0Xcn3
 3WwF+uer5i3nfpWLqLxqNtMYyPt8pRy7
X-Received: by 2002:a5d:64ad:0:b0:3a0:b4f1:8bda with SMTP id
 ffacd0b85a97d-3a1f643ac2fmr3272167f8f.1.1746805144982; 
 Fri, 09 May 2025 08:39:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhKPmGTam1SWc4Gq6m5qYczHRHd+/PPrONEzG16dZjSMP8SZ3aFRBc8dbuayiDSu1cWlR1ag==
X-Received: by 2002:a5d:64ad:0:b0:3a0:b4f1:8bda with SMTP id
 ffacd0b85a97d-3a1f643ac2fmr3272131f8f.1.1746805144552; 
 Fri, 09 May 2025 08:39:04 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f57de001sm3565183f8f.20.2025.05.09.08.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 08:39:04 -0700 (PDT)
Date: Fri, 9 May 2025 17:39:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent
 Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu
 <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, Yanan Wang
 <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, Ani Sinha <anisinha@redhat.com>, Fabiano Rosas
 <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif
 <clement.mathieu--drif@eviden.com>, qemu-arm@nongnu.org, =?UTF-8?B?TWFy?=
 =?UTF-8?B?Yy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Huacai Chen
 <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 06/27] hw/nvram/fw_cfg: Rename fw_cfg_init_mem_wide()
 -> fw_cfg_init_mem_dma()
Message-ID: <20250509173902.718c2dc5@imammedo.users.ipa.redhat.com>
In-Reply-To: <aB2l25PwH4e0jaTb@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-7-philmd@linaro.org>
 <aB2l25PwH4e0jaTb@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qk2y3AlxrgK-76dOJneikCDLmtLUnLTjFJCADS-FZ-Y_1746805145
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.413,
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

On Fri, 9 May 2025 14:51:07 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> On Thu, May 08, 2025 at 03:35:29PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Date: Thu,  8 May 2025 15:35:29 +0200
> > From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Subject: [PATCH v4 06/27] hw/nvram/fw_cfg: Rename fw_cfg_init_mem_wide(=
) ->
> >  fw_cfg_init_mem_dma()
> > X-Mailer: git-send-email 2.47.1
> >=20
> > "wide" in fw_cfg_init_mem_wide() means "DMA support".
> > Rename for clarity.
> >=20
> > Suggested-by: Zhao Liu <zhao1.liu@intel.com>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >  include/hw/nvram/fw_cfg.h | 6 +++---
> >  hw/arm/virt.c             | 2 +-
> >  hw/nvram/fw_cfg.c         | 6 +++---
> >  hw/riscv/virt.c           | 4 ++--
> >  4 files changed, 9 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> > index d5161a79436..c4c49886754 100644
> > --- a/include/hw/nvram/fw_cfg.h
> > +++ b/include/hw/nvram/fw_cfg.h
> > @@ -309,9 +309,9 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uin=
t32_t dma_iobase,
> >                                  AddressSpace *dma_as);
> >  FWCfgState *fw_cfg_init_mem_nodma(hwaddr ctl_addr, hwaddr data_addr,
> >                                    unsigned data_width);
> > -FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
> > -                                 hwaddr data_addr, uint32_t data_width=
,
> > -                                 hwaddr dma_addr, AddressSpace *dma_as=
);
> > +FWCfgState *fw_cfg_init_mem_dma(hwaddr ctl_addr,
> > +                                hwaddr data_addr, uint32_t data_width,
> > +                                hwaddr dma_addr, AddressSpace *dma_as)=
; =20
>=20
> There's one more use in latest master:
>=20
> git grep fw_cfg_init_mem_wide
> hw/loongarch/fw_cfg.c:    fw_cfg =3D fw_cfg_init_mem_wide(VIRT_FWCFG_BASE=
 + 8, VIRT_FWCFG_BASE, 8,

with that fixed:
  Reviewed-by: Igor Mammedov <imammedo@redhat.com>


