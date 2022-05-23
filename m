Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntG6w-00043j-7X
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 18:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntG6u-00043X-Uj; Mon, 23 May 2022 18:01:09 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:42919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntG6t-00009c-1T; Mon, 23 May 2022 18:01:08 -0400
Received: by mail-io1-xd33.google.com with SMTP id a10so16676368ioe.9;
 Mon, 23 May 2022 15:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CeuYfSrLWiwJnvUX76MniqXCcVgGeMnUPLL3TfZMk1I=;
 b=V8mP5dNAiCc1Avmi8k2vHUwxV/M+kGYRPWID2te5He7bAaOM1gMyk2BQJlUn41/ZQL
 DgHRCM8vr25kMn6dBgS4OJOhZvtPlwoFKRLgLqV/WflHXGhxISl0fDCnkoC0J9/CYP39
 +t7SP++aJLrb+gmmOmJvJHoOXbSDslUKwzARbu+lclfCOeQk1LMC80/BvMvcZUYm71LU
 nrE8uHRxqVxenb0rrZwlQidNzhOlfnDPYYzNPaGTbaizGmqbcMgHTA/DUCJJ4CCehZ96
 K1djbPF8P3Q977zYFtLpWFR5Lce34cHVSRJm+c3H+dpJK9lMdY97xBXDt3elLmH6pksy
 v6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CeuYfSrLWiwJnvUX76MniqXCcVgGeMnUPLL3TfZMk1I=;
 b=hxPp1GuF52+yw59hjXPl7NyCTJ88EGm9A40DqoUlksla35yktcVvqBhy2gQKk3kal3
 86HH/PQSvQU/Kzlr6uNz3dRxtqydLlB6CbpoO/iWgqtw0lmnHVfxtUeKhfaEqidhAOK3
 0oe0Z1FgqaKoScYOva7DC8IkurzmcfTxJ6pDywL0wz9r40qW+RoKj77O55Y4MaHflPUT
 7A/VHeM9aAA+VmBVmO5zAg+5PWelxVD6ALkO48TZQNRB+FEeLlAkPO+9UzD1MDgcL4io
 V6+BeEy4bXsyrdQnF6b7Ikw4BxwoCWY4nCcEpa0cH8wiD75IoqNZvE+dWghhpbDw1cQZ
 iNbA==
X-Gm-Message-State: AOAM533RM85lKIXJ9CB7GlfMxOISzXTxr5roS4Zj9ufoltU5LnOFyAbF
 EV3x5sRmvfCT3URXZ5mYyVW2cHmZEZ24oTZ5vmY=
X-Google-Smtp-Source: ABdhPJx9CvFE1+CegYPxUMQhjbCdDBVW8EVrQBpuvoYEYKV//mm95ZDFfWv5OrF3sw9N1jXNPbE9fX5AiWWcOGGkmoQ=
X-Received: by 2002:a05:6638:1411:b0:32e:c01f:e93e with SMTP id
 k17-20020a056638141100b0032ec01fe93emr4337675jad.21.1653343265371; Mon, 23
 May 2022 15:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <YoTqwpfrodveJ7CR@Sun>
 <CAKmqyKMRPmQVy7_6iWL9KT_S+uYY0Wzb2OZSEA86Y7outG2gHA@mail.gmail.com>
 <You7kV0J5GKcMWRP@Sun>
In-Reply-To: <You7kV0J5GKcMWRP@Sun>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 May 2022 08:00:39 +1000
Message-ID: <CAKmqyKPRGLo5beAzopYRUKq72qrCRLdTr_bF-Nou5zXc9BRePA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: add zicsr/zifencei to isa_string
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, 
 Tsukasa OI <research_trasio@irq.a4lg.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Mon, 23 May 2022 22:01:09 -0000

On Tue, May 24, 2022 at 2:51 AM Hongren (Zenithal) Zheng <i@zenithal.me> wrote:
>
> On Mon, May 23, 2022 at 09:22:15AM +1000, Alistair Francis wrote:
> > On Wed, May 18, 2022 at 10:50 PM Hongren (Zenithal) Zheng <i@zenithal.me> wrote:
> > >
> > > Zicsr/Zifencei is not in 'I' since ISA version 20190608,
> > > thus to fully express the capability of the CPU,
> > > they should be exposed in isa_string.
> > >
> > > Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> > > ---
> > >  target/riscv/cpu.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index 6d01569cad..61fa9b97a4 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -1027,6 +1027,8 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> > >       *    extensions by an underscore.
> > >       */
> > >      struct isa_ext_data isa_edata_arr[] = {
> > > +        ISA_EDATA_ENTRY(zicsr, ext_icsr),
> > > +        ISA_EDATA_ENTRY(zifencei, ext_ifencei),
> >
> > Shouldn't we have a spec version check here?
>
> I think that can be done, but most of the time it is not necessary.
> For old specs, the "short-isa-string" can be a workaround.
>
> This patch is actually a follow-up of "target/riscv: Change "G" expansion"
> https://github.com/alistair23/qemu/commit/72bd25b7b88d0536bfb5666990e296587d4057a5
> where "G" is expanded with "zicsr"/"zifencei" without checking
> unpriv spec version.
>
> From the summary from Kito from gnu toolchain
> https://lkml.org/lkml/2022/1/24/537
> we know that there are at least 3 formally released unpriv specs:
> 2.2, 20190608 and 20191213, and frequent informal release from
> https://github.com/riscv/riscv-isa-manual/releases
>
> If we add a spec check, we need to add a PROP_STRING and
> and parse the version. We then need an enum like
> PRIV_VERSION_1_12_0 and we needs to g_strcmp0
> in riscv_cpu_realize, just as what priv spec had done.
>
> And we need to define a default unpriv spec version, which
> should be 20191213.
>
> I can add a separate patch for it if you do think it is necessary.
>
> If the guest does want old spec version, I think the recently added
> "short-isa-string" option from Tsukasa OI is suitable.
> Instead of -cpu rv64,unpriv_spec=2.2 they can just use
> -cpu rv64,short-isa-string=true to solve the issue.

Ok, fair point

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> Cc Tsukasa OI
>
> >
> > Alistair
> >
> > >          ISA_EDATA_ENTRY(zfh, ext_zfh),
> > >          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> > >          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> > > --
> > > 2.35.1
> > >
> > >

