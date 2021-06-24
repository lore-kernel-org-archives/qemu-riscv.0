Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lwIW4-0002B6-C5
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jun 2021 02:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwIW2-0002Ae-2J; Thu, 24 Jun 2021 02:07:06 -0400
Received: from out28-170.mail.aliyun.com ([115.124.28.170]:52217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwIVw-0008NT-KX; Thu, 24 Jun 2021 02:07:05 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07982182|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_social|0.118672-0.000276864-0.881051;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KXAcAyA_1624514809; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXAcAyA_1624514809)
 by smtp.aliyun-inc.com(10.147.41.137);
 Thu, 24 Jun 2021 14:06:50 +0800
Subject: Re: [PATCH v2 04/37] target/riscv: 8-bit Addition & Subtraction
 Instruction
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 Palmer Dabbelt <palmerdabbelt@google.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
 <20210610075908.3305506-5-zhiwei_liu@c-sky.com>
 <cdb22947-9ca7-9353-b189-a70a94d7c7ab@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <32f0b6c2-bd7b-ce7d-2aba-b36e9b89d46d@c-sky.com>
Date: Thu, 24 Jun 2021 14:05:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cdb22947-9ca7-9353-b189-a70a94d7c7ab@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------A6A93B8149E5807FE31110C8"
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.170; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-170.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 24 Jun 2021 06:07:06 -0000

This is a multi-part message in MIME format.
--------------A6A93B8149E5807FE31110C8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021/6/11 上午3:39, Richard Henderson wrote:
> On 6/10/21 12:58 AM, LIU Zhiwei wrote:
>>   include/tcg/tcg-op-gvec.h |  6 ++
>>   tcg/tcg-op-gvec.c                       | 47 ++++++++++++++++
>
> Likewise, should be split from the larger patch.
>
>> +static void gen_addv_mask_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b, 
>> TCGv_i32 m)
>> +{
>> +    TCGv_i32 t1 = tcg_temp_new_i32();
>> +    TCGv_i32 t2 = tcg_temp_new_i32();
>> +    TCGv_i32 t3 = tcg_temp_new_i32();
>> +
>> +    tcg_gen_andc_i32(t1, a, m);
>> +    tcg_gen_andc_i32(t2, b, m);
>> +    tcg_gen_xor_i32(t3, a, b);
>> +    tcg_gen_add_i32(d, t1, t2);
>> +    tcg_gen_and_i32(t3, t3, m);
>> +    tcg_gen_xor_i32(d, d, t3);
>> +
>> +    tcg_temp_free_i32(t1);
>> +    tcg_temp_free_i32(t2);
>> +    tcg_temp_free_i32(t3);
>> +}
>> +
>> +void tcg_gen_vec_add8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
>> +{
>> +    TCGv_i32 m = tcg_constant_i32((int32_t)dup_const(MO_8, 0x80));
>> +    gen_addv_mask_i32(d, a, b, m);
>> +}
>
> There will only ever be one use; we might as well merge them.
OK
> The cast is unnecessary.

I meet compiler error report without cast. So I just keep it.

../tcg/tcg-op-gvec.c: In function ‘tcg_gen_vec_sub8_i32’:
/home/roman/git/qemu/include/tcg/tcg.h:1327:5: error: overflow in implicit constant conversion [-Werror=overflow]
      (__builtin_constant_p(VECE)                                    \
      ^
../tcg/tcg-op-gvec.c:1947:35: note: in expansion of macro ‘dup_const’
      TCGv_i32 m = tcg_constant_i32(dup_const(MO_8, 0x80));
                                    ^~~~~~~~~
cc1: all warnings being treated as errors

Thanks,
Zhiwei

>
>
> r~

--------------A6A93B8149E5807FE31110C8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021/6/11 上午3:39, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cdb22947-9ca7-9353-b189-a70a94d7c7ab@linaro.org">On
      6/10/21 12:58 AM, LIU Zhiwei wrote:
      <br>
      <blockquote type="cite">  include/tcg/tcg-op-gvec.h              
        |  6 ++
        <br>
          tcg/tcg-op-gvec.c                       | 47 ++++++++++++++++
        <br>
      </blockquote>
      <br>
      Likewise, should be split from the larger patch.
      <br>
      <br>
      <blockquote type="cite">+static void gen_addv_mask_i32(TCGv_i32 d,
        TCGv_i32 a, TCGv_i32 b, TCGv_i32 m)
        <br>
        +{
        <br>
        +    TCGv_i32 t1 = tcg_temp_new_i32();
        <br>
        +    TCGv_i32 t2 = tcg_temp_new_i32();
        <br>
        +    TCGv_i32 t3 = tcg_temp_new_i32();
        <br>
        +
        <br>
        +    tcg_gen_andc_i32(t1, a, m);
        <br>
        +    tcg_gen_andc_i32(t2, b, m);
        <br>
        +    tcg_gen_xor_i32(t3, a, b);
        <br>
        +    tcg_gen_add_i32(d, t1, t2);
        <br>
        +    tcg_gen_and_i32(t3, t3, m);
        <br>
        +    tcg_gen_xor_i32(d, d, t3);
        <br>
        +
        <br>
        +    tcg_temp_free_i32(t1);
        <br>
        +    tcg_temp_free_i32(t2);
        <br>
        +    tcg_temp_free_i32(t3);
        <br>
        +}
        <br>
        +
        <br>
        +void tcg_gen_vec_add8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
        <br>
        +{
        <br>
        +    TCGv_i32 m = tcg_constant_i32((int32_t)dup_const(MO_8,
        0x80));
        <br>
        +    gen_addv_mask_i32(d, a, b, m);
        <br>
        +}
        <br>
      </blockquote>
      <br>
      There will only ever be one use; we might as well merge them.
      <br>
    </blockquote>
    OK<br>
    <blockquote type="cite"
      cite="mid:cdb22947-9ca7-9353-b189-a70a94d7c7ab@linaro.org">The
      cast is unnecessary.
      <br>
    </blockquote>
    <p>I meet compiler error report without cast. So I just keep it.</p>
    <pre>../tcg/tcg-op-gvec.c: In function ‘tcg_gen_vec_sub8_i32’:
/home/roman/git/qemu/include/tcg/tcg.h:1327:5: error: overflow in implicit constant conversion [-Werror=overflow]
     (__builtin_constant_p(VECE)                                    \
     ^
../tcg/tcg-op-gvec.c:1947:35: note: in expansion of macro ‘dup_const’
     TCGv_i32 m = tcg_constant_i32(dup_const(MO_8, 0x80));
                                   ^~~~~~~~~
cc1: all warnings being treated as errors
</pre>
    <p>Thanks,<br>
      Zhiwei<br>
    </p>
    <blockquote type="cite"
      cite="mid:cdb22947-9ca7-9353-b189-a70a94d7c7ab@linaro.org">
      <br>
      <br>
      r~
      <br>
    </blockquote>
  </body>
</html>

--------------A6A93B8149E5807FE31110C8--

