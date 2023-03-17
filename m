Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pd3ax-0005CY-Fn
	for mharc-qemu-riscv@gnu.org; Fri, 17 Mar 2023 02:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pd3ap-0005AR-B5
 for qemu-riscv@nongnu.org; Fri, 17 Mar 2023 02:29:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pd3an-0003Ha-LI
 for qemu-riscv@nongnu.org; Fri, 17 Mar 2023 02:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679034573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9xnydnSU2Z1+laBqFcXZi5cFrXSP0bidoLUlnLD8FBE=;
 b=Y5pnSgEX6Cs+vOFVNWWUz5eStDjljV+Tp7RRe5rt2vlWS0MqjETfsN+sa113hiWddRoqyk
 BBcgyVtDLlf0hQmFDRRlkoOBHscKodsmfOWEjliV3OMZFJpYNbTHtzFOC3xRtAiZ4beA0j
 qr2CWg87mPu9W8g4lGXKimOZEso38lQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-VlZ5lSeNOESoawyWzuYY0Q-1; Fri, 17 Mar 2023 02:29:27 -0400
X-MC-Unique: VlZ5lSeNOESoawyWzuYY0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A93D9281294C;
 Fri, 17 Mar 2023 06:29:26 +0000 (UTC)
Received: from [10.72.12.80] (ovpn-12-80.pek2.redhat.com [10.72.12.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDF1EC15BAD;
 Fri, 17 Mar 2023 06:29:16 +0000 (UTC)
Subject: Re: [PATCH v3 1/3] numa: Validate cluster and NUMA node boundary if
 required
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, ajones@ventanamicro.com,
 berrange@redhat.com, dbarboza@ventanamicro.com, shan.gavin@gmail.com
References: <20230225063527.281479-1-gshan@redhat.com>
 <20230225063527.281479-2-gshan@redhat.com>
Message-ID: <06711972-0a31-43ff-8421-33414f8bd518@redhat.com>
Date: Fri, 17 Mar 2023 14:29:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20230225063527.281479-2-gshan@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Fri, 17 Mar 2023 06:29:35 -0000

On 2/25/23 2:35 PM, Gavin Shan wrote:
> For some architectures like ARM64, multiple CPUs in one cluster can be
> associated with different NUMA nodes, which is irregular configuration
> because we shouldn't have this in baremetal environment. The irregular
> configuration causes Linux guest to misbehave, as the following warning
> messages indicate.
> 
>    -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>    -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>    -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>    -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
> 
>    ------------[ cut here ]------------
>    WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
>    Modules linked in:
>    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>    pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>    pc : build_sched_domains+0x284/0x910
>    lr : build_sched_domains+0x184/0x910
>    sp : ffff80000804bd50
>    x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>    x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>    x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>    x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>    x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>    x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>    x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>    x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>    x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>    x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>    Call trace:
>     build_sched_domains+0x284/0x910
>     sched_init_domains+0xac/0xe0
>     sched_init_smp+0x48/0xc8
>     kernel_init_freeable+0x140/0x1ac
>     kernel_init+0x28/0x140
>     ret_from_fork+0x10/0x20
> 
> Improve the situation to warn when multiple CPUs in one cluster have
> been associated with different NUMA nodes. However, one NUMA node is
> allowed to be associated with different clusters.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/core/machine.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
>   include/hw/boards.h |  1 +
>   2 files changed, 43 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index f29e700ee4..3513df5a86 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1252,6 +1252,45 @@ static void machine_numa_finish_cpu_init(MachineState *machine)
>       g_string_free(s, true);
>   }
>   
> +static void validate_cpu_cluster_to_numa_boundary(MachineState *ms)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> +    NumaState *state = ms->numa_state;
> +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
> +    const CPUArchId *cpus = possible_cpus->cpus;
> +    int len = possible_cpus->len, i, j;
> +
> +    if (state->num_nodes <= 1 || len <= 1) {
> +        return;
> +    }
> +
> +    /*
> +     * The Linux scheduling domain can't be parsed when the multiple CPUs
> +     * in one cluster have been associated with different NUMA nodes. However,
> +     * it's fine to associate one NUMA node with CPUs in different clusters.
> +     */
> +    for (i = 0; i < len; i++) {
> +        for (j = i + 1; j < len; j++) {
> +            if (cpus[i].props.has_socket_id &&
> +                cpus[i].props.has_cluster_id &&
> +                cpus[i].props.has_node_id &&
> +                cpus[j].props.has_socket_id &&
> +                cpus[j].props.has_cluster_id &&
> +                cpus[j].props.has_node_id &&
> +                cpus[i].props.socket_id == cpus[j].props.socket_id &&
> +                cpus[i].props.cluster_id == cpus[j].props.cluster_id &&
> +                cpus[i].props.node_id != cpus[j].props.node_id) {
> +                warn_report("CPU-%d and CPU-%d in socket-%ld-cluster-%ld "
> +                             "have been associated with node-%ld and node-%ld "
> +                             "respectively. It can cause OSes like Linux to"
> +                             "misbehave", i, j, cpus[i].props.socket_id,
> +                             cpus[i].props.cluster_id, cpus[i].props.node_id,
> +                             cpus[j].props.node_id);
> +            }
> +        }
> +    }
> +}
> +

There is an extra space after "It can cause OSes like linux to" is needed. Added to
v4, which was just posted.

>   MemoryRegion *machine_consume_memdev(MachineState *machine,
>                                        HostMemoryBackend *backend)
>   {
> @@ -1337,6 +1376,9 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
>           numa_complete_configuration(machine);
>           if (machine->numa_state->num_nodes) {
>               machine_numa_finish_cpu_init(machine);
> +            if (machine_class->cpu_cluster_has_numa_boundary) {
> +                validate_cpu_cluster_to_numa_boundary(machine);
> +            }
>           }
>       }
>   
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 6fbbfd56c8..c9793b2789 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -273,6 +273,7 @@ struct MachineClass {
>       bool nvdimm_supported;
>       bool numa_mem_supported;
>       bool auto_enable_numa;
> +    bool cpu_cluster_has_numa_boundary;
>       SMPCompatProps smp_props;
>       const char *default_ram_id;
>   

Thanks,
Gavin


