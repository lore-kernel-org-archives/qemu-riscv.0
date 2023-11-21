Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E14C54FB9
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 04:26:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5ILI-0002ai-Ry; Mon, 20 Nov 2023 23:26:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5ILH-0002Zy-9K; Mon, 20 Nov 2023 23:26:31 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5ILE-00025z-3u; Mon, 20 Nov 2023 23:26:31 -0500
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-45d8c405696so1640145137.3; 
 Mon, 20 Nov 2023 20:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700540786; x=1701145586; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RyAv/uSSPONDME3+CIEDqeepL72DvtLeIwRR29X76AQ=;
 b=YVKP0rNdEQXwkJr3AD6I9qkWtrZtIl++SEwicFX5thg6C1nRJJyNXbj1d7ui+aA5Zy
 1NvkBKY9awt/14CZsj+HO1W50xAKWeBxgIPcSaccFQSIB7otNVtJgEjevODcMeLPYN20
 iyu5TTs6udgsOu+YLImXhPtrAjJmR6bnUS13SrVscfwLnRRYvMvrWha8SUzxswlgPbq3
 02hXydXvojC8hyHNWjhEbqE8CdWL2V1sgZAnH2jJOkGol1s5W2kLWj2OBsq+ydQZPaxT
 4+stU11y1WAYBkrk/ZBazsaj3dUkR40IIHvBTMfT6/W46ygA3Zx/0PcVjigCnYs+kgN2
 06xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700540786; x=1701145586;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RyAv/uSSPONDME3+CIEDqeepL72DvtLeIwRR29X76AQ=;
 b=CLQIWLe1xQvPky3txYuK6/OdcpXVH6iXm3Ak4tqeySAfJA6EzD2QYqBySeoot83MF+
 UFoxxW6SMd8oCXBKIl2YSx8Ee3OUtzVARrNYxr1YPaa0rsGaeHRcedS7OmWJPhTNaSDI
 1t6WVxOewVoINKifoTiFQEcIjy7TXhNIUV28iNW3iVoJDvfYhwgP/IKGjdV3wn15Y8zi
 t9SYn3Q7htozSOUbi1bBCcwDOHc/e+X1eMJ09hZTGLUlQPSG63a10xtMQGw+XNcvBzTS
 Dr3Um/b802Ts6jhBkddQ5HvZfo5qxAuEG1AyQwcSOjqjLZiKT5c2cV/DGjPEN9pzISUs
 jItQ==
X-Gm-Message-State: AOJu0YxbCoVVMJgCnIq7CTYC9Jb4ChucVF02BjeJ1TvzrZsXHAJEpbUo
 6APtqXrMfsQ6dG7JJkMfpkxIMYaGRSyIu4J+mTM=
X-Google-Smtp-Source: AGHT+IFF50HLYXQKqBpy6ml2EVABWbVLX8rBEz6FSywpjvR+yOumuxGbrGa6YoAm3uzrCupnXQ5Q9gURSFAcRH6m/EY=
X-Received: by 2002:a67:c189:0:b0:45f:c608:296b with SMTP id
 h9-20020a67c189000000b0045fc608296bmr8123946vsj.27.1700540786115; Mon, 20 Nov
 2023 20:26:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1699496263.git.houyingle@canaan-creative.com>
 <6d1d8cc8c2b37b145e4a826095619097fa4a34d5.1699496263.git.houyingle@canaan-creative.com>
 <CAEomy4TmM0ShGkuV2mprB8Xm0Kn62ZWZA7Gnfvt07pioY9fCCA@mail.gmail.com>
 <bf0c7c6d-a940-4968-ab18-4af6125b8d0b@linaro.org>
 <BJSPR01MB062758831AA8BF73856F5DFC95B3A@BJSPR01MB0627.CHNPR01.prod.partner.outlook.cn>
 <3bd74930-f445-47b2-bb76-8451aa7b995a@linaro.org>
In-Reply-To: <3bd74930-f445-47b2-bb76-8451aa7b995a@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Nov 2023 14:25:59 +1000
Message-ID: <CAKmqyKPpW2gF0CyhvzcvhtjkeXTBppG9Qz5fZzshR1=n0+yZ=w@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/intc/riscv_aclint:Change the way to get CPUState
 from hard-base to pu_index
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: LeoHou <LeoHou@canaan-creative.com>, Dongxue Zhang <elta.era@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <apatel@ventanamicro.com>, Bin Meng <bin.meng@windriver.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?B?5L6v6Iux5LmQ?= <houyingle@canaan-creative.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, QEMU Developers <qemu-devel@nongnu.org>, 
 qemu-riscv <qemu-riscv@nongnu.org>,
 =?UTF-8?B?5byg5Lic6Zuq?= <zhangdongxue@canaan-creative.com>, 
 "leohou1402@gmail.com" <leohou1402@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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

On Mon, Nov 20, 2023 at 10:17=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 13/11/23 05:25, LeoHou wrote:
> > On 9/11/23 23:26, Philippe Mathieu-Daud=C3=A9  wrote:
> >
> >> Hi Leo,
> >>
> >> First, I can't find your patch in my mailbox, so I'm replying to
> >> Dongxue's review.

I also can't find the original patch

> >>
> >> On 9/11/23 03:41, Dongxue Zhang wrote:
> >>> Reviewed-by: Dongxue Zhang <zhangdongxue@canaan-creative.com>
> >>>
> >>>
> >>>> On Thu, Nov 9, 2023 at 10:22=E2=80=AFAM Leo Hou <LeoHou@canaan-creat=
ive.com> wrote:
> >>>>
> >>>> From: Leo Hou <houyingle@canaan-creative.com>
> >>>>
> >>>> cpu_by_arch_id() uses hartid-base as the index to obtain the corresp=
onding CPUState structure variable.
> >>>> qemu_get_cpu() uses cpu_index as the index to obtain the correspondi=
ng CPUState structure variable.
> >>>>
> >>>> In heterogeneous CPU or multi-socket scenarios, multiple aclint need=
s to be instantiated,
> >>>> and the hartid-base of each cpu bound by aclint can start from 0. If=
 cpu_by_arch_id() is still used

This doesn't sound right

cpu_by_arch_id() calls riscv_get_arch_id() to compare against the id.

riscv_get_arch_id() just returns the mhartid.

From the RISC-V priv spec on mhartid:

Hart IDs might not necessarily be numbered contiguously in a
multiprocessor system, but at least one hart must have a hart ID of
zero. Hart IDs must be unique within the execution environment.

So no two harts should have the same ID. So only a single aclint
should have a hartid-base of 0.

From a quick look I couldn't see where we set mhartid though, so it's
possible we just don't set it or set it correctly. In which case that
is the bug to be fixed.

Alistair

> >>>> in this case, all aclint will bind to the earliest initialized hart =
with hartid-base 0 and cause conflicts.
> >>>>
> >>>> So with cpu_index as the index, use qemu_get_cpu() to get the CPUSta=
te struct variable,
> >>>> and connect the aclint interrupt line to the hart of the CPU indexed=
 with cpu_index
> >>>> (the corresponding hartid-base can start at 0). It's more reasonable=
.
> >>>>
> >>>> Signed-off-by: Leo Hou <houyingle@canaan-creative.com>
> >>>> ---
> >>>>     hw/intc/riscv_aclint.c | 16 ++++++++--------
> >>>>     1 file changed, 8 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> >>>> index ab1a0b4b3a..be8f539fcb 100644
> >>>> --- a/hw/intc/riscv_aclint.c
> >>>> +++ b/hw/intc/riscv_aclint.c
> >>>> @@ -130,7 +130,7 @@ static uint64_t riscv_aclint_mtimer_read(void *o=
paque, hwaddr addr,
> >>>>             addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))=
) {
> >>>>             size_t hartid =3D mtimer->hartid_base +
> >>>>                             ((addr - mtimer->timecmp_base) >> 3);
> >>>> -        CPUState *cpu =3D cpu_by_arch_id(hartid);
> >>>> +        CPUState *cpu =3D qemu_get_cpu(hartid);
> >>
> >> There is some code smell here. qemu_get_cpu() shouldn't be called by
> >> device models, but only by accelerators.
> >
> > Yes, qemu_get_cpu() is designed to be called by accelerators.
> > But there is currently no new API to support multi-socket and
> > heterogeneous processor architectures=EF=BC=8Cand sifive_plic has been
> > designed with qemu_get_cpu().
> > Please refer to:
> > [1] https://lore.kernel.org/qemu-devel/1519683480-33201-16-git-send-ema=
il-mjc@sifive.com/
> > [2] https://lore.kernel.org/qemu-devel/20200825184836.1282371-3-alistai=
r.francis@wdc.com/
> >
> >
> >> Maybe the timer should get a link of the hart array it belongs to,
> >> and offset to this array base hartid?
> >
> > The same problem exists not only with timer, but also with aclint.
> > There needs to be a general approach to this problem.
>
> Right. However since there is no heterogeneous support in QEMU
> at present, we don't need this patch in the next release.
>
> So I'd rather wait and work on a correct fix. Up to the maintainer.
>
> Regards,
>
> Phil.
>
> >> I'm going to
> >> NACK
> >> this patch until further review / clarifications.
> >
> > Regards,
> >
> > Leo Hou.
>
>

