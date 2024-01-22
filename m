Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508A9C47DAF
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 12:59:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRtth-00034k-HN; Mon, 22 Jan 2024 07:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rRttg-00034O-0X
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 07:59:28 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rRttd-0004aQ-Vr
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 07:59:27 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40eaf973eb4so6010405e9.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 04:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705928364; x=1706533164; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MOPR5bxC1m/BokLT338sLw1/b+YqUpMIBSbYxu2qcPQ=;
 b=gUlwDbT5GsfEaEwgafVynmT2HJLG3qFxW2FOxZXfG7Edj8SOTwbbVKzB6caX7Fu+OV
 1GZjvy//8/gWb2aIubBE0YW2zaWuXzJY0IJyZ7D0nAk1p8qWZgzhAbG8eCo3Q5+4g/tg
 Bqvo4omaShwgLt2CGF9QsC+N6n7pGuQc54j8PwH92NvXcfIbRSmA7VSROqDrJWNSt0rh
 vA8vSFo/szTzTN+Lkj3XfUlnww9HK9mc/ONKpfpBcv5lZBpK6JNc8/g4eg2VHWHGQE+K
 U7KTpaRQYv8PrZqDmWZNP0RiMltVt+e5h4IbP93GwKogSWqvdptxAjyUxqm3gwztBeCQ
 qM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705928364; x=1706533164;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MOPR5bxC1m/BokLT338sLw1/b+YqUpMIBSbYxu2qcPQ=;
 b=XQ4NpKnJxSxLKXxjvktK7EsjWHuEQkPvA55xAHnfC/WMMwoR4k0xkS4FlCZgHUntbS
 3nwU5Szu/YhBwq3worpPQaDSaG2jn+Cd4sktLElxeMX/YpoALgxvkUGOZ9K86N/2QtsR
 eMzokMf5ErOlEbNMpWmUVrxkjrmMs62oFjicLzHstQtVk6Y6TET78y8nylATt553rcuk
 txR4UkqwE74cdXqauuOZCvWpugOBDytK/fotWB44KgQnCe852SfXO4VpFD51jm8nM411
 L8G4tEvn2CIHtVTLG+S1aeqTD7roHuEDeCPLqenBj9nm62uCzXg52DFs9N4wMQZ0V0Km
 EPvQ==
X-Gm-Message-State: AOJu0YzuSAMbr9uI3y25phvPAYgw42wb/9vEg20gqVaRF6JiPUD0Dph4
 B6YkGbVvoHuBw74gxkoS4cgxoSv0K+CtDuDHI9t7ZJDA+MQsL1/d7PdYG/ppHBk=
X-Google-Smtp-Source: AGHT+IELkB+yJbzV48TuraZyn6u6PtFoCXHSStD/VUDYo4NejbNmmKrvl6vAIR/keyKgJ35t+r4Zfg==
X-Received: by 2002:a05:600c:474d:b0:40e:a100:62fa with SMTP id
 w13-20020a05600c474d00b0040ea10062famr2118639wmo.146.1705928364240; 
 Mon, 22 Jan 2024 04:59:24 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a05600c310400b0040e88d1422esm18936838wmo.31.2024.01.22.04.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 04:59:23 -0800 (PST)
Date: Mon, 22 Jan 2024 13:59:22 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: Re: [PATCH v2 3/4] target/riscv: SMBIOS support for RISC-V virt
 machine
Message-ID: <20240122-195c4a8d0ece609441068e16@orel>
References: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
 <20231229120724.41383-4-heinrich.schuchardt@canonical.com>
 <20240122-4f4cbce3692cd684e0409f9e@orel>
 <22105210-d8d1-4808-b9ed-41eee71c53ca@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22105210-d8d1-4808-b9ed-41eee71c53ca@canonical.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, Jan 22, 2024 at 01:28:18PM +0100, Heinrich Schuchardt wrote:
> On 22.01.24 10:57, Andrew Jones wrote:
> > On Fri, Dec 29, 2023 at 01:07:23PM +0100, Heinrich Schuchardt wrote:
...
> > > +#if defined(TARGET_RISCV32)
> > > +    smbios_set_default_processor_family(0x200);
> > > +#elif defined(TARGET_RISCV64)
> > > +    smbios_set_default_processor_family(0x201);
> > > +#endif
> > 
> > I think we should use misa_mxl_max to determine the family, rather than
> > TARGET_*, because, iirc, we're slowly working our ways towards allowing
> > rv32 cpus to be instantiated with qemu-system-riscv64.
> 
> Hello Andrew,
> 
> thank you for reviewing. I guess you mean something like:
> 
>     if (riscv_is_32bit(&s->soc[0])) {
>         smbios_set_default_processor_family(0x200);
> #if defined(TARGET_RISCV64)
>     } else {
>         smbios_set_default_processor_family(0x201);
> #endif
>     }

Yes, but I'm not sure we need the #ifdef around the 64-bit part.

> 
> riscv_is_32bit returns harts->harts[0].env.misa_mxl_max == MXL_RV32.
> 
> Some real hardware has a 32bit hart and multiple 64bit harts. Will QEMU
> support mixing harts with different bitness on the virt machine in future?
> In that case we would have to revisit the code using misa_mxl_max in
> multiple places.
> 

Never say never, but I don't think there has been much effort to support
these types of configurations with a single QEMU binary. My googling is
failing me right now, but I seem to recall that there may have been
efforts to implement Arm big.LITTLE with multiprocess QEMU [1]. IOW, I
think we're safe to use misa_mxl_max, since we'll have one for each QEMU
instance and we'll use a different QEMU instance for each hart bitness.

[1] docs/system/multi-process.rst

Thanks,
drew

