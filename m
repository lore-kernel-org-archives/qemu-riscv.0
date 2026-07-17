Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA2EC44514
	for <qemu-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 08:59:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkePk-0000Oa-K7; Fri, 17 Jul 2026 04:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wkePj-0000OJ-BL
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2026 04:59:23 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wkePh-0005W0-75
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2026 04:59:22 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-80cebd41372so72345397b3.3
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2026 01:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784278760; cv=none;
 d=google.com; s=arc-20260327;
 b=VQkwsixy7en11N7aQRz+xGOckLFHRi2oyyroTU1k6yBK6oW5TdiAcaKbJ0jFA6ybEf
 tG/PcJF1tZFr0+uRwa8bWdYT/FgpFNaq/i1AJqTwHZYiBWH0YZxsRPRsyAKTwYToqDBy
 DCV3xywb6HixBqIziIWGGd1iRXDq8uoeOS8m9ex2ZGVGaUU5oCJXuEyi2CFGo9rBc2nC
 euo5USa0SNFaQ/xWQPZ2wI8KVSLPdg4qF1XerEoVYL7nkxvk8gPcbr6LszIIN+imSnaO
 0GRnQm2i6wRKt8fw5mxsvtEt+D9HvyQTjaFhbbGQPxQImNuSDQv0FQ6IW9BGduCl5kj5
 g/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=sJMXREwvtC/rxQdqhMhaVjtcHLxTGkOlCOWZOOIddAg=;
 fh=ryw4ktzgzOCN/PQPxUMP0upjyN9KxOGUkgaQ8HypLVs=;
 b=JG5JYwVtYvNzi+vBJD2KinLGS2LXN76OIyk8hb8xmsuaAi4aRMflenkfwG/bnRVXOV
 mF9gymIls4zWVqlhSFu1qRQw5BaUXmXAPYNYL+sg+zp97aVTCW288E4GwLmfBGAgOFRA
 Hk/8eXhW0f5bigx/pWhgQZdVoZiTyZkycfY34wHKQbw7vKYAehI2AyEee74oqgevuO+I
 eowY0EuB2XFbP7XvkiqcfS3msKjrntirY2x6GjquQVhg39BV2Yo13VJ7G1aYVcXcf6Tz
 Ne0yXF5FZSfUGruE/hXa7wqCZqm7AXqGrGWD+cxosBVGUW6ShPeK0rxNRzu8nqO+D6nM
 5s3g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784278760; x=1784883560; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sJMXREwvtC/rxQdqhMhaVjtcHLxTGkOlCOWZOOIddAg=;
 b=w0ZUrA4QuAS32U8GQRvrRNygH7zhqLLAaw3AK0aPka06sThOh3tfAIoOYQZ9e+6W2N
 r0xJ+JrOjW5mLAiCl19jaaARGsLbprhyIPONIaODyX47ahfvhg7WVuA7NnvuchfvYudN
 h7b2yPlfy91ti7CDCVyKNYoTvvLxWVcig4FFIx1dcKUZLzKp/+ZiF1aTLEMWJ0ROOU8b
 o98FMXop6LsPWs2mLwtpVVrFuqCtmNM8/uoU/WKigAysdXQV29yoHfVnio4MKQWdpP/s
 F8kukVvXlMq3nsx+b+vfyWOZfioX7INdmg8LhNXQz97rwYW3Y/qH1Ld51LIHVMFgw1SO
 yOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784278760; x=1784883560;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sJMXREwvtC/rxQdqhMhaVjtcHLxTGkOlCOWZOOIddAg=;
 b=LwadHTWxOPYI7VB9cU8RCuKVU4tvpuNkNSIJsSQe0+mPVflSY8G5IGMPzodOTaSI0G
 gghsX4YoJTe0XyAOSJfSYDVriB+76XLvLNmiYBoqL3hDQcZM1Ks6NLPX/j9rVMKDxpqS
 6S9bi+j9LHNmo+Rf7Y/xi5VLjQlCZtGhTNOjMvlvVlJD3E//4lv4HJ3m99YoU/Hoou5G
 8a39ACbSaFkCV2UFcetylFubNppL8xAs/IxZhCj9LHpShd4zQ2WOyDHlZLmwze6w4rF4
 8JZMiebJeDhiw0A6JYIlvo5wrxGaXKfN3C3xOBrfXTAHpDAF1GaNGKrfKYd7KgwC8dAP
 HkPg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrCBo8f6fQd+9JBUlbqfF2gDMTIn5pTrnRdsreRJjONPRLXtffsNpMabUMVaKn1sRMosatn61wwUIqy@nongnu.org
X-Gm-Message-State: AOJu0Yw4he0OG7Cc3dZlP2ZfbTXS7Uhkf1fRWPQRTXdxoI5r6bsOZ0LP
 J7Q7rjp2auU7A2h2aDFL8T0/YDOp2+BJ+hS6UxFEwvPjdD+qY0G4G7USnCyclB0FxsidvjfAoHV
 GwplfVD2/ubs3enp/VHf3J0hZMNqb2BCVFfImnfASyw==
X-Gm-Gg: AfdE7cllpsTiY1s4KGoh1NGODW6B17PWqfiaXnAA93Xk1ZZ1EsenmxdO1mn6uNbmH4I
 h+NNipZteSmV8TjQnQY40GYzMSQdNnvak1vnikIwd3NToNXP9xaUIOUkTGL5bBSv1pLYH1rsziP
 j2ib3A1QyOAfweBdEOJGafN52yshyafjiuK6IZr3nW7AhKeRcNtTThysAQJPCUSg+iUEh1esQDy
 SW3Veq6u4FxgXuJlA04YQ2Dh/RBuyYO+bItZvnnBz1LfR7dHH+zigjJEJjmUBmrO+j7AgeEcYXO
 vsAmiV0p/SwLsaHPeFwsaWlpNck8tJKXIDApD958Daf8eA==
X-Received: by 2002:a05:690c:4807:b0:81e:97e2:2210 with SMTP id
 00721157ae682-81ef26932d1mr5393847b3.69.1784278759917; Fri, 17 Jul 2026
 01:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260209115846.2276651-1-jim.shu@sifive.com>
 <7be3b4f7-7516-40ab-8a95-b3b4a2aea095@linaro.org>
 <CALw707rbMvg1mf1S_3qiqDWbZ0qjzgx4UJ9pUGmQODKWttKFyQ@mail.gmail.com>
 <08c5f243-5aaa-4fe2-bc71-6a3fd9a1914e@linaro.org>
 <CALw707pP_5a_EeUQLRw51nLCoFo4vKkKPGaVtJJdWEqR8K-u-A@mail.gmail.com>
 <CAFEAcA8V-eNMTF6dmR2AHwSjWj_MWaijgG_inepf62BRLYo8DQ@mail.gmail.com>
 <CALw707pb5iKy-CAnVn-npdP8NRGwaz+yZKGi2ZbjafqNLNJtKw@mail.gmail.com>
 <CALw707ozF4se+s7CUYNHY+f7xHCc5mqMiQQf+GK8eM1WrjN1qg@mail.gmail.com>
In-Reply-To: <CALw707ozF4se+s7CUYNHY+f7xHCc5mqMiQQf+GK8eM1WrjN1qg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jul 2026 09:59:08 +0100
X-Gm-Features: AUfX_mzUVFf4Xt_sPeCH0jQdOXQqHkNW2yaoA_K4bB13m6mJMl_DGMh3rwkUiiM
Message-ID: <CAFEAcA-O1OsvisDF9CiFXvKS-2FDG=+mrxU27w+HfyQpRiF1eQ@mail.gmail.com>
Subject: Re: [PATCH] exec: Add RISC-V WorldGuard WID field to MemTxAttrs
To: Jim Shu <jim.shu@sifive.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Thu, 16 Jul 2026 at 04:12, Jim Shu <jim.shu@sifive.com> wrote:
>
> On Thu, Jul 16, 2026 at 10:47=E2=80=AFAM Jim Shu <jim.shu@sifive.com> wro=
te:
> >
> > CC: philmd@mailo.com
> >
> >
> >
> >
> > On Wed, Jul 15, 2026 at 5:57=E2=80=AFPM Peter Maydell <peter.maydell@li=
naro.org> wrote:
> > >
> > > On Wed, 15 Jul 2026 at 07:52, Jim Shu <jim.shu@sifive.com> wrote:
> > > >
> > > > Hi all,
> > > >
> > > > I'd like to discuss this issue again.
> > > >
> > > > On Wed, Mar 18, 2026 at 2:42=E2=80=AFPM Philippe Mathieu-Daud=C3=A9=
 <philmd@linaro.org> wrote:
> > > >>
> > > >> On 18/3/26 05:40, Jim Shu wrote:
> > > >> > On Tue, Feb 10, 2026 at 8:25=E2=80=AFAM Richard Henderson
> > > >> > <richard.henderson@linaro.org> wrote:
> > > >> > ...
> > > >> >> Hmm.  This really overlaps the secure and space fields from arm=
, and possibly some of the
> > > >> >> others as well (e.g. user, requester_id, pid).
> > > >> >>
> > > >> >> I don't really have a good suggestion for that right now, but i=
t would be nice to not keep
> > > >> >> expanding the count of these sorts of fields that somehow speci=
fy the originator, but
> > > >> >> clearly cannot overlap.
> > > >> >>
> > > >> >> I'm reasonably sure we've had this discussion before, but nothi=
ng has come of it.
> > > >> >>
> > > >> >> Time to paint the bikeshed again?
> > > >>
> > > >> Last discussion IIRC:
> > > >> https://lore.kernel.org/qemu-devel/CAFEAcA8vKNkfKgp_Yymo9NA1=3DE2X=
JYXAMTgO3z6q6DHgqkAwRw@mail.gmail.com/
> > > >
> > > >
> > > > Follow the idea in the above thread. I'd plan to add the 'src_cpu_i=
d' field to 'MemTxAttr', so we can get the CPUState from MemTxAttr. Thus, w=
e can retrieve the RISC-V world_id from CPU and we don't need to add world_=
id to 'MemTxAttr'. If other security attributes are stored in CPU states, t=
hey can also reuse this w/o adding more data to 'MemTxAttr'.
> > >
> > > We already have a requester_id field, which is basically
> > > "what is the thing that is sending this request?". We
> > > shouldn't have memory transactions that happen to be
> > > from CPUs indicate the source in a totally different way.
>
> Thanks for mentioning it! I think re-use requester_id is better.
> Then, I think we only need a boolean flag `src_is_cpu` and we can
> rename it to `requester_is_cpu` to match the naming of `requester_id`.

But, what do you now want it for? If we put the world ID in the
MemTxAttrs, do you still need a CPU ID? (There are some situations
where it might be useful, but if we don't need it right now we
shouldn't put doing that rework in the path of implementing
the worldguard work you want to do.)

> > > > The whole plan is to add the following 2 fields
> > > > ::
> > > >     unsigned int src_is_cpu:1;
> > > >     uint16_t src_cpu_id;
> > > >
> > > > src_cpu_id is the CPU ID from 'CPUState->cpu_index'. src_is_cpu is =
a boolean flag to check if the transaction is from CPU.
> > > >
> > > > Moreover, I think this idea is extensible. DMA device transactions =
can also have security attributes like world_id. We can also add src_device=
 field to 'MemTxAttr' to store the 'DeviceState *', so we can get the Devic=
eState from MemTxAttr to get security attributes. If 'DeviceState *' is too=
 large to add to 'MemTxAttr', re-use requester_id as DMA device ID is anoth=
er possible method to support this.
> > >
> > > I don't think that having the thing that receives the memory
> > > transaction get or get hold of a pointer to the source of the
> > > transaction that it then uses to get the world ID is a good idea.
> > > (Especially not putting a DeviceState* into MemTxAttrs: the
> > > size of the type needs to be kept small so we can conveniently
> > > pass it around by value: we currently assert that it is 8 bytes.)
>
> OK, I think store the DMA device ID in the `requester_id` is another
> way to keep the small size.
> However, IIUC, the current SysbusDevice doesn't have the concept of a
> device ID. We need to add an additional device ID to the device to
> support this idea.

What exactly is it that you need a device ID for? Earlier you
suggest that you would want it to get the world ID -- but we
should just put the world ID directly in the MemTxAttrs.

thanks
-- PMM

