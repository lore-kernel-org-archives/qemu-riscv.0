Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGrpa-0007KY-E6
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 20:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oGrpZ-0007KH-6G; Wed, 27 Jul 2022 20:56:49 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:51196 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oGrpV-0000Lz-7E; Wed, 27 Jul 2022 20:56:48 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-01 (Coremail) with SMTP id qwCowABXnJzC3uFi0R5LAw--.9038S2;
 Thu, 28 Jul 2022 08:56:35 +0800 (CST)
Subject: Re: [PATCH v11 2/6] target/riscv: Simplify counter predicate function
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <20220727064913.1041427-1-atishp@rivosinc.com>
 <20220727064913.1041427-3-atishp@rivosinc.com>
 <4fe4fca9-71ea-de77-1db1-b02302599881@iscas.ac.cn>
 <CAHBxVyG3rqFRrTk0FavPm7M6bdOjkeoyb6OkN4JOVNVg25t6yQ@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <aaada990-4c26-3352-2eae-6168d45bb87d@iscas.ac.cn>
Date: Thu, 28 Jul 2022 08:56:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHBxVyG3rqFRrTk0FavPm7M6bdOjkeoyb6OkN4JOVNVg25t6yQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------4D295783DE73D09E090A8209"
Content-Language: en-US
X-CM-TRANSID: qwCowABXnJzC3uFi0R5LAw--.9038S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtr4kAr18AryUXFWfXFW3GFg_yoW3Zw1xpF
 1rt3y7GrWjqrn5Gw17Jr1UXry8Xr1UXas8Gw1UXF18Jr1UAr1YqF1UWr1jgrW8Jr40qr4D
 Jr1UXr9xZFW5XwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487
 MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
 73UjIFyTuYvjfUeID7DUUUU
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
X-List-Received-Date: Thu, 28 Jul 2022 00:56:49 -0000

This is a multi-part message in MIME format.
--------------4D295783DE73D09E090A8209
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/7/28 上午5:40, Atish Kumar Patra 写道:
>
>
> On Wed, Jul 27, 2022 at 1:35 AM Weiwei Li <liweiwei@iscas.ac.cn 
> <mailto:liweiwei@iscas.ac.cn>> wrote:
>
>
>     在 2022/7/27 下午2:49, Atish Patra 写道:
>     > All the hpmcounters and the fixed counters (CY, IR, TM) can be
>     represented
>     > as a unified counter. Thus, the predicate function doesn't need
>     handle each
>     > case separately.
>     >
>     > Simplify the predicate function so that we just handle things
>     differently
>     > between RV32/RV64 and S/HS mode.
>     >
>     > Reviewed-by: Bin Meng <bmeng.cn@gmail.com
>     <mailto:bmeng.cn@gmail.com>>
>     > Acked-by: Alistair Francis <alistair.francis@wdc.com
>     <mailto:alistair.francis@wdc.com>>
>     > Signed-off-by: Atish Patra <atishp@rivosinc.com
>     <mailto:atishp@rivosinc.com>>
>     > ---
>     >   target/riscv/csr.c | 112
>     +++++----------------------------------------
>     >   1 file changed, 11 insertions(+), 101 deletions(-)
>     >
>     > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>     > index 1233bfa0a726..57dbbf9b09a0 100644
>     > --- a/target/riscv/csr.c
>     > +++ b/target/riscv/csr.c
>     > @@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env,
>     int csrno)
>     >       CPUState *cs = env_cpu(env);
>     >       RISCVCPU *cpu = RISCV_CPU(cs);
>     >       int ctr_index;
>     > +    target_ulong ctr_mask;
>     >       int base_csrno = CSR_CYCLE;
>     >       bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
>     >
>     > @@ -82,122 +83,31 @@ static RISCVException ctr(CPURISCVState
>     *env, int csrno)
>     >           base_csrno += 0x80;
>     >       }
>     >       ctr_index = csrno - base_csrno;
>     > +    ctr_mask = BIT(ctr_index);
>     >
>     >       if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
>     >           (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
>     >           goto skip_ext_pmu_check;
>     >       }
>     >
>     > -    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs &
>     BIT(ctr_index)))) {
>     > +    if (!(cpu->pmu_avail_ctrs & ctr_mask)) {
>     >           /* No counter is enabled in PMU or the counter is out
>     of range */
>     >           return RISCV_EXCP_ILLEGAL_INST;
>     >       }
>     >
>     >   skip_ext_pmu_check:
>     >
>     > -    if (env->priv == PRV_S) {
>     > -        switch (csrno) {
>     > -        case CSR_CYCLE:
>     > -            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
>     > -                return RISCV_EXCP_ILLEGAL_INST;
>     > -            }
>     > -            break;
>     > -        case CSR_TIME:
>     > -            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
>     > -                return RISCV_EXCP_ILLEGAL_INST;
>     > -            }
>     > -            break;
>     > -        case CSR_INSTRET:
>     > -            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
>     > -                return RISCV_EXCP_ILLEGAL_INST;
>     > -            }
>     > -            break;
>     > -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
>     > -            if (!get_field(env->mcounteren, 1 << ctr_index)) {
>     > -                return RISCV_EXCP_ILLEGAL_INST;
>     > -            }
>     > -            break;
>     > -        }
>     > -        if (rv32) {
>     > -            switch (csrno) {
>     > -            case CSR_CYCLEH:
>     > -                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
>     > -                    return RISCV_EXCP_ILLEGAL_INST;
>     > -                }
>     > -                break;
>     > -            case CSR_TIMEH:
>     > -                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
>     > -                    return RISCV_EXCP_ILLEGAL_INST;
>     > -                }
>     > -                break;
>     > -            case CSR_INSTRETH:
>     > -                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
>     > -                    return RISCV_EXCP_ILLEGAL_INST;
>     > -                }
>     > -                break;
>     > -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
>     > -                if (!get_field(env->mcounteren, 1 << ctr_index)) {
>     > -                    return RISCV_EXCP_ILLEGAL_INST;
>     > -                }
>     > -                break;
>     > -            }
>     > -        }
>     > +    if (((env->priv == PRV_S) && (!get_field(env->mcounteren,
>     ctr_mask))) ||
>     > +       ((env->priv == PRV_U) && (!get_field(env->scounteren,
>     ctr_mask)))) {
>     > +        return RISCV_EXCP_ILLEGAL_INST;
>     >       }
>     >
>     >       if (riscv_cpu_virt_enabled(env)) {
>     > -        switch (csrno) {
>     > -        case CSR_CYCLE:
>     > -            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
>     > -                get_field(env->mcounteren, COUNTEREN_CY)) {
>     > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>     > -            }
>     > -            break;
>     > -        case CSR_TIME:
>     > -            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
>     > -                get_field(env->mcounteren, COUNTEREN_TM)) {
>     > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>     > -            }
>     > -            break;
>     > -        case CSR_INSTRET:
>     > -            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
>     > -                get_field(env->mcounteren, COUNTEREN_IR)) {
>     > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>     > -            }
>     > -            break;
>     > -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
>     > -            if (!get_field(env->hcounteren, 1 << ctr_index) &&
>     > -                 get_field(env->mcounteren, 1 << ctr_index)) {
>     > -                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>     > -            }
>     > -            break;
>     > -        }
>     > -        if (rv32) {
>     > -            switch (csrno) {
>     > -            case CSR_CYCLEH:
>     > -                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
>     > -                    get_field(env->mcounteren, COUNTEREN_CY)) {
>     > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>     > -                }
>     > -                break;
>     > -            case CSR_TIMEH:
>     > -                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
>     > -                    get_field(env->mcounteren, COUNTEREN_TM)) {
>     > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>     > -                }
>     > -                break;
>     > -            case CSR_INSTRETH:
>     > -                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
>     > -                    get_field(env->mcounteren, COUNTEREN_IR)) {
>     > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>     > -                }
>     > -                break;
>     > -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
>     > -                if (!get_field(env->hcounteren, 1 << ctr_index) &&
>     > -                     get_field(env->mcounteren, 1 << ctr_index)) {
>     > -                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>     > -                }
>     > -                break;
>     > -            }
>     > +        if (!get_field(env->mcounteren, ctr_mask)) {
>     > +            /* The bit must be set in mcountern for HS mode
>     access */
>     > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>     > +        } else if (!get_field(env->hcounteren, ctr_mask)) {
>     > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>     >           }
>
>     The logic is changed here. In original logic,
>     RISCV_EXCP_VIRT_INSTRUCTION_FAULT is triggered when
>
>     !get_field(env->hcounteren, 1 << ctr_index) &&
>     get_field(env->mcounteren, 1 << ctr_index)
>
>     The new logic is RISCV_EXCP_VIRT_INSTRUCTION_FAULT is triggered
>     when !get_field(env->mcounteren, ctr_mask)
>
>     or !get_field(env->hcounteren, 1 << ctr_index) &&
>     get_field(env->mcounteren, 1 << ctr_index)
>
>
> Yes. It's just an optimization where we can break early just by 
> checking mcountern. Do you see any issue with it ?

The section 8.6.1 of  riscv- privileged spec lists the cases (including 
the Xcounten ralated cases) which will raise a

virtual instruction exception. However all the the Xcounten ralated 
cases have a common condition

         "the same bit in mcounteren is 1".

So  this  optimization seems not correct.

Regards,

Weiwei Li

>     Regards,
>
>     Weiwei Li
>
>     >       }
>     >   #endif
>

--------------4D295783DE73D09E090A8209
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/7/28 上午5:40, Atish Kumar Patra
      写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAHBxVyG3rqFRrTk0FavPm7M6bdOjkeoyb6OkN4JOVNVg25t6yQ@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Jul 27, 2022 at 1:35
            AM Weiwei Li &lt;<a href="mailto:liweiwei@iscas.ac.cn"
              moz-do-not-send="true">liweiwei@iscas.ac.cn</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote"><br>
            在 2022/7/27 下午2:49, Atish Patra 写道:<br>
            &gt; All the hpmcounters and the fixed counters (CY, IR, TM)
            can be represented<br>
            &gt; as a unified counter. Thus, the predicate function
            doesn't need handle each<br>
            &gt; case separately.<br>
            &gt;<br>
            &gt; Simplify the predicate function so that we just handle
            things differently<br>
            &gt; between RV32/RV64 and S/HS mode.<br>
            &gt;<br>
            &gt; Reviewed-by: Bin Meng &lt;<a
              href="mailto:bmeng.cn@gmail.com" target="_blank"
              moz-do-not-send="true">bmeng.cn@gmail.com</a>&gt;<br>
            &gt; Acked-by: Alistair Francis &lt;<a
              href="mailto:alistair.francis@wdc.com" target="_blank"
              moz-do-not-send="true">alistair.francis@wdc.com</a>&gt;<br>
            &gt; Signed-off-by: Atish Patra &lt;<a
              href="mailto:atishp@rivosinc.com" target="_blank"
              moz-do-not-send="true">atishp@rivosinc.com</a>&gt;<br>
            &gt; ---<br>
            &gt;   target/riscv/csr.c | 112
            +++++----------------------------------------<br>
            &gt;   1 file changed, 11 insertions(+), 101 deletions(-)<br>
            &gt;<br>
            &gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
            &gt; index 1233bfa0a726..57dbbf9b09a0 100644<br>
            &gt; --- a/target/riscv/csr.c<br>
            &gt; +++ b/target/riscv/csr.c<br>
            &gt; @@ -74,6 +74,7 @@ static RISCVException
            ctr(CPURISCVState *env, int csrno)<br>
            &gt;       CPUState *cs = env_cpu(env);<br>
            &gt;       RISCVCPU *cpu = RISCV_CPU(cs);<br>
            &gt;       int ctr_index;<br>
            &gt; +    target_ulong ctr_mask;<br>
            &gt;       int base_csrno = CSR_CYCLE;<br>
            &gt;       bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true
            : false;<br>
            &gt;   <br>
            &gt; @@ -82,122 +83,31 @@ static RISCVException
            ctr(CPURISCVState *env, int csrno)<br>
            &gt;           base_csrno += 0x80;<br>
            &gt;       }<br>
            &gt;       ctr_index = csrno - base_csrno;<br>
            &gt; +    ctr_mask = BIT(ctr_index);<br>
            &gt;   <br>
            &gt;       if ((csrno &gt;= CSR_CYCLE &amp;&amp; csrno &lt;=
            CSR_INSTRET) ||<br>
            &gt;           (csrno &gt;= CSR_CYCLEH &amp;&amp; csrno
            &lt;= CSR_INSTRETH)) {<br>
            &gt;           goto skip_ext_pmu_check;<br>
            &gt;       }<br>
            &gt;   <br>
            &gt; -    if ((!cpu-&gt;cfg.pmu_num ||
            !(cpu-&gt;pmu_avail_ctrs &amp; BIT(ctr_index)))) {<br>
            &gt; +    if (!(cpu-&gt;pmu_avail_ctrs &amp; ctr_mask)) {<br>
            &gt;           /* No counter is enabled in PMU or the
            counter is out of range */<br>
            &gt;           return RISCV_EXCP_ILLEGAL_INST;<br>
            &gt;       }<br>
            &gt;   <br>
            &gt;   skip_ext_pmu_check:<br>
            &gt;   <br>
            &gt; -    if (env-&gt;priv == PRV_S) {<br>
            &gt; -        switch (csrno) {<br>
            &gt; -        case CSR_CYCLE:<br>
            &gt; -            if (!get_field(env-&gt;mcounteren,
            COUNTEREN_CY)) {<br>
            &gt; -                return RISCV_EXCP_ILLEGAL_INST;<br>
            &gt; -            }<br>
            &gt; -            break;<br>
            &gt; -        case CSR_TIME:<br>
            &gt; -            if (!get_field(env-&gt;mcounteren,
            COUNTEREN_TM)) {<br>
            &gt; -                return RISCV_EXCP_ILLEGAL_INST;<br>
            &gt; -            }<br>
            &gt; -            break;<br>
            &gt; -        case CSR_INSTRET:<br>
            &gt; -            if (!get_field(env-&gt;mcounteren,
            COUNTEREN_IR)) {<br>
            &gt; -                return RISCV_EXCP_ILLEGAL_INST;<br>
            &gt; -            }<br>
            &gt; -            break;<br>
            &gt; -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:<br>
            &gt; -            if (!get_field(env-&gt;mcounteren, 1
            &lt;&lt; ctr_index)) {<br>
            &gt; -                return RISCV_EXCP_ILLEGAL_INST;<br>
            &gt; -            }<br>
            &gt; -            break;<br>
            &gt; -        }<br>
            &gt; -        if (rv32) {<br>
            &gt; -            switch (csrno) {<br>
            &gt; -            case CSR_CYCLEH:<br>
            &gt; -                if (!get_field(env-&gt;mcounteren,
            COUNTEREN_CY)) {<br>
            &gt; -                    return RISCV_EXCP_ILLEGAL_INST;<br>
            &gt; -                }<br>
            &gt; -                break;<br>
            &gt; -            case CSR_TIMEH:<br>
            &gt; -                if (!get_field(env-&gt;mcounteren,
            COUNTEREN_TM)) {<br>
            &gt; -                    return RISCV_EXCP_ILLEGAL_INST;<br>
            &gt; -                }<br>
            &gt; -                break;<br>
            &gt; -            case CSR_INSTRETH:<br>
            &gt; -                if (!get_field(env-&gt;mcounteren,
            COUNTEREN_IR)) {<br>
            &gt; -                    return RISCV_EXCP_ILLEGAL_INST;<br>
            &gt; -                }<br>
            &gt; -                break;<br>
            &gt; -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:<br>
            &gt; -                if (!get_field(env-&gt;mcounteren, 1
            &lt;&lt; ctr_index)) {<br>
            &gt; -                    return RISCV_EXCP_ILLEGAL_INST;<br>
            &gt; -                }<br>
            &gt; -                break;<br>
            &gt; -            }<br>
            &gt; -        }<br>
            &gt; +    if (((env-&gt;priv == PRV_S) &amp;&amp;
            (!get_field(env-&gt;mcounteren, ctr_mask))) ||<br>
            &gt; +       ((env-&gt;priv == PRV_U) &amp;&amp;
            (!get_field(env-&gt;scounteren, ctr_mask)))) {<br>
            &gt; +        return RISCV_EXCP_ILLEGAL_INST;<br>
            &gt;       }<br>
            &gt;   <br>
            &gt;       if (riscv_cpu_virt_enabled(env)) {<br>
            &gt; -        switch (csrno) {<br>
            &gt; -        case CSR_CYCLE:<br>
            &gt; -            if (!get_field(env-&gt;hcounteren,
            COUNTEREN_CY) &amp;&amp;<br>
            &gt; -                get_field(env-&gt;mcounteren,
            COUNTEREN_CY)) {<br>
            &gt; -                return
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; -            }<br>
            &gt; -            break;<br>
            &gt; -        case CSR_TIME:<br>
            &gt; -            if (!get_field(env-&gt;hcounteren,
            COUNTEREN_TM) &amp;&amp;<br>
            &gt; -                get_field(env-&gt;mcounteren,
            COUNTEREN_TM)) {<br>
            &gt; -                return
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; -            }<br>
            &gt; -            break;<br>
            &gt; -        case CSR_INSTRET:<br>
            &gt; -            if (!get_field(env-&gt;hcounteren,
            COUNTEREN_IR) &amp;&amp;<br>
            &gt; -                get_field(env-&gt;mcounteren,
            COUNTEREN_IR)) {<br>
            &gt; -                return
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; -            }<br>
            &gt; -            break;<br>
            &gt; -        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:<br>
            &gt; -            if (!get_field(env-&gt;hcounteren, 1
            &lt;&lt; ctr_index) &amp;&amp;<br>
            &gt; -                 get_field(env-&gt;mcounteren, 1
            &lt;&lt; ctr_index)) {<br>
            &gt; -                return
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; -            }<br>
            &gt; -            break;<br>
            &gt; -        }<br>
            &gt; -        if (rv32) {<br>
            &gt; -            switch (csrno) {<br>
            &gt; -            case CSR_CYCLEH:<br>
            &gt; -                if (!get_field(env-&gt;hcounteren,
            COUNTEREN_CY) &amp;&amp;<br>
            &gt; -                    get_field(env-&gt;mcounteren,
            COUNTEREN_CY)) {<br>
            &gt; -                    return
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; -                }<br>
            &gt; -                break;<br>
            &gt; -            case CSR_TIMEH:<br>
            &gt; -                if (!get_field(env-&gt;hcounteren,
            COUNTEREN_TM) &amp;&amp;<br>
            &gt; -                    get_field(env-&gt;mcounteren,
            COUNTEREN_TM)) {<br>
            &gt; -                    return
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; -                }<br>
            &gt; -                break;<br>
            &gt; -            case CSR_INSTRETH:<br>
            &gt; -                if (!get_field(env-&gt;hcounteren,
            COUNTEREN_IR) &amp;&amp;<br>
            &gt; -                    get_field(env-&gt;mcounteren,
            COUNTEREN_IR)) {<br>
            &gt; -                    return
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; -                }<br>
            &gt; -                break;<br>
            &gt; -            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:<br>
            &gt; -                if (!get_field(env-&gt;hcounteren, 1
            &lt;&lt; ctr_index) &amp;&amp;<br>
            &gt; -                     get_field(env-&gt;mcounteren, 1
            &lt;&lt; ctr_index)) {<br>
            &gt; -                    return
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; -                }<br>
            &gt; -                break;<br>
            &gt; -            }<br>
            &gt; +        if (!get_field(env-&gt;mcounteren, ctr_mask))
            {<br>
            &gt; +            /* The bit must be set in mcountern for HS
            mode access */<br>
            &gt; +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt; +        } else if (!get_field(env-&gt;hcounteren,
            ctr_mask)) {<br>
            &gt; +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
            &gt;           }<br>
            <br>
            The logic is changed here. In original logic, <br>
            RISCV_EXCP_VIRT_INSTRUCTION_FAULT is triggered when<br>
            <br>
            !get_field(env-&gt;hcounteren, 1 &lt;&lt; ctr_index)
            &amp;&amp; get_field(env-&gt;mcounteren, 1 &lt;&lt;
            ctr_index)<br>
            <br>
            The new logic is RISCV_EXCP_VIRT_INSTRUCTION_FAULT is
            triggered when !get_field(env-&gt;mcounteren, ctr_mask)<br>
            <br>
            or !get_field(env-&gt;hcounteren, 1 &lt;&lt; ctr_index)
            &amp;&amp; get_field(env-&gt;mcounteren, 1 &lt;&lt;
            ctr_index)<br>
            <br>
          </blockquote>
          <div><br>
            Yes. It's just an optimization where we can break early just
            by checking mcountern. Do you see any issue with it ?</div>
        </div>
      </div>
    </blockquote>
    <p>The section 8.6.1 of  riscv- privileged spec lists the cases
      (including the Xcounten ralated cases) which will raise a<br>
    </p>
    <p>virtual instruction exception. However all the the Xcounten
      ralated cases have a common condition <br>
    </p>
    <p>        "the same bit in mcounteren is 1".</p>
    <p> So  this  optimization seems not correct.<br>
    </p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type="cite"
cite="mid:CAHBxVyG3rqFRrTk0FavPm7M6bdOjkeoyb6OkN4JOVNVg25t6yQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <blockquote class="gmail_quote">
            Regards,<br>
            <br>
            Weiwei Li<br>
            <br>
            &gt;       }<br>
            &gt;   #endif<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------4D295783DE73D09E090A8209--


