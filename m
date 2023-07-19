Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A808C001B0
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:18:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qM9ss-0007bS-9e; Wed, 19 Jul 2023 12:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1qM9sp-0007ZN-Hx; Wed, 19 Jul 2023 12:18:35 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1qM9sn-0000Vc-BD; Wed, 19 Jul 2023 12:18:35 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99454855de1so677729466b.2; 
 Wed, 19 Jul 2023 09:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689783511; x=1690388311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+WP6ARvah1O+dq6SVexQEUuKHhsVrT9je00iuchDDE=;
 b=BXbHjLnW98p8hf5FLleoD5Kgk6r4JbPU+y/wUxsQZuRE+3z4BD23DIYfRHRalbvc6f
 FE/KTiEN3sqEwME0dSY2x0mnGm0+vxrgrT3Bezeku5FVJvD6LrPSCW6t+mluPkxG2CV9
 s6DEWMUh5ZqQixL1IbBZ5h5utvVilfJnq0RDda9nn1qUiqvGw44C2Ct83jahStmPPVNy
 /c6ePXaJzRybPXB3M4GPfia/ZipozKTXn3lZriFl+9WtHK+LTymLjaMz1muyXJrSjONs
 txaaFzBvICjJw2jrPLHrlp604GEVhekv3Hpe7rb5RXpT3X8WRSm4xI23RfI7an7lPvAz
 AFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689783511; x=1690388311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O+WP6ARvah1O+dq6SVexQEUuKHhsVrT9je00iuchDDE=;
 b=FVR1iAsh3FPGqUggzsdHw/9X3zgFgqp7Jdx5neKFpvLZaTV5BNkpDt3eCdIp+Ujf97
 lBuzurL9A2o6iDWmKCUyVjShqKC5coDPKheZRuslBH2B3ANXfZtmUWHzLBCdSSjUFnXM
 fVtKK2ANlqz4rwzaxd6u81dOGSp2vPoiWRG7KlUITyp3VOEUj6IQ2KXMCibgNqMORG5f
 4q1KfOZWieByc+09bwubGSXByOG/cfhcKnKuoDG+sA1EazcN/pf4aH8oFosJe+Z3H5uk
 R2kihMwKlPIzfFwaZdVel7yMAIdBIhWbM2eJqYh9QG5NxAmPW2CXMy43T1ngGJTtiCqC
 2vGg==
X-Gm-Message-State: ABy/qLaE/FCCrNl8qwTGsZT0FFSbXiIlPBjF5254lUqZZ+YQZwYeHzHM
 TMGSJre4zWzLWMgNLbR6RHi9rJOfK7j2TZydu2I=
X-Google-Smtp-Source: APBJJlGYWgNXsB86abknM5lDIPV//svOXIF1vG/w3NVdiQdiwwINT5EOWDkDjlGL6txw58Z3/fPFVc83N3CdhNx6Wao=
X-Received: by 2002:a17:906:76cf:b0:993:6845:89d9 with SMTP id
 q15-20020a17090676cf00b00993684589d9mr2967555ejn.44.1689783510993; Wed, 19
 Jul 2023 09:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230712-stench-happiness-40c2ea831257@spud>
 <3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
 <20230712-tulip-replica-0322e71c3e81@spud>
 <744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
 <20230712-superhero-rabid-578605f52927@spud>
 <5dd3366d-13ba-c7fb-554f-549d97e7d4f9@ventanamicro.com>
 <20230712-fancied-aviator-270f51166407@spud>
 <20230713-craziness-lankiness-8aec3db24993@spud>
 <CAAhSdy3J5HUoVP21jo11FBuAFSPSxHNKtuL7amn-5t7n_smoSg@mail.gmail.com>
 <20230714-reoccur-confined-4b37494b1201@spud>
 <20230714-hash-handwrite-339817b93ba1@spud>
 <CAOnJCUL3=G_yV5cP5OjCGQKNvciNgXWnoQGUU4Bqh4iwnx6C4A@mail.gmail.com>
 <CAKmqyKO3O87ETntm7pzMPedKW19ANpEp5nM4jFiHXO76K9saTQ@mail.gmail.com>
 <CAAhSdy1+wRpqoTFmBRNF7uFnc_fFCyCnt5ctoMu7zhTiu2GcTg@mail.gmail.com>
 <CAKmqyKOTik3tUa1MyHAyc5jOWcPDY=seHuR-VurHbSKaCKQFpw@mail.gmail.com>
 <CAAhSdy1vkk6xj7HSyPHKN0d0qgYrq_rn-+iw_rxkdDBKqpC2yw@mail.gmail.com>
 <CAEUhbmVoYnOMEi_Hqi7iX0__jTjbEnaxrHjCJHuMVaUAcMiACA@mail.gmail.com>
 <CAK9=C2WG8Ro9kUCWBCDVtTYQwoTGbxo=hNgkK9y5HdAqhL=DHg@mail.gmail.com>
In-Reply-To: <CAK9=C2WG8Ro9kUCWBCDVtTYQwoTGbxo=hNgkK9y5HdAqhL=DHg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 20 Jul 2023 00:18:19 +0800
Message-ID: <CAEUhbmXq0eKxyJWdZwg3XjLWCsPQ+UiVWR6n1Q7W1_x+D8N2oQ@mail.gmail.com>
Subject: Re: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re: [PATCH
 for-8.2 6/7] target/riscv: add 'max' CPU type)
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Alistair Francis <alistair23@gmail.com>, 
 Atish Patra <atishp@atishpatra.org>,
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org, 
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, 
 opensbi@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi Anup,

On Thu, Jul 20, 2023 at 12:10=E2=80=AFAM Anup Patel <apatel@ventanamicro.co=
m> wrote:
>
> Hi Bin,
>
> On Wed, Jul 19, 2023 at 9:15=E2=80=AFPM Bin Meng <bmeng.cn@gmail.com> wro=
te:
> >
> > On Wed, Jul 19, 2023 at 11:22=E2=80=AFPM Anup Patel <anup@brainfault.or=
g> wrote:
> > >
> > > On Wed, Jul 19, 2023 at 3:23=E2=80=AFPM Alistair Francis <alistair23@=
gmail.com> wrote:
> > > >
> > > > On Wed, Jul 19, 2023 at 3:39=E2=80=AFPM Anup Patel <anup@brainfault=
.org> wrote:
> > > > >
> > > > > On Wed, Jul 19, 2023 at 7:03=E2=80=AFAM Alistair Francis <alistai=
r23@gmail.com> wrote:
> > > > > >
> > > > > > On Sat, Jul 15, 2023 at 7:14=E2=80=AFPM Atish Patra <atishp@ati=
shpatra.org> wrote:
> > > > > > >
> > > > > > > On Fri, Jul 14, 2023 at 5:29=E2=80=AFAM Conor Dooley <conor@k=
ernel.org> wrote:
> > > > > > > >
> > > > > > > > On Fri, Jul 14, 2023 at 11:19:34AM +0100, Conor Dooley wrot=
e:
> > > > > > > > > On Fri, Jul 14, 2023 at 10:00:19AM +0530, Anup Patel wrot=
e:
> > > > > > > > >
> > > > > > > > > > > > OpenSBI v1.3
> > > > > > > > > > > >    ____                    _____ ____ _____
> > > > > > > > > > > >   / __ \                  / ____|  _ \_   _|
> > > > > > > > > > > >  | |  | |_ __   ___ _ __ | (___ | |_) || |
> > > > > > > > > > > >  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> > > > > > > > > > > >  | |__| | |_) |  __/ | | |____) | |_) || |_
> > > > > > > > > > > >   \____/| .__/ \___|_| |_|_____/|___/_____|
> > > > > > > > > > > >         | |
> > > > > > > > > > > >         |_|
> > > > > > > > > > > >
> > > > > > > > > > > > init_coldboot: ipi init failed (error -1009)
> > > > > > > > > > > >
> > > > > > > > > > > > Just to note, because we use our own firmware that =
vendors in OpenSBI
> > > > > > > > > > > > and compiles only a significantly cut down number o=
f files from it, we
> > > > > > > > > > > > do not use the fw_dynamic etc flow on our hardware.=
 As a result, we have
> > > > > > > > > > > > not tested v1.3, nor do we have any immediate plans=
 to change our
> > > > > > > > > > > > platform firmware to vendor v1.3 either.
> > > > > > > > > > > >
> > > > > > > > > > > > I unless there's something obvious to you, it sound=
s like I will need to
> > > > > > > > > > > > go and bisect OpenSBI. That's a job for another day=
 though, given the
> > > > > > > > > > > > time.
> > > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > The real issue is some CPU/HART DT nodes marked as disa=
bled in the
> > > > > > > > > > DT passed to OpenSBI 1.3.
> > > > > > > > > >
> > > > > > > > > > This issue does not exist in any of the DTs generated b=
y QEMU but some
> > > > > > > > > > of the DTs in the kernel (such as microchip and SiFive =
board DTs) have
> > > > > > > > > > the E-core disabled.
> > > > > > > > > >
> > > > > > > > > > I had discovered this issue in a totally different cont=
ext after the OpenSBI 1.3
> > > > > > > > > > release happened. This issue is already fixed in the la=
test OpenSBI by the
> > > > > > > > > > following commit c6a35733b74aeff612398f274ed19a74f81d1f=
37 ("lib: utils:
> > > > > > > > > > Fix sbi_hartid_to_scratch() usage in ACLINT drivers").
> > > > > > > > >
> > > > > > > > > Great, thanks Anup! I thought I had tested tip-of-tree to=
o, but
> > > > > > > > > obviously not.
> > > > > > > > >
> > > > > > > > > > I always assumed that Microchip hss.bin is the preferre=
d BIOS for the
> > > > > > > > > > QEMU microchip-icicle-kit machine but I guess that's no=
t true.
> > > > > > > > >
> > > > > > > > > Unfortunately the HSS has not worked in QEMU for a long t=
ime, and while
> > > > > > > > > I would love to fix it, but am pretty stretched for spare=
 time to begin
> > > > > > > > > with.
> > > > > > > > > I usually just do direct kernel boots, which use the Open=
SBI that comes
> > > > > > > > > with QEMU, as I am sure you already know :)
> > > > > > > > >
> > > > > > > > > > At this point, you can either:
> > > > > > > > > > 1) Use latest OpenSBI on QEMU microchip-icicle-kit mach=
ine
> > > > > > > >
> > > > > > > > I forgot to reply to this point, wondering what should be d=
one with
> > > > > > > > QEMU. Bumping to v1.3 in QEMU introduces a regression here,=
 regardless
> > > > > > > > of whether I can go and build a fixed version of OpenSBI.
> > > > > > > >
> > > > > > > FYI: The no-map fix went in OpenSBI v1.3. Without the upgrade=
, any
> > > > > > > user using the latest kernel (> v6.4)
> > > > > > > may hit those random linear map related issues (in hibernatio=
n or EFI
> > > > > > > booting path).
> > > > > > >
> > > > > > > There are three possible scenarios:
> > > > > > >
> > > > > > > 1. Upgrade to OpenSBI v1.3: Any user of microchip-icicle-kit =
machine
> > > > > > > or sifive fu540 machine users
> > > > > > > may hit this issue if the device tree has the disabled hart (=
e core).
> > > > > > > 2. No upgrade to OpenSBI v1.2. Any user using hibernation or =
UEFI may
> > > > > > > have issues [1]
> > > > > > > 3. Include a non-release version OpenSBI in Qemu with the fix=
 as an exception.
> > > > > > >
> > > > > > > #3 probably deviates from policy and sets a bad precedent. So=
 I am not
> > > > > > > advocating for it though ;)
> > > > > > > For both #1 & #2, the solution would be to use the latest Ope=
nSBI in
> > > > > > > -bios argument instead of the stock one.
> > > > > > > I could be wrong but my guess is the number of users facing #=
2 would
> > > > > > > be higher than #1.
> > > > > >
> > > > > > Thanks for that info Atish!
> > > > > >
> > > > > > We are stuck in a bad situation.
> > > > > >
> > > > > > The best solution would be if OpenSBI can release a 1.3.1, @Anu=
p Patel
> > > > > > do you think you could do that?
> > > > >
> > > > > OpenSBI has a major number and minor number in the version but it=
 does
> > > > > not have release/patch number so best would be to treat OpenSBI v=
X.Y.Z
> > > > > as bug fixes on-top-of OpenSBI vX.Y. In other words, supervisor s=
oftware
> > > > > won't be able to differentiate between OpenSBI vX.Y.Z and OpenSBI=
 vX.Y
> > > > > using sbi_get_impl_version().
> > > > >
> > > > > There are only three commits between the ACLINT fix and OpenSBI v=
1.3
> > > > > so as one-of case I will go ahead create OpenSBI v1.3.1 containin=
g only
> > > > > four commits on-top of OpenSBI v1.3
> > > > >
> > > > > Does this sound okay ?
> > > >
> > > > That sounds fine to me. It fixes the issue for the Microsemi board =
and
> > > > it's a very small change between 1.3 and 1.3.1
> > >
> > > Please check
> > > https://github.com/riscv-software-src/opensbi/releases/tag/v1.3.1
> > >
> > > I hope this helps.
> >
> > Hi Alistair,
> >
> > Do we need to update QEMU's opensbi binaries to v1.3.1?
> >
> > Hi Anup,
> >
> > Somehow I cannot see the 'tag' v1.3.1 being populated in the opensbi
> > git repo. Am I missing anything?
>
> There is a v1.3.1 tag in https://github.com/riscv-software-src/opensbi
> (Try cloning the repo again?)
>
> The commit history of v1.3.1 is v1.3 tag + 5 cherry picked commits
> which means the commit history of the master branch is not the same
> as the commit history of v1.3.1.

I see. I was seeing a github warning message when I see the last
commit [1] from tag v1.3.1:

"This commit does not belong to any branch on this repository, and may
belong to a fork outside of the repository."

and was misled. Thanks for the hint. I now added "--tags" when I do a
git fetch and now is seeing the new tag.

[1] https://github.com/riscv-software-src/opensbi/commit/057eb10b6d52354001=
2e6947d5c9f63e95244e94

Regards,
Bin

