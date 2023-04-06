Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDvT-0005Wo-Tq
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkDvQ-0005WB-NP; Wed, 05 Apr 2023 20:56:28 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkDvN-0001E5-5n; Wed, 05 Apr 2023 20:56:28 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAAHTJyrGC5kPfICAA--.1108S2;
 Thu, 06 Apr 2023 08:56:11 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------fqdwMSWDJ0qSkky8ZbugTDkd"
Message-ID: <2b52f993-158e-a7ee-9180-b84f85f432c6@iscas.ac.cn>
Date: Thu, 6 Apr 2023 08:56:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] target/riscv: Fix the mstatus.MPP value after
 executing MRET
To: Alistair Francis <alistair23@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230330135818.68417-1-liweiwei@iscas.ac.cn>
 <20230330135818.68417-2-liweiwei@iscas.ac.cn>
 <CAKmqyKMzPwFpScWg2H+JMZpvH6oJAP0A5vgaKAEiXR57db0r4w@mail.gmail.com>
Content-Language: en-US
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <CAKmqyKMzPwFpScWg2H+JMZpvH6oJAP0A5vgaKAEiXR57db0r4w@mail.gmail.com>
X-CM-TRANSID: qwCowAAHTJyrGC5kPfICAA--.1108S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyrKr4UZFWUXFyDtF1UKFg_yoW8ZF4Upa
 y5Gay3KFWDJFZrC3WIgr1rWw43J3y3Kry7GF1kAw45AFZxJ3ykuF4DAr4agr4DXFW8trW0
 va1q9r98Za17ZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0E
 x4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5V
 A0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l7480Y4vEI4kI2Ix0rVAq
 x4xJMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
 evJa73UjIFyTuYvjfUwYFCUUUUU
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 HTML_OBFUSCATE_05_10=0.26, NICE_REPLY_A=-1.355, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Apr 2023 00:56:28 -0000

This is a multi-part message in MIME format.
--------------fqdwMSWDJ0qSkky8ZbugTDkd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/4/6 08:43, Alistair Francis wrote:
> On Thu, Mar 30, 2023 at 11:59 PM Weiwei Li<liweiwei@iscas.ac.cn>  wrote:
>> The MPP will be set to the least-privileged supported mode (U if
>> U-mode is implemented, else M).
> I don't think this is right, the spec in section 8.6.4 says this:

Sorry, I didn't find this section in latest release of both privilege 
and un-privilege spec

(draft-20230131-c0b298a: Clarify WFI trapping behavior (#972)).

>
> "MRET then in mstatus/mstatush sets MPV=0, MPP=0,
> MIE=MPIE, and MPIE=1"

In section 3.1.6.1, the privilege spec says this:

"An MRET or SRET instruction is used to return from a trap in M-mode or 
S-mode respectively.
When executing anxRET instruction, supposingxPP holds the valuey,xIE is 
set toxPIE; the
privilege mode is changed toy;xPIE is set to 1; andxPP is set to the 
least-privileged supported
mode (U if U-mode is implemented, else M). Ify̸=M,xRET also sets MPRV=0"

And I think PRV_U is an illegal value for MPP if U-mode is not implemented.

Regards,

Weiwei Li

> So it should just always be 0 (PRV_U is 0)
>
> Alistair
>
>> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/op_helper.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
>> index 84ee018f7d..991f06d98d 100644
>> --- a/target/riscv/op_helper.c
>> +++ b/target/riscv/op_helper.c
>> @@ -339,7 +339,8 @@ target_ulong helper_mret(CPURISCVState *env)
>>       mstatus = set_field(mstatus, MSTATUS_MIE,
>>                           get_field(mstatus, MSTATUS_MPIE));
>>       mstatus = set_field(mstatus, MSTATUS_MPIE, 1);
>> -    mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
>> +    mstatus = set_field(mstatus, MSTATUS_MPP,
>> +                        riscv_has_ext(env, RVU) ? PRV_U : PRV_M);
>>       mstatus = set_field(mstatus, MSTATUS_MPV, 0);
>>       if ((env->priv_ver >= PRIV_VERSION_1_12_0) && (prev_priv != PRV_M)) {
>>           mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
>> --
>> 2.25.1
>>
>>
--------------fqdwMSWDJ0qSkky8ZbugTDkd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/4/6 08:43, Alistair Francis
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAKmqyKMzPwFpScWg2H+JMZpvH6oJAP0A5vgaKAEiXR57db0r4w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Thu, Mar 30, 2023 at 11:59 PM Weiwei Li <a class="moz-txt-link-rfc2396E" href="mailto:liweiwei@iscas.ac.cn">&lt;liweiwei@iscas.ac.cn&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
The MPP will be set to the least-privileged supported mode (U if
U-mode is implemented, else M).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't think this is right, the spec in section 8.6.4 says this:</pre>
    </blockquote>
    <p>Sorry, I didn't find this section in latest release of both
      privilege and un-privilege spec</p>
    <p>(draft-20230131-c0b298a: Clarify WFI trapping behavior (#972)).</p>
    <blockquote type="cite"
cite="mid:CAKmqyKMzPwFpScWg2H+JMZpvH6oJAP0A5vgaKAEiXR57db0r4w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

"MRET then in mstatus/mstatush sets MPV=0, MPP=0,
MIE=MPIE, and MPIE=1"
</pre>
    </blockquote>
    <p>In section 3.1.6.1, the privilege spec says this:</p>
    <p>"<span style="left: 11.76%; top: 77.22%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;
        transform: scaleX(1.00364);" role="presentation" dir="ltr">An
        MRET or SRET instruction is used to return from a trap in M-mode
        or S-mode respectively.</span><br role="presentation">
      <span style="left: 11.76%; top: 78.93%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;
        transform: scaleX(0.970242);" role="presentation" dir="ltr">When
        executing an</span><span style="left: 26.97%; top: 78.93%;
        font-size: calc(var(--scale-factor)*10.91px); font-family:
        sans-serif;" role="presentation" dir="ltr"> </span><span
        style="left: 27.65%; top: 78.93%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr">x</span><span style="left: 28.69%;
        top: 78.93%; font-size: calc(var(--scale-factor)*10.91px);
        font-family: sans-serif; transform: scaleX(0.981763);"
        role="presentation" dir="ltr">RET instruction, supposing</span><span
        style="left: 50.49%; top: 78.93%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr"> </span><span style="left:
        51.16%; top: 78.93%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr">x</span><span style="left: 52.2%;
        top: 78.93%; font-size: calc(var(--scale-factor)*10.91px);
        font-family: sans-serif; transform: scaleX(0.982344);"
        role="presentation" dir="ltr">PP holds the value</span><span
        style="left: 67.2%; top: 78.93%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr"> </span><span style="left:
        67.87%; top: 78.93%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr">y</span><span style="left: 68.74%;
        top: 78.93%; font-size: calc(var(--scale-factor)*10.91px);
        font-family: sans-serif;" role="presentation" dir="ltr">,</span><span
        style="left: 69.23%; top: 78.93%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr"> </span><span style="left:
        69.92%; top: 78.93%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr">x</span><span style="left: 70.96%;
        top: 78.93%; font-size: calc(var(--scale-factor)*10.91px);
        font-family: sans-serif; transform: scaleX(1.06672);"
        role="presentation" dir="ltr">IE is set to</span><span
        style="left: 79.81%; top: 78.93%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr"> </span><span style="left:
        80.48%; top: 78.93%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr">x</span><span style="left: 81.52%;
        top: 78.93%; font-size: calc(var(--scale-factor)*10.91px);
        font-family: sans-serif; transform: scaleX(1.0605);"
        role="presentation" dir="ltr">PIE; the</span><br
        role="presentation">
      <span style="left: 11.76%; top: 80.64%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;
        transform: scaleX(0.942857);" role="presentation" dir="ltr">privilege
        mode is changed to</span><span style="left: 34.17%; top: 80.64%;
        font-size: calc(var(--scale-factor)*10.91px); font-family:
        sans-serif;" role="presentation" dir="ltr"> </span><span
        style="left: 34.8%; top: 80.64%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr">y</span><span style="left: 35.67%;
        top: 80.64%; font-size: calc(var(--scale-factor)*10.91px);
        font-family: sans-serif;" role="presentation" dir="ltr">;</span><span
        style="left: 36.16%; top: 80.64%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr"> </span><span style="left:
        36.82%; top: 80.64%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr">x</span><span style="left: 37.86%;
        top: 80.64%; font-size: calc(var(--scale-factor)*10.91px);
        font-family: sans-serif; transform: scaleX(1.03959);"
        role="presentation" dir="ltr">PIE is set to 1; and</span><span
        style="left: 53.35%; top: 80.64%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr"> </span><span style="left:
        53.98%; top: 80.64%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr">x</span><span style="left: 55.02%;
        top: 80.64%; font-size: calc(var(--scale-factor)*10.91px);
        font-family: sans-serif; transform: scaleX(0.968385);"
        role="presentation" dir="ltr">PP is set to the least-privileged
        supported</span><br role="presentation">
      <span style="left: 11.76%; top: 82.35%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;
        transform: scaleX(0.971456);" role="presentation" dir="ltr">mode
        (U if U-mode is implemented, else M). If</span><span
        style="left: 48.38%; top: 82.35%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr"> </span><span style="left:
        48.97%; top: 82.35%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr">y</span><span style="left: 49.84%;
        top: 82.35%; font-size: calc(var(--scale-factor)*10.91px);
        font-family: sans-serif;" role="presentation" dir="ltr"≯</span><span
        style="left: 49.84%; top: 82.35%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;
        transform: scaleX(1.19933);" role="presentation" dir="ltr">=M,</span><span
        style="left: 53.35%; top: 82.35%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr"> </span><span style="left:
        53.95%; top: 82.35%; font-size:
        calc(var(--scale-factor)*10.91px); font-family: sans-serif;"
        role="presentation" dir="ltr">x</span><span style="left: 54.99%;
        top: 82.35%; font-size: calc(var(--scale-factor)*10.91px);
        font-family: sans-serif; transform: scaleX(1.06328);"
        role="presentation" dir="ltr">RET also sets MPRV=0</span>"<br>
    </p>
    <p>And I think PRV_U is an illegal value for MPP if U-mode is not
      implemented.</p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type="cite"
cite="mid:CAKmqyKMzPwFpScWg2H+JMZpvH6oJAP0A5vgaKAEiXR57db0r4w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
So it should just always be 0 (PRV_U is 0)

Alistair

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Signed-off-by: Weiwei Li <a class="moz-txt-link-rfc2396E" href="mailto:liweiwei@iscas.ac.cn">&lt;liweiwei@iscas.ac.cn&gt;</a>
Signed-off-by: Junqiang Wang <a class="moz-txt-link-rfc2396E" href="mailto:wangjunqiang@iscas.ac.cn">&lt;wangjunqiang@iscas.ac.cn&gt;</a>
---
 target/riscv/op_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 84ee018f7d..991f06d98d 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -339,7 +339,8 @@ target_ulong helper_mret(CPURISCVState *env)
     mstatus = set_field(mstatus, MSTATUS_MIE,
                         get_field(mstatus, MSTATUS_MPIE));
     mstatus = set_field(mstatus, MSTATUS_MPIE, 1);
-    mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
+    mstatus = set_field(mstatus, MSTATUS_MPP,
+                        riscv_has_ext(env, RVU) ? PRV_U : PRV_M);
     mstatus = set_field(mstatus, MSTATUS_MPV, 0);
     if ((env-&gt;priv_ver &gt;= PRIV_VERSION_1_12_0) &amp;&amp; (prev_priv != PRV_M)) {
         mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
--
2.25.1


</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------fqdwMSWDJ0qSkky8ZbugTDkd--


