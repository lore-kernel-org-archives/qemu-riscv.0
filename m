Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqpLx-0000jL-8z
	for mharc-qemu-riscv@gnu.org; Tue, 17 May 2022 01:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqpLv-0000iu-Fr; Tue, 17 May 2022 01:02:35 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:42436 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqpLs-0000iI-IS; Tue, 17 May 2022 01:02:35 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACHjn5eLINiBa_tBw--.16903S2;
 Tue, 17 May 2022 13:02:22 +0800 (CST)
Subject: Re: [PATCH 2/2] target/riscv: Run extension checks for all CPUs
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <20220517041100.93045-1-alistair.francis@opensource.wdc.com>
 <20220517041100.93045-3-alistair.francis@opensource.wdc.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <f071a26d-224b-74e8-207d-dedd5c16ec01@iscas.ac.cn>
Date: Tue, 17 May 2022 13:02:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220517041100.93045-3-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowACHjn5eLINiBa_tBw--.16903S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKw48tw1fAFWfArWUZrW5KFg_yoW7trW3pr
 15Gws0krWDJw1UGw48XF1UK3W5ur1xZa4Iga90q3W3WrW2kry3Xr1kCw1UWF4Fgw4rXa1f
 WF13GF1qgrsrta7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3
 Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUjdHUDUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 17 May 2022 05:02:35 -0000


ÔÚ 2022/5/17 ÏÂÎç12:11, Alistair Francis Ð´µÀ:
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Instead of just running the extension checks for the base CPUs, instead
> run them for all CPUs.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.c | 161 ++++++++++++++++++++++-----------------------
>   1 file changed, 80 insertions(+), 81 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 49b844535a..ee48a18ae4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -593,102 +593,101 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       }
>       assert(env->misa_mxl_max == env->misa_mxl);
>   
> -    /* If only MISA_EXT is unset for misa, then set it from properties */
> -    if (env->misa_ext == 0) {
> -        uint32_t ext = 0;
> +    /* Do some ISA extension error checking */
> +    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
> +        error_setg(errp,
> +                   "I and E extensions are incompatible");
> +        return;
> +    }
>   
> -        /* Do some ISA extension error checking */
> -        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
> -            error_setg(errp,
> -                       "I and E extensions are incompatible");
> -            return;
> -        }
> +    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
> +        error_setg(errp,
> +                   "Either I or E extension must be set");
> +        return;
> +    }
>   
> -        if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
> -            error_setg(errp,
> -                       "Either I or E extension must be set");
> -            return;
> -        }
> +    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
> +                            cpu->cfg.ext_a && cpu->cfg.ext_f &&
> +                            cpu->cfg.ext_d &&
> +                            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
> +        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
> +        cpu->cfg.ext_i = true;
> +        cpu->cfg.ext_m = true;
> +        cpu->cfg.ext_a = true;
> +        cpu->cfg.ext_f = true;
> +        cpu->cfg.ext_d = true;
> +        cpu->cfg.ext_icsr = true;
> +        cpu->cfg.ext_ifencei = true;
> +    }

Maybe you can merge the changes from my first patch to here and put this 
before the check on 'I' and 'E'.

Regards,

Weiwei Li

>   
> -        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
> -                                cpu->cfg.ext_a && cpu->cfg.ext_f &&
> -                                cpu->cfg.ext_d &&
> -                                cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
> -            warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
> -            cpu->cfg.ext_i = true;
> -            cpu->cfg.ext_m = true;
> -            cpu->cfg.ext_a = true;
> -            cpu->cfg.ext_f = true;
> -            cpu->cfg.ext_d = true;
> -            cpu->cfg.ext_icsr = true;
> -            cpu->cfg.ext_ifencei = true;
> -        }
> +    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
> +        error_setg(errp, "F extension requires Zicsr");
> +        return;
> +    }
>   
> -        if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
> -            error_setg(errp, "F extension requires Zicsr");
> -            return;
> -        }
> +    if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
> +        error_setg(errp, "Zfh/Zfhmin extensions require F extension");
> +        return;
> +    }
>   
> -        if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
> -            error_setg(errp, "Zfh/Zfhmin extensions require F extension");
> -            return;
> -        }
> +    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
> +        error_setg(errp, "D extension requires F extension");
> +        return;
> +    }
>   
> -        if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
> -            error_setg(errp, "D extension requires F extension");
> -            return;
> -        }
> +    if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
> +        error_setg(errp, "V extension requires D extension");
> +        return;
> +    }
>   
> -        if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
> -            error_setg(errp, "V extension requires D extension");
> -            return;
> -        }
> +    if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
> +        error_setg(errp, "Zve32f/Zve64f extensions require F extension");
> +        return;
> +    }
> +
> +    if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
> +        cpu->cfg.ext_zhinxmin) {
> +        cpu->cfg.ext_zfinx = true;
> +    }
>   
> -        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
> -            error_setg(errp, "Zve32f/Zve64f extensions require F extension");
> +    if (cpu->cfg.ext_zfinx) {
> +        if (!cpu->cfg.ext_icsr) {
> +            error_setg(errp, "Zfinx extension requires Zicsr");
>               return;
>           }
> -
> -        /* Set the ISA extensions, checks should have happened above */
> -        if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
> -            cpu->cfg.ext_zhinxmin) {
> -            cpu->cfg.ext_zfinx = true;
> +        if (cpu->cfg.ext_f) {
> +            error_setg(errp,
> +                "Zfinx cannot be supported together with F extension");
> +            return;
>           }
> +    }
>   
> -        if (cpu->cfg.ext_zfinx) {
> -            if (!cpu->cfg.ext_icsr) {
> -                error_setg(errp, "Zfinx extension requires Zicsr");
> -                return;
> -            }
> -            if (cpu->cfg.ext_f) {
> -                error_setg(errp,
> -                    "Zfinx cannot be supported together with F extension");
> -                return;
> -            }
> -        }
> +    if (cpu->cfg.ext_zk) {
> +        cpu->cfg.ext_zkn = true;
> +        cpu->cfg.ext_zkr = true;
> +        cpu->cfg.ext_zkt = true;
> +    }
>   
> -        if (cpu->cfg.ext_zk) {
> -            cpu->cfg.ext_zkn = true;
> -            cpu->cfg.ext_zkr = true;
> -            cpu->cfg.ext_zkt = true;
> -        }
> +    if (cpu->cfg.ext_zkn) {
> +        cpu->cfg.ext_zbkb = true;
> +        cpu->cfg.ext_zbkc = true;
> +        cpu->cfg.ext_zbkx = true;
> +        cpu->cfg.ext_zkne = true;
> +        cpu->cfg.ext_zknd = true;
> +        cpu->cfg.ext_zknh = true;
> +    }
>   
> -        if (cpu->cfg.ext_zkn) {
> -            cpu->cfg.ext_zbkb = true;
> -            cpu->cfg.ext_zbkc = true;
> -            cpu->cfg.ext_zbkx = true;
> -            cpu->cfg.ext_zkne = true;
> -            cpu->cfg.ext_zknd = true;
> -            cpu->cfg.ext_zknh = true;
> -        }
> +    if (cpu->cfg.ext_zks) {
> +        cpu->cfg.ext_zbkb = true;
> +        cpu->cfg.ext_zbkc = true;
> +        cpu->cfg.ext_zbkx = true;
> +        cpu->cfg.ext_zksed = true;
> +        cpu->cfg.ext_zksh = true;
> +    }
>   
> -        if (cpu->cfg.ext_zks) {
> -            cpu->cfg.ext_zbkb = true;
> -            cpu->cfg.ext_zbkc = true;
> -            cpu->cfg.ext_zbkx = true;
> -            cpu->cfg.ext_zksed = true;
> -            cpu->cfg.ext_zksh = true;
> -        }
> +    /* If only MISA_EXT is unset for misa, then set it from properties */
> +    if (env->misa_ext == 0) {
> +        uint32_t ext = 0;
>   
>           if (cpu->cfg.ext_i) {
>               ext |= RVI;


