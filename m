Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmv1X-0005o3-ME
	for mharc-qemu-riscv@gnu.org; Thu, 13 Apr 2023 07:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pmv1W-0005mD-2i
 for qemu-riscv@nongnu.org; Thu, 13 Apr 2023 07:21:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pmv1T-0006hy-Nz
 for qemu-riscv@nongnu.org; Thu, 13 Apr 2023 07:21:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681384910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZzPd5TqTR880GNrspfPIj9UQbcI/qgKnASU77rxoTeY=;
 b=jTnKQ8KgA3fPHL/Ua9y7kpFhSmJUnzYaao7IIfWgGJEMrVMboK9w34qAjnyeDQ7QYtFLyH
 DiDkFnUvS7dLKkMUnPo+zzXZEpV0z1PQd6jFuB/mqc3qrWoaCFfK/oi3FuMTREHH6/rH2O
 9YinL9gDAe9KPCDanaEEhzPoXds5tqU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-TqyR7eGjPAqbqpWQK6Udmg-1; Thu, 13 Apr 2023 07:21:49 -0400
X-MC-Unique: TqyR7eGjPAqbqpWQK6Udmg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a341efd9aso210558766b.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Apr 2023 04:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681384908; x=1683976908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZzPd5TqTR880GNrspfPIj9UQbcI/qgKnASU77rxoTeY=;
 b=b4Ly4mzdZ7HXN5IqDPcDzim3LCQ2/l+JYIfYNVbMRPGkDf9tKHzeuhGBonMw+iXrBd
 jHelIqYSWD1DKJztyUbMHhjpvaF6N5DsdIo+V063Gv965mKAPHJ8eqmi1JrXBT2wT1mi
 cUOg2sUXs9OrWf1m7+ER5Evkhau+AZbnI5PQ38rUVveja2B9csRa/h6FuGztr12Oghsc
 flVk34UDoRpOwuQlycCW3WCI8VvrnGao1tc7uIfJ1GFTekCepamXWyZtlButWe/6wtMs
 PPWJuILAkIdX2M/5R6QuSwPzbVdi5c2/j5Mv/IG0MBYqEkLoj0xp6LbTSOlXaI5uffjA
 BhSg==
X-Gm-Message-State: AAQBX9cAQ3RrFoMdKV8DywNtIhhMf8xQFykNd20B+Fb0L3hp40a04qx2
 XrivEXHW7GjEaVuwHsp0cu4HBHsGBiJUcmgxS3MK9QXdW6WmUOCWrSyUufl1IKR+VydDficRW6F
 krKnQLBww2fPw6a8=
X-Received: by 2002:aa7:cb50:0:b0:4fd:29e6:701b with SMTP id
 w16-20020aa7cb50000000b004fd29e6701bmr1839526edt.38.1681384908272; 
 Thu, 13 Apr 2023 04:21:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350aEMf4ok/8qATA+5GuSlwMzY7WmLFAJLBnggeDUwMpmPsYxUzfSYXcFHdm54W7M3vpPq/UrXw==
X-Received: by 2002:aa7:cb50:0:b0:4fd:29e6:701b with SMTP id
 w16-20020aa7cb50000000b004fd29e6701bmr1839505edt.38.1681384907897; 
 Thu, 13 Apr 2023 04:21:47 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 a26-20020a170906685a00b0094e09ceafc9sm842684ejs.44.2023.04.13.04.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 04:21:47 -0700 (PDT)
Date: Thu, 13 Apr 2023 13:21:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>, pbonzini@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 quic_llindhol@quicinc.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, thuth@redhat.com,
 lvivier@redhat.com, ajones@ventanamicro.com, berrange@redhat.com,
 dbarboza@ventanamicro.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH v4 0/3] NUMA: Apply cluster-NUMA-node boundary for
 aarch64 and riscv machines
Message-ID: <20230413132145.6f7ebadf@imammedo.users.ipa.redhat.com>
In-Reply-To: <e1bb85c9-88f0-f55f-118e-b38afd7da8b0@redhat.com>
References: <20230317062542.61061-1-gshan@redhat.com>
 <20230327152651.41f22ac0@imammedo.users.ipa.redhat.com>
 <3d1d2e5d-0202-ffa8-e07f-1cd7dc2ea3bf@redhat.com>
 <CAFEAcA8ERPiock5FiwdE021V0S_Bofz5UJtvBuet2EcK2bXfZw@mail.gmail.com>
 <e1bb85c9-88f0-f55f-118e-b38afd7da8b0@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 13 Apr 2023 11:21:54 -0000

On Thu, 13 Apr 2023 13:50:57 +0800
Gavin Shan <gshan@redhat.com> wrote:

> On 4/12/23 7:42 PM, Peter Maydell wrote:
> > On Wed, 12 Apr 2023 at 02:08, Gavin Shan <gshan@redhat.com> wrote:  
> >> On 3/27/23 9:26 PM, Igor Mammedov wrote:  
> >>> On Fri, 17 Mar 2023 14:25:39 +0800
> >>> Gavin Shan <gshan@redhat.com> wrote:
> >>>  
> >>>> For arm64 and riscv architecture, the driver (/base/arch_topology.c) is
> >>>> used to populate the CPU topology in the Linux guest. It's required that
> >>>> the CPUs in one cluster can't span mutiple NUMA nodes. Otherwise, the Linux
> >>>> scheduling domain can't be sorted out, as the following warning message
> >>>> indicates. To avoid the unexpected confusion, this series attempts to
> >>>> warn about such kind of irregular configurations.
> >>>>
> >>>>      -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
> >>>>      -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
> >>>>      -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
> >>>>      -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
> >>>>
> >>>>      ------------[ cut here ]------------
> >>>>      WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
> >>>>      Modules linked in:
> >>>>      CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
> >>>>      pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >>>>      pc : build_sched_domains+0x284/0x910
> >>>>      lr : build_sched_domains+0x184/0x910
> >>>>      sp : ffff80000804bd50
> >>>>      x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
> >>>>      x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
> >>>>      x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
> >>>>      x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
> >>>>      x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
> >>>>      x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
> >>>>      x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
> >>>>      x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
> >>>>      x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
> >>>>      x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
> >>>>      Call trace:
> >>>>       build_sched_domains+0x284/0x910
> >>>>       sched_init_domains+0xac/0xe0
> >>>>       sched_init_smp+0x48/0xc8
> >>>>       kernel_init_freeable+0x140/0x1ac
> >>>>       kernel_init+0x28/0x140
> >>>>       ret_from_fork+0x10/0x20
> >>>>
> >>>> PATCH[1] Warn about the irregular configuration if required
> >>>> PATCH[2] Enable the validation for aarch64 machines
> >>>> PATCH[3] Enable the validation for riscv machines
> >>>>
> >>>> v3: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg01226.html
> >>>> v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg01080.html
> >>>> v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00886.html
> >>>>
> >>>> Changelog
> >>>> =========
> >>>> v4:
> >>>>     * Pick r-b and ack-b from Daniel/Philippe                   (Gavin)
> >>>>     * Replace local variable @len with possible_cpus->len in
> >>>>       validate_cpu_cluster_to_numa_boundary()                   (Philippe)
> >>>> v3:
> >>>>     * Validate cluster-to-NUMA instead of socket-to-NUMA
> >>>>       boundary                                                  (Gavin)
> >>>>     * Move the switch from MachineState to MachineClass         (Philippe)
> >>>>     * Warning instead of rejecting the irregular configuration  (Daniel)
> >>>>     * Comments to mention cluster-to-NUMA is platform instead
> >>>>       of architectural choice                                   (Drew)
> >>>>     * Drop PATCH[v2 1/4] related to qtests/numa-test            (Gavin)
> >>>> v2:
> >>>>     * Fix socket-NUMA-node boundary issues in qtests/numa-test  (Gavin)
> >>>>     * Add helper set_numa_socket_boundary() and validate the
> >>>>       boundary in the generic path                              (Philippe)
> >>>>
> >>>> Gavin Shan (3):
> >>>>     numa: Validate cluster and NUMA node boundary if required
> >>>>     hw/arm: Validate cluster and NUMA node boundary
> >>>>     hw/riscv: Validate cluster and NUMA node boundary
> >>>>
> >>>>    hw/arm/sbsa-ref.c   |  2 ++
> >>>>    hw/arm/virt.c       |  2 ++
> >>>>    hw/core/machine.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
> >>>>    hw/riscv/spike.c    |  2 ++
> >>>>    hw/riscv/virt.c     |  2 ++
> >>>>    include/hw/boards.h |  1 +
> >>>>    6 files changed, 51 insertions(+)
> >>>>  
> >>>
> >>> Acked-by: Igor Mammedov <imammedo@redhat.com>
> >>>  
> >>
> >> Not sure if QEMU v8.0 is still available to integrate this series.
> >> Otherwise, it should be something for QEMU v8.1. By the way, I'm
> >> also uncertain who needs to be merge this series.  
> > 
> > It barely touches arm specific boards, so I'm assuming it will
> > be reviewed and taken by whoever handles hw/core/machine.c
> > 
> > And yes, 8.0 is nearly out the door, this is 8.1 stuff.
> >   
> 
> Indeed. In this case, it needs to be merged via 'Machine core' tree,
> which is being taken care by Eduardo Habkost or Marcel Apfelbaum.
> 
> Eduardo and  Marcel, could you please merge this to QEMU v8.1 when it's
> ready? Thanks in advance.

Lately it was Paolo who taking care of generic machine queue

> 
> Thanks,
> Gavin
> 


