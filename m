Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9147C44501
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 09:57:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjwMn-0005xD-29; Wed, 15 Jul 2026 05:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjwMl-0005ws-9I
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2026 05:57:23 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjwMj-0004Ne-FQ
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2026 05:57:22 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-81ec29f1d07so15985017b3.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Jul 2026 02:57:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784109439; cv=none;
 d=google.com; s=arc-20260327;
 b=fDTRk+Nc/qvXEdBcr1cvIXmBieQMijiAY6L+QtwYPSBDw0KmTk+i+ULhbNETlxmcIZ
 UzJ2zJNVH1GfCtzQNu39KuYfILPnMDuWsTZfbxb/r6nOiqc11OfWAXlXSjag63y2nHIp
 BAR8+S475VFvMBsHMQXm9MKJuMD5D3KpKzYlTKV1IEgaLk+oA/RteLAi10GP/u3RAwf0
 2NPQJtl5MZyc3vLUhnmU6vLgrZC3xApaDqL2+D8MGiiZwWzgG5dZUIVMeQGjucrJfPkR
 udSS+8u/PvQ8nvTuBKLIkHU5xON5IMYk5Cd4KG2tLiPb1UFQgq9mm8xaaEUyDaybZ01j
 87AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=hiF7Qk1974V1FoIyO6I2xCnds7WThIWYuWNz/CVlnl8=;
 fh=x81wK++Pd5UTNNruapx7Ym/aGZUgZba9Z9Kvd9fVJzg=;
 b=b4yD90b+8XX/uc1XBlYbtV4CqAOT9lJzmzL6ASlmrhwwNC12OvbKhb2DPlZKioqxLB
 roPWz6qs1iXHETPKEfoRDbq4H8UyaVtWCVmGUTPnr64F73cPYwO0UrauSGwAEZSUevuE
 +qXcpukYqD4OUhL0TgSDIqvYs5ikfLykV9G+Dz4rQp25SaQKsZvWmNSWCZdowtirQ4bM
 4PK0CdTw/NFov+UlTo4Q8dUO8njJQz9iDjbBixRBRaZTSIWjury9bGw8CGDxeofmky20
 JTuvNF8caIbqVfgoMpJgFBQJ0OljgPc2jfJk/yvSHwuvBzFP3GpX7KkZDzIiapeIhzru
 x0Rw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784109439; x=1784714239; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=hiF7Qk1974V1FoIyO6I2xCnds7WThIWYuWNz/CVlnl8=;
 b=qbfA3612UVf9HTAh7VRr2aXTYcUkWYM4kwWJlKitDyWcTDKekVGtpro/+kfJMfjVow
 HreTde5iTHQcgfX+jV223tq9iBqOIee+uZdlQazGPOYpHKu5U9JP96xkkJ8ejJeumfS5
 NmP5mLtTVkMvDztf2lhtSUoPQdMBwVwWGqFjW57SX9ZbrAAvAlKYCnC+N2wjL63YnRgj
 SgU9tKWkEwREj0UVb+1lQv8F4WisUhamzIraB+JML7FaDr3g9NVdFwCdO63ctoYv6xuK
 PeKot7pZVBqa81nS/FR7at4XPVxZ3DqOiHN0X+JlxdfzJT8f6SAlzSSdpU7nC4V/8pkV
 PgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784109439; x=1784714239;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hiF7Qk1974V1FoIyO6I2xCnds7WThIWYuWNz/CVlnl8=;
 b=f1D/f/3IoJVLatB1cJeqQV0fN8DMHJoLCBfHgMCnA1M1tdvm9rEIMp37d5FPzMQ9Ug
 KGFSKm1D0F/k0LBcIrOR0qxL5QjauHzMd3RJR6D6CQ8hnD2gmCD7a2r4fvTf4qExtB0o
 F7yAZE8xabghGCTDJPDHM7i52kj0Yfg30TjxazOmCMlsN/mubL+HCC2br5hfdD6jWjRY
 SlUIoJCGnFerXh0v0yQAb9t27oG4obX5PcxgPtLwvp3+gsLMpxqLoAarEkeBRyN6/5cp
 EtkEDeuZCaEKyquH4ldX/BH5gQD+0cQOjiCSZfcqZ7DE/IbsaHmlHMtPIorO9eiwpQYx
 JZEQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqL4zZ5XB0T937GpHrNoMQOsi/3o8pyhQ3uR2WohqyGfjJzBWbjxHOiI5mmMG4iwgGWB8DznwLywPOC@nongnu.org
X-Gm-Message-State: AOJu0YxeXTMoU/zPySLi7hijX2OhTrZd3t6m+r3QwmGhHuKq3/sr8hOl
 HEPxwWIq6JQ6cyFwdL5tBXnHlbZB2B6V6fkVDaHOAFo1ic3Y7NAk8DS41P6Dt4XIHseM+d8+MIP
 FrLXIEeeKa9P8cmSk8q1BAiPiw9NFYkBekxv8gxIlcw==
X-Gm-Gg: AfdE7ckF9Ime1+JZOkUpDuzL1pGIIyG/e/9RWCOOdC7WAx64gC0bshv/YJlk+PqYPQZ
 wtOA/YvuHD5myozFctqusKEhe9hb3QMrsslyu+EEx52aSbdJAzVYzDNe09rvRSRU8S7pDpDvi2Q
 WoH7kFZnWxKcQ2RvuXpQ6AL/DlxmvFaiHfN8nrgXN1NtHSdw3FrgSKFnwfm3T6kzkjGTwdh4Pbh
 gzkqjB+lGIsN2TiDY+ICjs3BoY5bLq1ekdkDnLs4ccQP84QaO244qZfzgy7lsoLrwE/syfgurHW
 /ombsz+5HR3sNWFsCk+ab2TPfgzUbTcOk4tB5fJgIpdjSVhqSwFR6bvm
X-Received: by 2002:a05:690c:c86:b0:7f5:87d3:c38c with SMTP id
 00721157ae682-81ebb136b12mr54155427b3.21.1784109439340; Wed, 15 Jul 2026
 02:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260209115846.2276651-1-jim.shu@sifive.com>
 <7be3b4f7-7516-40ab-8a95-b3b4a2aea095@linaro.org>
 <CALw707rbMvg1mf1S_3qiqDWbZ0qjzgx4UJ9pUGmQODKWttKFyQ@mail.gmail.com>
 <08c5f243-5aaa-4fe2-bc71-6a3fd9a1914e@linaro.org>
 <CALw707pP_5a_EeUQLRw51nLCoFo4vKkKPGaVtJJdWEqR8K-u-A@mail.gmail.com>
In-Reply-To: <CALw707pP_5a_EeUQLRw51nLCoFo4vKkKPGaVtJJdWEqR8K-u-A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Jul 2026 10:57:07 +0100
X-Gm-Features: AUfX_mzIKVQUyrpPX_4yE0Wb-7cgazNPw-15_Pz0keTDjMDSG7WgKfJ0VvUCGW4
Message-ID: <CAFEAcA8V-eNMTF6dmR2AHwSjWj_MWaijgG_inepf62BRLYo8DQ@mail.gmail.com>
Subject: Re: [PATCH] exec: Add RISC-V WorldGuard WID field to MemTxAttrs
To: Jim Shu <jim.shu@sifive.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@kernel.org>, 
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu=2D=2DDrif?= <clement.mathieu--drif@eviden.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>
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

On Wed, 15 Jul 2026 at 07:52, Jim Shu <jim.shu@sifive.com> wrote:
>
> Hi all,
>
> I'd like to discuss this issue again.
>
> On Wed, Mar 18, 2026 at 2:42=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <phil=
md@linaro.org> wrote:
>>
>> On 18/3/26 05:40, Jim Shu wrote:
>> > On Tue, Feb 10, 2026 at 8:25=E2=80=AFAM Richard Henderson
>> > <richard.henderson@linaro.org> wrote:
>> > ...
>> >> Hmm.  This really overlaps the secure and space fields from arm, and =
possibly some of the
>> >> others as well (e.g. user, requester_id, pid).
>> >>
>> >> I don't really have a good suggestion for that right now, but it woul=
d be nice to not keep
>> >> expanding the count of these sorts of fields that somehow specify the=
 originator, but
>> >> clearly cannot overlap.
>> >>
>> >> I'm reasonably sure we've had this discussion before, but nothing has=
 come of it.
>> >>
>> >> Time to paint the bikeshed again?
>>
>> Last discussion IIRC:
>> https://lore.kernel.org/qemu-devel/CAFEAcA8vKNkfKgp_Yymo9NA1=3DE2XJYXAMT=
gO3z6q6DHgqkAwRw@mail.gmail.com/
>
>
> Follow the idea in the above thread. I'd plan to add the 'src_cpu_id' fie=
ld to 'MemTxAttr', so we can get the CPUState from MemTxAttr. Thus, we can =
retrieve the RISC-V world_id from CPU and we don't need to add world_id to =
'MemTxAttr'. If other security attributes are stored in CPU states, they ca=
n also reuse this w/o adding more data to 'MemTxAttr'.

We already have a requester_id field, which is basically
"what is the thing that is sending this request?". We
shouldn't have memory transactions that happen to be
from CPUs indicate the source in a totally different way.

> The whole plan is to add the following 2 fields
> ::
>     unsigned int src_is_cpu:1;
>     uint16_t src_cpu_id;
>
> src_cpu_id is the CPU ID from 'CPUState->cpu_index'. src_is_cpu is a bool=
ean flag to check if the transaction is from CPU.
>
> Moreover, I think this idea is extensible. DMA device transactions can al=
so have security attributes like world_id. We can also add src_device field=
 to 'MemTxAttr' to store the 'DeviceState *', so we can get the DeviceState=
 from MemTxAttr to get security attributes. If 'DeviceState *' is too large=
 to add to 'MemTxAttr', re-use requester_id as DMA device ID is another pos=
sible method to support this.

I don't think that having the thing that receives the memory
transaction get or get hold of a pointer to the source of the
transaction that it then uses to get the world ID is a good idea.
(Especially not putting a DeviceState* into MemTxAttrs: the
size of the type needs to be kept small so we can conveniently
pass it around by value: we currently assert that it is 8 bytes.)

I think we would do better to follow the way the hardware does
this to the extent that that's reasonable. On hardware the
bus/fabric is going to provide the world ID as a signal along
with the memory transaction, and we should accordingly put
it into the MemTxAttrs. The question for QEMU is then how
we organize our MemTxAttrs fields so that we can share between
different architectures the fields that are basically doing a
similar job, just with different terminology or semantics,
so that we keep the overall size of the type small.

thanks
-- PMM

