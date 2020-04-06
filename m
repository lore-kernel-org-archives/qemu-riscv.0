Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jLWLo-0006ra-DD
	for mharc-qemu-riscv@gnu.org; Mon, 06 Apr 2020 14:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43663)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jLWLk-0006nx-RS
 for qemu-riscv@nongnu.org; Mon, 06 Apr 2020 14:19:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jLWLj-0000eX-Dr
 for qemu-riscv@nongnu.org; Mon, 06 Apr 2020 14:19:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40300
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jLWLj-0000dx-9f
 for qemu-riscv@nongnu.org; Mon, 06 Apr 2020 14:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586197194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/b0HIUQU65gI+YnkCYIXNAIGNM5Xcw+ma5CdERAy9FI=;
 b=AzcPmOYPG/FnJ6t3hkyWAq9gU7C4Kr6rqKCnasNmYeAkyGc0iL0N+JAxFpxXWzIw81RJke
 At06L/w7r24ZdQv6SVWasiESFDXfK1zP/H9aTfUoNWcSqf4D4e64F1Cx9yCW1GGmXeW/Me
 BURUuPb9ttdOKCeRoxufk9CFeN7y3JI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-GilxslzzOH6j-phoENP9aQ-1; Mon, 06 Apr 2020 14:19:53 -0400
X-MC-Unique: GilxslzzOH6j-phoENP9aQ-1
Received: by mail-wr1-f69.google.com with SMTP id q9so213677wrw.22
 for <qemu-riscv@nongnu.org>; Mon, 06 Apr 2020 11:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JtzyrZgTvqbPdoez1uPhq1mRgqO12OBtkfBDfyx+LuM=;
 b=HfE9f+Wwp3grdvCIUlSSJ9GVgHjAVJBTFlAzF6ESlc+H2QjuJeIOHqYfQkp42zySo0
 BIB3LxkW0XpSgrJAFpCcGqDnI9UA8TR0/AKfAMII1V6kDDIZ/Xq0eSTbMI1A0RC0dJFt
 QKpTpMPbv9bZ8wH8nW1TFmIWKAHxyI0FZDCddJZXNinaDPz1QYfil5tDQpJaIzotkkzE
 kAEgJ6dfFzIU09vdtSS+cdVBSc7nDTtq1j7Tk7eTCHozO5xwIWssxSfekr5j47lCWuob
 +HVjV/Cd0CvzfRdogqvGSRfWQCtbjUD5xnThLiUwR2cKVdJxFRvMxZ8Wbds4BMZwdwNa
 t1ag==
X-Gm-Message-State: AGi0PuYQJQWw9+BcK70tV3KYyd/syHTtHkch8UtlSUpBryour30rXvWn
 2nYQRWDpjnrgczIe8CIFXIyzVrrML5i/RF4wJGhHdaU8bs+3xhKKB+qC+1UTvax/12KDctz/wpC
 UgiIJ7RcGJMnOs84=
X-Received: by 2002:a05:600c:204b:: with SMTP id
 p11mr328523wmg.92.1586197192459; 
 Mon, 06 Apr 2020 11:19:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ0TIYdnu+zc1xBv3Mm9DzlVGrPCNX9GwuntrSRlonkUZ5TmKDHWGl0GpthcLQM+LYjOfyHzw==
X-Received: by 2002:a05:600c:204b:: with SMTP id
 p11mr328440wmg.92.1586197192099; 
 Mon, 06 Apr 2020 11:19:52 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm243441wrg.21.2020.04.06.11.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 11:19:50 -0700 (PDT)
Subject: Re: [PATCH-for-5.1 v2 49/54] various: Use &error_abort in
 instance_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, John Snow
 <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang
 <jasowang@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Andrzej Zaborowski <balrogg@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 David Hildenbrand <david@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Fam Zheng <fam@euphon.net>, Zhang Chen <chen.zhang@intel.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>,
 "open list:Floppy" <qemu-block@nongnu.org>,
 "open list:Old World (g3beige)" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
 <20200406174743.16956-50-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0c907c26-1d12-e769-7f52-4cfb407627ff@redhat.com>
Date: Mon, 6 Apr 2020 20:19:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200406174743.16956-50-f4bug@amsat.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Mon, 06 Apr 2020 18:19:58 -0000

On 4/6/20 7:47 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Patch created mechanically by running:
>=20
>    $ spatch \
>      --macro-file scripts/cocci-macro-file.h \
>      --include-headers --keep-comments --in-place \
>      --sp-file \
>        scripts/coccinelle/use-error_abort-in-instance_init.cocci
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>   backends/cryptodev-vhost-user.c |  2 +-
>   backends/rng-egd.c              |  2 +-
>   backends/rng-random.c           |  2 +-
>   backends/vhost-user.c           |  3 ++-
>   hw/arm/bcm2835_peripherals.c    |  6 ++++--
>   hw/arm/vexpress.c               |  8 ++++----
>   hw/arm/xlnx-zcu102.c            |  8 ++++----
>   hw/block/fdc.c                  |  4 ++--
>   hw/block/vhost-user-blk.c       |  2 +-
>   hw/block/virtio-blk.c           |  2 +-
>   hw/core/machine.c               |  6 +++---
>   hw/cpu/core.c                   |  4 ++--
>   hw/display/vga-pci.c            |  7 +++++--
>   hw/display/xlnx_dp.c            |  4 ++--
>   hw/dma/sparc32_dma.c            |  2 +-
>   hw/gpio/aspeed_gpio.c           |  2 +-
>   hw/ide/macio.c                  |  4 +++-
>   hw/ide/qdev.c                   |  4 ++--
>   hw/intc/apic_common.c           |  2 +-
>   hw/mem/nvdimm.c                 |  4 ++--
>   hw/misc/aspeed_sdmc.c           |  2 +-
>   hw/misc/edu.c                   |  3 ++-
>   hw/misc/macio/macio.c           |  4 ++--
>   hw/misc/macio/pmu.c             |  3 ++-
>   hw/misc/pca9552.c               |  2 +-
>   hw/misc/tmp105.c                |  2 +-
>   hw/misc/tmp421.c                |  8 ++++----
>   hw/net/e1000.c                  |  3 ++-
>   hw/net/lance.c                  |  3 ++-
>   hw/net/lasi_i82596.c            |  3 ++-
>   hw/net/ne2000-isa.c             |  4 ++--
>   hw/net/spapr_llan.c             |  2 +-
>   hw/net/virtio-net.c             |  2 +-
>   hw/pci-host/grackle.c           |  2 +-
>   hw/pci-host/i440fx.c            |  8 ++++----
>   hw/pci-host/prep.c              |  2 +-
>   hw/pci-host/q35.c               | 23 ++++++++++++++---------
>   hw/pci-host/sabre.c             |  3 ++-
>   hw/pci-host/uninorth.c          |  9 +++++----
>   hw/pcmcia/pxa2xx.c              |  3 ++-
>   hw/ppc/spapr_drc.c              |  6 +++---
>   hw/ppc/spapr_rng.c              |  2 +-
>   hw/riscv/sifive_u.c             |  4 ++--
>   hw/s390x/event-facility.c       |  6 +++---
>   hw/s390x/s390-ccw.c             |  2 +-
>   hw/s390x/s390-skeys.c           |  4 ++--
>   hw/s390x/s390-stattrib.c        |  4 ++--
>   hw/s390x/sclp.c                 |  2 +-
>   hw/scsi/scsi-bus.c              |  2 +-
>   hw/ssi/xilinx_spips.c           |  2 +-
>   hw/usb/bus.c                    |  4 ++--
>   hw/usb/dev-network.c            |  2 +-
>   hw/usb/dev-storage.c            |  4 ++--
>   hw/usb/host-libusb.c            |  2 +-
>   hw/usb/redirect.c               |  2 +-
>   hw/virtio/virtio-balloon.c      |  4 ++--
>   net/dump.c                      |  4 ++--
>   net/filter-buffer.c             |  2 +-
>   net/filter-mirror.c             | 10 +++++-----
>   net/filter-rewriter.c           |  3 ++-
>   target/arm/cpu64.c              |  4 ++--
>   target/i386/cpu.c               | 23 ++++++++++++++---------
>   target/s390x/cpu.c              |  3 ++-
>   tests/check-qom-proplist.c      |  7 ++++---
>   tests/test-qdev-global-props.c  |  4 ++--
>   65 files changed, 155 insertions(+), 126 deletions(-)
>=20
[...]
> diff --git a/tests/test-qdev-global-props.c b/tests/test-qdev-global-prop=
s.c
> index 270c690479..09315f412c 100644
> --- a/tests/test-qdev-global-props.c
> +++ b/tests/test-qdev-global-props.c

Oops I forgot to commit this hunk:

@@ -27,6 +27,7 @@
  #include "hw/qdev-properties.h"
  #include "qom/object.h"
  #include "qapi/visitor.h"
+#include "qapi/error.h"


  #define TYPE_STATIC_PROPS "static_prop_type"

> @@ -151,9 +151,9 @@ static void prop2_accessor(Object *obj, Visitor *v, c=
onst char *name,
>   static void dynamic_instance_init(Object *obj)
>   {
>       object_property_add(obj, "prop1", "uint32", prop1_accessor, prop1_a=
ccessor,
> -                        NULL, NULL, NULL);
> +                        NULL, NULL, &error_abort);
>       object_property_add(obj, "prop2", "uint32", prop2_accessor, prop2_a=
ccessor,
> -                        NULL, NULL, NULL);
> +                        NULL, NULL, &error_abort);
>   }
>  =20
>   static void dynamic_class_init(ObjectClass *oc, void *data)
>=20


