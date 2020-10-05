Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPVSI-0003pl-ST
	for mharc-qemu-riscv@gnu.org; Mon, 05 Oct 2020 14:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPVSH-0003p3-Ob
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2020 14:43:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPVSF-00072g-20
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2020 14:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601923402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F9lR6ujFIVOdjNVkFUZgEJdLNwqUowq8neB0dnHsSNI=;
 b=RX5qSG0M3bNhz4MmZNOuisTkTt7wHcVy4zkV4FtxZ8qj6dxzOodkHUf+DCtGilwIvQ8HZS
 jq01+F2T2CvCIWlfdesFmN+HD8CXpG8VmOlGxSafs4VqGi/F9UnOfzJGH23zL2Wk7Qtgkg
 68E5VblF668ihhNW5DKZ9a/vbEY2SzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-cDnzevw6Ph2D-eLV3uzOlw-1; Mon, 05 Oct 2020 14:43:19 -0400
X-MC-Unique: cDnzevw6Ph2D-eLV3uzOlw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD673107ACF5;
 Mon,  5 Oct 2020 18:43:16 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15A7255767;
 Mon,  5 Oct 2020 18:43:10 +0000 (UTC)
Date: Mon, 5 Oct 2020 14:43:10 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Paul Burton <paulburton@kernel.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Cleber Rosa <crosa@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 01/16] hw/core/cpu: Let CPU object have a clock source
Message-ID: <20201005184310.GN7303@habkost.net>
References: <20200928171539.788309-1-f4bug@amsat.org>
 <20200928171539.788309-2-f4bug@amsat.org>
 <20200930094313.1120a040@redhat.com>
 <da7248f7-5098-188b-d274-e122c87bb498@amsat.org>
 <20201005184009.493629b0@redhat.com>
 <20201005174454.GM7303@habkost.net>
 <8c337ca9-4f03-e6df-0e67-f8ca2b3248e7@amsat.org>
MIME-Version: 1.0
In-Reply-To: <8c337ca9-4f03-e6df-0e67-f8ca2b3248e7@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 05 Oct 2020 18:43:25 -0000

On Mon, Oct 05, 2020 at 08:09:31PM +0200, Philippe Mathieu-Daudé wrote:
> On 10/5/20 7:44 PM, Eduardo Habkost wrote:
> > On Mon, Oct 05, 2020 at 06:40:09PM +0200, Igor Mammedov wrote:
> >> On Wed, 30 Sep 2020 12:16:53 +0200
> >> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> >>
> >>> +arm/ppc/riscv folks
> >>>
> >>> On 9/30/20 9:43 AM, Igor Mammedov wrote:
> >>>> On Mon, 28 Sep 2020 19:15:24 +0200
> >>>> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> >>>>   
> >>>>> Let CPUState have a clock source (named 'clk') and CPUClass
> > 
> > The language here confuses me: is this a clock source inside the
> > CPU, or just a clock input that can be connected to a clock
> > source somewhere?
> 
> 2nd description, "somewhere". I'll reword.
> 
> > 
> > See also comment below[1].
> > 
> >>>>> have a clock_update() callback. The clock can be optionally
> >>>>> set Using qdev_connect_clock_in() from the Clock API.
> >>>>> If the clock changes, the optional clock_update() will be
> >>>>> called.  
> > 
> > What does "clock change" means?  Is this just about the
> > frequency, or something else?
> 
> A frequency changes -- which can be because a parent (in the
> clock tree) changed its source using a MUX.
> 
> > 
> > (By reading the Clock API documentation, it looks like it only
> > represents the clock frequency, but I'm not sure)
> > 
> >>>>
> >>>> the sole user of it is mips cpu, so question is why
> >>>> you are making it part of generic CPUm instead of
> >>>> MIPSCPUClass/MIPSCPU?  
> >>>
> >>> This is a feature of the CPU, regardless its architecture.
> >>>
> >>> I expect the other archs to start using it soon.
> >>
> >> if there aren't any plans to actually to do that,
> >> I'd keep it to MIPS class and generalize later when there is demand.
> 
> No problem.
> 
> > 
> > I normally don't mind if a feature is generic from the beginning.
> > But in this case I'm inclined to agree with Igor.  Unless we
> > expect to see arch-independent code to use CPUState.clock soon
> > (do we?), having CPUState.clock existing but unused by most
> > architectures would be misleading.
> > 
> > Also, at least on x86 there are so many different clock sources,
> > that I'm not sure it would be a desirable to have a generic clock
> > input named "clk".
> 
> Well X86 is the arch I'm less confident with. Anyhow if it has
> multiple clock sources, I'd expect a Clock MUX block to select
> an unique clock to feed the CPU.

I don't mean there are different clocks that can feed the CPU,
but that there are multiple software interfaces that report a
clock frequency to the guest OS, and they can disagree with each
other.  The phrase "the actual frequency of the CPU clock" is
going to be ambiguous.

> 
[...]
> >>>>>   *   QOM parent.
> >>>>>   * @nr_cores: Number of cores within this CPU package.
> >>>>>   * @nr_threads: Number of threads within this CPU.
> >>>>> + * @clock: this CPU source clock (an output clock of another device)
> > 
> > [1]
> > 
> > What does "source clock" means?  Is this the same as "clock input"?
> 
> Yes, for clocks it is common to use source/sink instead of input/output.
> I'll try to reword.

If we use source/sink terminology, wouldn't CPUState.clock be a
sink, which can be connected to a source somewhere else?

> 
> > 
> > 
> >>>>>   * @running: #true if CPU is currently running (lockless).
> >>>>>   * @has_waiter: #true if a CPU is currently waiting for the cpu_exec_end;
> >>>>>   * valid under cpu_list_lock.
> >>>>> @@ -400,6 +404,7 @@ struct CPUState {
> >>>>>      int num_ases;
> >>>>>      AddressSpace *as;
> >>>>>      MemoryRegion *memory;
> >>>>> +    Clock *clock;
> >>>>>  
> >>>>>      void *env_ptr; /* CPUArchState */
> >>>>>      IcountDecr *icount_decr_ptr;
> >>>>> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> >>>>> index c55c09f734c..37fcff3ec64 100644
> >>>>> --- a/hw/core/cpu.c
> >>>>> +++ b/hw/core/cpu.c
> >>>>> @@ -30,6 +30,7 @@
> >>>>>  #include "qemu/qemu-print.h"
> >>>>>  #include "sysemu/tcg.h"
> >>>>>  #include "hw/boards.h"
> >>>>> +#include "hw/qdev-clock.h"
> >>>>>  #include "hw/qdev-properties.h"
> >>>>>  #include "trace/trace-root.h"
> >>>>>  #include "qemu/plugin.h"
> >>>>> @@ -247,6 +248,16 @@ void cpu_reset(CPUState *cpu)
> >>>>>      trace_guest_cpu_reset(cpu);
> >>>>>  }
> >>>>>  
> >>>>> +static void cpu_clk_update(void *opaque)
> >>>>> +{
> >>>>> +    CPUState *cpu = opaque;
> >>>>> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> >>>>> +
> >>>>> +    if (cc->clock_update) {
> >>>>> +        cc->clock_update(cpu);
> >>>>> +    }
> >>>>> +}
> >>>>> +
> >>>>>  static void cpu_common_reset(DeviceState *dev)
> >>>>>  {
> >>>>>      CPUState *cpu = CPU(dev);
> >>>>> @@ -367,6 +378,7 @@ static void cpu_common_initfn(Object *obj)
> >>>>>      /* the default value is changed by qemu_init_vcpu() for softmmu */
> >>>>>      cpu->nr_cores = 1;
> >>>>>      cpu->nr_threads = 1;
> >>>>> +    cpu->clock = qdev_init_clock_in(DEVICE(obj), "clk", cpu_clk_update, cpu);
> >>>>>  
> >>>>>      qemu_mutex_init(&cpu->work_mutex);
> >>>>>      QSIMPLEQ_INIT(&cpu->work_list);  
> >>>>   
> >>>
> >>
> > 
> 

-- 
Eduardo


