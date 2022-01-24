Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nBv18-0004tl-Cq
	for mharc-qemu-riscv@gnu.org; Mon, 24 Jan 2022 03:48:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nBv0p-0004sP-0p; Mon, 24 Jan 2022 03:47:43 -0500
Received: from out28-145.mail.aliyun.com ([115.124.28.145]:53286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nBv0k-0000lA-7b; Mon, 24 Jan 2022 03:47:42 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1099965|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0215965-0.00446824-0.973935;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.MhaohZg_1643014052; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MhaohZg_1643014052)
 by smtp.aliyun-inc.com(10.147.42.198);
 Mon, 24 Jan 2022 16:47:32 +0800
Subject: Re: [PATCH] target/riscv: correct "code should not be reached" for
 x-rv128
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com
References: <20220124074940.363064-1-frederic.petrot@univ-grenoble-alpes.fr>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <dcab99a5-4c85-0434-d094-90c7429ba479@c-sky.com>
Date: Mon, 24 Jan 2022 16:47:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220124074940.363064-1-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.145; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-145.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 24 Jan 2022 08:47:44 -0000


On 2022/1/24 下午3:49, Frédéric Pétrot wrote:
> The addition of uxl support in gdbstub adds a few checks on the maximum
> register length, but omitted MXL_RV128, leading to the occurence of
> "code should not be reached" in a few places.
> This patch makes rv128 react as rv64 for gdb, as previously.

If that is case for rv128, you should also add

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1cb0436187..5ada71e5bf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -528,9 +528,8 @@ static void riscv_cpu_realize(DeviceState *dev, 
Error **errp)
      switch (env->misa_mxl_max) {
  #ifdef TARGET_RISCV64
      case MXL_RV64:
-        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
-        break;
      case MXL_RV128:
+        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
          break;

Still I don't know why we should make rv128 react as rv64 for gdb?

Thanks,
Zhiwei

>
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---
>   target/riscv/gdbstub.c | 3 +++
>   1 file changed, 3 insertions(+)
>
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

