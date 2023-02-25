Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVi4n-00047K-Eg
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 19:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVi4m-00043g-MI
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 19:06:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVi4g-0007Oo-VZ
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 19:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677283561;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wJrR/b3T+mJBBQo5YN6sUaiHLTKTzqYvLAXS02lkwSo=;
 b=gZcxoFmXaICsD6cbMx9ABGu6OUMGyWqU4CEjK/fhTvE6ooOqV6x6hV++HIan+5Y76NgLQQ
 5yzrS77u92urjyhrz+5eGuYCQcu81jq7EnTwzaLD02botIp0McbWCkrLpRvfXkrQ1VEhOo
 WuqQ87mF4i+ppfI5Z03OFgOPQ6yWv9U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-m2ia8WHWPTixnBmC4wRt0w-1; Fri, 24 Feb 2023 19:05:57 -0500
X-MC-Unique: m2ia8WHWPTixnBmC4wRt0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4506E29A9CA8;
 Sat, 25 Feb 2023 00:05:56 +0000 (UTC)
Received: from [10.64.54.20] (vpn2-54-20.bne.redhat.com [10.64.54.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF28B2026D4B;
 Sat, 25 Feb 2023 00:05:46 +0000 (UTC)
Reply-To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v2 0/4] NUMA: Apply socket-NUMA-node boundary for aarch64
 and RiscV machines
To: Igor Mammedov <imammedo@redhat.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com, yihyu@redhat.com,
 shan.gavin@gmail.com, =?UTF-8?B?TWljaGFsIFByw612b3puw61r?=
 <mprivozn@redhat.com>
References: <20230223081401.248835-1-gshan@redhat.com>
 <2d37d157-12a1-07aa-4c70-974ac1503283@ventanamicro.com>
 <fc0d2c66-5600-c33a-62d7-c72f1d16518b@redhat.com>
 <11e958b1-4763-f710-fe02-832cfd559e7b@ventanamicro.com>
 <9e8523a9-9059-e3a0-e32e-414f83e06a6f@redhat.com>
 <20230224152035.6edfa832@imammedo.users.ipa.redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <7638e643-7a05-808c-ec47-c29db1c5d75f@redhat.com>
Date: Sat, 25 Feb 2023 11:05:42 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20230224152035.6edfa832@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 25 Feb 2023 00:06:08 -0000

On 2/25/23 1:20 AM, Igor Mammedov wrote:
> On Fri, 24 Feb 2023 21:16:39 +1100
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> On 2/24/23 8:26 PM, Daniel Henrique Barboza wrote:
>>> On 2/24/23 04:09, Gavin Shan wrote:
>>>> On 2/24/23 12:18 AM, Daniel Henrique Barboza wrote:
>>>>> On 2/23/23 05:13, Gavin Shan wrote:
>>>>>> For arm64 and RiscV architecture, the driver (/base/arch_topology.c) is
>>>>>> used to populate the CPU topology in the Linux guest. It's required that
>>>>>> the CPUs in one socket can't span mutiple NUMA nodes. Otherwise, the Linux
>>>>>> scheduling domain can't be sorted out, as the following warning message
>>>>>> indicates. To avoid the unexpected confusion, this series attempts to
>>>>>> rejects such kind of insane configurations.
>>>>>>
>>>>>>      -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>>>>>>      -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>>>>>>      -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>>>>>>      -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
>>>>>
>>>>>
>>>>> And why is this a QEMU problem? This doesn't hurt ACPI.
>>>>>
>>>>> Also, this restriction impacts breaks ARM guests in the wild that are running
>>>>> non-Linux OSes. I don't see why we should impact use cases that has nothing to
>>>>> do with Linux Kernel feelings about sockets - NUMA nodes exclusivity.
>>>>>   
>>>>
>>>> With above configuration, CPU-0/1/2 are put into socket-0-cluster-0 while CPU-3/4/5
>>>> are put into socket-1-cluster-0, meaning CPU-2/3 belong to different socket and
>>>> cluster. However, CPU-2/3 are associated with NUMA node-1. In summary, multiple
>>>> CPUs in different clusters and sockets have been associated with one NUMA node.
>>>>
>>>> If I'm correct, the configuration isn't sensible in a baremetal environment and
>>>> same Linux kernel is supposed to work well for baremetal and virtualized machine.
>>>> So I think QEMU needs to emulate the topology as much as we can to match with the
>>>> baremetal environment. It's the reason why I think it's a QEMU problem even it
>>>> doesn't hurt ACPI. As I said in the reply to Daniel P. Berrangé <berrange@redhat.com>
>>>> in another thread, we may need to gurantee that the CPUs in one cluster can't be
>>>> split to multiple NUMA nodes, which matches with the baremetal environment, as I
>>>> can understand.
>>>>
>>>> Right, the restriction to have socket-NUMA-node or cluster-NUMA-node boundary will
>>>> definitely break the configurations running in the wild.
>>>
>>>
>>> What about a warning? If the user attempts to use an exotic NUMA configuration
>>> like the one you mentioned we can print something like:
>>>
>>> "Warning: NUMA topologies where a socket belongs to multiple NUMA nodes can cause OSes like Linux to misbehave"
>>>
>>> This would inform the user what might be going wrong in case Linux is crashing/error
>>> out on them and then the user is free to fix their topology (or the kernel). And
>>> at the same time we wouldn't break existing stuff that happens to be working.
>>>
>>>    
>>
>> Yes, I think a warning message is more appropriate, so that users can fix their
>> irregular configurations and the existing configurations aren't disconnected.
>> It would be nice to get the agreements from Daniel P. Berrangé and Drew, before
>> I'm going to change the code and post next revision.
> 
> Honestly you (and libvirt as far as I recall) are using legacy options
> to assign cpus to numa nodes.
> With '-numa node,nodeid=0,cpus=0-1' you can't really be sure what/where
> in topology those cpus are.
> What you can do is to use '-numa cpu,...' option to assign socket/core/...
> to numa node, ex:
>          "-numa cpu,node-id=1,socket-id=0 "           or
>          "-numa cpu,node-id=0,socket-id=1,core-id=0 "       or
>          "-numa cpu,node-id=0,socket-id=1,core-id=1,thread-id=0
> to get your desired mapping.
> 
> The problem that's so far was stopping the later adoption by libvirt (Michal CCed)
> is that values used by it are machine specific and to do it properly, for a concrete
> '-M x -smp ...' at least for the first time qemu should be started with-
>   -preconfig option and then user should query possible cpus for those values
> and assign them to numa nodes via QMP.
> 

The issue isn't related to the legacy or modern way to configure CPU-to-NUMA association.
Note that qtests/numa-test also use the legacy way. For example, the issue can be triggered
with the following command lines where the modern configuration is used:

   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64            \
   -accel kvm -machine virt,gic-version=host                          \
   -cpu host -smp 6,sockets=2,clusters=1,cores=3,threads=1            \
   -m 768M,slots=16,maxmem=64G                                        \
   -object memory-backend-ram,id=mem0,size=256M                       \
   -object memory-backend-ram,id=mem1,size=256M                       \
   -object memory-backend-ram,id=mem2,size=256M                       \
   -numa node,nodeid=0,memdev=mem0                                    \
   -numa node,nodeid=1,memdev=mem1                                    \
   -numa node,nodeid=2,memdev=mem2                                    \
   -numa cpu,node-id=0,socket-id=0,cluster-id=0,core-id=0,thread-id=0 \
   -numa cpu,node-id=0,socket-id=0,cluster-id=0,core-id=1,thread-id=0 \
   -numa cpu,node-id=1,socket-id=0,cluster-id=0,core-id=2,thread-id=0 \
   -numa cpu,node-id=1,socket-id=1,cluster-id=0,core-id=0,thread-id=0 \
   -numa cpu,node-id=2,socket-id=1,cluster-id=0,core-id=1,thread-id=0 \
   -numa cpu,node-id=2,socket-id=1,cluster-id=0,core-id=2,thread-id=0
     :
     :
   [    0.022260] =============== sched_init_domains ===================
   [    0.022263] CPU-0: 36,56,0,-1 thread=0  core=0-2  cluster=0-2 llc=0
   [    0.022267] CPU-1: 36,56,1,-1 thread=1  core=0-2  cluster=0-2 llc=1
   [    0.022269] CPU-2: 36,56,2,-1 thread=2  core=0-2  cluster=0-2 llc=2
   [    0.022270] CPU-3: 136,156,3,-1 thread=3  core=3-5  cluster=3-5 llc=3
   [    0.022272] CPU-4: 136,156,4,-1 thread=4  core=3-5  cluster=3-5 llc=4
   [    0.022273] CPU-5: 136,156,5,-1 thread=5  core=3-5  cluster=3-5 llc=5
   [    0.022275] CPU-0: SMT=0  CLUSTER=0  MULTICORE=0-2  CPUMASK=0-1  0-1
   [    0.022277] CPU-1: SMT=1  CLUSTER=1  MULTICORE=0-2  CPUMASK=0-1  0-1
   [    0.022279] CPU-2: SMT=2  CLUSTER=0-2  MULTICORE=2-3  CPUMASK=2-3  2-3
   [    0.022281] CPU-3: SMT=3  CLUSTER=3-5  MULTICORE=2-3  CPUMASK=2-3  2-3
   [    0.022283] CPU-4: SMT=4  CLUSTER=4  MULTICORE=3-5  CPUMASK=4-5  4-5
   [    0.022284] CPU-5: SMT=5  CLUSTER=5  MULTICORE=3-5  CPUMASK=4-5  4-5
   [    0.022314] build_sched_domains: CPU-0 level-SMT
   [    0.022317] build_sched_domains: CPU-0 level-CLS
   [    0.022318] topology_span_sane: CPU-0 0 vs CPU-2 0-2
   [    0.022322] ------------[ cut here ]------------
   [    0.022323] WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2275 build_sched_domains+0x135c/0x1660
      :

> btw: on x86 we also allow 'insane' configuration incl. those that do not
> exist on baremetal and do not warn about it anyone (i.e. it's user's
> responsibility to provide topology that specific guest OS could handle,
> aka it's not QEMU business but upper layers). (I do occasionally try
> introduce stricter checks in that are, but that gets push back more
> often that not).
> 
> I'd do check only in case of a specific board where mapping is fixed
> in specs of emulated machine, otherwise I wouldn't bother.
> 

Right, x86 can handle the irregular configuration well and we didn't find
any triggered warning messages there. As the subject indicates, it's a
ARM64 or riscv specific issue. Unfortunately, I failed to find the requirement,
socket-to-NUMA-node or cluster-to-NUMA-node 1:1 mapping from specs. However, it's not
sensible to split CPUs in one cluster to multiple NUMA nodes in a (ARM64 or RISCv)
baremetal environment. QEMU needs to emulate the environment close to the baremetal
machine if we can.

In summary, a warning message when multiple CPUs in one cluster are split to
multiple NUMA nodes, as Daniel suggested, sounds reasonable to me. Please let me
know your thoughts, Igor :)

Thanks,
Gavin


