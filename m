Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kic2s-0001IW-HM
	for mharc-qemu-riscv@gnu.org; Fri, 27 Nov 2020 06:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kic2r-0001HI-Kr
 for qemu-riscv@nongnu.org; Fri, 27 Nov 2020 06:36:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kic2n-0001Wp-Bp
 for qemu-riscv@nongnu.org; Fri, 27 Nov 2020 06:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606476964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14aEWzZrDPF7XWUDksGeOC7vvrJ7oGa+7SJaCTLJz8o=;
 b=IGFiD1CXP5uAWc7Kzj1SdF7BYeBwAAjclSS9tIpf8jmyAixy/B79zBdcEP6xMNJnjd70yB
 IDeQop0XVyenRqYP6VSa4ezYZPXBbPhXr9moU5BDDVwvYSfxOR7Cahhur3/1PKap0EO6mG
 3CE45cg4XRFVMmmsnX+GGd6qPFuvAGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-pbiAshTNPIW_4tnfi4fxTA-1; Fri, 27 Nov 2020 06:36:00 -0500
X-MC-Unique: pbiAshTNPIW_4tnfi4fxTA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 760209A22A;
 Fri, 27 Nov 2020 11:35:55 +0000 (UTC)
Received: from gondolin (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BB875D720;
 Fri, 27 Nov 2020 11:35:36 +0000 (UTC)
Date: Fri, 27 Nov 2020 12:35:33 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Peter
 Maydell <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Michael
 Walle <michael@walle.cc>, Laurent Vivier <laurent@vivier.eu>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Aurelien Jarno
 <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>, Anthony Green
 <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>, Marek Vasut
 <marex@denx.de>, Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, David Hildenbrand <david@redhat.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 1/6] arch_init: Move QEMU_ARCH definitions to cpu.h
Message-ID: <20201127123533.3707edf5.cohuck@redhat.com>
In-Reply-To: <20201125205636.3305257-2-ehabkost@redhat.com>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
 <20201125205636.3305257-2-ehabkost@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 27 Nov 2020 11:36:09 -0000

On Wed, 25 Nov 2020 15:56:31 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Instead of a collection of #ifdefs on arch_init.c, define
> QEMU_ARCH inside each cpu.h file.
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Michael Rolnik <mrolnik@gmail.com>
> Cc: Sarah Harris <S.E.Harris@kent.ac.uk>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Cc: Anthony Green <green@moxielogic.com>
> Cc: Chris Wulff <crwulff@gmail.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: qemu-ppc@nongnu.org
> Cc: qemu-riscv@nongnu.org
> Cc: qemu-s390x@nongnu.org
> ---
>  target/alpha/cpu.h      |  1 +
>  target/arm/cpu.h        |  1 +
>  target/avr/cpu.h        |  1 +
>  target/cris/cpu.h       |  1 +
>  target/hppa/cpu.h       |  1 +
>  target/i386/cpu.h       |  1 +
>  target/lm32/cpu.h       |  1 +
>  target/m68k/cpu.h       |  1 +
>  target/microblaze/cpu.h |  1 +
>  target/mips/cpu.h       |  1 +
>  target/moxie/cpu.h      |  1 +
>  target/nios2/cpu.h      |  1 +
>  target/openrisc/cpu.h   |  1 +
>  target/ppc/cpu.h        |  1 +
>  target/riscv/cpu.h      |  1 +
>  target/rx/cpu.h         |  1 +
>  target/s390x/cpu.h      |  1 +
>  target/sh4/cpu.h        |  1 +
>  target/sparc/cpu.h      |  1 +
>  target/tricore/cpu.h    |  1 +
>  target/unicore32/cpu.h  |  1 +
>  target/xtensa/cpu.h     |  1 +
>  softmmu/arch_init.c     | 46 -----------------------------------------
>  23 files changed, 22 insertions(+), 46 deletions(-)

Much better :)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


