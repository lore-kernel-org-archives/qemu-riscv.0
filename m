Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF772EB64DC
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 01:15:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLvmi-0007si-1P; Tue, 18 Jul 2023 21:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvmb-0007nw-65; Tue, 18 Jul 2023 21:15:13 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvmY-0007Ed-Vt; Tue, 18 Jul 2023 21:15:12 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-440b66adc81so2022976137.1; 
 Tue, 18 Jul 2023 18:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689729307; x=1692321307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lFAlC7fXrrCSlGtmryoxZgIoJSPdYuNY2L7RMOLWW60=;
 b=aMFA4/ZAeLAr13zlQW2z/+0IwAZP5nEhiZ5TGb7wTp/O5KbFCWpvWB2LgZl7ccNPNg
 OiRzihlzLEpb5V2SSXJsEF5W/ot/5CYdTJs2YTHjdYctKY2wu9Eqe57xTO4sdLaajksv
 L7pf7KShLf9bpwZj9jc8TrrFB/JfzXsMIEb/Oi5g0m30cmHU8rZ/4rbD7x9KJj8Dn2JV
 suHPValODNjvQ/pLx5qa4uwJanGJJmEeaYT3WY0odwXBPiJrw1xozYOZoZUmDfd1tDuR
 r48+gocj91+5wHqb1xsqwnrgXFNKuGhkFRvUKnmF6KB7cdT8edBZSf4VEDb0t2Wa+KZg
 m+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689729307; x=1692321307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lFAlC7fXrrCSlGtmryoxZgIoJSPdYuNY2L7RMOLWW60=;
 b=fumXx2Mrynp1VYNwezniG7md4+qGpTputuS4yH13omdntiQydXFIytIYBmpcjwCW2X
 sZ65ne0/pcPw2NpVvgQJxuuvDh1Zi8v07ByyIMIj6NpL4tH+vBS7c7DtuAwV+jZNQWfU
 gH1Up0666rlrDSGKpSNnKnmo1Ii99X+rjEkzXRCQfEHo5ijBi88WL2pOfx8GW7NQor/4
 CLl3MzvQ4PFPjB/ObgtZBwaByWLuBbAjU8krjqNueIczSAG05aHQziiYOkroEyEAbsgY
 u2UFkxA91bJyVZwIztUlDcIoDR1uZuZJJOJ4ZTMzkrce55gSHJz6NXuZiPTV6ASxEuD6
 NtAg==
X-Gm-Message-State: ABy/qLZ7fQZf5xawAu3uv3FEz9azymY4xJ3D/aS0HxF3TDiZImRDYDRr
 SncW857Q/1qqqDv2/k5Jxp7aZCkIDfirWsqXaYM=
X-Google-Smtp-Source: APBJJlHjp/qgB85gmZrO1k7OHDf8ShDlmzgy6t9bYgdbb2LJzPd3hrT4v+GaD/w3arcWyTast+T+lD8/8d7jg1n8Hzo=
X-Received: by 2002:a67:db8e:0:b0:443:ef68:1f06 with SMTP id
 f14-20020a67db8e000000b00443ef681f06mr783389vsk.18.1689729307574; Tue, 18 Jul
 2023 18:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230717154141.60898-1-dbarboza@ventanamicro.com>
 <f0f0b1fb-327b-abb8-0262-027c75c76520@linux.alibaba.com>
 <67f0569b-ffe4-5e4c-78eb-73a25aa414fb@ventanamicro.com>
In-Reply-To: <67f0569b-ffe4-5e4c-78eb-73a25aa414fb@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jul 2023 11:14:41 +1000
Message-ID: <CAKmqyKO_ozMqU28PVkBZXpmu3e-NLRR51zmXRJD8teny7uWbng@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/cpu.c: check priv_ver before auto-enable
 zca/zcd/zcf
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org, 
 liweiwei@iscas.ac.cn, palmer@rivosinc.com, Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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

On Tue, Jul 18, 2023 at 7:50=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 7/17/23 22:36, LIU Zhiwei wrote:
> >
> > On 2023/7/17 23:41, Daniel Henrique Barboza wrote:
> >> Commit bd30559568 made changes in how we're checking and disabling
> >> extensions based on env->priv_ver. One of the changes was to move the
> >> extension disablement code to the end of realize(), being able to
> >> disable extensions after we've auto-enabled some of them.
> >>
> >> An unfortunate side effect of this change started to happen with CPUs
> >> that has an older priv version, like sifive-u54. Starting on commit
> >> 2288a5ce43e5 we're auto-enabling zca, zcd and zcf if RVC is enabled,
> >> but these extensions are priv version 1.12.0. When running a cpu that
> >> has an older priv ver (like sifive-u54) the user is spammed with
> >> warnings like these:
> >>
> >> qemu-system-riscv64: warning: disabling zca extension for hart 0x00000=
00000000000 because privilege spec version does not match
> >> qemu-system-riscv64: warning: disabling zcd extension for hart 0x00000=
00000000000 because privilege spec version does not match
> >>
> >> The warnings are part of the code that disables the extension, but in =
this
> >> case we're throwing user warnings for stuff that we enabled on our own=
,
> >> without user intervention. Users are left wondering what they did wron=
g.
> >>
> >> A quick 8.1 fix for this nuisance is to check the CPU priv spec before
> >> auto-enabling zca/zcd/zcf. A more appropriate fix will include a more
> >> robust framework that will account for both priv_ver and user choice
> >> when auto-enabling/disabling extensions, but for 8.1 we'll make it do
> >> with this simple check.
> >>
> >> It's also worth noticing that this is the only case where we're
> >> auto-enabling extensions based on a criteria (in this case RVC) that
> >> doesn't match the priv spec of the extensions we're enabling. There's =
no
> >> need for more 8.1 band-aids.
> >>
> >> Cc: Conor Dooley <conor@kernel.org>
> >> Fixes: 2288a5ce43e5 ("target/riscv: add cfg properties for Zc* extensi=
on")
> >> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >> ---
> >>   target/riscv/cpu.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 9339c0241d..6b93b04453 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -1225,7 +1225,8 @@ void riscv_cpu_validate_set_extensions(RISCVCPU =
*cpu, Error **errp)
> >>           }
> >>       }
> >> -    if (riscv_has_ext(env, RVC)) {
> >> +    /* zca, zcd and zcf has a PRIV 1.12.0 restriction */
> >
> > I think the Zca/zcd/zcf doesn't have much relationship with the privile=
ge specification. The privilege specification doesn't define any
> > CSR or rules that Zca/zcd/zcf depend on. Maybe I missed something.  Doe=
s anyone  know why we should check PRIV_VERSION_1_12_0 for zca/zcf/zcd?
>
> I always thought about this priv spec filter as a way to determine the ti=
me
> window that the extension was ratified/defined. In this example it's been=
 used
> to filter out zca/zcd/zcf from the sifive-u54 chip because this chip is o=
lder
> than those extensions, so it doesn't make sense to enable them.

That's true. The priv spec check is also there because we needed newer
versions of the priv spec for some extensions, and if we are going to
check some it's simpler to just check all of them.

>
> >
> > I think we should remove the check for priv_ver for many user mode exte=
nsions. We should set the checking privilege specification version for thes=
e extensions to PRIV_VERSION_1_10_0.
>
> I think it's hard to pick and choose which extensions will have a priv ve=
rsion check
> or not. If we're bothered with the priv spec check per se then we should =
remove it

Agreed

> entirely. Here's my plan to do it:

I think that'll work

>
> - remove cfg.priv_ver. This is a very old attribute that allow users to s=
et the priv_ver
> for generic CPUs like rv64. I'm doing changes in the user options for TCG=
 flags and the
> very existence of this option forces me to make priv checks for all exten=
sions we're
> auto-enabling during realize() (because I can't be sure whether the user =
changed the
> priv_ver of rv64 to something older);

I'm not sure about that though. As we see more CPUs being released and
then future spec changes I feel like differentiating between priv
specs is a useful feature.

Alistair

>
> - split the realize() functions between generic and vendor CPUs again. It=
 was merged together
> earlier this year (I did it) because, back then, we were doing too much s=
tuff during
> realize() that was needed for named CPUs, but the side effect is what we'=
re seeing now:
> the common code is enabling unwanted extensions for vendor CPUs. The code=
 is very different
> now, and I believe that we can at least skip validate_set_extensions() fo=
r vendor CPUs;
>
> - at this point, vendor CPUs aren't auto-enabling any features and generi=
c CPUs are always
> set to PRIV_VER_LATEST. This means that we can remove all code related to=
 disable extensions
> via priv spec, and then all artifacts related to priv spec.
>
>
> However, even if we're all onboard with removing it, this is still 8.2 wo=
rk. For 8.1 I believe
> this patch is a good fix to relief users from these warnings.
>
>
> Thanks,
>
> Daniel
>
>
>
> >
> > Zhiwei
> >
> >> +    if (riscv_has_ext(env, RVC) && env->priv_ver >=3D PRIV_VERSION_1_=
12_0) {
> >>           cpu->cfg.ext_zca =3D true;
> >>           if (riscv_has_ext(env, RVF) && env->misa_mxl_max =3D=3D MXL_=
RV32) {
> >>               cpu->cfg.ext_zcf =3D true;
>

