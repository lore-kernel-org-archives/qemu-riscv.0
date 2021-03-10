Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJyv7-0001wE-8I
	for mharc-qemu-riscv@gnu.org; Wed, 10 Mar 2021 08:30:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJyuz-0001tE-JN; Wed, 10 Mar 2021 08:30:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:50882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJyuv-0007hK-BS; Wed, 10 Mar 2021 08:30:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 004AFAD72;
 Wed, 10 Mar 2021 13:30:18 +0000 (UTC)
Subject: Re: [PATCH 00/10] target: Provide target-specific Kconfig
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sarah Harris
 <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
References: <20210131111316.232778-1-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <2eca1e78-073f-ae5d-6f82-73f4d21c4e72@suse.de>
Date: Wed, 10 Mar 2021 14:30:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
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
X-List-Received-Date: Wed, 10 Mar 2021 13:30:30 -0000

Hi all, where are we with this series?

I am trying to figure out how to apply the whole thing,
in order to build only compatible ARM boards and devices for KVM-only builds.

Ie, I would like to combine this with:

"arm cleanup experiment for kvm-only build"

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg02790.html

My series there gets us to a buildable and working KVM-only ARM target, with all make check tests passing.

However, in order to be able to remove more code, remove stubs etc,
I found the presence of incompatible ARM boards and devices as blocking additional cleanups.

Therefore, in order to proceed with additional cleanup in arm, and adding the accel-specific extensions to the cpu class,
I see being able to disable incompatible boards for KVM as necessary.

IIUC there are:

* This series "target: Provide target-specific Kconfig"
* Support disabling TCG on ARM ?
* Support disabling TCG on ARM (part 2) ?

What is the current state here?

Thanks,

Claudio


On 1/31/21 12:13 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series add a Kconfig file to each target, allowing
> to select target-specific features there, instead of from
> the hardware Kconfig.
> 
> This simplifies managing multi-arch features such semihosting.
> 
> Series organization:
> 
> 1/ Some targets use the architecture symbol to select boards and
> peripherals (SH4 and LM32), we need to clean that first.
> 
> 2/ Introduce empty target Kconfig, update meson.
> 
> 3/ Move architectural features out of hardware:
>    - x86 SEV
>    - ARM v7m
>    - generic semihosting
> 
> [following only important to patchew, unrelated to this series]
> Based-on: <20210131105918.228787-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (10):
>   hw/sh4/Kconfig: Rename CONFIG_SH4 -> CONFIG_SH4_PERIPHERALS
>   hw/lm32/Kconfig: Introduce CONFIG_LM32_EVR for lm32-evr/uclinux boards
>   hw/sh4/Kconfig: Rename CONFIG_LM32 -> CONFIG_LM32_PERIPHERALS
>   hw/lm32/Kconfig: Have MILKYMIST select LM32_PERIPHERALS
>   meson: Introduce target-specific Kconfig
>   target/i386: Move SEV feature to target Kconfig
>   target/arm: Move V7M feature to target Kconfig
>   default-configs: Remove unnecessary SEMIHOSTING selection
>   target: Move ARM_COMPATIBLE_SEMIHOSTING feature to target Kconfig
>   target: Move SEMIHOSTING feature to target Kconfig
> 
>  default-configs/devices/arm-softmmu.mak       |  2 --
>  default-configs/devices/lm32-softmmu.mak      |  4 +---
>  default-configs/devices/m68k-softmmu.mak      |  2 --
>  .../devices/mips-softmmu-common.mak           |  3 ---
>  default-configs/devices/nios2-softmmu.mak     |  2 --
>  default-configs/devices/riscv32-softmmu.mak   |  2 --
>  default-configs/devices/riscv64-softmmu.mak   |  2 --
>  default-configs/devices/unicore32-softmmu.mak |  1 -
>  default-configs/devices/xtensa-softmmu.mak    |  2 --
>  meson.build                                   |  3 ++-
>  Kconfig                                       |  1 +
>  hw/arm/Kconfig                                |  4 ----
>  hw/block/meson.build                          |  2 +-
>  hw/char/meson.build                           |  6 ++---
>  hw/i386/Kconfig                               |  4 ----
>  hw/intc/meson.build                           |  4 ++--
>  hw/lm32/Kconfig                               | 10 +++++---
>  hw/lm32/meson.build                           |  2 +-
>  hw/sh4/Kconfig                                |  6 ++---
>  hw/timer/meson.build                          |  4 ++--
>  target/Kconfig                                | 23 +++++++++++++++++++
>  target/alpha/Kconfig                          |  2 ++
>  target/arm/Kconfig                            | 11 +++++++++
>  target/avr/Kconfig                            |  2 ++
>  target/cris/Kconfig                           |  2 ++
>  target/hppa/Kconfig                           |  2 ++
>  target/i386/Kconfig                           |  9 ++++++++
>  target/lm32/Kconfig                           |  3 +++
>  target/m68k/Kconfig                           |  3 +++
>  target/microblaze/Kconfig                     |  2 ++
>  target/mips/Kconfig                           |  7 ++++++
>  target/moxie/Kconfig                          |  2 ++
>  target/nios2/Kconfig                          |  3 +++
>  target/openrisc/Kconfig                       |  2 ++
>  target/ppc/Kconfig                            |  5 ++++
>  target/riscv/Kconfig                          |  7 ++++++
>  target/rx/Kconfig                             |  2 ++
>  target/s390x/Kconfig                          |  2 ++
>  target/sh4/Kconfig                            |  2 ++
>  target/sparc/Kconfig                          |  5 ++++
>  target/tilegx/Kconfig                         |  2 ++
>  target/tricore/Kconfig                        |  2 ++
>  target/unicore32/Kconfig                      |  3 +++
>  target/xtensa/Kconfig                         |  3 +++
>  44 files changed, 129 insertions(+), 43 deletions(-)
>  create mode 100644 target/Kconfig
>  create mode 100644 target/alpha/Kconfig
>  create mode 100644 target/arm/Kconfig
>  create mode 100644 target/avr/Kconfig
>  create mode 100644 target/cris/Kconfig
>  create mode 100644 target/hppa/Kconfig
>  create mode 100644 target/i386/Kconfig
>  create mode 100644 target/lm32/Kconfig
>  create mode 100644 target/m68k/Kconfig
>  create mode 100644 target/microblaze/Kconfig
>  create mode 100644 target/mips/Kconfig
>  create mode 100644 target/moxie/Kconfig
>  create mode 100644 target/nios2/Kconfig
>  create mode 100644 target/openrisc/Kconfig
>  create mode 100644 target/ppc/Kconfig
>  create mode 100644 target/riscv/Kconfig
>  create mode 100644 target/rx/Kconfig
>  create mode 100644 target/s390x/Kconfig
>  create mode 100644 target/sh4/Kconfig
>  create mode 100644 target/sparc/Kconfig
>  create mode 100644 target/tilegx/Kconfig
>  create mode 100644 target/tricore/Kconfig
>  create mode 100644 target/unicore32/Kconfig
>  create mode 100644 target/xtensa/Kconfig
> 


