Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUksk-0007OK-7a
	for mharc-qemu-riscv@gnu.org; Mon, 27 Sep 2021 03:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUksc-0007Mh-8r
 for qemu-riscv@nongnu.org; Mon, 27 Sep 2021 03:16:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUksa-0007MP-3L
 for qemu-riscv@nongnu.org; Mon, 27 Sep 2021 03:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632727007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k14opesXwZbIInGmdHTv7Hu6pGXtqoUCUmJEqmvYKRM=;
 b=TbnQCzXxNhvQYEy+d7OrdFV6m9IkuTwaad1EXuHKer/9B9ob7G8PZ7JxtbAQHbgTtp8YCr
 u7r/tPFJmjEvqaM9Xt7TUK2UYoFewxUp5yLFUNezUhn6A/n3NFYnaVsyVCSupwN3KrkTgg
 i8f1zj9sHbPLxBLyH/JOmZi0UERedHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-6Mtnp3Z-MbmC37leMGV0Yg-1; Mon, 27 Sep 2021 03:16:45 -0400
X-MC-Unique: 6Mtnp3Z-MbmC37leMGV0Yg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F0AA362FE;
 Mon, 27 Sep 2021 07:16:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C6935453A;
 Mon, 27 Sep 2021 07:16:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EBB78113865F; Mon, 27 Sep 2021 09:16:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,  "qemu-devel@nongnu.org
 Developers" <qemu-devel@nongnu.org>,  "open list:RISC-V"
 <qemu-riscv@nongnu.org>,  Frank Chang <frank.chang@sifive.com>
Subject: Re: [PATCH 1/2] hw/dma: sifive_pdma: Improve code readability for
 "!!foo & bar"
References: <20210927022113.1518559-1-bmeng.cn@gmail.com>
 <87h7e6jyto.fsf@dusky.pond.sub.org>
 <CAEUhbmXu3fToVqkBgsJe4oLpC+X8SR_Pkd-K-VpQEjcm8YpOEQ@mail.gmail.com>
Date: Mon, 27 Sep 2021 09:16:42 +0200
In-Reply-To: <CAEUhbmXu3fToVqkBgsJe4oLpC+X8SR_Pkd-K-VpQEjcm8YpOEQ@mail.gmail.com>
 (Bin Meng's message of "Mon, 27 Sep 2021 14:59:28 +0800")
Message-ID: <87ilymij39.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Sep 2021 07:16:54 -0000

Bin Meng <bmeng.cn@gmail.com> writes:

> Hi Markus,
>
> On Mon, Sep 27, 2021 at 2:51 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>>
>> Bin Meng <bmeng.cn@gmail.com> writes:
>>
>> > GCC seems to be strict about processing pattern like "!!for & bar".
>> > When 'bar' is not 0 or 1, it complains with -Werror=3Dparentheses:
>> >
>> >   suggest parentheses around operand of =E2=80=98!=E2=80=99 or change =
=E2=80=98&=E2=80=99 to =E2=80=98&&=E2=80=99 or =E2=80=98!=E2=80=99 to =E2=
=80=98~=E2=80=99 [-Werror=3Dparentheses]
>> >
>> > Add a () around "foo && bar", which also improves code readability.
>> >
>> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> > ---
>> >
>> >  hw/dma/sifive_pdma.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
>> > index b4fd40573a..b8ec7621f3 100644
>> > --- a/hw/dma/sifive_pdma.c
>> > +++ b/hw/dma/sifive_pdma.c
>> > @@ -243,7 +243,7 @@ static void sifive_pdma_write(void *opaque, hwaddr=
 offset,
>> >      offset &=3D 0xfff;
>> >      switch (offset) {
>> >      case DMA_CONTROL:
>> > -        claimed =3D !!s->chan[ch].control & CONTROL_CLAIM;
>> > +        claimed =3D !!(s->chan[ch].control & CONTROL_CLAIM);
>> >
>> >          if (!claimed && (value & CONTROL_CLAIM)) {
>> >              /* reset Next* registers */
>>
>> Old code
>>
>>     first double-negate, mapping zero to zero, non-zero to one
>>     then mask, which does nothing, because CONTROL_CLAIM is 1
>>
>> New code:
>>
>>     first mask, yielding 0 or 1
>>     then double-negate, which does nothing
>>
>> Looks like a bug fix to me.  If I'm right, the commit message is wrong,
>> and the double negate is redundant.
>>
>
> Thanks for the review. The double negate is not needed with
> CONTROL_CLAIM which is 1, but is needed if the bit is in another
> position.

It's not needed even then: conversion from integer type to bool takes
care of it.  It's not wrong, though.

However, the commit message does look wrong to me.


