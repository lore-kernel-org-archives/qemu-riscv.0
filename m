Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kKpPH-0001cT-HU
	for mharc-qemu-riscv@gnu.org; Tue, 22 Sep 2020 17:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKpPE-0001ao-4e
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2020 17:00:57 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36621
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKpP9-0004Rb-JL
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2020 17:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600808446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=UiE+aY9vAx0Axg9nwumcJoIJZh75JdhLVxufHxOfUik=;
 b=XAfGkotStF8uU3rGViazAZ4OPRKyjGS4Poj8cQ5cwIN7BHmXSeHfAuVAtaYvMBudh4wM/n
 KfxS0oeTf1DIQkRN/Q+g24FV33BCARJSWFQbP4JhrB/o3PBrw4rei7YHzwvTeB2IWS/aRJ
 KlrL4JMhUoWcMXR0HVG+ZmLTT37A4Rw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-gLy-UO9vMBehwvKn3SQ7NQ-1; Tue, 22 Sep 2020 17:00:42 -0400
X-MC-Unique: gLy-UO9vMBehwvKn3SQ7NQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 282658030B8;
 Tue, 22 Sep 2020 21:00:40 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52548100164C;
 Tue, 22 Sep 2020 21:00:30 +0000 (UTC)
Date: Tue, 22 Sep 2020 17:00:29 -0400
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
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH 00/24] qom: Convert some properties to class properties
Message-ID: <20200922210029.GB2044576@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20200921221045.699690-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 17:00:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 22 Sep 2020 21:00:57 -0000

On Mon, Sep 21, 2020 at 06:10:21PM -0400, Eduardo Habkost wrote:
> Class properties make QOM introspection simpler and easier, as it
> doesn't require an object to be instantiated.  This series
> converts a few existing object_property_add*() calls to register
> class properties instead.
> 
> Eduardo Habkost (24):
>   cryptodev-vhost-user: Register "chardev" as class property
>   cryptodev-backend: Register "chardev" as class property
>   rng-egd: Register "chardev" as class property
>   rng-random: register "filename" as class property
>   vhost-user: Register "chardev" as class property
>   vexpress: Register "secure" as class property
>   rng: Register "opened" as class property
>   vexpress-a15: Register "virtualization" as class property
>   input-linux: Register properties as class properties
>   input-barrier: Register properties as class properties
>   tmp421: Register properties as class properties
>   s390x: Register all CPU properties as class properties
>   i386: Register most CPU properties as class properties
>   i386: Register feature bit properties as class properties
>   arm/virt: Register most properties as class properties
>   virt: Register "its" as class property
>   cpu/core: Register core-id and nr-threads as class properties
>   arm/cpu64: Register "aarch64" as class property
>   xlnx-zcu102: Register properties as class properties
>   machine: Register "memory-backend" as class property
>   vga-pci: Register "big-endian-framebuffer" as class property
>   i440fx: Register i440FX-pcihost properties as class properties
>   sifive_e: Register "revb" as class property
>   sifive_u: Register "start-in-flash" as class property

I'm queueing the following:

[PATCH 01/24] cryptodev-vhost-user: Register "chardev" as class property
[PATCH 02/24] cryptodev-backend: Register "chardev" as class property
[PATCH 12/24] s390x: Register all CPU properties as class properties
[PATCH 17/24] cpu/core: Register core-id and nr-threads as class properties
[PATCH 19/24] xlnx-zcu102: Register properties as class properties
[PATCH 20/24] machine: Register "memory-backend" as class property
[PATCH 22/24] i440fx: Register i440FX-pcihost properties as class properties
[PATCH 23/24] sifive_e: Register "revb" as class property
[PATCH 24/24] sifive_u: Register "start-in-flash" as class property

The remaining patches still need reviews.

-- 
Eduardo


