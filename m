Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3068DC46CD2
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 03:33:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rS7Wd-0006A5-Fl; Mon, 22 Jan 2024 22:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ethan84@andestech.com>)
 id 1rS7Wa-00067T-9x; Mon, 22 Jan 2024 22:32:32 -0500
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70]
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ethan84@andestech.com>)
 id 1rS7WW-00034o-QY; Mon, 22 Jan 2024 22:32:31 -0500
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 40N3VuNE071101;
 Tue, 23 Jan 2024 11:31:56 +0800 (+08)
 (envelope-from ethan84@andestech.com)
Received: from ethan84-VirtualBox (10.0.12.22) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Tue, 23 Jan 2024
 11:31:57 +0800
Date: Tue, 23 Jan 2024 11:31:46 +0800
To: Alistair Francis <alistair23@gmail.com>
CC: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>,
 <edgar.iglesias@gmail.com>, <richard.henderson@linaro.org>,
 <pbonzini@redhat.com>, <palmer@dabbelt.com>,
 <alistair.francis@wdc.com>, <in.meng@windriver.com>,
 <liweiwei@iscas.ac.cn>, <dbarboza@ventanamicro.com>,
 <hiwei_liu@linux.alibaba.com>, <qemu-riscv@nongnu.org>,
 <peterx@redhat.com>, <david@redhat.com>
Subject: Re: [PATCH v4 0/4] Support RISC-V IOPMP
Message-ID: <Za8zFn6Vw1JF1IpX@ethan84-VirtualBox>
References: <20231122053251.440723-1-ethan84@andestech.com>
 <CAKmqyKO9nGLo2b0TamakNh4qRr+Bi8NQ973bQ=ch8=CKoH-etg@mail.gmail.com>
 <ZYPdY38SqIE7/eoz@ethan84-VirtualBox>
 <CAKmqyKN2NAmmWiH1eUy8Hf+V0-5ENTjews5o0VzPDfySt_nqgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKN2NAmmWiH1eUy8Hf+V0-5ENTjews5o0VzPDfySt_nqgw@mail.gmail.com>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.12.22]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 40N3VuNE071101
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

On Mon, Jan 22, 2024 at 04:01:12PM +1000, Alistair Francis wrote:
> On Thu, Dec 21, 2023 at 4:38 PM Ethan Chen <ethan84@andestech.com> wrote:
> >
> > On Mon, Dec 18, 2023 at 02:18:58PM +1000, Alistair Francis wrote:
> > > On Wed, Nov 22, 2023 at 3:36 PM Ethan Chen via <qemu-devel@nongnu.org> wrote:
> > > >
> > > > This series implements IOPMP specification v1.0.0-draft4 rapid-k model.
> > > > The specification url:
> > > > https://github.com/riscv-non-isa/iopmp-spec/blob/main/riscv_iopmp_specification.pdf
> > > >
> > > > When IOPMP is enabled, a DMA device ATCDMAC300 is added to RISC-V virt
> > > > platform. This DMA device is connected to the IOPMP and has the functionalities
> > >
> > > I don't think we want to add an Andes DMA device to the virt machine.
> > >
> > > I can't even find the spec for the ATCDMAC300, which isn't great
> > >
> > > Alistair
> >
> > Since the IOPMP does not take effect when there is no other device connects to
> > IOPMP, I think it is necessary to have a DMA device for IOPMP demonstration.
> 
> That is true, but that device shouldn't be a vendor specific device
> for the virt machine.
> 
> >
> > Do you have any suggestions for supporting IOPMP on RISC-V virt machine?
> 
> A RVI device would be fine. Otherwise something that has become a
> defacto standard by being commonly used (the SiFive PLIC for example).
> 
> I really don't think it should be some vendor IP, especially one that
> doesn't have a public datasheet.
> 
> You could add an Andes machine that can use your vendor IP. Otherwise
> we can look at adding IOPMP and not connecting it, but that is a pain.

In submitted patch v5, I removed vendor IP and made generic PCIe host
bridge on RISC-V virt machine connect to IOPMP. DMA operation from PCI
devices on the bridge will be check by IOPMP.

> 
> What is the IOPMP spec group doing for testing?

IOPMP TG is doing an implementation(RTL) testing.

NVidia will provide SystemC stimulus from different ports to test or 
observe the object under testing. A test bench will be provided in 
the form of TLM-2.0 transaction level modeling.

Thanks,
Ethan Chen

