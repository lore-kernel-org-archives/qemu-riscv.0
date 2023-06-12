Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647BAC77B7A
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 02:53:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8Xfr-00042b-94; Sun, 11 Jun 2023 22:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8Xfo-00041p-Ra; Sun, 11 Jun 2023 22:52:52 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8Xfn-0002D2-9D; Sun, 11 Jun 2023 22:52:52 -0400
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-62de3cc8f0aso6492066d6.2; 
 Sun, 11 Jun 2023 19:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686538370; x=1689130370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IC1Qy4HV2ZiaFbkNVTFShtm0Y0XS5+/6zzxo+llBYA8=;
 b=YincIm62O9OpHxfpUDAhLN9q9ydXjtHVVYemwOXBsVoz7SvFn+4rG3HTUEM0/R3eEk
 YEw3Iwb7kWSeK9CPPFZPjDSNO5e1HdDHIDDNyi0T5zVLvRNAEgTY8JdheSJIjVvbtbMI
 KEOAV8QrJci3fi7xmb872vY+KgS43xC/EmsH7tgqs3MaFpcQ/LE8qCCGNGyJWFxZ+Bds
 GdZMog2jbiqXUy7QkkcULGzysEXNvJjhjPV8gahyhD1NUD+APVIdX+/ZSKpvyYqpoa/w
 ZRP3wckhe0d2/3HmKxG7ZiQ4sFPiL1TkgqNnYc+tyu/rYqWUYEML2jgT0y6TTMykwjku
 Rhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686538370; x=1689130370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IC1Qy4HV2ZiaFbkNVTFShtm0Y0XS5+/6zzxo+llBYA8=;
 b=Gn4rPtJRDeLRNqqU0qLZuNl8sAzWWh2HCHSU9NyZF5jXE5Y8NIMwDS4Or3Wl6bhoVw
 Kimr+3Kdc8e+Eay51BEHF7ZchdHPW7nvkeRhbvm4LYqZm3IhKloeDJrr0KUcgJm1v3O9
 RAZnRB8Y0ZgYwWPdtPgCJ+i29Czgz9ERkqxL+8pf+8ur0PMFJN5U11iD+QI66rbd/u5x
 FvCzvBpCtVeCS+SWmCUe+DXkAaWvqX1ixaeKeGSwvl/P52jEP+Iv3Qan/GIh5mbVY9iH
 hSHbXr4ZMIa03XEn7xPEa3nqDrzfDgO+WoFPvKbCAFX9cBhJ5noT87Yc4Vtc1p35Fn6R
 cM0A==
X-Gm-Message-State: AC+VfDyv5aT4A5Fe3mec4loQ5DC71cxP7XeFzxmKpjJYBW7z9GZT/uXz
 R41SkzZCuKKUO092T572sfZthw5Hhlg44q7PGkU=
X-Google-Smtp-Source: ACHHUZ6xImUpSeL5yp9Q7rUmB9kT1xSOkZ8iw5lBuUXOcCoL+d4oIwi//w0LEEXTO5xcTae1BD2uJXmcyVb9uUeDzxo=
X-Received: by 2002:a05:6214:e8e:b0:625:aa48:e628 with SMTP id
 hf14-20020a0562140e8e00b00625aa48e628mr10795213qvb.56.1686538369903; Sun, 11
 Jun 2023 19:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230523114454.717708-1-tommy.wu@sifive.com>
 <20230523114454.717708-2-tommy.wu@sifive.com>
 <CAKmqyKOfkhN=3+asF-u3r7y83GiZjv34mv42Yp0Ye0NzUEnezQ@mail.gmail.com>
 <CANj3q_ng7=2-gosL7HywNRVcqZqkK4aWodBNp6rjqV8OpMJDEA@mail.gmail.com>
In-Reply-To: <CANj3q_ng7=2-gosL7HywNRVcqZqkK4aWodBNp6rjqV8OpMJDEA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 12:52:23 +1000
Message-ID: <CAKmqyKMyOHdASrWGsUazi8mLMzkj89FOO_OxFi0jK4gBjqaYTw@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Add a function to refresh the dynamic
 CSRs xml.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, frank.chang@sifive.com, 
 alistair.francis@wdc.com, apatel@ventanamicro.com, palmer@rivosinc.com, 
 dbarboza@ventanamicro.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=alistair23@gmail.com; helo=mail-qv1-xf29.google.com
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

On Fri, Jun 9, 2023 at 6:37=E2=80=AFPM Tommy Wu <tommy.wu@sifive.com> wrote=
:
>
> Hi Alistair,
> Thanks for the suggestion! Do you mean
> ```
>     ...
>     g_free(cpu->dyn_csr_xml);
>     riscv_gen_dynamic_csr_xml(cs, cpu-> gdb_num_regs  -  CSR_TABLE_SIZE);
>     ...
> ``` ?

Yeah, pretty much. We already have cpu-> gdb_num_regs we should be
able to use it directly.

>
> Or maybe we don't need this refresh function, and just add ext_ssaia & ex=
t_smaia in the command line.

That also works!

Alistair

>
> Best Regards,
> Tommy
>
> On Thu, May 25, 2023 at 10:33=E2=80=AFAM Alistair Francis <alistair23@gma=
il.com> wrote:
>>
>> On Tue, May 23, 2023 at 9:46=E2=80=AFPM Tommy Wu <tommy.wu@sifive.com> w=
rote:
>> >
>> > When we change the cpu extension state after the cpu is
>> > realized, we cannot print the value of some CSRs in the remote
>> > gdb debugger. The root cause is that the dynamic CSR xml is
>> > generated when the cpu is realized.
>> >
>> > This patch add a function to refresh the dynamic CSR xml after
>> > the cpu is realized.
>> >
>> > Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
>> > Reviewed-by: Frank Chang <frank.chang@sifive.com>
>> > ---
>> >  target/riscv/cpu.h     |  2 ++
>> >  target/riscv/gdbstub.c | 12 ++++++++++++
>> >  2 files changed, 14 insertions(+)
>> >
>> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> > index de7e43126a..dc8e592275 100644
>> > --- a/target/riscv/cpu.h
>> > +++ b/target/riscv/cpu.h
>> > @@ -494,6 +494,7 @@ struct ArchCPU {
>> >      CPUNegativeOffsetState neg;
>> >      CPURISCVState env;
>> >
>> > +    int dyn_csr_base_reg;
>> >      char *dyn_csr_xml;
>> >      char *dyn_vreg_xml;
>> >
>> > @@ -781,6 +782,7 @@ void riscv_get_csr_ops(int csrno, riscv_csr_operat=
ions *ops);
>> >  void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
>> >
>> >  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
>> > +void riscv_refresh_dynamic_csr_xml(CPUState *cs);
>> >
>> >  uint8_t satp_mode_max_from_map(uint32_t map);
>> >  const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
>> > diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
>> > index 524bede865..9e97ee2c35 100644
>> > --- a/target/riscv/gdbstub.c
>> > +++ b/target/riscv/gdbstub.c
>> > @@ -230,6 +230,8 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs,=
 int base_reg)
>> >          bitsize =3D 64;
>> >      }
>> >
>> > +    cpu->dyn_csr_base_reg =3D base_reg;
>> > +
>> >      g_string_printf(s, "<?xml version=3D\"1.0\"?>");
>> >      g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.=
dtd\">");
>> >      g_string_append_printf(s, "<feature name=3D\"org.gnu.gdb.riscv.cs=
r\">");
>> > @@ -349,3 +351,13 @@ void riscv_cpu_register_gdb_regs_for_features(CPU=
State *cs)
>> >                                   "riscv-csr.xml", 0);
>> >      }
>> >  }
>> > +
>> > +void riscv_refresh_dynamic_csr_xml(CPUState *cs)
>> > +{
>> > +    RISCVCPU *cpu =3D RISCV_CPU(cs);
>> > +    if (!cpu->dyn_csr_xml) {
>> > +        g_assert_not_reached();
>> > +    }
>> > +    g_free(cpu->dyn_csr_xml);
>> > +    riscv_gen_dynamic_csr_xml(cs, cpu->dyn_csr_base_reg);
>>
>> I don't really understand why we need dyn_csr_base_reg, could we just
>> use cs->gdb_num_regs directly here?
>>
>> Alistair
>>
>> > +}
>> > --
>> > 2.38.1
>> >
>> >

