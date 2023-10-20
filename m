Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BE1CDB474
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 15:57:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtrsE-00029k-0e; Fri, 20 Oct 2023 11:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1qtrsA-00027S-9H; Fri, 20 Oct 2023 11:57:14 -0400
Received: from mgamail.intel.com ([134.134.136.31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1qtrs5-0006z4-LT; Fri, 20 Oct 2023 11:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697817429; x=1729353429;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eut9DQ0KH5sVbMUaQq3B4rhI7/svi7cLTVzz7f15sMY=;
 b=HYIQoQC0CwbJMNVqEPs7tVYUURi49hK+2jr4mxXURdMwYNNYNEJWhbSm
 Ogw2WbKlTNQAahHik+IfcSSHMynn01KCs4Cz6iRialyEA5xo9vYIpAecr
 WLvMDQMItsNVwHfZzZtQuDot5y2uua2Cr5oNqzxjrFxIN44YKJlHpJd7I
 I7HhEnI7FjXGE8qjb+ewsQiigLpd81Li4GTodOb3Y5jGSdxuflcaQzgJu
 /w0hQ+C40hdeC28gxkN81PzLXTMg4ZNDtp0UlBHIleWpLqA6acseO9ju2
 24HVNzIulS0LZQt7uE9awX2MaYwV5Wy09fWLHxxF+T6dlAUaTBkb3qBjN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="450751456"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="450751456"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 08:57:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="848117215"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="848117215"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Oct 2023 08:56:53 -0700
Date: Sat, 21 Oct 2023 00:08:31 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Marek Vasut <marex@denx.de>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Brian Cain <bcain@quicinc.com>, Thomas Huth <thuth@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: Re: [PATCH v2 00/16] target: Make 'cpu-qom.h' really target agnostic
Message-ID: <ZTKl/y4yxkli1pqy@intel.com>
References: <20231013140116.255-1-philmd@linaro.org>
 <ZTIVQfTmkK05fln9@intel.com>
 <94280b39-a331-003d-f227-38c3e1b94434@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94280b39-a331-003d-f227-38c3e1b94434@linaro.org>
Received-SPF: pass client-ip=134.134.136.31; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi Philippe,

On Fri, Oct 20, 2023 at 01:30:50PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Fri, 20 Oct 2023 13:30:50 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: Re: [PATCH v2 00/16] target: Make 'cpu-qom.h' really target
>  agnostic
> 
> Hi Zhao,
> 
> On 20/10/23 07:50, Zhao Liu wrote:
> > Hi Philippe,
> > 
> > On Fri, Oct 13, 2023 at 04:00:59PM +0200, Philippe Mathieu-Daudé wrote:
> > > Date: Fri, 13 Oct 2023 16:00:59 +0200
> > > From: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > Subject: [PATCH v2 00/16] target: Make 'cpu-qom.h' really target agnostic
> > > X-Mailer: git-send-email 2.41.0
> > > 
> > > Since v1:
> > > - Added R-b tags
> > > - Addressed Richard comments
> > > - Postponed OBJECT_DECLARE_CPU_TYPE() changes
> > > 
> > > A heterogeneous machine must be able to instantiate CPUs
> > > from different architectures.
> > 
> > Does this mean the different ISA cores in heterogeneous machine?
> 
> Yes. Currently the ARM target already allows you to do that
> (multiple ISA cores within the same architecture), see the
> xlnx-zcu102 and fby35 machines.

Okay, I'll have a look at it.

> 
> > And is this case for TCG?
> 
> This is *only* for TCG. I expect hardware accel + TCG to be
> theoretically possible, but no interest has been shown for
> it. Anyhow this requires heterogeneous TCG as a first step.

Thanks, got it.

> 
> > > In order to do that, the
> > > common hw/ code has to access to the QOM CPU definitions
> > > from various architecture.
> > 
> > About this kind of heterogeneous machine with multiple CPUs, is there
> > any initial configuration command line example?
> 
> I'm prototyping in plain C but our plan is to start with a
> QMP prototype. Command line configuration is not an option,
> we decided to ignore it. I'll describe that better in a RFC
> document I should post soon.

Looking forward to your RFC!

For accel, I am currently working in this direction (to convert all CPU
topology levels to devices and to create heterogeneous topology via
"-device") as the following:

-device cpu-socket,id=sock0 \
-device cpu-die,id=die0,parent=sock0 \
-device cpu-die,id=die1,parent=sock0 \
-device cpu-cluster,id=cluster0,parent=die0 \
-device cpu-cluster,id=cluster1,parent=die0 \
-device x86-intel-core,id=core0,parent=cluster0,threads=3 \
-device x86-intel-atom,id=core1,parent=cluster1,threads=2 \
-device x86-intel-core,id=core2,parent=cluster0,threads=3

At present, I have a prototype and am sorting out the RFC.

From your description, I understand that we have no conflict.
Also welcome your thoughts and hope that I can go in the same
direction with you. ;-)

Regards,
Zhao


