Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBpxr-0007Fn-0r
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 22:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBpxo-0007FA-Ra; Thu, 05 Aug 2021 22:52:00 -0400
Received: from out28-171.mail.aliyun.com ([115.124.28.171]:32807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBpxh-00013T-25; Thu, 05 Aug 2021 22:52:00 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07449705|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.270346-0.00510486-0.724549;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.Kw1xmlF_1628218277; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Kw1xmlF_1628218277) by smtp.aliyun-inc.com(10.147.40.7);
 Fri, 06 Aug 2021 10:51:17 +0800
Subject: Re: [RFC PATCH 01/13] target/riscv: Add UXL to tb flags
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-2-zhiwei_liu@c-sky.com>
 <94c93e5e-3469-e81c-33b8-9a6ba7f4922a@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <1030e7cf-63d3-27e7-a7ed-448b134763cb@c-sky.com>
Date: Fri, 6 Aug 2021 10:49:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <94c93e5e-3469-e81c-33b8-9a6ba7f4922a@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------4517E86A2B7F8CF8536EAC3F"
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.171; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-171.mail.aliyun.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Aug 2021 02:52:01 -0000

This is a multi-part message in MIME format.
--------------4517E86A2B7F8CF8536EAC3F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021/8/6 上午3:01, Richard Henderson wrote:
> On 8/4/21 4:53 PM, LIU Zhiwei wrote:
>> For 32-bit applications run on 64-bit cpu, it may share some code
>> with other 64-bit applictions. Thus we should distinguish the translated
>> cache of the share code with a tb flag.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/cpu.h       | 15 +++++++++++++++
>>   target/riscv/translate.c |  3 +++
>>   2 files changed, 18 insertions(+)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index bf1c899c00..2b3ba21a78 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -394,9 +394,20 @@ FIELD(TB_FLAGS, SEW, 5, 3)
>>   FIELD(TB_FLAGS, VILL, 8, 1)
>>   /* Is a Hypervisor instruction load/store allowed? */
>>   FIELD(TB_FLAGS, HLSX, 9, 1)
>> +FIELD(TB_FLAGS, UXL, 10, 2)
>
> Are you intending to reserve space for RV128 here?
> Otherwise this could be a single bit.
>
Yes.
> Also, you probably don't want to name it "UXL", since it should 
> indicate the current operating XLEN, taking MXL, SXL and UXL into 
> account.
>
Hi Richard,

I don't have the ambitious to define a XLEN32 at least for this patch 
set. I think it is much more difficult.

The only purpose of this patch set is that we can run 32-bit application 
on  a 64 bit Linux from qemu-system-riscv64.

So  I didn't change the default behavior of every instruction except when

 1. Current CPU is 64 bit CPU, i.s. TARGET_LONG_BITS is 64.
 2. Current privileged is U-mode.
 3. UXL is 1.

I know that Alistair has done a lot to support 32-bit CPU on 
qemu-system-riscv64. But We are doing different things,
and it maybe a little confusing.

I still do not find a good to combine them. In my opinion, some code in 
this patch set can be reused for SXL32.
If you have any advice, please let me know.

Best Regards,
Zhiwei

> Perhaps just name the field XLEN32, and make it a single bit?
>
>> +static inline bool riscv_cpu_is_uxl32(CPURISCVState *env)
>> +{
>> +#ifndef CONFIG_USER_ONLY
>> +    return (get_field(env->mstatus, MSTATUS64_UXL) == 1) &&
>> +           !riscv_cpu_is_32bit(env) &&
>> +           (env->priv == PRV_U);
>> +#endif
>> +    return false;
>> +}
>
> Again, naming could be better?
> It seems trivial to handle all of the fields here.  Perhaps
>
>
> static inline bool riscv_cpu_is_xlen32(env)
> {
> #if defined(TARGET_RISCV32)
>     return true;
> #elif defined(CONFIG_USER_ONLY)
>     return false;
> #else
>     /* When emulating a 32-bit-only cpu, use RV32. */
>     if (riscv_cpu_is_32bit(env)) {
>         return true;
>     }
>     /*
>      * If MXL has been reduced to RV32, MSTATUSH doesn't have UXL/SXL,
>      * therefore, XLEN cannot be widened back to RV64 for lower privs.
>      */
>     if (get_field(env->misa, MISA64_MXL) == 1) {
>         return true;
>     }
>     switch (env->priv) {
>     case PRV_M:
>         return false;
>     case PRV_U:
>         return get_field(env->mstatus, MSTATUS64_UXL) == 1;
>     default: /* PRV_S & PRV_H */
>         return get_field(env->mstatus, MSTATUS64_SXL) == 1;
>     }
> #endif
> }
>
>
>> @@ -451,6 +462,10 @@ static inline void 
>> cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>>               flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
>>           }
>>       }
>> +    if (riscv_cpu_is_uxl32(env)) {
>> +        flags = FIELD_DP32(flags, TB_FLAGS, UXL,
>> +                           get_field(env->mstatus, MSTATUS64_UXL));
>
>   flags = FIELD_DP32(flags, TB_FLAGS, XLEN32,
>                      riscv_cpu_is_xlen32(env));
>
>
> r~

--------------4517E86A2B7F8CF8536EAC3F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021/8/6 上午3:01, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:94c93e5e-3469-e81c-33b8-9a6ba7f4922a@linaro.org">On
      8/4/21 4:53 PM, LIU Zhiwei wrote:
      <br>
      <blockquote type="cite">For 32-bit applications run on 64-bit cpu,
        it may share some code
        <br>
        with other 64-bit applictions. Thus we should distinguish the
        translated
        <br>
        cache of the share code with a tb flag.
        <br>
        <br>
        Signed-off-by: LIU Zhiwei <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@c-sky.com">&lt;zhiwei_liu@c-sky.com&gt;</a>
        <br>
        ---
        <br>
          target/riscv/cpu.h       | 15 +++++++++++++++
        <br>
          target/riscv/translate.c |  3 +++
        <br>
          2 files changed, 18 insertions(+)
        <br>
        <br>
        diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
        <br>
        index bf1c899c00..2b3ba21a78 100644
        <br>
        --- a/target/riscv/cpu.h
        <br>
        +++ b/target/riscv/cpu.h
        <br>
        @@ -394,9 +394,20 @@ FIELD(TB_FLAGS, SEW, 5, 3)
        <br>
          FIELD(TB_FLAGS, VILL, 8, 1)
        <br>
          /* Is a Hypervisor instruction load/store allowed? */
        <br>
          FIELD(TB_FLAGS, HLSX, 9, 1)
        <br>
        +FIELD(TB_FLAGS, UXL, 10, 2)
        <br>
      </blockquote>
      <br>
      Are you intending to reserve space for RV128 here?
      <br>
      Otherwise this could be a single bit.
      <br>
      <br>
    </blockquote>
    Yes.<br>
    <blockquote type="cite"
      cite="mid:94c93e5e-3469-e81c-33b8-9a6ba7f4922a@linaro.org">Also,
      you probably don't want to name it "UXL", since it should indicate
      the current operating XLEN, taking MXL, SXL and UXL into account.
      <br>
      <br>
    </blockquote>
    <p>Hi Richard,<br>
    </p>
    <p>I don't have the ambitious to define a XLEN32 at least for this
      patch set. I think it is much more difficult.</p>
    <p>The only purpose of this patch set is that we can run 32-bit
      application on  a 64 bit Linux from qemu-system-riscv64.</p>
    <p>So  I didn't change the default behavior of every instruction
      except when <br>
    </p>
    <ol>
      <li>Current CPU is 64 bit CPU, i.s. TARGET_LONG_BITS is 64.<br>
      </li>
      <li>Current privileged is U-mode.</li>
      <li>UXL is 1.</li>
    </ol>
    <p>I know that Alistair has done a lot to support 32-bit CPU on
      qemu-system-riscv64. But We are doing different things,<br>
      and it maybe a little confusing.</p>
    <p>I still do not find a good to combine them. In my opinion, some
      code in this patch set can be reused for SXL32. <br>
      If you have any advice, please let me know.</p>
    <p>Best Regards,<br>
      Zhiwei<br>
    </p>
    <blockquote type="cite"
      cite="mid:94c93e5e-3469-e81c-33b8-9a6ba7f4922a@linaro.org">Perhaps
      just name the field XLEN32, and make it a single bit?
      <br>
      <br>
      <blockquote type="cite">+static inline bool
        riscv_cpu_is_uxl32(CPURISCVState *env)
        <br>
        +{
        <br>
        +#ifndef CONFIG_USER_ONLY
        <br>
        +    return (get_field(env-&gt;mstatus, MSTATUS64_UXL) == 1)
        &amp;&amp;
        <br>
        +           !riscv_cpu_is_32bit(env) &amp;&amp;
        <br>
        +           (env-&gt;priv == PRV_U);
        <br>
        +#endif
        <br>
        +    return false;
        <br>
        +}
        <br>
      </blockquote>
      <br>
      Again, naming could be better?
      <br>
      It seems trivial to handle all of the fields here.  Perhaps
      <br>
      <br>
      <br>
      static inline bool riscv_cpu_is_xlen32(env)
      <br>
      {
      <br>
      #if defined(TARGET_RISCV32)
      <br>
          return true;
      <br>
      #elif defined(CONFIG_USER_ONLY)
      <br>
          return false;
      <br>
      #else
      <br>
          /* When emulating a 32-bit-only cpu, use RV32. */
      <br>
          if (riscv_cpu_is_32bit(env)) {
      <br>
              return true;
      <br>
          }
      <br>
          /*
      <br>
           * If MXL has been reduced to RV32, MSTATUSH doesn't have
      UXL/SXL,
      <br>
           * therefore, XLEN cannot be widened back to RV64 for lower
      privs.
      <br>
           */
      <br>
          if (get_field(env-&gt;misa, MISA64_MXL) == 1) {
      <br>
              return true;
      <br>
          }
      <br>
          switch (env-&gt;priv) {
      <br>
          case PRV_M:
      <br>
              return false;
      <br>
          case PRV_U:
      <br>
              return get_field(env-&gt;mstatus, MSTATUS64_UXL) == 1;
      <br>
          default: /* PRV_S &amp; PRV_H */
      <br>
              return get_field(env-&gt;mstatus, MSTATUS64_SXL) == 1;
      <br>
          }
      <br>
      #endif
      <br>
      }
      <br>
      <br>
      <br>
      <blockquote type="cite">@@ -451,6 +462,10 @@ static inline void
        cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
        <br>
                      flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
        <br>
                  }
        <br>
              }
        <br>
        +    if (riscv_cpu_is_uxl32(env)) {
        <br>
        +        flags = FIELD_DP32(flags, TB_FLAGS, UXL,
        <br>
        +                           get_field(env-&gt;mstatus,
        MSTATUS64_UXL));
        <br>
      </blockquote>
      <br>
        flags = FIELD_DP32(flags, TB_FLAGS, XLEN32,
      <br>
                           riscv_cpu_is_xlen32(env));
      <br>
      <br>
      <br>
      r~
      <br>
    </blockquote>
  </body>
</html>

--------------4517E86A2B7F8CF8536EAC3F--

