Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrYub-0005PG-2x
	for mharc-qemu-riscv@gnu.org; Fri, 11 Jun 2021 00:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrYuZ-0005Ox-LS; Fri, 11 Jun 2021 00:36:51 -0400
Received: from out28-195.mail.aliyun.com ([115.124.28.195]:42276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrYuW-0008Uq-H0; Fri, 11 Jun 2021 00:36:51 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.147745|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.230953-0.00972238-0.759324;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KQpai1x_1623386200; 
Received: from 172.27.117.59(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQpai1x_1623386200)
 by smtp.aliyun-inc.com(10.147.42.197);
 Fri, 11 Jun 2021 12:36:40 +0800
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
Message-ID: <e2151646-0e97-01db-8ecd-9ed81d92f733@c-sky.com>
Date: Fri, 11 Jun 2021 12:36:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cdb22947-9ca7-9353-b189-a70a94d7c7ab@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.195; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-195.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 11 Jun 2021 04:36:52 -0000

On 6/11/21 3:39 AM, Richard Henderson wrote:

> On 6/10/21 12:58 AM, LIU Zhiwei wrote:
>>   include/tcg/tcg-op-gvec.h |  6 ++
>>   tcg/tcg-op-gvec.c                       | 47 ++++++++++++++++
>
> Likewise, should be split from the larger patch.
>
OK
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
> The cast is unnecessary.

A little puzzling. Should I still split it?


Zhiwei

>
>
> r~

