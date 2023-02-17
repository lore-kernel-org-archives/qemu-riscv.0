Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSquI-0000uY-Uo
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 21:55:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSquG-0000u4-Tv; Thu, 16 Feb 2023 21:55:28 -0500
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSquE-00053o-Cr; Thu, 16 Feb 2023 21:55:28 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0Vbqa7u0_1676602516; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vbqa7u0_1676602516) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 10:55:17 +0800
Content-Type: multipart/alternative;
 boundary="------------vC0jWu3swt5j0IXxW8dNjFAF"
Message-ID: <9c48a83d-7cdf-4691-d7c5-da022737f1bc@linux.alibaba.com>
Date: Fri, 17 Feb 2023 10:55:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 2/9] target/riscv: introduce riscv_cpu_cfg()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, richard.henderson@linaro.org
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-3-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230216215550.1011637-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=115.124.30.97;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-97.freemail.mail.aliyun.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.351, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 02:55:30 -0000

This is a multi-part message in MIME format.
--------------vC0jWu3swt5j0IXxW8dNjFAF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/2/17 5:55, Daniel Henrique Barboza wrote:
> We're going to do changes that requires accessing the RISCVCPUConfig
> struct from the RISCVCPU, having access only to a CPURISCVState 'env'
> pointer. Add a helper to make the code easier to read.
>
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.h | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 01803a020d..5e9626837b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -653,6 +653,11 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
>   #endif
>   #define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
>   
> +static inline const RISCVCPUConfig *riscv_cpu_cfg(CPURISCVState *env)
> +{
> +    return &env_archcpu(env)->cfg;
> +}
> +

There many places in branch should use this interface, not just in this 
patch set.

For example,

static RISCVException seed(CPURISCVState *env, int csrno)
{
     RISCVCPU *cpu = env_archcpu(env);

     if (!cpu->cfg.ext_zkr) {
         return RISCV_EXCP_ILLEGAL_INST;
     }

The cpu here will not be used, except referring to the cfg.

Do you mind to unify the use?

Zhiwei

>   #if defined(TARGET_RISCV32)
>   #define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
>   #else
--------------vC0jWu3swt5j0IXxW8dNjFAF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/2/17 5:55, Daniel Henrique
      Barboza wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230216215550.1011637-3-dbarboza@ventanamicro.com">
      <pre class="moz-quote-pre" wrap="">We're going to do changes that requires accessing the RISCVCPUConfig
struct from the RISCVCPU, having access only to a CPURISCVState 'env'
pointer. Add a helper to make the code easier to read.

Signed-off-by: Daniel Henrique Barboza <a class="moz-txt-link-rfc2396E" href="mailto:dbarboza@ventanamicro.com">&lt;dbarboza@ventanamicro.com&gt;</a>
---
 target/riscv/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 01803a020d..5e9626837b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -653,6 +653,11 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
 #endif
 #define riscv_cpu_mxl_bits(env) (1UL &lt;&lt; (4 + riscv_cpu_mxl(env)))
 
+static inline const RISCVCPUConfig *riscv_cpu_cfg(CPURISCVState *env)
+{
+    return &amp;env_archcpu(env)-&gt;cfg;
+}
+</pre>
    </blockquote>
    <p>There many places in branch should use this interface, not just
      in this patch set.  <br>
    </p>
    <p>For example,</p>
    <pre>static RISCVException seed(CPURISCVState *env, int csrno)
{
    RISCVCPU *cpu = env_archcpu(env);

    if (!cpu-&gt;cfg.ext_zkr) {
        return RISCV_EXCP_ILLEGAL_INST;
    }

</pre>
    <p>The cpu here will not be used, except referring to the cfg.</p>
    <p>Do you mind to unify the use?</p>
    <p>Zhiwei<br>
    </p>
    <blockquote type="cite"
      cite="mid:20230216215550.1011637-3-dbarboza@ventanamicro.com">
      <pre class="moz-quote-pre" wrap="">
 #if defined(TARGET_RISCV32)
 #define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
 #else
</pre>
    </blockquote>
  </body>
</html>

--------------vC0jWu3swt5j0IXxW8dNjFAF--

