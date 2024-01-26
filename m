Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7DDC47422
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 11:25:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rTKKb-0001QM-OE; Fri, 26 Jan 2024 06:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1rTKKZ-0001PK-LL
 for qemu-riscv@nongnu.org; Fri, 26 Jan 2024 06:25:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1rTKKX-0006MK-Af
 for qemu-riscv@nongnu.org; Fri, 26 Jan 2024 06:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706268304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aF27/ZePh3ddk3rGqciVQDVinq36RJdej/bR+Eib+3Q=;
 b=EY6CFXTeYQLRqy7In19xP9ZltFfIR4nAwYLp8nGzYd0Gu7xJhrzE2P/EWGiJo8QPxu1CkN
 6J1rx1uixWngTBjLpoCBKcFZ2WgH97FTHA0xBFyGm7wZW/T1982MM+x7TaHQKpJfRtyTIE
 uleJpeKUdBfy9s0qzbyQJl+JKNp0myM=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-WSLGWTpnNj-nvReAaQs4Nw-1; Fri, 26 Jan 2024 06:25:03 -0500
X-MC-Unique: WSLGWTpnNj-nvReAaQs4Nw-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-5ff82dc16e0so3186767b3.2
 for <qemu-riscv@nongnu.org>; Fri, 26 Jan 2024 03:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706268302; x=1706873102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aF27/ZePh3ddk3rGqciVQDVinq36RJdej/bR+Eib+3Q=;
 b=G1PWOm/qFyS89yTBz4/Kdmb+Afq/baY72lnERHF4UEC91CfDq2bMwcsEB+NPbohuLV
 AxFFsO1XQs2bgjUkhyoIbz+SJQFy+WMj1FzxucJ0/ItLaXnEY5uvYbVkXs2VdjuOvpZr
 HNKoFL0p7tAIThRaFyBMFuqSpuclC9aS+/AsHxQ+pZErFgtkDYarrbOOt3JBW/f1r6OQ
 ncsKRxWgD9QtdE2QHzniMPaU6FUKKI5xYnicwDgLdBot05alWiUyCYJ0fLzm12DoDTl/
 qGZNMWxSkCYOLJa71hB+BFva4PfBiD/5hVOEVQ6+IETWNUyOZ0eJipFwsq2sxGDQccoi
 lOBw==
X-Gm-Message-State: AOJu0Yzmmesfud58rk/ov5AzC8aHy+b8YlSPeJgI6uFf+PprsaTJ4dGI
 +klQ9aU1EqSFRIp6Ob1ExTC3Hq1ikxTkWdodGO62qFfEsPIsnsnQBNq43datjxG2qfc4gaPDYzD
 +BUAiYuQY2tyjMoET/YYDtBLcoDHxKE8QW3wi2TybpwsqLceeiZizkhzgVM7EpWclTxIRXMYXNb
 XquUaXLB3/8+ia+1XuPbrPyXRE9No=
X-Received: by 2002:a0d:d4cb:0:b0:5ff:9c13:73e5 with SMTP id
 w194-20020a0dd4cb000000b005ff9c1373e5mr1198353ywd.58.1706268302012; 
 Fri, 26 Jan 2024 03:25:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAZfE1meZufghpT1uJmSRQW90YMFQgd/dGkDL4lZ3B5RRPY7aCE6BvNYDo7IfGvRaCq0FkdyYrZQ1mBolIFyU=
X-Received: by 2002:a0d:d4cb:0:b0:5ff:9c13:73e5 with SMTP id
 w194-20020a0dd4cb000000b005ff9c1373e5mr1198335ywd.58.1706268300264; Fri, 26
 Jan 2024 03:25:00 -0800 (PST)
MIME-Version: 1.0
References: <20240125165648.49898-1-philmd@linaro.org>
 <20240125165648.49898-2-philmd@linaro.org>
 <1128019c-adca-4cd4-aa73-937001ad990a@linaro.org>
In-Reply-To: <1128019c-adca-4cd4-aa73-937001ad990a@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 26 Jan 2024 12:24:48 +0100
Message-ID: <CABgObfZuPwzVdPjgeLOOtjmNqUMGcK=ExsvVQOzLqnUABmmX-A@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts/coccinelle: Add cpu_env.cocci_template script
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Jan 26, 2024 at 11:38=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 25/1/24 17:56, Philippe Mathieu-Daud=C3=A9 wrote:
> > Add a Coccinelle script to convert the following slow path
> > (due to the QOM cast macro):
> >
> >    &ARCH_CPU(..)->env
> >
> > to the following fast path:
> >
> >    cpu_env(..)
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >   MAINTAINERS                               |  1 +
> >   scripts/coccinelle/cpu_env.cocci_template | 60 ++++++++++++++++++++++=
+
> >   2 files changed, 61 insertions(+)
> >   create mode 100644 scripts/coccinelle/cpu_env.cocci_template
>
>
> > diff --git a/scripts/coccinelle/cpu_env.cocci_template b/scripts/coccin=
elle/cpu_env.cocci_template
> > new file mode 100644
> > index 0000000000..53aa3a1fea
> > --- /dev/null
> > +++ b/scripts/coccinelle/cpu_env.cocci_template
> > @@ -0,0 +1,60 @@
> > +/*
> > +
> > + Convert &ARCH_CPU(..)->env to use cpu_env(..).
> > +
> > + Rationale: ARCH_CPU() might be slow, being a QOM cast macro.
> > +            cpu_env() is its fast equivalent.
> > +
> > + SPDX-License-Identifier: GPL-2.0-or-later
> > + SPDX-FileCopyrightText: Linaro Ltd 2024
> > + SPDX-FileContributor: Philippe Mathieu-Daud=C3=A9
> > +
> > + Usage as of v8.2.0:
> > +
> > + $ for targetdir in target/*; do test -d $targetdir || continue; \
> > +       export target=3D${targetdir:7}; \
> > +       sed \
> > +           -e "s/__CPUArchState__/$( \
> > +               git grep -h --no-line-number '@env: #CPU.*State' \
> > +                   target/$target/cpu.h \
> > +               | sed -n -e 's/.*\(CPU.*State\).\?/\1/p')/g" \
> > +           -e "s/__ARCHCPU__/$( \
> > +               git grep -h --no-line-number OBJECT_DECLARE_CPU_TYPE.*C=
PU \
> > +                   target/$target/cpu-qom.h \
> > +               | sed -n -e 's/.*(\(.*\), .*, .*)/\1/p')/g" \
> > +           -e "s/__ARCH_CPU__/$( \
> > +               git grep -h --no-line-number OBJECT_DECLARE_CPU_TYPE.*C=
PU \
> > +                   target/$target/cpu-qom.h \
> > +               | sed -n -e 's/.*(.*, .*, \(.*\))/\1/p')/g" \
> > +       < scripts/coccinelle/cpu_env.cocci_template \
> > +       > $TMPDIR/cpu_env_$target.cocci; \
> > +       for dir in hw target/$target; do \
> > +           spatch --macro-file scripts/cocci-macro-file.h \
> > +                  --sp-file $TMPDIR/cpu_env_$target.cocci \
> > +                  --keep-comments \
> > +                  --dir $dir \
> > +                  --in-place; \
> > +       done; \
> > +   done
> > +
> > +*/
> > +
> > +@ CPUState_arg_used @
> > +CPUState *cs;
> > +identifier cpu;
> > +identifier env;
> > +@@
> > +-   __ARCHCPU__ *cpu =3D __ARCH_CPU__(cs);
>
> Here we remove ARCH_CPU(), ...
>
> > +-   __CPUArchState__ *env =3D &cpu->env;
> > ++   __CPUArchState__ *env =3D cpu_env(cs);
> > +    ... when !=3D cpu
> > +
> > +@ depends on never CPUState_arg_used @
> > +identifier obj;
> > +identifier cpu;
> > +identifier env;
> > +@@
> > +-   __ARCHCPU__ *cpu =3D __ARCH_CPU__(obj);
> > +-   __CPUArchState__ *env =3D &cpu->env;
> > ++   __CPUArchState__ *env =3D cpu_env(CPU(obj));
>
> ... but here we just change it by a CPU() QOM call.
> So this 2nd change is just style cleanup.

Can you also add a hunk that is

CPUState *cs;
@@
-  CPU(cs)
+ cs

to clean up on the second?  cpu_env(CPU(current_cpu)) is suboptimal
and also a bit ugly.

paolo


