Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kicms-0002gm-DI
	for mharc-qemu-riscv@gnu.org; Fri, 27 Nov 2020 07:23:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kicmq-0002dN-LL
 for qemu-riscv@nongnu.org; Fri, 27 Nov 2020 07:23:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kicmn-0002P3-F7
 for qemu-riscv@nongnu.org; Fri, 27 Nov 2020 07:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606479816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tsdrj308aGxyT2B18iOiPn7DrdDBnOymXkPBImBiMBo=;
 b=CpVLfMpmUbbgcNv7qUP89QNLCzx7KAWZbOmwD9bQJ28INocTHxmgnvEGuNMIlPzhDBOG/p
 dOgD1L7cMR531eWkGCBx3oQNLymuFACOIUjX27+sMSoPLCh6r48xBSXoWYG3GVbu31jRpK
 pkUxlrgCSj/tIifgl1uhpAPJQQr7NAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-Hys9f0JgO7aGEUKytV8VvQ-1; Fri, 27 Nov 2020 07:23:34 -0500
X-MC-Unique: Hys9f0JgO7aGEUKytV8VvQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A1C680ED9D;
 Fri, 27 Nov 2020 12:23:31 +0000 (UTC)
Received: from gondolin (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 734325D6D1;
 Fri, 27 Nov 2020 12:23:13 +0000 (UTC)
Date: Fri, 27 Nov 2020 13:23:10 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Paolo
 Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, =?UTF-8?B?SGVydsOp?=
 Poussineau <hpoussin@reactos.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>, Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Markus Armbruster
 <armbru@redhat.com>, David Hildenbrand <david@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 5/6] Remove unnecessary usage of arch_init.h
Message-ID: <20201127132310.734d2bd5.cohuck@redhat.com>
In-Reply-To: <20201125205636.3305257-6-ehabkost@redhat.com>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
 <20201125205636.3305257-6-ehabkost@redhat.com>
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
X-List-Received-Date: Fri, 27 Nov 2020 12:23:40 -0000

On Wed, 25 Nov 2020 15:56:35 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> The only declarations in arch_init.h are the `arch_type` variable
> and the QEMU_ARCH_* constants.  Stop including arch_init.h from
> code that don't use neither.
>=20
> Patch generated automatically using the command:
>=20
>  $ sed -i -e '/#include "sysemu.arch_init.h"/d' \
>    $(comm -23 \
>       <(git grep -l arch_init.h | sort) \
>       <((git grep -l -w 'arch_type'; g grep -l QEMU_ARCH;) | sort -u))
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: "Herv=C3=A9 Poussineau" <hpoussin@reactos.org>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Cc: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-ppc@nongnu.org
> Cc: qemu-riscv@nongnu.org
> Cc: qemu-s390x@nongnu.org
> ---
>  accel/accel.c                   | 1 -
>  hw/i386/pc.c                    | 1 -
>  hw/i386/pc_piix.c               | 1 -
>  hw/i386/pc_q35.c                | 1 -
>  hw/mips/jazz.c                  | 1 -
>  hw/mips/malta.c                 | 1 -
>  hw/ppc/prep.c                   | 1 -
>  hw/riscv/sifive_e.c             | 1 -
>  hw/riscv/sifive_u.c             | 1 -
>  hw/riscv/spike.c                | 1 -
>  hw/riscv/virt.c                 | 1 -
>  monitor/qmp-cmds.c              | 1 -
>  target/i386/cpu.c               | 1 -
>  target/s390x/cpu.c              | 1 -
>  target/s390x/cpu_models.c       | 1 -
>  target/ppc/translate_init.c.inc | 1 -
>  16 files changed, 16 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


