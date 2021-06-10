Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lr9jJ-0002f1-Lw
	for mharc-qemu-riscv@gnu.org; Wed, 09 Jun 2021 21:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lr9jI-0002eV-0Q; Wed, 09 Jun 2021 21:43:32 -0400
Received: from out28-51.mail.aliyun.com ([115.124.28.51]:45729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lr9jF-0005Zq-1p; Wed, 09 Jun 2021 21:43:31 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1304699|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.144219-0.00175684-0.854024;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047190; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KQB3Ya2_1623289400; 
Received: from 172.27.117.59(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQB3Ya2_1623289400)
 by smtp.aliyun-inc.com(10.147.41.137);
 Thu, 10 Jun 2021 09:43:20 +0800
Subject: Re: TCG op for 32 bit only cpu on qemu-riscv64
To: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
References: <97935519-42c8-71c8-3d87-30aa4cafc909@c-sky.com>
 <618e9348-c420-b560-1f67-3608023985a7@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <7ac5990e-5f87-3d96-d8b5-bd7997fac0ee@c-sky.com>
Date: Thu, 10 Jun 2021 09:43:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <618e9348-c420-b560-1f67-3608023985a7@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.51; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-51.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 10 Jun 2021 01:43:32 -0000


On 6/7/21 11:52 PM, Richard Henderson wrote:
> On 6/6/21 8:07 PM, LIU Zhiwei wrote:
>> Hi Alistair,
>>
>> As I see,  we are moving  on to remove TARGET_RISCV64 macro.
>>
>> I have some questions:
>>
>> 1) Which tcg op should use when translate an instruction for 32bit 
>> cpu. The tcg_*_i64, tcg_*_i32 or tcg_*_tl?
>
> You use *_tl, because that's the size of the field in CPURISCVState.

Hi Richard,

If we want to run 32-bit program on qemu-riscv64, I think use *_tl is 
not enough. In semantics, we should only use the LSW 32-bit.

For example,

1)First a multiply instruction, if the source value big enough, it will 
return a result with some bits not zero in MSW 32-bit.

2)If next instruction is a divide instruction,  the MSW 32-bit will 
influence the divide instruction result.

So I think use *_tl can't satisfy the need to run 32-bit program on 
qemu-riscv64.

Now we are forwarding to run a 32-bit cpu on qemu-riscv64. In the near 
future, I want to support dynamical change  of XLEN.

Could you give some advice? Thanks very much.

Best Regards,
Zhiwei

>
>> 2) Do we should have a sign-extend 64 bit register(bit 31 as the sign 
>> bit)  for 32 bit cpu?
>
> If the value must be sign-extended for RV64, then leave it 
> sign-extended for RV32.  There's no point in adding extra code to 
> distinguish between them.
>
> If the instruction does not exist for RV64, then you can probably 
> leave the high bits unspecified (sign, zero, or pure garbage).
>
>
> r~

