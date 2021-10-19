Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcf50-00074o-BS
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 22:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mcf4y-00074V-6p; Mon, 18 Oct 2021 22:42:16 -0400
Received: from out28-75.mail.aliyun.com ([115.124.28.75]:49234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mcf4u-00011K-Nv; Mon, 18 Oct 2021 22:42:15 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.09905767|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.72993-8.28789e-05-0.269987;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=4; RT=4; SR=0; TI=SMTPD_---.Le0iKcN_1634611324; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Le0iKcN_1634611324)
 by smtp.aliyun-inc.com(10.147.41.231);
 Tue, 19 Oct 2021 10:42:04 +0800
Subject: Re: [PATCH v4 14/16] target/riscv: Align gprs and fprs in cpu_dump
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
 <20211019000108.3678724-15-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <6b5039d8-9d9d-da99-1c56-971b6c484fb7@c-sky.com>
Date: Tue, 19 Oct 2021 10:42:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019000108.3678724-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.75; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-75.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Oct 2021 02:42:16 -0000


On 2021/10/19 上午8:01, Richard Henderson wrote:
> Allocate 8 columns per register name.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei<zhiwei_liu@c-sky.com>

Zhiwei
> ---
>   target/riscv/cpu.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 4e1920d5f0..f352c2b74c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -240,7 +240,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>           qemu_fprintf(f, " %s %d\n", "V      =  ", riscv_cpu_virt_enabled(env));
>       }
>   #endif
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
> +    qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n", "pc", env->pc);
>   #ifndef CONFIG_USER_ONLY
>       qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
>       qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", (target_ulong)env->mstatus);
> @@ -290,15 +290,16 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>   #endif
>   
>       for (i = 0; i < 32; i++) {
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx,
> +        qemu_fprintf(f, " %-8s " TARGET_FMT_lx,
>                        riscv_int_regnames[i], env->gpr[i]);
>           if ((i & 3) == 3) {
>               qemu_fprintf(f, "\n");
>           }
>       }
> +
>       if (flags & CPU_DUMP_FPU) {
>           for (i = 0; i < 32; i++) {
> -            qemu_fprintf(f, " %s %016" PRIx64,
> +            qemu_fprintf(f, " %-8s %016" PRIx64,
>                            riscv_fpr_regnames[i], env->fpr[i]);
>               if ((i & 3) == 3) {
>                   qemu_fprintf(f, "\n");

