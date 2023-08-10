Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4963CC001B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:10:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU9Ai-00052C-GI; Thu, 10 Aug 2023 13:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9Ah-0004wo-0e; Thu, 10 Aug 2023 13:10:03 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9Af-0006gW-BY; Thu, 10 Aug 2023 13:10:02 -0400
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-79aa1f24ba2so337347241.2; 
 Thu, 10 Aug 2023 10:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691687400; x=1692292200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NWXbUpki0WpFVeqzKegX1vROjVTGZR59+MlQpz04dt0=;
 b=l9B9locMT5hlmaz7mOkkxdWVD3rAQKZX4NVeT+9szRUaekd9RLR+WVcNk63oBDx1qb
 CPgWbQJ6XkUvnMCFFdRF7/ZvqaOr46I1iniJCwjWSsoNN+EecYYkzj7pSkhGn5GpeAiB
 7BxkvYkYwEz0D53Jk59by90ug1masSI5dD++xQYiiB4SzyCbXUcs3PD5RlYVw8KZQ1uv
 eriesTw22KFCJcajrRvEyHIJxbK6nndxJ2Olsqp5HNy/9m9urv+tOfFd0hXyLBj+X6VT
 yda12uF4UeHKkg1Cn+AeYVQKWfDTlUAapp5eqpC64+UvQktFdZsHzWFJ2ZTEwy5HVr1G
 ShPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691687400; x=1692292200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NWXbUpki0WpFVeqzKegX1vROjVTGZR59+MlQpz04dt0=;
 b=HgMuQZK76gpIJTDQ87/yzYFQHL4A80i1xH2BWf1g+XvKV4vq9SkC475/VqRLo4mfpq
 JnyKWpqVf6vsfbCDUU7JDIg4/CEzOUXyxYVXSmH0FEp337To2uX/PNr6bxFjqP+7FOp2
 nppr7dDz9hI1FoxghPGrXnLv3mXfgyQgNLTG8CkO9qt2VC0Js3F0JKtWWKrocraoJCQz
 2uhDMD7hoJPc1ShALbvMR2tqITFqrvvVdty6F6jTu9+SaIwOWnW9+gRcpfqdXCHV4JZR
 2+7erhYaU1K837AFOSnhawHIl5H8zh3AM9vfSLF1OIRLDVJ5r8equkh4CKMgT6OHc5X6
 j46A==
X-Gm-Message-State: AOJu0Yz61Js/hd3EI4Y4Zcvgn1LbAm3EaMD5vKBgrxkaMoq6UfIEOaQr
 04Hh0Z3q4n1VC6YemPpUFlHDqN5HQvN8HKkhxuQ=
X-Google-Smtp-Source: AGHT+IHaJNqdG8pH0uNryiSg8YQLSmxAMmsrGF1VkAUBFqAADtpKZdlOjbbCDO26NT9eiHE+Aynfb6G+3VZM9cmRj8M=
X-Received: by 2002:a67:fe12:0:b0:447:925c:a047 with SMTP id
 l18-20020a67fe12000000b00447925ca047mr1884195vsr.26.1691687400136; Thu, 10
 Aug 2023 10:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230803131424.40744-1-negge@xiph.org>
 <c8bf0c5f-6cc8-cc1b-9b26-bcb2512bcc87@tls.msk.ru>
In-Reply-To: <c8bf0c5f-6cc8-cc1b-9b26-bcb2512bcc87@tls.msk.ru>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 13:09:33 -0400
Message-ID: <CAKmqyKPFG8jJsxknYneom2iQ3SWT1RyGcsiDD8SVkT2Jv_Aqew@mail.gmail.com>
Subject: Re: [PATCH] linux-user/elfload: Set V in ELF_HWCAP for RISC-V
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Nathan Egge <negge@xiph.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Aug 8, 2023 at 2:37=E2=80=AFAM Michael Tokarev <mjt@tls.msk.ru> wro=
te:
>
> 03.08.2023 16:14, Nathan Egge wrote:
> > From: "Nathan Egge" <negge@xiph.org>
> >
> > Set V bit for hwcap if misa is set.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1793
> > Signed-off-by: Nathan Egge <negge@xiph.org>
> > ---
> >   linux-user/elfload.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> > index 861ec07abc..a299ba7300 100644
> > --- a/linux-user/elfload.c
> > +++ b/linux-user/elfload.c
> > @@ -1710,7 +1710,8 @@ static uint32_t get_elf_hwcap(void)
> >   #define MISA_BIT(EXT) (1 << (EXT - 'A'))
> >       RISCVCPU *cpu =3D RISCV_CPU(thread_cpu);
> >       uint32_t mask =3D MISA_BIT('I') | MISA_BIT('M') | MISA_BIT('A')
> > -                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C');
> > +                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C')
> > +                    | MISA_BIT('V');
>
> Is smells like a -stable material (incl. 7.2), is it not?

I think so as well

Alistair

>
> Thanks,
>
> /mjt
>

