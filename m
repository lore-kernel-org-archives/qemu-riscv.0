Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EF8606A31B
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 11:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZSJ3glYU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOvep-0006O4-75; Thu, 05 Nov 2026 06:29:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xOven-0006Ne-MG
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 06:29:25 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xOvel-0004FG-KY
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 06:29:25 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6b203527bceso2294269a12.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 03:29:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793878162; cv=none;
 d=google.com; s=arc-20260327;
 b=qzBkAXrAYpN9Laf4ME8AAEbXnB6tqdgX5JX5AR66RA340Ui/dX12wRUrxvL6TZRHqE
 I0fLHgYVVogjoCByXoFzCB28Fhn44J9WCbidsBg4QJOekdAnLRubvGwcS988siEKZ9R1
 w/ozG7vodEwV7yJpVuQktQnvg9+IsdfJwwVlw8V6WdkyYH2hghuRFNxHqgkRvQWD0GfV
 opnNqqq4iYvG4wjY/HEDCV8KepeTB/kM+0GwqaJnSP10msF293Ew1KH7+NhAOL1+CeLS
 gpykHsFe2aa+Q0nNqvDTF0L48KDFDP3PFRzOsuwoS2gCgO1Z+jFkquDEqx12jygEIdrZ
 bdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=N6YNeSVq516in4se9KIqzFq1rO/6YIHrrr7AeykheZo=;
 fh=7w0wg+aE2UQrbZZJvmtM1Bl9Sg2Kv3UKfkEjTZYiLI8=;
 b=kQ/DXwarTPNTHTLqsWNnEsx0aGCvaciGNB83FBwJXXi9/EmXZjOMbeQ7e2fR3QziMX
 yb4f9hX+nJPJqjFFJSrgjSVPPbtw/3jDKgIsbeA3EX6fG1znzakWKRz1gxgj5/VtRXaZ
 VBJzfXwbBNrEfIpaZ4x4CSXrCOm9NOCGB5MZTjClTudZVfHho8/pDzxn1KHxU6LCkB3x
 uqilknw0/IfaK9Ur9Tq47ewRgI0bG9RUfsLooTwE7wLPlRcJf8Qs6IGhu/xeuLyj8Bi0
 cbhqIybzzs2sEk/VJ41s1lSf8/+5rjCE3yl3ZxF34SuTvXe3RrrfzDcihOWiR7frZJB1
 XDYQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793878162; x=1794482962; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=N6YNeSVq516in4se9KIqzFq1rO/6YIHrrr7AeykheZo=;
 b=ZSJ3glYUM07WcP+8ki+tDbs3lXiy1JnuXlmdOy5X9tL0ZvHmB3pCuFtjsqpIp0PG5Y
 ENAdM0zh7tEThXekdrYlBpc9LJ3TnuqUdRtE8s4OX3UJM7EQk3KbeNRBL+5ZKlPKnmeE
 wi8lIn3uiD6gZVVdJlTVIRHOSKIvGvoXxzEihHPX5S6Pa+TSVK0MqIgiSO4S0Cngobyo
 vvzitDhm4lxs9yFMQaJuWq+LfE3rjNwvS+Ea8rUkVnGv7ytXMzEn7IELn6ZuHFt6Cgjz
 8hJttU6R8nGOy1sG+NYsiqatuK0GR4t+4/Tme7jz4nVMrKGn8GNhr/4Ew3ajIcmvf6dU
 0vYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793878162; x=1794482962;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=N6YNeSVq516in4se9KIqzFq1rO/6YIHrrr7AeykheZo=;
 b=ky8EVorhre/SaIYOikU9qUtcUdBbA0GoSNjjkA79CEik9SUuujki2WMSC6WIZsezBK
 rfZcf+fDOXJsDjPR9OtTkXVyW5buHX0ByFnwj4+jeQIRi8FK4kId09SfHFe+MGF7/nK1
 MeHMJMnysPEHgjXGaOhJNAHohzV9hbN4bCjEfxMBh+44qrSpVJHpCa9Gkf0wdGWGatRx
 kibw+pj5fV09XBwqqlpL+Rtzuo3Lm3SdpRdCmM5LcTKwOvvu02641txt+G6A4hxR1hAI
 P28AOLE27ayIAXL4GMwZGmceczezDLXDQduGopkOn/C0jKpGejamIIFQjbQceW0yi5w5
 elFQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwEEGi5UjSQUfdt/s152SxIE1yqbKzc7BivyS823F3iKmCiewhUYvVuApAZNGQCU20gyAEKco/H9SYn@nongnu.org
X-Gm-Message-State: APuU4Z/Rg9YdYCWaUCYGMMfc2WfLqdpxFnLfEQOWq3MxBD8mxEeptWu8
 MBWKpQMI4wb3K+g2h4sqenWbqZZpLJdAu6a/Z+BpSIrdbem8x10RXBcPqPFPebsFxm0WQ6WcILT
 RfnLSmhzj24K1L/gQeqF/qu7KjTUPgZ0=
X-Gm-Gg: AYBFou0ik5QtUSNZ4p+jc0nHNTMbrkaiucCN3uy0KvOVKIZVoQtPeVBCgKKmVoSBgs9
 LbBn66XfodyPBECWPaW8hEzTstjMw2GZlumphZSlsM/LgWUQEHGloTk3csUbbyARJeKsiAyG4Z9
 9UaNcc0WK9QW0BAvioqLsClyJz55QEYCvAAuGR5EdQSRq98H/XKR0gUwj9fDmxKz6zwOle0uTG0
 rcwC2mfdylv1c+n3g3AL5w28OhlQah8lEUP6CRp0pirSo42Z2AhFK7qCkqrarjkyj6241b21wJT
 I0UHGdqV0msRQQhBlflSKtswM2u7ySPAIE8ttJGYO+R8k17KlHHTwTQoIRdaA9isPN3YrQqzlpq
 Ms2hQC/ixTo/6a0M5Z0DWr5A0gSXFNol5i33M
X-Received: by 2002:a05:6402:1a23:b0:6ac:9a44:d404 with SMTP id
 4fb4d7f45d1cf-6b4d32890a2mr9686232a12.0.1793878161823; Thu, 05 Nov 2026
 03:29:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com>
 <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
 <aumYOBw-nKQAWdYK@redhat.com>
 <CAE2XoE8Xwevk523OfB+GgwbRu0iVnyD4VNOx81rj7J7F5aq=OA@mail.gmail.com>
 <54851326-3627-2b86-57d6-c338ed4e4b50@eik.bme.hu>
 <CAE2XoE_P2mZAT8wZwzFsTqJTK8nxNSSqJRrOM2T-AJkQjwJHBw@mail.gmail.com>
 <aunnuwhsx9ZOOXBX@redhat.com>
 <45433754-3cea-41fc-9f45-65a328d0efca@oss.qualcomm.com>
 <auxaPyRRm3MTBz1f@redhat.com>
In-Reply-To: <auxaPyRRm3MTBz1f@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 5 Nov 2026 19:29:08 +0800
X-Gm-Features: AclHuK-4rXijL_AUOdDONNduLekRdI_s2YHPupRTfowSD0vm5SlSlXiC8G5KfNY
Message-ID: <CAE2XoE_=rb9rKyjVZXmBcAHU11554WTt0BkFoP6EAsDFQPEhiw@mail.gmail.com>
Subject: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Anthony PERARD <anthony@xenproject.org>, 
 Felipe Balbi <balbi@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
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
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52a.google.com
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

On Thursday, November 5, 2026, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, Nov 05, 2026 at 12:27:18AM -0800, Pierrick Bouvier wrote:
> > On 11/3/2026 5:55 AM, Daniel P. Berrang=C3=A9 wrote:
> > > On Tue, Nov 03, 2026 at 09:48:44PM +0800, Yonggang Luo wrote:
> > >> On Tue, Nov 3, 2026 at 9:23=E2=80=AFPM BALATON Zoltan <balaton@eik.b=
me.hu> wrote:
> > >>>
> > >>> On Tue, 3 Nov 2026, Yonggang Luo wrote:
> > >>> That means exposing all the boiler plate for all machines other tha=
n the
> > >>> simplest case. I think it would be better to keep DEFINE_MACHINE_EX=
TENDED
> > >>> but maybe rethink the existing wrappers and drop unused ones and ma=
ybe add
> > >>> new ones that reduce the usage of DEFINE_MACHINE_EXTENDED but still=
 keep
> > >>> the boiler plate hidden.
> > >>
> > >> Thanks, I'll go this way, remove unused macros, and keep DEFINE_MACH=
INE_EXTENDED
> > >> and extend both DEFINE_MACHINE_EXTENDED DEFINE_MACHINE supports
> > >> "targets" or "arch_mask" parameter.
> > >
> > > Given that we don't need to do general per-arch type filtering in
> > > QOM, we could just move 'is_available' out of TypeInfo, and into the
> > > MachineClass, so it is a regular class level property, which can be
> > > set in the class_init methods, and thus avoid any changes to the
> > > DEFINE_MACHINE macros.
> > >
> >
> > Some cpus need it also, and it's used for filtering purpose at this tim=
e
> > (to avoid duplication at registration). We already depend on this behav=
ior.
>
> Can you give me more info on the problem with the CPUs ? What cases
> have duplicate class names with CPUs ?



Hi, please take a look at this

https://lore.kernel.org/qemu-devel/20261031164009.2048-1-luoyonggang@gmail.=
com/

Also the single-binary RISC-V patches also faced the same issues,
trying to access
the target_info() in class_init that can be also avoided by this idea,
the bucket TypeImpl .

The patches is at:

https://lore.kernel.org/qemu-riscv/20260916-hw-riscv-cpu-int-v4-0-babc367b6=
0f5@rev.ng/

The riscv machine  need choose different cpu machine according to the
target in class_init =EF=BC=8C

specifically
https://lore.kernel.org/qemu-riscv/20260916-hw-riscv-cpu-int-v4-1-babc367b6=
0f5@rev.ng/

https://lore.kernel.org/qemu-riscv/20260916-hw-riscv-cpu-int-v4-7-babc367b6=
0f5@rev.ng/

By the introduction of TypeBucket idea, these all can be resolved. and
we have no need to rename
The QOM typename at all.



>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>

