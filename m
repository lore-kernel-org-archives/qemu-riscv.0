Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYsT-0004Ev-1C
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmYsO-0004C8-I8
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:02 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmYsM-0002DI-Av
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:42:59 -0400
Received: by mail-ej1-x632.google.com with SMTP id sg7so39424120ejc.9
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299776; x=1683891776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C6M6pRb58IuoUywtweKZxLLDLEkIyNdspMsGgEFg5KY=;
 b=ChSQF2LrhdNBbECf7uJXKOi1glxV0h6M80SOXvzXIQtII1/0A863PfMlgHUQa6tTvP
 Uie2htWC1jYk2e++k8F3vlW/FdSdfjatDEQpoFFK9yVblH+Tzewcyr2C701YbKhDshe9
 Ko5J6VRURedygi728EGq3sskk4b1jKALkgrjx+hs2UdtQJC4pjHHVy1W777KPKctVYSY
 Z6vdm0IJ7p7s1b+SQwyV/dV6SgwXj9CRiQdNVjdGBa1P659//Dpnt3Vb+dpQo4AE+6Fi
 qQe/d5INjyGMtZl3nCXAjzul91GiPYW02N224TGYH9CIIuUZFpkGK0xot8juIA+BW1FT
 +SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299776; x=1683891776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C6M6pRb58IuoUywtweKZxLLDLEkIyNdspMsGgEFg5KY=;
 b=PDfwgcd1i3cCOicGZoqBYcXkjovWdG30IFHnTbdX3xu8qiB/IB0a1tW0iV/gJ0X/mW
 aV9ZuO/seYuR/85o0gC03OBi/oG1HxY0YwbSK3RBeQvx43LKz7ly/uvV6zmWQYE3m/Ss
 2Q0fw3Cz5cZ3Qx5QKv5ViBAHvH2s1NmjVGFcATfYp2HlRzDK+gj5To3ToEvqHG6r+eIQ
 rWqk/Rt3qUZVMPuIb+u6obbz31qkuYNF3Th1pZCZKwJGdgYddsmmf2BzAeGz6Ouqym2K
 HuGtzibxodnkQR46iGVEE/gJfhHM4NluBjeB/zxTR50nNksQzdahY2kOAVMlBgrpiSMJ
 ZrBw==
X-Gm-Message-State: AAQBX9cwf4YsS+xUyWEemXNJ8GTLQnxsOxWMwQSBOxC8lTFIzEwcfBBl
 bDqj4Q1QFbo5avtFl7TdStob0v/DYNsI549y7Qtejg==
X-Google-Smtp-Source: AKy350YzWpW1dBu5IBgwo9Eex4sLOPJjl0a7CHTl2F5cuikZ9M01acpdJyOmIAVQRuIj7uuvA5aZUrt6Sd7syg7m1HI=
X-Received: by 2002:a17:906:b301:b0:930:90ce:a1a6 with SMTP id
 n1-20020a170906b30100b0093090cea1a6mr6054240ejz.6.1681299776281; Wed, 12 Apr
 2023 04:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230317062542.61061-1-gshan@redhat.com>
 <20230327152651.41f22ac0@imammedo.users.ipa.redhat.com>
 <3d1d2e5d-0202-ffa8-e07f-1cd7dc2ea3bf@redhat.com>
In-Reply-To: <3d1d2e5d-0202-ffa8-e07f-1cd7dc2ea3bf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 12:42:45 +0100
Message-ID: <CAFEAcA8ERPiock5FiwdE021V0S_Bofz5UJtvBuet2EcK2bXfZw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] NUMA: Apply cluster-NUMA-node boundary for aarch64
 and riscv machines
To: Gavin Shan <gshan@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, rad@semihalf.com, quic_llindhol@quicinc.com, 
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, thuth@redhat.com, lvivier@redhat.com, 
 pbonzini@redhat.com, ajones@ventanamicro.com, berrange@redhat.com, 
 dbarboza@ventanamicro.com, yihyu@redhat.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 12 Apr 2023 11:43:02 -0000

On Wed, 12 Apr 2023 at 02:08, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Peter,
>
> On 3/27/23 9:26 PM, Igor Mammedov wrote:
> > On Fri, 17 Mar 2023 14:25:39 +0800
> > Gavin Shan <gshan@redhat.com> wrote:
> >
> >> For arm64 and riscv architecture, the driver (/base/arch_topology.c) is
> >> used to populate the CPU topology in the Linux guest. It's required that
> >> the CPUs in one cluster can't span mutiple NUMA nodes. Otherwise, the Linux
> >> scheduling domain can't be sorted out, as the following warning message
> >> indicates. To avoid the unexpected confusion, this series attempts to
> >> warn about such kind of irregular configurations.
> >>
> >>     -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
> >>     -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
> >>     -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
> >>     -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
> >>
> >>     ------------[ cut here ]------------
> >>     WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
> >>     Modules linked in:
> >>     CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
> >>     pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >>     pc : build_sched_domains+0x284/0x910
> >>     lr : build_sched_domains+0x184/0x910
> >>     sp : ffff80000804bd50
> >>     x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
> >>     x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
> >>     x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
> >>     x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
> >>     x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
> >>     x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
> >>     x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
> >>     x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
> >>     x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
> >>     x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
> >>     Call trace:
> >>      build_sched_domains+0x284/0x910
> >>      sched_init_domains+0xac/0xe0
> >>      sched_init_smp+0x48/0xc8
> >>      kernel_init_freeable+0x140/0x1ac
> >>      kernel_init+0x28/0x140
> >>      ret_from_fork+0x10/0x20
> >>
> >> PATCH[1] Warn about the irregular configuration if required
> >> PATCH[2] Enable the validation for aarch64 machines
> >> PATCH[3] Enable the validation for riscv machines
> >>
> >> v3: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg01226.html
> >> v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg01080.html
> >> v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00886.html
> >>
> >> Changelog
> >> =========
> >> v4:
> >>    * Pick r-b and ack-b from Daniel/Philippe                   (Gavin)
> >>    * Replace local variable @len with possible_cpus->len in
> >>      validate_cpu_cluster_to_numa_boundary()                   (Philippe)
> >> v3:
> >>    * Validate cluster-to-NUMA instead of socket-to-NUMA
> >>      boundary                                                  (Gavin)
> >>    * Move the switch from MachineState to MachineClass         (Philippe)
> >>    * Warning instead of rejecting the irregular configuration  (Daniel)
> >>    * Comments to mention cluster-to-NUMA is platform instead
> >>      of architectural choice                                   (Drew)
> >>    * Drop PATCH[v2 1/4] related to qtests/numa-test            (Gavin)
> >> v2:
> >>    * Fix socket-NUMA-node boundary issues in qtests/numa-test  (Gavin)
> >>    * Add helper set_numa_socket_boundary() and validate the
> >>      boundary in the generic path                              (Philippe)
> >>
> >> Gavin Shan (3):
> >>    numa: Validate cluster and NUMA node boundary if required
> >>    hw/arm: Validate cluster and NUMA node boundary
> >>    hw/riscv: Validate cluster and NUMA node boundary
> >>
> >>   hw/arm/sbsa-ref.c   |  2 ++
> >>   hw/arm/virt.c       |  2 ++
> >>   hw/core/machine.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
> >>   hw/riscv/spike.c    |  2 ++
> >>   hw/riscv/virt.c     |  2 ++
> >>   include/hw/boards.h |  1 +
> >>   6 files changed, 51 insertions(+)
> >>
> >
> > Acked-by: Igor Mammedov <imammedo@redhat.com>
> >
>
> Not sure if QEMU v8.0 is still available to integrate this series.
> Otherwise, it should be something for QEMU v8.1. By the way, I'm
> also uncertain who needs to be merge this series.

It barely touches arm specific boards, so I'm assuming it will
be reviewed and taken by whoever handles hw/core/machine.c

And yes, 8.0 is nearly out the door, this is 8.1 stuff.

thanks
-- PMM

