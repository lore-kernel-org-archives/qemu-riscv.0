Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqFNC-0002Xw-1c
	for mharc-qemu-riscv@gnu.org; Sun, 15 May 2022 10:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqFNA-0002XZ-O7; Sun, 15 May 2022 10:37:28 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:33634 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqFN8-00073j-4B; Sun, 15 May 2022 10:37:28 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAC3v4caEIFi+fgKBw--.6757S2;
 Sun, 15 May 2022 22:37:14 +0800 (CST)
Subject: Re: [PATCH v2 4/5] target/riscv: FP extension requirements
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>, Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
 <cover.1652583332.git.research_trasio@irq.a4lg.com>
 <00e7b1c6060dab32ac7d49813b1ca84d3eb63298.1652583332.git.research_trasio@irq.a4lg.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <be76b33b-4999-6760-cc78-2fb5109b50aa@iscas.ac.cn>
Date: Sun, 15 May 2022 22:37:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <00e7b1c6060dab32ac7d49813b1ca84d3eb63298.1652583332.git.research_trasio@irq.a4lg.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAC3v4caEIFi+fgKBw--.6757S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW5AFyxArWrZFWDCr45ZFb_yoW8ur4Upr
 4UGa90krWDJr17C3yfZF1jk3W5ur1ku3ySg39agw17WrW7Gr93Jw1vkw17WF4Fqws5Za1f
 uF1DWr1DursrCa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
 3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
 VFxhVjvjDU0xZFpf9x0JU2LvtUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 15 May 2022 14:37:29 -0000


在 2022/5/15 上午10:56, Tsukasa OI 写道:
> QEMU allowed inconsistent configurations that made floating point
> arithmetic effectively unusable.
>
> This commit adds certain checks for consistent FP arithmetic:
>
> -   F requires Zicsr
> -   Zfinx requires Zicsr
> -   Zfh/Zfhmin require F
> -   D requires F
> -   V requires D

Why 'V requires D'? I know partial vector instructions require D, 
However,  I think they  just like c.fsd

instruction requires D, not 'C requires D' or 'D requires C'. Is there 
any rvv spec change I don't know?

Regards.

Weiwei Li

>
> Because F/D/Zicsr are enabled by default (and an error will not occur unless
> we manually disable one or more of prerequisites), this commit just enforces
> the user to give consistent combinations.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> ---
>   target/riscv/cpu.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0854ca9103..f910a41407 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -610,11 +610,36 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>               cpu->cfg.ext_ifencei = true;
>           }
>   
> +        if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
> +            error_setg(errp, "F extension requires Zicsr");
> +            return;
> +        }
> +
> +        if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
> +            error_setg(errp, "Zfh/Zfhmin extensions require F extension");
> +            return;
> +        }
> +
> +        if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
> +            error_setg(errp, "D extension requires F extension");
> +            return;
> +        }
> +
> +        if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
> +            error_setg(errp, "V extension requires D extension");
> +            return;
> +        }
> +
>           if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
>               cpu->cfg.ext_zhinxmin) {
>               cpu->cfg.ext_zfinx = true;
>           }
>   
> +        if (cpu->cfg.ext_zfinx && !cpu->cfg.ext_icsr) {
> +            error_setg(errp, "Zfinx extension requires Zicsr");
> +            return;
> +        }
> +
>           if (cpu->cfg.ext_zk) {
>               cpu->cfg.ext_zkn = true;
>               cpu->cfg.ext_zkr = true;


