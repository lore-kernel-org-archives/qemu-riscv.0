Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbNaD-0000ta-4F
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 09:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mbIU1-0001S1-FB
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 04:22:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mbITx-0003lg-Q3
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 04:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634286144;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w1YnX7ccJ8G+ltNPFKXvSRpla/i6TiRawkLgXdG8nu4=;
 b=GPT0eiOCtexK+nsJZODsHtx3CNogW39XCohq3cUK+ITF6ve0EMAvC9DAkPF5x6qZaOBjZf
 3PRS6csqyxK/3+UYu0DY/LbjgukzLhuk/chTid4AcjmRiJmfXD6Sr2sfIZVq5eovvWIk7k
 7Zx5ch0SVAXgDAuS+73ut8eJh5WZC+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-Ly_qLy-gNU2QzYSfqcNwHw-1; Fri, 15 Oct 2021 04:22:21 -0400
X-MC-Unique: Ly_qLy-gNU2QzYSfqcNwHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DC1A362FB;
 Fri, 15 Oct 2021 08:22:20 +0000 (UTC)
Received: from [10.64.54.38] (vpn2-54-38.bne.redhat.com [10.64.54.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F3C169119;
 Fri, 15 Oct 2021 08:22:11 +0000 (UTC)
Reply-To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 1/2] numa: Require distance map when empty node exists
To: Andrew Jones <drjones@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, robh@kernel.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 qemu-riscv@nongnu.org
References: <20211013045805.192165-1-gshan@redhat.com>
 <20211013045805.192165-2-gshan@redhat.com>
 <20211013133011.62b8812d@redhat.com>
 <20211013113544.4xrfagduw4nlbvou@gator.home>
 <20211013135346.3a8f6c9a@redhat.com>
 <20211013121125.sdewyrxcipsi3o22@gator.home>
 <20211013122840.fi4ufle4czyzegtb@gator.home>
 <20211014171417.541c9bee@redhat.com> <20211014153609.pzndx7um3dfdgelo@gator>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <2399ce27-0663-6780-5453-3ee773563352@redhat.com>
Date: Fri, 15 Oct 2021 19:22:05 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20211014153609.pzndx7um3dfdgelo@gator>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 15 Oct 2021 09:49:10 -0400
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
X-List-Received-Date: Fri, 15 Oct 2021 08:22:29 -0000

Hi Drew,

On 10/15/21 2:36 AM, Andrew Jones wrote:
> On Thu, Oct 14, 2021 at 05:14:17PM +0200, Igor Mammedov wrote:
>> On Wed, 13 Oct 2021 14:28:40 +0200
>> Andrew Jones <drjones@redhat.com> wrote:
>>> On Wed, Oct 13, 2021 at 02:11:25PM +0200, Andrew Jones wrote:
>>>> On Wed, Oct 13, 2021 at 01:53:46PM +0200, Igor Mammedov wrote:
>>>>> On Wed, 13 Oct 2021 13:35:44 +0200
>>>>> Andrew Jones <drjones@redhat.com> wrote:  
>>>>>> On Wed, Oct 13, 2021 at 01:30:11PM +0200, Igor Mammedov wrote:
>>>>>>> On Wed, 13 Oct 2021 12:58:04 +0800
>>>>>>> Gavin Shan <gshan@redhat.com> wrote:
>>>>>>>      
>>>>>>>> The following option is used to specify the distance map. It's
>>>>>>>> possible the option isn't provided by user. In this case, the
>>>>>>>> distance map isn't populated and exposed to platform. On the
>>>>>>>> other hand, the empty NUMA node, where no memory resides, is
>>>>>>>> allowed on platforms like ARM64 virt. For these empty NUMA
>>>>>>>> nodes, their corresponding device-tree nodes aren't populated,
>>>>>>>> but their NUMA IDs should be included in the "/distance-map"
>>>>>>>> device-tree node, so that kernel can probe them properly if
>>>>>>>> device-tree is used.
>>>>>>>>
>>>>>>>>    -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
>>>>>>>>
>>>>>>>> This adds extra check after the machine is initialized, to
>>>>>>>> ask for the distance map from user when empty nodes exist in
>>>>>>>> device-tree.
>>>>>>>>
>>>>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>>>>> ---
>>>>>>>>   hw/core/machine.c     |  4 ++++
>>>>>>>>   hw/core/numa.c        | 24 ++++++++++++++++++++++++
>>>>>>>>   include/sysemu/numa.h |  1 +
>>>>>>>>   3 files changed, 29 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>>>>>>> index b8d95eec32..c0765ad973 100644
>>>>>>>> --- a/hw/core/machine.c
>>>>>>>> +++ b/hw/core/machine.c
>>>>>>>> @@ -1355,6 +1355,10 @@ void machine_run_board_init(MachineState *machine)
>>>>>>>>       accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
>>>>>>>>       machine_class->init(machine);
>>>>>>>>       phase_advance(PHASE_MACHINE_INITIALIZED);
>>>>>>>> +
>>>>>>>> +    if (machine->numa_state) {
>>>>>>>> +        numa_complete_validation(machine);
>>>>>>>> +    }
>>>>>>>>   }
>>>>>>>>   
>>>>>>>>   static NotifierList machine_init_done_notifiers =
>>>>>>>> diff --git a/hw/core/numa.c b/hw/core/numa.c
>>>>>>>> index 510d096a88..7404b7dd38 100644
>>>>>>>> --- a/hw/core/numa.c
>>>>>>>> +++ b/hw/core/numa.c
>>>>>>>> @@ -727,6 +727,30 @@ void numa_complete_configuration(MachineState *ms)
>>>>>>>>       }
>>>>>>>>   }
>>>>>>>>   
>>>>>>>> +/*
>>>>>>>> + * When device-tree is used by the machine, the empty node IDs should
>>>>>>>> + * be included in the distance map. So we need provide pairs of distances
>>>>>>>> + * in this case.
>>>>>>>> + */
>>>>>>>> +void numa_complete_validation(MachineState *ms)
>>>>>>>> +{
>>>>>>>> +    NodeInfo *numa_info = ms->numa_state->nodes;
>>>>>>>> +    int nb_numa_nodes = ms->numa_state->num_nodes;
>>>>>>>> +    int i;
>>>>>>>> +
>>>>>>>> +    if (!ms->fdt || ms->numa_state->have_numa_distance) {
>>>>>>>
>>>>>>> also skip check/limitation when VM is launched with ACPI enabled?
>>>
>>> On second thought, I guess it's a good idea to not error out when ACPI is
>>> enabled. There's no point in burdening the ACPI user.
>>>

Yup, for platform like hw/arm/virt, the device-tree and ACPI table are
used at same time can't bypass the check/limitation. Instead, x86 won't be
affected as device-tree isn't used there.

>>>>>>
>>>>>> Even with ACPI enabled we generate a DT and would like that DT to be as
>>>>>> complete as possible. Of course we should generate a SLIT table with
>>>>>
>>>>> Guest will work just fine without distance map as SRAT describes
>>>>> all numa nodes.
>>>>> You are forcing VM to have SLIT just for the sake of 'completeness'
>>>>> that's practically unused.
>>>>>
>>>>> I'm still unsure about pushing all of this in generic numa code,
>>>>> as this will be used only by ARM for now. It's better to keep it
>>>>> ARM specific, and when RISCV machine will start using this, it
>>>>> could be moved to generic code.
>>>
>>> I think RISCV could start using it now. Linux shares the mem/numa DT
>>> parsing code between Arm and RISCV. If RISCV QEMU wanted to start
>>> exposing NUMA nodes, then they might as well support empty ones from
>>> the start.
>>
>> When RISCV will start using memory-less nodes, we can move this check to
>> generic code.
>> So far 2/2 takes care of ARM only, as result I don't see
>> a good reason to generalize it now. (CCing RISCV folks to see if
>> there is any plans to impl. that)
>>
>>>> I don't see a problem in providing this DT node / ACPI table to guests
>>>> with empty NUMA nodes. I don't even see a problem with providing the
>>>> distance information unconditionally. Can you explain why we should
>>>> prefer not to provide optional HW descriptions?
>>>
>>> I'm still curious why we should be so reluctant to add HW descriptions.
>>> I agree we should be reluctant to error out, though.
>>
>> If distance map were the only way to figure out present node-ids,
>> I wouldn't mind making it non-optional.
>>
>> However guest can already get node-ids from mem/cpu/pci nodes
>> with current device-tree that QEMU generates and
>> forcing optional distance-map (with duplicate info) on user
>> creates non must-have CLI requirements/inconvenience that
>> will eventually propagate to higher layers, I'd rather avoid
>> that if possible.
>>
>> So question is if an idea of fetching numa-ids from cpu nodes
>> in addition to memory nodes (which should cover QEMU needs)
>> have been considered and why it didn't work out?
> 
> Thinking about it some more. I think we only need patch 2/2 of this
> series. We should double check, but if when Linux generates its
> default distance-map it already generates a map using the numa-ids
> in the cpu nodes of the DT, then I guess the resulting Linux generated
> distance-map will be sufficient to represent the empty NUMA nodes and
> could be used for DT memory hotplug if Linux ever tried to implement
> that.
> 
> Gavin, can you check if we can just drop patch 1/2 and then when
> booting a DT guest with empty numa nodes we get the distance
> map we wanted to enforce anyway?
> 

It's possible that the empty NUMA nodes aren't referred by any CPUs,
as the following command line indicate. In this case, the empty NUMA
node IDs aren't existing in device-tree CPU nodes. So we still need
the distance-map.

In the following example, The empty NUMA node #2 and #3 aren't
referred by any CPUs. So their NUMA node IDs won't be included
to device-tree CPU nodes.

    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
    -accel kvm -machine virt,gic-version=host               \
    -cpu host -smp 4,sockets=2,cores=2,threads=1            \
    -m 1024M,slots=16,maxmem=64G                            \
    -object memory-backend-ram,id=mem0,size=512M            \
    -object memory-backend-ram,id=mem1,size=512M            \
    -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
    -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
    -numa node,nodeid=2                                     \
    -numa node,nodeid=3
      :

However, I would like to drop this (PATCH[01/02]) in v4. The memory
hotplug through device-tree on ARM64 isn't existing. We might have
alternative ways to present the empty NUMA nodes when it's supported,
or we needn't it for ever because ACPI is enough to support the
memory hotplug.

Thanks,
Gavin

  
>>>>>>>      
>>>>>>>> +        return;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    for (i = 0; i < nb_numa_nodes; i++) {
>>>>>>>> +        if (numa_info[i].present && !numa_info[i].node_mem) {
>>>>>>>> +            error_report("Empty node %d found, please provide "
>>>>>>>> +                         "distance map.", i);
>>>>>>>> +            exit(EXIT_FAILURE);
>>>>>>>> +        }
>>>>>>>> +    }
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>   void parse_numa_opts(MachineState *ms)
>>>>>>>>   {
>>>>>>>>       qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, &error_fatal);
>>>>>>>> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
>>>>>>>> index 4173ef2afa..80f25ab830 100644
>>>>>>>> --- a/include/sysemu/numa.h
>>>>>>>> +++ b/include/sysemu/numa.h
>>>>>>>> @@ -104,6 +104,7 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
>>>>>>>>   void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
>>>>>>>>                              Error **errp);
>>>>>>>>   void numa_complete_configuration(MachineState *ms);
>>>>>>>> +void numa_complete_validation(MachineState *ms);
>>>>>>>>   void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
>>>>>>>>   extern QemuOptsList qemu_numa_opts;
>>>>>>>>   void numa_cpu_pre_plug(const struct CPUArchId *slot, DeviceState *dev,
>>>>>>>      
>>>>>>    
>>>>>    
>>>
>>>
>>
> 


