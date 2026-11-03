Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25F3606A327
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qF6VEnqM
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOAcZ-0003vM-Ne; Tue, 03 Nov 2026 04:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xOAcX-0003uT-Qa
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 04:15:57 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xOAcT-0000EZ-Qj
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 04:15:56 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6b413b0a974so5919791a12.2
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2026 01:15:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793697352; cv=none;
 d=google.com; s=arc-20260327;
 b=sSQt0Ii9QCojfRqJry86j5DnVanstoYvL0mW7kxf0DvPbyMv4fhra5InqAEbB3usCr
 HZOsgwJJxb71jqY/+OBUZuKkaU+2B27RYwhMSlQ7RrlEOHXehMMy53RM3Y/3VO2Ag8Vq
 iBvvQbz8xYDO8tE64a/lLNRvehYSE07Z5pb1NFBdrYNTPFHUWuAHsDWGmu1IndYRJFds
 Eu71xFuvDpNThOlk7E++oVKd4sNtS3mZvh13iQcuxTDK/E1oJlJJK33FG47yzH7jzcuw
 OYOkg8gwc42LCfU51CHNXJguO8f3is8ipUTQb2b2QB4IakVYuQfmEMbXzY9ARiEEXQnn
 2W0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=6HpPn4PoYBNIQe4jwAq6RYNc4y0GSA5S0U2wFZLAcN4=;
 fh=T1fZ3TbcWQXyqqmFBQej7epv/J6/NTy4bKaB0PmXZtc=;
 b=dH9wluaLGkLin+yH5b6KloNHqRk9lUCX3KJnjtsW3nN+f0nZSv5fVXs0BArm4XtwYf
 XGwXeqXy6TReMQpBHXwap03J9DT+aswFxjTiwuyXiHpqgHsP5uhKVGh2+5CGuKWNQJw0
 1mg3gRdhdi06D8yPZAvU+FhobRlK6agSq5gDi6EGzFj18IEcPT2lNct5li5B/iDMzeIS
 6hZYRuVL6W3RI/nO8f1X3O9SM0ytYZ0IF9+x646vtQTesibcQ3QdqfVmdb+cZKsAoNDD
 f7eb+xBA6efz4cWuz2lVZMrnPqHVTnS4/bok3+HoE9OnrNQGictMotbRIKyOLfh5a9yX
 tRjQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793697352; x=1794302152; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6HpPn4PoYBNIQe4jwAq6RYNc4y0GSA5S0U2wFZLAcN4=;
 b=qF6VEnqMQXCorrb8f9tcGnSlD+s+Xn+WpdrUmLT3e+mCGjBXx5BUu/r4rnAAgaA46C
 9tqVdd8A+u/NW+lPG6VaVS3blpdNwIkJ9d1HWA2yqhsiMl/rkorUkoTuWgJxczsbYqt5
 EjLH7u1y6elyvlBnawE+SKiAAwxwoRBEo/9WMgjDZlygeQlXQleROw79p2wLgsbuYZpz
 Rq8ZLD9wN5is6UGLfPR9VAKlwRRULLSGUp+19kylurZB8/CQZOmHI+Yi5BoJaNz/z4RM
 tZKyaK9GCkUTiIvNqsfmiMIQrr7ieglU3O5FYDKaX9Iy5ila/FFfdrwPzxnqXUcJDyxE
 f5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793697352; x=1794302152;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6HpPn4PoYBNIQe4jwAq6RYNc4y0GSA5S0U2wFZLAcN4=;
 b=Ef9YTfbLZ1jjxNwy3iXs4viFlCPhJlux+B8ofZCEcxByCW5LDq2vWaxPvmTe+Dm13Y
 rRMjkHkgfS8yISSjUe9IntG1y9AmCn0/5ovHR2OJKoHwvftPJiITxoCO/XnbAqg/eAlh
 9Ck9HHPW9aN+Ij644U155XLoWgBUMkYgGWwFHBaHmUyHisOhzHz66lvN2dyTKHfm4Dj0
 hvGuHPkdaSAjEiQGkB8QO3PwU6ly88UPUFCD9caXC3ka7hKjHTLneFhyi9Gu8HlKXuV0
 mbyDZSEJqC7NO/3ndjrK31FZSf7hT55+kyWQEGuWLoReitVkcDgmqte7DrfpgPtEDxUg
 Pbmg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxRzzc5u1EyyembNRCphuVGAKeVmr6rv+VSdGxnvbv817+Ij6bgPm/ZpZVPWAqMJRmdCrSupEGyhgel@nongnu.org
X-Gm-Message-State: APuU4Z/n9EAYpbPsmbLrb1o1uUPp8uKyLxaFFlTvgPVE9AnSogjeoo29
 3CS9nse+IUaKRVf8e6tD853hIw30IZjJfxA5VqyJJX54bZWj/34AGA0DgJI4NYhQAhwBu2vHMqv
 9rGvkPygSuGKeuMDdtRjuON7wI+xXw/g=
X-Gm-Gg: AYBFou2HF+pcvStILRBI62GSfEma7NxKtgH0XT2UbVUID6AP7X8cuvwAWyy4+PEldpr
 rOFfyA5sOIxvpr+uSKJWpFCMy5/dSpOIk3XAdUwsZku0SPD6rhwF2sY/bZHZzwtvAmu3jGHloBc
 wpaFMWILjV+qEKSjtAFUCtp5300kyZ3hvHNgGQ58R6zy05v2o4ERf7pos5pkLAKqyE2nmOCVQdC
 bKH1I31C3zhRDvMD3mdFbULYjy+dJnYnnGGNPkbSIJwQj1mXd98FV1ROZwOGtCu+zGcjwErsfIw
 dTZu4c5n3uVfnwxv8xEoGDFOsBpCrVPdMkd87ZuO+TzfyOowHeqPqUWdoZIzu0EA72z6P9+/whz
 hlbe/8L+j/VG20rQnUHUxyp4RnR59V9WgaqHI
X-Received: by 2002:a05:6402:2355:b0:6b4:20bc:fa3 with SMTP id
 4fb4d7f45d1cf-6b4d467bb11mr9345520a12.22.1793697351217; Tue, 03 Nov 2026
 01:15:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com>
 <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
 <aumYOBw-nKQAWdYK@redhat.com>
In-Reply-To: <aumYOBw-nKQAWdYK@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Tue, 3 Nov 2026 17:15:38 +0800
X-Gm-Features: AclHuK9NUtlMJehxCaFT4QHnxh-0yBZ0hPP8kK9uDqXwDHrUyauf19YUe8SC3VE
Message-ID: <CAE2XoE8Xwevk523OfB+GgwbRu0iVnyD4VNOx81rj7J7F5aq=OA@mail.gmail.com>
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, 
 qemu-devel@nongnu.org, Anthony PERARD <anthony@xenproject.org>, 
 Felipe Balbi <balbi@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>, 
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
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x531.google.com
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

On Tue, Nov 3, 2026 at 4:16=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Fri, Oct 30, 2026 at 05:51:44PM -0800, Pierrick Bouvier wrote:
> > On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> > > On Fri, 30 Oct 2026, Yonggang Luo wrote:
> > >> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the
> > >> type_init
> > >> function that calls type_register_static(). A later change needs to
> > >> pass a
> > >
> > > That's the point of the macro to hide the boiler plate code.
> > >
> > >> target mask into that registration, and the macros have no parameter
> > >> for it.
> > >
> > > Couldn't you just change the macros to take that parameter instead of
> > > expanding it everywhere?
> > >
> >
> > Problem of macros is that they don't have default parameters, so you
> > need variants for everything:
> >
> > DEFINE_MACHINE
> > DEFINE_MACHINE_EXTENDED
> > DEFINE_MACHINE_WITH_INTERFACES
> > DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> > and now would need a new variant, with variant for other existing ones.
> >
> > In the end, it's just simpler to remove this and add the boilerplate.
> > It's written once and never modified, so using a macro just save typing
> > those lines once.
>
> For each machine, it is only written once, but we add machines
> over time, and every time a new machine is added the code style
> is slightly different. We introduced all the variuos DEFINE_*
> macros for QOM to better ensure consistent style and usage as
> new code is added over time.

I understand that the DEFINE_* macros are bloating because of this.
Indeed currently the only two macros used are "DEFINE_MACHINE" and
"DEFINE_MACHINE_EXTENDED"
; each time people want to add a new attribute, the macros is twiced.
And the usage of DEFINE_MACHINE_EXTENDED is rare and can be replaced
with DEFINE_TYPES or TypeInfo
and be more explicit. When we used as macro parameter, we need think
what's that parameter means, and for
TypeInfo, we can directly know what that member is about(because we
are assigned with the member name).
That's why I suggest keeping a single DEFINE_MACHINE, just like
DEFINE_TYPES; as they are the most
used macros(and simple enough), and won't suffer from changes much.

>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

