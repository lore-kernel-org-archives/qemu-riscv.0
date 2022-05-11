Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nocG7-0004Fa-Bj
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 22:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nocG6-0004Ea-L9; Tue, 10 May 2022 22:39:26 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:42388 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nocG4-0004nQ-L9; Tue, 10 May 2022 22:39:26 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACnrJDZIXtikD+0BQ--.44S2;
 Wed, 11 May 2022 10:39:21 +0800 (CST)
Subject: Re: [PATCH qemu v2 10/10] target/riscv: rvv: Add option
 'rvv_ma_all_1s' to enable optional mask agnostic behavior
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
References: <165220716770.22380.2493420346587893209-10@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <698c2d59-942c-fae9-98ea-af7a24a897fb@iscas.ac.cn>
Date: Wed, 11 May 2022 10:39:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <165220716770.22380.2493420346587893209-10@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowACnrJDZIXtikD+0BQ--.44S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr15GFWUXry3WF18AryfXrb_yoW8Xr1fpr
 s5Ca1Ig397JFy3Z3s7W3WDJr40gw4DW3yxKF1UA340vws3JrW7GF1qkwsYkF47JF4UWr4I
 k3ZI9r1fZws8Aa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Gr0_Zr1lIxAIcVC2z280aVAFwI0_Gr0_
 Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbrOz3
 UUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 11 May 2022 02:39:26 -0000


在 2022/5/11 上午2:10, ~eopxd 写道:
> From: eopXD <eop.chen@sifive.com>
>
> According to v-spec, mask agnostic behavior can be either kept as
> undisturbed or set elements' bits to all 1s. To distinguish the
> difference of mask policies, QEMU should be able to simulate the mask
> agnostic behavior as "set mask elements' bits to all 1s".
>
> There are multiple possibility for agnostic elements according to
> v-spec. The main intent of this patch-set tries to add option that
> can distinguish between mask policies. Setting agnostic elements to
> all 1s allows QEMU to express this.
>
> This commit adds option 'rvv_ma_all_1s' is added to enable the
> behavior, it is default as disabled.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/cpu.c | 1 +
>   1 file changed, 1 insertion(+)


Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>

Regards,
Weiwei Li
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 720c8b9e5c..0245844b99 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -880,6 +880,7 @@ static Property riscv_cpu_properties[] = {
>   
>       DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
>       DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
> +    DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   


