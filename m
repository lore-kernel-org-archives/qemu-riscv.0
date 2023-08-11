Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC1FC04E69
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 08:26:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUNT5-0007vb-FC; Fri, 11 Aug 2023 04:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qUNT4-0007vB-5W
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 04:25:58 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qUNT2-0006y3-EH
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 04:25:57 -0400
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-317c1845a07so1555957f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 01:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1691742354; x=1692347154;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EIoEt7e12qXekBmQEPcabfMiNapP5mbwygSwiLINSSI=;
 b=Gv2J5NeItyMdgIv56m/UQMK8CT4pDIEhfZFIMhH6CMlaEPuN/l2BFM4NOaqyZNa/yo
 2I4B3u2Hr12ZFwL4D23LzJK1Mpkdkn1ibNKmTpC5XPuHr64E9oGR/ZMTia58jF/oJ8ZJ
 xrtnw7ZOmZ0RpLsQpFfFmY10sHhxTwwhut3xbzWqokgIBsxxrXnvs5lwtsi5xBP2eilk
 xXdRVeGC3MPXUVOvmf6k56CPXe8LEfacH/wOBktRinsPBm+Ml9BiULJ/G8KwOfTCGlHk
 lixPAe9DVewM++2P+grl+c8MzRUbiFM2zurzbxfu1ZNiQu093UQ08l6S5YFsLj9KSI50
 KJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691742354; x=1692347154;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EIoEt7e12qXekBmQEPcabfMiNapP5mbwygSwiLINSSI=;
 b=fAnF+6OQsLFQlOYVRJyL5RN3uPT+dQlAOyQUMrzuEvRSCLUyJSb52dcPLsaOQgCmG8
 TIxjwhNKsst3WqtO79Umj6ZBj+Bdjzvw5Cbv92gJExqIEqE+OSGll11B24tXZP8Wb30q
 fABYVyv3ofZ2lIJRUPDFk+Xp+PpiuxMSZWdXKb5a735OTVeDWGIZINwaYF/a6YIcKpnw
 BwKLc7YGcEBdMPwZBFK+FehDFsJWRtw2sv8aUcsE0/DGuJ3SPOozLlv+5Mo/4kX3iTZt
 oUtKCqwnIOuIe/SFO4/F1UXPjnBekpFlAn3x3lFBXtrhn9csDVFiKK0RcokT4L4qvVPp
 MmWQ==
X-Gm-Message-State: AOJu0YwNeJnX1EFaoq3KAPcdylJLih44ipYHuKgfRH/OlF7lzMxvqZH6
 GbAf9STOT9PDB9ilpIUPiYzVHQ==
X-Google-Smtp-Source: AGHT+IGHgDSGkXBGxD39wiezrvmPVBNhXhE18QC9QefkAyO6R/zMHLh5/sEf1XXkrF0QSmCCqpfEOw==
X-Received: by 2002:a5d:55cc:0:b0:317:3f0e:8cb1 with SMTP id
 i12-20020a5d55cc000000b003173f0e8cb1mr770939wrw.45.1691742353815; 
 Fri, 11 Aug 2023 01:25:53 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a5d5089000000b0031434c08bb7sm4669985wrt.105.2023.08.11.01.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 01:25:53 -0700 (PDT)
Date: Fri, 11 Aug 2023 10:25:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: rbagley@ventanamicro.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com
Subject: Re: [PATCH] disas/riscv: Further correction to LUI disassembly
Message-ID: <20230811-bc15b48d336b79d9ec1f0936@orel>
References: <20230810-c9e1f2783168b48bc07a1aa2@orel>
 <mhng-a6344a0c-8820-41b5-a015-b82b261b463d@palmer-ri-x1c9>
 <20230810-e160f9edae60ded9d2606b8b@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810-e160f9edae60ded9d2606b8b@orel>
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x442.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, Aug 10, 2023 at 06:27:50PM +0200, Andrew Jones wrote:
> On Thu, Aug 10, 2023 at 09:12:42AM -0700, Palmer Dabbelt wrote:
> > On Thu, 10 Aug 2023 08:31:46 PDT (-0700), ajones@ventanamicro.com wrote:
> > > On Mon, Jul 31, 2023 at 11:33:20AM -0700, Richard Bagley wrote:
> > > > The recent commit 36df75a0a9 corrected one aspect of LUI disassembly
> > > > by recovering the immediate argument from the result of LUI with a
> > > > shift right by 12. However, the shift right will left-fill with the
> > > > sign. By applying a mask we recover an unsigned representation of the
> > > > 20-bit field (which includes a sign bit).
> > > > 
> > > > Example:
> > > > 0xfffff000 >> 12 = 0xffffffff
> > > > 0xfffff000 >> 12 & 0xfffff = 0x000fffff
> > > > 
> > > > Fixes: 36df75a0a9 ("riscv/disas: Fix disas output of upper immediates")
> > > > Signed-off-by: Richard Bagley <rbagley@ventanamicro.com>
> > > > ---
> > > >  disas/riscv.c | 9 ++++++---
> > > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/disas/riscv.c b/disas/riscv.c
> > > > index 4023e3fc65..690eb4a1ac 100644
> > > > --- a/disas/riscv.c
> > > > +++ b/disas/riscv.c
> > > > @@ -4723,9 +4723,12 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
> > > >              break;
> > > >          case 'U':
> > > >              fmt++;
> > > > -            snprintf(tmp, sizeof(tmp), "%d", dec->imm >> 12);
> > > > -            append(buf, tmp, buflen);
> > > > -            if (*fmt == 'o') {
> > > > +            if (*fmt == 'i') {
> > > > +                snprintf(tmp, sizeof(tmp), "%d", dec->imm >> 12 & 0xfffff);
> > > 
> > > Why are we correcting LUI's output, but still outputting sign-extended
> > > values for AUIPC?
> > > 
> > > We can't assemble 'auipc a1, 0xffffffff' or 'auipc a1, -1' without getting
> > > 
> > >  Error: lui expression not in range 0..1048575
> > > 
> > > (and additionally for 0xffffffff)
> > > 
> > >  Error: value of 00000ffffffff000 too large for field of 4 bytes at 0000000000000000
> > > 
> > > either.
> > > 
> > > (I see that the assembler's error messages state 'lui', but I was trying
> > > 'auipc'.)
> > > 
> > > I'm using as from gnu binutils 2.40.0.20230214.
> > > 
> > > (And, FWIW, I agree with Richard Henderson that these instructions should
> > > accept negative values.)
> > 
> > I'm kind of lost here, and you saying binutils rejects this syntax?  If
> > that's the case it's probably just an oversight, can you file a bug in
> > binutils land so folks can see?
> 
> Will do.
>

https://sourceware.org/bugzilla/show_bug.cgi?id=30746

Thanks,
drew

