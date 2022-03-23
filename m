Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nX0o8-00040q-GG
	for mharc-qemu-riscv@gnu.org; Wed, 23 Mar 2022 09:13:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nX0o4-0003uc-Jr; Wed, 23 Mar 2022 09:13:46 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:49796 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nX0o1-0000dB-PR; Wed, 23 Mar 2022 09:13:44 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowACXnvr8HDtilKgaBQ--.17455S2;
 Wed, 23 Mar 2022 21:13:32 +0800 (CST)
Subject: Re: [RFC PATCH v2 4/4] target/riscv: smstateen check for AIA/IMSIC
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
References: <20220323111309.9109-1-mchitale@ventanamicro.com>
 <20220323111309.9109-5-mchitale@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <c0920f62-46fa-46db-84ba-cade2dc4d565@iscas.ac.cn>
Date: Wed, 23 Mar 2022 21:13:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220323111309.9109-5-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowACXnvr8HDtilKgaBQ--.17455S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1kCrWrXrWDGFy3ZryUGFg_yoW7JF1Upw
 4DArZxWrWxtFy2v3ZIgFs8JF15J3Z7K3y7u3s3Ww4kWFs8GF95Jr1kXrWavFWUCF95Wr47
 Wa1ak3ZYkr42vFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1U
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0pR_pnkUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 23 Mar 2022 13:13:46 -0000


ÔÚ 2022/3/23 ÏÂÎç7:13, Mayuresh Chitale Ð´µÀ:
> If smstateen is implemented then accesses to AIA
> registers CSRS, IMSIC CSRs and other IMSIC registers
> is controlled by setting of corresponding bits in
> mstateen/hstateen registers. Otherwise an illegal
> instruction trap or virtual instruction trap is
> generated.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   target/riscv/csr.c | 248 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 246 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5959adc9b3..cfdda8dc2b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -68,6 +68,53 @@ static RISCVException smstateen_acc_ok(CPURISCVState *env, int mode, int bit)
>       return RISCV_EXCP_NONE;
>   }
>   
> +static RISCVException smstateen_aia_acc_ok(CPURISCVState *env, int csrno)
> +{
> +    int bit, mode;
> +
> +    switch (csrno) {
> +    case CSR_SSETEIPNUM:
> +    case CSR_SCLREIPNUM:
> +    case CSR_SSETEIENUM:
> +    case CSR_SCLREIENUM:
> +    case CSR_STOPEI:
> +    case CSR_VSSETEIPNUM:
> +    case CSR_VSCLREIPNUM:
> +    case CSR_VSSETEIENUM:
> +    case CSR_VSCLREIENUM:
> +    case CSR_VSTOPEI:
> +    case CSR_HSTATUS:
> +        mode = PRV_S;
> +        bit = SMSTATEEN0_IMSIC;
> +        break;
> +
> +    case CSR_SIEH:
> +    case CSR_SIPH:
> +    case CSR_HVIPH:
> +    case CSR_HVICTL:
> +    case CSR_HVIPRIO1:
> +    case CSR_HVIPRIO2:
> +    case CSR_HVIPRIO1H:
> +    case CSR_HVIPRIO2H:
> +    case CSR_VSIEH:
> +    case CSR_VSIPH:
> +        mode = PRV_S;
> +        bit = SMSTATEEN0_AIA;
> +        break;
> +
> +    case CSR_SISELECT:
> +    case CSR_VSISELECT:
> +        mode = PRV_S;
> +        bit = SMSTATEEN0_SVSLCT;
> +        break;
> +
> +    default:
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    return smstateen_acc_ok(env, mode, bit);
> +}
> +
>   static RISCVException fs(CPURISCVState *env, int csrno)
>   {
>   #if !defined(CONFIG_USER_ONLY)
> @@ -1402,6 +1449,13 @@ static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val,
>                           target_ulong new_val, target_ulong wr_mask)
>   {
>       target_ulong *iselect;
> +    RISCVException ret;
> +
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
>   
>       /* Translate CSR number for VS-mode */
>       csrno = aia_xlate_vs_csrno(env, csrno);
> @@ -1484,7 +1538,9 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
>       bool virt;
>       uint8_t *iprio;
>       int ret = -EINVAL;
> -    target_ulong priv, isel, vgein;
> +    target_ulong priv, isel, vgein = 0;
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
>   
>       /* Translate CSR number for VS-mode */
>       csrno = aia_xlate_vs_csrno(env, csrno);
> @@ -1513,11 +1569,20 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
>       };
>   
>       /* Find the selected guest interrupt file */
> -    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
> +    if (virt) {
> +        if (!cpu->cfg.ext_smstateen ||
> +                (env->hstateen[0] & 1UL << SMSTATEEN0_IMSIC)) {
It seems better that '(' aligned with '!'.
> +            vgein = get_field(env->hstatus, HSTATUS_VGEIN);
> +        }
> +    }
>   
>       if (ISELECT_IPRIO0 <= isel && isel <= ISELECT_IPRIO15) {
>           /* Local interrupt priority registers not available for VS-mode */
>           if (!virt) {
> +            if (priv == PRV_S && cpu->cfg.ext_smstateen &&
> +                !(env->hstateen[0] & 1UL << SMSTATEEN0_AIA)) {
> +                goto done;
> +            }
>               ret = rmw_iprio(riscv_cpu_mxl_bits(env),
>                               isel, iprio, val, new_val, wr_mask,
>                               (priv == PRV_M) ? IRQ_M_EXT : IRQ_S_EXT);
> @@ -1551,6 +1616,13 @@ static int rmw_xsetclreinum(CPURISCVState *env, int csrno, target_ulong *val,
>       int ret = -EINVAL;
>       bool set, pend, virt;
>       target_ulong priv, isel, vgein, xlen, nval, wmask;
> +    RISCVException excp;
> +
> +    /* Check if smstateen is enabled and this access is allowed */
> +    excp = smstateen_aia_acc_ok(env, csrno);
> +    if (excp != RISCV_EXCP_NONE) {
> +        return excp;
> +    }
>   
>       /* Translate CSR number for VS-mode */
>       csrno = aia_xlate_vs_csrno(env, csrno);
> @@ -1669,6 +1741,13 @@ static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
>       bool virt;
>       int ret = -EINVAL;
>       target_ulong priv, vgein;
> +    RISCVException excp;
> +
> +    /* Check if smstateen is enabled and this access is allowed */
> +    excp = smstateen_aia_acc_ok(env, csrno);
> +    if (excp != RISCV_EXCP_NONE) {
> +        return excp;
> +    }
>   
>       /* Translate CSR number for VS-mode */
>       csrno = aia_xlate_vs_csrno(env, csrno);
> @@ -2014,6 +2093,12 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
>           wr_mask |= 1UL << SMSTATEEN0_FCSR;
>       }
>   
> +    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
> +        wr_mask |= (1UL << SMSTATEEN0_IMSIC)
> +                | (1UL << SMSTATEEN0_AIA)
> +                | (1UL << SMSTATEEN0_SVSLCT);

I think it's better as follows:

+        wr_mask |= (1UL << SMSTATEEN0_IMSIC) |
+                   (1UL << SMSTATEEN0_AIA) |
+                   (1UL << SMSTATEEN0_SVSLCT);

Regards,

Weiwei Li


