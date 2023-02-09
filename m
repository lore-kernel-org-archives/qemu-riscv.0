Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPyed-0003Dc-NT
	for mharc-qemu-riscv@gnu.org; Wed, 08 Feb 2023 23:35:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pPyec-0003DP-ID; Wed, 08 Feb 2023 23:35:26 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pPyeZ-0007S7-NI; Wed, 08 Feb 2023 23:35:26 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowABXcNT_d+Rjer4tBA--.61834S2;
 Thu, 09 Feb 2023 12:35:12 +0800 (CST)
Message-ID: <c5e9d98f-a63d-b372-3a81-87c0655a7d1d@iscas.ac.cn>
Date: Thu, 9 Feb 2023 12:35:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] MAINTAINERS: Add some RISC-V reviewers
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com, alistair23@gmail.com, dbarboza@ventanamicro.com,
 alistair.francis@wdc.com, palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com,
 liweiwei@iscas.ac.cn
References: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowABXcNT_d+Rjer4tBA--.61834S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr17Aw47KFW7Wry3KFyxuFg_yoWfAFg_Gr
 WfJFW7WF1UXa1vyw4kZF92krs5WrWkZF13Ka1xJr43Ka4UKrn3AFnrKrWDKw17Ca1furn2
 qas3XFWakr98WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb3AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
 MIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.146,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Thu, 09 Feb 2023 04:35:26 -0000


On 2023/2/9 08:33, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
>
> This patch adds some active RISC-V members as reviewers to the
> MAINTAINERS file.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   MAINTAINERS | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96e25f62ac..847bc7f131 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -287,6 +287,9 @@ RISC-V TCG CPUs
>   M: Palmer Dabbelt <palmer@dabbelt.com>
>   M: Alistair Francis <alistair.francis@wdc.com>
>   M: Bin Meng <bin.meng@windriver.com>
> +R: Weiwei Li <liweiwei@iscas.ac.cn>
> +R: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> +R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
>   L: qemu-riscv@nongnu.org
>   S: Supported
>   F: target/riscv/

Acked-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,

Weiwei Li


