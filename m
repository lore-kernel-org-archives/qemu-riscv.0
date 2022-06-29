Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6PLw-0006bk-0n
	for mharc-qemu-riscv@gnu.org; Wed, 29 Jun 2022 00:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1o6PLu-0006bJ-ID
 for qemu-riscv@nongnu.org; Wed, 29 Jun 2022 00:30:58 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1o6PLs-00020W-Cf
 for qemu-riscv@nongnu.org; Wed, 29 Jun 2022 00:30:58 -0400
Received: by mail-wr1-x434.google.com with SMTP id i25so14997145wrc.13
 for <qemu-riscv@nongnu.org>; Tue, 28 Jun 2022 21:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ORn/xm9l621G2gk438Ur7Zcqma3//YNjMnHfREHxlwE=;
 b=lAxCOTx7xIsZBnHmiklZml4ZzIlIX8EkWBWMZ+zWpJY2IdkVSJgE1fsutD7oC/xjhu
 cPRxr/cjqrV+aP6KMmPTjRBYzn36tv7VgywrdYsIp3p7OcKYzHXxotj/eR1Wwwb83CWO
 OhK3Ytwomb9xVekI2qV2VvvEOFTccLIfs/p0NLywBEFKt5Oe9Egka9Jgkh/ZLft6Vm6B
 T5+KoCngBrLtB9pw1GcLbezLDIMVK0gmQta5dQ1l0uR8r/ELIXwjojKh7AQ7IRNQLYRx
 msYI85QW6gZ/ewefvAKxVCagzeCLnpx6J/SMubHxusfEFGViMaqT/sapFldEFA7XfoG+
 Y2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ORn/xm9l621G2gk438Ur7Zcqma3//YNjMnHfREHxlwE=;
 b=FKCOqWzJ+0Q0qUqH0vrx53V8vf8pSi+n8zBWbzg+c2aD2xbDxc1jZZ7GOelTo1Vxqf
 XSIX17eIvmXCZTN95WeIWLMXzH1dhXqMkB76HKe3fHw3RdmbIBP/gkLMRO1y2yqZDW/9
 ywf9doKi+z+/6DkhOHJmDxLoXLGv7ufNvj5SJS0/nfBERPem60J0wNrPGsLeIwiXKi9m
 afF/n1kdJfmPBRuMYBiglngtelIW25y+zZtEK5r+gTW93n9unXxemmhyReBIm3AFKh4y
 nQ4fvgurzE8eLU7Ce5Ru0A+54bhNN1V7ZbEXaE6fuBJg8AP/GSTagFut1oE3COehNg1I
 RcHQ==
X-Gm-Message-State: AJIora9zMZZaTmml1bb4fljQubY6uuTh89bXhInYFMX/tL0huz9ilm2g
 5AwvOc4YZ7RM5V14LvGnlF6sZlR/luzwwXb2YmEmIg==
X-Google-Smtp-Source: AGRyM1t3Cgzt5BFB1AznOtxyJtlypPi4E0cuIEWVZpraSQAwYfIt5aFKWsIWUkiHRVm3Xw9k2vU4t98ME1TGocxSj1w=
X-Received: by 2002:a5d:4532:0:b0:21b:ab1e:e9fa with SMTP id
 j18-20020a5d4532000000b0021bab1ee9famr1024528wra.214.1656477053826; Tue, 28
 Jun 2022 21:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220627164044.1512862-1-rpathak@ventanamicro.com>
 <CAKmqyKPekJ0v6gXJZh=cptRE8TXVqpB_2XtG1X_-oSgcmcf58w@mail.gmail.com>
 <CA+Oz1=Yi42RtJ6CphL0d8KYjeZhDu7H101JY59rL0fO+4oq9zQ@mail.gmail.com>
 <CAEUhbmV45wwZx72y6D2Vcn0VcwtfCRvma574inuCCYw48gCfCg@mail.gmail.com>
In-Reply-To: <CAEUhbmV45wwZx72y6D2Vcn0VcwtfCRvma574inuCCYw48gCfCg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jun 2022 10:00:43 +0530
Message-ID: <CAAhSdy2DtLs7T2vevBanXxTXV3=c69DAF7u3-F+U-6Mm3qCheQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: fix user-mode build issue because mhartid
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Rahul Pathak <rpathak@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <apatel@ventanamicro.com>, 
 Rahul Pathak <rpathakmailbox@gmail.com>, 
 =?UTF-8?Q?V=C3=ADctor_Colombo?= <victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::434;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
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
X-List-Received-Date: Wed, 29 Jun 2022 04:30:58 -0000

On Wed, Jun 29, 2022 at 9:27 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Rahul,
>
> On Wed, Jun 29, 2022 at 10:07 AM Rahul Pathak <rpathak@ventanamicro.com> wrote:
> >
> > Hi Alistair
> >
> > My fix patch needs to be dropped since Anup took care of this issue
> > in his yesterdays series update in this patch -
> > [PATCH v8 4/4] target/riscv: Force disable extensions if priv spec
> > version does not match
>
> I don't understand. Each patch should keep bisectability.

The patches are already bisectable. There was a compile error until
v6 which was fixed in v7 by squashing this patch into PATCH4.

>
> This sounds like to me, that
> [PATCH v8 4/4] target/riscv: Force disable extensions if priv spec
> version does not match
>
> has an issue that it does 2 things: one is to fix this bug, and the
> other one is to force disable extensions.
>
> Which is not right.

The bug is fixed as a result of force disabling extensions which
don't match the priv spec version.

Regards,
Anup

