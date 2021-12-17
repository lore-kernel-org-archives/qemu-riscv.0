Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1my3af-0002UW-Bi
	for mharc-qemu-riscv@gnu.org; Thu, 16 Dec 2021 22:07:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1my3ad-0002U6-4s; Thu, 16 Dec 2021 22:07:23 -0500
Received: from out28-148.mail.aliyun.com ([115.124.28.148]:45165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1my3aI-00036Y-Nx; Thu, 16 Dec 2021 22:07:22 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0816424|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0396662-0.00142564-0.958908;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.MGxF89A_1639710394; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MGxF89A_1639710394) by smtp.aliyun-inc.com(33.37.66.82);
 Fri, 17 Dec 2021 11:06:35 +0800
Subject: Re: [PATCH v3 1/1] target/riscv: Fix PMP propagation for tlb
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20211123090902.23321-1-zhiwei_liu@c-sky.com>
 <CAKmqyKOD0JSY3FFBOt6L3=JwRVOsf35eCkpHrB4GvzsTUsOypw@mail.gmail.com>
 <CAKmqyKPiqLhw0zZK_f-8-WYdc4NYDgqrLTTE9_3k8YgX54F3LA@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <ceeb4037-6d17-0a09-f35a-eaf3280339bb@c-sky.com>
Date: Fri, 17 Dec 2021 11:06:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPiqLhw0zZK_f-8-WYdc4NYDgqrLTTE9_3k8YgX54F3LA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.148; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-148.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.034,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 17 Dec 2021 03:07:23 -0000


On 2021/12/17 上午8:37, Alistair Francis wrote:
> On Wed, Dec 8, 2021 at 1:23 PM Alistair Francis <alistair23@gmail.com> wrote:
>> On Tue, Nov 23, 2021 at 7:09 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>> Only the pmp index that be checked by pmp_hart_has_privs can be used
>>> by pmp_get_tlb_size to avoid an error pmp index.
>>>
>>> Before modification, we may use an error pmp index. For example,
>>> we check address 0x4fc, and the size 0x4 in pmp_hart_has_privs. If there
>>> is an pmp rule, valid range is [0x4fc, 0x500), then pmp_hart_has_privs
>>> will return true;
>>>
>>> However, this checked pmp index is discarded as pmp_hart_has_privs
>>> return bool value. In pmp_is_range_in_tlb, it will traverse all pmp
>>> rules. The tlb_sa will be 0x0, and tlb_ea will be 0x4fff. If there is
>>> a pmp rule [0x10, 0x4]. It will be misused as it is legal in
>>> pmp_get_tlb_size.
>>>
>>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> Thanks!
>>
>> Applied to riscv-to-apply.next
> This patch causes lots of Linux boot failures. I see messages like this:
>
> Invalid write at addr 0x22048, size 8, region '(null)', reason: rejected
>
> from QEMU and the guest fails to start.

Yes, it's an error.  Send it again later.

Thanks,
Zhiwei

> Alistair

