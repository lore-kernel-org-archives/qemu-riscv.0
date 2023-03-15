Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcIBf-00009P-RA
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 23:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pcIBd-000090-1c; Tue, 14 Mar 2023 23:52:25 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pcIBa-0002An-07; Tue, 14 Mar 2023 23:52:24 -0400
Received: from [192.168.0.120] (unknown [180.165.240.243])
 by APP-01 (Coremail) with SMTP id qwCowABHSkboQBFkPYIAEA--.31497S2;
 Wed, 15 Mar 2023 11:52:09 +0800 (CST)
Message-ID: <6afda5ad-2dd3-5821-3867-4c6d3b50fd03@iscas.ac.cn>
Date: Wed, 15 Mar 2023 11:52:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.1 v2 15/26] target/riscv: do not allow RVG in
 write_misa()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
 <20230314164948.539135-16-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230314164948.539135-16-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABHSkboQBFkPYIAEA--.31497S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF4kWw1DCw17Zr47tw47Jwb_yoW8Xw43pF
 WUG39xK3yDtrZF9a4xtr4UZF1Duw1rWa1fJwn3Kw13CFZYqrWFgrn2q3y7XF4xXa95Wr17
 Za10kFyfuF47A37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UU
 UUU
X-Originating-IP: [180.165.240.243]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Mar 2023 03:52:26 -0000


On 2023/3/15 00:49, Daniel Henrique Barboza wrote:
> We're getting ready to use riscv_cpu_validate_set_extensions() to unify
> the handling of write_misa() with the rest of the code base. But first
> we need to deal with RVG.
>
> The 'G' virtual extension enables a set of extensions in the CPU. At
> this moment, this is done at the start of our validation step in
> riscv_cpu_validate_set_extensions(). This means that enabling G will
> enable other extensions in the CPU before resuming the validation.
>
> This also means that, in case a write_misa() validation fails, we're
> going to set cpu->cfg attributes that are unrelated to misa_ext bits
> (icsr and ifencei). These would be 2 extra states that we would need to
> store to fallback from a validation failure.
>
> Since write_misa() is still on experimental state let's make our lives
> easier for now and disable RVG updates.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/csr.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b6..918d442ebd 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1348,6 +1348,11 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>           return RISCV_EXCP_NONE;
>       }
>   
> +    /* Changing 'G' state is unsupported */
> +    if (val & RVG) {
> +        return RISCV_EXCP_NONE;
> +    }
> +

'val & G' is not equal  "Changing 'G'" .

Regards,

Weiwei Li

>       /* 'I' or 'E' must be present */
>       if (!(val & (RVI | RVE))) {
>           /* It is not, drop write to misa */


