Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZ8v6-0007c9-BN
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 06:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pZ8v1-0007bW-FW; Mon, 06 Mar 2023 06:22:15 -0500
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pZ8uy-00069B-Uw; Mon, 06 Mar 2023 06:22:15 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VdFENpR_1678101721; 
Received: from 30.221.97.6(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VdFENpR_1678101721) by smtp.aliyun-inc.com;
 Mon, 06 Mar 2023 19:22:02 +0800
Message-ID: <301aa4d5-0e0d-12a7-1884-aab94e881882@linux.alibaba.com>
Date: Mon, 6 Mar 2023 19:22:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] target/riscv: Expose "virt" register for GDB for reads
To: Jim Shu <jim.shu@sifive.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20230305094231.1616-1-jim.shu@sifive.com>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230305094231.1616-1-jim.shu@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.99;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-99.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 06 Mar 2023 11:22:16 -0000


On 2023/3/5 17:42, Jim Shu wrote:
> This patch enables a debugger to read current virtualization mode via
> virtual "virt" register. After it, we could get full current privilege
> mode via both "priv" and "virt" register.
>
> Extend previous commit ab9056ff9bdb3f95db6e7a666d10522d289f14ec to
> support H-extension.
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   gdb-xml/riscv-32bit-virtual.xml |  1 +
>   gdb-xml/riscv-64bit-virtual.xml |  1 +
>   target/riscv/gdbstub.c          | 12 ++++++++----
>   3 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/gdb-xml/riscv-32bit-virtual.xml b/gdb-xml/riscv-32bit-virtual.xml
> index 905f1c555d..d44b6ca2dc 100644
> --- a/gdb-xml/riscv-32bit-virtual.xml
> +++ b/gdb-xml/riscv-32bit-virtual.xml
> @@ -8,4 +8,5 @@
>   <!DOCTYPE feature SYSTEM "gdb-target.dtd">
>   <feature name="org.gnu.gdb.riscv.virtual">
>     <reg name="priv" bitsize="32"/>
> +  <reg name="virt" bitsize="32"/>
>   </feature>
> diff --git a/gdb-xml/riscv-64bit-virtual.xml b/gdb-xml/riscv-64bit-virtual.xml
> index 62d86c237b..7c9b63d5b6 100644
> --- a/gdb-xml/riscv-64bit-virtual.xml
> +++ b/gdb-xml/riscv-64bit-virtual.xml
> @@ -8,4 +8,5 @@
>   <!DOCTYPE feature SYSTEM "gdb-target.dtd">
>   <feature name="org.gnu.gdb.riscv.virtual">
>     <reg name="priv" bitsize="64"/>
> +  <reg name="virt" bitsize="64"/>
>   </feature>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 6048541606..1755fd9d51 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -187,13 +187,17 @@ static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
>   
>   static int riscv_gdb_get_virtual(CPURISCVState *cs, GByteArray *buf, int n)
>   {
> -    if (n == 0) {
>   #ifdef CONFIG_USER_ONLY
> +    if (n >= 0 && n <= 1) {
>           return gdb_get_regl(buf, 0);
> +    }
>   #else
> +    if (n == 0) {
>           return gdb_get_regl(buf, cs->priv);
> -#endif
> +    } else if (n == 1) {
> +        return gdb_get_regl(buf, riscv_cpu_virt_enabled(cs));
>       }
> +#endif
>       return 0;
>   }
>   
> @@ -328,13 +332,13 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>       case MXL_RV32:
>           gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
>                                    riscv_gdb_set_virtual,
> -                                 1, "riscv-32bit-virtual.xml", 0);
> +                                 2, "riscv-32bit-virtual.xml", 0);
>           break;
>       case MXL_RV64:
>       case MXL_RV128:
>           gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
>                                    riscv_gdb_set_virtual,
> -                                 1, "riscv-64bit-virtual.xml", 0);
> +                                 2, "riscv-64bit-virtual.xml", 0);

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>           break;
>       default:
>           g_assert_not_reached();

