Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AB5C04E69
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 15:04:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWI4V-0004WK-Ki; Wed, 16 Aug 2023 11:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qWI49-0003tK-Bv
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 11:04:10 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qWI46-0004He-UW
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 11:04:09 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31792ac0fefso5642943f8f.2
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 08:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692198245; x=1692803045;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IO/QbhRZIJZJH3eGs447LJxoGfg7y0DXVsozsZDaaec=;
 b=QiGxl7fPJ7AJ7ZgBRQ56bouqN5IKLHjgVLgI7o3kCInIqfJtAs05UdGorB444VFEAC
 oNM3T485msp9EDsJxOi5+Ly+Og5TJkO63/1me5Pui21Nql7zrnaH8hjybwjp71RuLMAG
 kExgMLdq36ejwBTgL2QADaQiO7K6WhIPrQizzkoc7ZS0z0VdWMRDpNenSmtXqAvL9JiE
 YrpoIIUFhSSOMN1XD+QoD9vij9d8JQlKmpaPT5MQIzAFfEJCSVyBZ5YbK9RTCavA3ttc
 Vtg/UHKU0TBVZYDnUd3b9e7E+4GJ2VprEiGZL90HwW7h1dpjrZdCW9BQxZd9jALD6YcX
 VZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692198245; x=1692803045;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IO/QbhRZIJZJH3eGs447LJxoGfg7y0DXVsozsZDaaec=;
 b=d2Q+09vzxfOFBis8RQjXP4RTTFZ8DqyJFHJ7jS2VEnSBM4VqjLySH7BInFF/kwOYLZ
 MKsl1DL3/+kl49yIUMoHswHKrKky6IYHrzA0zamcYf2uiL5ERlNoSY74S5mV7/EHiWsy
 j8IJwgNGzmgmYzl70WXYkAq4z69o2B0bageKdzdYOFpGqqPY+ntXBKzMYYdVP95qJONe
 oI60MfNKm+PyB+xbL98gV8MJRzHRH3W2Lx3yOo/PgEJItbGsE1IGmzr5xXE2aaOuDJhH
 KEM+JPYIdFUvH76sdy9lFxue47lKSYXZZX2C/co3XDnDSnMxMUcwF3BjyWYXtmi72yIo
 uh+Q==
X-Gm-Message-State: AOJu0YxtddraKWsFckbQZdPvxktpQk2YbMkRs4v7Bp6r3461xKmMoLQl
 8VLXs0wRGutmUnvJNC7oE0/B/A==
X-Google-Smtp-Source: AGHT+IGfzZUTn0ZVCpw7dP0DounRrSdvJqkh7wjok99nneDrcctuNpkSuMX+ORLHdRdIAUWbbh6LPQ==
X-Received: by 2002:a5d:4566:0:b0:317:6ef1:7939 with SMTP id
 a6-20020a5d4566000000b003176ef17939mr2007688wrc.23.1692198245189; 
 Wed, 16 Aug 2023 08:04:05 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a5d5341000000b0031763fd36c4sm21636148wrv.104.2023.08.16.08.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 08:04:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6E4681FFBB;
 Wed, 16 Aug 2023 16:04:04 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-16-akihiko.odaki@daynix.com>
 <87350lr7p8.fsf@linaro.org>
 <f41aae27-8538-46b5-93fa-67de41602077@daynix.com>
User-agent: mu4e 1.11.14; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Akihiko Odaki
 <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, Richard
 Henderson <richard.henderson@linaro.org>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Brian Cain
 <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Laurent Vivier <laurent@vivier.eu>, Aurelien
 Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Chris Wulff
 <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, Stafford Horne
 <shorne@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, Nicholas Piggin
 <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [RFC PATCH 15/24] target/arm: Fill new members of GDBFeature
Date: Wed, 16 Aug 2023 16:03:31 +0100
In-reply-to: <f41aae27-8538-46b5-93fa-67de41602077@daynix.com>
Message-ID: <87r0o3ni57.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2023/08/14 23:56, Alex Benn=C3=A9e wrote:
>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>=20
>>> These members will be used to help plugins to identify registers.
>>>
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> ---
>>>   target/arm/gdbstub.c   | 46 +++++++++++++++++++++++++++---------------
>>>   target/arm/gdbstub64.c | 42 +++++++++++++++++++++++++-------------
>>>   2 files changed, 58 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
>>> index 100a6eed15..56d24028f6 100644
>>> --- a/target/arm/gdbstub.c
>>> +++ b/target/arm/gdbstub.c
>>> @@ -270,6 +270,7 @@ static void arm_gen_one_feature_sysreg(GString *s,
>>>       g_string_append_printf(s, " regnum=3D\"%d\"", regnum);
>>>       g_string_append_printf(s, " group=3D\"cp_regs\"/>");
>>>       dyn_feature->data.cpregs.keys[dyn_feature->desc.num_regs] =3D ri_=
key;
>>> +    ((const char **)dyn_feature->desc.regs)[dyn_feature->desc.num_regs=
] =3D ri->name;
>>>       dyn_feature->desc.num_regs++;
>>>   }
>>>   @@ -316,6 +317,8 @@ static GDBFeature
>>> *arm_gen_dynamic_sysreg_feature(CPUState *cs, int base_reg)
>>>       DynamicGDBFeatureInfo *dyn_feature =3D &cpu->dyn_sysreg_feature;
>>>       gsize num_regs =3D g_hash_table_size(cpu->cp_regs);
>>>   +    dyn_feature->desc.name =3D "org.qemu.gdb.arm.sys.regs";
>>> +    dyn_feature->desc.regs =3D g_new(const char *, num_regs);
>> AIUI this means we now have an array of register names which mirrors
>> the
>> names embedded in the XML. This smells like a few steps away from just
>> abstracting the whole XML away from the targets and generating them
>> inside gdbstub when we need them. As per my stalled attempt I referenced
>> earlier.
>
> The abstraction is strictly limited for identifiers. Most plugin
> should already have some knowledge of how registers are used. For
> example, a plugin that tracks stack frame for RISC-V should know sp is
> the stack pointer register. Similarly, a cycle simulator plugin should
> know how registers are used in a program. Only identifiers matter in
> such cases.
>
> I'm definitely *not* in favor of abstracting the whole XML for
> plugins. It will be too hard to maintain ABI compatibility when a new
> attribute emerges, for example.

No I agree the XML shouldn't go near the plugins. I was just looking to
avoid having an XML builder for every target.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

