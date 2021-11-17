Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mn92R-0007Rt-K5
	for mharc-qemu-riscv@gnu.org; Tue, 16 Nov 2021 19:43:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mn92O-0007Pe-VG; Tue, 16 Nov 2021 19:42:57 -0500
Received: from out28-149.mail.aliyun.com ([115.124.28.149]:57271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mn92M-00085l-7U; Tue, 16 Nov 2021 19:42:56 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08829644|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.00805207-0.000486719-0.991461;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.Lu6seuJ_1637109768; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lu6seuJ_1637109768)
 by smtp.aliyun-inc.com(10.147.40.44); Wed, 17 Nov 2021 08:42:48 +0800
Subject: Re: [PATCH] target/riscv: Check PMP rules num before propagation
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20211116151138.81209-1-zhiwei_liu@c-sky.com>
 <CAKmqyKMAzzV=6pWY2V9r1UmCFGG__JBuFGhTQ19Uo=VwiD2eww@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <79ba686c-1a8d-18ad-814c-7e5733f84868@c-sky.com>
Date: Wed, 17 Nov 2021 08:42:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMAzzV=6pWY2V9r1UmCFGG__JBuFGhTQ19Uo=VwiD2eww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.149; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-149.mail.aliyun.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.446,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 17 Nov 2021 00:42:57 -0000

0

On 2021/11/17 上午8:03, Alistair Francis wrote:
> On Wed, Nov 17, 2021 at 1:12 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>> If PMP rules number is zero, it should not influence the TLB entry for
>> M-mode program.
> This doesn't sound right. From what I can tell if we have no rules
> pmp_is_range_in_tlb() shouldn't have an effect on the tlb_size. What
> error are you seeing?

When address is in [0-4K] and no pmp rule configured,  the tlb_size will 
be set to 1.

This  is caused by pmp_get_tlb_size return a value 1.

if (pmp_sa >= tlb_sa && pmp_ea <= tlb_ea) {
          return pmp_ea - pmp_sa + 1;

}

Here pmp_sa == 0 and pmp_ea == 0.

Thanks,
Zhiwei

> Alistair
>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/cpu_helper.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 9eeed38c7e..48da872d39 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -376,7 +376,7 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
>>       }
>>
>>       *prot = pmp_priv_to_page_prot(pmp_priv);
>> -    if (tlb_size != NULL) {
>> +    if ((tlb_size != NULL) && pmp_get_num_rules(env)) {
>>           if (pmp_is_range_in_tlb(env, addr & ~(*tlb_size - 1), &tlb_size_pmp)) {
>>               *tlb_size = tlb_size_pmp;
>>           }
>> --
>> 2.25.1
>>
>>

