Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o5q04-00066n-L5
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jun 2022 10:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o5pzy-00065n-70; Mon, 27 Jun 2022 10:45:58 -0400
Received: from [200.168.210.66] (port=24325 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o5pzv-0005Gk-NW; Mon, 27 Jun 2022 10:45:57 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 27 Jun 2022 11:23:51 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 07ED88001D4;
 Mon, 27 Jun 2022 11:23:50 -0300 (-03)
Message-ID: <5d5b7a70-172b-201a-eb97-34980dee97fb@eldorado.org.br>
Date: Mon, 27 Jun 2022 11:23:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/riscv: fix user-mode build issue because mhartid
Content-Language: en-US
To: Rahul Pathak <rpathak@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 apatel@ventanamicro.com, rpathakmailbox@gmail.com
References: <20220627094029.1379700-1-rpathak@ventanamicro.com>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <20220627094029.1379700-1-rpathak@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2022 14:23:51.0440 (UTC)
 FILETIME=[860C1900:01D88A31]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
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
X-List-Received-Date: Mon, 27 Jun 2022 14:46:01 -0000

On 27/06/2022 06:40, Rahul Pathak wrote:
> mhartid csr is not available in user-mode code path and
> user-mode build fails because of its reference in
> riscv_cpu_realize function
> 
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0a794ef622..03f23d4b6d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -643,9 +643,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
>               (env->priv_ver < isa_edata_arr[i].min_version)) {
>               isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
> +#ifndef CONFIG_USER_ONLY
>               warn_report("disabling %s extension for hart 0x%lx because "
>                           "privilege spec version does not match",
>                           isa_edata_arr[i].name, (unsigned long)env->mhartid);
> +#else
> +            warn_report("disabling %s extension for hart 0x%lx because "
> +                        "privilege spec version does not match",
> +                        isa_edata_arr[i].name);

Hello, Rahul

Looks like you removed the second argument but didn't update the format
string. The second format specifier is still there.

> +#endif
>           }
>       }
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

