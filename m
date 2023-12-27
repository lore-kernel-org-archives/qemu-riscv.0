Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4D8C46CD3
	for <qemu-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 02:27:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rIJdo-0001ke-FD; Tue, 26 Dec 2023 21:27:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ethan84@andestech.com>)
 id 1rIJdY-0001jY-Ph; Tue, 26 Dec 2023 21:27:14 -0500
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70]
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ethan84@andestech.com>)
 id 1rIJdO-000490-T1; Tue, 26 Dec 2023 21:27:12 -0500
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 3BR2QP74082154;
 Wed, 27 Dec 2023 10:26:25 +0800 (+08)
 (envelope-from ethan84@andestech.com)
Received: from ethan84-VirtualBox (10.0.12.51) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Wed, 27 Dec 2023
 10:26:24 +0800
Date: Wed, 27 Dec 2023 10:26:15 +0800
To: Alistair Francis <alistair23@gmail.com>
CC: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>,
 <edgar.iglesias@gmail.com>, <richard.henderson@linaro.org>,
 <pbonzini@redhat.com>, <palmer@dabbelt.com>,
 <alistair.francis@wdc.com>, <in.meng@windriver.com>,
 <liweiwei@iscas.ac.cn>, <dbarboza@ventanamicro.com>,
 <hiwei_liu@linux.alibaba.com>, <qemu-riscv@nongnu.org>,
 <peterx@redhat.com>, <david@redhat.com8864484d>
Subject: Re: [PATCH v4 2/4] Add RISC-V IOPMP support
Message-ID: <ZYuLEXKKgOd2LJ3/@ethan84-VirtualBox>
References: <20231122053251.440723-1-ethan84@andestech.com>
 <20231122053251.440723-3-ethan84@andestech.com>
 <CAKmqyKOU_X6E5c3HAgn0tDY7twh448m9DdDUYgGOkEZmmghvtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKOU_X6E5c3HAgn0tDY7twh448m9DdDUYgGOkEZmmghvtw@mail.gmail.com>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.12.51]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3BR2QP74082154
Received-SPF: pass client-ip=60.248.80.70; envelope-from=ethan84@andestech.com;
 helo=Atcsqr.andestech.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, RDNS_DYNAMIC=0.982,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, TVD_RCVD_IP=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  Ethan Chen <ethan84@andestech.com>
From:  Ethan Chen via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Dec 18, 2023 at 02:04:06PM +1000, Alistair Francis wrote:
> On Wed, Nov 22, 2023 at 3:35 PM Ethan Chen via <qemu-devel@nongnu.org> wrote:
> >
> > Support specification Version 1.0.0-draft4 rapid-k model.
> > The specification url:
> > https://github.com/riscv-non-isa/iopmp-spec/blob/main/riscv_iopmp_specification.pdf
> >
> > IOPMP check memory access from deivce is valid or not. This implementation uses
> > IOMMU to change address space that device access. There are three possible
> > results of an access: valid, blocked, and stalled.
> >
> > If an access is valid, target address spcae is downstream_as(system_memory).
> > If an access is blocked, it will go to blocked_io_as. The operation of
> > blocked_io_as could be a bus error, a decode error, or it can respond a success
> > with fabricated data depending on IOPMP ERRREACT register value.
> > If an access is stalled, it will go to stall_io_as. The operation of stall_io_as
> > does nothing but return a stall result to source device. Source device should
> > retry the access if it gets a stall result.
> >
> > IOPMP implementation is rely on bus signal. For example IOPMP on AXI bus checks
> > the AXI burst transaction. A streamsink to receive general transaction_info(sid,
> > start address, end address) is added to IOPMP.
> >
> > If the source device support transaction_info, it can first send a
> > transaction_info to IOPMP streamsink then do the memory access. IOPMP will do
> > additional partially hit check with transaction info.
> > If the source device does not support transaction info. IOPMP will not check
> > partially hit.
> >
> > Signed-off-by: Ethan Chen <ethan84@andestech.com>
> > ---
> >  hw/misc/Kconfig                               |   4 +
> >  hw/misc/meson.build                           |   1 +
> >  hw/misc/riscv_iopmp.c                         | 966 ++++++++++++++++++
> >  include/hw/misc/riscv_iopmp.h                 | 341 +++++++
> >  .../hw/misc/riscv_iopmp_transaction_info.h    |  28 +
> >  5 files changed, 1340 insertions(+)
> >  create mode 100644 hw/misc/riscv_iopmp.c
> >  create mode 100644 include/hw/misc/riscv_iopmp.h
> >  create mode 100644 include/hw/misc/riscv_iopmp_transaction_info.h
> >
> > diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> > index cc8a8c1418..953569e682 100644
> > --- a/hw/misc/Kconfig
> > +++ b/hw/misc/Kconfig
> > @@ -200,4 +200,8 @@ config IOSB
> >  config XLNX_VERSAL_TRNG
> >      bool
> >
> > +config RISCV_IOPMP
> > +    bool
> > +    select STREAM
> > +
> >  source macio/Kconfig
> > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > index 36c20d5637..86b81e1690 100644
> > --- a/hw/misc/meson.build
> > +++ b/hw/misc/meson.build
> > @@ -35,6 +35,7 @@ system_ss.add(when: 'CONFIG_SIFIVE_E_PRCI', if_true: files('sifive_e_prci.c'))
> >  system_ss.add(when: 'CONFIG_SIFIVE_E_AON', if_true: files('sifive_e_aon.c'))
> >  system_ss.add(when: 'CONFIG_SIFIVE_U_OTP', if_true: files('sifive_u_otp.c'))
> >  system_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true: files('sifive_u_prci.c'))
> > +specific_ss.add(when: 'CONFIG_RISCV_IOPMP', if_true: files('riscv_iopmp.c'))
> >
> >  subdir('macio')
> >
> > diff --git a/hw/misc/riscv_iopmp.c b/hw/misc/riscv_iopmp.c
> > new file mode 100644
> > index 0000000000..098a3b81fd
> > --- /dev/null
> > +++ b/hw/misc/riscv_iopmp.c
> > @@ -0,0 +1,966 @@
> > +/*
> > + * QEMU RISC-V IOPMP (Input Output Physical Memory Protection)
> > + *
> > + * Copyright (c) 2023 Andes Tech. Corp.
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "qapi/error.h"
> > +#include "trace.h"
> > +#include "exec/exec-all.h"
> > +#include "exec/address-spaces.h"
> > +#include "hw/qdev-properties.h"
> > +#include "hw/sysbus.h"
> > +#include "hw/misc/riscv_iopmp.h"
> > +#include "memory.h"
> > +#include "hw/irq.h"
> > +
> > +#define TYPE_IOPMP_IOMMU_MEMORY_REGION "iopmp-iommu-memory-region"
> > +#define TYPE_IOPMP_TRASACTION_INFO_SINK "iopmp_transaction_info_sink"
> > +
> > +DECLARE_INSTANCE_CHECKER(Iopmp_StreamSink, IOPMP_TRASACTION_INFO_SINK,
> > +                         TYPE_IOPMP_TRASACTION_INFO_SINK)
> > +#define LOGGE(x...) qemu_log_mask(LOG_GUEST_ERROR, x)
> > +#define xLOG(x...)
> > +#define yLOG(x...) qemu_log(x)
> > +#ifdef DEBUG_RISCV_IOPMP
> > +  #define LOG(x...) yLOG(x)
> > +#else
> > +  #define LOG(x...) xLOG(x)
> > +#endif
> 
> It looks like you missed some of my previous comments. Do you mind
> checking them again
> 
> Alistair

Thanks for your comments. I have checked them and modified according 
your suggestion.

Ethan Chen

> 
> > +
> > +#define MEMTX_IOPMP_STALL (1 << 3)
> > +
> > +
> > +static void iopmp_decode_napot(target_ulong a, target_ulong *sa,
> > +                               target_ulong *ea)
> > +{
> > +    /*
> > +     * aaaa...aaa0   8-byte NAPOT range
> > +     * aaaa...aa01   16-byte NAPOT range
> > +     * aaaa...a011   32-byte NAPOT range
> > +     * ...
> > +     * aa01...1111   2^XLEN-byte NAPOT range
> > +     * a011...1111   2^(XLEN+1)-byte NAPOT range
> > +     * 0111...1111   2^(XLEN+2)-byte NAPOT range
> > +     *  1111...1111   Reserved
> > +     */
> > +
> > +    a = (a << 2) | 0x3;
> > +    *sa = a & (a + 1);
> > +    *ea = a | (a + 1);
> > +}
> > +
> > +static void iopmp_update_rule(IopmpState *s, uint32_t entry_index)
> > +{
> > +    uint8_t this_cfg = s->regs.entry[entry_index].cfg_reg;
> > +    target_ulong this_addr = s->regs.entry[entry_index].addr_reg;
> > +    target_ulong prev_addr = 0u;
> > +    target_ulong sa = 0u;
> > +    target_ulong ea = 0u;
> > +
> > +    if (entry_index >= 1u) {
> > +        prev_addr = s->regs.entry[entry_index - 1].addr_reg;
> > +    }
> > +
> > +    switch (iopmp_get_field(this_cfg, ENTRY_CFG_A)) {
> > +    case IOPMP_AMATCH_OFF:
> > +        sa = 0u;
> > +        ea = -1;
> > +        break;
> > +
> > +    case IOPMP_AMATCH_TOR:
> > +        sa = (prev_addr) << 2; /* shift up from [xx:0] to [xx+2:2] */
> > +        ea = ((this_addr) << 2) - 1u;
> > +        if (sa > ea) {
> > +            sa = ea = 0u;
> > +        }
> > +        break;
> > +
> > +    case IOPMP_AMATCH_NA4:
> > +        sa = this_addr << 2; /* shift up from [xx:0] to [xx+2:2] */
> > +        ea = (sa + 4u) - 1u;
> > +        break;
> > +
> > +    case IOPMP_AMATCH_NAPOT:
> > +        iopmp_decode_napot(this_addr, &sa, &ea);
> > +        break;
> > +
> > +    default:
> > +        sa = 0u;
> > +        ea = 0u;
> > +        break;
> > +    }
> > +
> > +    s->entry_addr[entry_index].sa = sa;
> > +    s->entry_addr[entry_index].ea = ea;
> > +}
> > +
> > +static uint64_t iopmp_read(void *opaque, hwaddr addr, unsigned size)
> > +{
> > +    IopmpState *s = IOPMP(opaque);
> > +    uint32_t rz = 0;
> > +    uint32_t is_stall = 0;
> > +    uint32_t sid;
> > +    switch (addr) {
> > +    case IOPMP_VERSION ... IOPMP_USER_CFG0 + 16 * (IOPMP_MAX_ENTRY_NUM - 1):
> > +        switch (addr) {
> > +        case IOPMP_VERSION:
> > +            rz = VENDER_ANDES << VERSION_VENDOR |
> > +                 SPECVER_1_0_0_DRAFT4 << VERSION_SPECVER;
> > +            break;
> > +        case IOPMP_IMP:
> > +            rz = IMPID_1_0_0_DRAFT4_0;
> > +            break;
> > +        case IOPMP_HWCFG0: /* RO */
> > +            rz = s->sid_num << HWCFG0_SID_NUM |
> > +                 s->entry_num << HWCFG0_ENTRY_NUM;
> > +            break;
> > +        case IOPMP_HWCFG1:
> > +            rz = s->model << HWCFG1_MODEL | TOR_EN << HWCFG1_TOR_EN |
> > +                 s->sps_en << HWCFG1_SPS_EN |
> > +                 USER_CFG_EN << HWCFG1_USER_CFG_EN |
> > +                 s->prient_prog << HWCFG1_PRIENT_PROG |
> > +                 s->sid_transl_en << HWCFG1_SID_TRANSL_EN |
> > +                 s->sid_transl_prog << HWCFG1_SID_TRANSL_PROG |
> > +                 s->md_num << HWCFG1_MD_NUM |
> > +                 s->enable << HWCFG1_ENABLE;
> > +            break;
> > +        case IOPMP_HWCFG2:
> > +            rz = s->prio_entry << HWCFG2_PRIO_ENTRY |
> > +                 s->sid_transl << HWCFG2_SID_TRANSL;
> > +            break;
> > +        case IOPMP_ENTRYOFFSET:
> > +            rz = IOPMP_ENTRY_ADDR0;
> > +            break;
> > +        case IOPMP_ERRREACT:
> > +            rz = s->regs.errreact;
> > +            break;
> > +        case IOPMP_MDSTALL:
> > +            if (s->md_stall_stat) {
> > +                is_stall = 1;
> > +            }
> > +            rz = iopmp_get_field(s->regs.mdstall, MDSTALL_MD) | is_stall;
> > +            break;
> > +        case IOPMP_MDSTALLH:
> > +            rz = s->regs.mdstall >> 32;
> > +            break;
> > +        case IOPMP_SIDSCP:
> > +            sid = iopmp_get_field(s->regs.sidscp, SIDSCP_SID);
> > +            if (sid < s->sid_num) {
> > +                rz = sid | (s->sidscp_op[sid]) << SIDSCP_STAT;
> > +            } else {
> > +                rz = sid | 3 << SIDSCP_STAT;
> > +            }
> > +            break;
> > +        case IOPMP_MDLCK:
> > +            rz = s->regs.mdlck & UINT32_MAX;
> > +            break;
> > +        case IOPMP_MDLCKH:
> > +            rz = s->regs.mdlck >> 32;
> > +            break;
> > +        case IOPMP_MDCFGLCK:
> > +            rz = s->regs.mdcfglck;
> > +            break;
> > +        case IOPMP_ENTRYLCK:
> > +            rz = s->regs.entrylck;
> > +            break;
> > +        case IOPMP_ERR_REQADDR:
> > +            rz = s->regs.err_reqaddr & UINT32_MAX;
> > +            break;
> > +        case IOPMP_ERR_REQADDRH:
> > +            rz = s->regs.err_reqaddr >> 32;
> > +            break;
> > +        case IOPMP_ERR_REQSID:
> > +            rz = s->regs.err_reqsid;
> > +            break;
> > +        case IOPMP_ERR_REQINFO:
> > +            rz = s->regs.err_reqinfo;
> > +            break;
> > +
> > +        default:
> > +            if (addr >= IOPMP_MDCFG0 &&
> > +                addr < IOPMP_MDCFG0 + 4 * (s->md_num - 1)) {
> > +                int offset = addr - IOPMP_MDCFG0;
> > +                int idx = offset >> 2;
> > +                if (idx == 0) {
> > +                    if (offset == 0) {
> > +                        rz = s->regs.mdcfg[idx];
> > +                    } else {
> > +                        LOGGE("%s: Bad addr %x\n", __func__, (int)addr);
> > +                    }
> > +                } else {
> > +                    /* Only MDCFG0 is implemented */
> > +                    LOGGE("%s: Bad addr %x\n", __func__, (int)addr);
> > +                }
> > +            } else if (addr >= IOPMP_SRCMD_EN0 &&
> > +                       addr < IOPMP_SRCMD_WH0 + 32 * (s->sid_num - 1)) {
> > +                int offset = addr - IOPMP_SRCMD_EN0;
> > +                int idx = offset >> 5;
> > +                offset &= 0x1f;
> > +                if (offset == 0) {
> > +                    rz = s->regs.srcmd_en[idx] & UINT32_MAX;
> > +                } else if (offset == 4) {
> > +                    rz = s->regs.srcmd_en[idx] >> 32;
> > +                } else if (offset == 8) {
> > +                    rz = s->regs.srcmd_r[idx] & UINT32_MAX;
> > +                } else if (offset == 12) {
> > +                    rz = s->regs.srcmd_r[idx] >> 32;
> > +                } else if (offset == 16) {
> > +                    rz = s->regs.srcmd_w[idx] & UINT32_MAX;
> > +                } else if (offset == 24) {
> > +                    rz = s->regs.srcmd_w[idx] >> 32;
> > +                } else {
> > +                    LOGGE("%s: Bad addr %x\n", __func__, (int)addr);
> > +                }
> > +            } else if (addr >= IOPMP_ENTRY_ADDR0 &&
> > +                       addr < IOPMP_USER_CFG0 + 16 * (s->entry_num - 1)) {
> > +                int offset = addr - IOPMP_ENTRY_ADDR0;
> > +                int idx = offset >> 4;
> > +                offset &= 0xf;
> > +                if (offset == 0) {
> > +                    rz = s->regs.entry[idx].addr_reg & UINT32_MAX;
> > +                } else if (offset == 4) {
> > +                    rz = s->regs.entry[idx].addr_reg >> 32;
> > +                } else if (offset == 8) {
> > +                    rz = s->regs.entry[idx].cfg_reg;
> > +                } else if (offset == 12) {
> > +                    /* Does not support user customized permission */
> > +                    rz = 0;
> > +                } else {
> > +                    LOGGE("%s: Bad addr %x\n", __func__, (int)addr);
> > +                }
> > +            } else {
> > +                LOGGE("%s: Bad addr %x\n", __func__, (int)addr);
> > +            }
> > +            break;
> > +        }
> > +        LOG("\e[95m%s: addr %08x, value %08x\e[0m\n", __func__, (int)addr,
> > +            (int)rz);
> > +        break;
> > +    default:
> > +        LOGGE("%s: Bad addr %x\n", __func__, (int)addr);
> > +    }
> > +
> > +    return rz;
> > +}
> > +
> > +static void
> > +iopmp_write(void *opaque, hwaddr addr, uint64_t value, unsigned size)
> > +{
> > +    IopmpState *s = IOPMP(opaque);
> > +    int value_f;
> > +    int reg_f;
> > +    uint32_t sid, op;
> > +
> > +    switch (addr) {
> > +    case IOPMP_VERSION ... IOPMP_USER_CFG0 + 16 * (IOPMP_MAX_ENTRY_NUM - 1):
> > +        switch (addr) {
> > +        case IOPMP_VERSION: /* RO */
> > +            break;
> > +        case IOPMP_IMP: /* RO */
> > +            break;
> > +        case IOPMP_HWCFG0: /* RO */
> > +            break;
> > +        case IOPMP_HWCFG1:
> > +            if (iopmp_get_field(value, HWCFG1_PRIENT_PROG)) {
> > +                /* W1C */
> > +                s->prient_prog = 0;
> > +            }
> > +            if (iopmp_get_field(value, HWCFG1_SID_TRANSL_PROG)) {
> > +                /* W1C */
> > +                s->sid_transl_prog = 0;
> > +            }
> > +            if (iopmp_get_field(value, HWCFG1_ENABLE)) {
> > +                /* W1S */
> > +                s->enable = 1;
> > +            }
> > +            break;
> > +        case IOPMP_HWCFG2:
> > +            if (s->prient_prog) {
> > +                s->prio_entry = iopmp_get_field(value, HWCFG2_PRIO_ENTRY);
> > +            }
> > +            if (s->sid_transl_en && s->sid_transl_prog) {
> > +                s->sid_transl = iopmp_get_field(value, HWCFG2_SID_TRANSL);
> > +            }
> > +            break;
> > +        case IOPMP_ERRREACT:
> > +            if (!iopmp_get_field(s->regs.errreact, ERRREACT_L)) {
> > +                    iopmp_set_field32(&s->regs.errreact, ERRREACT_L,
> > +                                    iopmp_get_field(value, ERRREACT_L));
> > +                if (iopmp_get_field(value, ERRREACT_IP)) {
> > +                    iopmp_set_field32(&s->regs.errreact, ERRREACT_IP, 0);
> > +                }
> > +                iopmp_set_field32(&s->regs.errreact, ERRREACT_IE,
> > +                                iopmp_get_field(value, ERRREACT_IE));
> > +                iopmp_set_field32(&s->regs.errreact, ERRREACT_IRE,
> > +                                iopmp_get_field(value, ERRREACT_IRE));
> > +                iopmp_set_field32(&s->regs.errreact, ERRREACT_RRE,
> > +                                iopmp_get_field(value, ERRREACT_RRE));
> > +                iopmp_set_field32(&s->regs.errreact, ERRREACT_IWE,
> > +                                iopmp_get_field(value, ERRREACT_IWE));
> > +                iopmp_set_field32(&s->regs.errreact, ERRREACT_RWE,
> > +                                iopmp_get_field(value, ERRREACT_RWE));
> > +                iopmp_set_field32(&s->regs.errreact, ERRREACT_PEE,
> > +                                iopmp_get_field(value, ERRREACT_PEE));
> > +                iopmp_set_field32(&s->regs.errreact, ERRREACT_RPE,
> > +                                iopmp_get_field(value, ERRREACT_RPE));
> > +            } else {
> > +                if (iopmp_get_field(value, ERRREACT_IP)) {
> > +                    iopmp_set_field32(&s->regs.errreact, ERRREACT_IP, 0);
> > +                }
> > +            }
> > +            break;
> > +        case IOPMP_MDSTALL:
> > +            iopmp_set_field64(&s->regs.mdstall, MDSTALL, value);
> > +            break;
> > +        case IOPMP_MDSTALLH:
> > +            iopmp_set_field64(&s->regs.mdstall, MDSTALLH, value);
> > +            break;
> > +        case IOPMP_SIDSCP:
> > +            sid = iopmp_get_field(value, SIDSCP_SID);
> > +            op = iopmp_get_field(value, SIDSCP_OP);
> > +            if (sid < s->sid_num) {
> > +                if (op != SIDSCP_OP_QUERY) {
> > +                    s->sidscp_op[sid] = op;
> > +                    s->regs.sidscp = value;
> > +                }
> > +            } else {
> > +                s->regs.sidscp = sid | (0x3 << SIDSCP_OP);
> > +            }
> > +            break;
> > +        case IOPMP_MDLCK:
> > +            if (!(s->regs.mdlck & (1 << MDLCK_L))) {
> > +                s->regs.mdlck = value |
> > +                                (s->regs.mdstall & ~(uint64_t)UINT32_MAX);
> > +            }
> > +            break;
> > +        case IOPMP_MDLCKH:
> > +             if (!(s->regs.mdlck & (1 << MDLCK_L))) {
> > +                s->regs.mdlck = (uint64_t)value << 32 |
> > +                                (s->regs.mdstall & UINT32_MAX);
> > +            }
> > +            break;
> > +        case IOPMP_MDCFGLCK:
> > +            if (!iopmp_get_field(s->regs.mdcfglck, MDCFGLCK_L)) {
> > +                value_f = iopmp_get_field(value, MDCFGLCK_F);
> > +                reg_f = iopmp_get_field(s->regs.mdcfglck, MDCFGLCK_F);
> > +                if (value_f > reg_f) {
> > +                    iopmp_set_field32(&s->regs.mdcfglck, MDCFGLCK_F, value_f);
> > +                }
> > +                iopmp_set_field32(&s->regs.mdcfglck, MDCFGLCK_L,
> > +                          iopmp_get_field(value, MDCFGLCK_L));
> > +            }
> > +            break;
> > +        case IOPMP_ENTRYLCK:
> > +            if (!(iopmp_get_field(s->regs.entrylck, ENTRYLCK_L))) {
> > +                value_f = iopmp_get_field(value, ENTRYLCK_F);
> > +                reg_f = iopmp_get_field(s->regs.entrylck, ENTRYLCK_F);
> > +                if (value_f > reg_f) {
> > +                    iopmp_set_field32(&s->regs.entrylck, ENTRYLCK_F, value_f);
> > +                }
> > +                iopmp_set_field32(&s->regs.entrylck, ENTRYLCK_F,
> > +                          iopmp_get_field(value, ENTRYLCK_F));
> > +            }
> > +        case IOPMP_ERR_REQADDR: /* RO */
> > +            break;
> > +        case IOPMP_ERR_REQADDRH: /* RO */
> > +            break;
> > +        case IOPMP_ERR_REQSID: /* RO */
> > +            break;
> > +        case IOPMP_ERR_REQINFO: /* RO */
> > +            break;
> > +
> > +        default:
> > +            if (addr >= IOPMP_MDCFG0 &&
> > +                addr < IOPMP_MDCFG0 + 4 * (s->md_num - 1)) {
> > +                int offset = addr - IOPMP_MDCFG0;
> > +                int idx = offset >> 2;
> > +                /* RO in rapid-k model */
> > +                if (idx > 0) {
> > +                    LOGGE("%s: Bad addr %x\n", __func__, (int)addr);
> > +                }
> > +            } else if (addr >= IOPMP_SRCMD_EN0 &&
> > +                       addr < IOPMP_SRCMD_WH0 + 32 * (s->sid_num - 1)) {
> > +                int offset = addr - IOPMP_SRCMD_EN0;
> > +                int idx = offset >> 5;
> > +                offset &= 0x1f;
> > +                if (offset % 4) {
> > +                    LOGGE("%s: Bad addr %x\n", __func__, (int)addr);
> > +                } else if (iopmp_get_field(s->regs.srcmd_en[idx],
> > +                                           SRCMD_EN_L) == 0) {
> > +                    if (offset == 0) {
> > +                        iopmp_set_field64(&s->regs.srcmd_en[idx], SRCMD_EN_MD,
> > +                                        iopmp_get_field(value, SRCMD_EN_MD));
> > +                        iopmp_set_field64(&s->regs.srcmd_en[idx], SRCMD_EN_L,
> > +                                        iopmp_get_field(value, SRCMD_EN_L));
> > +                    } else if (offset == 4) {
> > +                        iopmp_set_field64(&s->regs.srcmd_en[idx], SRCMD_ENH_MDH,
> > +                                        value);
> > +                    } else if (offset == 8 && s->sps_en) {
> > +                        iopmp_set_field64(&s->regs.srcmd_r[idx], SRCMD_R_MD,
> > +                                            iopmp_get_field(value, SRCMD_R_MD));
> > +                    } else if (offset == 12 && s->sps_en) {
> > +                        iopmp_set_field64(&s->regs.srcmd_r[idx], SRCMD_RH_MDH,
> > +                                        value);
> > +                    } else if (offset == 16 && s->sps_en) {
> > +                        iopmp_set_field64(&s->regs.srcmd_w[idx], SRCMD_W_MD,
> > +                                        iopmp_get_field(value, SRCMD_W_MD));
> > +                    } else if (offset == 24 && s->sps_en) {
> > +                        iopmp_set_field64(&s->regs.srcmd_w[idx], SRCMD_WH_MDH,
> > +                                          value);
> > +                    }
> > +                }
> > +            } else if (addr >= IOPMP_ENTRY_ADDR0 &&
> > +                       addr < IOPMP_USER_CFG0 + 16 * (s->entry_num - 1)) {
> > +                int offset = addr - IOPMP_ENTRY_ADDR0;
> > +                int idx = offset >> 4;
> > +                offset &= 0xf;
> > +                if (offset == 0) {
> > +                    iopmp_set_field64(&s->regs.entry[idx].addr_reg,
> > +                                      ENTRY_ADDR_ADDR, value);
> > +                } else if (offset == 4) {
> > +                    iopmp_set_field64(&s->regs.entry[idx].addr_reg,
> > +                                      ENTRY_ADDRH_ADDRH, value);
> > +                } else if (offset == 8) {
> > +                    s->regs.entry[idx].cfg_reg = value;
> > +                } else if (offset == 12) {
> > +                    /* Does not support user customized permission */
> > +                    ;
> > +                } else {
> > +                    LOGGE("%s: Bad addr %x\n", __func__, (int)addr);
> > +                }
> > +                iopmp_update_rule(s, idx);
> > +            } else {
> > +                LOGGE("%s: Bad addr %x\n", __func__, (int)addr);
> > +            }
> > +            /* If IOPMP permission of any addr has been changed, */
> > +            /* flush TLB pages. */
> > +            tlb_flush_all_cpus_synced(current_cpu);
> > +            break;
> > +        }
> > +        LOG("\e[95m%s: addr %08x, value %08x\e[0m\n", __func__, (int)addr,
> > +            (int)rz);
> > +        break;
> > +    default:
> > +        LOGGE("%s: Bad addr %x\n", __func__, (int)addr);
> > +    }
> > +}
> > +
> > +/* Match entry in memory domain */
> > +static int match_entry_md(IopmpState *s, int md_idx, hwaddr s_addr,
> > +                          hwaddr e_addr, int *entry_idx)
> > +{
> > +    int entry_idx_s, entry_idx_e;
> > +    int result = ENTRY_NO_HIT;
> > +    int i = 0;
> > +    entry_idx_s = md_idx * s->regs.mdcfg[0];
> > +    entry_idx_e = (md_idx + 1) * s->regs.mdcfg[0];
> > +    if (entry_idx_s >= s->entry_num) {
> > +        return result;
> > +    }
> > +    if (entry_idx_e > s->entry_num) {
> > +        entry_idx_e = s->entry_num;
> > +    }
> > +    i = entry_idx_s;
> > +    while (i < entry_idx_e) {
> > +        if (s_addr >= s->entry_addr[i].sa && s_addr <= s->entry_addr[i].ea) {
> > +            /* check end address */
> > +            if (e_addr >= s->entry_addr[i].sa &&
> > +                e_addr <= s->entry_addr[i].ea) {
> > +                *entry_idx = i;
> > +                return ENTRY_HIT;
> > +            } else if (i >= s->prio_entry) {
> > +                /* record result and continue for non-prio_entry */
> > +                result = ENTRY_PAR_HIT;
> > +                continue;
> > +            } else {
> > +                return ENTRY_PAR_HIT;
> > +            }
> > +        }
> > +        i++;
> > +    }
> > +    return result;
> > +}
> > +
> > +static int match_entry(IopmpState *s, int sid, hwaddr s_addr, hwaddr e_addr,
> > +                       int *match_md_idx, int *match_entry_idx)
> > +{
> > +    int cur_result = ENTRY_NO_HIT;
> > +    int result = ENTRY_NO_HIT;
> > +    uint64_t srcmd_en = s->regs.srcmd_en[sid] >> 1;
> > +    for (int md_idx = 0; md_idx < s->md_num; md_idx++) {
> > +        if (srcmd_en & (1ULL << md_idx)) {
> > +            cur_result = match_entry_md(s, md_idx, s_addr, e_addr,
> > +                                        match_entry_idx);
> > +            if (cur_result == ENTRY_HIT) {
> > +                *match_md_idx = md_idx;
> > +                return cur_result;
> > +            }
> > +            if (cur_result > result) {
> > +                result = cur_result;
> > +            }
> > +        }
> > +    }
> > +    return result;
> > +}
> > +
> > +static bool check_md_stall(IopmpState *s, int md_idx)
> > +{
> > +    uint64_t md_selected = iopmp_get_field(s->regs.mdstall, MDSTALL_MD) &
> > +                           (1 << md_idx);
> > +    if (iopmp_get_field(s->regs.mdstall, MDSTALL_EXEMPT)) {
> > +        return !md_selected;
> > +    } else {
> > +        return md_selected;
> > +    }
> > +}
> > +
> > +static inline bool check_sidscp_stall(IopmpState *s, int sid)
> > +{
> > +    return s->sidscp_op[sid] == SIDSCP_OP_STALL;
> > +}
> > +
> > +static void iopmp_error_reaction(IopmpState *s, uint32_t id, hwaddr start,
> > +                                 hwaddr end, uint32_t info)
> > +{
> > +    if (start == s->prev_error_info[id].start_addr &&
> > +        end == s->prev_error_info[id].end_addr &&
> > +        info == s->prev_error_info[id].reqinfo) {
> > +            /* skip following error */
> > +            ;
> > +    } else {
> > +        s->prev_error_info[id].start_addr = start;
> > +        s->prev_error_info[id].end_addr = end;
> > +        s->prev_error_info[id].reqinfo = info;
> > +        if (!iopmp_get_field(s->regs.errreact, ERRREACT_IP)) {
> > +            iopmp_set_field32(&s->regs.errreact, ERRREACT_IP, 1);
> > +            s->regs.err_reqsid = id;
> > +            s->regs.err_reqaddr = start;
> > +            s->regs.err_reqinfo = info;
> > +
> > +            if (iopmp_get_field(info, ERR_REQINFO_TYPE) == ERR_REQINFO_TYPE_READ
> > +               && iopmp_get_field(s->regs.errreact, ERRREACT_IE) &&
> > +               iopmp_get_field(s->regs.errreact, ERRREACT_IRE)) {
> > +                qemu_set_irq(s->irq, 1);
> > +            }
> > +            if (iopmp_get_field(info, ERR_REQINFO_TYPE) ==
> > +                ERR_REQINFO_TYPE_WRITE &&
> > +                iopmp_get_field(s->regs.errreact, ERRREACT_IE) &&
> > +                iopmp_get_field(s->regs.errreact, ERRREACT_IWE)) {
> > +                qemu_set_irq(s->irq, 1);
> > +            }
> > +        }
> > +    }
> > +}
> > +
> > +static IOMMUTLBEntry iopmp_translate(IOMMUMemoryRegion *iommu, hwaddr addr,
> > +                                     IOMMUAccessFlags flags, int iommu_idx)
> > +{
> > +    bool is_stalled = false;
> > +    int sid = iommu_idx;
> > +    IopmpState *s = IOPMP(container_of(iommu, IopmpState, iommu));
> > +    hwaddr start_addr, end_addr;
> > +    if (s->transaction_state[sid].supported) {
> > +        /* get transaction_state if device supported */
> > +        start_addr = s->transaction_state[sid].start_addr;
> > +        end_addr = s->transaction_state[sid].end_addr;
> > +        if (addr > end_addr || addr < start_addr ||
> > +            !s->transaction_state[sid].running) {
> > +            error_report("transaction_state error.");
> > +            exit(1);
> > +        }
> > +    } else {
> > +        start_addr = addr;
> > +        end_addr = addr;
> > +    }
> > +    IOMMUTLBEntry entry = {
> > +        .target_as = &s->downstream_as,
> > +        .iova = addr,
> > +        .translated_addr = addr,
> > +        .addr_mask = (~(hwaddr)0),
> > +        .perm = IOMMU_NONE,
> > +    };
> > +    int entry_idx = -1;
> > +    int md_idx = -1;
> > +    int result = match_entry(s, sid, start_addr, end_addr, &md_idx, &entry_idx);
> > +    int srcmd_rw;
> > +    if (result == ENTRY_HIT) {
> > +        is_stalled = check_md_stall(s, md_idx) || check_sidscp_stall(s, sid);
> > +        if (is_stalled) {
> > +            s->md_stall_stat |= (1 << md_idx);
> > +            entry.target_as = &s->stall_io_as;
> > +            entry.perm = IOMMU_RW;
> > +            return entry;
> > +        } else {
> > +            s->md_stall_stat &= ~(1 << md_idx);
> > +        }
> > +        entry.perm = s->regs.entry[entry_idx].cfg_reg & 0x7;
> > +        if (s->sps_en) {
> > +            /* SPS extension does not affect x permission */
> > +            srcmd_rw = 0x4 | ((s->regs.srcmd_r[sid] >>
> > +                              (md_idx + SRCMD_R_MD)) & 0x1);
> > +            srcmd_rw |= ((s->regs.srcmd_w[sid] >>
> > +                         (md_idx + SRCMD_W_MD)) & 0x1) << 1;
> > +            entry.perm &= srcmd_rw;
> > +        }
> > +        if ((entry.perm & flags) == 0) {
> > +            /* permission denied */
> > +            iopmp_error_reaction(s, sid, start_addr, end_addr,
> > +                                 (entry_idx << ERR_REQINFO_EID) |
> > +                                 ((flags - 1) << ERR_REQINFO_TYPE));
> > +            entry.target_as = &s->blocked_io_as;
> > +            entry.perm = IOMMU_RW;
> > +        } else {
> > +            entry.addr_mask = s->entry_addr[entry_idx].ea -
> > +                              s->entry_addr[entry_idx].sa;
> > +            /* clear error info */
> > +            s->prev_error_info[sid].reqinfo = 0;
> > +            if (s->sid_transl_en) {
> > +                /* pass to next iopmp */
> > +                if (s->next_iommu) {
> > +                    int new_sid = s->sid_transl;
> > +                    IopmpState *next_s = IOPMP(container_of(s->next_iommu,
> > +                                                            IopmpState, iommu));
> > +                    next_s->transaction_state[new_sid].supported = true;
> > +                    while (next_s->transaction_state[new_sid].running) {
> > +                        ;
> > +                    }
> > +                    qemu_mutex_lock(&next_s->iopmp_transaction_mutex);
> > +                    next_s->transaction_state[new_sid].running = 1;
> > +                    qemu_mutex_unlock(&next_s->iopmp_transaction_mutex);
> > +                    next_s->transaction_state[new_sid].start_addr = start_addr;
> > +                    next_s->transaction_state[new_sid].end_addr = end_addr;
> > +                    entry = iopmp_translate(s->next_iommu, addr, flags,
> > +                                           s->sid_transl);
> > +                    qemu_mutex_lock(&next_s->iopmp_transaction_mutex);
> > +                    next_s->transaction_state[new_sid].running = 0;
> > +                    qemu_mutex_unlock(&next_s->iopmp_transaction_mutex);
> > +                    return entry;
> > +                } else {
> > +                    error_report("Next iopmp is not found.");
> > +                    exit(1);
> > +                }
> > +            }
> > +        }
> > +    } else {
> > +        if (result == ENTRY_PAR_HIT) {
> > +            iopmp_error_reaction(s, sid, start_addr, end_addr,
> > +                                 (1 << ERR_REQINFO_PAR_HIT) |
> > +                                 ((flags - 1) << ERR_REQINFO_TYPE));
> > +        } else {
> > +            iopmp_error_reaction(s, sid, start_addr, end_addr,
> > +                                 (1 << ERR_REQINFO_NO_HIT) |
> > +                                 ((flags - 1) << ERR_REQINFO_TYPE));
> > +        }
> > +        entry.target_as = &s->blocked_io_as;
> > +        entry.perm = IOMMU_RW;
> > +    }
> > +    return entry;
> > +}
> > +
> > +static const MemoryRegionOps iopmp_ops = {
> > +    .read = iopmp_read,
> > +    .write = iopmp_write,
> > +    .endianness = DEVICE_NATIVE_ENDIAN,
> > +    .valid = {.min_access_size = 4, .max_access_size = 4}
> > +};
> > +
> > +static MemTxResult iopmp_block_write(void *opaque, hwaddr addr, uint64_t value,
> > +                                     unsigned size, MemTxAttrs attrs)
> > +{
> > +    IopmpState *s = IOPMP(opaque);
> > +
> > +    switch (iopmp_get_field(s->regs.errreact, ERRREACT_RWE)) {
> > +    case RWE_BUS_ERROR:
> > +        return MEMTX_ERROR;
> > +        break;
> > +    case RWE_DECODE_ERROR:
> > +        return MEMTX_DECODE_ERROR;
> > +        break;
> > +    case RWE_SUCCESS:
> > +        return MEMTX_OK;
> > +        break;
> > +    default:
> > +        break;
> > +    }
> > +    return MEMTX_OK;
> > +}
> > +
> > +static MemTxResult iopmp_block_read(void *opaque, hwaddr addr, uint64_t *pdata,
> > +                                    unsigned size, MemTxAttrs attrs)
> > +{
> > +    IopmpState *s = IOPMP(opaque);
> > +
> > +    switch (iopmp_get_field(s->regs.errreact, ERRREACT_RRE)) {
> > +    case RRE_BUS_ERROR:
> > +        return MEMTX_ERROR;
> > +        break;
> > +    case RRE_DECODE_ERROR:
> > +        return MEMTX_DECODE_ERROR;
> > +        break;
> > +    case RRE_SUCCESS_ZEROS:
> > +        *pdata = 0;
> > +        return MEMTX_OK;
> > +        break;
> > +    case RRE_SUCCESS_ONES:
> > +        *pdata = UINT64_MAX;
> > +        return MEMTX_OK;
> > +        break;
> > +    default:
> > +        break;
> > +    }
> > +    return MEMTX_OK;
> > +}
> > +
> > +static const MemoryRegionOps iopmp_block_io_ops = {
> > +    .read_with_attrs = iopmp_block_read,
> > +    .write_with_attrs = iopmp_block_write,
> > +    .endianness = DEVICE_NATIVE_ENDIAN,
> > +    .valid = {.min_access_size = 1, .max_access_size = 8},
> > +};
> > +
> > +static MemTxResult iopmp_handle_stall(IopmpState *s, hwaddr addr,
> > +                                      MemTxAttrs attrs)
> > +{
> > +    return MEMTX_IOPMP_STALL;
> > +}
> > +
> > +static MemTxResult iopmp_stall_write(void *opaque, hwaddr addr, uint64_t value,
> > +                                     unsigned size, MemTxAttrs attrs)
> > +{
> > +    IopmpState *s = IOPMP(opaque);
> > +
> > +    return iopmp_handle_stall(s, addr, attrs);
> > +}
> > +
> > +static MemTxResult iopmp_stall_read(void *opaque, hwaddr addr, uint64_t *pdata,
> > +                                    unsigned size, MemTxAttrs attrs)
> > +{
> > +    IopmpState *s = IOPMP(opaque);
> > +
> > +    *pdata = 0;
> > +    return iopmp_handle_stall(s, addr, attrs);
> > +}
> > +
> > +static const MemoryRegionOps iopmp_stall_io_ops = {
> > +    .read_with_attrs = iopmp_stall_read,
> > +    .write_with_attrs = iopmp_stall_write,
> > +    .endianness = DEVICE_NATIVE_ENDIAN,
> > +    .valid = {.min_access_size = 1, .max_access_size = 8},
> > +};
> > +
> > +static void iopmp_realize(DeviceState *dev, Error **errp)
> > +{
> > +    Object *obj = OBJECT(dev);
> > +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> > +    IopmpState *s = IOPMP(dev);
> > +    s->downstream = get_system_memory();
> > +    uint64_t size = memory_region_size(s->downstream);
> > +
> > +    qemu_mutex_init(&s->iopmp_transaction_mutex);
> > +    s->prient_prog = 1;
> > +    s->sid_num = MIN(s->sid_num, IOPMP_MAX_SID_NUM);
> > +    s->md_num = MIN(s->md_num, IOPMP_MAX_MD_NUM);
> > +    s->entry_num = MIN(s->entry_num, IOPMP_MAX_ENTRY_NUM);
> > +    if (s->sid_transl_en) {
> > +        s->sid_transl_prog = 1;
> > +    }
> > +    if (!s->model_str || strcmp(s->model_str, "rapidk") == 0) {
> > +        /* apply default model */
> > +        s->model = IOPMP_MODEL_RAPIDK;
> > +        iopmp_set_field32(&s->regs.mdcfglck, MDCFGLCK_F, s->md_num);
> > +        iopmp_set_field32(&s->regs.mdcfglck, MDCFGLCK_L, 1);
> > +        s->regs.mdcfg[0] = s->k;
> > +    } else {
> > +        error_report("IOPMP model %s is not supported. "
> > +                     "Vailid values is rapidk.", s->model_str);
> > +        exit(1);
> > +    }
> > +    memory_region_init_iommu(&s->iommu, sizeof(s->iommu),
> > +                             TYPE_IOPMP_IOMMU_MEMORY_REGION,
> > +                             obj, "iopmp-iommu", UINT64_MAX);
> > +    address_space_init(&s->iopmp_as, MEMORY_REGION(&s->iommu), "iommu");
> > +    memory_region_init_io(&s->mmio, obj, &iopmp_ops,
> > +                          s, "iopmp-regs", 0x100000);
> > +    sysbus_init_mmio(sbd, &s->mmio);
> > +    memory_region_init_io(&s->blocked_io, obj, &iopmp_block_io_ops,
> > +                          s, "iopmp-blocked-io", size);
> > +    address_space_init(&s->downstream_as, s->downstream,
> > +                       "iopmp-downstream-as");
> > +    address_space_init(&s->blocked_io_as, &s->blocked_io,
> > +                       "iopmp-blocked-io-as");
> > +
> > +    memory_region_init_io(&s->stall_io, obj, &iopmp_stall_io_ops,
> > +                          s, "iopmp-stall-io", size);
> > +    address_space_init(&s->stall_io_as, &s->stall_io,
> > +                       "iopmp-stall-io-as");
> > +
> > +    object_initialize_child(OBJECT(s), "iopmp_transaction_info",
> > +                            &s->transaction_info_sink,
> > +                            TYPE_IOPMP_TRASACTION_INFO_SINK);
> > +}
> > +
> > +static void iopmp_reset(DeviceState *dev)
> > +{
> > +    IopmpState *s = IOPMP(dev);
> > +    qemu_set_irq(s->irq, 0);
> > +    memset(&s->regs, 0, sizeof(iopmp_regs));
> > +    memset(&s->entry_addr, 0, IOPMP_MAX_ENTRY_NUM * sizeof(iopmp_addr_t));
> > +    if (s->model == IOPMP_MODEL_RAPIDK) {
> > +        iopmp_set_field32(&s->regs.mdcfglck, MDCFGLCK_F, s->md_num);
> > +        iopmp_set_field32(&s->regs.mdcfglck, MDCFGLCK_L, 1);
> > +        s->regs.mdcfg[0] = s->k;
> > +    }
> > +    s->regs.errreact = 0;
> > +
> > +    s->prient_prog = 1;
> > +    if (s->sid_transl_en) {
> > +        s->sid_transl_prog = 1;
> > +    }
> > +}
> > +
> > +static int iopmp_attrs_to_index(IOMMUMemoryRegion *iommu, MemTxAttrs attrs)
> > +{
> > +    unsigned int sid = attrs.requester_id;
> > +    return sid;
> > +}
> > +
> > +static void iopmp_iommu_memory_region_class_init(ObjectClass *klass, void *data)
> > +{
> > +    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
> > +
> > +    imrc->translate = iopmp_translate;
> > +    imrc->attrs_to_index = iopmp_attrs_to_index;
> > +}
> > +
> > +static Property iopmp_property[] = {
> > +    DEFINE_PROP_STRING("model", IopmpState, model_str),
> > +    DEFINE_PROP_BOOL("sps_en", IopmpState, sps_en, false),
> > +    DEFINE_PROP_BOOL("sid_transl_en", IopmpState, sid_transl_en, false),
> > +    DEFINE_PROP_UINT32("k", IopmpState, k, IOPMP_MODEL_K),
> > +    DEFINE_PROP_UINT32("prio_entry", IopmpState, prio_entry, PRIO_ENTRY),
> > +    DEFINE_PROP_UINT32("sid_num", IopmpState, sid_num, IOPMP_MAX_SID_NUM),
> > +    DEFINE_PROP_UINT32("md_num", IopmpState, md_num, IOPMP_MAX_MD_NUM),
> > +    DEFINE_PROP_UINT32("entry_num", IopmpState, entry_num, IOPMP_MAX_ENTRY_NUM),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void iopmp_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +    device_class_set_props(dc, iopmp_property);
> > +    dc->realize = iopmp_realize;
> > +    dc->reset = iopmp_reset;
> > +}
> > +
> > +static void iopmp_init(Object *obj)
> > +{
> > +    IopmpState *s = IOPMP(obj);
> > +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> > +    sysbus_init_irq(sbd, &s->irq);
> > +}
> > +
> > +static const TypeInfo iopmp_info = {
> > +    .name = TYPE_IOPMP,
> > +    .parent = TYPE_SYS_BUS_DEVICE,
> > +    .instance_size = sizeof(IopmpState),
> > +    .instance_init = iopmp_init,
> > +    .class_init = iopmp_class_init,
> > +};
> > +
> > +static const TypeInfo
> > +iopmp_iommu_memory_region_info = {
> > +    .name = TYPE_IOPMP_IOMMU_MEMORY_REGION,
> > +    .parent = TYPE_IOMMU_MEMORY_REGION,
> > +    .class_init = iopmp_iommu_memory_region_class_init,
> > +};
> > +
> > +DeviceState *iopmp_create(hwaddr addr, qemu_irq irq)
> > +{
> > +    LOG("%s:\n", __func__);
> > +    DeviceState *iopmp_device = sysbus_create_varargs(TYPE_IOPMP, addr, irq,
> > +                                                      NULL);
> > +    return iopmp_device;
> > +}
> > +
> > +void
> > +cascade_iopmp(DeviceState *cur_dev, DeviceState *next_dev)
> > +{
> > +    IopmpState *s = IOPMP(cur_dev);
> > +    s->sid_transl_en = true;
> > +    IopmpState *next_s = IOPMP(next_dev);
> > +    s->next_iommu = &next_s->iommu;
> > +}
> > +
> > +static size_t
> > +transaction_info_push(StreamSink *transaction_info_sink, unsigned char *buf,
> > +                    size_t len, bool eop)
> > +{
> > +    Iopmp_StreamSink *ss = IOPMP_TRASACTION_INFO_SINK(transaction_info_sink);
> > +    IopmpState *s = IOPMP(container_of(ss, IopmpState,
> > +                                       transaction_info_sink));
> > +    iopmp_transaction_info signal;
> > +    memcpy(&signal, buf, len);
> > +    uint32_t sid = signal.sid;
> > +    if (s->transaction_state[sid].running) {
> > +        if (eop) {
> > +            qemu_mutex_lock(&s->iopmp_transaction_mutex);
> > +            s->transaction_state[sid].running = 0;
> > +            qemu_mutex_unlock(&s->iopmp_transaction_mutex);
> > +            return 1;
> > +        } else {
> > +            return 0;
> > +        }
> > +    } else if (len == sizeof(iopmp_transaction_info)) {
> > +        s->transaction_state[sid].supported = 1;
> > +        qemu_mutex_lock(&s->iopmp_transaction_mutex);
> > +        s->transaction_state[sid].running = 1;
> > +        qemu_mutex_unlock(&s->iopmp_transaction_mutex);
> > +        s->transaction_state[sid].start_addr = signal.start_addr;
> > +        s->transaction_state[sid].end_addr = signal.end_addr;
> > +        return 1;
> > +    }
> > +    return 0;
> > +}
> > +
> > +static void iopmp_transaction_info_sink_class_init(ObjectClass *klass,
> > +                                                   void *data)
> > +{
> > +    StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
> > +    ssc->push = transaction_info_push;
> > +}
> > +
> > +static const TypeInfo transaction_info_sink = {
> > +    .name = TYPE_IOPMP_TRASACTION_INFO_SINK,
> > +    .parent = TYPE_OBJECT,
> > +    .instance_size = sizeof(Iopmp_StreamSink),
> > +    .class_init = iopmp_transaction_info_sink_class_init,
> > +    .interfaces = (InterfaceInfo[]) {
> > +        { TYPE_STREAM_SINK },
> > +        { }
> > +    },
> > +};
> > +
> > +static void
> > +iopmp_register_types(void)
> > +{
> > +    type_register_static(&iopmp_info);
> > +    type_register_static(&iopmp_iommu_memory_region_info);
> > +    type_register_static(&transaction_info_sink);
> > +}
> > +
> > +type_init(iopmp_register_types);
> > diff --git a/include/hw/misc/riscv_iopmp.h b/include/hw/misc/riscv_iopmp.h
> > new file mode 100644
> > index 0000000000..e679ffe5da
> > --- /dev/null
> > +++ b/include/hw/misc/riscv_iopmp.h
> > @@ -0,0 +1,341 @@
> > +/*
> > + * QEMU RISC-V IOPMP (Input Output Physical Memory Protection)
> > + *
> > + * Copyright (c) 2023 Andes Tech. Corp.
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#ifndef RISCV_IOPMP_H
> > +#define RISCV_IOPMP_H
> > +
> > +#include "hw/sysbus.h"
> > +#include "qemu/typedefs.h"
> > +#include "memory.h"
> > +#include "hw/stream.h"
> > +#include "hw/misc/riscv_iopmp_transaction_info.h"
> > +
> > +#define TYPE_IOPMP "iopmp"
> > +#define IOPMP(obj) OBJECT_CHECK(IopmpState, (obj), TYPE_IOPMP)
> > +
> > +#define iopmp_get_field(reg, name) (((reg) & (name ## _FIELD)) >> (name))
> > +#define iopmp_set_field32(reg, name, newval) do { \
> > +    uint32_t val = *reg; \
> > +    val &= ~name##_FIELD; \
> > +    val |= ((newval) << name) & name##_FIELD; \
> > +    *reg = val; \
> > +    } while (0)
> > +#define iopmp_set_field64(reg, name, newval) do { \
> > +    uint64_t val = *reg; \
> > +    val &= ~name##_FIELD; \
> > +    val |= ((newval) << name) & name##_FIELD; \
> > +    *reg = val; \
> > +    } while (0)
> > +
> > +
> > +#define IOPMP_MAX_MD_NUM    63
> > +#define IOPMP_MAX_SID_NUM   256
> > +#define IOPMP_MAX_ENTRY_NUM 512
> > +
> > +#define IOPMP_VERSION      0x0
> > +#define IOPMP_IMP          0x4
> > +#define IOPMP_HWCFG0       0x8
> > +#define IOPMP_HWCFG1       0xC
> > +#define IOPMP_HWCFG2       0x10
> > +#define IOPMP_ENTRYOFFSET  0x20
> > +#define IOPMP_ERRREACT     0x28
> > +#define IOPMP_MDSTALL      0x30
> > +#define IOPMP_MDSTALLH     0x34
> > +#define IOPMP_SIDSCP       0x38
> > +#define IOPMP_MDLCK        0x40
> > +#define IOPMP_MDLCKH       0x44
> > +#define IOPMP_MDCFGLCK     0x48
> > +#define IOPMP_ENTRYLCK     0x4C
> > +
> > +#define IOPMP_ERR_REQADDR  0x60
> > +#define IOPMP_ERR_REQADDRH 0x64
> > +#define IOPMP_ERR_REQSID   0x68
> > +#define IOPMP_ERR_REQINFO  0x6C
> > +
> > +#define IOPMP_MDCFG0       0x800
> > +#define IOPMP_SRCMD_EN0    0x1000
> > +#define IOPMP_SRCMD_ENH0   0x1004
> > +#define IOPMP_SRCMD_R0     0x1008
> > +#define IOPMP_SRCMD_RH0    0x100C
> > +#define IOPMP_SRCMD_W0     0x1010
> > +#define IOPMP_SRCMD_WH0    0x1014
> > +
> > +#define IOPMP_ENTRY_ADDR0  0x4000
> > +#define IOPMP_ENTRY_ADDRH0 0x4004
> > +#define IOPMP_ENTRY_CFG0   0x4008
> > +#define IOPMP_USER_CFG0    0x400C
> > +
> > +#define VERSION_VENDOR       0
> > +#define VERSION_SPECVER      24
> > +#define VENDER_ANDES         6533
> > +#define SPECVER_1_0_0_DRAFT4 4
> > +
> > +#define IMPID_1_0_0_DRAFT4_0 10040
> > +
> > +#define HWCFG0_SID_NUM     0
> > +#define HWCFG0_ENTRY_NUM   16
> > +
> > +#define HWCFG1_MODEL            0
> > +#define HWCFG1_TOR_EN           4
> > +#define HWCFG1_SPS_EN           5
> > +#define HWCFG1_USER_CFG_EN      6
> > +#define HWCFG1_PRIENT_PROG      7
> > +#define HWCFG1_SID_TRANSL_EN    8
> > +#define HWCFG1_SID_TRANSL_PROG  9
> > +#define HWCFG1_MD_NUM           24
> > +#define HWCFG1_ENABLE           31
> > +
> > +#define HWCFG1_SPS_EN_FIELD          (1 << HWCFG1_SPS_EN)
> > +#define HWCFG1_PRIENT_PROG_FIELD     (1 << HWCFG1_PRIENT_PROG)
> > +#define HWCFG1_SID_TRANSL_PROG_FIELD (1 << HWCFG1_SID_TRANSL_PROG)
> > +#define HWCFG1_ENABLE_FIELD          (1 << HWCFG1_ENABLE)
> > +
> > +#define HWCFG2_PRIO_ENTRY       0
> > +#define HWCFG2_SID_TRANSL      16
> > +
> > +#define HWCFG2_PRIO_ENTRY_FIELD (0xFFFF << HWCFG2_PRIO_ENTRY)
> > +#define HWCFG2_SID_TRANSL_FIELD (0xFFFF << HWCFG2_SID_TRANSL)
> > +
> > +#define ERRREACT_L          0
> > +#define ERRREACT_IE         1
> > +#define ERRREACT_IP         2
> > +#define ERRREACT_IRE        4
> > +#define ERRREACT_RRE        5
> > +#define ERRREACT_IWE        8
> > +#define ERRREACT_RWE        9
> > +#define ERRREACT_PEE        28
> > +#define ERRREACT_RPE        29
> > +
> > +#define ERRREACT_L_FIELD    (0x1 << ERRREACT_L)
> > +#define ERRREACT_IE_FIELD   (0x1 << ERRREACT_IE)
> > +#define ERRREACT_IP_FIELD   (0x1 << ERRREACT_IP)
> > +#define ERRREACT_IRE_FIELD  (0x1 << ERRREACT_IRE)
> > +#define ERRREACT_RRE_FIELD  (0x7 << ERRREACT_RRE)
> > +#define ERRREACT_IWE_FIELD  (0x1 << ERRREACT_IWE)
> > +#define ERRREACT_RWE_FIELD  (0x7 << ERRREACT_RWE)
> > +#define ERRREACT_PEE_FIELD  (0x1 << ERRREACT_PEE)
> > +#define ERRREACT_RPE_FIELD  (0x7 << ERRREACT_RPE)
> > +
> > +#define RRE_BUS_ERROR       0
> > +#define RRE_DECODE_ERROR    1
> > +#define RRE_SUCCESS_ZEROS   2
> > +#define RRE_SUCCESS_ONES    3
> > +
> > +#define RWE_BUS_ERROR       0
> > +#define RWE_DECODE_ERROR    1
> > +#define RWE_SUCCESS         2
> > +
> > +#define MDSTALL               0
> > +#define MDSTALLH              32
> > +#define MDSTALL_FIELD         UINT32_MAX
> > +#define MDSTALLH_FIELD        (UINT64_MAX << MDSTALLH)
> > +#define MDSTALL_EXEMPT        0
> > +#define MDSTALL_EXEMPT_FIELD  (1 << MDSTALL_EXEMPT)
> > +#define MDSTALL_ISSTALLED     0
> > +#define MDSTALL_MD            1
> > +#define MDSTALL_MD_FIELD      (0x7FFFFFFFFFFFFFFF << MDSTALL_MD)
> > +
> > +#define SIDSCP_SID         0
> > +#define SIDSCP_STAT        30
> > +#define SIDSCP_OP          30
> > +#define SIDSCP_SID_FIELD   (0xFFFF << SIDSCP_SID)
> > +#define SIDSCP_STAT_FIELD  (0x3 << SIDSCP_STAT)
> > +#define SIDSCP_OP_FIELD    (0x3 << SIDSCP_OP)
> > +#define SIDSCP_OP_QUERY    0
> > +#define SIDSCP_OP_STALL    1
> > +#define SIDSCP_OP_NOTSTALL 2
> > +
> > +#define MDLCK_L            0
> > +#define MDLCK_MD           1
> > +
> > +#define MDCFGLCK_L         0
> > +#define MDCFGLCK_L_FIELD   (0x1 << MDCFGLCK_L)
> > +#define MDCFGLCK_F         1
> > +#define MDCFGLCK_F_FIELD   (0x7F << MDCFGLCK_F)
> > +
> > +#define ENTRYLCK_L         0
> > +#define ENTRYLCK_L_FIELD   (0x1 << MDCFGLCK_L)
> > +#define ENTRYLCK_F         1
> > +#define ENTRYLCK_F_FIELD   (0xFFFF << ENTRYLCK_F)
> > +
> > +#define ERR_REQINFO_NO_HIT  0
> > +#define ERR_REQINFO_PAR_HIT 1
> > +#define ERR_REQINFO_TYPE    8
> > +#define ERR_REQINFO_EID     16
> > +
> > +#define ERR_REQINFO_NO_HIT_FIELD  (0x1 << ERR_REQINFO_NO_HIT)
> > +#define ERR_REQINFO_PAR_HIT_FIELD (0x1 << ERR_REQINFO_PAR_HIT)
> > +#define ERR_REQINFO_TYPE_FIELD    (0x3 << ERR_REQINFO_TYPE)
> > +#define ERR_REQINFO_EID_FIELD     (0xFFFF << ERR_REQINFO_EID)
> > +
> > +#define ERR_REQINFO_TYPE_READ  0
> > +#define ERR_REQINFO_TYPE_WRITE 1
> > +#define ERR_REQINFO_TYPE_USER  3
> > +
> > +#define SRCMD_EN_L         0
> > +#define SRCMD_EN_MD        1
> > +#define SRCMD_EN_L_FIELD   (0x1 << SRCMD_EN_L)
> > +#define SRCMD_EN_MD_FIELD  (0x7FFFFFFF << SRCMD_EN_MD)
> > +#define SRCMD_ENH_MDH        32
> > +#define SRCMD_ENH_MDH_FIELD (0xFFFFFFFFUL << SRCMD_ENH_MDH)
> > +
> > +#define SRCMD_R_MD        1
> > +#define SRCMD_R_MD_FIELD  (0x7FFFFFFF << SRCMD_R_MD)
> > +#define SRCMD_RH_MDH        32
> > +#define SRCMD_RH_MDH_FIELD (0xFFFFFFFFUL << SRCMD_RH_MDH)
> > +#define SRCMD_W_MD        1
> > +#define SRCMD_W_MD_FIELD  (0x7FFFFFFF << SRCMD_W_MD)
> > +#define SRCMD_WH_MDH        32
> > +#define SRCMD_WH_MDH_FIELD (0xFFFFFFFFUL << SRCMD_WH_MDH)
> > +
> > +#define ENTRY_ADDR_ADDR         0
> > +#define ENTRY_ADDR_ADDR_FIELD   0xFFFFFFFF
> > +#define ENTRY_ADDRH_ADDRH       32
> > +#define ENTRY_ADDRH_ADDRH_FIELD (0xFFFFFFFFUL << ENTRY_ADDRH_ADDRH)
> > +
> > +#define ENTRY_CFG_R            0
> > +#define ENTRY_CFG_W            1
> > +#define ENTRY_CFG_X            2
> > +#define ENTRY_CFG_A            3
> > +#define ENTRY_CFG_A_FIELD      (0x3 << ENTRY_CFG_A)
> > +
> > +#define IOPMP_MODEL_FULL       0
> > +#define IOPMP_MODEL_RAPIDK     0x1
> > +#define IOPMP_MODEL_DYNAMICK   0x2
> > +#define IOPMP_MODEL_ISOLATION  0x3
> > +#define IOPMP_MODEL_COMPACTK   0x4
> > +#define IOPMP_MODEL_K          8
> > +
> > +#define TOR_EN 1
> > +#define SPS_EN 0
> > +#define USER_CFG_EN   0
> > +#define PROG_PRIENT   1
> > +#define PRIO_ENTRY    IOPMP_MAX_ENTRY_NUM
> > +#define SID_TRANSL_EN 0
> > +#define SID_TRANSL    0
> > +
> > +#define ENTRY_NO_HIT      0
> > +#define ENTRY_PAR_HIT     1
> > +#define ENTRY_HIT         2
> > +
> > +#define AXI_BURST_TYPE_FIX 0
> > +#define AXI_BURST_TYPE_INC 1
> > +
> > +typedef enum {
> > +    IOPMP_READ      = 1 << 0,
> > +    IOPMP_WRITE     = 1 << 1,
> > +    IOPMP_EXEC      = 1 << 2,
> > +    IOPMP_ADDRMODE  = 1 << 3,
> > +} iopmp_priv_t;
> > +
> > +typedef enum {
> > +    IOPMP_AMATCH_OFF,  /* Null (off)                            */
> > +    IOPMP_AMATCH_TOR,  /* Top of Range                          */
> > +    IOPMP_AMATCH_NA4,  /* Naturally aligned four-byte region    */
> > +    IOPMP_AMATCH_NAPOT /* Naturally aligned power-of-two region */
> > +} iopmp_am_t;
> > +
> > +typedef struct {
> > +    uint64_t addr_reg;
> > +    uint32_t  cfg_reg;
> > +} iopmp_entry_t;
> > +
> > +typedef struct {
> > +    target_ulong sa;
> > +    target_ulong ea;
> > +} iopmp_addr_t;
> > +
> > +typedef struct {
> > +    uint64_t srcmd_en[IOPMP_MAX_SID_NUM];
> > +    uint64_t srcmd_r[IOPMP_MAX_SID_NUM];
> > +    uint64_t srcmd_w[IOPMP_MAX_SID_NUM];
> > +    uint32_t mdcfg[IOPMP_MAX_MD_NUM];
> > +    iopmp_entry_t entry[IOPMP_MAX_ENTRY_NUM];
> > +    uint64_t mdmsk;
> > +    uint64_t mdlck;
> > +    uint32_t entrylck;
> > +    uint32_t mdcfglck;
> > +    uint32_t arrlck;
> > +    uint64_t mdstall;
> > +    uint32_t sidscp;
> > +    uint32_t errreact;
> > +    uint64_t err_reqaddr;
> > +    uint32_t err_reqsid;
> > +    uint32_t err_reqinfo;
> > +} iopmp_regs;
> > +
> > +/* To verfiy the same transcation */
> > +typedef struct iopmp_transaction_state {
> > +    bool supported;
> > +    bool running;
> > +    hwaddr start_addr;
> > +    hwaddr end_addr;
> > +} iopmp_transaction_state;
> > +
> > +typedef struct iopmp_error_info {
> > +    uint32_t reqinfo;
> > +    hwaddr start_addr;
> > +    hwaddr end_addr;
> > +} iopmp_error_info;
> > +
> > +typedef struct Iopmp_StreamSink {
> > +    Object parent;
> > +} Iopmp_StreamSink;
> > +
> > +typedef struct IopmpState {
> > +    SysBusDevice parent_obj;
> > +    iopmp_addr_t entry_addr[IOPMP_MAX_ENTRY_NUM];
> > +    iopmp_transaction_state transaction_state[IOPMP_MAX_SID_NUM];
> > +    QemuMutex iopmp_transaction_mutex;
> > +    iopmp_error_info prev_error_info[IOPMP_MAX_SID_NUM];
> > +    MemoryRegion mmio;
> > +    IOMMUMemoryRegion iommu;
> > +    IOMMUMemoryRegion *next_iommu;
> > +    iopmp_regs regs;
> > +    MemoryRegion *downstream;
> > +    MemoryRegion blocked_io;
> > +    MemoryRegion stall_io;
> > +    char *model_str;
> > +    uint32_t model;
> > +    uint32_t k;
> > +    bool sps_en;
> > +    bool sid_transl_prog;
> > +    bool prient_prog;
> > +    bool sid_transl_en;
> > +    uint32_t sid_transl;
> > +    Iopmp_StreamSink transaction_info_sink;
> > +
> > +    AddressSpace iopmp_as;
> > +    AddressSpace downstream_as;
> > +    AddressSpace blocked_io_as;
> > +    AddressSpace stall_io_as;
> > +    qemu_irq irq;
> > +    bool enable;
> > +    uint32_t sidscp_op[IOPMP_MAX_SID_NUM];
> > +    uint64_t md_stall_stat;
> > +    uint32_t prio_entry;
> > +
> > +    uint32_t sid_num;
> > +    uint32_t md_num;
> > +    uint32_t entry_num;
> > +} IopmpState;
> > +
> > +DeviceState *iopmp_create(hwaddr addr, qemu_irq irq);
> > +void cascade_iopmp(DeviceState *cur_dev, DeviceState *next_dev);
> > +
> > +#endif
> > diff --git a/include/hw/misc/riscv_iopmp_transaction_info.h b/include/hw/misc/riscv_iopmp_transaction_info.h
> > new file mode 100644
> > index 0000000000..fd12fd214c
> > --- /dev/null
> > +++ b/include/hw/misc/riscv_iopmp_transaction_info.h
> > @@ -0,0 +1,28 @@
> > +/*
> > + * QEMU RISC-V IOPMP (Input Output Physical Memory Protection)
> > + *
> > + * Copyright (c) 2023 Andes Tech. Corp.
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#ifndef RISCV_IOPMP_TRANSACTION_INFO_H
> > +#define RISCV_IOPMP_TRANSACTION_INFO_H
> > +
> > +typedef struct {
> > +    uint32_t sid:16;
> > +    uint64_t start_addr;
> > +    uint64_t end_addr;
> > +} iopmp_transaction_info;
> > +
> > +#endif
> > --
> > 2.34.1
> >
> >

