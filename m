Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mN5EM-0005t5-6b
	for mharc-qemu-riscv@gnu.org; Sun, 05 Sep 2021 23:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mN5EK-0005sh-OE; Sun, 05 Sep 2021 23:23:32 -0400
Received: from out28-196.mail.aliyun.com ([115.124.28.196]:53823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mN5EH-0002zO-Rd; Sun, 05 Sep 2021 23:23:32 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07790039|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00338137-0.00059117-0.996027;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LG4pgIz_1630898597; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LG4pgIz_1630898597)
 by smtp.aliyun-inc.com(10.147.42.241);
 Mon, 06 Sep 2021 11:23:17 +0800
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
 <a61c6fef-4bce-0c5b-7aff-b9e2fa75aa5b@c-sky.com>
 <CAEUhbmXULr_mcdfh6x=BGLNcNM5Q7YrFhnHOuLatbrokqP0Taw@mail.gmail.com>
 <e5f5e2b1-8fc5-31de-c927-1ae7545957f8@c-sky.com>
 <CAEUhbmVCYZ2j6Vp0g4JjHf5XmTDFW+wm5PoT4MmMjUvrfGpkeA@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <fbbf6698-5145-eab9-e3c9-66c9fe1598a1@c-sky.com>
Date: Mon, 6 Sep 2021 11:23:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVCYZ2j6Vp0g4JjHf5XmTDFW+wm5PoT4MmMjUvrfGpkeA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.196; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-196.mail.aliyun.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.832,
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
X-List-Received-Date: Mon, 06 Sep 2021 03:23:33 -0000


On 2021/9/2 上午10:47, Bin Meng wrote:
> On Thu, Sep 2, 2021 at 10:44 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>
>> On 2021/9/2 上午9:59, Bin Meng wrote:
>>> On Thu, Sep 2, 2021 at 9:02 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>>> On 2021/9/1 下午9:05, Bin Meng wrote:
>>>>> On Wed, Sep 1, 2021 at 8:51 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>>>>> These variables should be target_ulong. If truncated to int,
>>>>>> the bool conditions they indicate will be wrong.
>>>>>>
>>>>>> As satp is very important for Linux, this bug almost fails every boot.
>>>>> Could you please describe which Linux configuration is broken?
>>>> I use the image from:
>>>>
>>>> https://gitlab.com/c-sky/buildroot/-/jobs/1251564514/artifacts/browse/output/images/
>>>>
>>>>>     I have
>>>>> a 64-bit 5.10 kernel and it boots fine.
>>>> The login is mostly OK for me. But the busybox can't run properly.
>>> Which kernel version is this?
>> 5.10.4
>>> Could you please investigate and
>>> indicate in the commit message?
>>>
>>> I just tested current qemu-system-riscv64 can boot to Ubuntu 20.04
>>> distro user space.
>> Very strange.  This will cause tlb_flush can't be called in this function.
>>
> Did your kernel enable asid?

Yes. Is it matter?

Thanks,
Zhiwei

>
> Regards,
> Bin

