Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A52CCDB465
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 03:33:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsaos-0003Ip-EI; Mon, 16 Oct 2023 23:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsaoq-0003IC-Hu; Mon, 16 Oct 2023 23:32:32 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsaoo-0004dM-Hl; Mon, 16 Oct 2023 23:32:32 -0400
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-45271a44cc4so2021954137.2; 
 Mon, 16 Oct 2023 20:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697513548; x=1698118348; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eeSHZOltjbGHZSP7eACzIf8VY5uH4sp0HwWHBBU4dpg=;
 b=fh2sjWa4GmUVof4CIwY9RUtVqyTzt8SxyHrObgXRpatQ5Aso/rx3Y2XkFqO6O+s0rD
 ZBzhxq1OH4ckvDogMjWmLIgQ9e6UlBmhvQo24cvHwrd3BGNW6EuYXF4fSk4XG5zvxcJL
 U3aURocIF7qlVy4gP2aiCJaj3e3ZK9JY2fRLo/v2u3Lu2wkoCO1yByEs+zOCKCpiyQPp
 mZCOaIMRKSWxtIyOW1rNXH+Dem6mFzdBXraJGARwjK8SIyihcvdytyT17FjxGgZBVzAK
 UQj5IAM54s1Cx3viWeH5+WJO+7BKX325CZ4RDdeTYAGwaYT3HQDIxOzihVitDJ+AE3m9
 rNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697513548; x=1698118348;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eeSHZOltjbGHZSP7eACzIf8VY5uH4sp0HwWHBBU4dpg=;
 b=Mjl5lo5e0X14pk9f8EzI6yGhQmbIvYqoW+kKyk698UPZgObNlLlLdI4DQOE/9wPoYt
 IICql5oHdKUwNI2H5wO//3lDqa4pjme7y3piiHVQNe53j3EWuXrQAlavhKI7F4du0vu6
 k/0r+UJMkD9JdhTibhSbDAWotwMzDv5mIZYceRSW9EjShHjRaB4FrJeIxFrpSYC0ydiX
 CGNFk7+4cMxbXHno9ZjYt+5y5fDOsi6Ht3OBVSoZ5VxXfz/ehM4DIhgimi5PjV4KqZ4J
 cwSzx4Kd9GI53VQBhZHv+2v2RC6Ak6PVFemzSqBsVf3vPV8iOTjh9lOqvZIMquHSCiEH
 ejkg==
X-Gm-Message-State: AOJu0Yy10OOkkpuRldWKebSLOq+5Xi0cWvD9/Oud1ujORdpdHTfHrVeg
 r6B/ETFzD/CIfJvglBW5NAFxxHHNQ+DngNlqBkI=
X-Google-Smtp-Source: AGHT+IFOkc1DXUugRG+SQ23OjG3rkiYzTaoE18cD5xez3EVhpKziIjAsnrwHepl+2J8L3F7czkRpdPFhcyO3deLEHtk=
X-Received: by 2002:a67:ac41:0:b0:457:dfe0:ee6b with SMTP id
 n1-20020a67ac41000000b00457dfe0ee6bmr1176547vsh.19.1697513548570; Mon, 16 Oct
 2023 20:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231014033545.15220-1-akihiko.odaki@daynix.com>
 <20231014033545.15220-2-akihiko.odaki@daynix.com>
 <597bf4be-207b-400a-be49-bc18900809a0@ventanamicro.com>
 <CAKmqyKPqk1sURLQNBoH0MeSJVSut72XiN4H0uT=95S953o7Taw@mail.gmail.com>
 <aa47e609-9da4-4274-8335-c07740c14d72@linux.alibaba.com>
In-Reply-To: <aa47e609-9da4-4274-8335-c07740c14d72@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 Oct 2023 13:32:01 +1000
Message-ID: <CAKmqyKMF8TVq3rHFQCm3BnLtS5ipha1Qfs9Z7aH5VaQU-=KAEQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] target/riscv: Do not allow MXL_RV32 for
 TARGET_RISCV64
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov <a.anenkov@yadro.com>,
 qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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

On Tue, Oct 17, 2023 at 12:14=E2=80=AFPM LIU Zhiwei
<zhiwei_liu@linux.alibaba.com> wrote:
>
>
> On 2023/10/16 9:51, Alistair Francis wrote:
> > On Sun, Oct 15, 2023 at 4:05=E2=80=AFAM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >>
> >>
> >> On 10/14/23 00:35, Akihiko Odaki wrote:
> >>> TARGET_RISCV64 does not have riscv-32bit-cpu.xml so it shouldn't acce=
pt
> >>> MXL_RV32.
> >>>
> >>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>> ---
> >> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >>
> >>
> >>>    target/riscv/tcg/tcg-cpu.c | 3 ++-
> >>>    1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> >>> index a28918ab30..e0cbc56320 100644
> >>> --- a/target/riscv/tcg/tcg-cpu.c
> >>> +++ b/target/riscv/tcg/tcg-cpu.c
> >>> @@ -161,10 +161,11 @@ static void riscv_cpu_validate_misa_mxl(RISCVCP=
U *cpu, Error **errp)
> >>>        case MXL_RV128:
> >>>            cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
> >>>            break;
> >>> -#endif
> >>> +#elif defined(TARGET_RISCV32)
> >>>        case MXL_RV32:
> >>>            cc->gdb_core_xml_file =3D "riscv-32bit-cpu.xml";
> >>>            break;
> >>> +#endif
> > This isn't the right fix. The idea is that riscv64-softmmu can run
> > 32-bit CPUs, so we instead should include riscv-32bit-cpu.xml
>
> Agree. I'd like to go on the work. The question is that we don't have
> 64-bit OpenSBI which supports booting 32-bit Linux.
> So even we have implemented the SXLEN 32bit, we may not have the
> software to test it.

Ah! So I was first talking around just a full 32-bit CPU.

So for example:
    qemu-system-riscv64 -machine opentitan

So we are using qemu-system-riscv64 to run a 32-bit only CPU.

Then we can think about SXLEN

>
> Do you support the SXL upstreaming with no testing?

No, it should be tested

Alistair

>
> Thanks,
> Zhiwei
>
> >
> > Alistair
> >
> >>>        default:
> >>>            g_assert_not_reached();
> >>>        }

