Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqf5L-0006li-RC
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 14:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nqf5J-0006jQ-7a; Mon, 16 May 2022 14:04:45 -0400
Received: from [187.72.171.209] (port=33208 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nqf5H-0001qS-74; Mon, 16 May 2022 14:04:44 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 16 May 2022 15:04:36 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id B13F5800048;
 Mon, 16 May 2022 15:04:36 -0300 (-03)
Message-ID: <e803a275-c54b-bc9c-430a-1bbbf5b14115@eldorado.org.br>
Date: Mon, 16 May 2022 15:04:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/5] target/riscv: Disable "G" by default
Content-Language: en-US
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>, Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
 <cover.1652583332.git.research_trasio@irq.a4lg.com>
 <cab7205f1d7668f642fa242386543334af6bc1bd.1652583332.git.research_trasio@irq.a4lg.com>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <cab7205f1d7668f642fa242386543334af6bc1bd.1652583332.git.research_trasio@irq.a4lg.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 May 2022 18:04:37.0045 (UTC)
 FILETIME=[67B18650:01D8694F]
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
X-List-Received-Date: Mon, 16 May 2022 18:04:46 -0000

On 14/05/2022 23:56, Tsukasa OI wrote:
> Because "G" virtual extension expands to "IMAFD", we cannot separately
> disable extensions like "F" or "D" without disabling "G".  Because all
> "IMAFD" are enabled by default, it's harmless to disable "G" by default.
> 
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> ---
>   target/riscv/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 00bf26ec8b..3ea68d5cd7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -812,7 +812,7 @@ static Property riscv_cpu_properties[] = {
>       /* Defaults for standard extensions */
>       DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
>       DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
> -    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, true),
> +    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
>       DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
>       DEFINE_PROP_BOOL("a", RISCVCPU, cfg.ext_a, true),
>       DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
> --
> 2.34.1
> 
> 

I think the logic looks ok, and (with my limited understanding of the
code) I agree on the reasoning for the changes in patches 2 and 3.
Just some clarification needed: where is the value of 'g' checked?
can the behavior change in this patch cause a situation where
IMAFD_Zicsr_Zifencei is set but 'g' is not, or does patch 3
guarantee that in this case 'g' will be set?

Thanks!

-- 
Víctor Cora Colombo
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

