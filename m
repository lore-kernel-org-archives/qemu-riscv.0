Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mpRqk-0002Yb-0J
	for mharc-qemu-riscv@gnu.org; Tue, 23 Nov 2021 04:12:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mpRqi-0002YL-Bq; Tue, 23 Nov 2021 04:12:24 -0500
Received: from out28-147.mail.aliyun.com ([115.124.28.147]:38439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mpRqg-0006Z9-F3; Tue, 23 Nov 2021 04:12:24 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1599431|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_enroll_verification|0.0086946-0.000468007-0.990837;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.LxhtoFQ_1637658736; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LxhtoFQ_1637658736)
 by smtp.aliyun-inc.com(10.147.41.158);
 Tue, 23 Nov 2021 17:12:17 +0800
Subject: Re: [PATCH v2 0/5] Check PMP rules num before propagation
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211122110230.38783-1-zhiwei_liu@c-sky.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <bbc65e2c-5dcd-5661-8fe8-719d88d686ee@c-sky.com>
Date: Tue, 23 Nov 2021 17:12:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211122110230.38783-1-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.147; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-147.mail.aliyun.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.515,
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
X-List-Received-Date: Tue, 23 Nov 2021 09:12:25 -0000

As I have found another similar error in PMP, and we can fix it at the 
same time. I have sent a patch named "target/riscv: Fix PMP propagation 
for tlb".

This patch set should be dropped.

Thanks,
Zhiwei

Drop this patch set.

On 2021/11/22 下午7:02, LIU Zhiwei wrote:
> In this patch set, fix pmp propagation to tlb and replace pmp_is_range_in_tlb
> with a more straightforward function pmp_adjust_tlb_size.
>
> v2:
>    move pmp rules num check to pmp_is_range_in_tlb
>    define pmp_adjust_tlb_size to replace pmp_is_range_in_tlb
>
>
> LIU Zhiwei (5):
>    target/riscv: Check PMP rules num before propagation
>    target/riscv: Give a more generic size for tlb
>    target/riscv: Discard return value for pmp_is_range_in_tlb
>    target/riscv: Rename pmp_is_range_in_tlb
>    target/riscv: Modify return and parameter type for pmp_adjust_tlb_size
>
>   target/riscv/cpu_helper.c |  6 ++----
>   target/riscv/pmp.c        | 21 ++++++++++-----------
>   target/riscv/pmp.h        |  4 ++--
>   3 files changed, 14 insertions(+), 17 deletions(-)
>

