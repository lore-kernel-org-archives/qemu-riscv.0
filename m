Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDKwp-0003St-2f
	for mharc-qemu-riscv@gnu.org; Tue, 10 Aug 2021 02:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mDKwm-0003MD-T2
 for qemu-riscv@nongnu.org; Tue, 10 Aug 2021 02:09:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mDKwi-0005aE-Tg
 for qemu-riscv@nongnu.org; Tue, 10 Aug 2021 02:09:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628575744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OVD/w6eoRz1KhInrrXsfVH6MaoYyT4YyZj4woikZLh8=;
 b=K5JenG1Vyvje2Es2kPvBtldatyUd7x6zGHN7VH5mn25YiMY+Si54g4VVy+6H5WMFiHm5oR
 n/t39Rk+Az2nVwCEmyoX6tZcmr3wM3kVe2h64DZQg9giY3iVaFPVi+/JgFgZoxTnzJMuez
 iM1exVWNUjGOMb4zvDWxeAaSttV3ngA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-mRtW4zCmNsCneKNHQsLI3Q-1; Tue, 10 Aug 2021 02:09:03 -0400
X-MC-Unique: mRtW4zCmNsCneKNHQsLI3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A299A1853028;
 Tue, 10 Aug 2021 06:08:59 +0000 (UTC)
Received: from localhost (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 879BF10013C1;
 Tue, 10 Aug 2021 06:08:44 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Patrick Venture <venture@google.com>, Thomas Huth <huth@tuxfamily.org>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <f4bug@amsat.org>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, David
 Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, Laurent Vivier
 <lvivier@redhat.com>, qemu-block@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH for-6.2 06/12] [automated] Split QOM "typedef struct T {
 ... } T" declarations
In-Reply-To: <20210806211127.646908-7-ehabkost@redhat.com>
Organization: Red Hat GmbH
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-7-ehabkost@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 10 Aug 2021 08:08:43 +0200
Message-ID: <874kbxygpg.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
X-List-Received-Date: Tue, 10 Aug 2021 06:09:09 -0000

On Fri, Aug 06 2021, Eduardo Habkost <ehabkost@redhat.com> wrote:

> Automatically split struct definition and typedef declaration in
> separate declarations, using a codeconverter rule.  The rule will
> only touch declarations of structs/typedefs actually used by QOM
> types.
>
> This will make automated changes to use OBJECT_DECLARE* macros
> easier to implement, because automated removal of typedef lines
> will be easier and safer.
>
> Generated using:
>
>   $ ./scripts/codeconverter/converter.py -i \
>     --pattern=3DQOMStructTypedefSplit $(git grep -l '' -- '*.[ch]')
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Patrick Venture <venture@google.com>
> Cc: Thomas Huth <huth@tuxfamily.org>
> Cc: Keith Busch <kbusch@kernel.org>
> Cc: Klaus Jensen <its@irrelevant.dk>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Havard Skinnemoen <hskinnemoen@google.com>
> Cc: Tyrone Ting <kfting@nuvoton.com>
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
> Cc: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
> Cc: "C=C3=A9dric Le Goater" <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-s390x@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: qemu-riscv@nongnu.org
> Cc: qemu-ppc@nongnu.org
> ---
>  hw/nvme/nvme.h                      | 10 ++++++----
>  hw/usb/hcd-uhci.h                   |  5 +++--
>  hw/usb/u2f.h                        |  5 +++--
>  include/hw/adc/npcm7xx_adc.h        |  5 +++--
>  include/hw/arm/npcm7xx.h            | 10 ++++++----
>  include/hw/core/accel-cpu.h         |  5 +++--
>  include/hw/dma/sifive_pdma.h        |  5 +++--
>  include/hw/dma/xlnx_csu_dma.h       |  5 +++--
>  include/hw/gpio/npcm7xx_gpio.h      |  5 +++--
>  include/hw/i2c/npcm7xx_smbus.h      |  5 +++--
>  include/hw/mem/npcm7xx_mc.h         |  5 +++--
>  include/hw/misc/bcm2835_cprman.h    | 20 ++++++++++++--------
>  include/hw/misc/mchp_pfsoc_dmc.h    | 10 ++++++----
>  include/hw/misc/mchp_pfsoc_ioscb.h  |  5 +++--
>  include/hw/misc/mchp_pfsoc_sysreg.h |  5 +++--
>  include/hw/misc/npcm7xx_clk.h       | 15 +++++++++------
>  include/hw/misc/npcm7xx_gcr.h       |  5 +++--
>  include/hw/misc/npcm7xx_mft.h       |  5 +++--
>  include/hw/misc/npcm7xx_rng.h       |  5 +++--
>  include/hw/nvram/npcm7xx_otp.h      |  5 +++--
>  include/hw/riscv/microchip_pfsoc.h  | 10 ++++++----
>  include/hw/riscv/sifive_e.h         |  5 +++--
>  include/hw/sd/cadence_sdhci.h       |  5 +++--
>  include/qemu/accel.h                | 10 ++++++----
>  chardev/char-parallel.c             | 10 ++++++----
>  hw/i2c/i2c_mux_pca954x.c            |  5 +++--
>  hw/m68k/mcf5206.c                   |  5 +++--
>  hw/misc/sbsa_ec.c                   |  5 +++--
>  hw/s390x/vhost-user-fs-ccw.c        |  5 +++--
>  tests/qtest/pnv-xscom-test.c        |  5 +++--
>  30 files changed, 123 insertions(+), 82 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>


