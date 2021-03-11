Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKFBW-0001U3-K5
	for mharc-qemu-riscv@gnu.org; Thu, 11 Mar 2021 01:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1lKFBT-0001SA-VL; Thu, 11 Mar 2021 01:52:36 -0500
Received: from atcsqr.andestech.com ([60.248.187.195]:44532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@andestech.com>)
 id 1lKFBR-0006RK-Q2; Thu, 11 Mar 2021 01:52:35 -0500
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 12B6qGS8015112;
 Thu, 11 Mar 2021 14:52:16 +0800 (GMT-8)
 (envelope-from dylan@andestech.com)
Received: from atcfdc88 (10.0.15.120) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.487.0; Thu, 11 Mar 2021 14:52:14 +0800
Date: Thu, 11 Mar 2021 14:52:15 +0800
From: Dylan Jhong <dylan@andestech.com>
To: Bin Meng <bmeng.cn@gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, "Bastian
 Koppelmann" <kbastian@mail.uni-paderborn.de>, "qemu-devel@nongnu.org
 Developers" <qemu-devel@nongnu.org>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, "Ruinland Chuan-Tzu Tsa(((((((((()"
 <ruinland@andestech.com>, "Alan Quey-Liang Kao(((((((((()"
 <alankao@andestech.com>
Subject: Re: [PATCH 1/3] Andes RISC-V PLIC
Message-ID: <20210311065215.GB469@atcfdc88>
References: <20210310033358.30499-1-dylan@andestech.com>
 <20210310033358.30499-2-dylan@andestech.com>
 <CAEUhbmVgQzzS4DSOKM_zBxMMAb0bCZBJOZfQ7BUop84SaikZxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAEUhbmVgQzzS4DSOKM_zBxMMAb0bCZBJOZfQ7BUop84SaikZxg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 12B6qGS8015112
Received-SPF: pass client-ip=60.248.187.195; envelope-from=dylan@andestech.com;
 helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 11 Mar 2021 06:52:36 -0000

On Wed, Mar 10, 2021 at 02:05:51PM +0800, Bin Meng wrote:
> On Wed, Mar 10, 2021 at 11:34 AM Dylan Jhong <dylan@andestech.com> wrote:
> >
> > Andes PLIC (Platform-Level Interrupt Controller) device provides an
> > interrupt controller functionality based on Andes's PLIC specification.
> >
> > The Andes PLIC can handle either external interrupts (PLIC)
> > or interprocessor interrupts (PLICSW).
> >
> > While Andes PLIC spec includes vector interrupt and interrupt preemption,
> > we leave them as future items for now.
> >
> > Signed-off-by: Dylan Jhong <dylan@andestech.com>
> > Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> > ---
> >  hw/intc/Kconfig              |   3 +
> >  hw/intc/andes_plic.c         | 505 +++++++++++++++++++++++++++++++++++
> >  hw/intc/meson.build          |   1 +
> >  include/hw/intc/andes_plic.h | 130 +++++++++
> >  4 files changed, 639 insertions(+)
> >  create mode 100644 hw/intc/andes_plic.c
> >  create mode 100644 include/hw/intc/andes_plic.h
> 
> Is the Andes PLIC spec public available?
>

Please refer to Andes website
http://www.andestech.com/en/products-solutions/product-documentation/

> What's the difference between Andres's implementation and the SiFive's?
> 

Currently, the Andes's PLIC specification allows the following functions:

Preemptive Priority Interrupt, Vectored Mode Interrupt Dispatching and
Software-Generated Interrupt.

In this patch, we only implement "Software-Generated Interrupt" feature.
For the other PLIC features, we'll leave them as future items for now.

> Regards,
> Bin

