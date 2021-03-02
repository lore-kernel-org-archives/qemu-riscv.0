Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lH4FQ-0005Bt-Vl
	for mharc-qemu-riscv@gnu.org; Tue, 02 Mar 2021 07:35:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lH4FO-00057i-E0; Tue, 02 Mar 2021 07:35:30 -0500
Received: from mx2.suse.de ([195.135.220.15]:52054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lH4FM-00020h-Mz; Tue, 02 Mar 2021 07:35:30 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27636AE74;
 Tue,  2 Mar 2021 12:35:26 +0000 (UTC)
Subject: Re: [PATCH v2 00/17] cpu: Introduce SysemuCPUOps structure
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>, Anthony Green <green@moxielogic.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Marek Vasut <marex@denx.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-s390x@nongnu.org,
 Chris Wulff <crwulff@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Michael Walle <michael@walle.cc>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20210301215110.772346-1-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <29e766d5-b17e-41be-e732-67f829917870@suse.de>
Date: Tue, 2 Mar 2021 13:35:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210301215110.772346-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 02 Mar 2021 12:35:31 -0000


On 3/1/21 10:50 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series is inspired on Claudio TCG work.
> 
> Instead of separate TCG from other accelerators, here we
> separate sysemu operations (system VS user).
> 
> Patches 1-6 are generic cleanups.
> Patches 7-15 move from CPUClass to SysemuCPUOps
> Patches 16-17 restrict SysemuCPUOps to sysemu
> 
> Since v1:
> - Name 'sysemu' (Claudio)
> - change each field progressively (Richard)
> 
> Regards,
> 
> Phil.

Very cool overall, and it all LGTM,

with the exception of patch 16.

Ciao,

Claudio

> 
> Supersedes: <20210226163227.4097950-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (17):
>   target: Set CPUClass::vmsd instead of DeviceClass::vmsd
>   cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_from_attrs
>   cpu: Introduce cpu_virtio_is_big_endian()
>   cpu: Directly use cpu_write_elf*() fallback handlers in place
>   cpu: Directly use get_paging_enabled() fallback handlers in place
>   cpu: Directly use get_memory_mapping() fallback handlers in place
>   cpu: Introduce SysemuCPUOps structure
>   cpu: Move CPUClass::vmsd to SysemuCPUOps
>   cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOps
>   cpu: Move CPUClass::get_crash_info to SysemuCPUOps
>   cpu: Move CPUClass::write_elf* to SysemuCPUOps
>   cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps
>   cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps
>   cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps
>   cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps
>   cpu: Restrict cpu_paging_enabled / cpu_get_memory_mapping to sysemu
>   cpu: Restrict "hw/core/sysemu-cpu-ops.h" to target/cpu.c
> 
>  include/hw/core/cpu.h            |  91 ++++++-------------------
>  include/hw/core/sysemu-cpu-ops.h |  89 ++++++++++++++++++++++++
>  cpu.c                            |  19 +++---
>  hw/core/cpu.c                    | 113 +++++++++++++++++--------------
>  hw/virtio/virtio.c               |   4 +-
>  target/alpha/cpu.c               |  11 ++-
>  target/arm/cpu.c                 |  19 ++++--
>  target/avr/cpu.c                 |   9 ++-
>  target/cris/cpu.c                |  11 ++-
>  target/hppa/cpu.c                |  11 ++-
>  target/i386/cpu.c                |  29 +++++---
>  target/lm32/cpu.c                |  10 ++-
>  target/m68k/cpu.c                |  11 ++-
>  target/microblaze/cpu.c          |  11 ++-
>  target/mips/cpu.c                |  11 ++-
>  target/moxie/cpu.c               |  11 +--
>  target/nios2/cpu.c               |  16 ++++-
>  target/openrisc/cpu.c            |  11 ++-
>  target/riscv/cpu.c               |  13 +++-
>  target/rx/cpu.c                  |  17 ++++-
>  target/s390x/cpu.c               |  15 ++--
>  target/sh4/cpu.c                 |  11 ++-
>  target/sparc/cpu.c               |  11 ++-
>  target/tricore/cpu.c             |  14 +++-
>  target/unicore32/cpu.c           |   8 ++-
>  target/xtensa/cpu.c              |  11 ++-
>  target/ppc/translate_init.c.inc  |  21 +++---
>  27 files changed, 409 insertions(+), 199 deletions(-)
>  create mode 100644 include/hw/core/sysemu-cpu-ops.h
> 


