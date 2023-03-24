Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfjFA-0002nV-3A
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 11:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfjF3-0002cN-47; Fri, 24 Mar 2023 11:22:10 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfjEz-0001yy-1B; Fri, 24 Mar 2023 11:22:08 -0400
Received: from [192.168.0.120] (unknown [180.165.240.150])
 by APP-05 (Coremail) with SMTP id zQCowAD3_89bvh1krqcmCQ--.3170S2;
 Fri, 24 Mar 2023 23:14:36 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------yw1kPZ9rWLLNA1fJpYv6STag"
Message-ID: <a6443f6e-1448-b023-4792-ad4b1bd7862e@iscas.ac.cn>
Date: Fri, 24 Mar 2023 23:14:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.1 v4 24/25] target/riscv: update cpu->cfg misa bits
 in commit_cpu_cfg()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
 <20230322222004.357013-25-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230322222004.357013-25-dbarboza@ventanamicro.com>
X-CM-TRANSID: zQCowAD3_89bvh1krqcmCQ--.3170S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGF4UWF43Xr1DKFWkZw18Xwb_yoW5uw47pr
 45G3yay34DJFZFv34xJF1DXF18uw4vgFWxKws7Wr13GFs5ArWFgFs8tw43ury7uF4rZr1a
 va1UCF12kF48Ca7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
 87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 I_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
 WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
 cVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUJnYwUUUUU=
X-Originating-IP: [180.165.240.150]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 24 Mar 2023 15:22:14 -0000

This is a multi-part message in MIME format.
--------------yw1kPZ9rWLLNA1fJpYv6STag
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2023/3/23 06:20, Daniel Henrique Barboza wrote:
> write_misa() is able to use the same validation workflow
> riscv_cpu_realize() uses. But it's still not capable of updating
> cpu->cfg misa props yet.
>
> We have no way of blocking future (and current) code from checking
> env->misa_ext (via riscv_has_ext()) or reading cpu->cfg directly, so our
> best alternative is to keep everything in sync.
>
> riscv_cpu_commit_cpu_cfg() now receives an extra 'misa_ext' parameter.
> If this val is different from the existing env->misa_ext, update
> env->misa and cpu->cfg with the new value. riscv_cpu_realize() will
> ignore this code since env->misa_ext isn't touched during validation,
> but write_misa() will use it to keep cpu->cfg in sync with the new
> env->misa_ext value.
>
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 16 ++++++++++++++--
>   target/riscv/cpu.h |  2 +-
>   target/riscv/csr.c |  3 +--
>   3 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 41b17ba0c3..88806d1050 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1204,8 +1204,20 @@ void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
>       }
>   }
>   
> -void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
> +void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu, uint32_t misa_ext)
>   {
> +    CPURISCVState *env = &cpu->env;
> +
> +    /*
> +     * write_misa() needs to update cpu->cfg with the new
> +     * MISA bits. This is a no-op for the riscv_cpu_realize()
> +     * path.
> +     */
> +    if (env->misa_ext != misa_ext) {
> +        env->misa_ext = misa_ext;
> +        riscv_set_cpucfg_with_misa(&cpu->cfg, misa_ext);
> +    }
> +
>       if (cpu->cfg.ext_zk) {
>           cpu->cfg.ext_zkn = true;
>           cpu->cfg.ext_zkr = true;

These zk* related assignment and riscv_cpu_disable_priv_spec_isa_exts() 
can be moved to other places.

They needn't be done for write_misa.

Regards,

Weiwei Li

> @@ -1374,7 +1386,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> -    riscv_cpu_commit_cpu_cfg(cpu);
> +    riscv_cpu_commit_cpu_cfg(cpu, env->misa_ext);
>   
>   #ifndef CONFIG_USER_ONLY
>       if (cpu->cfg.ext_sstc) {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ca2ba6a647..befc3b8fff 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -597,7 +597,7 @@ void riscv_cpu_validate_misa_ext(CPURISCVState *env, uint32_t misa_ext,
>                                    Error **errp);
>   void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
>                                      Error **errp);
> -void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu);
> +void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu, uint32_t misa_ext);
>   
>   #define cpu_list riscv_cpu_list
>   #define cpu_mmu_index riscv_cpu_mmu_index
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 8d5e8f9ad1..839862f1a8 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1396,7 +1396,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>           return RISCV_EXCP_NONE;
>       }
>   
> -    riscv_cpu_commit_cpu_cfg(cpu);
> +    riscv_cpu_commit_cpu_cfg(cpu, val);
>   
>       if (!(val & RVF)) {
>           env->mstatus &= ~MSTATUS_FS;
> @@ -1404,7 +1404,6 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>   
>       /* flush translation cache */
>       tb_flush(env_cpu(env));
> -    env->misa_ext = val;
>       env->xl = riscv_cpu_mxl(env);
>       return RISCV_EXCP_NONE;
>   }
--------------yw1kPZ9rWLLNA1fJpYv6STag
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/3/23 06:20, Daniel Henrique
      Barboza wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230322222004.357013-25-dbarboza@ventanamicro.com">
      <pre class="moz-quote-pre" wrap="">write_misa() is able to use the same validation workflow
riscv_cpu_realize() uses. But it's still not capable of updating
cpu-&gt;cfg misa props yet.

We have no way of blocking future (and current) code from checking
env-&gt;misa_ext (via riscv_has_ext()) or reading cpu-&gt;cfg directly, so our
best alternative is to keep everything in sync.

riscv_cpu_commit_cpu_cfg() now receives an extra 'misa_ext' parameter.
If this val is different from the existing env-&gt;misa_ext, update
env-&gt;misa and cpu-&gt;cfg with the new value. riscv_cpu_realize() will
ignore this code since env-&gt;misa_ext isn't touched during validation,
but write_misa() will use it to keep cpu-&gt;cfg in sync with the new
env-&gt;misa_ext value.

Signed-off-by: Daniel Henrique Barboza <a class="moz-txt-link-rfc2396E" href="mailto:dbarboza@ventanamicro.com">&lt;dbarboza@ventanamicro.com&gt;</a>
---
 target/riscv/cpu.c | 16 ++++++++++++++--
 target/riscv/cpu.h |  2 +-
 target/riscv/csr.c |  3 +--
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 41b17ba0c3..88806d1050 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1204,8 +1204,20 @@ void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
     }
 }
 
-void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
+void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu, uint32_t misa_ext)
 {
+    CPURISCVState *env = &amp;cpu-&gt;env;
+
+    /*
+     * write_misa() needs to update cpu-&gt;cfg with the new
+     * MISA bits. This is a no-op for the riscv_cpu_realize()
+     * path.
+     */
+    if (env-&gt;misa_ext != misa_ext) {
+        env-&gt;misa_ext = misa_ext;
+        riscv_set_cpucfg_with_misa(&amp;cpu-&gt;cfg, misa_ext);
+    }
+
     if (cpu-&gt;cfg.ext_zk) {
         cpu-&gt;cfg.ext_zkn = true;
         cpu-&gt;cfg.ext_zkr = true;</pre>
    </blockquote>
    <p>These zk* related assignment and <span class="pl-c1">riscv_cpu_disable_priv_spec_isa_exts</span>() 
      can be moved to other places.</p>
    <p>They needn't be done for write_misa.</p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type="cite"
      cite="mid:20230322222004.357013-25-dbarboza@ventanamicro.com">
      <pre class="moz-quote-pre" wrap="">
@@ -1374,7 +1386,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    riscv_cpu_commit_cpu_cfg(cpu);
+    riscv_cpu_commit_cpu_cfg(cpu, env-&gt;misa_ext);
 
 #ifndef CONFIG_USER_ONLY
     if (cpu-&gt;cfg.ext_sstc) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ca2ba6a647..befc3b8fff 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -597,7 +597,7 @@ void riscv_cpu_validate_misa_ext(CPURISCVState *env, uint32_t misa_ext,
                                  Error **errp);
 void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
                                    Error **errp);
-void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu);
+void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu, uint32_t misa_ext);
 
 #define cpu_list riscv_cpu_list
 #define cpu_mmu_index riscv_cpu_mmu_index
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8d5e8f9ad1..839862f1a8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1396,7 +1396,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
-    riscv_cpu_commit_cpu_cfg(cpu);
+    riscv_cpu_commit_cpu_cfg(cpu, val);
 
     if (!(val &amp; RVF)) {
         env-&gt;mstatus &amp;= ~MSTATUS_FS;
@@ -1404,7 +1404,6 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
 
     /* flush translation cache */
     tb_flush(env_cpu(env));
-    env-&gt;misa_ext = val;
     env-&gt;xl = riscv_cpu_mxl(env);
     return RISCV_EXCP_NONE;
 }
</pre>
    </blockquote>
  </body>
</html>

--------------yw1kPZ9rWLLNA1fJpYv6STag--


