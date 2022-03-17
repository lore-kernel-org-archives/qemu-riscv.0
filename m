Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUkhj-0000JC-DI
	for mharc-qemu-riscv@gnu.org; Thu, 17 Mar 2022 03:37:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nUkhh-0000H5-Kt; Thu, 17 Mar 2022 03:37:49 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:51968 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nUkhe-00071p-2Z; Thu, 17 Mar 2022 03:37:49 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowADX38M+5TJiHk4uAw--.47943S2;
 Thu, 17 Mar 2022 15:37:36 +0800 (CST)
Subject: Re: [PATCH v2] target/riscv: write back unmodified value for
 csrrc/csrrs with rs1 is not x0 but holding zero
To: Alistair Francis <alistair23@gmail.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, wangjunqiang <wangjunqiang@iscas.ac.cn>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
References: <20220311094601.30440-1-liweiwei@iscas.ac.cn>
 <CAEUhbmX7wBzhvojSioQnB=T-DDuq9FX7UTPdvtR=oXHDm5Ra4A@mail.gmail.com>
 <769fe78f-e4c0-83c1-d5fc-65fbf40bb5ff@iscas.ac.cn>
 <CAKmqyKMpWFo5-=XSTBy_B9aTqDsw6-uxWfe3RwNnKUCKXQtjeQ@mail.gmail.com>
 <f5a1d76b-12a9-6d84-f73f-2dc523cfa4ee@iscas.ac.cn>
 <CAKmqyKOFJBKG7t0+6bxf+rzNDgMeOkjZoBok=6SUucOp5A0dvg@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <bb9fa46c-2930-6ce4-69c4-3c8876ef8bf4@iscas.ac.cn>
Date: Thu, 17 Mar 2022 15:37:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOFJBKG7t0+6bxf+rzNDgMeOkjZoBok=6SUucOp5A0dvg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------83CD7DA0F9418DA76FDB66DC"
Content-Language: en-US
X-CM-TRANSID: rQCowADX38M+5TJiHk4uAw--.47943S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4kArW8KryDWw4rAFWfGrg_yoWrCw43pr
 WFgr4Yyr4kXF1v9w1kJw4rt3W5Z3yrJry5Xr48t3yavwn5X34qvFWxtFs0kFWDGrsayr12
 vFsFyryxuay5AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2
 z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67
 IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCjr7xvwVCIw2I0I7xG6c02
 F41lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64
 vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8G
 jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
 x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
 8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
 CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUSsjbUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Thu, 17 Mar 2022 07:37:50 -0000

This is a multi-part message in MIME format.
--------------83CD7DA0F9418DA76FDB66DC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/3/17 下午12:39, Alistair Francis 写道:
> On Thu, Mar 17, 2022 at 12:10 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>
>> 在 2022/3/17 上午6:35, Alistair Francis 写道:
>>> On Thu, Mar 17, 2022 at 1:13 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>>>>>             riscv_raise_exception(env, ret, GETPC());
>>>>>> @@ -90,7 +90,7 @@ void helper_csrw_i128(CPURISCVState *env, int csr,
>>>>>>     {
>>>>>>         RISCVException ret = riscv_csrrw_i128(env, csr, NULL,
>>>>>>                                               int128_make128(srcl, srch),
>>>>>> -                                          UINT128_MAX);
>>>>>> +                                          UINT128_MAX, true);
>>>>>>
>>>>>>         if (ret != RISCV_EXCP_NONE) {
>>>>>>             riscv_raise_exception(env, ret, GETPC());
>>>>>> @@ -104,7 +104,7 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
>>>>>>         Int128 rv = int128_zero();
>>>>>>         RISCVException ret = riscv_csrrw_i128(env, csr, &rv,
>>>>>>                                               int128_make128(srcl, srch),
>>>>>> -                                          int128_make128(maskl, maskh));
>>>>>> +                                          int128_make128(maskl, maskh), true);
>>>>>>
>>>>>>         if (ret != RISCV_EXCP_NONE) {
>>>>>>             riscv_raise_exception(env, ret, GETPC());
>>>>> I am afraid the adding of "bool write_op" argument was done on many
>>>>> functions, some of which do not look good to me, e.g.: predicate
>>>>> funcs. v1 is much better.*>
>>>> Yeah, I agree adding  argument to predicate is not a good idea. However
>>>> it seems that the csr(like seed)
>>>>
>>>> itself cannot  distinguish whether it's to be written or not except
>>>> these two ways(in v1 and v2).
>>>>
>>>> Or we can take seed CSR as a special case  in riscv_csrrw_check since no
>>>> other csr will limit itself
>>>>
>>>> to be accessed only with read-write instruction currently.
>>>>
>>>>> Or maybe, is that possible we do something in trans_csrrs() instead?
>>> That might be a better option. Unless there are other CSRs we expect
>>> to do this I think trans_csrr*() is probably the place to have this,
>>> similar to the `rd == 0` case.
>>>
>>> It could also go in helper_csrr() which would just be a simple if check.
>>>
>>> Alistair
>>>
>> Sorry. I don't understand what can be done in trans_csrr*(). As I said
>> in last email: trans_csr*
>>
>> have made all the read operation will go to the helper_csrr. However
>> helper_csrr share the progress
>>
>> of riscv_csrrw*  with helper_csrrw/helper_csrw to implement its function.
> Yep, so the problem you are trying to solve is the seed CSR access right?

To solve the seed CSR access problem is my initial purpose.

The other purpose is to write back the  unmodified value back  as the 
coments in trans_csrrs/trans_csrrc:

"

* Note that if rs1 specifies a register other than x0, holding
* a zero value, the instruction will still attempt to write the
* unmodified value back to the csr and will cause side effects.
*/
"

For this purpose,  we still should distinguish the two cases in 
riscv_csrrw, since whether write_mask

is zero is used to distinguish read and write operation currently.

>
> "The seed CSR must be accessed with a read-write instruction. A
> read-only instruction such as CSRRS/CSRRC with rs1=x0 or CSRRSI/CSRRCI
> with uimm=0 will raise an illegal instruction exception. The write
> value (in rs1 or uimm) must be ignored by implementations. The purpose
> of the write is to signal polling and flushing."
>
> So trans_csr*() probably isn't the right place, but you could do the
> check in helper_csr*()
>
> helper_csrr() is only called from do_csrr(), which should only be
> called on an invalid access for the seed CSR.
>
>> The truely question is that helper_csrr will call riscv_csrrw*with
>> write_mask = zero, new_value=zero,
>>
>> which cannot distinguished from the call from helper_csrrw of which its
>> write_mask all can be zero
> Agreed. But helper_csrrw() isn't called if rs1=x0 or uimm=0. So if
> helper_csrrw() is called no matter the write mask then you should be
> fine.
>
> So a simple:
> if (csr == CSR_SEED) {
>      riscv_raise_exception()
> }
>
> in helper_csrr() and helper_csrw() should be fine. Or am I missing something?

It's OK to do this to solve the seed csr problem. Maybe it's unnecessary 
to do this in helper_csrw since the spec

seems not specify the case that rd = x0 to raise an illegal instruction 
exception.

Regards,

Weiwei Li

>
> Alistair
>
>> (origin from trans_csrrs/trans_csrrc when rs1 is not x0 and the value of
>> rs1 reg is zero).
>>
>> Regards,
>>
>> Weiwei Li
>>
>>
>>>> The read and write operation in trans_csr*  have been truely
>>>> distinguished in original code:
>>>>
>>>> all the read operation will go to  the helper_csrr,  write to
>>>> helper_csrrw, read/write to helper_csrrw.
>>>>
>>>> However, they all go to the same progress  riscv_csrrw* in the helper
>>>> with different arguments.
>>>>
>>>> Regards,
>>>>
>>>> Weiwei Li
>>>>
>>>>> Regards,
>>>>> Bin
>>>>
>>>>
>>>>

--------------83CD7DA0F9418DA76FDB66DC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/3/17 下午12:39, Alistair Francis
      写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAKmqyKOFJBKG7t0+6bxf+rzNDgMeOkjZoBok=6SUucOp5A0dvg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Thu, Mar 17, 2022 at 12:10 PM Weiwei Li <a class="moz-txt-link-rfc2396E" href="mailto:liweiwei@iscas.ac.cn">&lt;liweiwei@iscas.ac.cn&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

在 2022/3/17 上午6:35, Alistair Francis 写道:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Thu, Mar 17, 2022 at 1:13 AM Weiwei Li <a class="moz-txt-link-rfc2396E" href="mailto:liweiwei@iscas.ac.cn">&lt;liweiwei@iscas.ac.cn&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">           riscv_raise_exception(env, ret, GETPC());
@@ -90,7 +90,7 @@ void helper_csrw_i128(CPURISCVState *env, int csr,
   {
       RISCVException ret = riscv_csrrw_i128(env, csr, NULL,
                                             int128_make128(srcl, srch),
-                                          UINT128_MAX);
+                                          UINT128_MAX, true);

       if (ret != RISCV_EXCP_NONE) {
           riscv_raise_exception(env, ret, GETPC());
@@ -104,7 +104,7 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
       Int128 rv = int128_zero();
       RISCVException ret = riscv_csrrw_i128(env, csr, &amp;rv,
                                             int128_make128(srcl, srch),
-                                          int128_make128(maskl, maskh));
+                                          int128_make128(maskl, maskh), true);

       if (ret != RISCV_EXCP_NONE) {
           riscv_raise_exception(env, ret, GETPC());
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">I am afraid the adding of "bool write_op" argument was done on many
functions, some of which do not look good to me, e.g.: predicate
funcs. v1 is much better.*&gt;
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Yeah, I agree adding  argument to predicate is not a good idea. However
it seems that the csr(like seed)

itself cannot  distinguish whether it's to be written or not except
these two ways(in v1 and v2).

Or we can take seed CSR as a special case  in riscv_csrrw_check since no
other csr will limit itself

to be accessed only with read-write instruction currently.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Or maybe, is that possible we do something in trans_csrrs() instead?
</pre>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">That might be a better option. Unless there are other CSRs we expect
to do this I think trans_csrr*() is probably the place to have this,
similar to the `rd == 0` case.

It could also go in helper_csrr() which would just be a simple if check.

Alistair

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Sorry. I don't understand what can be done in trans_csrr*(). As I said
in last email: trans_csr*

have made all the read operation will go to the helper_csrr. However
helper_csrr share the progress

of riscv_csrrw*  with helper_csrrw/helper_csrw to implement its function.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yep, so the problem you are trying to solve is the seed CSR access right?</pre>
    </blockquote>
    <p>To solve the seed CSR access problem is my initial purpose.</p>
    <p>The other purpose is to write back the  unmodified value back  as
      the coments in trans_csrrs/trans_csrrc:</p>
    <p>"<br>
    </p>
    <div style="color: #000000;background-color: #ffffff;font-family: 'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback';font-weight: normal;font-size: 18px;line-height: 24px;white-space: pre;"><div><span style="color: #008000;">     * Note that if rs1 specifies a register other than x0, holding</span></div><div><span style="color: #008000;">     * a zero value, the instruction will still attempt to write the</span></div><div><span style="color: #008000;">     * unmodified value back to the csr and will cause side effects.</span></div><div><span style="color: #008000;">     */</span></div><div><span style="color: #008000;">"
</span></div></div>
    <p>For this purpose,  we still should distinguish the two cases in
      riscv_csrrw, since whether write_mask <br>
    </p>
    <p>is zero is used to distinguish read and write operation
      currently.<br>
    </p>
    <blockquote type="cite"
cite="mid:CAKmqyKOFJBKG7t0+6bxf+rzNDgMeOkjZoBok=6SUucOp5A0dvg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

"The seed CSR must be accessed with a read-write instruction. A
read-only instruction such as CSRRS/CSRRC with rs1=x0 or CSRRSI/CSRRCI
with uimm=0 will raise an illegal instruction exception. The write
value (in rs1 or uimm) must be ignored by implementations. The purpose
of the write is to signal polling and flushing."

So trans_csr*() probably isn't the right place, but you could do the
check in helper_csr*()

helper_csrr() is only called from do_csrr(), which should only be
called on an invalid access for the seed CSR.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
The truely question is that helper_csrr will call riscv_csrrw*with
write_mask = zero, new_value=zero,

which cannot distinguished from the call from helper_csrrw of which its
write_mask all can be zero
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Agreed. But helper_csrrw() isn't called if rs1=x0 or uimm=0. So if
helper_csrrw() is called no matter the write mask then you should be
fine.

So a simple:
if (csr == CSR_SEED) {
    riscv_raise_exception()
}

in helper_csrr() and helper_csrw() should be fine. Or am I missing something?</pre>
    </blockquote>
    <p>It's OK to do this to solve the seed csr problem. Maybe it's
      unnecessary to do this in helper_csrw since the spec</p>
    <p>seems not specify the case that rd = x0 to raise an illegal
      instruction exception.</p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type="cite"
cite="mid:CAKmqyKOFJBKG7t0+6bxf+rzNDgMeOkjZoBok=6SUucOp5A0dvg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Alistair

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
(origin from trans_csrrs/trans_csrrc when rs1 is not x0 and the value of
rs1 reg is zero).

Regards,

Weiwei Li


</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">The read and write operation in trans_csr*  have been truely
distinguished in original code:

all the read operation will go to  the helper_csrr,  write to
helper_csrrw, read/write to helper_csrrw.

However, they all go to the same progress  riscv_csrrw* in the helper
with different arguments.

Regards,

Weiwei Li

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Regards,
Bin
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">



</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------83CD7DA0F9418DA76FDB66DC--


