Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ljuwU-0004wZ-Vh
	for mharc-qemu-riscv@gnu.org; Thu, 20 May 2021 22:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ljuwS-0004tB-OB; Thu, 20 May 2021 22:31:12 -0400
Received: from out28-193.mail.aliyun.com ([115.124.28.193]:59295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ljuwI-0006hA-JI; Thu, 20 May 2021 22:31:12 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2577193|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0414441-0.00112639-0.95743;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KGW1eyL_1621564252; 
Received: from 172.27.117.59(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KGW1eyL_1621564252)
 by smtp.aliyun-inc.com(10.147.44.145);
 Fri, 21 May 2021 10:30:53 +0800
Subject: Re: [PATCH v1 1/1] target/riscv/pmp: Add assert for ePMP operations
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <ec5f225928eec448278c82fcb1f6805ee61dde82.1621550996.git.alistair.francis@wdc.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <e5ce3d0a-a50a-0c63-80d0-acfcfbe698a2@c-sky.com>
Date: Fri, 21 May 2021 10:30:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ec5f225928eec448278c82fcb1f6805ee61dde82.1621550996.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.193; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-193.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 21 May 2021 02:31:13 -0000

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

On 5/21/21 6:55 AM, Alistair Francis wrote:
> Although we construct epmp_operation in such a way that it can only be
> between 0 and 15 Coverity complains that we don't handle the other
> possible cases. To fix Coverity and make it easier for humans to read
> add a default case to the switch statement that calls
> g_assert_not_reached().
>
> Fixes: CID 1453108
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/pmp.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 78203291de..82ed020b10 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -402,6 +402,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                       case 15:
>                           *allowed_privs = PMP_READ;
>                           break;
> +                    default:
> +                        g_assert_not_reached();
>                       }
>                   } else {
>                       switch (epmp_operation) {
> @@ -433,6 +435,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                       case 7:
>                           *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
>                           break;
> +                    default:
> +                        g_assert_not_reached();
>                       }
>                   }
>               }


