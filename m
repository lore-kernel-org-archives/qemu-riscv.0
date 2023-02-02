Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNbsh-0007Vx-Oc
	for mharc-qemu-riscv@gnu.org; Thu, 02 Feb 2023 10:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pNbsW-0007Sr-54; Thu, 02 Feb 2023 10:52:00 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pNbsT-0007fQ-Va; Thu, 02 Feb 2023 10:51:59 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P73Cp1HRwz6J9gG;
 Thu,  2 Feb 2023 23:50:46 +0800 (CST)
Received: from localhost (10.81.211.68) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 15:51:51 +0000
Date: Thu, 2 Feb 2023 15:51:49 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Markus Armbruster <armbru@redhat.com>
CC: <qemu-devel@nongnu.org>, <richard.henderson@linaro.org>,
 <pbonzini@redhat.com>, <kwolf@redhat.com>, <hreitz@redhat.com>,
 <imp@bsdimp.com>, <kevans@freebsd.org>, <berrange@redhat.com>,
 <groug@kaod.org>, <qemu_oss@crudebyte.com>, <mst@redhat.com>,
 <philmd@linaro.org>, <peter.maydell@linaro.org>, <alistair@alistair23.me>,
 <jasowang@redhat.com>, <kbastian@mail.uni-paderborn.de>,
 <quintela@redhat.com>, <dgilbert@redhat.com>, <michael.roth@amd.com>,
 <kkostiuk@redhat.com>, <tsimpson@quicinc.com>, <palmer@dabbelt.com>,
 <bin.meng@windriver.com>, <qemu-block@nongnu.org>, <qemu-arm@nongnu.org>,
 <qemu-riscv@nongnu.org>
Subject: Re: [PATCH v6 07/20] hw/cxl: Clean up includes
Message-ID: <20230202155149.00002c8a@Huawei.com>
In-Reply-To: <20230202133830.2152150-8-armbru@redhat.com>
References: <20230202133830.2152150-1-armbru@redhat.com>
 <20230202133830.2152150-8-armbru@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.211.68]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 02 Feb 2023 15:52:09 -0000

On Thu,  2 Feb 2023 14:38:17 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> This commit was created with scripts/clean-includes.
> 
> All .c should include qemu/osdep.h first.  The script performs three
> related cleanups:
> 
> * Ensure .c files include qemu/osdep.h first.
> * Including it in a .h is redundant, since the .c  already includes
>   it.  Drop such inclusions.
> * Likewise, including headers qemu/osdep.h includes is redundant.
>   Drop these, too.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  include/hw/cxl/cxl_component.h | 2 --
>  include/hw/cxl/cxl_host.h      | 1 -
>  include/hw/cxl/cxl_pci.h       | 1 -
>  3 files changed, 4 deletions(-)
> 
> diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
> index 5dca21e95b..692d7a5507 100644
> --- a/include/hw/cxl/cxl_component.h
> +++ b/include/hw/cxl/cxl_component.h
> @@ -15,9 +15,7 @@
>  #define CXL2_COMPONENT_CM_REGION_SIZE 0x1000
>  #define CXL2_COMPONENT_BLOCK_SIZE 0x10000
>  
> -#include "qemu/compiler.h"
>  #include "qemu/range.h"
> -#include "qemu/typedefs.h"
>  #include "hw/cxl/cxl_cdat.h"
>  #include "hw/register.h"
>  #include "qapi/error.h"
> diff --git a/include/hw/cxl/cxl_host.h b/include/hw/cxl/cxl_host.h
> index a1b662ce40..c9bc9c7c50 100644
> --- a/include/hw/cxl/cxl_host.h
> +++ b/include/hw/cxl/cxl_host.h
> @@ -7,7 +7,6 @@
>   * COPYING file in the top-level directory.
>   */
>  
> -#include "qemu/osdep.h"
>  #include "hw/cxl/cxl.h"
>  #include "hw/boards.h"
>  
> diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
> index 01e15ed5b4..407be95b9e 100644
> --- a/include/hw/cxl/cxl_pci.h
> +++ b/include/hw/cxl/cxl_pci.h
> @@ -10,7 +10,6 @@
>  #ifndef CXL_PCI_H
>  #define CXL_PCI_H
>  
> -#include "qemu/compiler.h"
>  
>  #define CXL_VENDOR_ID 0x1e98
>  


