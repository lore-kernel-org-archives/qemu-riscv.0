Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lBnoj-0001lN-0k
	for mharc-qemu-riscv@gnu.org; Mon, 15 Feb 2021 19:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lBnoh-0001it-DZ; Mon, 15 Feb 2021 19:02:11 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:40525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lBnof-0000gB-JC; Mon, 15 Feb 2021 19:02:11 -0500
Received: by mail-io1-xd2f.google.com with SMTP id i8so4164671iog.7;
 Mon, 15 Feb 2021 16:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ABztf+f6y72C9fnGNo0IZQqgq+8P63WIRwXANiYq8I4=;
 b=J3tl3tORfoACEqlzjJjcvbjVw6C74+H4agdYCHbq9gZIFbtTPoAf+Mvcfj3yASO6ZK
 7jJvYOzeZjwRSP7NLMDdo+Ilsi7e/VgHaAJgt6unm58EadrHaKXvgd7RlhNODvLVRxrw
 qG8RBpGbphuPQnoYdheqsuk9NAHKcBPEgZ0uAqMVhERDdyFSu0J97KETp681PLtdW56X
 sqiYI5u7bU2aYR2SUKgVeCjQzoEk/l8Y3rFtM7H2AUouSxWFJwmCWhUi/Mn9DnpSRAv+
 Ywgn0xloaQMz7RmNezPj9Qg4nWPlz+bcXFJbSBqOT8pbYCfaydP0LYJ9RNwUZci8k9kr
 ic8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ABztf+f6y72C9fnGNo0IZQqgq+8P63WIRwXANiYq8I4=;
 b=mflhMe1Sw68t+ZnzgdU8QvUiHeiJJ4BKA1DRtHS/MWGjgIt+zM74wFFm7zmGkGjCdL
 nKSfF8mYsnJwSeThLPxMZz8gmfAL8hnCAkhGmRJJZv/dxpIH2fxTDlVUDXcLi0mbgZFD
 5msBkQxNGHTL9RLrZ1BPHJeXAKEkbKyItt0dzwZmw4HNKeojWIrfBIk8rtf5Jxi4d1If
 bfL/MFYkyfiwZdYisxiGXagnfpI1R1HncASDQq1CLZ4Nr+uD6TTbK3uYxc+xCKrelQvZ
 nWSv1qwC7XpFp8nVapzop3BMRMKLBzC/FWPBGDycWSsFCMINx/4HZN9VpU1MtB7X5/Oa
 KbTw==
X-Gm-Message-State: AOAM532rOIxBZrlB9iyjt9oHgZPhbhjCqNJR8qBj30fyp/a+2OmU35Q2
 Gc+7MDke8R/ZkA3h2F5Wlmp4s5XhHllh0GvflcE=
X-Google-Smtp-Source: ABdhPJxlMRTQ3Nzh3Q445zrT1owDcj4hJ2uNIpAkDmybtFjRT0f4o0moJ3EdP02g30MX3D14LJYd7RtoMX7LPuWH3r8=
X-Received: by 2002:a05:6638:2683:: with SMTP id
 o3mr8356035jat.8.1613433727573; 
 Mon, 15 Feb 2021 16:02:07 -0800 (PST)
MIME-Version: 1.0
References: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
 <CAKmqyKP7tig8Lh=qktUnM+HMhZK0__qTgRXDeCayiZ-S0fyGTA@mail.gmail.com>
 <CAFukJ-DcspptvOzcqHEdXsdXZbu4uSVrOgwjVbc41BpMOtq=+Q@mail.gmail.com>
In-Reply-To: <CAFukJ-DcspptvOzcqHEdXsdXZbu4uSVrOgwjVbc41BpMOtq=+Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Feb 2021 16:01:25 -0800
Message-ID: <CAKmqyKOjHHGqBfT4mz8tcmucsF9d8XmTrCiZhYeF367U7_nE-Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] RISC-V Pointer Masking implementation
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "space.monkey.delivers@gmail.com" <space.monkey.delivers@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Dave Smith <kupokupokupopo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Feb 2021 00:02:11 -0000

On Mon, Feb 15, 2021 at 12:52 PM Alexey Baturo <baturo.alexey@gmail.com> wr=
ote:
>
> Hi Alistair,
>
> Sorry for the late reply.
>
> >Do you know the current state of the spec?
> As far as I can tell, the spec for PointerMasking is quite frozen: it has=
 not been updated for quite some time, but some of the clarifications have =
not been included in the actual spec.
> I'll ask the J workgroup if they could do draft release v0.1, while I'll =
address the fixed you proposed in this patch series.
> Meanwhile could you please tell, if it's ok to push several series of pat=
ches to claim the support of i.e. v0.1 or it's mandatory to push all the pa=
tches at once?

You can post multiple patches on the list, but I wouldn't claim to
support v0.1 until there is a v0.1 to claim.

For actual changes being merged we can only claim to support v0.1 when
there is a v0.1 and it is supported. We can push the patches in
stages, for example we can merge some tidy ups before merging the full
support, but we can't allow a user to enable support (or advertise it)
until it's fully supported.

Alistair

>
> Thanks!
>
> =D1=81=D1=80, 3 =D1=84=D0=B5=D0=B2=D1=80. 2021 =D0=B3. =D0=B2 22:22, Alis=
tair Francis <alistair23@gmail.com>:
>>
>> On Sun, Jan 10, 2021 at 10:54 AM Alexey Baturo <baturo.alexey@gmail.com>=
 wrote:
>> >
>> > Hi folks,
>> >
>> > Sorry it took me almost 3 month to provide the reply and fixes: it was=
 a really busy EOY.
>> > This series contains fixed @Alistair suggestion on enabling J-ext.
>> >
>> > As for @Richard comments:
>> > - Indeed I've missed appending review-by to the approved commits. Now =
I've restored them except for the fourth commit. @Richard could you please =
tell if you think it's still ok to commit it as is, or should I support mas=
king mem ops for RVV first?
>> > - These patches don't have any support for load/store masking for RVV =
and RVH extensions, so no support for special load/store for Hypervisor in =
particular.
>> >
>> > If this patch series would be accepted, I think my further attention w=
ould be to:
>> > - Support pm for memory operations for RVV
>> > - Add proper csr and support pm for memory operations for Hypervisor m=
ode
>> > - Support address wrapping on unaligned accesses as @Richard mentioned=
 previously
>>
>> Overall this looks fine.
>>
>> Unfortunately it doesn't look like there is a release of the pointer
>> masking spec. Until there is a release (a draft release counts) we
>> can't accept it. We need a version to point to so that we can say "we
>> support v0.1 of the RISC-V pointer masking spec". Otherwise we are
>> chasing a moving target and users don't know what version we do/don't
>> support.
>>
>> Do you know the current state of the spec?
>>
>> Alistair
>>
>> >
>> > Thanks!
>> >
>> > Alexey Baturo (5):
>> >   [RISCV_PM] Add J-extension into RISC-V
>> >   [RISCV_PM] Support CSRs required for RISC-V PM extension except for
>> >     the ones required for hypervisor mode
>> >   [RISCV_PM] Print new PM CSRs in QEMU logs
>> >   [RISCV_PM] Support pointer masking for RISC-V for i/c/f/d/a types of
>> >     instructions
>> >   [RISCV_PM] Allow experimental J-ext to be turned on
>> >
>> > Anatoly Parshintsev (1):
>> >   [RISCV_PM] Implement address masking functions required for RISC-V
>> >     Pointer Masking extension
>> >
>> >  target/riscv/cpu.c                      |  30 +++
>> >  target/riscv/cpu.h                      |  33 +++
>> >  target/riscv/cpu_bits.h                 |  66 ++++++
>> >  target/riscv/csr.c                      | 271 +++++++++++++++++++++++=
+
>> >  target/riscv/insn_trans/trans_rva.c.inc |   3 +
>> >  target/riscv/insn_trans/trans_rvd.c.inc |   2 +
>> >  target/riscv/insn_trans/trans_rvf.c.inc |   2 +
>> >  target/riscv/insn_trans/trans_rvi.c.inc |   2 +
>> >  target/riscv/translate.c                |  44 ++++
>> >  9 files changed, 453 insertions(+)
>> >
>> > --
>> > 2.20.1
>> >
>> >

