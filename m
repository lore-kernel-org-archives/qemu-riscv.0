Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270A4C48BC3
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 20:07:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rcWOo-0005Ek-Do; Tue, 20 Feb 2024 15:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcWOm-0005C7-8t
 for qemu-riscv@nongnu.org; Tue, 20 Feb 2024 15:07:28 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcWOk-0005j8-1k
 for qemu-riscv@nongnu.org; Tue, 20 Feb 2024 15:07:28 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4125df3c40aso29365245e9.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Feb 2024 12:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708459644; x=1709064444; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k6QpmIrhO156cbOXHJUpDUKmevIjeRjpwIrR8hjtAbQ=;
 b=QjLJ220bx48Nle6rHkpzNuBsJY+7Vi/JMBxOCxXdIlEQcw2Jiw9zHYuU/TGnb4Yzqj
 fX9iE5GTK/tJiuYwCRIubWmLnyOYKEVkQzHgQyaRxUDuq92BHVnd4HB67Q8fzJp+IoHb
 lrsa+bOPsdQL3681KSiIGgs0E6gioSKQveACRD8cVB2oZ4pyYL6WHVXSPiVLyFkM190+
 ykiNbkeVxBIVd/jGVDIi+75ClQaqhtCJdJ1v+nUFtOIpTYDbB5HvY6iR1xVzXVjH03Gz
 op1uebjadVE4ZsX72/TkbKyfMwXwxG2oSfflMLzD6aOonU7ugAsT1VzsBj5dhlZM/y27
 D1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708459644; x=1709064444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k6QpmIrhO156cbOXHJUpDUKmevIjeRjpwIrR8hjtAbQ=;
 b=jtlxvCfsq0e3no98qIE14N/lUy1r/61+VUByg3RHntp4ks86hw+grm8LEqEaQ/S24x
 qn1X89QqrdOKM3uV4s9SrAccidHpl3flXNOLap0FuwwMtQKDuOuCMcLz/UPZpLyY81b/
 N/7TlQX0Oie7mJNmeFkucO3eISgk0ZPxD96DUz0WBiDbFg0jAjYlmtyV7oanv5Xi5HlE
 PcA7h38800cGsIXhnzxZOroFmR7vmnYDoCkKEwTlz7BPMZDMV9NZ2k6Sva1yOvZUFlcf
 rWqGYwaVrCICALJZizsf9+N9dRO78hdSlTtvY7B3LFoqY0ZidTrULZ8TPQgwQXonV6Af
 PvIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBvb0qeg8iDqDFtqQ5z+53vd3WVZREB4WWC5lEdmVq6lXUwib1AQj66nIziDozjl4SBAYDADy6EP2I6VjJ6Q2EcPAeq5Q=
X-Gm-Message-State: AOJu0YzSnZQc284yvZPjhK7lxeih3Vft6MGaGc9/EzLmD++PbY6sdDcm
 WnjJVgQxBbOZNvaZ6jFJt9ItbL47S+/nw/bIt5x/oIN3u6Q/M8WPk6l7A1My+EQ=
X-Google-Smtp-Source: AGHT+IEK4McQ9T2zv4lpqwKdXmWgKuJpwjl6tPduodUX7Bi2cOqfM4N4H1y3ia21UAyHWI4vOXM/4A==
X-Received: by 2002:a05:600c:3550:b0:412:6e2f:5f9c with SMTP id
 i16-20020a05600c355000b004126e2f5f9cmr2164615wmq.7.1708459644586; 
 Tue, 20 Feb 2024 12:07:24 -0800 (PST)
Received: from [192.168.69.100] (mek33-h02-176-184-23-7.dsl.sta.abo.bbox.fr.
 [176.184.23.7]) by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b004126f8c68eesm3020698wmo.3.2024.02.20.12.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 12:07:23 -0800 (PST)
Message-ID: <66cf4c35-5f19-4e5e-a0a1-adb1ab7cf8f4@linaro.org>
Date: Tue, 20 Feb 2024 21:07:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/8] Introduce SMP Cache Topology
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

+Igor

On 20/2/24 10:24, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> Hi list,
> 
> This's our proposal for supporting (SMP) cache topology in -smp as
> the following example:
> 
> -smp 32,sockets=2,dies=2,modules=2,cores=2,threads=2,maxcpus=32,\
>       l1d-cache=core,l1i-cache=core,l2-cache=core,l3-cache=die
> 
> With the new cache topology options ("l1d-cache", "l1i-cache",
> "l2-cache" and "l3-cache"), we could adjust the cache topology via -smp.
> 
> This patch set is rebased on our i386 module series:
> https://lore.kernel.org/qemu-devel/20240131101350.109512-1-zhao1.liu@linux.intel.com/
> 
> Since the ARM [1] and RISC-V [2] folks have similar needs for the cache
> topology, I also cc'd the ARM and RISC-V folks and lists.
> 
> 
> Welcome your feedback!
> 
> 
> Introduction
> ============
> 
> Background
> ----------
> 
> Intel client platforms (ADL/RPL/MTL) and E core server platforms (SRF)
> share the L2 cache domain among multiple E cores (in the same module).
> 
> Thus we need a way to adjust the cache topology so that users could
> create the cache topology for Guest that is nearly identical to Host.
> 
> This is necessary in cases where there are bound vCPUs, especially
> considering that Guest scheduling often takes into account the cache
> topology as well (e.g. Linux cluster aware scheduling, i.e. L2 cache
> scheduling).
> 
> Previously, we introduced a x86 specific option to adjust the cache
> topology:
> 
> -cpu x-l2-cache-topo=[core|module] [3]
> 
> However, considering the needs of other arches, we re-implemented the
> generic cache topology (aslo in response to Michael's [4] and Daniel's
> comment [5]) in this series.
> 
> 
> Cache Topology Representation
> -----------------------------
> 
> We consider to define the cache topology based on CPU topology level for
> two reasons:
> 
> 1. In practice, a cache will always be bound to the CPU container -
>     "CPU container" indicates to a set of CPUs that refer to a certain
>     level of CPU topology - where the cache is either private in that
>     CPU container or shared among multiple containers.
> 
> 2. The x86's cache-related CPUIDs encode cache topology based on APIC
>     ID's CPU topology layout. And the ACPI PPTT table that ARM/RISCV
>     relies on also requires CPU containers (CPU topology) to help
>     indicate the private shared hierarchy of the cache.
> 
> Therefore, for SMP systems, it is natural to use the CPU topology
> hierarchy directly in QEMU to define the cache topology.
> 
> And currently, separated L1 cache (L1 data cache and L1 instruction
> cache) with unified higher-level caches (e.g., unified L2 and L3
> caches), is the most common cache architectures.
> 
> Thus, we define the topology for L1 D-cache, L1 I-cache, L2 cache and L3
> cache in MachineState as the basic cache topology support:
> 
> typedef struct CacheTopology {
>      CPUTopoLevel l1d;
>      CPUTopoLevel l1i;
>      CPUTopoLevel l2;
>      CPUTopoLevel l3;
> } CacheTopology;
> 
> Machines may also only support a subset of the cache topology
> to be configured in -smp by setting the SMP property of MachineClass:
> 
> typedef struct {
>      ...
>      bool l1_separated_cache_supported;
>      bool l2_unified_cache_supported;
>      bool l3_unified_cache_supported;
> } SMPCompatProps;
> 
> 
> Cache Topology Configuration in -smp
> ------------------------------------
> 
> Further, we add new parameters to -smp:
> * l1d-cache=level
> * l1i-cache=level
> * l2-cache=level
> * l3-cache=level
> 
> These cache topology parameters accept the strings of CPU topology
> levels (such as "drawer", "book", "socket", "die", "cluster", "module",
> "core" or "thread"). Exactly which topology level strings could be
> accepted as the parameter depends on the machine's support for the
> corresponding CPU topology level.
> 
> Unsupported cache topology parameters will be omitted, and
> correspondingly, the target CPU's cache topology will use the its
> default cache topology setting.
> 
> In this series, we add the cache topology support in -smp for x86 PC
> machine.
> 
> The following example defines a 3-level cache topology hierarchy (L1
> D-cache per core, L1 I-cache per core, L2 cache per core and L3 cache per
> die) for PC machine.
> 
> -smp 32,sockets=2,dies=2,modules=2,cores=2,threads=2,maxcpus=32,\
>       l1d-cache=core,l1i-cache=core,l2-cache=core,l3-cache=die
> 
> 
> Reference
> ---------
> 
> [1]: [ARM] Jonathan's proposal to adjust cache topology:
>       https://lore.kernel.org/qemu-devel/20230808115713.2613-2-Jonathan.Cameron@huawei.com/
> [2]: [RISC-V] Discussion between JeeHeng and Jonathan about cache
>       topology:
>       https://lore.kernel.org/qemu-devel/20240131155336.000068d1@Huawei.com/
> [3]: Previous x86 specific cache topology option:
>       https://lore.kernel.org/qemu-devel/20230914072159.1177582-22-zhao1.liu@linux.intel.com/
> [4]: Michael's comment about generic cache topology support:
>       https://lore.kernel.org/qemu-devel/20231003085516-mutt-send-email-mst@kernel.org/
> [5]: Daniel's question about how x86 support L2 cache domain (cluster)
>       configuration:
>       https://lore.kernel.org/qemu-devel/ZcUG0Uc8KylEQhUW@redhat.com/
> 
> Thanks and Best Regards,
> Zhao
> 
> ---
> Zhao Liu (8):
>    hw/core: Rename CpuTopology to CPUTopology
>    hw/core: Move CPU topology enumeration into arch-agnostic file
>    hw/core: Define cache topology for machine
>    hw/core: Add cache topology options in -smp
>    i386/cpu: Support thread and module level cache topology
>    i386/cpu: Update cache topology with machine's configuration
>    i386/pc: Support cache topology in -smp for PC machine
>    qemu-options: Add the cache topology description of -smp
> 
>   MAINTAINERS                     |   2 +
>   hw/core/cpu-topology.c          |  56 ++++++++++++++
>   hw/core/machine-smp.c           | 128 ++++++++++++++++++++++++++++++++
>   hw/core/machine.c               |   9 +++
>   hw/core/meson.build             |   1 +
>   hw/i386/pc.c                    |   3 +
>   hw/s390x/cpu-topology.c         |   6 +-
>   include/hw/boards.h             |  33 +++++++-
>   include/hw/core/cpu-topology.h  |  40 ++++++++++
>   include/hw/i386/topology.h      |  18 +----
>   include/hw/s390x/cpu-topology.h |   6 +-
>   qapi/machine.json               |  14 +++-
>   qemu-options.hx                 |  54 ++++++++++++--
>   system/vl.c                     |  15 ++++
>   target/i386/cpu.c               |  55 ++++++++++----
>   target/i386/cpu.h               |   2 +-
>   tests/unit/meson.build          |   3 +-
>   tests/unit/test-smp-parse.c     |  14 ++--
>   18 files changed, 399 insertions(+), 60 deletions(-)
>   create mode 100644 hw/core/cpu-topology.c
>   create mode 100644 include/hw/core/cpu-topology.h
> 


