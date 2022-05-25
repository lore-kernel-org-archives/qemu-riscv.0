Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntpqT-00077w-O4
	for mharc-qemu-riscv@gnu.org; Wed, 25 May 2022 08:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1ntpqN-00072p-EZ; Wed, 25 May 2022 08:10:29 -0400
Received: from [187.72.171.209] (port=49585 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1ntpqK-0002hb-NA; Wed, 25 May 2022 08:10:26 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 25 May 2022 09:10:18 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id D625E8001D4;
 Wed, 25 May 2022 09:10:17 -0300 (-03)
Message-ID: <95b64f27-25e1-d2ad-f894-c890c3a1ffbb@eldorado.org.br>
Date: Wed, 25 May 2022 09:10:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/3] target/riscv: Make CPU property names lowercase
Content-Language: en-US
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <cover.1652435208.git.research_trasio@irq.a4lg.com>
 <cover.1653472385.git.research_trasio@irq.a4lg.com>
 <dd7579a2a8b81632827d42a137c7f7720cc7ab5f.1653472385.git.research_trasio@irq.a4lg.com>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <dd7579a2a8b81632827d42a137c7f7720cc7ab5f.1653472385.git.research_trasio@irq.a4lg.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 May 2022 12:10:18.0180 (UTC)
 FILETIME=[6623E840:01D87030]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 25 May 2022 12:10:31 -0000

On 25/05/2022 06:54, Tsukasa OI wrote:
> Many CPU properties for RISC-V are in lowercase except those with
> "capitalized" (or CamelCase) names:
> 
> -   Counters
> -   Zifencei
> -   Zicsr
> -   Zfh
> -   Zfhmin
> -   Zve32f
> -   Zve64f
> 
> This commit makes lowercase names primary but keeps capitalized names
> as aliases (for backward comatibility, but with deprecated status).

'compatibility'

> 
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>

Tested-by: Víctor Colombo <victor.colombo@eldorado.org.br>

> ---
>   target/riscv/cpu.c | 27 ++++++++++++++++++++-------
>   1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3f21563f2d..83262586e4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -840,6 +840,10 @@ static void riscv_cpu_init(Object *obj)
>   }
> 
>   static Property riscv_cpu_properties[] = {
> +    /*
> +     * Names for ISA extensions and features should be in lowercase.
> +     */
> +
>       /* Base ISA and single-letter standard extensions */
>       DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
>       DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
> @@ -855,11 +859,11 @@ static Property riscv_cpu_properties[] = {
>       DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
> 
>       /* Standard unprivileged extensions */
> -    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> -    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> +    DEFINE_PROP_BOOL("zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("zifencei", RISCVCPU, cfg.ext_ifencei, true),
> 
> -    DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> -    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> +    DEFINE_PROP_BOOL("zfh", RISCVCPU, cfg.ext_zfh, false),
> +    DEFINE_PROP_BOOL("zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>       DEFINE_PROP_BOOL("zfinx", RISCVCPU, cfg.ext_zfinx, false),
>       DEFINE_PROP_BOOL("zdinx", RISCVCPU, cfg.ext_zdinx, false),
>       DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
> @@ -884,8 +888,8 @@ static Property riscv_cpu_properties[] = {
>       DEFINE_PROP_BOOL("zksh", RISCVCPU, cfg.ext_zksh, false),
>       DEFINE_PROP_BOOL("zkt", RISCVCPU, cfg.ext_zkt, false),
> 
> -    DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> -    DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
> +    DEFINE_PROP_BOOL("zve32f", RISCVCPU, cfg.ext_zve32f, false),
> +    DEFINE_PROP_BOOL("zve64f", RISCVCPU, cfg.ext_zve64f, false),
> 
>       /* Standard supervisor-level extensions */
>       DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
> @@ -893,7 +897,7 @@ static Property riscv_cpu_properties[] = {
>       DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> 
>       /* Base features */
> -    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> +    DEFINE_PROP_BOOL("counters", RISCVCPU, cfg.ext_counters, true),
>       DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>       DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>       DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
> @@ -922,6 +926,15 @@ static Property riscv_cpu_properties[] = {
>       /* Other options */
>       DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
> 
> +    /* Capitalized aliases (deprecated and will be removed) */
> +    DEFINE_PROP("Counters", RISCVCPU, cfg.ext_counters, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zifencei", RISCVCPU, cfg.ext_ifencei, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zicsr", RISCVCPU, cfg.ext_icsr, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zfh", RISCVCPU, cfg.ext_zfh, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zfhmin", RISCVCPU, cfg.ext_zfhmin, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zve32f", RISCVCPU, cfg.ext_zve32f, qdev_prop_bool, bool),
> +    DEFINE_PROP("Zve64f", RISCVCPU, cfg.ext_zve64f, qdev_prop_bool, bool),
> +
>       DEFINE_PROP_END_OF_LIST(),
>   };
> 
> --
> 2.34.1
> 
> 

Best regards,

-- 
Víctor Cora Colombo
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

