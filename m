Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nCEVk-0000AG-14
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jan 2022 00:36:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nCEVg-000095-WA; Tue, 25 Jan 2022 00:36:53 -0500
Received: from out28-51.mail.aliyun.com ([115.124.28.51]:60381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nCEVd-0003Y8-Pc; Tue, 25 Jan 2022 00:36:52 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08798142|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0215965-0.00446824-0.973935;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.Mi.p7Vn_1643088997; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Mi.p7Vn_1643088997)
 by smtp.aliyun-inc.com(10.147.42.241);
 Tue, 25 Jan 2022 13:36:37 +0800
Message-ID: <a7090083-a729-76d9-eede-f34af6615ec8@c-sky.com>
Date: Tue, 25 Jan 2022 13:36:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] target/riscv: correct "code should not be reached" for
 x-rv128
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com
References: <20220124202456.420258-1-frederic.petrot@univ-grenoble-alpes.fr>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
In-Reply-To: <20220124202456.420258-1-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.51; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-51.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Tue, 25 Jan 2022 05:36:53 -0000

On 2022/1/25 04:24, Frédéric Pétrot wrote:

> The addition of uxl support in gdbstub adds a few checks on the maximum
> register length, but omitted MXL_RV128, an experimental feature.
> This patch makes rv128 react as rv64, as previously.
>
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Thanks,
Zhiwei

> ---
>   target/riscv/cpu.c     | 3 +--
>   target/riscv/gdbstub.c | 3 +++
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1cb0436187..5ada71e5bf 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -528,10 +528,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       switch (env->misa_mxl_max) {
>   #ifdef TARGET_RISCV64
>       case MXL_RV64:
> +    case MXL_RV128:
>           cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
>           break;
> -    case MXL_RV128:
> -        break;
>   #endif
>       case MXL_RV32:
>           cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index f531a74c2f..9ed049c29e 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -64,6 +64,7 @@ int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>       case MXL_RV32:
>           return gdb_get_reg32(mem_buf, tmp);
>       case MXL_RV64:
> +    case MXL_RV128:
>           return gdb_get_reg64(mem_buf, tmp);
>       default:
>           g_assert_not_reached();
> @@ -84,6 +85,7 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>           length = 4;
>           break;
>       case MXL_RV64:
> +    case MXL_RV128:
>           if (env->xl < MXL_RV64) {
>               tmp = (int32_t)ldq_p(mem_buf);
>           } else {
> @@ -420,6 +422,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>                                    1, "riscv-32bit-virtual.xml", 0);
>           break;
>       case MXL_RV64:
> +    case MXL_RV128:
>           gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
>                                    riscv_gdb_set_virtual,
>                                    1, "riscv-64bit-virtual.xml", 0);

