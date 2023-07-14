Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39273C001B0
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 03:13:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qK9Ex-0005Gy-Hm; Thu, 13 Jul 2023 23:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK9Ew-0005Gj-KJ; Thu, 13 Jul 2023 23:13:06 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK9Et-00042i-KN; Thu, 13 Jul 2023 23:13:05 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-48138949fb4so525053e0c.1; 
 Thu, 13 Jul 2023 20:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689304382; x=1691896382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3zDXF8AhqY13KMrT9bVh34sI4412fPXAb7CfVyFP1yI=;
 b=bUFRhxDECHJDjENMYWoZ8P9wxmzBmLOM2Q7gQKmFngjplsXFHP2Nrh+2eC2Tr/cQvQ
 9Zy30z8xY/+4JKUoBuaF6G3U8wq028opNXu8JBBpvBASkrYJ4ktIHuasViwoZ7PXSI13
 kiW9KHOHRmfWVowDVdTUIl493p76khGQs/BdZ7Tf8V6cXptepd1tGy9as0dVHvOolCuQ
 XPyHicqGObB6CAxYxDMMKmyBxp9G6A7z6uJavFkM943/88AwDf50IkWZ6XZaOR/sVJGw
 Wd5m39seyvmjZJbA8gC0vNsDYU8OHoJ+nX/WBiteEI8NvPvhM/TbgzHxEKRHVlXdjSJs
 uDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689304382; x=1691896382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3zDXF8AhqY13KMrT9bVh34sI4412fPXAb7CfVyFP1yI=;
 b=SWaJ4Wmgx7Hy2/Dk3GboZOsFfpBD7Il7zfgqf/Uv3SXDIq7jUkuDoZGBc67o0pEG0P
 VNGs+CDIxoQymF6Mm0yOetxZJWGrjTA9bb9e3lN7IKf689MVIeJ7nD79J1RVjim9bV1o
 WhLdNlqULfEJljOanOvHmiNXnMPKZd5J0xBBcZyuGdbzzkkD/EcFUcB9Qwg34AdfLSmE
 L+JMHIjN3keAPIQ8zizhh1f1yj+MBGQ/wytpaJiJNDAfKrSx3j+m7hgrxTa5yXahfE2z
 0KEA58/J0j2GGknfUotOkqULk6G0ODHjSdPfJumbQ147soaZRXfJKylfnTm017ma54WI
 DUwQ==
X-Gm-Message-State: ABy/qLZuQcmMKcejvVzCXH6mu80cJKJ81rXEvT38oFn4BHDTLqppueIz
 NKRS24XHeAIvLAPHoYJ8CbkHC5ZVusPktBUP57Y=
X-Google-Smtp-Source: APBJJlEXE+bDiXpLHWrxflHHUPZoINIgQAHOsZ54cIYa4pjNKlYeJNyzr9BRUawTnSJWdP6K9cfmP5RmcMScaAAZTVY=
X-Received: by 2002:a1f:e004:0:b0:481:3bcd:16c5 with SMTP id
 x4-20020a1fe004000000b004813bcd16c5mr2280602vkg.5.1689304382362; Thu, 13 Jul
 2023 20:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230712190149.424675-7-dbarboza@ventanamicro.com>
 <20230712-stench-happiness-40c2ea831257@spud>
 <3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
 <20230712-tulip-replica-0322e71c3e81@spud>
 <744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
 <20230712-superhero-rabid-578605f52927@spud>
 <5dd3366d-13ba-c7fb-554f-549d97e7d4f9@ventanamicro.com>
 <20230712-fancied-aviator-270f51166407@spud>
 <20230713-craziness-lankiness-8aec3db24993@spud>
 <f5f76a03-411c-fb7e-5c21-f261a0e0b141@ventanamicro.com>
 <20230713-tank-blubber-2501cf7a0cf1@spud>
 <7a9c1c99-6820-119a-4815-37c166b664ff@ventanamicro.com>
In-Reply-To: <7a9c1c99-6820-119a-4815-37c166b664ff@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 14 Jul 2023 13:12:36 +1000
Message-ID: <CAKmqyKMuo5pnkXf7+V57=ucVWfCo1s7dOSop5f2D1i_xg+GjTQ@mail.gmail.com>
Subject: Re: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re: [PATCH
 for-8.2 6/7] target/riscv: add 'max' CPU type)
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, Jul 14, 2023 at 11:14=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 7/13/23 19:47, Conor Dooley wrote:
> > On Thu, Jul 13, 2023 at 07:35:01PM -0300, Daniel Henrique Barboza wrote=
:
> >> On 7/13/23 19:12, Conor Dooley wrote:
> >
> >>> And a question for you below Daniel.
> >>>
> >>> On Wed, Jul 12, 2023 at 11:14:21PM +0100, Conor Dooley wrote:
> >
> >
> >>>
> >>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x000=
0000000000000 because privilege spec version does not match
> >>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x000=
0000000000001 because privilege spec version does not match
> >>>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x000=
0000000000001 because privilege spec version does not match
> >>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x000=
0000000000002 because privilege spec version does not match
> >>>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x000=
0000000000002 because privilege spec version does not match
> >>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x000=
0000000000003 because privilege spec version does not match
> >>>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x000=
0000000000003 because privilege spec version does not match
> >>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x000=
0000000000004 because privilege spec version does not match
> >>>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x000=
0000000000004 because privilege spec version does not match
> >>>
> >>> Why am I seeing these warnings? Does the mpfs machine type need to
> >>> disable some things? It only supports rv64imafdc per the DT, and
> >>> predates things like Zca existing, so emitting warnings does not seem
> >>> fair at all to me!
> >>
> >> QEMU will disable extensions that are newer than a priv spec version t=
hat is set
> >> by the CPU. IIUC the icicle board is running a sifive_u54 CPU by defau=
lt. That
> >> CPU has a priv spec version 1_10_0. The CPU is also enabling C.
> >>
> >> We will enable zca if C is enabled. C and D enabled will also enable z=
cd. But
> >> then the priv check will disabled both because zca and zcd have priv s=
pec 1_12_0.
> >>
> >> This is a side effect for a change that I did a few months ago. Back t=
hen we
> >> weren't disabling stuff correctly.
> >
> > Yah, I did check out the blame, hence directing it at you. Thanks for
> > the explanation.
> >
> >> The warnings are annoying but are benign.
> >
> > To be honest, benign or not, this is kind of thing is only going to
> > lead to grief. Even though only the direct kernel boot works, we do
> > actually have some customers that are using the icicle target in QEMU.
> >
> >> And apparently the sifive_u54 CPU is being inconsistent for some time =
and
> >> we noticed just now.
> >> Now, if the icicle board is supposed to have zca and zcd then we have =
a problem.
> >
> > I don't know, this depends on how you see things in QEMU. I would say
> > that it supports c, and not Zca/Zcf/Zcd, given it predates the
> > extensions. I have no interest in retrofitting my devicetree stuff with
> > them, for example.
> >
> >> We'll need to discuss whether we move sifive_u54 CPU priv spec to 1_12=
_0 (I'm not
> >> sure how this will affect other boards that uses this CPU) or remove t=
his priv spec
> >> disable code altogether from QEMU.
> >
> > I think you should stop warning for this? From my dumb-user perspective=
,
> > the warning only "scares" me into thinking something is wrong, when
> > there isn't. I can see a use case for the warning where someone tries t=
o
> > enable Zca & Co. in their QEMU incantation for a CPU that does not
> > have the correct privilege level to support it, but I didn't try to set
> > any options at all in that way, so the warnings seem unfair?
>
>
> That's a fair criticism. We had similar discussions a few months back. It=
's weird
> to send warnings when the user didn't set the extensions manually, but AT=
M we
> can't tell whether an extension was user enabled or not.
>
> So we can either show unfair warning messages or not show warnings and ta=
ke the risk
> of silently disabling extensions that users enabled in the command line. =
It seems
> that the former is more annoying to deal with than the latter.
>
> I guess I can propose a patch to remove the warnings. We can send warning=
 again
> when we have a better solution.

A better solution is to just not enable Zca and friends automatically,
or at least look at the priv spec before we do

Alistair

>
>
> Daniel
>
>
> >
> > Cheers,
> > Conor.
>

