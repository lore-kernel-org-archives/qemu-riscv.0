Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1madDO-0000bD-8N
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 08:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1madDM-0000an-IK; Wed, 13 Oct 2021 08:18:32 -0400
Received: from out28-98.mail.aliyun.com ([115.124.28.98]:39919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1madDK-0002lQ-Jr; Wed, 13 Oct 2021 08:18:32 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.194974|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00827808-0.000510496-0.991211;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047193; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LYWVTso_1634127503; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LYWVTso_1634127503)
 by smtp.aliyun-inc.com(10.147.42.22); Wed, 13 Oct 2021 20:18:23 +0800
Subject: Re: [PATCH 02/13] target/riscv: Create RISCVMXL enumeration
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, fabien.portas@grenoble-inp.org
References: <20211007174722.929993-1-richard.henderson@linaro.org>
 <20211007174722.929993-3-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <98ada787-f52c-07bd-4ab4-e92e1a6a9254@c-sky.com>
Date: Wed, 13 Oct 2021 20:18:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007174722.929993-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.98; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-98.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 13 Oct 2021 12:18:32 -0000


On 2021/10/8 上午1:47, Richard Henderson wrote:
> Move the MXL_RV* defines to enumerators.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei<zhiwei_liu@c-sky.com>

Zhiwei
> ---
>   target/riscv/cpu_bits.h | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 999187a9ee..e248c6bf6d 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -364,9 +364,11 @@
>   #define MISA32_MXL          0xC0000000
>   #define MISA64_MXL          0xC000000000000000ULL
>   
> -#define MXL_RV32            1
> -#define MXL_RV64            2
> -#define MXL_RV128           3
> +typedef enum {
> +    MXL_RV32  = 1,
> +    MXL_RV64  = 2,
> +    MXL_RV128 = 3,
> +} RISCVMXL;
>   
>   /* sstatus CSR bits */
>   #define SSTATUS_UIE         0x00000001

