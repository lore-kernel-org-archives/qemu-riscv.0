Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIRZi-0005p7-A9
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 04:51:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pIRZg-0005oC-AN; Thu, 19 Jan 2023 04:51:12 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pIRZc-0002rX-GX; Thu, 19 Jan 2023 04:51:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=jEiGaghMr6rpWAxosGe+WxtwHecKYx8iN/Wr+8lZdFk=; b=tiHK0clFRcXGYvtC+U5gmOB3Lz
 3qkrcErCEsp4TJBujdXms/J1wM7mQMV8VbwtTBjyw6iwLND+MA/KpdJXRoo+uycWhQGIppBDvqVVT
 dCLCUV4rg4uhVqtwprx4x9GemGsc+m5kcGE1sazAzgoKFWt5U3O+h214/TesQeVjLJlwCil8M62AA
 nD7wBmtCuMdcnczhbY+piJkmzy1Hs/qGhyTtMIPMxrRkV9HUMmtCgKmQ3d+5+MxvtgytapMXCDWPX
 PMO0qlf7AJYAxPHH/fdomf5DzbMm2o/9BK8jYq84Fq1486LoyQskweYyq0RipwkZ4ja2mgxB5N5Du
 Y+fCyqzDx/216eZwXgAq1Ifz/I1p6SCt0g/oI+fJfPl+wjk2eimJAkEf79DVebGFaluzHRLrQDcUK
 yu3qnUfaG3Zgj9oynSjxlPVEQbTzb/C36aupE+rP/8eX1Qq0wjh0rFGxlrDa7tNwHpjS78WFgAaMR
 kIGfyilmSWvchIWhx1/vACIojrGQ1ER0Al2QeQQwycTK57bzKpr6i3FCjutKT6B9cgVNrFbalymtH
 MvhxvZOU/uNaewBsVGbosCY/Q11+w+JKp5FmrM0NBxqjyuNwu/kDyLthi+3Jz6GJL9xbvyiUBdzJM
 hbswTjcttV10R8IH9Zoxe/nMQQySq2OD1eUfiVlZA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, mst@redhat.com, philmd@linaro.org, peter.maydell@linaro.org,
 alistair@alistair23.me, jasowang@redhat.com, jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de, quintela@redhat.com, dgilbert@redhat.com,
 michael.roth@amd.com, kkostiuk@redhat.com, tsimpson@quicinc.com,
 palmer@dabbelt.com, bin.meng@windriver.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 18/19] 9p: Drop superfluous include of linux/limits.h
Date: Thu, 19 Jan 2023 10:50:39 +0100
Message-ID: <5266030.ICAI56zT51@silver>
In-Reply-To: <20230119065959.3104012-19-armbru@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-19-armbru@redhat.com>
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
X-List-Received-Date: Thu, 19 Jan 2023 09:51:13 -0000

On Thursday, January 19, 2023 7:59:58 AM CET Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/9pfs/9p.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 9621ec1341..aa736af380 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -17,9 +17,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#ifdef CONFIG_LINUX
> -#include <linux/limits.h>
> -#endif
>  #include <glib/gprintf.h>
>  #include "hw/virtio/virtio.h"
>  #include "qapi/error.h"
> 

Where did that base version come from? I don't see it anywhere in history. 
Last relevant change in context was a136d17590a.

Best regards,
Christian Schoenebeck



