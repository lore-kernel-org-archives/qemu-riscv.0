Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2xIi-0006gj-0o
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 10:25:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n2xIf-0006du-Lc; Thu, 30 Dec 2021 10:25:05 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:57568 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n2xIc-0003gT-6w; Thu, 30 Dec 2021 10:25:05 -0500
Received: from [192.168.0.100] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACHjwNDz81hrO9TBQ--.27802S2;
 Thu, 30 Dec 2021 23:24:51 +0800 (CST)
Subject: Re: [PATCH v3 3/7] crypto include/crypto target/arm: move sm4_sbox to
 crypto
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, luruibo2000@163.com,
 lustrew@foxmail.com
References: <20211230143058.7352-1-liweiwei@iscas.ac.cn>
 <20211230143058.7352-4-liweiwei@iscas.ac.cn>
 <faa025d1-0c8f-b0ed-74d6-575c008edd84@redhat.com>
From: liweiwei <liweiwei@iscas.ac.cn>
Message-ID: <82305ef2-f08f-d4f7-8fe0-075bcbfc1158@iscas.ac.cn>
Date: Thu, 30 Dec 2021 23:24:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <faa025d1-0c8f-b0ed-74d6-575c008edd84@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowACHjwNDz81hrO9TBQ--.27802S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urWxGr1xXw1rXw47Jr1DWrg_yoW8GF15pw
 sxGF43KayxJFy7Ga43Xr1xXF4fGFWv9r15Ja1Sk34xXwnFvw18JFZFkw4SgFyDXa4IyFW8
 JFs0y3WDGF4UJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
 04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
 w20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
 CY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 30 Dec 2021 15:25:06 -0000

Thanks for your review.

在 2021/12/30 下午10:46, Philippe Mathieu-Daudé 写道:
> Hi,
>
> On 12/30/21 15:30, liweiwei wrote:
>>     - share it between target/arm and target/riscv
> "Share sm4_sbox between ARM and RISCV targets."?
Yes. sm4 related instruction in scalar crypto extension will use sm4_sbox.
>> Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
>> Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
>> ---
>>   crypto/meson.build         |  1 +
>>   crypto/sm4.c               | 48 ++++++++++++++++++++++++++++++++++++++
>>   include/crypto/sm4.h       |  6 +++++
>>   meson                      |  2 +-
>>   target/arm/crypto_helper.c | 36 +---------------------------
>>   5 files changed, 57 insertions(+), 36 deletions(-)
>> diff --git a/crypto/sm4.c b/crypto/sm4.c
>> new file mode 100644
>> index 0000000000..1cdcb8a620
>> --- /dev/null
>> +++ b/crypto/sm4.c
>> +uint8_t const sm4_sbox[] = {
> Please explicit the [256] array size.
>
>> diff --git a/meson b/meson
>> index 12f9f04ba0..b25d94e7c7 160000
>> --- a/meson
>> +++ b/meson
>> @@ -1 +1 @@
>> -Subproject commit 12f9f04ba0decfda425dbbf9a501084c153a2d18
>> +Subproject commit b25d94e7c77fda05a7fdfe8afe562cf9760d69da
> Unrelated change...
Sorry for this change. I'll fix it later.
>
> Otherwise (without the submodule change):
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>
> Thanks,
>
> Phil.


