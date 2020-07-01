Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqQTY-0005vL-3N
	for mharc-qemu-riscv@gnu.org; Tue, 30 Jun 2020 20:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jqQTW-0005st-3u; Tue, 30 Jun 2020 20:19:42 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:53794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jqQTU-0003zO-Ed; Tue, 30 Jun 2020 20:19:41 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2041745|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00808008-0.000167859-0.991752;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16384; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=5; RT=5; SR=0; TI=SMTPD_---.HvS7zEv_1593562775; 
Received: from 30.225.208.18(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HvS7zEv_1593562775)
 by smtp.aliyun-inc.com(10.147.40.44); Wed, 01 Jul 2020 08:19:35 +0800
Subject: Re: [PATCH v1 2/3] hw/riscv: Allow 64 bit access to SiFive CLINT
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1593547870.git.alistair.francis@wdc.com>
 <122b78825b077e4dfd39b444d3a46fe894a7804c.1593547870.git.alistair.francis@wdc.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <619512b4-9252-5a32-0ed1-994d69b1b6ba@c-sky.com>
Date: Wed, 1 Jul 2020 08:19:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <122b78825b077e4dfd39b444d3a46fe894a7804c.1593547870.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 20:17:36
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 01 Jul 2020 00:19:42 -0000



On 2020/7/1 4:12, Alistair Francis wrote:
> Commit 5d971f9e672507210e77d020d89e0e89165c8fc9
> "memory: Revert "memory: accept mismatching sizes in
> memory_region_access_valid"" broke most RISC-V boards as they do 64 bit
> accesses to the CLINT and QEMU would trigger a fault. Fix this failure
> by allowing 8 byte accesses.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   hw/riscv/sifive_clint.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
> index b11ffa0edc..669c21adc2 100644
> --- a/hw/riscv/sifive_clint.c
> +++ b/hw/riscv/sifive_clint.c
> @@ -181,7 +181,7 @@ static const MemoryRegionOps sifive_clint_ops = {
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .valid = {
>           .min_access_size = 4,
> -        .max_access_size = 4
> +        .max_access_size = 8
>       }
>   };
>   

Reviewed-by: LIU Zhiwei<zhiwei_liu@c-sky.com>



