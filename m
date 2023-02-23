Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVBVA-0007dI-FL
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 08:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVBV7-0007Ws-GJ
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 08:19:11 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVBV3-00077Y-AD
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 08:19:08 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 v1-20020a9d6041000000b0068d4a8a8d2dso2274581otj.12
 for <qemu-riscv@nongnu.org>; Thu, 23 Feb 2023 05:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sMRsPnOqXIfsHumeg62yfqXE5GIZUf9e0d/Tu/JBZVQ=;
 b=Eryxm0HNsASqxRxVvo7FiNM6nPf4BJSLdAogNxK1qgvxFAEU6QmEnZpnOtySEuAcq4
 V6Xo3sqP3esT5/T+p42VrjakmCqDdDgqNNmuCSxFeLMuZwcM0lhP3cqRQCXpylCFT0I7
 1Klaqrb5niFt8FEg1AIBFV6GmRexyomzkLAPKY48ObZDgN9xIZtyWxN+5o3VsKl7qoee
 v1HxHdrDPrNlj60xEKJpR1DNqr/PlfjZpwLMLM46A/dMaf/1OgAOMO9IaAYw6U0s8rp9
 809madeC/YdVSAOJseAgYJmjWJq1Trwe5+i7TAjPtHrdlWRukE9J/EZoy7jHHB0vm/ls
 DaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sMRsPnOqXIfsHumeg62yfqXE5GIZUf9e0d/Tu/JBZVQ=;
 b=Gcxe4zb6QdEP8I32iNdEKG1+ed1RQIk5R+HRcaoQ4NVMtd3upNFLjIGpmcIaAa6iPd
 AeGSYjq/XVVSTKo0ShZ8I6oXLaqUkefuYooUTxdFiLraRwkWfVHbvJ7rcpOfTReGA3xb
 /b0ixr/qMZAyhR24ey3zxucD3WDMTqqZSi9pdvDXmALcbruYfG7gGrR+QnijA73uYqTM
 L2SEGfIfFX0jkcNchxScTLKMjnAQrfMwGyF3HOzBKFD0zEU6olVorb3RZ0zrbXwFexIF
 D/tmtwQHanWW+3kFGFgb+SMdqAvIhEYprQgO00UNi7xBIDckE64GL5Sapz86/MDvy6I8
 XmqA==
X-Gm-Message-State: AO0yUKW68KqKDM6T78L1QY1OiqDu5FlySjLS3HY+uzXEtY8qjlXB1aHZ
 bwRu8YKClSFxytEtJMD8QIpqNQ==
X-Google-Smtp-Source: AK7set+DN32O1uWoQWVUbcUUg32qIUetcOzUNxtU2JtfBB9K7M4bjTnZiH5SPuFXJS3SR9XY9sOm5g==
X-Received: by 2002:a05:6830:2b09:b0:68b:d03b:5105 with SMTP id
 l9-20020a0568302b0900b0068bd03b5105mr8596145otv.8.1677158343118; 
 Thu, 23 Feb 2023 05:19:03 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 r21-20020a9d7cd5000000b0068bce6239a3sm2231852otn.38.2023.02.23.05.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 05:19:02 -0800 (PST)
Message-ID: <2d37d157-12a1-07aa-4c70-974ac1503283@ventanamicro.com>
Date: Thu, 23 Feb 2023 10:18:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 0/4] NUMA: Apply socket-NUMA-node boundary for aarch64
 and RiscV machines
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, shan.gavin@gmail.com
References: <20230223081401.248835-1-gshan@redhat.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230223081401.248835-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 23 Feb 2023 13:19:11 -0000



On 2/23/23 05:13, Gavin Shan wrote:
> For arm64 and RiscV architecture, the driver (/base/arch_topology.c) is
> used to populate the CPU topology in the Linux guest. It's required that
> the CPUs in one socket can't span mutiple NUMA nodes. Otherwise, the Linux
> scheduling domain can't be sorted out, as the following warning message
> indicates. To avoid the unexpected confusion, this series attempts to
> rejects such kind of insane configurations.
> 
>     -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>     -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>     -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>     -numa node,nodeid=2,cpus=4-5,memdev=ram2                \


And why is this a QEMU problem? This doesn't hurt ACPI.

Also, this restriction impacts breaks ARM guests in the wild that are running
non-Linux OSes. I don't see why we should impact use cases that has nothing to
do with Linux Kernel feelings about sockets - NUMA nodes exclusivity.


Thanks,


Daniel


>   
>     ------------[ cut here ]------------
>     WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
>     Modules linked in:
>     CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>     pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>     pc : build_sched_domains+0x284/0x910
>     lr : build_sched_domains+0x184/0x910
>     sp : ffff80000804bd50
>     x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>     x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>     x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>     x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>     x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>     x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>     x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>     x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>     x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>     x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>     Call trace:
>      build_sched_domains+0x284/0x910
>      sched_init_domains+0xac/0xe0
>      sched_init_smp+0x48/0xc8
>      kernel_init_freeable+0x140/0x1ac
>      kernel_init+0x28/0x140
>      ret_from_fork+0x10/0x20
> 
> PATCH[1] Improves numa/test for aarch64 to follow socket-to-NUMA-node boundary
> PATCH[2] Validate the configuration if required in the NUMA subsystem
> PATCH[3] Enable the validation for aarch64 machines
> PATCH[4] Enable the validation for RiscV machines
> 
> v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00886.html
> 
> Changelog
> =========
> v2:
>    * Fix socket-NUMA-node boundary issues in qtests/numa-test  (Gavin)
>    * Add helper set_numa_socket_boundary() and validate the
>      boundary in the generic path                              (Philippe)
> 
> Gavin Shan (4):
>    qtest/numa-test: Follow socket-NUMA-node boundary for aarch64
>    numa: Validate socket and NUMA node boundary if required
>    hw/arm: Validate socket and NUMA node boundary
>    hw/riscv: Validate socket and NUMA node boundary
> 
>   hw/arm/sbsa-ref.c       |  2 ++
>   hw/arm/virt.c           |  2 ++
>   hw/core/machine.c       | 34 ++++++++++++++++++++++++++++++++++
>   hw/core/numa.c          |  7 +++++++
>   hw/riscv/spike.c        |  1 +
>   hw/riscv/virt.c         |  1 +
>   include/sysemu/numa.h   |  4 ++++
>   tests/qtest/numa-test.c | 13 ++++++++++---
>   8 files changed, 61 insertions(+), 3 deletions(-)
> 

