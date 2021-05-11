Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgIv4-0007mg-Ad
	for mharc-qemu-riscv@gnu.org; Mon, 10 May 2021 23:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjunqiang@iscas.ac.cn>)
 id 1lgIv1-0007eu-NL; Mon, 10 May 2021 23:18:47 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:41154 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangjunqiang@iscas.ac.cn>)
 id 1lgIuz-0003w4-9z; Mon, 10 May 2021 23:18:47 -0400
Received: from [172.16.211.231] (unknown [58.221.119.46])
 by APP-01 (Coremail) with SMTP id qwCowACnrHR395lgBFN6AQ--.44698S3;
 Tue, 11 May 2021 11:18:16 +0800 (CST)
Subject: Re: [RFC PATCH 2/5] hw/intc: Add Nuclei ECLIC device
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair23@gmail.com>
Cc: liweiwei@iscas.ac.cn, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, alapha23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20210507081654.11056-1-wangjunqiang@iscas.ac.cn>
 <20210507081654.11056-3-wangjunqiang@iscas.ac.cn>
 <CAKmqyKPVYuESf0TQM8M-KE-72PftMeNCfmQLdEj4Siy9TZxuBA@mail.gmail.com>
 <CAEUhbmVL6wRtxk4M+SCSbrQbY02vtzoYuuesAYuBP-tJvBz9VA@mail.gmail.com>
 <CAEUhbmU-XGYF7iVqmYFnzWF9m=rnrqHzLnStq2pLoLkTKj=cXA@mail.gmail.com>
From: Wang Junqiang <wangjunqiang@iscas.ac.cn>
Message-ID: <d2536e2c-b558-78d8-1314-7901d172b90a@iscas.ac.cn>
Date: Tue, 11 May 2021 11:18:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmU-XGYF7iVqmYFnzWF9m=rnrqHzLnStq2pLoLkTKj=cXA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACnrHR395lgBFN6AQ--.44698S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AF18WF48ur1kJrW3Gw1xZrb_yoW8GF1UpF
 WfZa1fKFs5Grn8G3s2qr4xtFWIvr1fJryfW34DJw1jvwn8tw1rGr4UtFWY93WDCwn3KF12
 yrWj9F1fXFy5AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
 c2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
 0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
 tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
 CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE
 14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
 9x07jeFAJUUUUU=
X-Originating-IP: [58.221.119.46]
X-CM-SenderInfo: pzdqwy5xqtxt1qj6x2xfdvhtffof0/1tbiBgkSAF0TfNwXMgAAsW
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=wangjunqiang@iscas.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 11 May 2021 03:18:48 -0000



On 2021/5/10 下午1:26, Bin Meng wrote:
> On Mon, May 10, 2021 at 10:27 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Mon, May 10, 2021 at 10:21 AM Alistair Francis <alistair23@gmail.com> wrote:
>>>
>>> On Fri, May 7, 2021 at 11:24 PM wangjunqiang <wangjunqiang@iscas.ac.cn> wrote:
>>>>
>>>> This patch provides an implementation of Nuclei ECLIC Device.
>>>> Nuclei processor core have been equipped with an Enhanced Core Local
>>>> Interrupt Controller (ECLIC), which is optimized based on the RISC-V
>>>> standard CLIC, to manage all interrupt sources.
>>>>
>>>> https://doc.nucleisys.com/nuclei_spec/isa/eclic.html
>>>
>>> Hello,
>>>
>>> There are patches on the QEMU list adding support for the CLIC. How
>>> different is the ECLIC from the CLIC? Could you use the CLIC as a
>>> starting point instead of implementing a new interrupt controller?
>>>
>>
>> That's my thought too when I saw this patch at first.
>>
>> A better way is to scandalize the CLIC support in QEMU first, then we
> 
> Sorry for the typo. I meant to say: standardize the CLIC support
> 
>> will see how Nuclei's eCLIC could be built on top of that. Thanks!
> 
> Regards,
> Bin
> 

I agree with both of you.the CLIC support in QEMU first. I read the 
patch of clic, and there is no problem with compatibility in the 
target/riscv directory.I will split eclic in next version. Thanks

Regards
Wang Junqiang


