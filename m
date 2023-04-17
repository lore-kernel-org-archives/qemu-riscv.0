Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poPCW-0006OV-Q8
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 09:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1poJrb-0003Fm-Iv
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 04:05:36 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1poJrZ-0006I4-Th
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 04:05:27 -0400
Received: by mail-oi1-x232.google.com with SMTP id bb20so11191169oib.12
 for <qemu-riscv@nongnu.org>; Mon, 17 Apr 2023 01:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1681718723; x=1684310723;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ShldPFSOK9NKfpXFrdqpQgZ7EzJOUFmNxqmjPySIe2I=;
 b=lgbkv/C4ll82TG3eArCbNRg5V63bbwy1VVj4CocEALtXS4pyBIBOhiWZD/JvcbYFfi
 o5gWlp8rai74f6LndyxymWnAvBo8pkyB5oVw9trB0TPSbgrfcQNZHa1JuIGxo/s7CMyq
 azT9VYZIO82mK96jAbdgpDrRBdjP0G2zjMYpeoperyQtAHXo3MfPwMNdOlLxrEVGWhld
 6hd3ziwQX2SVAVzmanNsDkRwAlk1sO7+BUfgYbyKbJBsflBRmE8j3A4m+Wu1I1apGzgI
 P7+sp7xQM6PvEHA03fHCwXRRpjUkJ0h8id6iZZKCdpSq7BRXeaFWElmcEgvW/KR+yma2
 9JCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681718723; x=1684310723;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ShldPFSOK9NKfpXFrdqpQgZ7EzJOUFmNxqmjPySIe2I=;
 b=UKPdD5s5gwa12nhyKl0vIWJ8V9GjCgspQghNl8VRR1Jfg3gcJy2YSyzOTn73wckE2R
 5mMwhXVRE2PMZjN4Pavw5EAwp5MUcHqRgUgR0IXclSnYXZjGNY1KcQE/kBsExPyT+sVV
 StHFNbGfm+nGU+Ux6O7KwybK9ZdBnQEVYe0ON54Slk5DDLU0ONRKzFTXNyqzvN+Uiqbr
 tbHF7jaqFTTaKnY9yv+qY6VtYx43MLXPQGKtmpgsW5LMWaDCSbkFhCwJ5/94QaXanhkO
 cxyJ9vbh1NnX6Q+XxsfbasSp3Ft69Md9QqPnD/yMaPvsUHo74E1+hdHpfVlFieTcieDV
 tyxQ==
X-Gm-Message-State: AAQBX9fsCeFPymWHsfmysgP3A3I8Rn+QpAj+JZwyoUMtIll+25ql3vtV
 vo5v+OX0f95K+zad9151VX6mKTMUsc36Spw7UOD+1A==
X-Google-Smtp-Source: AKy350bCJ7fS/w83c6a6g/PjQdgtDvOA5hPGdcCz7wHPU/zfDsS3lJxVjPADYpY5FGTMGIAy8HP4rFw/whq8BTLtYfE=
X-Received: by 2002:aca:be08:0:b0:38d:e632:82f6 with SMTP id
 o8-20020acabe08000000b0038de63282f6mr1171139oif.5.1681718723094; Mon, 17 Apr
 2023 01:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAECbVCt_+SCiUzv9cOR4KYC7BE_4TjRGqOndzDthUvara8OxMA@mail.gmail.com>
 <c021529c-67ce-fe7c-1acc-7753715c466f@ventanamicro.com>
 <CALw707rSkT=yUWxrEnNJR8-sDTQWJiiZCz2CxFpwh2TBf7Okfw@mail.gmail.com>
In-Reply-To: <CALw707rSkT=yUWxrEnNJR8-sDTQWJiiZCz2CxFpwh2TBf7Okfw@mail.gmail.com>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 17 Apr 2023 16:05:12 +0800
Message-ID: <CAMWQL2iEQ=KQ5daeh=P=RJ_96=pFuw8Ss53KLaWs--bQrpStgw@mail.gmail.com>
Subject: Re: KVM QEMU AIA support for RISCV guests
To: Rajnesh Kanwal <rkanwal@rivosinc.com>, qemu-riscv@nongnu.org,
 anup@brainfault.org, 
 alistair.francis@wdc.com, Atish Kumar Patra <atishp@rivosinc.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 17 Apr 2023 09:47:14 -0400
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
X-List-Received-Date: Mon, 17 Apr 2023 08:05:38 -0000

> From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Date: Fri, Apr 14, 2023 at 8:40=E2=80=AFPM
> Subject: Re: KVM QEMU AIA support for RISCV guests
> To: Rajnesh Kanwal <rkanwal@rivosinc.com>, <qemu-riscv@nongnu.org>, <anup=
@brainfault.org>, <alistair.francis@wdc.com>, Atish Kumar Patra <atishp@riv=
osinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
>
>
>
>
> On 4/14/23 08:35, Rajnesh Kanwal wrote:
> > Hi All,
> >
> > I am starting to work on KVM-QEMU AIA support for RISCV guests to exten=
d
> > kvm accel support added in [0]. This is just to confirm if anyone else
> > is actively
> > working on it to avoid duplicate effort.
>
> I was going to look into it eventually, but now that you've started I'll =
sit
> back and help with reviews and testing and so on.
>
>
> Thanks,
>
> Daniel
>
> >
> > [0]: https://lists.nongnu.org/archive/html/qemu-riscv/2021-08/msg00117.=
html
> >
> > Thanks,
> > Rajnesh
> >
>

Hi Rajnesh and Daniel,

Recently, I implemented a series of QEMU v7.2-based patches for
KVM-AIA and tested them on the QEMU riscv-virt machine. I plan to
refine the patches and upstream them soon.

Thanks,
Yong-Xuan

