Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3884CC47073
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 00:34:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMdbD-00046t-Sa; Sun, 07 Jan 2024 19:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rMdb9-00044s-Rg; Sun, 07 Jan 2024 19:34:35 -0500
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rMdav-0007ou-TO; Sun, 07 Jan 2024 19:34:35 -0500
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-7cc705bbb2eso333944241.1; 
 Sun, 07 Jan 2024 16:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704674059; x=1705278859; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bmh2bQKJgBhT9PoH7XqKi/SysXFgPKRY8thAFH/jT9E=;
 b=gvTqx+ePlgmTLaSzyv0BB8LJQk5qdD0Ua/r6EqoGPStTHMeKrFkDMIen4yfRRgArj8
 YjTOkPgcUZQwNsZG2OluPP+VnRILys4mK1dw6GziX0J/p+0Im13FVr9ZS8ujiCTeumgb
 0B3B9N2UvrlHc/zQB8xeD1jaMBI4UjZMvZgw6575Odtajh7rwltVDs824219z8IxzTAN
 gNG/2rb0z19DZ2zut2qvR57vuvcXgo9cALjdqjWI6RQlbZnnwFosWuMSRqtsMX5ycWBT
 NUy6rSosz2L7QWNbtIua3E8RUBI3WL8fAqi1G/vKObCLskmQMR9pxa5H+HnHoZYKeorw
 YjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704674059; x=1705278859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bmh2bQKJgBhT9PoH7XqKi/SysXFgPKRY8thAFH/jT9E=;
 b=i6DLP1+z/PNHqvhomR1upUc+Cd4qRBLLsOdB6YrH0z2ZmTTWrvVM/Bq7XlkB8UE3dp
 qQeGLQp8q8wqnxLwQ9TNZx7bOFi/oljypmnSN3sg5vZXDJAKHX7slV2WTF8AkQ79I/yr
 WQCxA2wj8JXNf7nbyIhfvWuD4LWyH5K0YXwRUD1qN800ak1jrXVcc4VYXumaHbFPCh6d
 Srjs75XzvMqTukD8AsF5R+Y8zlPYn6k6kx4q/FSLR8LSZn5dSbMTYWBLCfyOBb9v2TA0
 2uOY/JUtRu0cbC+wnu6dKaHGgyHw1RotILx0NVW/9HX0SWiKViO4r46b8iY2aay5giC3
 6Tjw==
X-Gm-Message-State: AOJu0YybGt/IswzigFRiuBqJk03/ORAI4fyYCdF2HVeSH6EihsbOi83z
 FnhdbjiUUWSI/G+kiRmsz+lBD4OK2GZNA64I3Ss=
X-Google-Smtp-Source: AGHT+IG9HTnAmobfnwyGwLKFLdjZUIIF3r5TzRnOxZjrQoof+5j3bCsoFOGYslo5GBbZ3y7jN86r7ZcVG/ehPQEQFwE=
X-Received: by 2002:a05:6122:2882:b0:4b6:d652:f80 with SMTP id
 fl2-20020a056122288200b004b6d6520f80mr620720vkb.10.1704674059098; Sun, 07 Jan
 2024 16:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20240103185716.1790546-1-me@deliversmonkey.space>
 <20240103185716.1790546-7-me@deliversmonkey.space>
 <CAKmqyKMbYg2baDXRfzLCMajGJ-DL9Kjm2sot2wD8rNHERbNSJQ@mail.gmail.com>
 <CAFukJ-A4mO=4XPpwyYHadBXcosaSMCoDSjiOR0_Pj0+nRWM6eg@mail.gmail.com>
In-Reply-To: <CAFukJ-A4mO=4XPpwyYHadBXcosaSMCoDSjiOR0_Pj0+nRWM6eg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Jan 2024 10:33:52 +1000
Message-ID: <CAKmqyKOd7GJWQ6Y5yshW-L84PDgNj0zpLJZZ2Dhvd90L0rFqfA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] target/riscv: Enable updates for pointer masking
 variables and thus enable pointer masking extension
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com, 
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Fri, Jan 5, 2024 at 5:23=E2=80=AFPM Alexey Baturo <baturo.alexey@gmail.c=
om> wrote:
>
> I might be wrong here, but right now J in MISA is unused.

I suspect you are right, it would be worth confirming though.

> I think the J-letter extension is still a thing, but current extensions l=
ike Zjpm and Zjid follow the Z ext scheme.
> Do you think it should be removed?

It sounds like it should be removed then

Alistair

>
>
> =D0=BF=D1=82, 5 =D1=8F=D0=BD=D0=B2. 2024=E2=80=AF=D0=B3. =D0=B2 08:28, Al=
istair Francis <alistair23@gmail.com>:
>>
>> On Thu, Jan 4, 2024 at 4:58=E2=80=AFAM Alexey Baturo <baturo.alexey@gmai=
l.com> wrote:
>> >
>> > From: Alexey Baturo <baturo.alexey@gmail.com>
>> >
>> > Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
>> > ---
>> >  target/riscv/cpu.c | 8 ++++++++
>> >  1 file changed, 8 insertions(+)
>> >
>> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> > index 1e6571ce99..13389ddc55 100644
>> > --- a/target/riscv/cpu.c
>> > +++ b/target/riscv/cpu.c
>> > @@ -153,6 +153,9 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>> >      ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
>> >      ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
>> >      ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
>> > +    ISA_EXT_DATA_ENTRY(ssnpm, PRIV_VERSION_1_12_0, ext_ssnpm),
>> > +    ISA_EXT_DATA_ENTRY(smnpm, PRIV_VERSION_1_12_0, ext_smnpm),
>> > +    ISA_EXT_DATA_ENTRY(smmpm, PRIV_VERSION_1_12_0, ext_smmpm),
>> >      ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
>> >      ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
>> >      ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
>> > @@ -1337,6 +1340,11 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensio=
ns[] =3D {
>> >
>> >      MULTI_EXT_CFG_BOOL("zmmul", ext_zmmul, false),
>> >
>> > +    /* Zjpm v0.8 extensions */
>> > +    MULTI_EXT_CFG_BOOL("ssnpm", ext_ssnpm, false),
>> > +    MULTI_EXT_CFG_BOOL("smnpm", ext_smnpm, false),
>> > +    MULTI_EXT_CFG_BOOL("smmpm", ext_smmpm, false),
>>
>> What happens to the existing J property?
>>
>>
>> Alistair
>>
>> > +
>> >      MULTI_EXT_CFG_BOOL("zca", ext_zca, false),
>> >      MULTI_EXT_CFG_BOOL("zcb", ext_zcb, false),
>> >      MULTI_EXT_CFG_BOOL("zcd", ext_zcd, false),
>> > --
>> > 2.34.1
>> >
>> >

