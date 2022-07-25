Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oFsRh-0005kt-Hm
	for mharc-qemu-riscv@gnu.org; Mon, 25 Jul 2022 03:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oFsRe-0005jv-Kr; Mon, 25 Jul 2022 03:24:03 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:36950 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oFsRb-00011U-6z; Mon, 25 Jul 2022 03:24:02 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-01 (Coremail) with SMTP id qwCowAAnbZ0ERd5iEJrVAQ--.53460S2;
 Mon, 25 Jul 2022 15:23:48 +0800 (CST)
Subject: Re: [PATCH v6 3/5] target/riscv: smstateen check for fcsr
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
 <20220721153136.377578-4-mchitale@ventanamicro.com>
 <e819eb9c-fdec-5138-5b94-f8ddd2331f7a@iscas.ac.cn>
 <fb88d0ccf7f6c4204b932d14fa88f952e314e922.camel@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <edef6a28-6378-59a6-5fa8-4f3b0be76b71@iscas.ac.cn>
Date: Mon, 25 Jul 2022 15:23:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <fb88d0ccf7f6c4204b932d14fa88f952e314e922.camel@ventanamicro.com>
Content-Type: multipart/alternative;
 boundary="------------3B4ECB259352EF16471EB275"
Content-Language: en-US
X-CM-TRANSID: qwCowAAnbZ0ERd5iEJrVAQ--.53460S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKr4fXw45Ww4UKFy7Xry3CFg_yoWxGrWUpw
 4kCay3G3s5WrWIyanxGFn8CF9xGws7KrWfKwnrtw1kta9rGrWYgF4kt342qryDJFy8Xr13
 uayjyF98ur47Za7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2
 z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67
 IIx4CEVc8vx2IErcIFxwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAYIcxG
 8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
 0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
 17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
 C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUSPfQUUUUU=
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 25 Jul 2022 07:24:03 -0000

This is a multi-part message in MIME format.
--------------3B4ECB259352EF16471EB275
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/7/24 下午11:49, Mayuresh Chitale 写道:
> On Fri, 2022-07-22 at 09:42 +0800, Weiwei Li wrote:
>> 在 2022/7/21 下午11:31, Mayuresh Chitale 写道:
>>> If smstateen is implemented and sstateen0.fcsr is clear then the
>>> floating point operations must return illegal instruction
>>> exception.
>>>
>>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>>> ---
>>>    target/riscv/csr.c                        | 23 ++++++++++++++
>>>    target/riscv/insn_trans/trans_rvf.c.inc   | 38
>>> +++++++++++++++++++++--
>>>    target/riscv/insn_trans/trans_rvzfh.c.inc |  4 +++
>>>    3 files changed, 63 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>> index ab06b117f9..a597b6cbc7 100644
>>> --- a/target/riscv/csr.c
>>> +++ b/target/riscv/csr.c
>>> @@ -96,6 +96,10 @@ static RISCVException fs(CPURISCVState *env, int
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
>>> @@ -1876,6 +1880,9 @@ static RISCVException
>>> write_mstateen0(CPURISCVState *env, int csrno,
>>>                                          target_ulong new_val)
>>>    {
>>>        uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
>>> +    if (!riscv_has_ext(env, RVF)) {
>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>> +    }
>>>    
>>>        return write_mstateen(env, csrno, wr_mask, new_val);
>>>    }
>>> @@ -1924,6 +1931,10 @@ static RISCVException
>>> write_mstateen0h(CPURISCVState *env, int csrno,
>>>    {
>>>        uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
>>>    
>>> +    if (!riscv_has_ext(env, RVF)) {
>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>> +    }
>>> +
>>>        return write_mstateenh(env, csrno, wr_mask, new_val);
>>>    }
>>>    
>>> @@ -1973,6 +1984,10 @@ static RISCVException
>>> write_hstateen0(CPURISCVState *env, int csrno,
>>>    {
>>>        uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
>>>    
>>> +    if (!riscv_has_ext(env, RVF)) {
>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>> +    }
>>> +
>>>        return write_hstateen(env, csrno, wr_mask, new_val);
>>>    }
>>>    
>>> @@ -2024,6 +2039,10 @@ static RISCVException
>>> write_hstateen0h(CPURISCVState *env, int csrno,
>>>    {
>>>        uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
>>>    
>>> +    if (!riscv_has_ext(env, RVF)) {
>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>> +    }
>>> +
>>>        return write_hstateenh(env, csrno, wr_mask, new_val);
>>>    }
>>>    
>>> @@ -2083,6 +2102,10 @@ static RISCVException
>>> write_sstateen0(CPURISCVState *env, int csrno,
>>>    {
>>>        uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
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
>>> index a1d3eb52ad..c43c48336b 100644
>>> --- a/target/riscv/insn_trans/trans_rvf.c.inc
>>> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
>>> @@ -24,9 +24,43 @@
>>>                return false; \
>>>    } while (0)
>>>    
>>> +#ifndef CONFIG_USER_ONLY
>>> +#define SMSTATEEN_CHECK(ctx) do {\
>>> +    CPUState *cpu = ctx->cs; \
>>> +    CPURISCVState *env = cpu->env_ptr; \
>>> +    if (ctx->cfg_ptr->ext_smstateen && \
>>> +        (env->priv < PRV_M)) { \
>>> +        uint64_t stateen = env->mstateen[0]; \
>>> +        uint64_t hstateen = env->hstateen[0]; \
>>> +        uint64_t sstateen = env->sstateen[0]; \
>>> +        if (!(stateen & SMSTATEEN_STATEN)) {\
>>> +            hstateen = 0; \
>>> +            sstateen = 0; \
>>> +        } \
>>> +        if (ctx->virt_enabled) { \
>>> +            stateen &= hstateen; \
>>> +            if (!(hstateen & SMSTATEEN_STATEN)) {\
>>> +                sstateen = 0; \
>>> +            } \
>>> +        } \
>>> +        if (env->priv == PRV_U && has_ext(ctx, RVS)) {\eventually
>>> meaning
>>> +            stateen &= sstateen; \
>>> +        } \
>>> +        if (!(stateen & SMSTATEEN0_FCSR)) { \
>>> +            return false; \
>>> +        } \
>>> +    } \
>>> +} while (0)
>> It's better to add a space before '\'.
> ok. will modify in the next version.
>>> +#else
>>> +#define SMSTATEEN_CHECK(ctx)
>>> +#endif
>>> +
>>>    #define REQUIRE_ZFINX_OR_F(ctx) do {\
>>> -    if (!ctx->cfg_ptr->ext_zfinx) { \
>>> -        REQUIRE_EXT(ctx, RVF); \
>>> +    if (!has_ext(ctx, RVF)) { \
>>> +        SMSTATEEN_CHECK(ctx); \
>>> +        if (!ctx->cfg_ptr->ext_zfinx) { \
>>> +            return false; \
>>> +        } \
>>>        } \
>>>    } while (0)
>> SMSTATEEN_CHECK is for CSR. and REQUIRE_ZFINX_OR_F is for Extension.
>> I think It's better to separate them. By the way, if we want the
>> smallest modification
>> for current code, adding it to REQUIRE_FPU seems better.
> Actually REQUIRE_FPU is checking for mstatus.fs but as per smstateen
> spec we need to check for misa.f which is done in REQUIRE_ZFINX_OR_F.

OK. It's acceptable to me  even though I prefer separating them.

However, I find another question in SMSTATEEN_CHECK: when access is 
disallowed by Xstateen.FCSR,

it's always return false  which will trigger illegal instruction 
exception finally.

However, this exception is triggered by accessing fcsr CSR which may 
trigger illegal instruction trap and virtual
instruction trap in different situation.

/"For convenience, when the stateen CSRs are implemented and misa.F = 0, 
then if bit 1 of a//
//controlling stateen0 CSR is zero, all floating-point instructions 
cause an illegal instruction trap (or virtual//
//instruction trap, if relevant), as though they all access fcsr, 
regardless of whether they really do."/

And  stateen.fcsr is only work when zfinx is enabled, so  it's better to 
SMSTATEEN_CHECK(ctx) after check for

"!ctx->cfg_ptr->ext_zfinx"

Regards,
Weiwei Li

>> Regards,
>> Weiwei Li
>>
>>>    
>>> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc
>>> b/target/riscv/insn_trans/trans_rvzfh.c.inc
>>> index 5d07150cd0..b165ea9d58 100644
>>> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
>>> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
>>> @@ -17,24 +17,28 @@
>>>     */
>>>    
>>>    #define REQUIRE_ZFH(ctx) do { \
>>> +    SMSTATEEN_CHECK(ctx); \
>>>        if (!ctx->cfg_ptr->ext_zfh) {      \
>>>            return false;         \
>>>        }                         \
>>>    } while (0)
>>>    
>>>    #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
>>> +    SMSTATEEN_CHECK(ctx); \
>>>        if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
>>>            return false;                  \
>>>        }                                  \
>>>    } while (0)
>>>    
>>>    #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
>>> +    SMSTATEEN_CHECK(ctx); \
>>>        if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
>>>            return false;                         \
>>>        }                                         \
>>>    } while (0)
>>>    
>>>    #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
>>> +    SMSTATEEN_CHECK(ctx); \
>>>        if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin
>>> ||          \
>>>              ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin))
>>> {     \
>>>            return false;                                        \

--------------3B4ECB259352EF16471EB275
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/7/24 下午11:49, Mayuresh Chitale
      写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:fb88d0ccf7f6c4204b932d14fa88f952e314e922.camel@ventanamicro.com">
      <pre class="moz-quote-pre" wrap="">On Fri, 2022-07-22 at 09:42 +0800, Weiwei Li wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">在 2022/7/21 下午11:31, Mayuresh Chitale 写道:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">If smstateen is implemented and sstateen0.fcsr is clear then the
floating point operations must return illegal instruction
exception.

Signed-off-by: Mayuresh Chitale <a class="moz-txt-link-rfc2396E" href="mailto:mchitale@ventanamicro.com">&lt;mchitale@ventanamicro.com&gt;</a>
---
  target/riscv/csr.c                        | 23 ++++++++++++++
  target/riscv/insn_trans/trans_rvf.c.inc   | 38
+++++++++++++++++++++--
  target/riscv/insn_trans/trans_rvzfh.c.inc |  4 +++
  3 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ab06b117f9..a597b6cbc7 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -96,6 +96,10 @@ static RISCVException fs(CPURISCVState *env, int
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
@@ -1876,6 +1880,9 @@ static RISCVException
write_mstateen0(CPURISCVState *env, int csrno,
                                        target_ulong new_val)
  {
      uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
  
      return write_mstateen(env, csrno, wr_mask, new_val);
  }
@@ -1924,6 +1931,10 @@ static RISCVException
write_mstateen0h(CPURISCVState *env, int csrno,
  {
      uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
  
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
      return write_mstateenh(env, csrno, wr_mask, new_val);
  }
  
@@ -1973,6 +1984,10 @@ static RISCVException
write_hstateen0(CPURISCVState *env, int csrno,
  {
      uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
  
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
      return write_hstateen(env, csrno, wr_mask, new_val);
  }
  
@@ -2024,6 +2039,10 @@ static RISCVException
write_hstateen0h(CPURISCVState *env, int csrno,
  {
      uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
  
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
      return write_hstateenh(env, csrno, wr_mask, new_val);
  }
  
@@ -2083,6 +2102,10 @@ static RISCVException
write_sstateen0(CPURISCVState *env, int csrno,
  {
      uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
  
+    if (!riscv_has_ext(env, RVF)) {
+        wr_mask |= SMSTATEEN0_FCSR;
+    }
+
      return write_sstateen(env, csrno, wr_mask, new_val);
  }
  
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc
b/target/riscv/insn_trans/trans_rvf.c.inc
index a1d3eb52ad..c43c48336b 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -24,9 +24,43 @@
              return false; \
  } while (0)
  
+#ifndef CONFIG_USER_ONLY
+#define SMSTATEEN_CHECK(ctx) do {\
+    CPUState *cpu = ctx-&gt;cs; \
+    CPURISCVState *env = cpu-&gt;env_ptr; \
+    if (ctx-&gt;cfg_ptr-&gt;ext_smstateen &amp;&amp; \
+        (env-&gt;priv &lt; PRV_M)) { \
+        uint64_t stateen = env-&gt;mstateen[0]; \
+        uint64_t hstateen = env-&gt;hstateen[0]; \
+        uint64_t sstateen = env-&gt;sstateen[0]; \
+        if (!(stateen &amp; SMSTATEEN_STATEN)) {\
+            hstateen = 0; \
+            sstateen = 0; \
+        } \
+        if (ctx-&gt;virt_enabled) { \
+            stateen &amp;= hstateen; \
+            if (!(hstateen &amp; SMSTATEEN_STATEN)) {\
+                sstateen = 0; \
+            } \
+        } \
+        if (env-&gt;priv == PRV_U &amp;&amp; has_ext(ctx, RVS)) {\eventually
meaning
+            stateen &amp;= sstateen; \
+        } \
+        if (!(stateen &amp; SMSTATEEN0_FCSR)) { \
+            return false; \
+        } \
+    } \
+} while (0)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
It's better to add a space before '\'.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">ok. will modify in the next version.
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+#else
+#define SMSTATEEN_CHECK(ctx)
+#endif
+
  #define REQUIRE_ZFINX_OR_F(ctx) do {\
-    if (!ctx-&gt;cfg_ptr-&gt;ext_zfinx) { \
-        REQUIRE_EXT(ctx, RVF); \
+    if (!has_ext(ctx, RVF)) { \
+        SMSTATEEN_CHECK(ctx); \
+        if (!ctx-&gt;cfg_ptr-&gt;ext_zfinx) { \
+            return false; \
+        } \
      } \
  } while (0)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
SMSTATEEN_CHECK is for CSR. and REQUIRE_ZFINX_OR_F is for Extension.
I think It's better to separate them. By the way, if we want the
smallest modification
for current code, adding it to REQUIRE_FPU seems better.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Actually REQUIRE_FPU is checking for mstatus.fs but as per smstateen
spec we need to check for misa.f which is done in REQUIRE_ZFINX_OR_F.</pre>
    </blockquote>
    <p>OK. It's acceptable to me  even though I prefer separating them.</p>
    <p>However, I find another question in SMSTATEEN_CHECK: when access
      is disallowed by Xstateen.FCSR,  </p>
    <p>it's always return false  which will trigger illegal instruction
      exception finally.</p>
    <p>However, this exception is triggered by accessing fcsr CSR which
      may trigger illegal instruction trap and virtual<br>
      instruction trap in different situation.</p>
    <p><i>"For convenience, when the stateen CSRs are implemented and
        misa.F = 0, then if bit 1 of a</i><i><br>
      </i><i>controlling stateen0 CSR is zero, all floating-point
        instructions cause an illegal instruction trap (or virtual</i><i><br>
      </i><i>instruction trap, if relevant), as though they all access
        fcsr, regardless of whether they really do."</i><br>
    </p>
    <p>And  stateen.fcsr is only work when zfinx is enabled, so  it's
      better to SMSTATEEN_CHECK(ctx) after check for <br>
    </p>
    <pre class="moz-quote-pre" wrap="">"!ctx-&gt;cfg_ptr-&gt;ext_zfinx"

Regards,
Weiwei Li
</pre>
    <blockquote type="cite"
cite="mid:fb88d0ccf7f6c4204b932d14fa88f952e314e922.camel@ventanamicro.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Regards,
Weiwei Li

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">  
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc
b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 5d07150cd0..b165ea9d58 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -17,24 +17,28 @@
   */
  
  #define REQUIRE_ZFH(ctx) do { \
+    SMSTATEEN_CHECK(ctx); \
      if (!ctx-&gt;cfg_ptr-&gt;ext_zfh) {      \
          return false;         \
      }                         \
  } while (0)
  
  #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
+    SMSTATEEN_CHECK(ctx); \
      if (!ctx-&gt;cfg_ptr-&gt;ext_zhinx &amp;&amp; !ctx-&gt;cfg_ptr-&gt;ext_zfh) { \
          return false;                  \
      }                                  \
  } while (0)
  
  #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
+    SMSTATEEN_CHECK(ctx); \
      if (!(ctx-&gt;cfg_ptr-&gt;ext_zfh || ctx-&gt;cfg_ptr-&gt;ext_zfhmin)) { \
          return false;                         \
      }                                         \
  } while (0)
  
  #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
+    SMSTATEEN_CHECK(ctx); \
      if (!(ctx-&gt;cfg_ptr-&gt;ext_zfh || ctx-&gt;cfg_ptr-&gt;ext_zfhmin
||          \
            ctx-&gt;cfg_ptr-&gt;ext_zhinx || ctx-&gt;cfg_ptr-&gt;ext_zhinxmin)) 
{     \
          return false;                                        \
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------3B4ECB259352EF16471EB275--


