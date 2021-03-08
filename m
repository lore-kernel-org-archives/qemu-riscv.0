Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJEld-0004Lz-N2
	for mharc-qemu-riscv@gnu.org; Mon, 08 Mar 2021 07:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJElX-0004Hd-Il; Mon, 08 Mar 2021 07:13:40 -0500
Received: from mx2.suse.de ([195.135.220.15]:46550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJElS-0002QW-0u; Mon, 08 Mar 2021 07:13:39 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B049CAC0C;
 Mon,  8 Mar 2021 12:13:29 +0000 (UTC)
Subject: Re: [RFC PATCH v2 6/8] cpu: Declare cpu_has_work() in 'sysemu/tcg.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20210304222323.1954755-1-f4bug@amsat.org>
 <20210304222323.1954755-7-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <417b5d4a-b1a6-92be-5d84-f8ef28f793c9@suse.de>
Date: Mon, 8 Mar 2021 13:13:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210304222323.1954755-7-f4bug@amsat.org>
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
X-List-Received-Date: Mon, 08 Mar 2021 12:13:41 -0000

On 3/4/21 11:23 PM, Philippe Mathieu-Daudé wrote:
> We can only check if a vCPU has work with TCG.
> Move the cpu_has_work() prototype to "sysemu/tcg.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> RFC: could another accelerator do that?
>      can we rename this tcg_vcpu_has_work()?
> ---
>  include/hw/core/cpu.h | 16 ----------------
>  include/sysemu/tcg.h  | 11 +++++++++++
>  accel/tcg/cpu-exec.c  |  7 +++++++
>  softmmu/cpus.c        |  1 +
>  4 files changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 1376e496a3f..66109bcca35 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -670,22 +670,6 @@ CPUState *cpu_create(const char *typename);
>   */
>  const char *parse_cpu_option(const char *cpu_option);
>  
> -/**
> - * cpu_has_work:
> - * @cpu: The vCPU to check.
> - *
> - * Checks whether the CPU has work to do.
> - *
> - * Returns: %true if the CPU has work, %false otherwise.
> - */
> -static inline bool cpu_has_work(CPUState *cpu)
> -{
> -    CPUClass *cc = CPU_GET_CLASS(cpu);
> -
> -    g_assert(cc->has_work);
> -    return cc->has_work(cpu);
> -}
> -
>  /**
>   * qemu_cpu_is_self:
>   * @cpu: The vCPU to check against.
> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
> index c16c13c3c69..3d46b0a7a93 100644
> --- a/include/sysemu/tcg.h
> +++ b/include/sysemu/tcg.h
> @@ -10,6 +10,7 @@
>  
>  #ifndef CONFIG_TCG
>  #define tcg_enabled() 0
> +#define cpu_has_work(cpu) false


I am not sure I like this approach,

it is misleading for the reader: cpu_has_work should not be called for TCG at all,
or at least a clue should be given that it is indeed a TCG-only function.

Otherwise, from the common code, the reader does not have any clue from the context that this is actually meaningful for TCG only.

Where is this actually used..?


>  #else
>  
>  void tcg_exec_init(unsigned long tb_size, int splitwx);
> @@ -26,6 +27,16 @@ extern bool tcg_allowed;
>  extern bool mttcg_enabled;
>  #define qemu_tcg_mttcg_enabled() (mttcg_enabled)
>  
> +/**
> + * cpu_has_work:
> + * @cpu: The vCPU to check.
> + *
> + * Checks whether the CPU has work to do.
> + *
> + * Returns: %true if the CPU has work, %false otherwise.
> + */
> +bool cpu_has_work(CPUState *cpu);
> +
>  #endif /* CONFIG_TCG */
>  
>  #endif
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 7e67ade35b9..b9ce36e59e2 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -447,6 +447,13 @@ static inline TranslationBlock *tb_find(CPUState *cpu,
>      return tb;
>  }
>  
> +bool cpu_has_work(CPUState *cpu)
> +{
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> +
> +    return cc->has_work(cpu);
> +}
> +
>  static inline bool cpu_handle_halt(CPUState *cpu)
>  {
>      if (cpu->halted) {
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index a7ee431187a..548ab9236f1 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -42,6 +42,7 @@
>  #include "sysemu/runstate.h"
>  #include "sysemu/cpu-timers.h"
>  #include "sysemu/whpx.h"
> +#include "sysemu/tcg.h"
>  #include "hw/boards.h"
>  #include "hw/hw.h"
>  
> 


