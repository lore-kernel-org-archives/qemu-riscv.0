Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jY5vc-0003pQ-58
	for mharc-qemu-riscv@gnu.org; Mon, 11 May 2020 06:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jY5va-0003mD-5X
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 06:44:54 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37792
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jY5vZ-0008GO-5p
 for qemu-riscv@nongnu.org; Mon, 11 May 2020 06:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589193891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=35YmauD/BBm1tepF7T9THdx5MtF07eXSwwbbA8QgD58=;
 b=O5QOGNe0bKCQariC0erlltigRANA2sgTPp5TYnZZzeFxQuxFjPzrm1hDO1sft5GiQjl+2O
 n6kF12qVEilck2r1UBUgD7t0dmIUyd51BMHVOKFc7XkzK/qOMHbuQejspfdTpzsJVjPtzQ
 sM9bITNt49RKffJ4neRwVN8v4Ew8UMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-AamzL-fcM6yTA2yEQupXpw-1; Mon, 11 May 2020 06:44:50 -0400
X-MC-Unique: AamzL-fcM6yTA2yEQupXpw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEB1910082EA;
 Mon, 11 May 2020 10:44:46 +0000 (UTC)
Received: from gondolin (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7A1B5D9DA;
 Mon, 11 May 2020 10:44:37 +0000 (UTC)
Date: Mon, 11 May 2020 12:44:35 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Max Filippov
 <jcmvbkbc@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Stafford Horne <shorne@gmail.com>, Roman
 Bolshakov <r.bolshakov@yadro.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-s390x@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Marek Vasut <marex@denx.de>, Alistair Francis <Alistair.Francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-riscv@nongnu.org, Aurelien Jarno
 <aurelien@aurel32.net>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Chris Wulff <crwulff@gmail.com>, Richard Henderson
 <rth@twiddle.net>, David Gibson <david@gibson.dropbear.id.au>, David
 Hildenbrand <david@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>
Subject: Re: [PATCH 07/11] target/s390x/helper: Clean ifdef'ry
Message-ID: <20200511124435.7b9b2f23.cohuck@redhat.com>
In-Reply-To: <20200509130910.26335-8-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
 <20200509130910.26335-8-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 03:10:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 11 May 2020 10:44:54 -0000

On Sat,  9 May 2020 15:09:06 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> All this code is guarded checking CONFIG_USER_ONLY definition.
> Drop the duplicated checks.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Suspicious ifdef'ry in s390_handle_wait() from commit 83f7f32901c.
> ---
>  target/s390x/helper.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/target/s390x/helper.c b/target/s390x/helper.c
> index 09f60406aa..26e3b366e8 100644
> --- a/target/s390x/helper.c
> +++ b/target/s390x/helper.c
> @@ -33,6 +33,7 @@
>  #endif
> =20
>  #ifndef CONFIG_USER_ONLY
> +

I'd probably not have added the whitespace here...

>  void s390x_tod_timer(void *opaque)
>  {
>      cpu_inject_clock_comparator((S390CPU *) opaque);

(...)

> @@ -328,6 +324,7 @@ int s390_store_adtl_status(S390CPU *cpu, hwaddr addr,=
 hwaddr len)
>      cpu_physical_memory_unmap(sa, len, 1, len);
>      return 0;
>  }
> +

...and here, but I don't feel strongly about it.

>  #endif /* CONFIG_USER_ONLY */
> =20
>  void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


