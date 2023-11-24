Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E68EC61D97
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 14:48:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6XTD-0006ik-4k; Fri, 24 Nov 2023 09:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1r6XTA-0006i4-EL
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 09:47:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1r6XT8-0001wQ-Ll
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 09:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700837264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1y9X5y+K+pFHpJ8QfSR9WENZaGzdsvEyIEfJWku2Tfo=;
 b=Q5lCmOpuJcbGxJF9FkY+nG/7lCSR3HtDgi5jX+gQ9IyKHdm5o+lsQIk1g399ujAB20zg4N
 8/mnnzFWGZuqE1GqfDZtAE5fv9puce610yfWcsveI+Wgm1Vq8068178+W6ZATb3fjxhVIA
 iziROqRG17PIHF5+WnCgmtkHCO+zmtU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-avw0tcZCPUq2LGjg3fqZ7g-1; Fri, 24 Nov 2023 09:47:43 -0500
X-MC-Unique: avw0tcZCPUq2LGjg3fqZ7g-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9fa63374410so152572766b.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 06:47:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700837262; x=1701442062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1y9X5y+K+pFHpJ8QfSR9WENZaGzdsvEyIEfJWku2Tfo=;
 b=Vf80XXUf9RVJN42+iMj8frdUUK8RnfRWKzzMTlAWm0Fkpt6SJNm+zzIGgt9dd57xI+
 UyV+ZDIcR0C8uhL9NNmZWqHn36MVI7p/DvKVdjaGgDzBItGKpEQYlRz/SQKcT3xnpxyn
 pbFQ0zAXUYUsLAwfBFQiuw2uGgbbKzWRFEh0DWdzLO/CfsZnevZ0wxAL5n9FCfAD2h9v
 2vMdp1Q2ljQ1LPcTNOsn4gL3ovH7zH05EvshdlZWdxkACB1P9/aSn0A469vBi9zDZdcQ
 7zyafXQWcgtpeZJ0JKJ2ZcHe4u7lBpvZDqXvUh4H6xQUnNiinNg4UOghyjk8BoCBDCRU
 MTHg==
X-Gm-Message-State: AOJu0Yw0NAm3vteMal+W0D9UTLb/7km23avzOMlB49VHjPIwR8+Cg7Vr
 AgLh5WIbm/183q7LkJf0ntK1c380gfUpeKHODWg2C8jkB3Y+LK78ldpNy+Q+UOYdND19nOXlLHh
 kSXJWgiKYjWBbciM=
X-Received: by 2002:a17:906:74d0:b0:a02:ac5c:775d with SMTP id
 z16-20020a17090674d000b00a02ac5c775dmr2154059ejl.6.1700837262082; 
 Fri, 24 Nov 2023 06:47:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGiz8ndh4UddGbzJ1NzyI0LNM5biMjs8fkA/VhHGn5dvrXrJj1QYitMpvXeaZBM2VLisgW6A==
X-Received: by 2002:a17:906:74d0:b0:a02:ac5c:775d with SMTP id
 z16-20020a17090674d000b00a02ac5c775dmr2154039ejl.6.1700837261784; 
 Fri, 24 Nov 2023 06:47:41 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 jx19-20020a170906ca5300b009fc9fab9178sm2131125ejb.125.2023.11.24.06.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 06:47:41 -0800 (PST)
Date: Fri, 24 Nov 2023 15:47:40 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: LeoHou <LeoHou@canaan-creative.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Dongxue
 Zhang <elta.era@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <apatel@ventanamicro.com>, Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, =?UTF-8?B?5L6v6Iux?=
 =?UTF-8?B?5LmQ?= <houyingle@canaan-creative.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Mayuresh Chitale
 <mchitale@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, Palmer
 Dabbelt <palmer@rivosinc.com>, Weiwei Li <liweiwei@iscas.ac.cn>, QEMU
 Developers <qemu-devel@nongnu.org>, qemu-riscv <qemu-riscv@nongnu.org>,
 =?UTF-8?B?5byg5Lic6Zuq?= <zhangdongxue@canaan-creative.com>,
 "leohou1402@gmail.com" <leohou1402@gmail.com>
Subject: Re: [PATCH 1/1] hw/intc/riscv_aclint:Change the way to get CPUState
 from hard-base to pu_index
Message-ID: <20231124154740.400aeca9@imammedo.users.ipa.redhat.com>
In-Reply-To: <BJSPR01MB062758831AA8BF73856F5DFC95B3A@BJSPR01MB0627.CHNPR01.prod.partner.outlook.cn>
References: <cover.1699496263.git.houyingle@canaan-creative.com>
 <6d1d8cc8c2b37b145e4a826095619097fa4a34d5.1699496263.git.houyingle@canaan-creative.com>
 <CAEomy4TmM0ShGkuV2mprB8Xm0Kn62ZWZA7Gnfvt07pioY9fCCA@mail.gmail.com>
 <bf0c7c6d-a940-4968-ab18-4af6125b8d0b@linaro.org>
 <BJSPR01MB062758831AA8BF73856F5DFC95B3A@BJSPR01MB0627.CHNPR01.prod.partner.outlook.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, 13 Nov 2023 04:25:43 +0000
LeoHou <LeoHou@canaan-creative.com> wrote:

> On 9/11/23 23:26, Philippe Mathieu-Daud=C3=A9  wrote:
> =C2=A0
> >Hi Leo,
> >
> >First, I can't find your patch in my mailbox, so I'm replying to
> >Dongxue's review.
> >
> >On 9/11/23 03:41, Dongxue Zhang wrote: =20
> >> Reviewed-by: Dongxue Zhang <zhangdongxue@canaan-creative.com>
> >>=20
> >>  =20
> >>> On Thu, Nov 9, 2023 at 10:22=E2=80=AFAM Leo Hou <LeoHou@canaan-creati=
ve.com> wrote:
> >>>
> >>> From: Leo Hou <houyingle@canaan-creative.com>
> >>>
> >>> cpu_by_arch_id() uses hartid-base as the index to obtain the correspo=
nding CPUState structure variable.
> >>> qemu_get_cpu() uses cpu_index as the index to obtain the correspondin=
g CPUState structure variable.
> >>>
> >>> In heterogeneous CPU or multi-socket scenarios, multiple aclint needs=
 to be instantiated,
> >>> and the hartid-base of each cpu bound by aclint can start from 0. If =
cpu_by_arch_id() is still used
> >>> in this case, all aclint will bind to the earliest initialized hart w=
ith hartid-base 0 and cause conflicts.
> >>>
> >>> So with cpu_index as the index, use qemu_get_cpu() to get the CPUStat=
e struct variable,
> >>> and connect the aclint interrupt line to the hart of the CPU indexed =
with cpu_index
> >>> (the corresponding hartid-base can start at 0). It's more reasonable.
> >>>
> >>> Signed-off-by: Leo Hou <houyingle@canaan-creative.com>
> >>> ---
> >>>=C2=A0=C2=A0 hw/intc/riscv_aclint.c | 16 ++++++++--------
> >>>=C2=A0=C2=A0 1 file changed, 8 insertions(+), 8 deletions(-)
> >>>
> >>>diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> >>> index ab1a0b4b3a..be8f539fcb 100644
> >>> --- a/hw/intc/riscv_aclint.c
> >>> +++ b/hw/intc/riscv_aclint.c
> >>> @@ -130,7 +130,7 @@ static uint64_t riscv_aclint_mtimer_read(void *op=
aque, hwaddr addr,
> >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addr < (m=
timer->timecmp_base + (mtimer->num_harts << 3))) {
> >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t ha=
rtid =3D mtimer->hartid_base +
> >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ((addr - mtimer->timecmp_base) >> 3);
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPUState *cpu =3D cpu_by_=
arch_id(hartid);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPUState *cpu =3D qemu_ge=
t_cpu(hartid); =20
> >
> >There is some code smell here. qemu_get_cpu() shouldn't be called by
> >device models, but only by accelerators. =20

cpu_index might match arch_id in simple cases but might be not the same
when architecture/topo gets more complex, and just breaks in case of
sparse or out of order created CPUs/intc (hotplug case).
So using it is like a ticking bomb.


> Yes, qemu_get_cpu() is designed to be called by accelerators.
> But there is currently no new API to support multi-socket and
> heterogeneous processor architectures=EF=BC=8Cand sifive_plic has been
> designed with qemu_get_cpu().
> Please refer to:
> [1] https://lore.kernel.org/qemu-devel/1519683480-33201-16-git-send-email=
-mjc@sifive.com/
> [2] https://lore.kernel.org/qemu-devel/20200825184836.1282371-3-alistair.=
francis@wdc.com/
>=20
>=20
> >Maybe the timer should get a link of the hart array it belongs to,
> >and offset to this array base hartid? =20
>=20
> The same problem exists not only with timer, but also with aclint.
> There needs to be a general approach to this problem.
>=20
>=20
> >I'm going to
> >NACK
> >this patch until further review / clarifications. =20
>=20
> Regards,
>=20
> Leo Hou.


