Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B37AC04A6A
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 16:28:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU8Vx-0001cL-Fd; Thu, 10 Aug 2023 12:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qU8Vv-0001bZ-Ou
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 12:27:55 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qU8Vu-0005nd-7j
 for qemu-riscv@nongnu.org; Thu, 10 Aug 2023 12:27:55 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so4601111a12.1
 for <qemu-riscv@nongnu.org>; Thu, 10 Aug 2023 09:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1691684872; x=1692289672;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=C8Cbnso3vD8+597taGUvzRvoyBCfNeLDLEZG6kTdJeQ=;
 b=bMvTQEafZFqisodorzas3YDYKLbv9+PTCRs5QlHROZ94/TAuP2xPj+dcFAhHjYvz0A
 1/cMxvrQXXXF2Fv1V+0B1W1GrGv/h8lRuHJv+DRDfBBmppc2gkS8ArJXU/o1j9SsYRfL
 /ZrXuYUaQiah3xS+6l5Yv+FT7nhnI/vqIPYh+gmJ5treTf8CsTm7/maPFMyAoBYhbekC
 hCJwwS6b/Ge6FnaFadpBmr88o4OqSNCH1ZNMFdM5sLkK3Wgd6VTw+GBCUn3ybnc84R47
 Ue02ondqkQIXLuulS2Cbmhy1ePWUVSl39jWvRy7z3etn4KtruY7kF/tO+apjFj91wkar
 Fhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691684872; x=1692289672;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C8Cbnso3vD8+597taGUvzRvoyBCfNeLDLEZG6kTdJeQ=;
 b=NVfDgOpHcAEOzvPcMxHpa85RKcnVVSg1abSzEr8pzz4Xw5xj53Yk4nMWUhkl9RNFPp
 4UyfqPZ6cXvegpcgxrnWvSgk6kV/DzeKwLTJpZiSQleaB0MtSwA+VagOVkK2r3fZePUr
 IBdoLvYb7ml5Cjn8OE4PRw98cM39PlKNn9nr/eKb0t0nmjwzmRWBriCgUoujN7EzvzPk
 TmH6fQdFgY8NquHXDAdH0Smz+sBYcUR3ZR3RoHJIZoxuB0NQZcR9rpiO/5VVBzKwSNVW
 xdfjsLvqbQsXf1wiJVo09l1gC2XGK0235Ll/+Kc10X1Lw55U2zdFpfe18ANCoobLYLV6
 b7gA==
X-Gm-Message-State: AOJu0YxW+8eMRNVsDqNrIhy4qyIV6aHjsdwUWWkcO9zQExxs78r+Xi3F
 BN7Kj/4ZHrWyGu3HT001CqvlMA==
X-Google-Smtp-Source: AGHT+IGZ/grDVXYl06fRmzfwxRHpDLb4JM1ScILx+We8HT1fPD27+KLPa3SXTSfdDYZMoD5rwvfqVA==
X-Received: by 2002:aa7:d812:0:b0:521:728f:d84e with SMTP id
 v18-20020aa7d812000000b00521728fd84emr3361773edq.0.1691684872102; 
 Thu, 10 Aug 2023 09:27:52 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 q20-20020aa7cc14000000b005223e54d1edsm991392edt.20.2023.08.10.09.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 09:27:51 -0700 (PDT)
Date: Thu, 10 Aug 2023 18:27:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: rbagley@ventanamicro.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com
Subject: Re: [PATCH] disas/riscv: Further correction to LUI disassembly
Message-ID: <20230810-e160f9edae60ded9d2606b8b@orel>
References: <20230810-c9e1f2783168b48bc07a1aa2@orel>
 <mhng-a6344a0c-8820-41b5-a015-b82b261b463d@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-a6344a0c-8820-41b5-a015-b82b261b463d@palmer-ri-x1c9>
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x535.google.com
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

On Thu, Aug 10, 2023 at 09:12:42AM -0700, Palmer Dabbelt wrote:
> On Thu, 10 Aug 2023 08:31:46 PDT (-0700), ajones@ventanamicro.com wrote:
> > On Mon, Jul 31, 2023 at 11:33:20AM -0700, Richard Bagley wrote:
> > > The recent commit 36df75a0a9 corrected one aspect of LUI disassembly
> > > by recovering the immediate argument from the result of LUI with a
> > > shift right by 12. However, the shift right will left-fill with the
> > > sign. By applying a mask we recover an unsigned representation of the
> > > 20-bit field (which includes a sign bit).
> > > 
> > > Example:
> > > 0xfffff000 >> 12 = 0xffffffff
> > > 0xfffff000 >> 12 & 0xfffff = 0x000fffff
> > > 
> > > Fixes: 36df75a0a9 ("riscv/disas: Fix disas output of upper immediates")
> > > Signed-off-by: Richard Bagley <rbagley@ventanamicro.com>
> > > ---
> > >  disas/riscv.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/disas/riscv.c b/disas/riscv.c
> > > index 4023e3fc65..690eb4a1ac 100644
> > > --- a/disas/riscv.c
> > > +++ b/disas/riscv.c
> > > @@ -4723,9 +4723,12 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
> > >              break;
> > >          case 'U':
> > >              fmt++;
> > > -            snprintf(tmp, sizeof(tmp), "%d", dec->imm >> 12);
> > > -            append(buf, tmp, buflen);
> > > -            if (*fmt == 'o') {
> > > +            if (*fmt == 'i') {
> > > +                snprintf(tmp, sizeof(tmp), "%d", dec->imm >> 12 & 0xfffff);
> > 
> > Why are we correcting LUI's output, but still outputting sign-extended
> > values for AUIPC?
> > 
> > We can't assemble 'auipc a1, 0xffffffff' or 'auipc a1, -1' without getting
> > 
> >  Error: lui expression not in range 0..1048575
> > 
> > (and additionally for 0xffffffff)
> > 
> >  Error: value of 00000ffffffff000 too large for field of 4 bytes at 0000000000000000
> > 
> > either.
> > 
> > (I see that the assembler's error messages state 'lui', but I was trying
> > 'auipc'.)
> > 
> > I'm using as from gnu binutils 2.40.0.20230214.
> > 
> > (And, FWIW, I agree with Richard Henderson that these instructions should
> > accept negative values.)
> 
> I'm kind of lost here, and you saying binutils rejects this syntax?  If
> that's the case it's probably just an oversight, can you file a bug in
> binutils land so folks can see?

Will do.

Thanks,
drew

> 
> > 
> > Thanks,
> > drew
> > 
> > 
> > > +                append(buf, tmp, buflen);
> > > +            } else if (*fmt == 'o') {
> > > +                snprintf(tmp, sizeof(tmp), "%d", dec->imm >> 12);
> > > +                append(buf, tmp, buflen);
> > >                  while (strlen(buf) < tab * 2) {
> > >                      append(buf, " ", buflen);
> > >                  }
> > > --
> > > 2.34.1
> > > 
> > > 

