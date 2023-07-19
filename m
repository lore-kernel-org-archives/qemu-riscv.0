Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E9DEB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:11:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qM9la-00042j-Dd; Wed, 19 Jul 2023 12:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1qM9lY-000428-Uz
 for qemu-riscv@nongnu.org; Wed, 19 Jul 2023 12:11:04 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1qM9lV-0007oL-4z
 for qemu-riscv@nongnu.org; Wed, 19 Jul 2023 12:11:04 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-55c85b4b06bso3967069a12.2
 for <qemu-riscv@nongnu.org>; Wed, 19 Jul 2023 09:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689783058; x=1690387858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vDnockqCjuUtWDtt9m6NLD5AOJAc/aICjOMxuN5auOU=;
 b=PGAjKq16ed3XnLGPKbgX8lD1nTEFkygjLsoF3vkYI2XTba2TQl0nEfUZKIcQLYeCCk
 mn0bzEAnNjaEscCh7nVLKaniveaS19SkvdAaFVz2B4Q3Km/42xXsjW5QRFNpv6SdY8AD
 NkYO1IGUxL3SAmsXJ7U4GSVXRiFPPBxKxj7voA7Hb4nlChCn0eni/ENnoFxcUf+OVjlB
 lMCm96dI0orhRdcsFDWtBfRvUus6z55nIQ5A3ONSxcDTItMyp5+lodfk+TV5rY3xIG5K
 NYfuS2J/8cfoRm3aq2F829qAkOQRRHOD2qxk9qxTga+SwV/KqQmSld2hsY3dpT9ebjsW
 +ZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689783058; x=1690387858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vDnockqCjuUtWDtt9m6NLD5AOJAc/aICjOMxuN5auOU=;
 b=VeBQLwhQx0v6tXXbsgdxmxlGmS/wGfjcfNMbP/04aOK1x+PDZwCSN2+aljpcQjMmpF
 adMRw8F9Mf+A7/9jlWa9VDFfqprfo8WhkOcS7Al9onlHrpgZvTeMoqJ8CKvx02Z5JtKf
 Ppa22yz5kKUuf5z3WNaJgeJ37LFicOnPseYeyApOMxh/axa1RWJdDjFaLUaQv+Jqa3va
 ticF73xiHTWpy3kYBJdIfF0EKXQzbEioL4a/s7kY3sJhnU2tWcXewEuGumJ4kvCUSg5j
 2sHwmXjZ4hH1HnlrcHqTmFg+k2tPj9vGDoKwA4X/WzfGRHsWs9pv9TEc4UqF4wLclR3F
 yqTw==
X-Gm-Message-State: ABy/qLYRVhkfPI10fZ822NfFeJCltAU1UxyqnHqSbbtLHYj0V16DvYBk
 fJ+EuMfVGE1OO2DVFhhqxAoIsiNXGmoBZsN+Wakh0Q==
X-Google-Smtp-Source: APBJJlGlqROpmylx6ZeJGAQM0d+577+BShgsi+LYOq8rTU6sd/D32i+ivQ2O5fGVo0D/QEBXybH1dB+1O633pwRd2No=
X-Received: by 2002:a17:90a:ac17:b0:263:f5a5:fb98 with SMTP id
 o23-20020a17090aac1700b00263f5a5fb98mr14681855pjq.28.1689783058349; Wed, 19
 Jul 2023 09:10:58 -0700 (PDT)
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
In-Reply-To: <CAEUhbmVoYnOMEi_Hqi7iX0__jTjbEnaxrHjCJHuMVaUAcMiACA@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 19 Jul 2023 21:40:46 +0530
Message-ID: <CAK9=C2WG8Ro9kUCWBCDVtTYQwoTGbxo=hNgkK9y5HdAqhL=DHg@mail.gmail.com>
Subject: Re: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re: [PATCH
 for-8.2 6/7] target/riscv: add 'max' CPU type)
To: Bin Meng <bmeng.cn@gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi Bin,

On Wed, Jul 19, 2023 at 9:15=E2=80=AFPM Bin Meng <bmeng.cn@gmail.com> wrote=
:
>
> On Wed, Jul 19, 2023 at 11:22=E2=80=AFPM Anup Patel <anup@brainfault.org>=
 wrote:
> >
> > On Wed, Jul 19, 2023 at 3:23=E2=80=AFPM Alistair Francis <alistair23@gm=
ail.com> wrote:
> > >
> > > On Wed, Jul 19, 2023 at 3:39=E2=80=AFPM Anup Patel <anup@brainfault.o=
rg> wrote:
> > > >
> > > > On Wed, Jul 19, 2023 at 7:03=E2=80=AFAM Alistair Francis <alistair2=
3@gmail.com> wrote:
> > > > >
> > > > > On Sat, Jul 15, 2023 at 7:14=E2=80=AFPM Atish Patra <atishp@atish=
patra.org> wrote:
> > > > > >
> > > > > > On Fri, Jul 14, 2023 at 5:29=E2=80=AFAM Conor Dooley <conor@ker=
nel.org> wrote:
> > > > > > >
> > > > > > > On Fri, Jul 14, 2023 at 11:19:34AM +0100, Conor Dooley wrote:
> > > > > > > > On Fri, Jul 14, 2023 at 10:00:19AM +0530, Anup Patel wrote:
> > > > > > > >
> > > > > > > > > > > OpenSBI v1.3
> > > > > > > > > > >    ____                    _____ ____ _____
> > > > > > > > > > >   / __ \                  / ____|  _ \_   _|
> > > > > > > > > > >  | |  | |_ __   ___ _ __ | (___ | |_) || |
> > > > > > > > > > >  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> > > > > > > > > > >  | |__| | |_) |  __/ | | |____) | |_) || |_
> > > > > > > > > > >   \____/| .__/ \___|_| |_|_____/|___/_____|
> > > > > > > > > > >         | |
> > > > > > > > > > >         |_|
> > > > > > > > > > >
> > > > > > > > > > > init_coldboot: ipi init failed (error -1009)
> > > > > > > > > > >
> > > > > > > > > > > Just to note, because we use our own firmware that ve=
ndors in OpenSBI
> > > > > > > > > > > and compiles only a significantly cut down number of =
files from it, we
> > > > > > > > > > > do not use the fw_dynamic etc flow on our hardware. A=
s a result, we have
> > > > > > > > > > > not tested v1.3, nor do we have any immediate plans t=
o change our
> > > > > > > > > > > platform firmware to vendor v1.3 either.
> > > > > > > > > > >
> > > > > > > > > > > I unless there's something obvious to you, it sounds =
like I will need to
> > > > > > > > > > > go and bisect OpenSBI. That's a job for another day t=
hough, given the
> > > > > > > > > > > time.
> > > > > > > > > > >
> > > > > > > > >
> > > > > > > > > The real issue is some CPU/HART DT nodes marked as disabl=
ed in the
> > > > > > > > > DT passed to OpenSBI 1.3.
> > > > > > > > >
> > > > > > > > > This issue does not exist in any of the DTs generated by =
QEMU but some
> > > > > > > > > of the DTs in the kernel (such as microchip and SiFive bo=
ard DTs) have
> > > > > > > > > the E-core disabled.
> > > > > > > > >
> > > > > > > > > I had discovered this issue in a totally different contex=
t after the OpenSBI 1.3
> > > > > > > > > release happened. This issue is already fixed in the late=
st OpenSBI by the
> > > > > > > > > following commit c6a35733b74aeff612398f274ed19a74f81d1f37=
 ("lib: utils:
> > > > > > > > > Fix sbi_hartid_to_scratch() usage in ACLINT drivers").
> > > > > > > >
> > > > > > > > Great, thanks Anup! I thought I had tested tip-of-tree too,=
 but
> > > > > > > > obviously not.
> > > > > > > >
> > > > > > > > > I always assumed that Microchip hss.bin is the preferred =
BIOS for the
> > > > > > > > > QEMU microchip-icicle-kit machine but I guess that's not =
true.
> > > > > > > >
> > > > > > > > Unfortunately the HSS has not worked in QEMU for a long tim=
e, and while
> > > > > > > > I would love to fix it, but am pretty stretched for spare t=
ime to begin
> > > > > > > > with.
> > > > > > > > I usually just do direct kernel boots, which use the OpenSB=
I that comes
> > > > > > > > with QEMU, as I am sure you already know :)
> > > > > > > >
> > > > > > > > > At this point, you can either:
> > > > > > > > > 1) Use latest OpenSBI on QEMU microchip-icicle-kit machin=
e
> > > > > > >
> > > > > > > I forgot to reply to this point, wondering what should be don=
e with
> > > > > > > QEMU. Bumping to v1.3 in QEMU introduces a regression here, r=
egardless
> > > > > > > of whether I can go and build a fixed version of OpenSBI.
> > > > > > >
> > > > > > FYI: The no-map fix went in OpenSBI v1.3. Without the upgrade, =
any
> > > > > > user using the latest kernel (> v6.4)
> > > > > > may hit those random linear map related issues (in hibernation =
or EFI
> > > > > > booting path).
> > > > > >
> > > > > > There are three possible scenarios:
> > > > > >
> > > > > > 1. Upgrade to OpenSBI v1.3: Any user of microchip-icicle-kit ma=
chine
> > > > > > or sifive fu540 machine users
> > > > > > may hit this issue if the device tree has the disabled hart (e =
core).
> > > > > > 2. No upgrade to OpenSBI v1.2. Any user using hibernation or UE=
FI may
> > > > > > have issues [1]
> > > > > > 3. Include a non-release version OpenSBI in Qemu with the fix a=
s an exception.
> > > > > >
> > > > > > #3 probably deviates from policy and sets a bad precedent. So I=
 am not
> > > > > > advocating for it though ;)
> > > > > > For both #1 & #2, the solution would be to use the latest OpenS=
BI in
> > > > > > -bios argument instead of the stock one.
> > > > > > I could be wrong but my guess is the number of users facing #2 =
would
> > > > > > be higher than #1.
> > > > >
> > > > > Thanks for that info Atish!
> > > > >
> > > > > We are stuck in a bad situation.
> > > > >
> > > > > The best solution would be if OpenSBI can release a 1.3.1, @Anup =
Patel
> > > > > do you think you could do that?
> > > >
> > > > OpenSBI has a major number and minor number in the version but it d=
oes
> > > > not have release/patch number so best would be to treat OpenSBI vX.=
Y.Z
> > > > as bug fixes on-top-of OpenSBI vX.Y. In other words, supervisor sof=
tware
> > > > won't be able to differentiate between OpenSBI vX.Y.Z and OpenSBI v=
X.Y
> > > > using sbi_get_impl_version().
> > > >
> > > > There are only three commits between the ACLINT fix and OpenSBI v1.=
3
> > > > so as one-of case I will go ahead create OpenSBI v1.3.1 containing =
only
> > > > four commits on-top of OpenSBI v1.3
> > > >
> > > > Does this sound okay ?
> > >
> > > That sounds fine to me. It fixes the issue for the Microsemi board an=
d
> > > it's a very small change between 1.3 and 1.3.1
> >
> > Please check
> > https://github.com/riscv-software-src/opensbi/releases/tag/v1.3.1
> >
> > I hope this helps.
>
> Hi Alistair,
>
> Do we need to update QEMU's opensbi binaries to v1.3.1?
>
> Hi Anup,
>
> Somehow I cannot see the 'tag' v1.3.1 being populated in the opensbi
> git repo. Am I missing anything?

There is a v1.3.1 tag in https://github.com/riscv-software-src/opensbi
(Try cloning the repo again?)

The commit history of v1.3.1 is v1.3 tag + 5 cherry picked commits
which means the commit history of the master branch is not the same
as the commit history of v1.3.1.

Regards,
Anup

