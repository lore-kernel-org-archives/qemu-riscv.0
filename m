Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQHu9-0002Tg-U9
	for mharc-qemu-riscv@gnu.org; Wed, 07 Oct 2020 18:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kQHu4-0002Sc-OJ
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2020 18:27:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kQHu3-0007y3-2Z
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2020 18:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602109636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zlAk6viXZB+2JmcBonrJJIWkGxbb541ezreuxfFHjCI=;
 b=gsZLoYtQMTAs8TQW9P1oqKp0YPXLdxY7Aq7yruPZpcTOSmd0FSAJgbEp7LXhdNVdYrqR+L
 ZQpcEFbgMCoNWEuls6HVB5ig3FGAVSHpGwbWbZipKkqLoDK2rHTakdrrMyAYA5wYqcaFhw
 fcyg+ZlcZUS/fbxqUXeO0/K15ZEALVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-LXbSRMSkPuWCzQqZXhCE6w-1; Wed, 07 Oct 2020 18:27:12 -0400
X-MC-Unique: LXbSRMSkPuWCzQqZXhCE6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 360B285C706;
 Wed,  7 Oct 2020 22:27:10 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BD687BE42;
 Wed,  7 Oct 2020 22:26:58 +0000 (UTC)
Date: Wed, 7 Oct 2020 18:26:57 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>, Li Qiang <liq3ea@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Alistair Francis <alistair23@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 00/24] qom: Convert some properties to class properties
Message-ID: <20201007222657.GA7303@habkost.net>
References: <20200921221045.699690-1-ehabkost@redhat.com>
 <20200922210029.GB2044576@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20200922210029.GB2044576@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 07 Oct 2020 22:27:20 -0000

On Tue, Sep 22, 2020 at 05:00:40PM -0400, Eduardo Habkost wrote:
> On Mon, Sep 21, 2020 at 06:10:21PM -0400, Eduardo Habkost wrote:
> > Class properties make QOM introspection simpler and easier, as it
> > doesn't require an object to be instantiated.  This series
> > converts a few existing object_property_add*() calls to register
> > class properties instead.
> > 
> > Eduardo Habkost (24):
> >   cryptodev-vhost-user: Register "chardev" as class property
> >   cryptodev-backend: Register "chardev" as class property
> >   rng-egd: Register "chardev" as class property
> >   rng-random: register "filename" as class property
> >   vhost-user: Register "chardev" as class property
> >   vexpress: Register "secure" as class property
> >   rng: Register "opened" as class property
> >   vexpress-a15: Register "virtualization" as class property
> >   input-linux: Register properties as class properties
> >   input-barrier: Register properties as class properties
> >   tmp421: Register properties as class properties
> >   s390x: Register all CPU properties as class properties
> >   i386: Register most CPU properties as class properties
> >   i386: Register feature bit properties as class properties
> >   arm/virt: Register most properties as class properties
> >   virt: Register "its" as class property
> >   cpu/core: Register core-id and nr-threads as class properties
> >   arm/cpu64: Register "aarch64" as class property
> >   xlnx-zcu102: Register properties as class properties
> >   machine: Register "memory-backend" as class property
> >   vga-pci: Register "big-endian-framebuffer" as class property
> >   i440fx: Register i440FX-pcihost properties as class properties
> >   sifive_e: Register "revb" as class property
> >   sifive_u: Register "start-in-flash" as class property
> 
> I'm queueing the following:
> 
> [PATCH 01/24] cryptodev-vhost-user: Register "chardev" as class property
> [PATCH 02/24] cryptodev-backend: Register "chardev" as class property
> [PATCH 12/24] s390x: Register all CPU properties as class properties
> [PATCH 17/24] cpu/core: Register core-id and nr-threads as class properties
> [PATCH 19/24] xlnx-zcu102: Register properties as class properties
> [PATCH 20/24] machine: Register "memory-backend" as class property
> [PATCH 22/24] i440fx: Register i440FX-pcihost properties as class properties
> [PATCH 23/24] sifive_e: Register "revb" as class property
> [PATCH 24/24] sifive_u: Register "start-in-flash" as class property
> 
> The remaining patches still need reviews.

Queueing:

[PATCH 03/24] rng-egd: Register "chardev" as class property
[PATCH 04/24] rng-random: register "filename" as class property
[PATCH 07/24] rng: Register "opened" as class property
[PATCH 09/24] input-linux: Register properties as class properties
[PATCH 10/24] input-barrier: Register properties as class properties
[PATCH 13/24] i386: Register most CPU properties as class properties
[PATCH 14/24] i386: Register feature bit properties as class properties

Waiting for reviews on:

[PATCH 05/24] vhost-user: Register "chardev" as class property
[PATCH 06/24] vexpress: Register "secure" as class property
[PATCH 08/24] vexpress-a15: Register "virtualization" as class property
[PATCH 11/24] tmp421: Register properties as class properties
[PATCH 15/24] arm/virt: Register most properties as class properties
[PATCH 16/24] virt: Register "its" as class property
[PATCH 18/24] arm/cpu64: Register "aarch64" as class property
[PATCH 21/24] vga-pci: Register "big-endian-framebuffer" as class property

-- 
Eduardo


