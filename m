Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVAfF-0007Y5-5e
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 07:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pVAf4-000783-UC
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 07:25:24 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pVAf2-0004JZ-GR
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 07:25:22 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so359055wmb.5
 for <qemu-riscv@nongnu.org>; Thu, 23 Feb 2023 04:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ncC5ooy40CC39l8bHyxplq7KILeASe2yLT2R4a0BRCg=;
 b=FaOIVFeqVHhIVI/G7Zd9ifDd9MZq+3+jb/8y4tq5cZx4MCEMG+XUSkhWJ3HO3W7RNI
 bSXgJ0pLw3JVaIBVwA3XYmQTtzeLl3csQMOC4tLP1/cvF1QbRWMXX94GmBrlg+r9QQKP
 fw9oTyTiFxLAhXFOw00+XjHhqB9BsPIrmn/kLk/u/iIyHrYt3/WtXo8fc/s8VFl89Qxn
 3TWfTT6PNmWUjrfnANW9M9vgpMljlX3NAZDxf4XP/qt4RH8pmbdRenrouQ0gSzh2B1TM
 tJV7zLFOy5Bn1l3nyJxhJQEot3cvGiWSkAp6mTf022wu8KKykmivSOv4+IN54K2mBUAL
 bW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ncC5ooy40CC39l8bHyxplq7KILeASe2yLT2R4a0BRCg=;
 b=SCNhh94J7zMwVcgE6ZasI9EjbauLt3IFX5Fn1i8btDHj541LH31Pec6Ig4OI7HMLHN
 Hqf4hGIE/iuTcICSx/HHoAdF/PYwU/iQh0Mj/eTeLrGoxItsWIjqRRI5L1UCCNLnOg59
 LmhP8l2XYlwSe9yarNDQJHh3wftLLn9WquL9A6XeUgR91bHO77bHq5Mm5cIcD81Ayob+
 Qq1IZaAmdnz9mw1NU7/PnwdseBGPWX6+O9UzJ4CBS/efR9gCFdRQS91zEpRXbq+oeYIE
 NnQTGlAYYMBkppQ2r+XNrLWyaNcJ/2TcEBnj3Cmsg2Q6tjqmI+/jAwyQYGyugFeiKcD+
 qoMw==
X-Gm-Message-State: AO0yUKVCDvFcVEyn4ekVIowQyZbo5iOl2IcUdi9VK3msqgzTtjhn1U/b
 0ytfVBGsS7GWev1qf+ji3UL8XQ==
X-Google-Smtp-Source: AK7set9QEakASpM8Iz8TcCBrmhkkh/KXrMSmw6K8IJKMsCBeUdERxmCvHfBo8NzmM/0qkZglMbwn9g==
X-Received: by 2002:a05:600c:201:b0:3ea:d601:976f with SMTP id
 1-20020a05600c020100b003ead601976fmr153919wmi.23.1677155117215; 
 Thu, 23 Feb 2023 04:25:17 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c42c700b003db012d49b7sm5399139wme.2.2023.02.23.04.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:25:16 -0800 (PST)
Date: Thu, 23 Feb 2023 13:25:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 rad@semihalf.com, peter.maydell@linaro.org,
 quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 yihyu@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH v2 0/4] NUMA: Apply socket-NUMA-node boundary for aarch64
 and RiscV machines
Message-ID: <20230223122515.mzsubkwv3mgrcvhl@orel>
References: <20230223081401.248835-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223081401.248835-1-gshan@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 23 Feb 2023 12:25:30 -0000

On Thu, Feb 23, 2023 at 04:13:57PM +0800, Gavin Shan wrote:
> For arm64 and RiscV architecture, the driver (/base/arch_topology.c) is
> used to populate the CPU topology in the Linux guest. It's required that
> the CPUs in one socket can't span mutiple NUMA nodes. Otherwise, the Linux
> scheduling domain can't be sorted out, as the following warning message
> indicates. To avoid the unexpected confusion, this series attempts to
> rejects such kind of insane configurations.

Hi Gavin,

I'm not sure 'insane' is the right word, maybe 'irregular'. I've never
seen, and don't really expect to find, specifications stating that arm
and/or riscv must have 1:1 mappings for numa nodes and sockets. But, as
QEMU machine types can choose certain configurations to support, if
everyone is in agreement to restrict sbsa-ref and arm/riscv virt to 1:1
mappings, then why not. However, I suggest stating that this is simply a
choice being made for these boards, since the expectation of needing
"irregular" configurations is low. We should not be trying to use Linux
assumptions as rationale, since other OSes may cope better with irregular
configurations.

Also, I suggest adding a comment to the boards, which adopt this
restriction, which explains that it's only a platform choice, not
something specified by the architecture.

Thanks,
drew

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
>   * Fix socket-NUMA-node boundary issues in qtests/numa-test  (Gavin)
>   * Add helper set_numa_socket_boundary() and validate the
>     boundary in the generic path                              (Philippe)
> 
> Gavin Shan (4):
>   qtest/numa-test: Follow socket-NUMA-node boundary for aarch64
>   numa: Validate socket and NUMA node boundary if required
>   hw/arm: Validate socket and NUMA node boundary
>   hw/riscv: Validate socket and NUMA node boundary
> 
>  hw/arm/sbsa-ref.c       |  2 ++
>  hw/arm/virt.c           |  2 ++
>  hw/core/machine.c       | 34 ++++++++++++++++++++++++++++++++++
>  hw/core/numa.c          |  7 +++++++
>  hw/riscv/spike.c        |  1 +
>  hw/riscv/virt.c         |  1 +
>  include/sysemu/numa.h   |  4 ++++
>  tests/qtest/numa-test.c | 13 ++++++++++---
>  8 files changed, 61 insertions(+), 3 deletions(-)
> 
> -- 
> 2.23.0
> 
> 

