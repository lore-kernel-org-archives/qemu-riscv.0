Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91D8C02183
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 16:22:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tXjgF-0003xg-CQ; Tue, 14 Jan 2025 11:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tXjfy-0003wS-NI
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 11:22:00 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tXjfw-0005HI-NW
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 11:21:58 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28881d6so8408669a12.1
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2025 08:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736871715; x=1737476515; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g9L78fqpPk7QwZBlBO+06uOcH7mLAGIGJImnJHguXL4=;
 b=Yp6XfaLRzG4BWk2dFb68VWKR8+Hievfo4RVToyHE0svnsUSnV9wJe/GEZlYLFESL3K
 ZPvBIM8twQB3iFr/lvcpIqcrQHQICaX27CQUDg6vFcYJYdPFu1npL5RgRUgcP0R7ylHf
 7Kni/Ia/bPo9dxz1fFhHax1Dx5hXfOXcIeyE1UmTrt0pG1zDU2JhGpoqgosuKomOISIO
 2u8fkz+cDhhimubTSqaET6/abKCxPLYxZnXY/qAVse30eMwzW2JqHeG0U8BgBPK3ZbNM
 TJkUtOceCHk1ABgF5GI4Nj+tqYrDPQJCvEg9G67rYid8tsHdoi+FrSVgxhrrYuPdnksa
 sZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736871715; x=1737476515;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9L78fqpPk7QwZBlBO+06uOcH7mLAGIGJImnJHguXL4=;
 b=K2N6l991pW6RkdZsaXy8Ni7ffKAeJkigYv6GZ0qnfpW5tQrpTXs7y+Qoi/rnfddLTD
 DoD+Oq46bcfgFmIVXP3Yv/tMR6H6x+aEPO0gMOelaLi7+fbqsowM3wt0EHh0Mft/lzO3
 xCSDbRaerJsG1PUHmFNfBh7BuGXv/A+BeNEbD5b7KEvIdt80uYl7fr2/77g4lH/sqU65
 BP77Hj1ZmsBXrGka+m//GaWJUYijfBJirQVNSdcwA4qLuYQzOJBCVqgP7SijKT+UfNDc
 Cip/c1If/P0m+nrBq/EGeKj9klLcjx4AONt8TMyzbveHZsgbdJCZmap0fG2Ek3wOXt8j
 SL5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7VI4T6LW1Hq+Q5TwItRFA8KRGwdsAUCHp2wwwpHwn3Oe1LOqAtSPxdGKfeNnGwuTchqL+mf8bXE6p@nongnu.org
X-Gm-Message-State: AOJu0YwfV5rO5ZFOfcc+zN3Vec4sEvqIhdalq2NaKQ0HzRu2YSInUI91
 TnBi/4Hvz8sVeU75/uZbtjO/5q84xtrEEVGUQB2GxdUQG9bws8KLGeWJ6utD0bs=
X-Gm-Gg: ASbGnctXj06TcshSDtzb9su5MwT9Eqwqyb8IhrlX4paX+w4U9Is24kTbXKHRom7iU6x
 iHF1l3mp8E6DGWrL2iAELEEQQPpW3zB0bN4XrZALQdC9+bTSzBspZJcEUDJYHZ7ZwdNLn19+Bvv
 AT5cTcnVlMpNcWGoTCJtNGjbttdU57x7NIQaF8NInRk2x7xG1Tbx5nXWNp8yYIUhnJI25PhxCRN
 YdjKiFp3PH0v1iXFKtliWYzSrJC9HLtBLBVRFpCq9+GVq4v0Nk+lUNo2ozPh+HyqciFSWhceYSE
 OHlkFN1LL3mh7QmTIOGeGloV/wF7IFct9chS/mzeCg==
X-Google-Smtp-Source: AGHT+IHIdM2E68O4FFjoBCti4jWDUEhAHTHdZrkzFz2EPuD/U0NqMOA4gLj3857ydnRy/XgITF7kBw==
X-Received: by 2002:a05:6402:2746:b0:5d0:c697:1f02 with SMTP id
 4fb4d7f45d1cf-5d972e1c54emr65102825a12.17.1736871714880; 
 Tue, 14 Jan 2025 08:21:54 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c912f165sm644906866b.83.2025.01.14.08.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 08:21:54 -0800 (PST)
Date: Tue, 14 Jan 2025 17:21:53 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 2/4] target/riscv: use RVB in RVA22U64
Message-ID: <20250114-8a8ae2fa3de2faa3a300b907@orel>
References: <20250114132012.1224941-1-dbarboza@ventanamicro.com>
 <20250114132012.1224941-3-dbarboza@ventanamicro.com>
 <20250114-85b134099fa79adb42628ebc@orel>
 <f2919b99-d131-40ca-a5e8-63c91092e083@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2919b99-d131-40ca-a5e8-63c91092e083@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x531.google.com
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

On Tue, Jan 14, 2025 at 01:08:46PM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 1/14/25 11:52 AM, Andrew Jones wrote:
> > On Tue, Jan 14, 2025 at 10:20:10AM -0300, Daniel Henrique Barboza wrote:
> > >  From the time we added RVA22U64 until now the spec didn't declare 'RVB'
> > > as a dependency, using zba/zbb/zbs instead. Since then the RVA22 spec
> > > [1] added the following in the 'RVA22U64 Mandatory Extensions' section:
> > > 
> > > "B Bit-manipulation instructions
> > > 
> > > Note: The B extension comprises the Zba, Zbb, and Zbs extensions. At the
> > > time of RVA22U64's ratification, the B extension had not yet been
> > > defined, and so RVA22U64 explicitly mandated Zba, Zbb, and Zbs instead.
> > > Mandating B is equivalent."
> > > 
> > > It is also equivalent to QEMU (see riscv_cpu_validate_b() in
> > > target/riscv/tcg/tcg-cpu.c).
> > > 
> > > Finally, RVA23U64 [2] directly mentions RVB as a mandatory extension,
> > > not citing zba/zbb/zbs.
> > > 
> > > To make it clear that RVA23U64 will extend RVA22U64 (i.e. RVA22 is a
> > > parent of RVA23), use RVB in RVA22U64 as well. As a bonus we can also
> > > exclude zba/zbb/zbs from 'ext_offsets' and make it a bit shorter.
> > > 
> > > (bios-tables-test change: zba/zbb/zbs no longer on riscv,isa)
> > 
> > We should still have zba/zbb/zbs on the ISA string. I don't think
> > Linux yet supports expanding a 'B' bundle into them and other SW
> > may also have not really cared about 'B' being designed to represent
> > preexisting extensions after having already learned how to detect
> > those extensions.
> 
> This has to do with how bios-tables-test works. The test doesn't boot the CPU
> up to realize() and finalize() and, with this change, we ended up removing
> zba/zbb/zbs from it because we won't reach riscv_cpu_validate_b() to add
> them back.

If we can't do a riscv_cpu_finalize_features() (and/or whatever else we
need to do) to ensure we have a complete ISA string, then I think we
should modify the test to somehow never check the ISA string entry of
the RHCT table.

> 
> I guess that in the end, aside from having a smaller ext list, there's not
> much to gain from removing zba/zbb/zbs from the profile definition. We
> can just add RVB and keep them.

While it doesn't really matter if we add them or not, I still think
the test should be modified such that we don't have to try to out-smart
it with profile and cpu definitions. Getting it to work would be best,
but getting it to ignore is also good since we wouldn't need to bother
modifying it every time we touch a cpu config.

Thanks,
drew

> 
> 
> Thanks,
> 
> Daniel
> 
> > 
> > Anyway, what keeps them from being added? I don't see QEMU code
> > for that. I do expect a bios tables change though, since the ISA
> > string should now have 'B' added to it.
> > 
> > Thanks,
> > drew
> > 
> > > 
> > > [1] https://github.com/riscv/riscv-profiles/blob/main/src/profiles.adoc#61-rva22u64-profile
> > > [2] https://github.com/riscv/riscv-profiles/blob/main/src/rva23-profile.adoc#rva23u64-profile
> > > 
> > > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > > ---
> > >   target/riscv/cpu.c                |   5 ++---
> > >   tests/data/acpi/riscv64/virt/RHCT | Bin 398 -> 400 bytes
> > >   2 files changed, 2 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index b187ef2e4b..8d0563527f 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -2351,13 +2351,12 @@ static const PropertyInfo prop_marchid = {
> > >   static RISCVCPUProfile RVA22U64 = {
> > >       .parent = NULL,
> > >       .name = "rva22u64",
> > > -    .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVU,
> > > +    .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVB | RVU,
> > >       .priv_spec = RISCV_PROFILE_ATTR_UNUSED,
> > >       .satp_mode = RISCV_PROFILE_ATTR_UNUSED,
> > >       .ext_offsets = {
> > >           CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
> > > -        CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
> > > -        CPU_CFG_OFFSET(ext_zbs), CPU_CFG_OFFSET(ext_zfhmin),
> > > +        CPU_CFG_OFFSET(ext_zfhmin),
> > >           CPU_CFG_OFFSET(ext_zkt), CPU_CFG_OFFSET(ext_zicntr),
> > >           CPU_CFG_OFFSET(ext_zihpm), CPU_CFG_OFFSET(ext_zicbom),
> > >           CPU_CFG_OFFSET(ext_zicbop), CPU_CFG_OFFSET(ext_zicboz),
> > > diff --git a/tests/data/acpi/riscv64/virt/RHCT b/tests/data/acpi/riscv64/virt/RHCT
> > > index b14ec15e553200760a63aad65586913d31ea2edc..13c8025b868051485be5ba62974a22971a07bc6a 100644
> > > GIT binary patch
> > > delta 53
> > > zcmeBUp1{l%<l!7LfsuiM@#{n`13^7TMg~>JqB1j+%-qDZl;ot1UQ&#clNpsc(ij;S
> > > I3K$s}0ARKZK>z>%
> > > 
> > > delta 52
> > > zcmbQh+{ern<l!9B$H>6Im@tvcKtP9)kwJyAsLaeHGdD3UC3&N_6yxMHMkS6EMh1pF
> > > HMg|4|IwT82
> > > 
> > > -- 
> > > 2.47.1
> > > 
> > > 
> 

