Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4n9t-0005LW-Nx
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 13:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p4n9s-0005JY-8m
 for qemu-riscv@nongnu.org; Mon, 12 Dec 2022 13:04:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p4n9p-0004L7-3l
 for qemu-riscv@nongnu.org; Mon, 12 Dec 2022 13:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670868241;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=jseHD3Y4fIpK5xrCC4dxUw8dsedjwqMCIGTi3Z9Hoxo=;
 b=bCOyVseQgZKTILN5CCvgUj/hfDzY8QJ7vZMGIcseze/L7G6ti6oxDhkKG2GnbKXM3rvaLU
 4SOUYiEWxEoCUdapXeloyX8lDIiWA46Xj5Rlbqk/D7ox6flSEHRsf2Edq6wnS2T4Kgl8LM
 QjuS9pTqtOIyvTQt8Jpl0XAE6EYpZQs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-GGwK5ospPd6BWeiy9Z4-jQ-1; Mon, 12 Dec 2022 13:03:57 -0500
X-MC-Unique: GGwK5ospPd6BWeiy9Z4-jQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D4553806701;
 Mon, 12 Dec 2022 18:03:54 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46F04410B30F;
 Mon, 12 Dec 2022 18:03:50 +0000 (UTC)
Date: Mon, 12 Dec 2022 18:03:45 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "imp@bsdimp.com" <imp@bsdimp.com>,
 "kevans@freebsd.org" <kevans@freebsd.org>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "michael.roth@amd.com" <michael.roth@amd.com>,
 "kkostiuk@redhat.com" <kkostiuk@redhat.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "bin.meng@windriver.com" <bin.meng@windriver.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH] include: Don't include qemu/osdep.h
Message-ID: <Y5dtAUGVrBwJ1SUx@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20221212070431.306727-1-armbru@redhat.com>
 <SN4PR0201MB8808461347A55B9870BB6C4ADEE29@SN4PR0201MB8808.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SN4PR0201MB8808461347A55B9870BB6C4ADEE29@SN4PR0201MB8808.namprd02.prod.outlook.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 12 Dec 2022 18:04:08 -0000

On Mon, Dec 12, 2022 at 04:55:55PM +0000, Taylor Simpson wrote:
> 
> 
> > -----Original Message-----
> > From: Markus Armbruster <armbru@redhat.com>
> > Sent: Monday, December 12, 2022 1:05 AM
> > To: qemu-devel@nongnu.org
> > Cc: imp@bsdimp.com; kevans@freebsd.org; berrange@redhat.com;
> > jonathan.cameron@huawei.com; kbastian@mail.uni-paderborn.de;
> > jasowang@redhat.com; michael.roth@amd.com; kkostiuk@redhat.com;
> > Taylor Simpson <tsimpson@quicinc.com>; palmer@dabbelt.com;
> > alistair.francis@wdc.com; bin.meng@windriver.com; qemu-
> > riscv@nongnu.org
> > Subject: [PATCH] include: Don't include qemu/osdep.h
> > 
> > docs/devel/style.rst mandates:
> > 
> >     The "qemu/osdep.h" header contains preprocessor macros that affect
> >     the behavior of core system headers like <stdint.h>.  It must be
> >     the first include so that core system headers included by external
> >     libraries get the preprocessor macros that QEMU depends on.
> > 
> >     Do not include "qemu/osdep.h" from header files since the .c file
> >     will have already included it.
> > 
> > A few violations have crept in.  Fix them.
> > 
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > ---
> >  bsd-user/qemu.h                 | 1 -
> >  crypto/block-luks-priv.h        | 1 -
> >  include/hw/cxl/cxl_host.h       | 1 -
> >  include/hw/input/pl050.h        | 1 -
> >  include/hw/tricore/triboard.h   | 1 -
> >  include/qemu/userfaultfd.h      | 1 -
> >  net/vmnet_int.h                 | 1 -
> >  qga/cutils.h                    | 1 -
> >  target/hexagon/hex_arch_types.h | 1 -
> >  target/hexagon/mmvec/macros.h   | 1 -
> >  target/riscv/pmu.h              | 1 -
> >  qga/cutils.c                    | 3 ++-
> >  12 files changed, 2 insertions(+), 12 deletions(-)
> > 
> > diff --git a/target/hexagon/hex_arch_types.h
> > b/target/hexagon/hex_arch_types.h index 885f68f760..52a7f2b2f3 100644
> > --- a/target/hexagon/hex_arch_types.h
> > +++ b/target/hexagon/hex_arch_types.h
> > @@ -18,7 +18,6 @@
> >  #ifndef HEXAGON_HEX_ARCH_TYPES_H
> >  #define HEXAGON_HEX_ARCH_TYPES_H
> > 
> > -#include "qemu/osdep.h"
> >  #include "mmvec/mmvec.h"
> >  #include "qemu/int128.h"
> 
> Please change the copyright year in this file from "2019-2021" to "2019-2022".

No, that would be inappropriate.

The Copyright line is attributed to Qualcomm, and Markus doesn't
work for, nor assign copyright to, Qualcomm, so he must not change
the Qualcomm copyright line. Further, merely deleting a line of
code is not a significant change from POV of claiming copyright.

> Otherwise
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


