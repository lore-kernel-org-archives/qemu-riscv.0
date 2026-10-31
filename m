Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9536606A31A
	for <qemu-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 14:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v5ejj5LG
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xN9p3-0003zF-Ji; Sat, 31 Oct 2026 10:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xN9p1-0003y6-35
 for qemu-riscv@nongnu.org; Sat, 31 Oct 2026 10:12:39 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xN9oy-0003fa-7p
 for qemu-riscv@nongnu.org; Sat, 31 Oct 2026 10:12:38 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6b1dae0febeso2247277a12.2
 for <qemu-riscv@nongnu.org>; Sat, 31 Oct 2026 07:12:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793455953; cv=none;
 d=google.com; s=arc-20260327;
 b=XIWuXVirr3XpsorBZsHikhf5kLCmpWiTUIyf/oJveo7xS+kQu0PK60YjPLLkau8Dc/
 g1ZpNBkseWc5HQDv6iKLKnhYS7qQxkvmqeD51sxuMLrzesJMn6b1ivGwKZm1Qh5ziRsu
 KtJhvsIILI7Bh+Cswmd5Xooq6YSf4NG+kucLSpFJyx/Rc6SMEBKtSrcn22itvbLmoh8t
 AyHNn9Z6cY3yMo9uK8zPMDCP6SRahVJ48aVPav+9NpPNJv1SzElwOtPYZ0zbnO+lq6i7
 LSVPJYTtfxPBjNa3i0+7X8ei6VPhn5KHjXQfHM9WY+3XGBAcefpsmi/pi0TlbEgtNpPq
 TsjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=pUOpZRf0p30wCsLBnhRcgac97jM7shsYjyb+5CboCrE=;
 fh=mee97TCbYlIat/APN4H4LWUD4erJI1d8cWQafyNwec4=;
 b=dTy1UoI0UlYXry8DnUtjfrJzWTYx31gnehIYFxVeKQW67wY5HGZQiYdbxI1hcsAjPF
 nb7DEkXUGVByn3x3bmMSIdvqh1Xfr36zzekWUwwi+a5UHOnL5HXG2ouuy3VifLmmaUHv
 omMkqDoq883X0jkFahjosz3yjujXLQWDDYxkZ7T2npJLcph9OeJkE1CMriCVLLe6HP3a
 D7E9jx3NQ51AjfRjq4Asi6+02Pwc8EOR4hw5HJGOSSFSQyoZ4B3hS9VKxQhgcYNToegE
 xmsTvl5LpGr8aU0ONCbEQdONgjg01gUZ4/GkVzfH7sWqZP35V5osma7odEelCU6qVz1l
 QpzA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793455953; x=1794060753; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=pUOpZRf0p30wCsLBnhRcgac97jM7shsYjyb+5CboCrE=;
 b=v5ejj5LGfgQErWbcdKUhpcSG2djQEzS5b+nJyho/1Xwo+XqNB3RDssjr4Ev+8FK1Cd
 oi/6oTKa83zpladKbddWExFD3K60KAQBpmACGsidouSEVUPqQmXXVRKTnAJNaFlENjsd
 6tf/QYFU+bGCZ71gYFdS2PmCPmDiIbr7YgjaTKIAoAKASj875dIDsfBC+9+XRceY8Euw
 IrLTtSXwCA+HtmSpm2Cevt19mXfh/60tqC9kUp8r0+ISwrLW3gU0TA1aVTagspJ2m5l4
 CWf/gfxbhyzSdkStATasJFqxsvuug0EDp5hDg7+4t9IpNNw1ZBma9LLJePGJ42KmM0tH
 Hi4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793455953; x=1794060753;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pUOpZRf0p30wCsLBnhRcgac97jM7shsYjyb+5CboCrE=;
 b=IfP243Q0tI5TDJIM/Vf44oc8+aUtfhmcI83rxSJFtLr9MxORLLHRusfWAMWjBm2UU4
 fFymZSDtKlUxojs4eIKv/bXNqIEv7AB3YXmylXy5ezshyD1Vd6PVhJ39P2nU8NYh2D1h
 W+w3nY3n0oMI7BDNsLlvF+kGlQcoqHi2pklChIeKBmmfQUoledKwAsWMtXBxI2NSAMAE
 lqpB572IjqE+MHDPL5NPSe2JkHSElBwKBIAPrtygrlB8LpNNAS77iKkBydhWNQMjjbEa
 vN4sQdt2NJH4INER+obpRJ2S3HtLTGh+ds4O/sbNfpQuTw5c7o6Z0jmT5Z3ziukjHUDu
 zj+w==
X-Forwarded-Encrypted: i=1;
 AKwUvByz5DKxc5mFAx7IhhPwEZ7G0b/K+Vj1/Wu+SWAlgacD886cGYxB1TvxELgmMPLZ7bGCXjLDB0KT7JtU@nongnu.org
X-Gm-Message-State: AFq9FYJ4aM1fuJUMzhUS5P/nRG+oqqHvovz79RGUj+oCycKxnzx1Sc5E
 b6nxWx773T7yx83pF0Y3dmETfU0uH/f+iKJO0IxbdIbZljJ33kCUe8uN0cMWzRclKLYUaWq873R
 mAp+HA1QMRsCBF2vEhorY0xLfIfp7vh8=
X-Gm-Gg: AYBFou2bj227RzaI6bKcV76u5Htr6qYjnW4nt+SieJfYG4Ekaq5yxSJ7Irrupb4ntAD
 dRhZLRdWOBn97oHAif7nqWWwaw+YR57IC7MMyoA5SYS06cnS8ht3Mla+VVCZuZR5hyTPBWOVjE5
 ZisqBbMilPC/vkrE6CVSqCSFq3K7VQI4mKeu9Ln1xo6UuM/g4OxdxZ38Zh8aMl/Q/SGR2o8+k50
 LGqUxorC8FzDIOzPwAaXucCMvKTpr4cZ5/meJDyzSkPrva+jgmQkECEa9mRDEqxShmbp8OvNqgC
 Drev+1Eh2T9Jpvfk0TcNgsdJY4KdxUIyjjBzEdLaZ8OMRIGyl6gVh3IEXV9QT88y9qT+tRmquAD
 bfjMfh0eSTF8TmOXXmiMXTM2p+P6eJDlvxaRP
X-Received: by 2002:a05:6402:44c8:b0:6af:a566:6f13 with SMTP id
 4fb4d7f45d1cf-6b4d5edb54fmr3002982a12.44.1793455953008; Sat, 31 Oct 2026
 07:12:33 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com>
 <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
 <ba106173-fca3-6019-3028-122831887921@eik.bme.hu>
In-Reply-To: <ba106173-fca3-6019-3028-122831887921@eik.bme.hu>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sat, 31 Oct 2026 22:12:20 +0800
X-Gm-Features: AclHuK-zfjnfDk2iP11Oo2plNAe19bvSiGLggXOtrbkzp1_jiPrf_zVAr1PBvDc
Message-ID: <CAE2XoE9cR_X0kkDfGTU4Mt_5Hc3WZ8K5rghw2AeL4Vh=eugGag@mail.gmail.com>
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org,
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
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52c.google.com
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

On Sat, Oct 31, 2026 at 8:42=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.hu>=
 wrote:
>
> On Fri, 30 Oct 2026, Pierrick Bouvier wrote:
> > On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> >> On Fri, 30 Oct 2026, Yonggang Luo wrote:
> >>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the
> >>> type_init
> >>> function that calls type_register_static(). A later change needs to
> >>> pass a
> >>
> >> That's the point of the macro to hide the boiler plate code.
> >>
> >>> target mask into that registration, and the macros have no parameter
> >>> for it.
> >>
> >> Couldn't you just change the macros to take that parameter instead of
> >> expanding it everywhere?
> >>
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
> >
> >> Regards,
> >> BALATON Zoltan
> >>
> >>> This series expands every caller first, with no behavior change, so t=
he
> >>> follow-up only replaces the type_register_static() call.
> >>>
> >>> Each machine file gains a class_init function, a TypeInfo, and a
> >>> type_init
> >>> function that calls type_register_static(). The last patch removes
> >>> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core/board=
s.h.
>
> Macros help reading the code not saving typing. If the actual
> functionality is buried in a lot of boiler plate it's harder to understan=
d
> and spot bugs so putting the unintresting boiler plate behind a macro is
> better even if you need a separate version for different cases. Then the
> code that uses the macro will be much more obvious and not just a lot of

I think mainly because DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* are
not defined properly
that causes them to not be extended easily.

DEFINE_TYPES is another example, use them can extend easily, how about
always use DEFINE_TYPES?
Or add a DEFINE_TYPE to replace DEFINE_MACHINE* and DEFINE_SECURE_MACHINE*?


> boiler plate.
>
> Regards,
> BALATON Zoltan


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

