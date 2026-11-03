Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609F1606A324
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 13:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pMLsxR1F
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOEsp-0005mm-Er; Tue, 03 Nov 2026 08:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xOEsn-0005lb-Dw
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 08:49:01 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xOEsl-0007ix-78
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 08:49:01 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-8ac4806e210so34712687b3.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2026 05:48:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793713738; cv=none;
 d=google.com; s=arc-20260327;
 b=bAo/06hx2K+cuUhp/jvC1DlMV4BoW6L6WYZMXEAy9q7CE65uDWyE7DTrweNKbuQB2b
 NdkZ7+Uh0eVVbVzVJRjZ7SQa4f0JczfGTLso5aehpP5AlOi+IDYrTdyjpjpnF5dCvo7z
 Fm6XtV1gwn/v5KuO7czsxySru/CZKp5HhcLOPEu7pM2IOSjycryaP1rL9YL+whRVA5ze
 EhZ27HUEXnhixe3ZsysfEqHDyeCW3blANz+/IO48h4gndBmQor9Zp1G9jy0Ylvu04sq/
 HcmyUzf0C5IEHchJmIicrgydUKH9aC16F/GyBRLHKzVHOxHePVBMRz4UPt7S+ddRwL7u
 rhdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=VhJo4HokwhEWSYkNV3t4SWIVzwRlrhbcTP4O4ufZ8fc=;
 fh=MvZeRhrsi9XPfP6HaUJRmalSj8CMp6dOr/IVDmuZOPs=;
 b=ZIHIol6DNPtRc10M9C/Hcx818HemSYXcyvxgkJIObZiOlf3KStbTa6OiT3iLHiccU7
 USbjygqeqObYz8CZ+qNP5nkzPO49zpwc3PlBlnjcuWTtAQpxeRecRI/BDQmK5fpdlO5J
 6wIUnasA6C4HAMYPgvSczSbKx2bWpCJjOOmqlS3uEk3uSGvht8IQr1lN8ALs1XaCqB9V
 8sHjs3Lu04UJT4uctBZTZK1K5xWHlV5+6R0K4GwQav6nxMqXhnZhBN6rdRXooBT7k0p2
 ME14kvWQlq+5pVZhdtkOI9gtQpDtKRKWHi3S1sGcAQVkQ6UHMTgY0uX/VigeGn6JYqV8
 RH0w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793713738; x=1794318538; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=VhJo4HokwhEWSYkNV3t4SWIVzwRlrhbcTP4O4ufZ8fc=;
 b=pMLsxR1FKnaplSmBS8WrvMM0ngiR4z85glf8St+VvN/3hLcKEhM+cq4Dor5dg9GB1h
 qYDbXsxuLd2WalZ8zbHSboHsPGVmYUpTwrxSt6j0Ps9OrYriX/tQRxihN2H2XzB+/4NR
 1D+OaCjU4Wby2gXM1YTDWVlWrUJPDOC4Wz3QbWfQ0xBAOuu8CbctINmVWrRd8eolOJkK
 TwkkiIGLyhPZrfo6LeO2R7hOBBJZglE36BI1ct4rxHC5ARe3cL7gTWLZGH1c9QHzWSN1
 2jF/JC+9AGPADwsMGHSdXpxNlEh3LodQUBlg3P1kEKe31Y0r9n77VzoGFDBQg/mMhqqz
 HEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793713738; x=1794318538;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VhJo4HokwhEWSYkNV3t4SWIVzwRlrhbcTP4O4ufZ8fc=;
 b=AYZJI9Rv22OXaa9v/3VfNAWmfAqGeFrl71iduhzI08BxT3OTG5mRY2A9bEoq7+gHYZ
 2WHOxV5ys9H9AztcWm56w9Zyerga9KnIycfTxC0uzWhfObg0zoLKBwDAMI/7I0uvPuwB
 sEKwsuzpq0FfBAaEOfpEL1bENIWXIEUh4aO/BStgsIa2LgLsPiUH03kBxyFCSA5YyW+v
 /6OAAOKN38Vj+lT5e2xpHYgQuUx4loxMizi5vF778HFUJbIEAxoFfZFyiUxnVTlvov4n
 qwbs0IOPEErrkfUaneCpAx/zenv2XE41kXIJRCQiZXgWn6dZydxc7JNS7qq2k3y4f5Tp
 6VAg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzEZf41pLyR2Yn0rmdH/KwdOCdt/4dP3cJuhPECpdp80Fc/6lV04nYjl5RhqN1fUI30hYcxgxfhmWyR@nongnu.org
X-Gm-Message-State: APuU4Z/evlzAmKl1kuJLeND4GuVBZ9ico7iJk3aegCA1eMKA7WR3cLdm
 +rpX1fpf6DYonZi0FRHoPbtlmgP0T0yqOckZFtn0mBoTD5PY7UKHLWZ7jns5pvOKQ+fKU4t6Ery
 6jG8URrAWvvPv+6LKdc//Y65w2lJhKXc=
X-Gm-Gg: AYBFou278PxTZbJdma0TPILudWUMzHVWT6m5K6QfQSU1QgMU0BcbxpDxTHzpSuD7cbI
 FFNg4S5XzHLJfF1B4hHoHYv/IPwF+C/0Me+NYLVoKmXsx3W62DLPg+eKoEzmYIuUURYS1jNsycR
 EOOlbg1l5CyHWopS5Nr1vPobF32o/V0Ynjo8/MwNeeu+qF9NAwVSqgNfhVtVZ3eU/sNQR73Qldo
 /SotsCOO1sJlKtTx7mdH3zq/z9HKidC+8sH46FP5W+mDAdocVnfKs2O6X9OE2uA/eXWetrs4TAm
 qJ4MVANMLDKE2CaHRCOtUJrCPA7oF2fSOW6qukXdK8Gk4Y5ZIocE5Kn3i9IK8Ochs2AFWOtMMeq
 3ZpgzRePw6d944yty4nZYvi7zVK8bnq3i3SkHTA==
X-Received: by 2002:a05:690e:b89:b0:677:d251:ccd9 with SMTP id
 956f58d0204a3-67ba500f58dmr9210985d50.48.1793713737821; Tue, 03 Nov 2026
 05:48:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com>
 <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
 <aumYOBw-nKQAWdYK@redhat.com>
 <CAE2XoE8Xwevk523OfB+GgwbRu0iVnyD4VNOx81rj7J7F5aq=OA@mail.gmail.com>
 <54851326-3627-2b86-57d6-c338ed4e4b50@eik.bme.hu>
In-Reply-To: <54851326-3627-2b86-57d6-c338ed4e4b50@eik.bme.hu>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Tue, 3 Nov 2026 21:48:44 +0800
X-Gm-Features: AclHuK-kyxeFGeOmdxTnC2slmrHrvKR4DYxVNGXjAJzfbSHbPByoLDfveF6OVPE
Message-ID: <CAE2XoE_P2mZAT8wZwzFsTqJTK8nxNSSqJRrOM2T-AJkQjwJHBw@mail.gmail.com>
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org, 
 Anthony PERARD <anthony@xenproject.org>, Felipe Balbi <balbi@kernel.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, 
 Antony Pavlov <antonynpavlov@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org, 
 Alexandre Iooss <erdnaxe@crans.org>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=luoyonggang@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 9:23=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>
> On Tue, 3 Nov 2026, Yonggang Luo wrote:
> > On Tue, Nov 3, 2026 at 4:16=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrang=
e@redhat.com> wrote:
> >>
> >> On Fri, Oct 30, 2026 at 05:51:44PM -0800, Pierrick Bouvier wrote:
> >>> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> >>>> On Fri, 30 Oct 2026, Yonggang Luo wrote:
> >>>>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and th=
e
> >>>>> type_init
> >>>>> function that calls type_register_static(). A later change needs to
> >>>>> pass a
> >>>>
> >>>> That's the point of the macro to hide the boiler plate code.
> >>>>
> >>>>> target mask into that registration, and the macros have no paramete=
r
> >>>>> for it.
> >>>>
> >>>> Couldn't you just change the macros to take that parameter instead o=
f
> >>>> expanding it everywhere?
> >>>>
> >>>
> >>> Problem of macros is that they don't have default parameters, so you
> >>> need variants for everything:
> >>>
> >>> DEFINE_MACHINE
> >>> DEFINE_MACHINE_EXTENDED
> >>> DEFINE_MACHINE_WITH_INTERFACES
> >>> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> >>> and now would need a new variant, with variant for other existing one=
s.
> >>>
> >>> In the end, it's just simpler to remove this and add the boilerplate.
> >>> It's written once and never modified, so using a macro just save typi=
ng
> >>> those lines once.
> >>
> >> For each machine, it is only written once, but we add machines
> >> over time, and every time a new machine is added the code style
> >> is slightly different. We introduced all the variuos DEFINE_*
> >> macros for QOM to better ensure consistent style and usage as
> >> new code is added over time.
> >
> > I understand that the DEFINE_* macros are bloating because of this.
> > Indeed currently the only two macros used are "DEFINE_MACHINE" and
> > "DEFINE_MACHINE_EXTENDED"
>
> There are a few machines using some others but these are the most used.
> That suggests maybe we should change the convenience wrappers to match
> what machines need but DEFINE_MACHINE_EXTENDED is meant to be the one tha=
t
> allows all parameters which should be rarely needed.
>
> > ; each time people want to add a new attribute, the macros is twiced.
>
> Not necessarily. The SECURE parameter did that to preserve previous
> behaviour but if you add new parameter changing all callers (which is the
> same as expanding the macro that would also change all callers) then it's
> just a new parameter added not changing the number of DEFINE_MACHINE*
> wrappers. Rearranging the wrappers to make DEFINE_MACHINE_EXTENDED used
> less is an independent change.
>
> > And the usage of DEFINE_MACHINE_EXTENDED is rare and can be replaced
> > with DEFINE_TYPES or TypeInfo
> > and be more explicit. When we used as macro parameter, we need think
>
> But that defies the purpose of hiding the QOM boiler plate as much as
> possible. New people are confused by QOM and it's easier for them to look
> up documentation on the DEFINE_MACHINE* macros to see what parameter is
> what and not care about how it's stored in QOM TypeInfo or what is that
> at all.
>
> > what's that parameter means, and for
> > TypeInfo, we can directly know what that member is about(because we
> > are assigned with the member name).
>
> The parameter also has a name and documentation so it's not simpler to
> look up TypeInfo than look at the macro definition or docs. In fact it's
> harder to guess from TypeInfo as then you also need to get into QOM.
>
> > That's why I suggest keeping a single DEFINE_MACHINE, just like
> > DEFINE_TYPES; as they are the most
> > used macros(and simple enough), and won't suffer from changes much.
>
> That means exposing all the boiler plate for all machines other than the
> simplest case. I think it would be better to keep DEFINE_MACHINE_EXTENDED
> but maybe rethink the existing wrappers and drop unused ones and maybe ad=
d
> new ones that reduce the usage of DEFINE_MACHINE_EXTENDED but still keep
> the boiler plate hidden.

Thanks, I'll go this way, remove unused macros, and keep DEFINE_MACHINE_EXT=
ENDED
and extend both DEFINE_MACHINE_EXTENDED DEFINE_MACHINE supports
"targets" or "arch_mask" parameter.


>
> Regards,
> BALATON Zoltan



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

