Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUkUL-0004Co-VD
	for mharc-qemu-riscv@gnu.org; Mon, 27 Sep 2021 02:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUkUH-00049r-NB
 for qemu-riscv@nongnu.org; Mon, 27 Sep 2021 02:51:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUkUD-00032x-9J
 for qemu-riscv@nongnu.org; Mon, 27 Sep 2021 02:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632725495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zoN8EDs5ETECvskv4tzlI1U7iULrKx4qmcHaG0u30Zo=;
 b=V/JHpI+R+6Up/XNeI5Sv8/er8Caxl3TIa8Qs6qwefuJXtfVV34WSJ7zic0l1xCGD392SFH
 uAbZtD+0HCiqKGLvhVU0QkqrIv/aln8S821z5ZXL2XnpmDSAP3Y4cSjBvIJvTCZyf/mMM9
 2ZKri27dReYbc3s9FbCCAklIvqX8s/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-3_cXQfcVPAitgEnsr2aN5w-1; Mon, 27 Sep 2021 02:51:34 -0400
X-MC-Unique: 3_cXQfcVPAitgEnsr2aN5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DC1A362FA;
 Mon, 27 Sep 2021 06:51:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8F742AF99;
 Mon, 27 Sep 2021 06:51:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5348D113865F; Mon, 27 Sep 2021 08:51:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,  qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org,  Frank Chang <frank.chang@sifive.com>
Subject: Re: [PATCH 1/2] hw/dma: sifive_pdma: Improve code readability for
 "!!foo & bar"
References: <20210927022113.1518559-1-bmeng.cn@gmail.com>
Date: Mon, 27 Sep 2021 08:51:31 +0200
In-Reply-To: <20210927022113.1518559-1-bmeng.cn@gmail.com> (Bin Meng's message
 of "Mon, 27 Sep 2021 10:21:12 +0800")
Message-ID: <87h7e6jyto.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 27 Sep 2021 06:51:42 -0000

Bin Meng <bmeng.cn@gmail.com> writes:

> GCC seems to be strict about processing pattern like "!!for & bar".
> When 'bar' is not 0 or 1, it complains with -Werror=3Dparentheses:
>
>   suggest parentheses around operand of =E2=80=98!=E2=80=99 or change =E2=
=80=98&=E2=80=99 to =E2=80=98&&=E2=80=99 or =E2=80=98!=E2=80=99 to =E2=80=
=98~=E2=80=99 [-Werror=3Dparentheses]
>
> Add a () around "foo && bar", which also improves code readability.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  hw/dma/sifive_pdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
> index b4fd40573a..b8ec7621f3 100644
> --- a/hw/dma/sifive_pdma.c
> +++ b/hw/dma/sifive_pdma.c
> @@ -243,7 +243,7 @@ static void sifive_pdma_write(void *opaque, hwaddr of=
fset,
>      offset &=3D 0xfff;
>      switch (offset) {
>      case DMA_CONTROL:
> -        claimed =3D !!s->chan[ch].control & CONTROL_CLAIM;
> +        claimed =3D !!(s->chan[ch].control & CONTROL_CLAIM);
> =20
>          if (!claimed && (value & CONTROL_CLAIM)) {
>              /* reset Next* registers */

Old code

    first double-negate, mapping zero to zero, non-zero to one
    then mask, which does nothing, because CONTROL_CLAIM is 1

New code:

    first mask, yielding 0 or 1
    then double-negate, which does nothing

Looks like a bug fix to me.  If I'm right, the commit message is wrong,
and the double negate is redundant.


