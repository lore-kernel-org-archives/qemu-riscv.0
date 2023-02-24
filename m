Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVQyf-0008PY-MI
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 00:50:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVQyY-0008Oz-Pa
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 00:50:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVQyW-0000fm-QV
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 00:50:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677217831;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6P5sflq0TEcENm+Di4Cne4S/YI5NcsuLzh33aC4bYNo=;
 b=aq486o7x+KneGZyrJz3BPibmJ53Q1VsqenWRd0Ows9EM9tWc56D+kNphNr1iaeEk8liVWr
 kGOkWMXH6m4W7QXfefwHFSGXOe/6u2KB8zNax5FvA3TgwBJpNa+WzYKcgQ7n/xn2ZAX6SK
 /l4OaxNw6V4KvQm7wPPwD0G1wiFSdR4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-4_Gv5r2_PCKHodPI6nSKQw-1; Fri, 24 Feb 2023 00:47:27 -0500
X-MC-Unique: 4_Gv5r2_PCKHodPI6nSKQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1DBD1871D97;
 Fri, 24 Feb 2023 05:47:26 +0000 (UTC)
Received: from [10.64.54.79] (vpn2-54-79.bne.redhat.com [10.64.54.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E8041121314;
 Fri, 24 Feb 2023 05:47:18 +0000 (UTC)
Reply-To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v2 0/4] NUMA: Apply socket-NUMA-node boundary for aarch64
 and RiscV machines
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, imammedo@redhat.com, yihyu@redhat.com,
 shan.gavin@gmail.com
References: <20230223081401.248835-1-gshan@redhat.com>
 <Y/disinKmr6gLby1@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <2a541e96-fe04-0cd5-3f28-6eb69aff3b91@redhat.com>
Date: Fri, 24 Feb 2023 16:47:15 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <Y/disinKmr6gLby1@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Fri, 24 Feb 2023 05:50:36 -0000

On 2/23/23 11:57 PM, Daniel P. Berrangé wrote:
> On Thu, Feb 23, 2023 at 04:13:57PM +0800, Gavin Shan wrote:
>> For arm64 and RiscV architecture, the driver (/base/arch_topology.c) is
>> used to populate the CPU topology in the Linux guest. It's required that
>> the CPUs in one socket can't span mutiple NUMA nodes. Otherwise, the Linux
>> scheduling domain can't be sorted out, as the following warning message
>> indicates. To avoid the unexpected confusion, this series attempts to
>> rejects such kind of insane configurations.
>>
>>     -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>>     -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>>     -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>>     -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
> 
> This is somewhat odd as a config, because core 2 is in socket 0
> and core 3 is in socket 1, so it wouldn't make much conceptual
> sense to have them in the same NUMA node, while other cores within
> the same socket are in different NUMA nodes. Basically the split
> of NUMA nodes is not aligned with any level in the topology.
> 
> This series, however, also rejects configurations that I would
> normally consider to be reasonable. I've not tested linux kernel
> behaviour though, but as a user I would expect to be able to
> ask for:
> 
>      -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>      -numa node,nodeid=0,cpus=0,memdev=ram0                \
>      -numa node,nodeid=1,cpus=1,memdev=ram1                \
>      -numa node,nodeid=2,cpus=2,memdev=ram2                \
>      -numa node,nodeid=3,cpus=3,memdev=ram3                \
>      -numa node,nodeid=4,cpus=4,memdev=ram4                \
>      -numa node,nodeid=5,cpus=5,memdev=ram5                \
> 
> ie, every core gets its own NUMA node
> 

It doesn't work to Linux guest either. As the following warning message
indicates, the Multicore domain isn't a subset of DIE (CLUSTER or socket)
domain. For example, Multicore domain is 0-2 while DIE domain is 0 for
CPU-0.

[    0.023486] CPU-0: 36,56,0,-1 thread=0  core=0-2  cluster=0-2 llc=0    // parsed from ACPI PPTT
[    0.023490] CPU-1: 36,56,1,-1 thread=1  core=0-2  cluster=0-2 llc=1
[    0.023492] CPU-2: 36,56,2,-1 thread=2  core=0-2  cluster=0-2 llc=2
[    0.023494] CPU-3: 136,156,3,-1 thread=3  core=3-5  cluster=3-5 llc=3
[    0.023495] CPU-4: 136,156,4,-1 thread=4  core=3-5  cluster=3-5 llc=4
[    0.023497] CPU-5: 136,156,5,-1 thread=5  core=3-5  cluster=3-5 llc=5
[    0.023499] CPU-0: SMT=0  CLUSTER=0  MULTICORE=0-2  DIE=0  CPU-OF-NODE=0      // Seen by scheduling domain
[    0.023501] CPU-1: SMT=1  CLUSTER=1  MULTICORE=0-2  DIE=1  CPU-OF-NODE=1
[    0.023503] CPU-2: SMT=2  CLUSTER=2  MULTICORE=0-2  DIE=2  CPU-OF-NODE=2
[    0.023504] CPU-3: SMT=3  CLUSTER=3  MULTICORE=3-5  DIE=3  CPU-OF-NODE=3
[    0.023506] CPU-4: SMT=4  CLUSTER=4  MULTICORE=3-5  DIE=4  CPU-OF-NODE=4
[    0.023508] CPU-5: SMT=5  CLUSTER=5  MULTICORE=3-5  DIE=5  CPU-OF_NODE=5
         :
[    0.023555] BUG: arch topology borken
[    0.023556]      the MC domain not a subset of the DIE domain

NOTE that both DIE and CPU-OF-NODE are same since they're all returned by
'cpumask_of_node(cpu_to_node(cpu))'.


> Or to aask for every cluster as a numa node:
> 
>      -smp 6,maxcpus=6,sockets=2,clusters=3,cores=1,threads=1 \
>      -numa node,nodeid=0,cpus=0,memdev=ram0                \
>      -numa node,nodeid=1,cpus=1,memdev=ram1                \
>      -numa node,nodeid=2,cpus=2,memdev=ram2                \
>      -numa node,nodeid=3,cpus=3,memdev=ram3                \
>      -numa node,nodeid=4,cpus=4,memdev=ram4                \
>      -numa node,nodeid=5,cpus=5,memdev=ram5                \
> 

This case works fine to Linux guest.

[    0.024505] CPU-0: 36,56,0,-1 thread=0  core=0-2  cluster=0 llc=0            // parsed from ACPI PPTT
[    0.024509] CPU-1: 36,96,1,-1 thread=1  core=0-2  cluster=1 llc=1
[    0.024511] CPU-2: 36,136,2,-1 thread=2  core=0-2  cluster=2 llc=2
[    0.024512] CPU-3: 176,196,3,-1 thread=3  core=3-5  cluster=3 llc=3
[    0.024514] CPU-4: 176,236,4,-1 thread=4  core=3-5  cluster=4 llc=4
[    0.024515] CPU-5: 176,276,5,-1 thread=5  core=3-5  cluster=5 llc=5
[    0.024518] CPU-0: SMT=0  CLUSTER=0  MULTICORE=0  DIE=0  CPU-OF-NODE=0      // Seen by scheduling domain
[    0.024519] CPU-1: SMT=1  CLUSTER=1  MULTICORE=1  DIE=1  CPU-OF-NODE=1
[    0.024521] CPU-2: SMT=2  CLUSTER=2  MULTICORE=2  DIE=2  CPU-OF-NODE=2
[    0.024522] CPU-3: SMT=3  CLUSTER=3  MULTICORE=3  DIE=3  CPU-OF-NODE=3
[    0.024524] CPU-4: SMT=4  CLUSTER=4  MULTICORE=4  DIE=4  CPU-OF-NODE=4
[    0.024525] CPU-5: SMT=5  CLUSTER=5  MULTICORE=5  DIE=5  CPU-OF-NODE=5


> In both cases the NUMA split is aligned with a given level
> in the topology, which was not the case with your example.
> 
> Rejecting these feels overly strict to me, and may risk breaking
> existing valid deployments, unless we can demonstrate those
> scenarios were unambiguously already broken ?
> 
> If there was something in the hardware specs that requires
> this, then it is more valid to do, than if it is merely an
> specific guest kernel limitation that might be fixed any day.
> 

Yes, I agree that it's strict to have socket-to-NUMA boundary. However,
it sounds not sensible to split CPUs in one cluster to differnet NUMA
nodes, or to split CPUs in one core to different NUMA nodes in the baremetal
environment. I think we probably need to prevent these two cases, meaning two
clusters in one socket is still allowed to be associated with different NUMA
nodes.

I fail to get accurate information about the relation among socket/cluster/core
from specs. As I can understand, the CPUs in one core are sharing L2 cache and
cores in one cluster are sharing L3 cache. thread would have its own L1 cache.
L3 cache is usually corresponding to NUMA node. I may be totally wrong here.

Thanks,
Gavin





