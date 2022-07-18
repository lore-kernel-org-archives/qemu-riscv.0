Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDP3V-0004Aq-AP
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jul 2022 07:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oDP3R-0004AD-PO; Mon, 18 Jul 2022 07:36:51 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:53308 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oDP3N-00036X-Fb; Mon, 18 Jul 2022 07:36:49 -0400
Received: from [192.168.3.6] (unknown [180.156.173.38])
 by APP-05 (Coremail) with SMTP id zQCowAAXHrK8RdViYQ0_Dw--.58670S2;
 Mon, 18 Jul 2022 19:36:29 +0800 (CST)
Subject: Re: [PATCH v2 1/6] target/riscv: add check for supported privilege
 modes conbinations
To: Andrew Jones <ajones@ventanamicro.com>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com
References: <20220712063236.23834-1-liweiwei@iscas.ac.cn>
 <20220712063236.23834-2-liweiwei@iscas.ac.cn>
 <20220718090221.aqeiudcugpdqaef6@kamzik>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <511e08eb-e1cc-59cb-0beb-498df58e3a69@iscas.ac.cn>
Date: Mon, 18 Jul 2022 19:36:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220718090221.aqeiudcugpdqaef6@kamzik>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAAXHrK8RdViYQ0_Dw--.58670S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tryxCry7ZF17Xw1fJr43KFg_yoW8Xr1Dpr
 4rGay7CFWDJry7G3yxAF1jqF1j9r4kKFWUZ39FvwnruwsxtrZY9FnFkw4akw1kAF4kCa1S
 93yq9F15Zr4Yv3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
 evJa73UjIFyTuYvjfU8VbyDUUUU
X-Originating-IP: [180.156.173.38]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 18 Jul 2022 11:36:51 -0000


ÔÚ 2022/7/18 ÏÂÎç5:02, Andrew Jones Ð´µÀ:
> On Tue, Jul 12, 2022 at 02:32:31PM +0800, Weiwei Li wrote:
>> - There are 3 suggested privilege modes conbinations listed in the spec:
> No need for '-' here.
>
> s/modes/mode/
> s/conbinations/combinations/
>
> (Same typos in $SUBJECT, also please capitalize 'add' in $SUBJECT.)
>
> When referencing the spec it's nice to point out the doc/version/section.
>
>> 1) M, 2) M, U 3) M, S, U
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>   target/riscv/cpu.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index db2b8e4d30..36c1b26fb3 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -726,6 +726,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>               return;
>>           }
>>   
>> +        if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
>> +            error_setg(errp,
>> +                       "Setting S extension without U extension is illegal");
>> +            return;
>> +        }
>> +
>>           if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
>>               error_setg(errp, "F extension requires Zicsr");
>>               return;
>> -- 
>> 2.17.1
>>
>>
> Besides the commit message issues
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks for your comments.

I'll fix the issues in commit messages in the next version.

Regards,

Weiwei Li


