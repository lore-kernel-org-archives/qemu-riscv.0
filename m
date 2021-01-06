Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kwwJF-0004A7-JC
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jan 2021 19:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwwJE-00049d-4i; Tue, 05 Jan 2021 19:04:16 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:34866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwwJC-0008P6-G9; Tue, 05 Jan 2021 19:04:15 -0500
Received: by mail-yb1-xb32.google.com with SMTP id u203so1223517ybb.2;
 Tue, 05 Jan 2021 16:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=97yuiXhl7A44/1z+75UUaMtlehrjZolCLPlNZ9ATrxw=;
 b=okOYrjvj4Lmm06fv7kkDGDbkhCDIEU0c6ZxRG2gWkrnkzaCQSQFwYgg00GKXxzRSEw
 DhpUZhbqq4iwLlbJxNsvuvJn/bk7i3QA2LGj+7amjicl22MEXEzb9YRyT8Rwo8zFpM2F
 0UgKvVjoTiJbToz/+TcCWZwZcCgqbxXK8er4XWcNUTcPm02fdQrTApI4HQmkUdv7hYU4
 v8UOjUfYlSAB6jRz0brhAF7NmGfZv9awFDnjGXdnW4Bls6RKpYFfwVlSbjvfMTeucMEv
 KN8uzBdJgHMrBwNEX8wR9OOXdhRrnbRojaK55Vw8qVpQ0eIGBFxtlZJfyWGbBca60u2R
 VabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=97yuiXhl7A44/1z+75UUaMtlehrjZolCLPlNZ9ATrxw=;
 b=U8b8fuciVDnaOKxVpDGj/6X90FTRHtQnOZ/55yZ35pYJXwEF2XwHHIt6yDrRRa1Dbh
 Z84bVAXDHOCEML8bUfjHVUzxuK96MrmST/sJ5QzukkY9Px6aSW+Ab1jWPLDH4WFsNqyy
 f5XaZ+U+kBDrgsqf6OsGKyOLfcBCDI4MmaTVei4Bib7JV3n9bEUrOHRlhLoJWXO2FO8H
 PIgW3Rxv9METOaIypwf+oC5IORMo/FKGHJez9G3YPCChNDjUP+0RNfUqbmg7sq9zw5b3
 Qu0X9kuPdQLXx2qJhJGkXpVwsQC1rLhITihLA39kjmLlHlb1UgxXaQZnmkO0JehSplVv
 Vjkw==
X-Gm-Message-State: AOAM532NrPctq8i9lnu0bTmo/wNcz2cBYk7pJce/m9JdL3OEuXyTO5X+
 rsJlKehNKOyeJJd70568OZAeE20UZs239tG2Hkw=
X-Google-Smtp-Source: ABdhPJx+g7oXAzauxo4ncGHXpcMb+0JSmaOTyiZsOps/hyLyM5Dz8Zaoip2hUfYnALP5KWwHiZBAAxuF909xuLDsMDw=
X-Received: by 2002:a25:690b:: with SMTP id e11mr2765358ybc.314.1609891452784; 
 Tue, 05 Jan 2021 16:04:12 -0800 (PST)
MIME-Version: 1.0
References: <20201217214826.2094617-1-atish.patra@wdc.com>
 <CAEUhbmVc_SABW_0PKgDMY8t3zTujo4xUnNW3fz1YuWhqXWnV2A@mail.gmail.com>
 <76741a2677ed1d7ae0fc4ff887e5eede58275734.camel@wdc.com>
In-Reply-To: <76741a2677ed1d7ae0fc4ff887e5eede58275734.camel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 6 Jan 2021 08:04:02 +0800
Message-ID: <CAEUhbmVgV3tm6V5HwEgt1Dmw6XKqU0NK5nCo7qxQvVNk_jwtKA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
To: Atish Patra <Atish.Patra@wdc.com>
Cc: Anup Patel <Anup.Patel@wdc.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jan 2021 00:04:16 -0000

Hi Atish,

On Wed, Jan 6, 2021 at 7:44 AM Atish Patra <Atish.Patra@wdc.com> wrote:
>
> On Tue, 2021-01-05 at 11:11 +0800, Bin Meng wrote:
> > On Fri, Dec 18, 2020 at 5:48 AM Atish Patra <atish.patra@wdc.com>
> > wrote:
> > >
> > > Currently, we place the DTB at 2MB from 4GB or end of DRAM which
> > > ever is
> > > lesser. However, Linux kernel can address only 1GB of memory for
> > > RV32.
> > > Thus, it can not map anything beyond 3GB (assuming 2GB is the
> > > starting address).
> > > As a result, it can not process DT and panic if opensbi dynamic
> > > firmware
> > > is used.
> > >
> > > Fix this by placing the DTB at 2MB from 3GB or end of DRAM
> > > whichever is lower.
> > >
> >
> > Fixes: 66b1205bc5ab ("RISC-V: Copy the fdt in dram instead of ROM")
> >
>
> Just to clarify, it is not a bug in the original patch. This bug
> appeared in recent kernel because kernel(from v5.10) doesn't use fixmap
> for DT processing anymore. Thus, the DT has to be placed at location
> that can be addressed by kernel.

Thanks for the clarification.

>
> I will add the fixes tag.
>

Did you get a chance to trace to another possible kernel bug?

Regards,
Bin

