Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57C5C3ABC3
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 May 2025 15:36:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uDPlF-0002VG-RA; Fri, 09 May 2025 11:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uDPl4-0002Sw-Cc
 for qemu-riscv@nongnu.org; Fri, 09 May 2025 11:35:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uDPl0-00012A-ST
 for qemu-riscv@nongnu.org; Fri, 09 May 2025 11:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746804925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KvgodsRX5jVPKQKXhLVAtbiUkGwGclYVHGBsI+/pme4=;
 b=ZFGbZw/ORZvsvZ8/aZoqiIKWUdl8L6xW1T0cFtqaT7C8FEvTOK/GnABDON/13HFM+uAgfR
 dq8B9nxYak79efMcbTbZ0jg0sGJ7JTajzLAlBWqL9hr5GnQN2f2k3Ntl8w6JpsFHlBoXHs
 mL5fxQZgpcCZGFuO2pI/r+ZXLNimbng=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-wC_v6PsFNhiX0jqNMrRI7g-1; Fri, 09 May 2025 11:35:24 -0400
X-MC-Unique: wC_v6PsFNhiX0jqNMrRI7g-1
X-Mimecast-MFC-AGG-ID: wC_v6PsFNhiX0jqNMrRI7g_1746804923
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43e9a3d2977so15128665e9.1
 for <qemu-riscv@nongnu.org>; Fri, 09 May 2025 08:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746804923; x=1747409723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KvgodsRX5jVPKQKXhLVAtbiUkGwGclYVHGBsI+/pme4=;
 b=SLSS3kwLJzKZ/YoqIlbFdPD/UlAsyDVOuJQfwkmT65enwaAGF/oOd7a4X5R6EI4i8D
 BQHgdE6Bdi918wfluUKyCiAzgFqhz5LJIpe5+amu/62wr+cclkQDVaIdu4FXdt9we4JJ
 uPUwmqBAXIDCt0h3Av1JxJ+DgpQW9vGHeGQrTO7M/7KBJFIN/nZoQ1X6fyi8ly/bKN/U
 cjyDGGy4axUH3Ocov8EGlFG3au0hA5rSWL8rDh0c5WrmGvm27EvLLhJGJBPREa6LlJYG
 QUPIxyBnBJ6ZbdCwAiX2VnuEpDj57R+A20d8or9CbTcaN3woU8UgRkwIYgngHv+MW5A3
 FHMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY8mPjyFtCGamGr457UokvfgSDWiTVeDzJTVgJemA7qxVrQBSlv6vgmGv9b+ww1uRAAD7ASEgOizHQ@nongnu.org
X-Gm-Message-State: AOJu0Yzn3uAzn9jec78Ze639Sb3rdEwDl5CHvwAy5K7q3ErNhNAOXLZj
 Wure21B/DC3kbv6gtk7Cr1ds6UNUX2s7Gr50KSdbJvaF89BZ/hFh/Ky7WHJka9lzkFumI6wN/3u
 g/nHXxwcbyRSg0kLOn7g2usQCFK/hZp4CZ9vUhAC+uiixE3ttj5BW
X-Gm-Gg: ASbGncsqmc4Y8gb+9tM65dYObUxqLTQZNOp1y2CpA1ESzFdtMx1RYTnPuMd32DJPgv3
 3t0YvM9BHlrKJUe6ELClb+auOFpQi+Vs13ySmMe1LklN2V5plzy2v4Be4i34rcfglnLr+DnnwL9
 vI5vyw2Vx//fb79gCR5pM+sbGxSvosEdRWuPalcBQMvSm84Ea1AfuNEDq1IRCHn9WRs2tDOOjoq
 lSJ8O60Gg8g8AM/pFy0JhQm+tZ7fJo7dp7WcXlAc3XHgV8WJlCxuiaRQvUCadzB+YJS2SqtFUVq
 us6XjXTXHDH4ZDMY0lubPozIxmuWHgOK
X-Received: by 2002:a05:600c:1d8c:b0:43c:fe85:e4ba with SMTP id
 5b1f17b1804b1-442d6d6477amr38265425e9.15.1746804923110; 
 Fri, 09 May 2025 08:35:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNyAfppT9uee9ogVYiyR4nXpot/QB0mvHEteKSSPEKtPIA4s/28JMxoH1SBEhBGoRPk3h89g==
X-Received: by 2002:a05:600c:1d8c:b0:43c:fe85:e4ba with SMTP id
 5b1f17b1804b1-442d6d6477amr38264785e9.15.1746804922673; 
 Fri, 09 May 2025 08:35:22 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f1eesm76794905e9.9.2025.05.09.08.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 08:35:22 -0700 (PDT)
Date: Fri, 9 May 2025 17:35:19 +0200
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
Subject: Re: [PATCH v4 04/27] hw/mips/loongson3_virt: Prefer using
 fw_cfg_init_mem_nodma()
Message-ID: <20250509173519.50d4f073@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-5-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-5-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0aMGnJTSLNf6dX8ycYQrpNWOLAtKWxdkzfaJVSGMBpE_1746804923
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

On Thu,  8 May 2025 15:35:27 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> fw_cfg_init_mem_wide() is prefered to initialize fw_cfg
> with DMA support. Without DMA, use fw_cfg_init_mem_nodma().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/mips/loongson3_virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
> index de6fbcc0cb4..654a2f0999f 100644
> --- a/hw/mips/loongson3_virt.c
> +++ b/hw/mips/loongson3_virt.c
> @@ -286,7 +286,7 @@ static void fw_conf_init(void)
>      FWCfgState *fw_cfg;
>      hwaddr cfg_addr =3D virt_memmap[VIRT_FW_CFG].base;
> =20
> -    fw_cfg =3D fw_cfg_init_mem_wide(cfg_addr, cfg_addr + 8, 8, 0, NULL);

just a question, given it's a rather modern machine is there a reason
why it is not using DMA here?

> +    fw_cfg =3D fw_cfg_init_mem_nodma(cfg_addr, cfg_addr + 8, 8);
>      fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)current_machine->sm=
p.cpus);
>      fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)current_machine->s=
mp.max_cpus);
>      fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, loaderparams.ram_size);


