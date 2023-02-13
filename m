Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRW63-0001Wb-Dp
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 05:30:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRW5t-0001V0-Qn; Mon, 13 Feb 2023 05:30:01 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRW5r-00026I-2u; Mon, 13 Feb 2023 05:29:57 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowABHoNcUEepjIcfkBA--.21882S2;
 Mon, 13 Feb 2023 18:29:40 +0800 (CST)
Message-ID: <f5f6ae73-e09d-a704-e659-abfe0891cedc@iscas.ac.cn>
Date: Mon, 13 Feb 2023 18:29:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: liweiwei@iscas.ac.cn, Alistair.Francis@wdc.com, bin.meng@windriver.com,
 frank.chang@sifive.com, dbarboza@ventanamicro.com, palmer@dabbelt.com
Subject: Re: [PATCH] target/riscv: Fix vslide1up.vf and vslide1down.vf
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230213094550.29621-1-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230213094550.29621-1-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowABHoNcUEepjIcfkBA--.21882S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1rZFy8Gr4UKF1kZr4kXrb_yoW8WrykpF
 s5Kry3Grs5tFsrJa40ga1UX3W5CF13Gr1jkF93G3y0kFW5W3ykZ3WDKanrCFsxtay8ur1Y
 y3W8Cw4Sya1YqrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUU
 U==
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.348,
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
X-List-Received-Date: Mon, 13 Feb 2023 10:30:05 -0000


On 2023/2/13 17:45, LIU Zhiwei wrote:
> vslide1up_##BITWIDTH is used by the vslide1up.vx and vslide1up.vf. So its
> scalar input should be uint64_t to hold the 64 bits float register.And the
> same for vslide1down_##BITWIDTH.
>
> This bug is caught when run these instructions on qemu-riscv32.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/vector_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 00de879787..3073c54871 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -5038,7 +5038,7 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_w, uint32_t, H4)
>   GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8)
>   
>   #define GEN_VEXT_VSLIE1UP(BITWIDTH, H)                                      \
> -static void vslide1up_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
> +static void vslide1up_##BITWIDTH(void *vd, void *v0, uint64_t s1,           \
>                        void *vs2, CPURISCVState *env, uint32_t desc)          \
>   {                                                                           \
>       typedef uint##BITWIDTH##_t ETYPE;                                       \
> @@ -5086,7 +5086,7 @@ GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, 32)
>   GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, 64)
>   
>   #define GEN_VEXT_VSLIDE1DOWN(BITWIDTH, H)                                     \
> -static void vslide1down_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
> +static void vslide1down_##BITWIDTH(void *vd, void *v0, uint64_t s1,           \
>                          void *vs2, CPURISCVState *env, uint32_t desc)          \
>   {                                                                             \
>       typedef uint##BITWIDTH##_t ETYPE;                                         \
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Regards,
Weiwei Li


