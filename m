Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92345C4332F
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 03:27:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qykqR-0007id-L2; Thu, 02 Nov 2023 23:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ethan84@andestech.com>)
 id 1qykqP-0007i8-Qj; Thu, 02 Nov 2023 23:27:37 -0400
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70]
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ethan84@andestech.com>)
 id 1qykqL-0007dj-If; Thu, 02 Nov 2023 23:27:37 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 3A33R9X3038433;
 Fri, 3 Nov 2023 11:27:09 +0800 (+08)
 (envelope-from ethan84@andestech.com)
Received: from ethan84-VirtualBox (10.0.12.51) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Fri, 3 Nov 2023
 11:27:10 +0800
Date: Fri, 3 Nov 2023 11:27:05 +0800
To: Peter Xu <peterx@redhat.com>
CC: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <pbonzini@redhat.com>,
 <palmer@dabbelt.com>, <alistair.francis@wdc.com>,
 <in.meng@windriver.com>, <liweiwei@iscas.ac.cn>,
 <dbarboza@ventanamicro.com>, <hiwei_liu@linux.alibaba.com>,
 <qemu-riscv@nongnu.org>, <david@redhat.com>
Subject: Re: [PATCH v2 1/4] exec/memattrs: Add iopmp source id, start
 address, end address to MemTxAttrs
Message-ID: <ZURoiSFQJ+eCi6Xs@ethan84-VirtualBox>
References: <20231102094015.208588-1-ethan84@andestech.com>
 <20231102094015.208588-2-ethan84@andestech.com>
 <ZUOo3fGmqM/gVyTR@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZUOo3fGmqM/gVyTR@x1n>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.12.51]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3A33R9X3038433
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

On Thu, Nov 02, 2023 at 09:49:17AM -0400, Peter Xu wrote:
> On Thu, Nov 02, 2023 at 05:40:12PM +0800, Ethan Chen wrote:
> > Signed-off-by: Ethan Chen <ethan84@andestech.com>
> > ---
> >  include/exec/memattrs.h | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> > index d04170aa27..fc15e5d7d3 100644
> > --- a/include/exec/memattrs.h
> > +++ b/include/exec/memattrs.h
> > @@ -64,6 +64,12 @@ typedef struct MemTxAttrs {
> >      unsigned int target_tlb_bit0 : 1;
> >      unsigned int target_tlb_bit1 : 1;
> >      unsigned int target_tlb_bit2 : 1;
> > +
> > +    /* IOPMP support up to 65535 sources */
> > +    unsigned int iopmp_sid:16;
> 
> There's MemTxAttrs.requester_id, SID for pci, same length.  Reuse it?

OK, I will reuse it.

> 
> > +    /* Transaction infomation for IOPMP */
> > +    unsigned long long iopmp_start_addr;
> > +    unsigned long long iopmp_end_addr;
> 
> PS: encoding addresses into memattrs is.. strange, but since I know nothing
> about iopmp, I'll leave that for other reviewers.

Current IOMMU translate function only have address need to be translate. 
In IOPMP, It needs the transfer start and end address to check this transfer
is valid or not.

> 
> Currently MemTxAttrs are passed as a whole int on the stack, if it keeps
> growing we may start to consider a pointer, but need to check the side
> effects of unexpected fields modified within a call.

It's good for me to use a pointer.

Thanks,
Ethan Chen

