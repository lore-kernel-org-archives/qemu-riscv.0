Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60810C04FFE
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 May 2024 16:52:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s6vO6-0007MB-7c; Tue, 14 May 2024 12:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1s6vNy-0007Lc-7z
 for qemu-riscv@nongnu.org; Tue, 14 May 2024 12:52:18 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1s6vNv-0002Py-7r
 for qemu-riscv@nongnu.org; Tue, 14 May 2024 12:52:18 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51f4d2676d1so6491240e87.3
 for <qemu-riscv@nongnu.org>; Tue, 14 May 2024 09:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google; t=1715705531; x=1716310331; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=khxnZEvkPK+THI5fKMM5DREEHmRUSKXq05jj0jtZivI=;
 b=HmW4OV5iNgOdyaoWRsQVHiWynzal9iyZPjQriEiSLGgWqPqGm38K8KsHyLpOxBUiTU
 Ob1Fa9ZDeRO4zAysFMGViXW2Zrg+IeP1Zzc8D881Vgp5C6Uvn8wcJ6u157irffGRoKYh
 XFvuau8fKiAPDanHHtmYGrfAJAeiJ01iPD4/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715705531; x=1716310331;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=khxnZEvkPK+THI5fKMM5DREEHmRUSKXq05jj0jtZivI=;
 b=Uk/rplyKWbElt5pnCGEs0ClD9yst+yOn17CC+GxkjHtRu/h07L2Y2EsWXsyYY863Op
 l00uidIkWUA+l8BtOe9N1e1hMckla6kMoEvLlGGAyWwW4OjkhYSE+vAYUgdVRiCUzAv8
 js6jG1ltb6LxkBx89jd3UkBP9VV8IpbAil2tKo5A+2jJzO4HlYqrKvkJqdqpr7wT8k5X
 t7ln1kzkAZ0QeCkSc2o3/T7LevJSTn35Jle01+cQiwY9bZIWOIwIMwfiDNUqYwEhS5DO
 +izngEW+lbOYCQ3EcejVzO932IyZACdxq+966X4obJBXN8x5e91cS3E5g/rdCJoka4ui
 ejPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfTzN50v6H2m7LPamA0SDafGUv1+/DziIzf0kdMkIzSX7gf5iCjfL8P0HfAW/IxVg3sIJKPE1T7oZde+fKcebcFhvz3iM=
X-Gm-Message-State: AOJu0YxdLSjl7dqviwRIKfFsj7YYpEhmes9i4FL9J+f4LzB8bqF4t90i
 na5bairrF4sBFiG2sd1llBCDZ3S8lMP55B0LLvMIlDm4azcrGE+C21hhDjaS1bflf1RAc37yoEQ
 VZ0h9PtCyWtV2MZ3rRXuReuUfLQokSeHCm0nc
X-Google-Smtp-Source: AGHT+IEIaMYNidF6xwm9XGcwPyhh5FXc+2gFlReLURvwIYyctlTW0hJoEBoSXO6qvHXKAesCx7/pp/uraIZpHS6vgu8=
X-Received: by 2002:ac2:5046:0:b0:522:80d:5dc6 with SMTP id
 2adb3069b0e04-5220fd79fd6mr8728653e87.41.1715705531155; Tue, 14 May 2024
 09:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240429-countinhibit_fix-v1-0-802ec1e99133@rivosinc.com>
 <CAKmqyKN9W+xY-gBZD=6T-iOzrX0MAMcTE4Zd74hmgTtP8hnObQ@mail.gmail.com>
 <CAHBxVyED-ji_pr=XfeDjxUht=9qvcizK3RniijpzX6xC26oshg@mail.gmail.com>
 <CAKmqyKMWgMGSsbgMctFaUnPDgDitJdK31xcg4h+HohiD4_Me6g@mail.gmail.com>
In-Reply-To: <CAKmqyKMWgMGSsbgMctFaUnPDgDitJdK31xcg4h+HohiD4_Me6g@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 14 May 2024 09:51:59 -0700
Message-ID: <CAOnJCU+eEjy5N=4ZFvmMp4P6x8jt8d9Gbt3K89fH=6BdK6ujpQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Assorted fixes for PMU
To: Alistair Francis <alistair23@gmail.com>
Cc: Atish Kumar Patra <atishp@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, 
 palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com, 
 Rajnesh Kanwal <rkanwal@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=atishp@atishpatra.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, May 14, 2024 at 3:18=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> On Tue, May 14, 2024 at 5:15=E2=80=AFPM Atish Kumar Patra <atishp@rivosin=
c.com> wrote:
> >
> > On Mon, May 13, 2024 at 11:29=E2=80=AFPM Alistair Francis <alistair23@g=
mail.com> wrote:
> > >
> > > On Tue, Apr 30, 2024 at 5:29=E2=80=AFAM Atish Patra <atishp@rivosinc.=
com> wrote:
> > > >
> > > > This series contains few miscallenous fixes related to hpmcounters
> > > > and related code. The first patch fixes an issue with cycle/instret
> > > > counters overcouting while the remaining two are more for specifica=
tion
> > > > compliance.
> > > >
> > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > > ---
> > > > Atish Patra (3):
> > > >       target/riscv: Save counter values during countinhibit update
> > > >       target/riscv: Enforce WARL behavior for scounteren/hcounteren
> > > >       target/riscv: Fix the predicate functions for mhpmeventhX CSR=
s
> > >
> > > Thanks!
> > >
> > > Applied to riscv-to-apply.next
> > >
> >
> > Hi Alistair,
> > Thanks for your review. But the patch 1 had some comments about
> > vmstate which needs updating.
>
> Ah, I did read the comments but forgot that you were going to bump the ve=
rsion.
>
> > We also found a few more fixes that I was planning to include in v2.
>
> I found that patch `target/riscv: Save counter values during
> countinhibit update` gives me this error as well
>
> ../target/riscv/csr.c: In function =E2=80=98write_mcountinhibit=E2=80=99:
> ../target/riscv/csr.c:1981:44: error: too few arguments to function =E2=
=80=98get_ticks=E2=80=99
> 1981 |                 counter->mhpmcounter_val =3D get_ticks(false) -
>      |                                            ^~~~~~~~~
> ../target/riscv/csr.c:765:21: note: declared here
>  765 | static target_ulong get_ticks(bool shift, bool instructions)
>      |                     ^~~~~~~~~
> ../target/riscv/csr.c:1985:49: error: too few arguments to function =E2=
=80=98get_ticks=E2=80=99
> 1985 |                     counter->mhpmcounterh_val =3D get_ticks(false)=
 -
>      |                                                 ^~~~~~~~~
> ../target/riscv/csr.c:765:21: note: declared here
>  765 | static target_ulong get_ticks(bool shift, bool instructions)
>      |                     ^~~~~~~~~
>

Yeah. Clement's patch got in. I will rebase and update the series
based on the riscv-to-apply.next.

>
>
> >
> > I can send a separate fixes series on top riscv-to-apply.next or this
> > series can be dropped for the time being.
>
> I'm going to drop it due to the build error above
>
> Alistair
>
> > You can queue it v2 later. Let me know what you prefer.
> >
> >
> > > Alistair
> > >
> > > >
> > > >  target/riscv/cpu.h     |   1 -
> > > >  target/riscv/csr.c     | 111 ++++++++++++++++++++++++++++++-------=
------------
> > > >  target/riscv/machine.c |   1 -
> > > >  3 files changed, 68 insertions(+), 45 deletions(-)
> > > > ---
> > > > base-commit: 1642f979a71a5667a05070be2df82f48bd43ad7a
> > > > change-id: 20240428-countinhibit_fix-c6a1c11f4375
> > > > --
> > > > Regards,
> > > > Atish patra
> > > >
> > > >
>


--=20
Regards,
Atish

