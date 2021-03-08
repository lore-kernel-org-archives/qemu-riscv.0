Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJHFB-0003Wj-NE
	for mharc-qemu-riscv@gnu.org; Mon, 08 Mar 2021 09:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJHF7-0003VR-H1; Mon, 08 Mar 2021 09:52:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:46950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJHF5-000372-Vb; Mon, 08 Mar 2021 09:52:21 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14D40AE15;
 Mon,  8 Mar 2021 14:52:17 +0000 (UTC)
Subject: Re: [RFC PATCH v2 2/8] sysemu/tcg: Restrict qemu_tcg_mttcg_enabled()
 to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210304222323.1954755-1-f4bug@amsat.org>
 <20210304222323.1954755-3-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ab719bff-5af7-c663-1665-816cecdd2f6e@suse.de>
Date: Mon, 8 Mar 2021 15:52:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210304222323.1954755-3-f4bug@amsat.org>
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
X-List-Received-Date: Mon, 08 Mar 2021 14:52:22 -0000

On 3/4/21 11:23 PM, Philippe Mathieu-Daudé wrote:
> qemu_tcg_mttcg_enabled() shouldn't not be used outside of TCG,
> restrict its declaration.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Claudio Fontana <cfontana@suse.de>

> ---
>  include/hw/core/cpu.h | 9 ---------
>  include/sysemu/tcg.h  | 9 +++++++++
>  accel/tcg/cpu-exec.c  | 1 +
>  tcg/tcg.c             | 1 +
>  4 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index e3648338dfe..1376e496a3f 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -454,15 +454,6 @@ static inline void cpu_tb_jmp_cache_clear(CPUState *cpu)
>      }
>  }
>  
> -/**
> - * qemu_tcg_mttcg_enabled:
> - * Check whether we are running MultiThread TCG or not.
> - *
> - * Returns: %true if we are in MTTCG mode %false otherwise.
> - */
> -extern bool mttcg_enabled;
> -#define qemu_tcg_mttcg_enabled() (mttcg_enabled)
> -
>  /**
>   * cpu_paging_enabled:
>   * @cpu: The CPU whose state is to be inspected.
> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
> index fddde2b6b9a..c16c13c3c69 100644
> --- a/include/sysemu/tcg.h
> +++ b/include/sysemu/tcg.h
> @@ -17,6 +17,15 @@ void tcg_exec_init(unsigned long tb_size, int splitwx);
>  extern bool tcg_allowed;
>  #define tcg_enabled() (tcg_allowed)
>  
> +/**
> + * qemu_tcg_mttcg_enabled:
> + * Check whether we are running MultiThread TCG or not.
> + *
> + * Returns: %true if we are in MTTCG mode %false otherwise.
> + */
> +extern bool mttcg_enabled;
> +#define qemu_tcg_mttcg_enabled() (mttcg_enabled)
> +
>  #endif /* CONFIG_TCG */
>  
>  #endif
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 16e4fe3ccd8..7e67ade35b9 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -39,6 +39,7 @@
>  #include "hw/i386/apic.h"
>  #endif
>  #include "sysemu/cpus.h"
> +#include "sysemu/tcg.h"
>  #include "exec/cpu-all.h"
>  #include "sysemu/cpu-timers.h"
>  #include "sysemu/replay.h"
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 63a12b197bf..4a4dac0bb3e 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -65,6 +65,7 @@
>  #include "elf.h"
>  #include "exec/log.h"
>  #include "sysemu/sysemu.h"
> +#include "sysemu/tcg.h"
>  
>  /* Forward declarations for functions declared in tcg-target.c.inc and
>     used here. */
> 


