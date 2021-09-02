Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLb8I-0004OS-HP
	for mharc-qemu-riscv@gnu.org; Wed, 01 Sep 2021 21:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mLb8G-0004OB-3r; Wed, 01 Sep 2021 21:03:08 -0400
Received: from out28-193.mail.aliyun.com ([115.124.28.193]:43366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mLb8C-00087s-D1; Wed, 01 Sep 2021 21:03:07 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0898846|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0449992-7.74252e-05-0.954923;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LEHpCRE_1630544572; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LEHpCRE_1630544572)
 by smtp.aliyun-inc.com(10.147.42.197);
 Thu, 02 Sep 2021 09:02:53 +0800
Subject: Re: [PATCH] target/riscv: Fix satp write
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20210901124539.222868-1-zhiwei_liu@c-sky.com>
 <CAEUhbmUvb4_tmevGEcK_YgyA9_g5LumRVpMc7+rwuD4D7FSBBA@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <a61c6fef-4bce-0c5b-7aff-b9e2fa75aa5b@c-sky.com>
Date: Thu, 2 Sep 2021 09:02:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUvb4_tmevGEcK_YgyA9_g5LumRVpMc7+rwuD4D7FSBBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.193; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-193.mail.aliyun.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.029,
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
X-List-Received-Date: Thu, 02 Sep 2021 01:03:08 -0000


On 2021/9/1 下午9:05, Bin Meng wrote:
> On Wed, Sep 1, 2021 at 8:51 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>> These variables should be target_ulong. If truncated to int,
>> the bool conditions they indicate will be wrong.
>>
>> As satp is very important for Linux, this bug almost fails every boot.
> Could you please describe which Linux configuration is broken?

I use the image from:

https://gitlab.com/c-sky/buildroot/-/jobs/1251564514/artifacts/browse/output/images/

>   I have
> a 64-bit 5.10 kernel and it boots fine.

The login is mostly OK for me. But the busybox can't run properly.

Thanks,
Zhiwei

> Please add:
>
> Fixes: 419ddf00ed78 ("target/riscv: Remove the hardcoded SATP_MODE macro")
>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/csr.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 50a2c3a3b4..ba9818f6a5 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -986,7 +986,7 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
>>   static RISCVException write_satp(CPURISCVState *env, int csrno,
>>                                    target_ulong val)
>>   {
>> -    int vm, mask, asid;
>> +    target_ulong vm, mask, asid;
>>
>>       if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
>>           return RISCV_EXCP_NONE;
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

