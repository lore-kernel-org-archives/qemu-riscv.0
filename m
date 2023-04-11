Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm1gH-0005lt-7g
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 20:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pm1gD-0005id-Kv; Mon, 10 Apr 2023 20:16:14 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pm1g8-0005PI-8M; Mon, 10 Apr 2023 20:16:13 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowAD3_s69pjRkBuC7EA--.44276S2;
 Tue, 11 Apr 2023 08:15:57 +0800 (CST)
Message-ID: <3ab19e9b-88a3-17bd-169d-7317dfbf36e5@iscas.ac.cn>
Date: Tue, 11 Apr 2023 08:15:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH 0/2] target/riscv: Separate implicitly-enabled and
 explicitly-enabled extensions
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230410033526.31708-1-liweiwei@iscas.ac.cn>
 <0fd5d633-8aac-4186-a7b8-0e27f416bb3f@ventanamicro.com>
Content-Language: en-US
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <0fd5d633-8aac-4186-a7b8-0e27f416bb3f@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3_s69pjRkBuC7EA--.44276S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFWfZF4fJFyfJr4rtF17Awb_yoW5Aw47pr
 18KrWxKrWDXryIkF43Jr4UJFyUGr4rG3yxJr1vga45Xay5Jryaqr10qw40gFyUXFWrXF12
 gF1UAry7ZFyjyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
 evJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.165.241.15]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.246,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 00:16:16 -0000


On 2023/4/10 21:48, Daniel Henrique Barboza wrote:
> Hi,
>
> On 4/10/23 00:35, Weiwei Li wrote:
>> The patch tries to separate the multi-letter extensions that may 
>> implicitly-enabled by misa.EXT from the explicitly-enabled cases, so 
>> that the misa.EXT can truely disabled by write_misa().
>> With this separation, the implicitly-enabled zve64d/f and zve32f 
>> extensions will no work if we clear misa.V. And clear misa.V will 
>> have no effect on the explicitly-enalbed zve64d/f and zve32f extensions.
>
> For this particular case of write_misa() I'm not sure if we need all 
> that. If we want
> to grant user choice on write_misa(), let's say that the user wants to 
> enable/disable
> RVV, we can enable/disable all RVV related Z-extensions by hand. It's 
> just a matter
> of writing enable/disable code that write_misa() would use.
>
> In the end, write_misa() is also an user choice. If write_misa() wants 
> to disable RVV,
> this means that the user wants to disable RVV, so it doesn't matter 
> whether the user
> enabled zve32f on the command line or not - we disable zve32f as well. 
> Same thing for
> RVC and its related Z-extensions.

I just find we should also separate the cases here. Zcmp/Zcmt require Zca.

If we disable Zca when misa.C is cleared, whether we need disable 
Zcmp/Zcmt?

If yes, then we need another new parameter(to indicate they are diabled by

clearing misa.C ) to decide whether we should re-enable them when misa.C 
is set.

If not, we should make clearing misa.C failed in this case.

Regards,

Weiwei Li

>
> The reason why I didn't do this particular code for RVC and RVV is 
> because we have
> pending work in the ML that I would like to get it merged first. And 
> there's a few
> caveats we need to decide what to do, e.g. what if the user disables F 
> but V is
> enabled? Do we refuse write_misa()? Do we disable RVV?
>
>
> All this said, patch 1 is still a good addition to make it easier to 
> distinguish
> the Z-extensions we're enabling due to MISA bits. I believe we should use
> set_implicit_extensions_from_ext() in the future for all similar 
> situations.
>
>
>
> Thanks,
>
> Daniel
>
>
>
>>
>> Weiwei Li (2):
>>    target/riscv: Add set_implicit_extensions_from_ext() function
>>    target/riscv: Add ext_z*_enabled for implicitly enabled extensions
>>
>>   target/riscv/cpu.c                      | 73 +++++++++++++++----------
>>   target/riscv/cpu.h                      |  8 +++
>>   target/riscv/cpu_helper.c               |  2 +-
>>   target/riscv/csr.c                      |  2 +-
>>   target/riscv/insn_trans/trans_rvd.c.inc |  2 +-
>>   target/riscv/insn_trans/trans_rvf.c.inc |  2 +-
>>   target/riscv/insn_trans/trans_rvi.c.inc |  5 +-
>>   target/riscv/insn_trans/trans_rvv.c.inc | 16 +++---
>>   target/riscv/translate.c                |  4 +-
>>   9 files changed, 68 insertions(+), 46 deletions(-)
>>


