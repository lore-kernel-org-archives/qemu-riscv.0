Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pG1Px-0002KC-OE
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 12:31:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pG1Pt-0002GN-SQ; Thu, 12 Jan 2023 12:31:07 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pG1Pn-0000uL-UU; Thu, 12 Jan 2023 12:31:01 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NtBQv41ZDz6J9h8;
 Fri, 13 Jan 2023 01:30:47 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 12 Jan
 2023 17:30:53 +0000
Date: Thu, 12 Jan 2023 17:30:52 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Markus Armbruster <armbru@redhat.com>
CC: <qemu-devel@nongnu.org>, <imp@bsdimp.com>, <kevans@freebsd.org>,
 <berrange@redhat.com>, <ben.widawsky@intel.com>,
 <kbastian@mail.uni-paderborn.de>, <jasowang@redhat.com>,
 <michael.roth@amd.com>, <kkostiuk@redhat.com>, <tsimpson@quicinc.com>,
 <palmer@dabbelt.com>, <alistair.francis@wdc.com>, <bin.meng@windriver.com>,
 <qemu-riscv@nongnu.org>, <philmd@linaro.org>, <mst@redhat.com>, Bin Meng
 <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 1/1] include: Don't include qemu/osdep.h
Message-ID: <20230112173052.00006303@Huawei.com>
In-Reply-To: <20230112115005.1504812-2-armbru@redhat.com>
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
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
X-List-Received-Date: Thu, 12 Jan 2023 17:31:08 -0000

On Thu, 12 Jan 2023 12:50:05 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> docs/devel/style.rst mandates:
>=20
>     The "qemu/osdep.h" header contains preprocessor macros that affect
>     the behavior of core system headers like <stdint.h>.  It must be
>     the first include so that core system headers included by external
>     libraries get the preprocessor macros that QEMU depends on.
>=20
>     Do not include "qemu/osdep.h" from header files since the .c file
>     will have already included it.
>=20
> A few violations have crept in.  Fix them.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

For the CXL one.
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  bsd-user/qemu.h                 | 1 -
>  crypto/block-luks-priv.h        | 1 -
>  include/hw/cxl/cxl_host.h       | 1 -
>  include/hw/input/pl050.h        | 1 -
>  include/hw/tricore/triboard.h   | 1 -
>  include/qemu/userfaultfd.h      | 1 -
>  net/vmnet_int.h                 | 1 -
>  qga/cutils.h                    | 1 -
>  target/hexagon/hex_arch_types.h | 1 -
>  target/hexagon/mmvec/macros.h   | 1 -
>  target/riscv/pmu.h              | 1 -
>  bsd-user/arm/signal.c           | 1 +
>  bsd-user/arm/target_arch_cpu.c  | 2 ++
>  bsd-user/freebsd/os-sys.c       | 1 +
>  bsd-user/i386/signal.c          | 1 +
>  bsd-user/x86_64/signal.c        | 1 +
>  qga/cutils.c                    | 3 ++-
>  17 files changed, 8 insertions(+), 12 deletions(-)
>=20
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index be6105385e..0ceecfb6df 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -17,7 +17,6 @@
>  #ifndef QEMU_H
>  #define QEMU_H
> =20
> -#include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "qemu/units.h"
>  #include "exec/cpu_ldst.h"
> diff --git a/crypto/block-luks-priv.h b/crypto/block-luks-priv.h
> index 90a20d432b..1066df0307 100644
> --- a/crypto/block-luks-priv.h
> +++ b/crypto/block-luks-priv.h
> @@ -18,7 +18,6 @@
>   *
>   */
> =20
> -#include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/bswap.h"
> =20
> diff --git a/include/hw/cxl/cxl_host.h b/include/hw/cxl/cxl_host.h
> index a1b662ce40..c9bc9c7c50 100644
> --- a/include/hw/cxl/cxl_host.h
> +++ b/include/hw/cxl/cxl_host.h
> @@ -7,7 +7,6 @@
>   * COPYING file in the top-level directory.
>   */
> =20
> -#include "qemu/osdep.h"
>  #include "hw/cxl/cxl.h"
>  #include "hw/boards.h"
> =20
> diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
> index 89ec4fafc9..4cb8985f31 100644
> --- a/include/hw/input/pl050.h
> +++ b/include/hw/input/pl050.h
> @@ -10,7 +10,6 @@
>  #ifndef HW_PL050_H
>  #define HW_PL050_H
> =20
> -#include "qemu/osdep.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
>  #include "hw/input/ps2.h"
> diff --git a/include/hw/tricore/triboard.h b/include/hw/tricore/triboard.h
> index 094c8bd563..4fdd2d7d97 100644
> --- a/include/hw/tricore/triboard.h
> +++ b/include/hw/tricore/triboard.h
> @@ -18,7 +18,6 @@
>   * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
>   */
> =20
> -#include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
>  #include "sysemu/sysemu.h"
> diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
> index 6b74f92792..55c95998e8 100644
> --- a/include/qemu/userfaultfd.h
> +++ b/include/qemu/userfaultfd.h
> @@ -13,7 +13,6 @@
>  #ifndef USERFAULTFD_H
>  #define USERFAULTFD_H
> =20
> -#include "qemu/osdep.h"
>  #include "exec/hwaddr.h"
>  #include <linux/userfaultfd.h>
> =20
> diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> index adf6e8c20d..d0b90594f2 100644
> --- a/net/vmnet_int.h
> +++ b/net/vmnet_int.h
> @@ -10,7 +10,6 @@
>  #ifndef VMNET_INT_H
>  #define VMNET_INT_H
> =20
> -#include "qemu/osdep.h"
>  #include "vmnet_int.h"
>  #include "clients.h"
> =20
> diff --git a/qga/cutils.h b/qga/cutils.h
> index f0f30a7d28..2bfaf554a8 100644
> --- a/qga/cutils.h
> +++ b/qga/cutils.h
> @@ -1,7 +1,6 @@
>  #ifndef CUTILS_H_
>  #define CUTILS_H_
> =20
> -#include "qemu/osdep.h"
> =20
>  int qga_open_cloexec(const char *name, int flags, mode_t mode);
> =20
> diff --git a/target/hexagon/hex_arch_types.h b/target/hexagon/hex_arch_ty=
pes.h
> index 885f68f760..52a7f2b2f3 100644
> --- a/target/hexagon/hex_arch_types.h
> +++ b/target/hexagon/hex_arch_types.h
> @@ -18,7 +18,6 @@
>  #ifndef HEXAGON_HEX_ARCH_TYPES_H
>  #define HEXAGON_HEX_ARCH_TYPES_H
> =20
> -#include "qemu/osdep.h"
>  #include "mmvec/mmvec.h"
>  #include "qemu/int128.h"
> =20
> diff --git a/target/hexagon/mmvec/macros.h b/target/hexagon/mmvec/macros.h
> index 8c864e8c68..1201d778d0 100644
> --- a/target/hexagon/mmvec/macros.h
> +++ b/target/hexagon/mmvec/macros.h
> @@ -18,7 +18,6 @@
>  #ifndef HEXAGON_MMVEC_MACROS_H
>  #define HEXAGON_MMVEC_MACROS_H
> =20
> -#include "qemu/osdep.h"
>  #include "qemu/host-utils.h"
>  #include "arch.h"
>  #include "mmvec/system_ext_mmvec.h"
> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> index 3004ce37b6..0c819ca983 100644
> --- a/target/riscv/pmu.h
> +++ b/target/riscv/pmu.h
> @@ -16,7 +16,6 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
> =20
> -#include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "cpu.h"
>  #include "qemu/main-loop.h"
> diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
> index 2b1dd745d1..9734407543 100644
> --- a/bsd-user/arm/signal.c
> +++ b/bsd-user/arm/signal.c
> @@ -17,6 +17,7 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
> =20
> +#include "qemu/osdep.h"
>  #include "qemu.h"
> =20
>  /*
> diff --git a/bsd-user/arm/target_arch_cpu.c b/bsd-user/arm/target_arch_cp=
u.c
> index 02bf9149d5..fe38ae2210 100644
> --- a/bsd-user/arm/target_arch_cpu.c
> +++ b/bsd-user/arm/target_arch_cpu.c
> @@ -16,6 +16,8 @@
>   *  You should have received a copy of the GNU General Public License
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
> +
> +#include "qemu/osdep.h"
>  #include "target_arch.h"
> =20
>  void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)
> diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
> index 309e27b9d6..1676ec10f8 100644
> --- a/bsd-user/freebsd/os-sys.c
> +++ b/bsd-user/freebsd/os-sys.c
> @@ -17,6 +17,7 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
> =20
> +#include "qemu/osdep.h"
>  #include "qemu.h"
>  #include "target_arch_sysarch.h"
> =20
> diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c
> index 5dd975ce56..a3131047b8 100644
> --- a/bsd-user/i386/signal.c
> +++ b/bsd-user/i386/signal.c
> @@ -17,6 +17,7 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
> =20
> +#include "qemu/osdep.h"
>  #include "qemu.h"
> =20
>  /*
> diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
> index c3875bc4c6..46cb865180 100644
> --- a/bsd-user/x86_64/signal.c
> +++ b/bsd-user/x86_64/signal.c
> @@ -16,6 +16,7 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
> =20
> +#include "qemu/osdep.h"
>  #include "qemu.h"
> =20
>  /*
> diff --git a/qga/cutils.c b/qga/cutils.c
> index b8e142ef64..b21bcf3683 100644
> --- a/qga/cutils.c
> +++ b/qga/cutils.c
> @@ -2,8 +2,9 @@
>   * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
>   * See the COPYING file in the top-level directory.
>   */
> -#include "cutils.h"
> =20
> +#include "qemu/osdep.h"
> +#include "cutils.h"
>  #include "qapi/error.h"
> =20
>  /**


