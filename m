Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nfGbY-00086a-5A
	for mharc-qemu-riscv@gnu.org; Fri, 15 Apr 2022 03:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nfGbS-000839-6Z; Fri, 15 Apr 2022 03:42:50 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:47056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nfGbP-0002cN-PA; Fri, 15 Apr 2022 03:42:49 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id B6A5C20780;
 Fri, 15 Apr 2022 07:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1650008562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Jf8CpUkmHiCcLo2+5odi8xqtOjKp0Qem77ayfImucw=;
 b=tA1+CUyZnAxtRVi+jC0SYCaq5asK5MQYTl2DRuZyn4iqhwFyGZEgg1PsCpPHW74ftP39/U
 HwW+V98hUnwOvD+qjaLk+JwaEQ+SBhRG26YneSF1oPgHZtuNKaywxYssbgnOJrEE63gGmZ
 NNG4X00FbIH3buR6Ru15jU8p4xOzqU0=
Message-ID: <7d1acb03-0a20-6641-16bf-198306c07c7b@greensocs.com>
Date: Fri, 15 Apr 2022 09:42:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 00/18] user-creatable cpu clusters
Content-Language: en-US-large
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 15 Apr 2022 07:42:52 -0000

Ping !

It would be nice to have some rough feedback about this series.
I plan to submit it in 2 sub-series (riscv-array in a separate part) but 
would like to know first if this direction looks ok to you ?

Note that I'm a bit confused by the terminology. Should a "cluster" as 
in "machine topology's cluster" be a 1-1 match with a gdb inferior ?

Thanks,
Damien

On 3/30/22 14:56, Damien Hedde wrote:
> Hi,
> 
> This series add devices to be able to user-create (coldplug) cpu
> clusters. The existing cpu cluster dictates how cpus are exposed
> in gdb, but it does not handle the cpu objects creation. This series
> adds a new device to handle both issues and adds support for two
> architectures: arm and riscv.
> 
> Please look at patches 2 and 3 for more details about the new device.
> 
> Last part concerning the riscv is rfc as I do non-backward compatible
> updates. I'm not sure what migration (or other) constraints we have
> on these machines and I probably need to make some changes to cope
> with them.
> 
> This series almost deprecates the cpu-cluster type as all uses
> but one are replaced.
> 
> It is organized as follows:
> 
> + Patches 1 to 7 adds a new base device to replace cpu-cluster
> 
> + Patches 8 and 9 adds an arm specific version and replace existing
>    clusters in the xlnx-zynqmp machine.
> 
> + patches 10 to 17 updates the riscv_array. It was already used to
>    create cpus but was not a cpu cluster.
> 
> Thanks for any comments,
> --
> Damien
> 
> Damien Hedde (18):
>    define MAX_CLUSTERS in cpu.h instead of cluster.h
>    hw/cpu/cpus: introduce _cpus_ device
>    hw/cpu/cpus: prepare to handle cpu clusters
>    hw/cpu/cluster: make _cpu-cluster_ a subclass of _cpus_
>    gdbstub: deal with _cpus_ object instead of _cpu-cluster_
>    hw/cpu/cluster: remove cluster_id now that gdbstub is updated
>    hw/cpu/cpus: add a common start-powered-off property
>    hw/arm/arm_cpus: add arm_cpus device
>    hw/arm/xlnx-zynqmp: convert cpu clusters to arm_cpus
>    hw/riscv/riscv_hart: prepare transition to cpus
>    hw/riscv: prepare riscv_hart transition to cpus
>    hw/riscv/virt: prepare riscv_hart transition to cpus
>    hw/riscv/spike: prepare riscv_hart transition to cpus
>    hw/riscv/riscv_hart: use cpus as base class
>    hw/riscv/sifive_u&microchip_pfsoc: apply riscv_hart_array update
>    hw/riscv: update remaining machines due to riscv_hart_array update
>    hw/riscv/riscv_hart: remove temporary features
>    add myself as reviewer of the newly added _cpus_
> 
>   include/hw/arm/arm_cpus.h          |  45 +++++++
>   include/hw/arm/xlnx-zynqmp.h       |   8 +-
>   include/hw/core/cpu.h              |   6 +
>   include/hw/cpu/cluster.h           |  26 ++--
>   include/hw/cpu/cpus.h              |  93 ++++++++++++++
>   include/hw/riscv/microchip_pfsoc.h |   2 -
>   include/hw/riscv/riscv_hart.h      |  25 +++-
>   include/hw/riscv/sifive_u.h        |   2 -
>   gdbstub.c                          |  12 +-
>   hw/arm/arm_cpus.c                  |  63 ++++++++++
>   hw/arm/xlnx-zynqmp.c               | 121 +++++++-----------
>   hw/cpu/cluster.c                   |  53 ++++----
>   hw/cpu/cpus.c                      | 195 +++++++++++++++++++++++++++++
>   hw/riscv/boot.c                    |   2 +-
>   hw/riscv/microchip_pfsoc.c         |  28 +----
>   hw/riscv/opentitan.c               |   4 +-
>   hw/riscv/riscv_hart.c              |  44 ++-----
>   hw/riscv/shakti_c.c                |   4 +-
>   hw/riscv/sifive_e.c                |   4 +-
>   hw/riscv/sifive_u.c                |  31 ++---
>   hw/riscv/spike.c                   |  18 +--
>   hw/riscv/virt.c                    |  79 +++++++-----
>   MAINTAINERS                        |   3 +
>   hw/arm/meson.build                 |   1 +
>   hw/cpu/meson.build                 |   2 +-
>   25 files changed, 612 insertions(+), 259 deletions(-)
>   create mode 100644 include/hw/arm/arm_cpus.h
>   create mode 100644 include/hw/cpu/cpus.h
>   create mode 100644 hw/arm/arm_cpus.c
>   create mode 100644 hw/cpu/cpus.c
> 

