Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p5zga-0005jb-4t
	for mharc-qemu-riscv@gnu.org; Thu, 15 Dec 2022 20:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1p5zgY-0005iY-KS; Thu, 15 Dec 2022 20:38:50 -0500
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1p5zgU-0006ml-2T; Thu, 15 Dec 2022 20:38:49 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VXOX1Sl_1671154711; 
Received: from 30.221.96.117(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VXOX1Sl_1671154711) by smtp.aliyun-inc.com;
 Fri, 16 Dec 2022 09:38:32 +0800
Message-ID: <bcdd7992-e3ff-de17-22c4-1319e3816e8b@linux.alibaba.com>
Date: Fri, 16 Dec 2022 09:38:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] target/riscv/cpu.c: Fix elen check
Content-Language: en-US
To: Elta <503386372@qq.com>, qemu-devel <qemu-devel@nongnu.org>
Cc: palmer <palmer@dabbelt.com>, "alistair.francis"
 <alistair.francis@wdc.com>, "bin.meng" <bin.meng@windriver.com>,
 qemu-riscv <qemu-riscv@nongnu.org>
References: <tencent_60E46E9E0EA5052F26E07A56520177BE0008@qq.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <tencent_60E46E9E0EA5052F26E07A56520177BE0008@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.56;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-56.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 16 Dec 2022 01:38:51 -0000


On 2022/12/15 16:46, Elta wrote:
> Should be cpu->cfg.elen in range [8, 64].
>
> Signed-off-by: Dongxue Zhang <elta.era@gmail.com>
> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d14e95c9dc..1e8032c969 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -870,7 +870,7 @@ static void riscv_cpu_realize(DeviceState *dev, 
> Error **errp)
>                          "Vector extension ELEN must be power of 2");
>                  return;
>              }
> -            if (cpu->cfg.elen > 64 || cpu->cfg.vlen < 8) {
> +            if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {

Oops. You are right.

Reviewed-by: LIU Zhiwei <zhiwe_liu@linux.alibaba.com>

Zhiwei

>                  error_setg(errp,
>                          "Vector extension implementation only 
> supports ELEN "
>                          "in the range [8, 64]");
> -- 
> 2.17.1
>

