Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22BAC4725D
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 13:35:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOHgc-0001Ao-AT; Fri, 12 Jan 2024 08:35:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rOHga-0001A1-Sh
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 08:35:01 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rOHgX-0000jT-SN
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 08:34:59 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e67e90d4cso3917685e9.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Jan 2024 05:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705066496; x=1705671296;
 darn=nongnu.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5VwRxGSDQ5rrYJEQqWpMsC4NxJsYPnuQpqdfI9tLsgk=;
 b=Y2AdjI1iDqCzrYKVfUcPjmKc95aldfaXruFxu+7boWxdcHpdvOJ7IxrJq1qRvJHBi3
 HVNqqv+ot1e7wWSn8HPOCH7ug1Pe2Q1KzyohF8O/kssF+cb3iFvpm8zk6yv6Gr0OGwYH
 7Oag7KM1V3abZrqEJasaUGmhYuOaAym+AJPGD6PxrnzH7ky0NN3GYL6R5oJZdzGgHd7k
 ZZkeme3UWDjIDv7f6yfU/BMWNmVtrPpc0zDyHVU8QtTRVIs1RQtAgdWKtBd8ZZBQ9Iy2
 YYkYthBOJljWzYhGYaFtAHFYwmd59VdrxlqZIUcnWGAel3t+T46YQVpIdScWjUicz7ay
 GVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705066496; x=1705671296;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5VwRxGSDQ5rrYJEQqWpMsC4NxJsYPnuQpqdfI9tLsgk=;
 b=JfjjlKTHP7o9vyjiNg35m4Ky/EmP5CW+Odjx3hxJ4qSs+JJfvhH0fWgaU49I6s+0hA
 HksNo8k80c4C/H11wCXQzQGvyA8pZk+Y49023gWYbOUswNZVIdAR3egmFdrnZdtVHDyb
 D+LzE7eI3Ec0EzGV6zdrAi9jvhlcxQW8sb/Fw08JcAmYfi3ukmvBKdtbt+mlRsS7q2wu
 s9hz0j2sL+c3kfPtBBrGHfDFTrTOnGO4iGXrW2mPSfjt0tUQUyLISR7zaFGYPyHwWgHE
 zrTrRj6qerezEXl8p6qXM+5f12q21ZTw8WRicIGcEFDax6EeR6gLXIGNyjORSHh65IiY
 3RFw==
X-Gm-Message-State: AOJu0YwPEtvvoOoGQ9Tb7hihCCwFZ446aqU4vHN9gSSnljY56FmFr4oB
 zqtudBitCIWPr10QN11+gH2FWZDC+eOZVg==
X-Google-Smtp-Source: AGHT+IE47gE8dWjmnCwT4JT+ceHLjuFioVqJKro8QwctYsaaY9M8ZPK7mRR07htq9HpOchoCJrVyRg==
X-Received: by 2002:a1c:790e:0:b0:40e:4ac3:faba with SMTP id
 l14-20020a1c790e000000b0040e4ac3fabamr540579wme.203.1705066495791; 
 Fri, 12 Jan 2024 05:34:55 -0800 (PST)
Received: from [192.168.1.9] (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 iw7-20020a05600c54c700b0040d604dea3bsm5667784wmb.4.2024.01.12.05.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 05:34:55 -0800 (PST)
Message-ID: <3c091744cd4bafeb7c1d177455fa9789822e7209.camel@rivosinc.com>
Subject: Re: [PATCH 0/2] Export debug triggers as an extension
From: Rob Bradford <rbradford@rivosinc.com>
To: Alistair Francis <alistair23@gmail.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Alvin Chang <alvinga@andestech.com>, Alistair
 Francis <alistair.francis@wdc.com>, Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 12 Jan 2024 13:34:54 +0000
In-Reply-To: <CAKmqyKOA6OtixYoMJ_qtXj_u0t6rMdHawg0VEvq3-=mK4q6_XQ@mail.gmail.com>
References: <20240110040203.1920924-1-hchauhan@ventanamicro.com>
 <e2763db2-fade-482d-b433-1bfce6acf7d3@ventanamicro.com>
 <CAKmqyKOA6OtixYoMJ_qtXj_u0t6rMdHawg0VEvq3-=mK4q6_XQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 2024-01-12 at 13:52 +1000, Alistair Francis wrote:
> On Thu, Jan 11, 2024 at 5:20=E2=80=AFAM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
> >=20
> > Himanshu,
> >=20
> > We spoke offline but let's make everyone aware:
> >=20
> > - 'sdtrig' should be marked with 'x-' and be an experimental
> > extension since
> > the spec isn't yet frozen;
> >=20
> > - Alvin sent a patch to the ML adding the 'mcontext' CSR for
> > 'sdtrig' some time
> > ago:
> >=20
> > "[PATCH v2] target/riscv: Implement optional CSR mcontext of debug
> > Sdtrig extension"
> >=20
> > It would be good to put his patch on top of this series to ease the
> > review for everyone.
> > The changes done in patch 2 would also be applicable to the
> > mcontext CSR;
> >=20
> >=20
> > - last but probably the most important: the existing 'debug' flag
> > seems to be acting as
> > the actual 'sdtrig' extension due to how the flag is gating trigger
> > code, e.g.:
> >=20
> > =C2=A0=C2=A0 if (cpu->cfg.debug) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 riscv_trigger_realize(=
&cpu->env);
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > and
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 if (cpu->cfg.debug) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 riscv_trigger_reset_ho=
ld(env);
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> >=20
> > If that's really the case, all the checks with cpu->cfg.debug will
> > need to also include
> > cpu->cfg.ext_sdtrig (one or the other). And now we'll have to make
> > an option: do we leave
> > the debug triggers (i.e. the 'debug' flag) as always enabled?
>=20
> From memory the "debug" property is for the original debug spec:
> https://github.com/riscv/riscv-debug-spec/releases/tag/task_group_vote
>=20
> That was ratified and is an official extension. AFAIK this is what is
> in physical hardware as well.
>=20
> The actual PDF says draft though, I'm not sure what's going on there.
>=20
> The debug spec doesn't have a Z* name, so it's just "debug", at least
> AFAIK.
>=20
> "sdtrig" seems to be a new backwards-incompatible extension doing
> basically the same thing. What a mess
>=20
> >=20
> > If it's up to me I would make 'debug' as default 'false' and
> > deprecate it. Users will need
>=20
> I don't think that's the right approach. It's a ratified extension
> that we are supporting and is in hardware. I think we are stuck
> supporting it
>=20
>=20

I've done a bit of digging and I agree things are quite messy. Here are
my discoveries:

The debug option and the code for triggers was added in these commits:

c9711bd778 target/riscv: cpu: Enable native debug feature
38b4e781a4 target/riscv: machine: Add debug state description
b6092544fc target/riscv: csr: Hook debug CSR read/write
1acdb3b013 target/riscv: cpu: Add a config option for native debug
95799e36c1 target/riscv: Add initial support for the Sdtrig extension

In March 2022 - since the commit refers to the Sdtrig extension name
and from the date this was an implementation not of the ratified 0.13
debug spec (which did not have Sdtrig as a separate extension) but
rather a version of the in development 1.0 debug spec.

It's not trivial to tell if it's closer to the ratified 0.13 version or
the (hopefully soon to be frozen) 1.0 version.

As the only part of the debug specification to be implemented is the
triggers then effectively the debug option is x-sdtrig.

I don't think there is any way for code running on the machine to
identify what version of the debug is implemented - the appropriate
register is only available for external debug. Once 1.0 is frozen then
the presence of Sdtrig isa string would indicate 1.0 trigger support is
available.

According to JIRA - https://jira.riscv.org/browse/RVS-981 the debug
specification should freeze this month.

How about considering this as a solution:

- Add a new x-sdtrig option that defaults to false
- Deprecate debug option - but retain it with default on
- Add warning if triggers are used and x-sdtrig is not enabled
- Update the trigger implementation to match frozen spec

There is potentially a chance that some use cases will be broken but I
don't think triggers are being widely use - the SBI support only just
got merged:
https://github.com/riscv-software-src/opensbi/commit/97f234f15c9657c6ec69fa=
6ed745be8107bf6ae2

Hope this is helpful,

Rob


