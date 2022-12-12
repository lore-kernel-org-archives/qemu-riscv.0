Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4qlX-00054N-BU
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 16:55:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p4qlV-00053t-3M; Mon, 12 Dec 2022 16:55:13 -0500
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p4qlR-0005fT-7f; Mon, 12 Dec 2022 16:55:12 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id t191so661564vkb.4;
 Mon, 12 Dec 2022 13:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XPiBMYA7XKdkc+Oy7C8yxmNgKSdp63gV9UUUHz0Nito=;
 b=cWxI311RE2Oxh+LkXxe/bKjLEQYn5/lXbAz2cv6NZj9Ez1wyDOHcSvf6liK+Hxse9g
 6AQqgH3T0ltxdleZkxEzjVnCi/Y5njfNXgs0KrSuIoid1YqROXVH0TwNhtRlUOByYzEu
 5DRnoesxedTsdIvMsaSntZ8LFMKPqQV7wy9n0DXLTkl8HEHhvhAeHUKakm59/z+5gsSr
 xh4JdZA7MMISu4JCxFJ+V9aR8THsGXoEolMzvMigGjzIN7k4+PwcOSvm78Ib7hj20xJE
 5pRizBZKW6dk2W8eMZjtKTshbEx7H0U0ARKhzuVbULso2wccAJ+p/ZHVBauhH4hGqg7A
 wRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XPiBMYA7XKdkc+Oy7C8yxmNgKSdp63gV9UUUHz0Nito=;
 b=GeoCNsSYNbOpbAY6RmpgW33OLp5IJZBr+nKAonlsfTtcRzcXp+Sv8kcLsb3VBkKGBY
 VILhDtRPD3efdLsMKg6GmhJ+YtJCN4Uged6go87W8tZ3OUfsDtdKAYHElwIELh9vrgqm
 GjBskSYSCrhjZuonSSDfW2H5+X3pZMv7qUfAP6eR6Ey4ItlXytVxnnOB4F8vwWrTZ+Si
 1mKLCVBVvtpeV1rbUTrBE3nHz79lJIG9HMxKn9qEyNiP5xPcFL4UDi39N38ogkSXdRng
 QCbK3TuDXYbEr+9ED8yJ4AYH6pJ16NGUU0pNcYOzfohHdCgYZ0FY2SvXRM1lF2ILdk0u
 mbDw==
X-Gm-Message-State: ANoB5pk8TPSg7DrrNHBj6dmLg7OVTHLfvL8GCQGXy7Ilyg/EtGgFnq6K
 KOtDTT60c0e+YhVetttXB879nDvbeun4l2IBAfs=
X-Google-Smtp-Source: AA0mqf5vIni3XClXu55GQZHm64G1fJ5gUhgEq/Yp3V8/JLdgXVHtZb5C6cJ326vlMa/B+KoBaxUOML9zeYaNHX1cmmc=
X-Received: by 2002:a1f:3846:0:b0:3bc:c843:c7b5 with SMTP id
 f67-20020a1f3846000000b003bcc843c7b5mr31346195vka.30.1670882106923; Mon, 12
 Dec 2022 13:55:06 -0800 (PST)
MIME-Version: 1.0
References: <20221212070431.306727-1-armbru@redhat.com>
In-Reply-To: <20221212070431.306727-1-armbru@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 13 Dec 2022 07:54:40 +1000
Message-ID: <CAKmqyKMDXaEM-eO0t_cQPQ-TobY4Xzy1TC5-8btHDon-JuR+SQ@mail.gmail.com>
Subject: Re: [PATCH] include: Don't include qemu/osdep.h
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, imp@bsdimp.com, kevans@freebsd.org, 
 berrange@redhat.com, jonathan.cameron@huawei.com, 
 kbastian@mail.uni-paderborn.de, jasowang@redhat.com, michael.roth@amd.com, 
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 12 Dec 2022 21:55:14 -0000

On Mon, Dec 12, 2022 at 5:05 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> docs/devel/style.rst mandates:
>
>     The "qemu/osdep.h" header contains preprocessor macros that affect
>     the behavior of core system headers like <stdint.h>.  It must be
>     the first include so that core system headers included by external
>     libraries get the preprocessor macros that QEMU depends on.
>
>     Do not include "qemu/osdep.h" from header files since the .c file
>     will have already included it.
>
> A few violations have crept in.  Fix them.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
>  qga/cutils.c                    | 3 ++-
>  12 files changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index be6105385e..0ceecfb6df 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -17,7 +17,6 @@
>  #ifndef QEMU_H
>  #define QEMU_H
>
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
>
> -#include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/bswap.h"
>
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
> diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
> index 89ec4fafc9..4cb8985f31 100644
> --- a/include/hw/input/pl050.h
> +++ b/include/hw/input/pl050.h
> @@ -10,7 +10,6 @@
>  #ifndef HW_PL050_H
>  #define HW_PL050_H
>
> -#include "qemu/osdep.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
>  #include "hw/input/ps2.h"
> diff --git a/include/hw/tricore/triboard.h b/include/hw/tricore/triboard.h
> index 094c8bd563..4fdd2d7d97 100644
> --- a/include/hw/tricore/triboard.h
> +++ b/include/hw/tricore/triboard.h
> @@ -18,7 +18,6 @@
>   * License along with this library; if not, see <http://www.gnu.org/licenses/>.
>   */
>
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
>
> -#include "qemu/osdep.h"
>  #include "exec/hwaddr.h"
>  #include <linux/userfaultfd.h>
>
> diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> index adf6e8c20d..d0b90594f2 100644
> --- a/net/vmnet_int.h
> +++ b/net/vmnet_int.h
> @@ -10,7 +10,6 @@
>  #ifndef VMNET_INT_H
>  #define VMNET_INT_H
>
> -#include "qemu/osdep.h"
>  #include "vmnet_int.h"
>  #include "clients.h"
>
> diff --git a/qga/cutils.h b/qga/cutils.h
> index f0f30a7d28..2bfaf554a8 100644
> --- a/qga/cutils.h
> +++ b/qga/cutils.h
> @@ -1,7 +1,6 @@
>  #ifndef CUTILS_H_
>  #define CUTILS_H_
>
> -#include "qemu/osdep.h"
>
>  int qga_open_cloexec(const char *name, int flags, mode_t mode);
>
> diff --git a/target/hexagon/hex_arch_types.h b/target/hexagon/hex_arch_types.h
> index 885f68f760..52a7f2b2f3 100644
> --- a/target/hexagon/hex_arch_types.h
> +++ b/target/hexagon/hex_arch_types.h
> @@ -18,7 +18,6 @@
>  #ifndef HEXAGON_HEX_ARCH_TYPES_H
>  #define HEXAGON_HEX_ARCH_TYPES_H
>
> -#include "qemu/osdep.h"
>  #include "mmvec/mmvec.h"
>  #include "qemu/int128.h"
>
> diff --git a/target/hexagon/mmvec/macros.h b/target/hexagon/mmvec/macros.h
> index 8345753580..6a463a7db3 100644
> --- a/target/hexagon/mmvec/macros.h
> +++ b/target/hexagon/mmvec/macros.h
> @@ -18,7 +18,6 @@
>  #ifndef HEXAGON_MMVEC_MACROS_H
>  #define HEXAGON_MMVEC_MACROS_H
>
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
>
> -#include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "cpu.h"
>  #include "qemu/main-loop.h"
> diff --git a/qga/cutils.c b/qga/cutils.c
> index b8e142ef64..b21bcf3683 100644
> --- a/qga/cutils.c
> +++ b/qga/cutils.c
> @@ -2,8 +2,9 @@
>   * This work is licensed under the terms of the GNU GPL, version 2 or later.
>   * See the COPYING file in the top-level directory.
>   */
> -#include "cutils.h"
>
> +#include "qemu/osdep.h"
> +#include "cutils.h"
>  #include "qapi/error.h"
>
>  /**
> --
> 2.37.3
>
>

