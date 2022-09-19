Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oaEKl-0004uL-9Q
	for mharc-qemu-riscv@gnu.org; Mon, 19 Sep 2022 06:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oaEKZ-0004qK-CX; Mon, 19 Sep 2022 06:48:53 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:45883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oaEKR-0001c8-5e; Mon, 19 Sep 2022 06:48:45 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R681e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VQBUvLd_1663584511; 
Received: from 30.225.64.225(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VQBUvLd_1663584511) by smtp.aliyun-inc.com;
 Mon, 19 Sep 2022 18:48:32 +0800
Message-ID: <599b6472-d382-ddef-70c2-4f96620e947f@linux.alibaba.com>
Date: Mon, 19 Sep 2022 18:48:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] target/riscv: Check the correct exception cause in vector
 GDB stub
Content-Language: en-US
To: frank.chang@sifive.com, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Jim Shu <jim.shu@sifive.com>,
 Tommy Wu <tommy.wu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20220918083245.13028-1-frank.chang@sifive.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20220918083245.13028-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.57;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-57.freemail.mail.aliyun.com
X-Spam_score_int: -108
X-Spam_score: -10.9
X-Spam_bar: ----------
X-Spam_report: (-10.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.952, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 19 Sep 2022 10:48:55 -0000

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

On 2022/9/18 16:32, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
>
> After RISCVException enum is introduced, riscv_csrrw_debug() returns
> RISCV_EXCP_NONE to indicate there's no error. RISC-V vector GDB stub
> should check the result against RISCV_EXCP_NONE instead of value 0.
> Otherwise, 'E14' packet would be incorrectly reported for vector CSRs
> when using "info reg vector" GDB command.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Tommy Wu <tommy.wu@sifive.com>
> ---
>   target/riscv/gdbstub.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 9ed049c29e..118bd40f10 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -211,7 +211,7 @@ static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
>       target_ulong val = 0;
>       int result = riscv_csrrw_debug(env, csrno, &val, 0, 0);
>   
> -    if (result == 0) {
> +    if (result == RISCV_EXCP_NONE) {
>           return gdb_get_regl(buf, val);
>       }
>   
> @@ -238,7 +238,7 @@ static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
>       target_ulong val = ldtul_p(mem_buf);
>       int result = riscv_csrrw_debug(env, csrno, NULL, val, -1);
>   
> -    if (result == 0) {
> +    if (result == RISCV_EXCP_NONE) {
>           return sizeof(target_ulong);
>       }
>   

