Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC83EEB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 07:22:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qF8Rk-0003jJ-BC; Fri, 30 Jun 2023 03:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qF8Rj-0003iJ-Lf
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 03:21:35 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qF8Re-0006sP-Gt
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 03:21:32 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51da8a744c4so1674356a12.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 00:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688109688; x=1690701688;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i5+4/6qUuytosSB0DMVsJSJR1t1FhIeu1u7AVHLbqwU=;
 b=PJU9IlYHIP9XCiTuN6KfGrQbNR341wagST+D3SVeoSuCV7tc8BtikwWV/h+eDtKZAY
 je1JJ7P0LI6S0PMWASprd+23w/iAOwzn1duqce1PIYKt0kfu9SoX5h5JTA9FjKkwSsMR
 bNqHk1yHeA1fRodfDTtRwIlHpdR5GvQbWZx923a8VJ1efDj9MfjcCY7pjZl7zFkMcxRc
 JD+fPImmsGJRwG1YziUNB5q5X4kxCW8hFDGg+xvb2NdlA1oKZecDQM6zOb70j6AuNXXY
 ELoeGGL9ulrjElo6le/Ta/KLKz0dNEy9pzDuDS7zj+ECv4dKmf0JwcAL1awwpAGcuQp7
 pkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688109688; x=1690701688;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5+4/6qUuytosSB0DMVsJSJR1t1FhIeu1u7AVHLbqwU=;
 b=Qy8ZWRQygHXX/N22ew5XZunX/dzzxDb4L3YU7+rLEgvboLGBLa0AD1fT4dj5GcGl7P
 igror3qxlAhN5XOZUymVbfeHupqGZFZr9hdnYJvpBNeBT+tK0ju2Lyc/13/l9eZgPUbt
 1buCZWiu+PXxZgRjEQRMVkIbUAG2itI5cjES5tI+uvAgD7BAaIuHD6PUYeglWFXLiYyY
 yWaHxZUQeJ3vMs0G8+qPY4VtzzId3CaS7f6PsPW289HgZAbtVnoQIu0XtVQTeOxSDlrP
 XUAS+S5ppSBkeM4/8kk1HReo3YivwTh4vO4o9wzEMgW8XVNpAC2fjXdHQrYyzPLNNL5y
 mwSg==
X-Gm-Message-State: ABy/qLY5fWkS3J2BZxeddEIKdGwTWEPE17aO1OsS8HGrHN1ofO+dmU8x
 VRr6c2jKrNWKKHEfAHirwObvlg==
X-Google-Smtp-Source: APBJJlEYP33NfU+Ok1Du743qhDyzqEt2vtJ6Pxtb8hvjNziPneMPj8jIzLJFZ16bLrSSH7Q+UwwbqQ==
X-Received: by 2002:a05:6402:1a58:b0:51d:a308:74f9 with SMTP id
 bf24-20020a0564021a5800b0051da30874f9mr878851edb.29.1688109688551; 
 Fri, 30 Jun 2023 00:21:28 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 z24-20020aa7cf98000000b0051bfcd3c4desm6344952edx.19.2023.06.30.00.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 00:21:27 -0700 (PDT)
Date: Fri, 30 Jun 2023 09:21:26 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org
Subject: Re: [PATCH v6 11/20] target/riscv/cpu: add misa_ext_info_arr[]
Message-ID: <20230630-7af8091ede9cbd91e3236e3b@orel>
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
 <20230628213033.170315-12-dbarboza@ventanamicro.com>
 <20230629-6a932f8d5f71fefc9afbd974@orel>
 <8d54c842-fd7a-0e9d-3835-10599d7de5c2@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d54c842-fd7a-0e9d-3835-10599d7de5c2@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Jun 29, 2023 at 07:04:28PM -0300, Daniel Henrique Barboza wrote:
> Drew,
> 
> On 6/29/23 05:59, Andrew Jones wrote:
> > On Wed, Jun 28, 2023 at 06:30:24PM -0300, Daniel Henrique Barboza wrote:
> > > Next patch will add KVM specific user properties for both MISA and
> > > multi-letter extensions. For MISA extensions we want to make use of what
> > > is already available in misa_ext_cfgs[] to avoid code repetition.
> > > 
> > > misa_ext_info_arr[] array will hold name and description for each MISA
> > > extension that misa_ext_cfgs[] is declaring. We'll then use this new
> > > array in KVM code to avoid duplicating strings.
> > > 
> > > There's nothing holding us back from doing the same with multi-letter
> > > extensions. For now doing just with MISA extensions is enough.
> > > 
> > > Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> > > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > > ---
> > >   target/riscv/cpu.c | 83 ++++++++++++++++++++++++++++++----------------
> > >   target/riscv/cpu.h |  7 +++-
> > >   2 files changed, 61 insertions(+), 29 deletions(-)
> > > 
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index 2485e820f8..90dd2078ae 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -1558,33 +1558,57 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
> > >       visit_type_bool(v, name, &value, errp);
> > >   }
> > > -static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
> > > -    {.name = "a", .description = "Atomic instructions",
> > > -     .misa_bit = RVA, .enabled = true},
> > > -    {.name = "c", .description = "Compressed instructions",
> > > -     .misa_bit = RVC, .enabled = true},
> > > -    {.name = "d", .description = "Double-precision float point",
> > > -     .misa_bit = RVD, .enabled = true},
> > > -    {.name = "f", .description = "Single-precision float point",
> > > -     .misa_bit = RVF, .enabled = true},
> > > -    {.name = "i", .description = "Base integer instruction set",
> > > -     .misa_bit = RVI, .enabled = true},
> > > -    {.name = "e", .description = "Base integer instruction set (embedded)",
> > > -     .misa_bit = RVE, .enabled = false},
> > > -    {.name = "m", .description = "Integer multiplication and division",
> > > -     .misa_bit = RVM, .enabled = true},
> > > -    {.name = "s", .description = "Supervisor-level instructions",
> > > -     .misa_bit = RVS, .enabled = true},
> > > -    {.name = "u", .description = "User-level instructions",
> > > -     .misa_bit = RVU, .enabled = true},
> > > -    {.name = "h", .description = "Hypervisor",
> > > -     .misa_bit = RVH, .enabled = true},
> > > -    {.name = "x-j", .description = "Dynamic translated languages",
> > > -     .misa_bit = RVJ, .enabled = false},
> > > -    {.name = "v", .description = "Vector operations",
> > > -     .misa_bit = RVV, .enabled = false},
> > > -    {.name = "g", .description = "General purpose (IMAFD_Zicsr_Zifencei)",
> > > -     .misa_bit = RVG, .enabled = false},
> > > +typedef struct misa_ext_info {
> > > +    const char *name;
> > > +    const char *description;
> > > +} MISAExtInfo;
> > > +
> > > +#define MISA_EXT_INFO(_idx, _propname, _descr) \
> > > +    [(_idx - 'A')] = {.name = _propname, .description = _descr}
> > 
> > We don't have to give up on passing RV* to this macro. Directly
> > using __builtin_ctz() with a constant should work, i.e.
> > 
> >   #define MISA_EXT_INFO(_bit, _propname, _descr) \
> >       [__builtin_ctz(_bit)] = {.name = _propname, .description = _descr}
> > 
> > and then
> > 
> >   MISA_EXT_INFO(RVA, "a", "Atomic instructions"),
> >   MISA_EXT_INFO(RVD, "d", "Double-precision float point"),
> >   ...
> > 
> > (We don't need the ctz32() wrapper since we know we'll never input zero to
> > __builtin_ctz().)
> 
> I run the series through gitlab because I got worried about this change in different
> compilers and so on. And in fact I fear that we break 'clang-user' with it:
> 
> https://gitlab.com/danielhb/qemu/-/jobs/4569265199
> 
> u.c.o -c ../target/riscv/cpu.c
> ../target/riscv/cpu.c:1624:5: error: initializer element is not a compile-time constant
>     MISA_CFG(RVA, true),
>     ^~~~~~~~~~~~~~~~~~~
> ../target/riscv/cpu.c:1619:53: note: expanded from macro 'MISA_CFG'
>     {.name = misa_ext_info_arr[MISA_INFO_IDX(_bit)].name, \
>              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> 1 error generated.
> [1503/2619] Compiling C object libqemu-ppc64le-linux-user.fa.p/linux-user_syscall.c.o
> 
> 
> Which is a shame because gcc and everyone else is okay with it, but 'clang-user' and
> 'tsan-build' runners are complaining about it.
> 
> Unless there's a directive to make clang accept this code (I didn't find any) we'll
> need to keep updating name and description during runtime, and we'll have to keep
> removing 'const' from misa_ext_cfgs[].
>

Yeah, that's a pity, and odd that any compiler wouldn't be able to
identify that a constant input to a builtin linear function produces
another constant...

Oh well, we can only be as good as the tools we use...

Thanks,
drew

