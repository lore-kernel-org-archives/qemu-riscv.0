Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o9b2p-0001Mc-F1
	for mharc-qemu-riscv@gnu.org; Thu, 07 Jul 2022 19:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1o9b2o-0001JZ-1P; Thu, 07 Jul 2022 19:36:26 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:43232 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1o9b2k-0001IY-9v; Thu, 07 Jul 2022 19:36:25 -0400
Received: from [192.168.0.104] (unknown [117.151.235.252])
 by APP-01 (Coremail) with SMTP id qwCowACnrQXobcdiwiiYDQ--.18227S2;
 Fri, 08 Jul 2022 07:36:09 +0800 (CST)
Subject: Re: [RFC PATCH v5 2/4] target/riscv: smstateen check for h/senvcfg
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20220603160425.3667456-1-mchitale@ventanamicro.com>
 <20220603160425.3667456-3-mchitale@ventanamicro.com>
 <35f3afa1.21b5.181be7970fc.Coremail.angell1518@163.com>
 <f1da6f0a0a566badeadc95527457d6e0afe57a9f.camel@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <3975bc59-795f-9eb7-2721-73439e3fd68a@iscas.ac.cn>
Date: Fri, 8 Jul 2022 07:36:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <f1da6f0a0a566badeadc95527457d6e0afe57a9f.camel@ventanamicro.com>
Content-Type: multipart/alternative;
 boundary="------------E8E95FA6A1BBF6F2479A8DA9"
Content-Language: en-US
X-CM-TRANSID: qwCowACnrQXobcdiwiiYDQ--.18227S2
X-Coremail-Antispam: 1UD129KBjvJXoW3AF45Ar1xKr47AFW3tFy3CFg_yoWxtrWfpF
 4UXrZxG34vgryxZan3Gr98WF13C3yxJa9xZan7Wa1vyF43Jr4rJFZ8XFy3ZF4DWF95Xr1a
 v3yDtF1DCr4UZ3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487
 MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
 73UjIFyTuYvjfU8iSdDUUUU
X-Originating-IP: [117.151.235.252]
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
X-List-Received-Date: Thu, 07 Jul 2022 23:36:26 -0000

This is a multi-part message in MIME format.
--------------E8E95FA6A1BBF6F2479A8DA9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/7/8 上午1:20, Mayuresh Chitale 写道:
> On Sat, 2022-07-02 at 18:33 +0800, angell1518 wrote:
>> At 2022-06-04 00:04:23, "Mayuresh Chitale" <mchitale@ventanamicro.com
>>> wrote:
>>> Accesses to henvcfg, henvcfgh and senvcfg are allowed
>>> only if corresponding bit in mstateen0/hstateen0 is
>>> enabled. Otherwise an illegal instruction trap is
>>> generated.
>>>
>>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>>> ---
>>> target/riscv/csr.c | 84 ++++++++++++++++++++++++++++++++++++++++++-
>> ---
>>> 1 file changed, 78 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>> index 324fefce59..ae91ae1f7e 100644
>>> --- a/target/riscv/csr.c
>>> +++ b/target/riscv/csr.ccounteren
>>> @@ -39,6 +39,37 @@ void riscv_set_csr_ops(int csrno,
>> riscv_csr_operations *ops)
>>> }
>>>
>>> /* Predicates */
>>> +static RISCVException smstateen_acc_ok(CPURISCVState *env, int
>> mode, int bit)
>>> +{
>>> +    CPUState *cs = env_cpu(env);
>>> +    RISCVCPU *cpu = RISCV_CPU(cs);
>>> +    bool virt = riscv_cpu_virt_enabled(env);
>>> +
>>> +    if (!cpu->cfg.ext_smstateen) {
>>> +        return RISCV_EXCP_NONE;
>>> +    }
>>> +
>>> +#if !defined(CONFIG_USER_ONLY)
>>> +    if (!(env->mstateen[0] & 1UL << bit)) {
>>> +        return RISCV_EXCP_ILLEGAL_INST;
>>> +    }
>>> +
>> I think mstateen only control access in priv mode under M mode.
>> So we should take the current priv node into consideration here.
> For any curent priv mode if the required bit is not set in mstateen we
> can return here itself. For e.g if current priv mode is S then we only
> check the required bit in mstateen. If current priv mode is 'U', we
> need to check the required bit in mstateen and sstateen
>
mstateen only controls the access from less-privilege mode. So do hstateen and sstateen.  we should pass all of the
check, if current priv is PRV_M. like this:
+    if (env->priv == PRV_M) {
+        return RISCV_EXCP_NONE;
+    }

>>> +    if (virt) {
>>> +        if (!(env->hstateen[0] & 1UL << bit)) {
>>> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>> +        }
>>> +    }
>>> +
>>> +    if (mode == PRV_U) {
>>> +        if (!(env->sstateen[0] & 1UL << bit)) {
>>> +            return RISCV_EXCP_ILLEGAL_INST;
>>> + }
>> I think there are two problem here:
>> The first is that we should also take virt mode into consideration
>> here too.
> Actually virt mode is considered above for both priv modes S and U.

Yeah(we also should pass this check for current priv is PRV_M). However, 
there's still a problem

here: the mode here is the mode for csr not the current priv mode.  
Actually, Sstateen will control the access

for user mode csr(such as fcsr)  from U mode. So taking the following 
question into consideration, the  total check

may be:

+    if (mode == PRV_U &&env->priv == PRV_U) {
+        if (riscv_has_ext(env, RVS)  && !(env->sstateen[0] & 1UL << bit)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+ }

Regards,
Weiwei Li

>> As the spec said:
>> "if executing in VS or VU mode and the circumstances for a virtual
>> instruction
>> exception apply, raises a virtual instruction exception instead of an
>> illegal instruction exception"
>> So it will generate RISCV_EXCP_VIRT_INSTRUCTION_FAULT in VU mode.
>> The second is that sstateen csr works only when 'S' extension is
>> enabled
>>
> I will fix it in the next version.
>
>> Regards,
>> Weiwei Li
>>> +    }
>>> +#endif
>>> +
>>> +    return RISCV_EXCP_NONE;
>>> +}
>>> +
>>> static RISCVException fs(CPURISCVState *env, int csrno)
>>> {
>>> #if !defined(CONFIG_USER_ONLY)
>>> @@ -1557,6 +1588,13 @@ static RISCVException
>> write_menvcfgh(CPURISCVState *env, int csrno,
>>> static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
>>>                                   target_ulong *val)
>>> {
>>> +    RISCVException ret;
>>> +
>>> +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
>>> +    if (ret != RISCV_EXCP_NONE) {
>>> +        return ret;
>>> +    }
>>> +
>>>      *val = env->senvcfg;
>>>      return RISCV_EXCP_NONE;
>>> }
>>> @@ -1565,15 +1603,27 @@ static RISCVException
>> write_senvcfg(CPURISCVState *env, int csrno,
>>>                                    target_ulong val)
>>> {
>>>      uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE |
>> SENVCFG_CBZE;
>>> +    RISCVException ret;
>>>
>>> -    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
>>> +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
>>> +    if (ret != RISCV_EXCP_NONE) {
>>> +        return ret;
>>> +    }
>>>
>>> +    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
>>>      return RISCV_EXCP_NONE;
>>> }
>>>
>>> static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
>>>                                   target_ulong *val)
>>> {
>>> +    RISCVException ret;
>>> +
>>> +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
>>> +    if (ret != RISCV_EXCP_NONE) {
>>> +        return ret;
>>> +    }
>>> +
>>>      *val = env->henvcfg;
>>>      return RISCV_EXCP_NONE;
>>> }
>>> @@ -1582,6 +1632,12 @@ static RISCVException
>> write_henvcfg(CPURISCVState *env, int csrno,
>>>                                    target_ulong val)
>>> {
>>>      uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE |
>> HENVCFG_CBZE;
>>> +    RISCVException ret;
>>> +
>>> +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
>>> +    if (ret != RISCV_EXCP_NONE) {
>>> +        return ret;
>>> +    }
>>>
>>>      if (riscv_cpu_mxl(env) == MXL_RV64) {
>>>          mask |= HENVCFG_PBMTE | HENVCFG_STCE;
>>> @@ -1595,6 +1651,13 @@ static RISCVException
>> write_henvcfg(CPURISCVState *env, int csrno,
>>> static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
>>>                                   target_ulong *val)
>>> {
>>> +    RISCVException ret;
>>> +
>>> +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
>>> +    if (ret != RISCV_EXCP_NONE) {
>>> +        return ret;
>>> +    }
>>> +
>>>      *val = env->henvcfg >> 32;
>>>      return RISCV_EXCP_NONE;
>>> }
>>> @@ -1604,9 +1667,14 @@ static RISCVException
>> write_henvcfgh(CPURISCVState *env, int csrno,
>>> {
>>>      uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
>>>      uint64_t valh = (uint64_t)val << 32;
>>> +    RISCVException ret;
>>>
>>> -    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
>>> +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
>>> +    if (ret != RISCV_EXCP_NONE) {
>>> +        return ret;
>>> +    }
>>>
>>> +    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
>>>      return RISCV_EXCP_NONE;
>>> }
>>>
>>> @@ -1628,7 +1696,8 @@ static RISCVException
>> write_mstateen(CPURISCVState *env, int csrno,
>>>                                       target_ulong new_val)
>>> {
>>>      uint64_t *reg;
>>> -    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
>>> +    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
>>> +                       (1UL << SMSTATEEN0_HSENVCFG);
>>>
>>>      reg = &env->mstateen[csrno - CSR_MSTATEEN0];
>>>      write_smstateen(env, reg, wr_mask, new_val);
>>> @@ -1649,7 +1718,8 @@ static RISCVException
>> write_mstateenh(CPURISCVState *env, int csrno,
>>> {
>>>      uint64_t *reg;
>>>      uint64_t val;
>>> -    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
>>> +    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
>>> +                       (1UL << SMSTATEEN0_HSENVCFG);
>>>
>>>      reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
>>>      val = (uint64_t)new_val << 32;
>>> @@ -1671,7 +1741,8 @@ static RISCVException
>> write_hstateen(CPURISCVState *env, int csrno,
>>>                                       target_ulong new_val)
>>> {
>>>      uint64_t *reg;
>>> -    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
>>> +    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
>>> +                       (1UL << SMSTATEEN0_HSENVCFG);
>>>      int index = csrno - CSR_HSTATEEN0;
>>>
>>>      reg = &env->hstateen[index];
>>> @@ -1694,8 +1765,9 @@ static RISCVException
>> write_hstateenh(CPURISCVState *env, int csrno,
>>> {
>>>      uint64_t *reg;
>>>      uint64_t val;
>>> -    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
>>>      int index = csrno - CSR_HSTATEEN0H;
>>> +    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
>>> +                       (1UL << SMSTATEEN0_HSENVCFG);
>>>
>>>      reg = &env->hstateen[index];
>>>      val = (uint64_t)new_val << 32;
>>> -- 
>>> 2.25.1
>>>

--------------E8E95FA6A1BBF6F2479A8DA9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/7/8 上午1:20, Mayuresh Chitale 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:f1da6f0a0a566badeadc95527457d6e0afe57a9f.camel@ventanamicro.com">
      <pre class="moz-quote-pre" wrap="">On Sat, 2022-07-02 at 18:33 +0800, angell1518 wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">At 2022-06-04 00:04:23, "Mayuresh Chitale" &lt;<a class="moz-txt-link-abbreviated" href="mailto:mchitale@ventanamicro.com">mchitale@ventanamicro.com</a>
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">wrote:
Accesses to henvcfg, henvcfgh and senvcfg are allowed
only if corresponding bit in mstateen0/hstateen0 is
enabled. Otherwise an illegal instruction trap is
generated.

Signed-off-by: Mayuresh Chitale <a class="moz-txt-link-rfc2396E" href="mailto:mchitale@ventanamicro.com">&lt;mchitale@ventanamicro.com&gt;</a>
---
target/riscv/csr.c | 84 ++++++++++++++++++++++++++++++++++++++++++-
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">---
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">1 file changed, 78 insertions(+), 6 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 324fefce59..ae91ae1f7e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.ccounteren
@@ -39,6 +39,37 @@ void riscv_set_csr_ops(int csrno,
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">riscv_csr_operations *ops)
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">}

/* Predicates */
+static RISCVException smstateen_acc_ok(CPURISCVState *env, int
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">mode, int bit)
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    bool virt = riscv_cpu_virt_enabled(env);
+
+    if (!cpu-&gt;cfg.ext_smstateen) {
+        return RISCV_EXCP_NONE;
+    }
+
+#if !defined(CONFIG_USER_ONLY)
+    if (!(env-&gt;mstateen[0] &amp; 1UL &lt;&lt; bit)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I think mstateen only control access in priv mode under M mode.  
So we should take the current priv node into consideration here.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
For any curent priv mode if the required bit is not set in mstateen we
can return here itself. For e.g if current priv mode is S then we only
check the required bit in mstateen. If current priv mode is 'U', we
need to check the required bit in mstateen and sstateen

</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">mstateen only controls the access from less-privilege mode. So do hstateen and sstateen.  we should pass all of the
check, if current priv is PRV_M. like this:
+    if (env-&gt;priv == PRV_M) {
+        return RISCV_EXCP_NONE;
+    }</pre>
    <blockquote type="cite"
cite="mid:f1da6f0a0a566badeadc95527457d6e0afe57a9f.camel@ventanamicro.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+    if (virt) {
+        if (!(env-&gt;hstateen[0] &amp; 1UL &lt;&lt; bit)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+    }
+
+    if (mode == PRV_U) {
+        if (!(env-&gt;sstateen[0] &amp; 1UL &lt;&lt; bit)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+ }
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I think there are two problem here:
The first is that we should also take virt mode into consideration
here too. 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Actually virt mode is considered above for both priv modes S and U.
</pre>
    </blockquote>
    <p>Yeah(we also should pass this check for current priv is PRV_M).
      However, there's still a problem <br>
    </p>
    <p>here: the mode here is the mode for csr not the current priv
      mode.  Actually, Sstateen will control the access</p>
    <p>for user mode csr(such as fcsr)  from U mode. So taking the
      following question into consideration, the  total check</p>
    <p>may be:</p>
    <pre class="moz-quote-pre" wrap="">+    if (mode == PRV_U &amp;&amp; <span style="color: #001080;">env</span><span style="color: #000000;">-&gt;</span><span style="color: #001080;">priv == PRV_U</span>) {
+        if (<span style="color: #000000;"></span><span style="color: #795e26;">riscv_has_ext</span><span style="color: #000000;">(</span><span style="color: #001080;">env</span><span style="color: #000000;">, </span><span style="color: #0000ff;">RVS</span><span style="color: #000000;">)</span> &amp;&amp; !(env-&gt;sstateen[0] &amp; 1UL &lt;&lt; bit)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+ }

Regards,
Weiwei Li
</pre>
    <blockquote type="cite"
cite="mid:f1da6f0a0a566badeadc95527457d6e0afe57a9f.camel@ventanamicro.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">As the spec said: 
"if executing in VS or VU mode and the circumstances for a virtual
instruction
exception apply, raises a virtual instruction exception instead of an
illegal instruction exception"
So it will generate RISCV_EXCP_VIRT_INSTRUCTION_FAULT in VU mode.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
The second is that sstateen csr works only when 'S' extension is
enabled

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">I will fix it in the next version.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Regards,
Weiwei Li
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+    }
+#endif
+
+    return RISCV_EXCP_NONE;
+}
+
static RISCVException fs(CPURISCVState *env, int csrno)
{
#if !defined(CONFIG_USER_ONLY)
@@ -1557,6 +1588,13 @@ static RISCVException
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">write_menvcfgh(CPURISCVState *env, int csrno,
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
                                 target_ulong *val)
{
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
    *val = env-&gt;senvcfg;
    return RISCV_EXCP_NONE;
}
@@ -1565,15 +1603,27 @@ static RISCVException
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">write_senvcfg(CPURISCVState *env, int csrno,
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">                                  target_ulong val)
{
    uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE |
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">SENVCFG_CBZE;
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+    RISCVException ret;

-    env-&gt;senvcfg = (env-&gt;senvcfg &amp; ~mask) | (val &amp; mask);
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }

+    env-&gt;senvcfg = (env-&gt;senvcfg &amp; ~mask) | (val &amp; mask);
    return RISCV_EXCP_NONE;
}

static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
                                 target_ulong *val)
{
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
    *val = env-&gt;henvcfg;
    return RISCV_EXCP_NONE;
}
@@ -1582,6 +1632,12 @@ static RISCVException
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">write_henvcfg(CPURISCVState *env, int csrno,
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">                                  target_ulong val)
{
    uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE |
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">HENVCFG_CBZE;
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }

    if (riscv_cpu_mxl(env) == MXL_RV64) {
        mask |= HENVCFG_PBMTE | HENVCFG_STCE;
@@ -1595,6 +1651,13 @@ static RISCVException
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">write_henvcfg(CPURISCVState *env, int csrno,
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
                                 target_ulong *val)
{
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
    *val = env-&gt;henvcfg &gt;&gt; 32;
    return RISCV_EXCP_NONE;
}
@@ -1604,9 +1667,14 @@ static RISCVException
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">write_henvcfgh(CPURISCVState *env, int csrno,
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">{
    uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
    uint64_t valh = (uint64_t)val &lt;&lt; 32;
+    RISCVException ret;

-    env-&gt;henvcfg = (env-&gt;henvcfg &amp; ~mask) | (valh &amp; mask);
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }

+    env-&gt;henvcfg = (env-&gt;henvcfg &amp; ~mask) | (valh &amp; mask);
    return RISCV_EXCP_NONE;
}

@@ -1628,7 +1696,8 @@ static RISCVException
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">write_mstateen(CPURISCVState *env, int csrno,
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">                                     target_ulong new_val)
{
    uint64_t *reg;
-    uint64_t wr_mask = 1UL &lt;&lt; SMSTATEEN_STATEN;
+    uint64_t wr_mask = (1UL &lt;&lt; SMSTATEEN_STATEN) |
+                       (1UL &lt;&lt; SMSTATEEN0_HSENVCFG);

    reg = &amp;env-&gt;mstateen[csrno - CSR_MSTATEEN0];
    write_smstateen(env, reg, wr_mask, new_val);
@@ -1649,7 +1718,8 @@ static RISCVException
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">write_mstateenh(CPURISCVState *env, int csrno,
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">{
    uint64_t *reg;
    uint64_t val;
-    uint64_t wr_mask = 1UL &lt;&lt; SMSTATEEN_STATEN;
+    uint64_t wr_mask = (1UL &lt;&lt; SMSTATEEN_STATEN) |
+                       (1UL &lt;&lt; SMSTATEEN0_HSENVCFG);

    reg = &amp;env-&gt;mstateen[csrno - CSR_MSTATEEN0H];
    val = (uint64_t)new_val &lt;&lt; 32;
@@ -1671,7 +1741,8 @@ static RISCVException
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">write_hstateen(CPURISCVState *env, int csrno,
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">                                     target_ulong new_val)
{
    uint64_t *reg;
-    uint64_t wr_mask = 1UL &lt;&lt; SMSTATEEN_STATEN;
+    uint64_t wr_mask = (1UL &lt;&lt; SMSTATEEN_STATEN) |
+                       (1UL &lt;&lt; SMSTATEEN0_HSENVCFG);
    int index = csrno - CSR_HSTATEEN0;

    reg = &amp;env-&gt;hstateen[index];
@@ -1694,8 +1765,9 @@ static RISCVException
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">write_hstateenh(CPURISCVState *env, int csrno,
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">{
    uint64_t *reg;
    uint64_t val;
-    uint64_t wr_mask = 1UL &lt;&lt; SMSTATEEN_STATEN;
    int index = csrno - CSR_HSTATEEN0H;
+    uint64_t wr_mask = (1UL &lt;&lt; SMSTATEEN_STATEN) |
+                       (1UL &lt;&lt; SMSTATEEN0_HSENVCFG);

    reg = &amp;env-&gt;hstateen[index];
    val = (uint64_t)new_val &lt;&lt; 32;
-- 
2.25.1

</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E8E95FA6A1BBF6F2479A8DA9--


