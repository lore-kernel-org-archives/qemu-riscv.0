Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gUWsU-0000b2-Mj
	for mharc-qemu-riscv@gnu.org; Wed, 05 Dec 2018 08:06:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1gUTqI-0006la-Vj
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 04:51:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yuval.shaia@oracle.com>) id 1gUTqD-0001u2-UI
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 04:51:42 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:54908)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yuval.shaia@oracle.com>)
	id 1gUTqD-0001rz-BS; Wed, 05 Dec 2018 04:51:37 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id
	wB59hnGD068935; Wed, 5 Dec 2018 09:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	in-reply-to; s=corp-2018-07-02;
	bh=3046ED0PTbVBpVRtqu1dBlMtQwZyQOOFSCwHzpLsx9Q=;
	b=Bu5woyPsYSIXrfna856UdDMAzvMt+ujaFct7G0Xk17AQMtL5cDkhQGw1Xy3w9wsog5aW
	KSKxuCxFGnTJYwWctTTNEA7kE5P6I9bJA1+tXjU97qPBbmRW9mgrToRnOoSGa+dzJwXA
	Suni9rnej2jZ7YDk+c6GdTdqezGluiyK9gH4wynjip0U/171vTOEQHRFBGSJCR2OM/zC
	Tfu/xQFhzXKJIjNeWjLK9FDApfejVdJqLcdN+XUGkXx62JIpOHKWA4WIKKivkGqCl5sX
	Rk0DqgQf/xtDCVYr1AbCJbSuQRFshoTzyh7xnuK0vW2UA5YBwnUva2p4ADOvKv4qzQne
	7A== 
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
	by userp2130.oracle.com with ESMTP id 2p3hqu1e41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Dec 2018 09:51:26 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserv0021.oracle.com (8.14.4/8.14.4) with ESMTP id wB59pJ3M012412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 5 Dec 2018 09:51:19 GMT
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id wB59pGbt013091;
	Wed, 5 Dec 2018 09:51:17 GMT
Received: from lap1 (/10.175.1.7) by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 05 Dec 2018 01:51:16 -0800
Date: Wed, 5 Dec 2018 11:51:01 +0200
From: Yuval Shaia <yuval.shaia@oracle.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Clark <mjc@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Stefan Berger <stefanb@linux.ibm.com>, qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org, yuval.shaia@oracle.com
Message-ID: <20181205095100.GA2888@lap1>
References: <20181204172535.2799-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181204172535.2799-1-armbru@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9097
	signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1812050090
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.86
X-Mailman-Approved-At: Wed, 05 Dec 2018 08:06:08 -0500
Subject: Re: [Qemu-riscv] [PATCH] Clean up includes
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2018 09:51:45 -0000

On Tue, Dec 04, 2018 at 06:25:35PM +0100, Markus Armbruster wrote:
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
> 
> This commit was created with scripts/clean-includes, with the changes
> to the following files manually reverted:
> 
>     contrib/libvhost-user/libvhost-user-glib.h
>     contrib/libvhost-user/libvhost-user.c
>     contrib/libvhost-user/libvhost-user.h
>     linux-user/mips64/cpu_loop.c
>     linux-user/mips64/signal.c
>     linux-user/sparc64/cpu_loop.c
>     linux-user/sparc64/signal.c
>     linux-user/x86_64/cpu_loop.c
>     linux-user/x86_64/signal.c
>     target/s390x/gen-features.c
>     tests/migration/s390x/a-b-bios.c
>     tests/test-rcu-simpleq.c
>     tests/test-rcu-tailq.c
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  contrib/elf2dmp/pdb.h                     | 2 --
>  contrib/elf2dmp/pe.h                      | 1 -
>  contrib/elf2dmp/qemu_elf.h                | 1 -
>  contrib/vhost-user-blk/vhost-user-blk.c   | 1 -
>  contrib/vhost-user-scsi/vhost-user-scsi.c | 1 -

For the rdma part:

>  hw/rdma/rdma_utils.c                      | 1 +
>  hw/rdma/rdma_utils.h                      | 1 -
>  hw/rdma/vmw/pvrdma_dev_ring.h             | 1 -

Acked-by: Yuval Shaia <yuval.shaia@oracle.com>

Thanks.

>  hw/vfio/ap.c                              | 2 +-
>  include/qemu/vfio-helpers.h               | 1 -
>  include/sysemu/whpx.h                     | 1 -
>  target/i386/sev.c                         | 3 ++-
>  target/i386/whp-dispatch.h                | 1 -
>  target/riscv/fpu_helper.c                 | 1 -
>  tests/fp/platform.h                       | 1 -
>  tests/tpm-util.h                          | 1 -
>  tests/vhost-user-bridge.c                 | 2 +-
>  util/qemu-thread-common.h                 | 1 -
>  18 files changed, 5 insertions(+), 18 deletions(-)
> 
> diff --git a/contrib/elf2dmp/pdb.h b/contrib/elf2dmp/pdb.h
> index 4351a2dd61..a3a3cac2c1 100644
> --- a/contrib/elf2dmp/pdb.h
> +++ b/contrib/elf2dmp/pdb.h
> @@ -8,8 +8,6 @@
>  #ifndef PDB_H
>  #define PDB_H
>  
> -#include <stdint.h>
> -#include <stdlib.h>
>  
>  typedef struct GUID {
>      unsigned int Data1;
> diff --git a/contrib/elf2dmp/pe.h b/contrib/elf2dmp/pe.h
> index 374e06a9c5..dafb26afbb 100644
> --- a/contrib/elf2dmp/pe.h
> +++ b/contrib/elf2dmp/pe.h
> @@ -8,7 +8,6 @@
>  #ifndef PE_H
>  #define PE_H
>  
> -#include <stdint.h>
>  
>  typedef struct IMAGE_DOS_HEADER {
>      uint16_t  e_magic;      /* 0x00: MZ Header signature */
> diff --git a/contrib/elf2dmp/qemu_elf.h b/contrib/elf2dmp/qemu_elf.h
> index d85d6558fa..86e6e688fb 100644
> --- a/contrib/elf2dmp/qemu_elf.h
> +++ b/contrib/elf2dmp/qemu_elf.h
> @@ -8,7 +8,6 @@
>  #ifndef QEMU_ELF_H
>  #define QEMU_ELF_H
>  
> -#include <stdint.h>
>  #include <elf.h>
>  
>  typedef struct QEMUCPUSegment {
> diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
> index 571f114a56..858221ad95 100644
> --- a/contrib/vhost-user-blk/vhost-user-blk.c
> +++ b/contrib/vhost-user-blk/vhost-user-blk.c
> @@ -20,7 +20,6 @@
>  #include "contrib/libvhost-user/libvhost-user-glib.h"
>  #include "contrib/libvhost-user/libvhost-user.h"
>  
> -#include <glib.h>
>  
>  struct virtio_blk_inhdr {
>      unsigned char status;
> diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
> index 02c29019d1..496dd6e693 100644
> --- a/contrib/vhost-user-scsi/vhost-user-scsi.c
> +++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
> @@ -16,7 +16,6 @@
>  #include "contrib/libvhost-user/libvhost-user-glib.h"
>  #include "standard-headers/linux/virtio_scsi.h"
>  
> -#include <glib.h>
>  
>  #define VUS_ISCSI_INITIATOR "iqn.2016-11.com.nutanix:vhost-user-scsi"
>  
> diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
> index dc23f158f3..4fbea8cde2 100644
> --- a/hw/rdma/rdma_utils.c
> +++ b/hw/rdma/rdma_utils.c
> @@ -13,6 +13,7 @@
>   *
>   */
>  
> +#include "qemu/osdep.h"
>  #include "rdma_utils.h"
>  
>  #ifdef PVRDMA_DEBUG
> diff --git a/hw/rdma/rdma_utils.h b/hw/rdma/rdma_utils.h
> index 04c7c2ef5b..c4f96c4f2a 100644
> --- a/hw/rdma/rdma_utils.h
> +++ b/hw/rdma/rdma_utils.h
> @@ -17,7 +17,6 @@
>  #ifndef RDMA_UTILS_H
>  #define RDMA_UTILS_H
>  
> -#include "qemu/osdep.h"
>  #include "hw/pci/pci.h"
>  #include "sysemu/dma.h"
>  
> diff --git a/hw/rdma/vmw/pvrdma_dev_ring.h b/hw/rdma/vmw/pvrdma_dev_ring.h
> index 411d244603..5f2a0cf9b9 100644
> --- a/hw/rdma/vmw/pvrdma_dev_ring.h
> +++ b/hw/rdma/vmw/pvrdma_dev_ring.h
> @@ -16,7 +16,6 @@
>  #ifndef PVRDMA_DEV_RING_H
>  #define PVRDMA_DEV_RING_H
>  
> -#include "qemu/typedefs.h"
>  
>  #define MAX_RING_NAME_SZ 32
>  
> diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
> index 65de952f44..32b880213d 100644
> --- a/hw/vfio/ap.c
> +++ b/hw/vfio/ap.c
> @@ -10,9 +10,9 @@
>   * directory.
>   */
>  
> +#include "qemu/osdep.h"
>  #include <linux/vfio.h>
>  #include <sys/ioctl.h>
> -#include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/sysbus.h"
>  #include "hw/vfio/vfio.h"
> diff --git a/include/qemu/vfio-helpers.h b/include/qemu/vfio-helpers.h
> index ce7e7b057f..1f057c2b9e 100644
> --- a/include/qemu/vfio-helpers.h
> +++ b/include/qemu/vfio-helpers.h
> @@ -12,7 +12,6 @@
>  
>  #ifndef QEMU_VFIO_HELPERS_H
>  #define QEMU_VFIO_HELPERS_H
> -#include "qemu/typedefs.h"
>  
>  typedef struct QEMUVFIOState QEMUVFIOState;
>  
> diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
> index 89592ae4fa..d200ee01d0 100644
> --- a/include/sysemu/whpx.h
> +++ b/include/sysemu/whpx.h
> @@ -13,7 +13,6 @@
>  #ifndef QEMU_WHPX_H
>  #define QEMU_WHPX_H
>  
> -#include "config-host.h"
>  #include "qemu-common.h"
>  
>  int whpx_init_vcpu(CPUState *cpu);
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 2395171acf..20b2d325d8 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -11,12 +11,13 @@
>   *
>   */
>  
> +#include "qemu/osdep.h"
> +
>  #include <linux/kvm.h>
>  #include <linux/psp-sev.h>
>  
>  #include <sys/ioctl.h>
>  
> -#include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qom/object_interfaces.h"
>  #include "qemu/base64.h"
> diff --git a/target/i386/whp-dispatch.h b/target/i386/whp-dispatch.h
> index d8d3485976..4ae3cc8fa5 100644
> --- a/target/i386/whp-dispatch.h
> +++ b/target/i386/whp-dispatch.h
> @@ -1,5 +1,4 @@
>  #include "windows.h"
> -#include <stdbool.h>
>  
>  #include <WinHvPlatform.h>
>  #include <WinHvEmulation.h>
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index fdb87d8d82..01b45ca0ae 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -17,7 +17,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include <stdlib.h>
>  #include "cpu.h"
>  #include "qemu/host-utils.h"
>  #include "exec/exec-all.h"
> diff --git a/tests/fp/platform.h b/tests/fp/platform.h
> index c20ba70baa..f8c423dde3 100644
> --- a/tests/fp/platform.h
> +++ b/tests/fp/platform.h
> @@ -29,7 +29,6 @@
>   * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
>   * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>   */
> -#include "config-host.h"
>  
>  #ifndef HOST_WORDS_BIGENDIAN
>  #define LITTLEENDIAN 1
> diff --git a/tests/tpm-util.h b/tests/tpm-util.h
> index 9e98bc5124..5755698ad2 100644
> --- a/tests/tpm-util.h
> +++ b/tests/tpm-util.h
> @@ -13,7 +13,6 @@
>  #ifndef TESTS_TPM_UTIL_H
>  #define TESTS_TPM_UTIL_H
>  
> -#include "qemu/osdep.h"
>  #include "io/channel-socket.h"
>  
>  typedef void (tx_func)(QTestState *s,
> diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
> index 0cf8d0baca..0033b61f2e 100644
> --- a/tests/vhost-user-bridge.c
> +++ b/tests/vhost-user-bridge.c
> @@ -29,8 +29,8 @@
>  
>  #define _FILE_OFFSET_BITS 64
>  
> -#include "qemu/atomic.h"
>  #include "qemu/osdep.h"
> +#include "qemu/atomic.h"
>  #include "qemu/iov.h"
>  #include "standard-headers/linux/virtio_net.h"
>  #include "contrib/libvhost-user/libvhost-user.h"
> diff --git a/util/qemu-thread-common.h b/util/qemu-thread-common.h
> index a0ea7c0d92..2af6b12085 100644
> --- a/util/qemu-thread-common.h
> +++ b/util/qemu-thread-common.h
> @@ -13,7 +13,6 @@
>  #ifndef QEMU_THREAD_COMMON_H
>  #define QEMU_THREAD_COMMON_H
>  
> -#include "qemu/typedefs.h"
>  #include "qemu/thread.h"
>  #include "trace.h"
>  
> -- 
> 2.17.2
> 

