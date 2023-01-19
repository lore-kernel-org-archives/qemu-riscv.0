Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pITdL-0006gi-5Y
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 07:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pITcc-0006Mx-Ao; Thu, 19 Jan 2023 07:02:35 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pITcU-0001Sr-W9; Thu, 19 Jan 2023 07:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=WjF7bL11kEHUmwtj+dctqzKHVoL4fJEuPmXRLjsup0c=; b=nX4+P0JMIHpctmgm+Nnama6bTP
 zpBHG4Q2xowGKfZQfbsiO/aNE0pr8zFNc8EbPxsDg5Kl7ewa6uYFK3rJ6ZDMOMrl9zzoFF54pPoeD
 DIElbamtl153IF607J5gkVVDbBwnoXbHjsTIKr9acKO4rW5jGIkLBVD9fz5s823CX2cJYd/GdF/pC
 4fy48zhFjG+XegVcIu7hsP1BuHGXw8vPUoC1ZASFyVDc1euHTfLr8Zg09eERH1SZeC/es37VJ+KXV
 pF72jo+QoTJkNVzmXn406jND06HzWEDT7LO9tL/W+r0Z7ocdAqPCqgsidWM77Sup+e40SaSfShPGk
 Gm1oxrQMmIA9QwS23UME92QibRkZHkksAnYjwMDCZuwjQaa7jXhQI6VKvmmerE8kbMXgdT9jH4qm0
 ymCQU1MSM+RVcAuSnpFDxhJhTRg5P0o8YwioDWAtcQB/9K0GBtHLstYOidS1Cx2luz0vL9Tpc+83N
 3KwIj2YUw+1FD2pojJE4/b/+MirZINybTVI57JWk/4W9dsArQXvThUQwqQH54OyoTyX1PWZOeZ5sX
 5WHVT8zgEgHSIPYAAXGx7m9KA4OhvOBIXqxTe6GB+SdP5kl2EFyTMSDBQ9M6EsCujLQRPiAPfNNFY
 CaUhVAFr0tkIseqU/ThzZDsjYJgQEsvkFfyZE4GJk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, pbonzini@redhat.com, 
 kwolf@redhat.com, hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org,
 berrange@redhat.com, groug@kaod.org, mst@redhat.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 18/19] 9p: Drop superfluous include of linux/limits.h
Date: Thu, 19 Jan 2023 13:01:39 +0100
Message-ID: <2538017.PJiUfBrKnX@silver>
In-Reply-To: <87ilh2vmib.fsf@pond.sub.org>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <5266030.ICAI56zT51@silver> <87ilh2vmib.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 19 Jan 2023 12:03:01 -0000

On Thursday, January 19, 2023 11:37:00 AM CET Markus Armbruster wrote:
> Christian Schoenebeck <qemu_oss@crudebyte.com> writes:
> 
> > On Thursday, January 19, 2023 7:59:58 AM CET Markus Armbruster wrote:
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >>  hw/9pfs/9p.c | 3 ---
> >>  1 file changed, 3 deletions(-)
> >> 
> >> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> >> index 9621ec1341..aa736af380 100644
> >> --- a/hw/9pfs/9p.c
> >> +++ b/hw/9pfs/9p.c
> >> @@ -17,9 +17,6 @@
> >>   */
> >>  
> >>  #include "qemu/osdep.h"
> >> -#ifdef CONFIG_LINUX
> >> -#include <linux/limits.h>
> >> -#endif
> >>  #include <glib/gprintf.h>
> >>  #include "hw/virtio/virtio.h"
> >>  #include "qapi/error.h"
> >> 
> >
> > Where did that base version come from? I don't see it anywhere in history. 
> > Last relevant change in context was a136d17590a.
> 
> Current master (7ec8aeb6048) has
> 
>     #include "qemu/osdep.h"
>     #ifdef CONFIG_LINUX
>     #include <linux/limits.h>
>     #else
>     #include <limits.h>
>     #endif
>     #include <glib/gprintf.h>
> 
> The previous commit changes it to
> 
>     #include "qemu/osdep.h"
>     #ifdef CONFIG_LINUX
>     #include <linux/limits.h>
>     #endif
>     #include <glib/gprintf.h>
> 
> because "qemu/osdep.h" already includes <limits.h>.
> 
> Clearer now?

Ah, right I missed that in your previous patch. Thanks!

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Best regards,
Christian Schoenebeck



