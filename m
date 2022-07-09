Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oA5ZI-000706-Lo
	for mharc-qemu-riscv@gnu.org; Sat, 09 Jul 2022 04:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oA5ZH-0006wG-IK; Sat, 09 Jul 2022 04:11:59 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:53766 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oA5ZE-0004ij-OE; Sat, 09 Jul 2022 04:11:59 -0400
Received: from [192.168.0.104] (unknown [117.151.235.104])
 by APP-01 (Coremail) with SMTP id qwCowACnrQU+OMlitJwKDg--.40432S2;
 Sat, 09 Jul 2022 16:11:43 +0800 (CST)
Subject: Re: [PATCH 2/2] target/riscv: Auto set elen from vector extension by
 default
To: Kito Cheng <kito.cheng@sifive.com>, alistair.francis@wdc.com,
 palmer@dabbelt.com, frank.chang@sifive.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, liweiwei@iscas.ac.cn
References: <20220708073943.54781-1-kito.cheng@sifive.com>
 <20220708073943.54781-2-kito.cheng@sifive.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <8969069c-8005-7564-1d79-948e7e9ecfcb@iscas.ac.cn>
Date: Sat, 9 Jul 2022 16:11:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220708073943.54781-2-kito.cheng@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowACnrQU+OMlitJwKDg--.40432S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF43KFyDtF48GF4rKFyUKFg_yoW8Kw13pr
 4kta4akryDta4xJ3yIva1Dta18Ww4rAay7KanxX3ZrWrs3GrZrGr1vkF429F4rJr4rXw4S
 9a13CryYvwsFya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHU
 DUUUUU=
X-Originating-IP: [117.151.235.104]
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
X-List-Received-Date: Sat, 09 Jul 2022 08:11:59 -0000

在 2022/7/8 下午3:39, Kito Cheng 写道:
> Default ELEN is setting to 64 for now, which is incorrect setting for
> Zve32*, and spec has mention minimum VLEN and supported EEW in chapter
> "Zve*: Vector Extensions for Embedded Processors" is 32 for Zve32.
>
> ELEN actaully could be derived from which extensions are enabled,
> so this patch set elen to 0 as auto detect, and keep the capability to
> let user could configure that.
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> ---
>   target/riscv/cpu.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 487d0faa63..c1b96da7da 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -751,13 +751,22 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>                           "Vector extension ELEN must be power of 2");
>                   return;
>               }
> -            if (cpu->cfg.elen > 64 || cpu->cfg.vlen < 8) {
> +            if (cpu->cfg.elen == 0) {
> +              if (cpu->cfg.ext_zve32f) {
> +                cpu->cfg.elen = 32;
> +              }
> +              if (cpu->cfg.ext_zve64f || cpu->cfg.ext_v) {
> +                cpu->cfg.elen = 64;
> +              }

This code is in the "if(cpu->cfg.ext_v){...}",  so "cpu->cfg.ext_zve64f 
|| cpu->cfg.ext_v" will always be true.

It can use "else ... " directly.
> +            }
> +            if (cpu->cfg.elen != 0 && (cpu->cfg.elen > 64 ||
> +                                       cpu->cfg.elen < 8)) {
>                   error_setg(errp,
>                           "Vector extension implementation only supports ELEN "
>                           "in the range [8, 64]");
>                   return;
>               }
> -            if (cpu->cfg.vlen < cpu->cfg.elen) {
> +            if (cpu->cfg.elen != 0 && cpu->cfg.vlen < cpu->cfg.elen) {

when cfg.elen is set to zero, it  will be changed to the auto detect 
value(32/64)  before this two check.

So this two modifications seem unnecessary.

Regards,

Weiwei Li

>                   error_setg(errp,
>                           "Vector extension VLEN must be greater than or equal "
>                           "to ELEN");
> @@ -901,7 +910,8 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>       DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
>       DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> -    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> +    /* elen = 0 means set from v or zve* extension */
> +    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 0),
>   
>       DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>       DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),


