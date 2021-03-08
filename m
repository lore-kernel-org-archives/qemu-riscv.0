Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJHGa-0004kf-NA
	for mharc-qemu-riscv@gnu.org; Mon, 08 Mar 2021 09:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJHGY-0004je-KW; Mon, 08 Mar 2021 09:53:50 -0500
Received: from mx2.suse.de ([195.135.220.15]:47622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJHGW-0003gw-Ce; Mon, 08 Mar 2021 09:53:50 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 135ADAB8C;
 Mon,  8 Mar 2021 14:53:46 +0000 (UTC)
Subject: Re: [RFC PATCH v2 3/8] target/arm: Directly use arm_cpu_has_work
 instead of CPUClass::has_work
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
 <20210304222323.1954755-4-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b67724ae-f43a-f71e-c2ce-1c4dd8d904f2@suse.de>
Date: Mon, 8 Mar 2021 15:53:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210304222323.1954755-4-f4bug@amsat.org>
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
X-List-Received-Date: Mon, 08 Mar 2021 14:53:51 -0000

On 3/4/21 11:23 PM, Philippe Mathieu-Daudé wrote:
> There is only one CPUClass::has_work() ARM handler: arm_cpu_has_work().
> 
> Avoid a dereference by declaring it in "internals.h" and call it
> directly  in the WFI helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/internals.h | 1 +
>  target/arm/cpu.c       | 2 +-
>  target/arm/op_helper.c | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 05cebc8597c..1930be08828 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -172,6 +172,7 @@ static inline int r14_bank_number(int mode)
>  void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
>  void arm_translate_init(void);
>  
> +bool arm_cpu_has_work(CPUState *cs);
>  #ifdef CONFIG_TCG
>  void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
>  #endif /* CONFIG_TCG */
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5e018b2a732..6d2d9f2100f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -76,7 +76,7 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
>  }
>  #endif /* CONFIG_TCG */
>  
> -static bool arm_cpu_has_work(CPUState *cs)
> +bool arm_cpu_has_work(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>  
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 65cb37d088f..a4da6f4fde8 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -289,7 +289,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
>      CPUState *cs = env_cpu(env);
>      int target_el = check_wfx_trap(env, false);
>  
> -    if (cpu_has_work(cs)) {
> +    if (arm_cpu_has_work(cs)) {
>          /* Don't bother to go into our "low power state" if
>           * we would just wake up immediately.
>           */
> 


