Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzKuP-00011l-5C
	for mharc-qemu-riscv@gnu.org; Thu, 09 Jun 2022 12:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nzKuM-0000uP-RT
 for qemu-riscv@nongnu.org; Thu, 09 Jun 2022 12:21:18 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nzKuG-0002CJ-Rn
 for qemu-riscv@nongnu.org; Thu, 09 Jun 2022 12:21:18 -0400
Received: by mail-wm1-x32f.google.com with SMTP id z17so7847564wmi.1
 for <qemu-riscv@nongnu.org>; Thu, 09 Jun 2022 09:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kvCp9Ti3iYX61KhF85MTGFcRglWIgqZxvtulohUisII=;
 b=BU21Kb14IXzaYZZypICuNrYUVBiP2kGeUXmrd5gm4XAh4O3+ATuQYFg2TZdxW9Ur7M
 AG7W3NyGO9G46TA5+r8P3OgY/NZ5GUTmMZaDtIy7tIc3ZgVzYBnlXNvcNKDnXTvQi3+c
 lrbAjYz95FHCoqIs3vCGPIpe3U5xawnbnxaD9pXif8N0KQTzyUDqO5H8Pq3dgbD1nmRz
 eGSL8BW4EBb5e0D1pMygIVq8BiWEuzducFvodErbL0ug0k2AO++gNoxbZAEPEiKstF8C
 z8ULb3+Fo5RjDmBivglIQC5slYMhTjsCxgqRcIwGnQZ1iaLVgTynm35ow5jsgpz8pO1z
 Gj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kvCp9Ti3iYX61KhF85MTGFcRglWIgqZxvtulohUisII=;
 b=bsCOznitJQ854gnlwoM3dsFNMY85p4KNyD87meo6gDQtpyt2153jsC7qE0cMYA+/Ry
 L20JZH71UU85jlE+mhaFx5j+bTzdVYL8BuReF1g3PVIffLDXdoT+cXC/uXQY24egTIh8
 7DI6lRBv42DAYTAv5D0axXj6VphSXafaYupI7w76FOm9JJLrIovpBLzJDC9NuKIuyQu2
 LKCXax+A2GaDo235zro3A3p5sbZ4KM+RoC9WwADNlDzyw0YYbnYXeZMHdlRyKL96eMNJ
 xvljzY61PC7bf0Cv1FHBW/qryHaN5qslTN8PZRDqoFcC302X8RcpYOwiQfKDNs4sXEbx
 P0Jw==
X-Gm-Message-State: AOAM53001bESb/2tE40CNATBreF0ESyFdIuujGpFIEJTDjnkTYbiwDiH
 iqNflZXGIiruUvKqBqYBAEmgWkJmgf19quxmTNh7Kg==
X-Google-Smtp-Source: ABdhPJwp9AwN9lS9HKfEPk6Ks+r/E1qN4YXpEic2pX8o52bvDdJZhydX/Eel1g1qFY1YEgWKkR/ZvqVU9jSGLcjZ/g4=
X-Received: by 2002:a05:600c:1d23:b0:39c:4215:72f9 with SMTP id
 l35-20020a05600c1d2300b0039c421572f9mr4138941wms.137.1654791668799; Thu, 09
 Jun 2022 09:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220608161405.729964-1-apatel@ventanamicro.com>
 <20220608161405.729964-5-apatel@ventanamicro.com>
 <6455580a-7344-8531-cd2c-708f8ddfb04b@linaro.org>
 <CAAhSdy1JeAuz0YtMdKQjeJHpEG5_BL35v+OWiGsiPn4WgAsOaQ@mail.gmail.com>
 <8e48300c-9b30-728b-22ab-652476015975@linaro.org>
In-Reply-To: <8e48300c-9b30-728b-22ab-652476015975@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Jun 2022 21:50:56 +0530
Message-ID: <CAAhSdy3jaAWotCRcyNDrvHBu5q-LE+N5YuC7-z92TUP5-6UY_Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] target/riscv: Force disable extensions if priv
 spec version does not match
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::32f;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 09 Jun 2022 16:21:19 -0000

On Thu, Jun 9, 2022 at 7:28 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/8/22 20:16, Anup Patel wrote:
> > On Wed, Jun 8, 2022 at 10:23 PM Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 6/8/22 09:14, Anup Patel wrote:
> >>> +    struct isa_ext_data isa_edata_arr[] = {
> >>
> >> static const?
> >
> > Using const is fine but we can't use "static const" because
> > the "struct isa_ext_data" has a pointer to ext_xyz which
> > is different for each CPU.
>
> Ah, I see.  Perhaps better to use offsetof then -- the data structure is not small...

I agree. Using offsetof() is a much better approach.

Thanks,
Anup

>
>
> r~

