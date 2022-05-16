Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqeyt-0001SG-JZ
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 13:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nqeys-0001Rt-5X; Mon, 16 May 2022 13:58:06 -0400
Received: from [187.72.171.209] (port=11887 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nqeyp-0000IJ-Or; Mon, 16 May 2022 13:58:05 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 16 May 2022 14:56:54 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 984BB800048;
 Mon, 16 May 2022 14:56:53 -0300 (-03)
Message-ID: <71bd0408-40c8-bcee-7471-cc4aa8a2909e@eldorado.org.br>
Date: Mon, 16 May 2022 14:56:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/5] target/riscv: Fix coding style on "G" expansion
Content-Language: en-US
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>, Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
 <cover.1652583332.git.research_trasio@irq.a4lg.com>
 <91633f8349253656dd08bc8dc36498a9c7538b10.1652583332.git.research_trasio@irq.a4lg.com>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <91633f8349253656dd08bc8dc36498a9c7538b10.1652583332.git.research_trasio@irq.a4lg.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 May 2022 17:56:54.0012 (UTC)
 FILETIME=[53B44BC0:01D8694E]
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
X-List-Received-Date: Mon, 16 May 2022 17:58:06 -0000

On 14/05/2022 23:56, Tsukasa OI wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre imediatamente em contato com o DTI.
> 
> Because ext_? members are boolean variables, operator `&&' should be
> used instead of `&'.
> 
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> ---
>   target/riscv/cpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ccacdee215..00bf26ec8b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -596,8 +596,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>               return;
>           }
> 
> -        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
> -                                cpu->cfg.ext_a & cpu->cfg.ext_f &
> +        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
> +                                cpu->cfg.ext_a && cpu->cfg.ext_f &&
>                                   cpu->cfg.ext_d)) {
>               warn_report("Setting G will also set IMAFD");
>               cpu->cfg.ext_i = true;
> --
> 2.34.1
> 
> 

Sorry, looks like I mistakenly reviewed v1 earlier

Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>

-- 
Víctor Cora Colombo
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

