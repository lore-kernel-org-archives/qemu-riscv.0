Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ofhuT-0006l0-RE
	for mharc-qemu-riscv@gnu.org; Tue, 04 Oct 2022 09:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ofhuC-0006h2-Gb; Tue, 04 Oct 2022 09:24:17 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:44382 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ofhu8-0002aI-TQ; Tue, 04 Oct 2022 09:24:16 -0400
Received: from [192.168.124.8] (unknown [139.227.114.201])
 by APP-01 (Coremail) with SMTP id qwCowAA3PXXsMzxjbcs4Aw--.5657S2;
 Tue, 04 Oct 2022 21:23:57 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------wWv0kCPWg5CIr8TyEnWFmmqK"
Message-ID: <b719c988-6990-419a-7ca4-cb4e73ccc27d@iscas.ac.cn>
Date: Tue, 4 Oct 2022 21:23:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: liweiwei@iscas.ac.cn, alistair.francis@wdc.com
Subject: Re: [PATCH v10 4/5] target/riscv: smstateen check for fcsr
Content-Language: en-US
To: mchitale@ventanamicro.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20221003114718.30659-1-mchitale@ventanamicro.com>
 <20221003114718.30659-5-mchitale@ventanamicro.com>
 <404205f5-9626-23b3-d388-b2288293c7d1@iscas.ac.cn>
 <d7c8fc4fc255a23850d78da6c937e57e85ce09c7.camel@ventanamicro.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <d7c8fc4fc255a23850d78da6c937e57e85ce09c7.camel@ventanamicro.com>
X-CM-TRANSID: qwCowAA3PXXsMzxjbcs4Aw--.5657S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr1DCFy8Gw18Zr1DZw43Wrg_yoW7uF1kpr
 s5CFy3C34rGryIyan3JFn8AFnxGws7G397K3Z7tw4kta9rGrZ0qFs7try2gr98XFykXr1a
 vayYvF98ur47ZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj
 6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c
 0EjII2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoXo2UUUUU
X-Originating-IP: [139.227.114.201]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.449, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 04 Oct 2022 13:24:25 -0000

This is a multi-part message in MIME format.
--------------wWv0kCPWg5CIr8TyEnWFmmqK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/10/4 14:51, mchitale@ventanamicro.com wrote:
> On Mon, 2022-10-03 at 21:02 +0800, weiwei wrote:
>> On 2022/10/3 19:47, Mayuresh Chitale wrote:
>>> If smstateen is implemented and sstateen0.fcsr is clear then the
>>> floating point
>>> operations must return illegal instruction exception or virtual
>>> instruction
>>> trap, if relevant.
>>>
>>> Signed-off-by: Mayuresh Chitale<mchitale@ventanamicro.com>
>>> ---
>>>    target/riscv/csr.c                        | 23 ++++++++++++
>>>    target/riscv/insn_trans/trans_rvf.c.inc   | 43
>>> +++++++++++++++++++++--
>>>    target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++
>>>    3 files changed, 75 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>> index 71236f2b5d..8b25f885ec 100644
>>> --- a/target/riscv/csr.c
>>> +++ b/target/riscv/csr.c
>>> @@ -84,6 +84,10 @@ static RISCVException fs(CPURISCVState *env, int
>>> csrno)
>>>            !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
>>>            return RISCV_EXCP_ILLEGAL_INST;
>>>        }
>>> +
>>> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>>> +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
>>> +    }
>>>    #endif
>>>        return RISCV_EXCP_NONE;
>>>    }
>>> @@ -2023,6 +2027,9 @@ static RISCVException
>>> write_mstateen0(CPURISCVState *env, int csrno,
>>>                                          target_ulong new_val)
>>>    {
>>>        uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>>> +    if (!riscv_has_ext(env, RVF)) {
>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>> +    }
>>>    
>>>        return write_mstateen(env, csrno, wr_mask, new_val);
>>>    }
>>> @@ -2059,6 +2066,10 @@ static RISCVException
>>> write_mstateen0h(CPURISCVState *env, int csrno,
>>>    {
>>>        uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>>>    
>>> +    if (!riscv_has_ext(env, RVF)) {
>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>> +    }
>>> +
>>>        return write_mstateenh(env, csrno, wr_mask, new_val);
>>>    }
>>>    
>>> @@ -2096,6 +2107,10 @@ static RISCVException
>>> write_hstateen0(CPURISCVState *env, int csrno,
>>>    {
>>>        uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>>>    
>>> +    if (!riscv_has_ext(env, RVF)) {
>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>> +    }
>>> +
>>>        return write_hstateen(env, csrno, wr_mask, new_val);
>>>    }
>>>    
>>> @@ -2135,6 +2150,10 @@ static RISCVException
>>> write_hstateen0h(CPURISCVState *env, int csrno,
>>>    {
>>>        uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>>>    
>>> +    if (!riscv_has_ext(env, RVF)) {
>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>> +    }
>>> +
>>>        return write_hstateenh(env, csrno, wr_mask, new_val);
>>>    }
>>>    
>>> @@ -2182,6 +2201,10 @@ static RISCVException
>>> write_sstateen0(CPURISCVState *env, int csrno,
>>>    {
>>>        uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>>>    
>>> +    if (!riscv_has_ext(env, RVF)) {
>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>> +    }
>>> +
>>>        return write_sstateen(env, csrno, wr_mask, new_val);
>>>    }
>>>    
>>> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc
>>> b/target/riscv/insn_trans/trans_rvf.c.inc
>>> index a1d3eb52ad..93657680c6 100644
>>> --- a/target/riscv/insn_trans/trans_rvf.c.inc
>>> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
>>> @@ -24,9 +24,46 @@
>>>                return false; \
>>>    } while (0)
>>>    
>>> -#define REQUIRE_ZFINX_OR_F(ctx) do {\
>>> -    if (!ctx->cfg_ptr->ext_zfinx) { \
>>> -        REQUIRE_EXT(ctx, RVF); \
>>> +#ifndef CONFIG_USER_ONLY
>>> +static inline bool smstateen_fcsr_check(DisasContext *ctx, int
>>> index)
>>> +{
>>> +    CPUState *cpu = ctx->cs;
>>> +    CPURISCVState *env = cpu->env_ptr;
>>> +    uint64_t stateen = env->mstateen[index];
>>> +
>>> +    if (!ctx->cfg_ptr->ext_smstateen || env->priv == PRV_M) {
>>> +        return true;
>>> +    }
>>> +
>>> +    if (ctx->virt_enabled) {
>>> +        stateen &= env->hstateen[index];
>>> +    }
>>> +
>>> +    if (env->priv == PRV_U && has_ext(ctx, RVS)) {
>>> +        stateen &= env->sstateen[index];
>>> +    }
>>> +
>>> +    if (!(stateen & SMSTATEEN0_FCSR)) {
>>> +        if (ctx->virt_enabled) {
>>> +            ctx->virt_inst_excp = true;
>>> +        }
>> Are there any considerations for adding  virt_inst_excp instead of
>> directly
>>
>> "generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT)" here?
>>
>> Regards,
>>
>> Weiwei Li
> I had considered it but I think this is a simpler approach as the rest
> of the code path stays the same as generating an illegal instruction
> exception, for e.g setting the bins value (tval).

OK,  we did need to set bins value for virt instruction exception. 
However I prefer directly call a

new gen_exception_virt function(similar togen_exception_illegal) here.

>   Also we need to
> return true from all the caller trans_* functions even if the smstateen
> check has failed.

False is returned when smstateen check fails currently.

Regards,

Weiwei Li

>>> +        return false;
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +#else
>>> +#define smstateen_fcsr_check(ctx, index) (true)
>>> +#endif
>>> +
>>> +#define REQUIRE_ZFINX_OR_F(ctx) do { \
>>> +    if (!has_ext(ctx, RVF)) { \
>>> +        if (!ctx->cfg_ptr->ext_zfinx) { \
>>> +            return false; \
>>> +        } \
>>> +        if (!smstateen_fcsr_check(ctx, 0)) { \
>>> +            return false; \
>>> +        } \
>>>        } \
>>>    } while (0)
>>>    
>>> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc
>>> b/target/riscv/insn_trans/trans_rvzfh.c.inc
>>> index 5d07150cd0..6c2e338c0a 100644
>>> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
>>> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
>>> @@ -20,18 +20,27 @@
>>>        if (!ctx->cfg_ptr->ext_zfh) {      \
>>>            return false;         \
>>>        }                         \
>>> +    if (!smstateen_fcsr_check(ctx, 0)) { \
>>> +        return false; \
>>> +    } \
>>>    } while (0)
>>>    
>>>    #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
>>>        if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
>>>            return false;                  \
>>>        }                                  \
>>> +    if (!smstateen_fcsr_check(ctx, 0)) { \
>>> +        return false; \
>>> +    } \
>>>    } while (0)
>>>    
>>>    #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
>>>        if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
>>>            return false;                         \
>>>        }                                         \
>>> +    if (!smstateen_fcsr_check(ctx, 0)) { \
>>> +        return false; \
>>> +    } \
>>>    } while (0)
>>>    
>>>    #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
>>> @@ -39,6 +48,9 @@
>>>              ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin))
>>> {     \
>>>            return false;                                        \
>>>        }                                                        \
>>> +    if (!smstateen_fcsr_check(ctx, 0)) { \
>>> +        return false; \
>>> +    } \
>>>    } while (0)
>>>    
>>>    static bool trans_flh(DisasContext *ctx, arg_flh *a)
--------------wWv0kCPWg5CIr8TyEnWFmmqK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/10/4 14:51,
      <a class="moz-txt-link-abbreviated" href="mailto:mchitale@ventanamicro.com">mchitale@ventanamicro.com</a> wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:d7c8fc4fc255a23850d78da6c937e57e85ce09c7.camel@ventanamicro.com">
      <pre class="moz-quote-pre" wrap="">On Mon, 2022-10-03 at 21:02 +0800, weiwei wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 2022/10/3 19:47, Mayuresh Chitale wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">If smstateen is implemented and sstateen0.fcsr is clear then the
floating point
operations must return illegal instruction exception or virtual
instruction
trap, if relevant.

Signed-off-by: Mayuresh Chitale <a class="moz-txt-link-rfc2396E" href="mailto:mchitale@ventanamicro.com">&lt;mchitale@ventanamicro.com&gt;</a>
---
  target/riscv/csr.c                        | 23 ++++++++++++
  target/riscv/insn_trans/trans_rvf.c.inc   | 43
+++++++++++++++++++++--
  target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++
  3 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 71236f2b5d..8b25f885ec 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -84,6 +84,10 @@ static RISCVException fs(CPURISCVState *env, int
csrno)
          !RISCV_CPU(env_cpu(env))-&gt;cfg.ext_zfinx) {
          return RISCV_EXCP_ILLEGAL_INST;
      }
+
+    if (!env-&gt;debugger &amp;&amp; !riscv_cpu_fp_enabled(env)) {
+        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
+    }
  #endif
      return RISCV_EXCP_NONE;
  }
@@ -2023,6 +2027,9 @@ static RISCVException
write_mstateen0(CPURISCVState *env, int csrno,
                                        target_ulong new_val)
  {
      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
  
      return write_mstateen(env, csrno, wr_mask, new_val);
  }
@@ -2059,6 +2066,10 @@ static RISCVException
write_mstateen0h(CPURISCVState *env, int csrno,
  {
      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
  
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
      return write_mstateenh(env, csrno, wr_mask, new_val);
  }
  
@@ -2096,6 +2107,10 @@ static RISCVException
write_hstateen0(CPURISCVState *env, int csrno,
  {
      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
  
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
      return write_hstateen(env, csrno, wr_mask, new_val);
  }
  
@@ -2135,6 +2150,10 @@ static RISCVException
write_hstateen0h(CPURISCVState *env, int csrno,
  {
      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
  
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
      return write_hstateenh(env, csrno, wr_mask, new_val);
  }
  
@@ -2182,6 +2201,10 @@ static RISCVException
write_sstateen0(CPURISCVState *env, int csrno,
  {
      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
  
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
      return write_sstateen(env, csrno, wr_mask, new_val);
  }
  
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc
b/target/riscv/insn_trans/trans_rvf.c.inc
index a1d3eb52ad..93657680c6 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -24,9 +24,46 @@
              return false; \
  } while (0)
  
-#define REQUIRE_ZFINX_OR_F(ctx) do {\
-    if (!ctx-&gt;cfg_ptr-&gt;ext_zfinx) { \
-        REQUIRE_EXT(ctx, RVF); \
+#ifndef CONFIG_USER_ONLY
+static inline bool smstateen_fcsr_check(DisasContext *ctx, int
index)
+{
+    CPUState *cpu = ctx-&gt;cs;
+    CPURISCVState *env = cpu-&gt;env_ptr;
+    uint64_t stateen = env-&gt;mstateen[index];
+
+    if (!ctx-&gt;cfg_ptr-&gt;ext_smstateen || env-&gt;priv == PRV_M) {
+        return true;
+    }
+
+    if (ctx-&gt;virt_enabled) {
+        stateen &amp;= env-&gt;hstateen[index];
+    }
+
+    if (env-&gt;priv == PRV_U &amp;&amp; has_ext(ctx, RVS)) {
+        stateen &amp;= env-&gt;sstateen[index];
+    }
+
+    if (!(stateen &amp; SMSTATEEN0_FCSR)) {
+        if (ctx-&gt;virt_enabled) {
+            ctx-&gt;virt_inst_excp = true;
+        }
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Are there any considerations for adding  virt_inst_excp instead of
directly

"generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT)" here?

Regards,

Weiwei Li
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I had considered it but I think this is a simpler approach as the rest
of the code path stays the same as generating an illegal instruction
exception, for e.g setting the bins value (tval).</pre>
    </blockquote>
    <p>OK,  we did need to set bins value for virt instruction
      exception. However I prefer directly call a <br>
    </p>
    <p>new gen_exception_virt function(similar to<span style="color:
        #000000;"> gen_exception_illegal</span>) here.</p>
    <blockquote type="cite"
cite="mid:d7c8fc4fc255a23850d78da6c937e57e85ce09c7.camel@ventanamicro.com">
      <pre class="moz-quote-pre" wrap=""> Also we need to
return true from all the caller trans_* functions even if the smstateen
check has failed.</pre>
    </blockquote>
    <p>False is returned when smstateen check fails currently.</p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type="cite"
cite="mid:d7c8fc4fc255a23850d78da6c937e57e85ce09c7.camel@ventanamicro.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+        return false;
+    }
+
+    return true;
+}
+#else
+#define smstateen_fcsr_check(ctx, index) (true)
+#endif
+
+#define REQUIRE_ZFINX_OR_F(ctx) do { \
+    if (!has_ext(ctx, RVF)) { \
+        if (!ctx-&gt;cfg_ptr-&gt;ext_zfinx) { \
+            return false; \
+        } \
+        if (!smstateen_fcsr_check(ctx, 0)) { \
+            return false; \
+        } \
      } \
  } while (0)
  
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc
b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 5d07150cd0..6c2e338c0a 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -20,18 +20,27 @@
      if (!ctx-&gt;cfg_ptr-&gt;ext_zfh) {      \
          return false;         \
      }                         \
+    if (!smstateen_fcsr_check(ctx, 0)) { \
+        return false; \
+    } \
  } while (0)
  
  #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
      if (!ctx-&gt;cfg_ptr-&gt;ext_zhinx &amp;&amp; !ctx-&gt;cfg_ptr-&gt;ext_zfh) { \
          return false;                  \
      }                                  \
+    if (!smstateen_fcsr_check(ctx, 0)) { \
+        return false; \
+    } \
  } while (0)
  
  #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
      if (!(ctx-&gt;cfg_ptr-&gt;ext_zfh || ctx-&gt;cfg_ptr-&gt;ext_zfhmin)) { \
          return false;                         \
      }                                         \
+    if (!smstateen_fcsr_check(ctx, 0)) { \
+        return false; \
+    } \
  } while (0)
  
  #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
@@ -39,6 +48,9 @@
            ctx-&gt;cfg_ptr-&gt;ext_zhinx || ctx-&gt;cfg_ptr-&gt;ext_zhinxmin)) 
{     \
          return false;                                        \
      }                                                        \
+    if (!smstateen_fcsr_check(ctx, 0)) { \
+        return false; \
+    } \
  } while (0)
  
  static bool trans_flh(DisasContext *ctx, arg_flh *a)
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------wWv0kCPWg5CIr8TyEnWFmmqK--


