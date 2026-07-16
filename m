Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC7FC44501
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 03:12:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkCWT-0004KD-Ev; Wed, 15 Jul 2026 23:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1wkCWP-0004JO-Cz
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2026 23:12:25 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1wkCWM-0002Jq-Ik
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2026 23:12:25 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-455ee8f529dso702828fac.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Jul 2026 20:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784171541; cv=none;
 d=google.com; s=arc-20260327;
 b=fIJSWHnHGw3IWM5US+PKlckM4q6wzX6RtMY/aquggDCP9bsRGoz0psGICkZCrr7j9F
 dQlAw5ihpSpDkhQ3p/3U0l3fPrbgJ3xWD9I33L3oqwTEw9WTWWEnn96gYQkYpXQVQFcR
 La7n/AqusBa2svN+nHxr5SMeVhEXfktQ/lHaJNO2ESK1+eXtzmVm8TZKo1Kpivy1bj05
 nzIm6s+APt1udT99AXTxnnmiXVIORUkxaStPkP0lgvJ4OKc/ym3mMW6VAGMoe+MTKulJ
 +G3N68RdpMQH9EzyM5tf2JkaZywxu92osnbRR36s2o96Gt7xLcNcrT3it+j8GPPuwY2T
 U0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vyTXD7ySDOCjGwGbXmWie3IsN9gh0OGDuLDAbjfL2NE=;
 fh=4vztdgP/iYXsTYVD7Hn0G6d8YlIZYCE9p6r6mzMEF4Q=;
 b=cnWzl6aKNrCCU+0kbyob2iBvxBreoGSaBGZqpU7INAynbuloOgbUyj+vZ7bkqcbz+w
 Q+1QQRmvvnykTWFMh39aF+mMrYhN8W4nninCGmP+mAwLLfCE+ZALWNG2lFCFuxd6ExGL
 iAD4ks/TAhGtjzoqlXDQ0M5MmNMDQt3kDIZjQobqjtGuEnupPibZTjk1xFpN38Gb5uZv
 IVRu0PXE2yMaBKlplKUPEx0p+GBZQI5zKoW9w4IQuwsjNLY+Kwp2oxNAJWB/4OKqKqFm
 LPayarFHLBNWCcEYs7wWB9H6nX68dGkENE8M9KyKNnCU3O1YgraxJzcWNMNrz/u7T+pK
 lurw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1784171541; x=1784776341; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vyTXD7ySDOCjGwGbXmWie3IsN9gh0OGDuLDAbjfL2NE=;
 b=MiKcMe4bDKzHO2D+kQJH1siuZkqStuzMtSQ/B9Gyb0xtvvAcXmOYmd5AhL8Mha8WtJ
 vkCUd7Ss/kzBVGacN9Ymex+yB55aJWKQRqA8pkZfkGa8UXTEPFCRh0KojOBPgRi8OM/c
 OtLWpHh9qKJYsqwM4+OuwfVYZUVz3zDx1CCj420p1nlaWm5BOWFegqlOeOo5wEnLVLDw
 pG0vUxaR3QJJetAT+DNKToKRtDViVgp71sVfASEqLWqD+zzCKKl9NIKP+tymnPMnV2qt
 gvVLn7bxU/RRnOaQl+SIXvTqe9axcSbhQW7Y+rS8fV+Z0BC9b6dO8LNbs2bazB9xBfeC
 rmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784171541; x=1784776341;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vyTXD7ySDOCjGwGbXmWie3IsN9gh0OGDuLDAbjfL2NE=;
 b=E2dBEE4B13mxMDlkD+ZLA/X8FWDVdHsFfGPc+i7dFMv6PGYwqKqOHbsPGL+c673d+e
 ypXEMFBHITzPERJfdWYZJSsnM0Xd6d5G3B7FvvfxT9ScTweGyqLg2Pda+g80rfm+VvE/
 0uHQ2kAca94EOSW/AT2mx63AXYjE73SRrKUiknPazxFk0O+FbLITT07BlgbwLMARooKu
 /01bdtRPY4bis3EcaP5JUj6JRIvYsjH44j60nEZbdpmQAzsvYJLGv3bkmXQU+E3d8l8y
 6lTcKXwfWYuHLhrMFwKAV2jRNMuHdQ/BfFVKBYR2hwGvrBBmJm7X/E1ggVpM0lOrTUQp
 Kfqg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro82U8Hpz4nUyoDJ1p+6SVcpXa9UbUNq4FDKyakHq74ZlTaAyPIjjNjm0pskUIlJ974bWmW7wHafcU/@nongnu.org
X-Gm-Message-State: AOJu0YxWyv7dJhmMs0Wp8QhqdAbUOuWCr6lvHBVAB+m6WZpCYf7F2881
 i28GZKjI5wFWKmGJ8hRmsWdi3VhTkuKeFHIwel5hQkwX9OEuZrVfXo/dFX7g2Z0Qinjnqy3Dxbj
 gsWkFdGfnE62WKASrkD7vpw/8kK+0EjNtvtgcq7WZ3A==
X-Gm-Gg: AfdE7cm3JnXDbyFJ8GFGxtq5lwW4yMyaJ+53AEFWGfTb26Pef4ypqdu9ehS48ICXpJ/
 6gSkFx0eq/YBR9cu6psxzsu2i7gvax897sZ2/viCEGvLeF2HzbQL3GbJA45hYBZHJmXAgfjIiJ9
 K+IA89XUkc4lRcuxgyv0+WdCE+PtN+H6nr7wTz4pYDeNnAE7+G4y9zq1oAY5P4rQ7Qmrdbr57tP
 aViRh90KQK8jtAyfYMMm4LqC5wUSfeDfY2LXxIcFGBH5owOnq+mRyUX7KseCoSU
X-Received: by 2002:a05:6808:8947:b0:492:285c:4da8 with SMTP id
 5614622812f47-4a495eab7b6mr3808975b6e.13.1784171540942; Wed, 15 Jul 2026
 20:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260209115846.2276651-1-jim.shu@sifive.com>
 <7be3b4f7-7516-40ab-8a95-b3b4a2aea095@linaro.org>
 <CALw707rbMvg1mf1S_3qiqDWbZ0qjzgx4UJ9pUGmQODKWttKFyQ@mail.gmail.com>
 <08c5f243-5aaa-4fe2-bc71-6a3fd9a1914e@linaro.org>
 <CALw707pP_5a_EeUQLRw51nLCoFo4vKkKPGaVtJJdWEqR8K-u-A@mail.gmail.com>
 <CAFEAcA8V-eNMTF6dmR2AHwSjWj_MWaijgG_inepf62BRLYo8DQ@mail.gmail.com>
 <CALw707pb5iKy-CAnVn-npdP8NRGwaz+yZKGi2ZbjafqNLNJtKw@mail.gmail.com>
In-Reply-To: <CALw707pb5iKy-CAnVn-npdP8NRGwaz+yZKGi2ZbjafqNLNJtKw@mail.gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Thu, 16 Jul 2026 11:12:14 +0800
X-Gm-Features: AUfX_mxLSELIxfvXd7AwVyXuoVlWM-u8lL5RFdE4gRkEGjP1CXFu-y69FeSrzbs
Message-ID: <CALw707ozF4se+s7CUYNHY+f7xHCc5mqMiQQf+GK8eM1WrjN1qg@mail.gmail.com>
Subject: Re: [PATCH] exec: Add RISC-V WorldGuard WID field to MemTxAttrs
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@kernel.org>, 
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu=2D=2DDrif?= <clement.mathieu--drif@eviden.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>, philmd@mailo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=jim.shu@sifive.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, Jul 16, 2026 at 10:47=E2=80=AFAM Jim Shu <jim.shu@sifive.com> wrote=
:
>
> CC: philmd@mailo.com
>
>
>
>
> On Wed, Jul 15, 2026 at 5:57=E2=80=AFPM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
> >
> > On Wed, 15 Jul 2026 at 07:52, Jim Shu <jim.shu@sifive.com> wrote:
> > >
> > > Hi all,
> > >
> > > I'd like to discuss this issue again.
> > >
> > > On Wed, Mar 18, 2026 at 2:42=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <=
philmd@linaro.org> wrote:
> > >>
> > >> On 18/3/26 05:40, Jim Shu wrote:
> > >> > On Tue, Feb 10, 2026 at 8:25=E2=80=AFAM Richard Henderson
> > >> > <richard.henderson@linaro.org> wrote:
> > >> > ...
> > >> >> Hmm.  This really overlaps the secure and space fields from arm, =
and possibly some of the
> > >> >> others as well (e.g. user, requester_id, pid).
> > >> >>
> > >> >> I don't really have a good suggestion for that right now, but it =
would be nice to not keep
> > >> >> expanding the count of these sorts of fields that somehow specify=
 the originator, but
> > >> >> clearly cannot overlap.
> > >> >>
> > >> >> I'm reasonably sure we've had this discussion before, but nothing=
 has come of it.
> > >> >>
> > >> >> Time to paint the bikeshed again?
> > >>
> > >> Last discussion IIRC:
> > >> https://lore.kernel.org/qemu-devel/CAFEAcA8vKNkfKgp_Yymo9NA1=3DE2XJY=
XAMTgO3z6q6DHgqkAwRw@mail.gmail.com/
> > >
> > >
> > > Follow the idea in the above thread. I'd plan to add the 'src_cpu_id'=
 field to 'MemTxAttr', so we can get the CPUState from MemTxAttr. Thus, we =
can retrieve the RISC-V world_id from CPU and we don't need to add world_id=
 to 'MemTxAttr'. If other security attributes are stored in CPU states, the=
y can also reuse this w/o adding more data to 'MemTxAttr'.
> >
> > We already have a requester_id field, which is basically
> > "what is the thing that is sending this request?". We
> > shouldn't have memory transactions that happen to be
> > from CPUs indicate the source in a totally different way.

Thanks for mentioning it! I think re-use requester_id is better.
Then, I think we only need a boolean flag `src_is_cpu` and we can
rename it to `requester_is_cpu` to match the naming of `requester_id`.

> >
> > > The whole plan is to add the following 2 fields
> > > ::
> > >     unsigned int src_is_cpu:1;
> > >     uint16_t src_cpu_id;
> > >
> > > src_cpu_id is the CPU ID from 'CPUState->cpu_index'. src_is_cpu is a =
boolean flag to check if the transaction is from CPU.
> > >
> > > Moreover, I think this idea is extensible. DMA device transactions ca=
n also have security attributes like world_id. We can also add src_device f=
ield to 'MemTxAttr' to store the 'DeviceState *', so we can get the DeviceS=
tate from MemTxAttr to get security attributes. If 'DeviceState *' is too l=
arge to add to 'MemTxAttr', re-use requester_id as DMA device ID is another=
 possible method to support this.
> >
> > I don't think that having the thing that receives the memory
> > transaction get or get hold of a pointer to the source of the
> > transaction that it then uses to get the world ID is a good idea.
> > (Especially not putting a DeviceState* into MemTxAttrs: the
> > size of the type needs to be kept small so we can conveniently
> > pass it around by value: we currently assert that it is 8 bytes.)

OK, I think store the DMA device ID in the `requester_id` is another
way to keep the small size.
However, IIUC, the current SysbusDevice doesn't have the concept of a
device ID. We need to add an additional device ID to the device to
support this idea.

> >
> > I think we would do better to follow the way the hardware does
> > this to the extent that that's reasonable. On hardware the
> > bus/fabric is going to provide the world ID as a signal along
> > with the memory transaction, and we should accordingly put
> > it into the MemTxAttrs. The question for QEMU is then how
> > we organize our MemTxAttrs fields so that we can share between
> > different architectures the fields that are basically doing a
> > similar job, just with different terminology or semantics,
> > so that we keep the overall size of the type small.

OK. if we prefer to keep world_id / secure / space bits in MemTxAttrs
and conbine them together for smaller size instead of adding cpu_id, I
will try to plan for it.
Thanks for the feedback!


> >
> > thanks
> > -- PMM


Thanks
Jim

