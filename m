Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peaLO-0002ri-ME
	for mharc-qemu-riscv@gnu.org; Tue, 21 Mar 2023 07:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1peaLM-0002qi-JG; Tue, 21 Mar 2023 07:39:56 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1peaLK-0000MP-V0; Tue, 21 Mar 2023 07:39:56 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id h15so1898603vsh.0;
 Tue, 21 Mar 2023 04:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679398792;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kh8qF8NCmvztM+2T+HSQ9EDTqqXzA1jO5V5UKq/yIMI=;
 b=glQ75cpZ3E+XChyQmEzQ+Nic5mbwEiimBS5LLPXYPisdvvrvtO+ZJ2IbRhj2LJO9VD
 Ez5bnqnegOXhSc5/60fXbViG3kRzUnXCn2K2XanfsoYYKvukc7ocr8f5L1o0GQIPiP2j
 dTF4Z9X0HS3oBm+jSEjBuXs0Tb4NnGFuk25Y3jaHbWtr31VkygcgPOVJnK9x/gVFMWLA
 X9indCqzU464+WuQkop0A3Ot8e8mD/JT6UTi2tbqeRf7uOcxh74RdUf/LtcE6fI86age
 ldWdoIF2mGJ/i27N1u5RB4ctJjGEqQylgAqe5J+ImKkFLZpyu5ioKcnQAI9RLYm0ApVZ
 ZHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679398792;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kh8qF8NCmvztM+2T+HSQ9EDTqqXzA1jO5V5UKq/yIMI=;
 b=q88OH9mEiDgzDb2jnt68k5lwI1psC3Kfub0mzshLxaJ66ThS8CdTrlBlpjYlWENV+h
 pVmXq1XOmBg3oQjgWoD+8b6iCF+2iKJNm+GENzAW6+qPJIUhfH5b4QaZz+fjMoUcJRQb
 RZLOG8YLjrQSwbgIMKeQkwJQ2U5GUF5HFJy5ua0jGN8buA0hlJjkQKdwqCn6iCPIfca6
 5P8GwGwvE9ONZlrQ8NtOvGIYn4JiSegnr72JPSzACi/aDIyMDsGJ9BUK3auHl0mE+zNH
 hk2iqsn/dlQ3o5slUDtG5jXrvQEd9zhrCRQLEiz3O2PTAHRFzcanAZj6qOgTqEhdAvKh
 I9JA==
X-Gm-Message-State: AO0yUKXr3ENEYjymC21rD4GjhCqbfMDUlaJqrcL8eEZXpY2Fw4ZYBcg5
 u1yLxt9a43B0OKYVtzL+yRIXQSL+lvvufEU/ZI4=
X-Google-Smtp-Source: AK7set+9GjBwgoGXxfO8uB9EV4JLQ01MCdny74uuEuC75r/q0RCkisi4Tl986C7b+6LTKIDvQqelic/Nqh0mO2EXVcg=
X-Received: by 2002:a67:c81b:0:b0:425:969d:3709 with SMTP id
 u27-20020a67c81b000000b00425969d3709mr1287778vsk.3.1679398792676; Tue, 21 Mar
 2023 04:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230317062542.61061-1-gshan@redhat.com>
 <20230317062542.61061-2-gshan@redhat.com>
In-Reply-To: <20230317062542.61061-2-gshan@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Mar 2023 21:39:26 +1000
Message-ID: <CAKmqyKPDE8OkfbDE0UgVyqodCGjRXAvkaEf2BFCJCVUsJf6cUw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] numa: Validate cluster and NUMA node boundary if
 required
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com, 
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, thuth@redhat.com, lvivier@redhat.com, 
 pbonzini@redhat.com, imammedo@redhat.com, ajones@ventanamicro.com, 
 berrange@redhat.com, dbarboza@ventanamicro.com, yihyu@redhat.com, 
 shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 21 Mar 2023 11:39:57 -0000

On Fri, Mar 17, 2023 at 4:29=E2=80=AFPM Gavin Shan <gshan@redhat.com> wrote=
:
>
> For some architectures like ARM64, multiple CPUs in one cluster can be
> associated with different NUMA nodes, which is irregular configuration
> because we shouldn't have this in baremetal environment. The irregular
> configuration causes Linux guest to misbehave, as the following warning
> messages indicate.
>
>   -smp 6,maxcpus=3D6,sockets=3D2,clusters=3D1,cores=3D3,threads=3D1 \
>   -numa node,nodeid=3D0,cpus=3D0-1,memdev=3Dram0                \
>   -numa node,nodeid=3D1,cpus=3D2-3,memdev=3Dram1                \
>   -numa node,nodeid=3D2,cpus=3D4-5,memdev=3Dram2                \
>
>   ------------[ cut here ]------------
>   WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_doma=
ins+0x284/0x910
>   Modules linked in:
>   CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>   pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>   pc : build_sched_domains+0x284/0x910
>   lr : build_sched_domains+0x184/0x910
>   sp : ffff80000804bd50
>   x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>   x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>   x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>   x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>   x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>   x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>   x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>   x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>   x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>   x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>   Call trace:
>    build_sched_domains+0x284/0x910
>    sched_init_domains+0xac/0xe0
>    sched_init_smp+0x48/0xc8
>    kernel_init_freeable+0x140/0x1ac
>    kernel_init+0x28/0x140
>    ret_from_fork+0x10/0x20
>
> Improve the situation to warn when multiple CPUs in one cluster have
> been associated with different NUMA nodes. However, one NUMA node is
> allowed to be associated with different clusters.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Acked-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/machine.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
>  include/hw/boards.h |  1 +
>  2 files changed, 43 insertions(+)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 45e3d24fdc..a2329f975d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1255,6 +1255,45 @@ static void machine_numa_finish_cpu_init(MachineSt=
ate *machine)
>      g_string_free(s, true);
>  }
>
> +static void validate_cpu_cluster_to_numa_boundary(MachineState *ms)
> +{
> +    MachineClass *mc =3D MACHINE_GET_CLASS(ms);
> +    NumaState *state =3D ms->numa_state;
> +    const CPUArchIdList *possible_cpus =3D mc->possible_cpu_arch_ids(ms)=
;
> +    const CPUArchId *cpus =3D possible_cpus->cpus;
> +    int i, j;
> +
> +    if (state->num_nodes <=3D 1 || possible_cpus->len <=3D 1) {
> +        return;
> +    }
> +
> +    /*
> +     * The Linux scheduling domain can't be parsed when the multiple CPU=
s
> +     * in one cluster have been associated with different NUMA nodes. Ho=
wever,
> +     * it's fine to associate one NUMA node with CPUs in different clust=
ers.
> +     */
> +    for (i =3D 0; i < possible_cpus->len; i++) {
> +        for (j =3D i + 1; j < possible_cpus->len; j++) {
> +            if (cpus[i].props.has_socket_id &&
> +                cpus[i].props.has_cluster_id &&
> +                cpus[i].props.has_node_id &&
> +                cpus[j].props.has_socket_id &&
> +                cpus[j].props.has_cluster_id &&
> +                cpus[j].props.has_node_id &&
> +                cpus[i].props.socket_id =3D=3D cpus[j].props.socket_id &=
&
> +                cpus[i].props.cluster_id =3D=3D cpus[j].props.cluster_id=
 &&
> +                cpus[i].props.node_id !=3D cpus[j].props.node_id) {
> +                warn_report("CPU-%d and CPU-%d in socket-%ld-cluster-%ld=
 "
> +                             "have been associated with node-%ld and nod=
e-%ld "
> +                             "respectively. It can cause OSes like Linux=
 to "
> +                             "misbehave", i, j, cpus[i].props.socket_id,
> +                             cpus[i].props.cluster_id, cpus[i].props.nod=
e_id,
> +                             cpus[j].props.node_id);
> +            }
> +        }
> +    }
> +}
> +
>  MemoryRegion *machine_consume_memdev(MachineState *machine,
>                                       HostMemoryBackend *backend)
>  {
> @@ -1340,6 +1379,9 @@ void machine_run_board_init(MachineState *machine, =
const char *mem_path, Error *
>          numa_complete_configuration(machine);
>          if (machine->numa_state->num_nodes) {
>              machine_numa_finish_cpu_init(machine);
> +            if (machine_class->cpu_cluster_has_numa_boundary) {
> +                validate_cpu_cluster_to_numa_boundary(machine);
> +            }
>          }
>      }
>
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 6fbbfd56c8..c9793b2789 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -273,6 +273,7 @@ struct MachineClass {
>      bool nvdimm_supported;
>      bool numa_mem_supported;
>      bool auto_enable_numa;
> +    bool cpu_cluster_has_numa_boundary;
>      SMPCompatProps smp_props;
>      const char *default_ram_id;
>
> --
> 2.23.0
>
>

