Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1omtS7-0007qJ-0N
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 05:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1omsf0-0006G5-Ae; Mon, 24 Oct 2022 04:18:21 -0400
Received: from mailgw.felk.cvut.cz ([147.32.82.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1omsep-0005xB-Hq; Mon, 24 Oct 2022 04:18:08 -0400
Received: from mailgw.felk.cvut.cz (localhost.localdomain [127.0.0.1])
 by mailgw.felk.cvut.cz (Proxmox) with ESMTP id 019E530B295F;
 Mon, 24 Oct 2022 10:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 cmp.felk.cvut.cz; h=cc:cc:content-transfer-encoding:content-type
 :content-type:date:from:from:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=felkmail; bh=OpivM
 Pimy9uqEgZO+2MV5XjVRs/s41WV3GonaK+h8k0=; b=DzoB07Vck/1zEbjNgOW11
 U/avwviKRjVNuuqzp9kI6ADUKCMs2txj4t3TgdGp2IGhJaV1jAbV86WJ7XnCrNru
 SGM1g3h77KRDJCYOZbg9D4+kUTu2C1nEUVDdHl5NUoMy+DMFVwoD45NmZd/zQJr8
 01BV452HiQeqCP34j8E2lVBMQvJ7VR6UXqI5hRz98q6vfaYP6LjVQZrpfr1pnnJQ
 r4CtumoToTgBVvOqJRVU3N2njVBIDyvyDeYMrwehWRF3/aLBOT1vemTvs2oA5+AB
 htYPws3zBlJtluvEX11XC7DwIiJBL1pTHe2CCslRehBcueP3x2CjMgZu4xdg10cV
 Q==
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by mailgw.felk.cvut.cz (Proxmox) with ESMTPS id 2C08730ADE53;
 Mon, 24 Oct 2022 10:17:46 +0200 (CEST)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 29O8Hjpb026444; Mon, 24 Oct 2022 10:17:45 +0200
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 29O8HjdN026443;
 Mon, 24 Oct 2022 10:17:45 +0200
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: Bin Meng <bmeng@tinyclub.github.io>
Subject: Re: [PATCH] treewide: Remove the unnecessary space before semicolon
Date: Mon, 24 Oct 2022 10:17:39 +0200
User-Agent: KMail/1.9.10
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Yoshinori Sato <ysato@users.osdn.me>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20221024072802.457832-1-bmeng@tinylab.org>
In-Reply-To: <20221024072802.457832-1-bmeng@tinylab.org>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202210241017.39626.pisa@cmp.felk.cvut.cz>
Received-SPF: none client-ip=147.32.82.15; envelope-from=pisa@cmp.felk.cvut.cz;
 helo=mailgw.felk.cvut.cz
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 24 Oct 2022 05:08:50 -0400
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
X-List-Received-Date: Mon, 24 Oct 2022 08:18:22 -0000

Hllo Bin Meng,

I ACK the change for SJA1000.

On Monday 24 of October 2022 09:28:02 Bin Meng wrote:
> %s/return ;/return;
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
>  include/hw/elf_ops.h         | 2 +-
>  hw/9pfs/9p.c                 | 2 +-
>  hw/dma/pl330.c               | 2 +-

>  hw/net/can/can_sja1000.c     | 2 +-

Acked-by: Pave Pisa <pisa@cmp.felk.cvut.cz>

>  hw/timer/renesas_cmt.c       | 2 +-
>  hw/timer/renesas_tmr.c       | 8 ++++----
>  hw/virtio/virtio-pci.c       | 2 +-
>  target/riscv/vector_helper.c | 2 +-
>  target/rx/op_helper.c        | 4 ++--
>  ui/vnc-jobs.c                | 2 +-
>  ui/vnc.c                     | 2 +-
>  11 files changed, 15 insertions(+), 15 deletions(-)
>

> diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
> index e0f76d3eb3..73201f9139 100644
> --- a/hw/net/can/can_sja1000.c
> +++ b/hw/net/can/can_sja1000.c
> @@ -431,7 +431,7 @@ void can_sja_mem_write(CanSJA1000State *s, hwaddr addr,
> uint64_t val, (unsigned long long)val, (unsigned int)addr);
>
>      if (addr > CAN_SJA_MEM_SIZE) {
> -        return ;
> +        return;
>      }
>
>      if (s->clock & 0x80) { /* PeliCAN Mode */

-- 

                Pavel Pisa
    phone:      +420 603531357
    e-mail:     pisa@cmp.felk.cvut.cz
    Department of Control Engineering FEE CVUT
    Karlovo namesti 13, 121 35, Prague 2
    university: http://control.fel.cvut.cz/
    personal:   http://cmp.felk.cvut.cz/~pisa
    projects:   https://www.openhub.net/accounts/ppisa
    CAN related:http://canbus.pages.fel.cvut.cz/
    RISC-V education: https://comparch.edu.cvut.cz/
    Open Technologies Research Education and Exchange Services
    https://gitlab.fel.cvut.cz/otrees/org/-/wikis/home


