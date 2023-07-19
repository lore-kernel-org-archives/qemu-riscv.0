Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C51EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 15:46:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qM9NO-00046L-Fj; Wed, 19 Jul 2023 11:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1qM9NH-00045c-QH; Wed, 19 Jul 2023 11:45:59 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1qM9ND-0002C9-Dp; Wed, 19 Jul 2023 11:45:57 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5216569f9e3so8121656a12.0; 
 Wed, 19 Jul 2023 08:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689781552; x=1690386352;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ESiicnacKgjYU4xCMLBkJGDm83V9s3pYCMFnef4CTr4=;
 b=e+DsoSNoDfpPTcXWYTiJ5FRsuUdXOQ7Ut/N3J9fhTSyXSCk8eZAoB5LsiHgqdPur7q
 15icaQxsFt7c2OQY+TXBNofq+z+XoHJSYj3G6vsYG63Gm34RuMDoEJyavdjHXIJUxXcd
 mUHmKyvbQn5taesN+vmikzjFiSxfKBfO+Y12xFJKZxlB0o8YZI4rH8/TBvtlsbMOqRZY
 6aYgnzcXrDlsNdZhq6HziivNR4J+tIZWnW1DxjyQnziMotd7VVCTIOENUvUl0qp7G5sb
 8mkL4TtbdP8AZbQIw9q9XdEfyjbtjKJPbL1az08CMp00t9Zgh6Di4qs+6yAIPjo5r01I
 ShdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689781552; x=1690386352;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ESiicnacKgjYU4xCMLBkJGDm83V9s3pYCMFnef4CTr4=;
 b=KFDorgF0ej9SXmdEserJDEN4xKhS/aC46F8r6zJdkVclddiZemXCJ+YsV3I0INUEO/
 imu6J3WQlRT8aIzpNBO/YEL/fuJ1MAMEr07OjbxdiifLsKywsODRck138zCFweIH515J
 Pz2OKcOh4VSAiQCuZAymf8z4OxKjUoXn2G0gijdoFvEAVZsHbUZ7O6q2/4yFy6SPd31F
 9XddykZoI4i5Ay0o3Oq5hkj5ErMtPGjbf4Op4x/j0zo2HURdW+Z2j4/IQyVt+HJkbZpw
 M3H4VcJzsqd1l2TtGgH7yQyP9QN/3/51hlC2xYhKE6JnTamz/PP3jNvDNf2IDte2KD6g
 iVTg==
X-Gm-Message-State: ABy/qLbbQVoWecl5pEQHea9SPaBq76Q7wGe1Blzlh9SKbAk0BSUgJ6LW
 VFi2IYbGWRU4mrKZuGvFG5bQGk355K3VnW/UTX0=
X-Google-Smtp-Source: APBJJlHtH7y5XsFP7f02qbnwWK+EbBWM3Tttb0rQpm3z/T8LEr+FrTCDWBGCWeUDTH1cTrjUhNs9J1ueSKikxiNwWog=
X-Received: by 2002:aa7:de11:0:b0:51d:e495:626a with SMTP id
 h17-20020aa7de11000000b0051de495626amr2735748edv.6.1689781551777; Wed, 19 Jul
 2023 08:45:51 -0700 (PDT)
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
In-Reply-To: <CAAhSdy1vkk6xj7HSyPHKN0d0qgYrq_rn-+iw_rxkdDBKqpC2yw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 19 Jul 2023 23:45:40 +0800
Message-ID: <CAEUhbmVoYnOMEi_Hqi7iX0__jTjbEnaxrHjCJHuMVaUAcMiACA@mail.gmail.com>
Subject: Re: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re: [PATCH
 for-8.2 6/7] target/riscv: add 'max' CPU type)
To: Anup Patel <anup@brainfault.org>
Cc: Alistair Francis <alistair23@gmail.com>,
 Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <apatel@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>,
 Conor Dooley <conor@kernel.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org, 
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, 
 opensbi@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x532.google.com
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

On Wed, Jul 19, 2023 at 11:22=E2=80=AFPM Anup Patel <anup@brainfault.org> w=
rote:
>
> On Wed, Jul 19, 2023 at 3:23=E2=80=AFPM Alistair Francis <alistair23@gmai=
l.com> wrote:
> >
> > On Wed, Jul 19, 2023 at 3:39=E2=80=AFPM Anup Patel <anup@brainfault.org=
> wrote:
> > >
> > > On Wed, Jul 19, 2023 at 7:03=E2=80=AFAM Alistair Francis <alistair23@=
gmail.com> wrote:
> > > >
> > > > On Sat, Jul 15, 2023 at 7:14=E2=80=AFPM Atish Patra <atishp@atishpa=
tra.org> wrote:
> > > > >
> > > > > On Fri, Jul 14, 2023 at 5:29=E2=80=AFAM Conor Dooley <conor@kerne=
l.org> wrote:
> > > > > >
> > > > > > On Fri, Jul 14, 2023 at 11:19:34AM +0100, Conor Dooley wrote:
> > > > > > > On Fri, Jul 14, 2023 at 10:00:19AM +0530, Anup Patel wrote:
> > > > > > >
> > > > > > > > > > OpenSBI v1.3
> > > > > > > > > >    ____                    _____ ____ _____
> > > > > > > > > >   / __ \                  / ____|  _ \_   _|
> > > > > > > > > >  | |  | |_ __   ___ _ __ | (___ | |_) || |
> > > > > > > > > >  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> > > > > > > > > >  | |__| | |_) |  __/ | | |____) | |_) || |_
> > > > > > > > > >   \____/| .__/ \___|_| |_|_____/|___/_____|
> > > > > > > > > >         | |
> > > > > > > > > >         |_|
> > > > > > > > > >
> > > > > > > > > > init_coldboot: ipi init failed (error -1009)
> > > > > > > > > >
> > > > > > > > > > Just to note, because we use our own firmware that vend=
ors in OpenSBI
> > > > > > > > > > and compiles only a significantly cut down number of fi=
les from it, we
> > > > > > > > > > do not use the fw_dynamic etc flow on our hardware. As =
a result, we have
> > > > > > > > > > not tested v1.3, nor do we have any immediate plans to =
change our
> > > > > > > > > > platform firmware to vendor v1.3 either.
> > > > > > > > > >
> > > > > > > > > > I unless there's something obvious to you, it sounds li=
ke I will need to
> > > > > > > > > > go and bisect OpenSBI. That's a job for another day tho=
ugh, given the
> > > > > > > > > > time.
> > > > > > > > > >
> > > > > > > >
> > > > > > > > The real issue is some CPU/HART DT nodes marked as disabled=
 in the
> > > > > > > > DT passed to OpenSBI 1.3.
> > > > > > > >
> > > > > > > > This issue does not exist in any of the DTs generated by QE=
MU but some
> > > > > > > > of the DTs in the kernel (such as microchip and SiFive boar=
d DTs) have
> > > > > > > > the E-core disabled.
> > > > > > > >
> > > > > > > > I had discovered this issue in a totally different context =
after the OpenSBI 1.3
> > > > > > > > release happened. This issue is already fixed in the latest=
 OpenSBI by the
> > > > > > > > following commit c6a35733b74aeff612398f274ed19a74f81d1f37 (=
"lib: utils:
> > > > > > > > Fix sbi_hartid_to_scratch() usage in ACLINT drivers").
> > > > > > >
> > > > > > > Great, thanks Anup! I thought I had tested tip-of-tree too, b=
ut
> > > > > > > obviously not.
> > > > > > >
> > > > > > > > I always assumed that Microchip hss.bin is the preferred BI=
OS for the
> > > > > > > > QEMU microchip-icicle-kit machine but I guess that's not tr=
ue.
> > > > > > >
> > > > > > > Unfortunately the HSS has not worked in QEMU for a long time,=
 and while
> > > > > > > I would love to fix it, but am pretty stretched for spare tim=
e to begin
> > > > > > > with.
> > > > > > > I usually just do direct kernel boots, which use the OpenSBI =
that comes
> > > > > > > with QEMU, as I am sure you already know :)
> > > > > > >
> > > > > > > > At this point, you can either:
> > > > > > > > 1) Use latest OpenSBI on QEMU microchip-icicle-kit machine
> > > > > >
> > > > > > I forgot to reply to this point, wondering what should be done =
with
> > > > > > QEMU. Bumping to v1.3 in QEMU introduces a regression here, reg=
ardless
> > > > > > of whether I can go and build a fixed version of OpenSBI.
> > > > > >
> > > > > FYI: The no-map fix went in OpenSBI v1.3. Without the upgrade, an=
y
> > > > > user using the latest kernel (> v6.4)
> > > > > may hit those random linear map related issues (in hibernation or=
 EFI
> > > > > booting path).
> > > > >
> > > > > There are three possible scenarios:
> > > > >
> > > > > 1. Upgrade to OpenSBI v1.3: Any user of microchip-icicle-kit mach=
ine
> > > > > or sifive fu540 machine users
> > > > > may hit this issue if the device tree has the disabled hart (e co=
re).
> > > > > 2. No upgrade to OpenSBI v1.2. Any user using hibernation or UEFI=
 may
> > > > > have issues [1]
> > > > > 3. Include a non-release version OpenSBI in Qemu with the fix as =
an exception.
> > > > >
> > > > > #3 probably deviates from policy and sets a bad precedent. So I a=
m not
> > > > > advocating for it though ;)
> > > > > For both #1 & #2, the solution would be to use the latest OpenSBI=
 in
> > > > > -bios argument instead of the stock one.
> > > > > I could be wrong but my guess is the number of users facing #2 wo=
uld
> > > > > be higher than #1.
> > > >
> > > > Thanks for that info Atish!
> > > >
> > > > We are stuck in a bad situation.
> > > >
> > > > The best solution would be if OpenSBI can release a 1.3.1, @Anup Pa=
tel
> > > > do you think you could do that?
> > >
> > > OpenSBI has a major number and minor number in the version but it doe=
s
> > > not have release/patch number so best would be to treat OpenSBI vX.Y.=
Z
> > > as bug fixes on-top-of OpenSBI vX.Y. In other words, supervisor softw=
are
> > > won't be able to differentiate between OpenSBI vX.Y.Z and OpenSBI vX.=
Y
> > > using sbi_get_impl_version().
> > >
> > > There are only three commits between the ACLINT fix and OpenSBI v1.3
> > > so as one-of case I will go ahead create OpenSBI v1.3.1 containing on=
ly
> > > four commits on-top of OpenSBI v1.3
> > >
> > > Does this sound okay ?
> >
> > That sounds fine to me. It fixes the issue for the Microsemi board and
> > it's a very small change between 1.3 and 1.3.1
>
> Please check
> https://github.com/riscv-software-src/opensbi/releases/tag/v1.3.1
>
> I hope this helps.

Hi Alistair,

Do we need to update QEMU's opensbi binaries to v1.3.1?

Hi Anup,

Somehow I cannot see the 'tag' v1.3.1 being populated in the opensbi
git repo. Am I missing anything?

Regards,
Bin

