Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEhjf-0003sf-Qt
	for mharc-qemu-riscv@gnu.org; Thu, 21 Jul 2022 21:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oEhjd-0003rA-S8; Thu, 21 Jul 2022 21:45:45 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:59208 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oEhja-00074D-Ao; Thu, 21 Jul 2022 21:45:45 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-01 (Coremail) with SMTP id qwCowAD3k7w9Adpi2ABdAA--.17930S2;
 Fri, 22 Jul 2022 09:45:33 +0800 (CST)
Subject: Re: [PATCH v6 4/5] target/riscv: smstateen check for AIA/IMSIC
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
 <20220721153136.377578-5-mchitale@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <22412445-702a-15a5-366a-3a1c8040322d@iscas.ac.cn>
Date: Fri, 22 Jul 2022 09:45:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220721153136.377578-5-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAD3k7w9Adpi2ABdAA--.17930S2
X-Coremail-Antispam: 1UD129KBjvAXoW3tr4Uuw1rZF47Zw17uw47twb_yoW8Gr1kuo
 W8tFyqvr4ru343Casa93yUtw429rn8Gws5AF90krZ3GF9rtr13Wr4UKryava4xtrW3Kry8
 AFy8Ga17KF48Aa43n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYD7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
 Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1U
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0JU2LvtUUUUU=
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 22 Jul 2022 01:45:46 -0000


在 2022/7/21 下午11:31, Mayuresh Chitale 写道:
> If smstateen is implemented then accesses to AIA
> registers CSRS, IMSIC CSRs and other IMSIC registers
> is controlled by setting of corresponding bits in
> mstateen/hstateen registers. Otherwise an illegal
> instruction trap or virtual instruction trap is
> generated.

Is there any spec for this?

I found only two sentences for this in smstateen spec:

" bits 60:58 - Reserved for the RISC-V Advanced Interrupt Architecture"

" Setting hstateen0 bit 58 to zero prevents a virtual machine from 
accessing the hart’s IMSIC the same as
setting hstatus.VGEIN = 0"

> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   target/riscv/csr.c | 222 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 220 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index a597b6cbc7..e40dd35d85 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -87,6 +87,42 @@ static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
>   
>       return RISCV_EXCP_NONE;
>   }
> +
> +static RISCVException smstateen_aia_acc_ok(CPURISCVState *env, int csrno)
> +{
> +    uint64_t bit;
> +
> +    switch (csrno) {
> +    case CSR_STOPEI:
> +    case CSR_VSTOPEI:
> +    case CSR_HSTATUS:
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
> +        bit = SMSTATEEN0_AIA;
> +        break;
> +
> +    case CSR_SISELECT:
> +    case CSR_VSISELECT:
> +        bit = SMSTATEEN0_SVSLCT;
> +        break;
> +
> +    default:
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    return smstateen_acc_ok(env, 0, bit);
> +}
>   #endif
>   
>   static RISCVException fs(CPURISCVState *env, int csrno)
> @@ -1383,6 +1419,13 @@ static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val,
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
> @@ -1465,7 +1508,9 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
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
> @@ -1494,11 +1539,20 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
>       };
>   
>       /* Find the selected guest interrupt file */
> -    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
> +    if (virt) {
> +        if (!cpu->cfg.ext_smstateen ||
> +                (env->hstateen[0] & SMSTATEEN0_IMSIC)) {
> +            vgein = get_field(env->hstatus, HSTATUS_VGEIN);
> +        }
> +    }
>   
>       if (ISELECT_IPRIO0 <= isel && isel <= ISELECT_IPRIO15) {
>           /* Local interrupt priority registers not available for VS-mode */
>           if (!virt) {
> +            if (priv == PRV_S && cpu->cfg.ext_smstateen &&
> +                !(env->hstateen[0] & SMSTATEEN0_AIA)) {
> +                goto done;
> +            }
>               ret = rmw_iprio(riscv_cpu_mxl_bits(env),
>                               isel, iprio, val, new_val, wr_mask,
>                               (priv == PRV_M) ? IRQ_M_EXT : IRQ_S_EXT);
> @@ -1532,6 +1586,13 @@ static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
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
> @@ -1884,6 +1945,10 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
>           wr_mask |= SMSTATEEN0_FCSR;
>       }
>   
> +    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
> +        wr_mask |= (SMSTATEEN0_IMSIC | SMSTATEEN0_AIA | SMSTATEEN0_SVSLCT);
> +    }
> +
>       return write_mstateen(env, csrno, wr_mask, new_val);
>   }
>   
> @@ -1935,6 +2000,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
>           wr_mask |= SMSTATEEN0_FCSR;
>       }
>   
> +    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
> +        wr_mask |= (SMSTATEEN0_IMSIC | SMSTATEEN0_AIA | SMSTATEEN0_SVSLCT);
> +    }
> +
>       return write_mstateenh(env, csrno, wr_mask, new_val);
>   }
>   
> @@ -1988,6 +2057,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
>           wr_mask |= SMSTATEEN0_FCSR;
>       }
>   
> +    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
> +        wr_mask |= (SMSTATEEN0_IMSIC | SMSTATEEN0_AIA | SMSTATEEN0_SVSLCT);
> +    }
> +
>       return write_hstateen(env, csrno, wr_mask, new_val);
>   }
>   
> @@ -2043,6 +2116,10 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
>           wr_mask |= SMSTATEEN0_FCSR;
>       }
>   
> +    if (riscv_feature(env, RISCV_FEATURE_AIA)) {
> +        wr_mask |= SMSTATEEN0_IMSIC | SMSTATEEN0_AIA | SMSTATEEN0_SVSLCT;
> +    }
> +
>       return write_hstateenh(env, csrno, wr_mask, new_val);
>   }
>   
> @@ -2277,6 +2354,12 @@ static RISCVException rmw_vsieh(CPURISCVState *env, int csrno,
>       uint64_t rval;
>       RISCVException ret;
>   
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       ret = rmw_vsie64(env, csrno, &rval,
>           ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
>       if (ret_val) {
> @@ -2331,6 +2414,12 @@ static RISCVException rmw_sieh(CPURISCVState *env, int csrno,
>       uint64_t rval;
>       RISCVException ret;
>   
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       ret = rmw_sie64(env, csrno, &rval,
>           ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
>       if (ret_val) {
> @@ -2493,6 +2582,12 @@ static RISCVException rmw_vsiph(CPURISCVState *env, int csrno,
>       uint64_t rval;
>       RISCVException ret;
>   
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       ret = rmw_vsip64(env, csrno, &rval,
>           ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
>       if (ret_val) {
> @@ -2547,6 +2642,12 @@ static RISCVException rmw_siph(CPURISCVState *env, int csrno,
>       uint64_t rval;
>       RISCVException ret;
>   
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       ret = rmw_sip64(env, csrno, &rval,
>           ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
>       if (ret_val) {
> @@ -2739,6 +2840,10 @@ static RISCVException read_hstatus(CPURISCVState *env, int csrno,
>   static RISCVException write_hstatus(CPURISCVState *env, int csrno,
>                                       target_ulong val)
>   {
> +    if (smstateen_aia_acc_ok(env, csrno) != RISCV_EXCP_NONE) {
> +        val &= ~HSTATUS_VGEIN;
> +    }
> +

Why this?  For the statement

"Setting hstateen0 bit 58 to zero prevents a virtual machine from 
accessing the hart’s IMSIC the same as
setting hstatus.VGEIN = 0"

I think  it means "setting hstateen0 bit 58 to zero" and "setting 
hstatus.VGEIN = 0" have the same function:

  " prevents a virtual machine from accessing the hart’s IMSIC", not 
"setting hstateen0 bit 58 to zero"  is to

"setting hstatus.VGEIN = 0".

Or any other statement about this ?

Regards,

Weiwei Li

>       env->hstatus = val;
>       if (riscv_cpu_mxl(env) != MXL_RV32 && get_field(val, HSTATUS_VSXL) != 2) {
>           qemu_log_mask(LOG_UNIMP, "QEMU does not support mixed HSXLEN options.");
> @@ -2799,6 +2904,12 @@ static RISCVException rmw_hidelegh(CPURISCVState *env, int csrno,
>       uint64_t rval;
>       RISCVException ret;
>   
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       ret = rmw_hideleg64(env, csrno, &rval,
>           ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
>       if (ret_val) {
> @@ -2845,6 +2956,12 @@ static RISCVException rmw_hviph(CPURISCVState *env, int csrno,
>       uint64_t rval;
>       RISCVException ret;
>   
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       ret = rmw_hvip64(env, csrno, &rval,
>           ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
>       if (ret_val) {
> @@ -2899,6 +3016,13 @@ static RISCVException write_hcounteren(CPURISCVState *env, int csrno,
>   static RISCVException read_hgeie(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
>   {
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_IMSIC);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       if (val) {
>           *val = env->hgeie;
>       }
> @@ -2908,6 +3032,13 @@ static RISCVException read_hgeie(CPURISCVState *env, int csrno,
>   static RISCVException write_hgeie(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_IMSIC);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       /* Only GEILEN:1 bits implemented and BIT0 is never implemented */
>       val &= ((((target_ulong)1) << env->geilen) - 1) << 1;
>       env->hgeie = val;
> @@ -2947,6 +3078,13 @@ static RISCVException write_htinst(CPURISCVState *env, int csrno,
>   static RISCVException read_hgeip(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
>   {
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_IMSIC);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       if (val) {
>           *val = env->hgeip;
>       }
> @@ -3017,12 +3155,28 @@ static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
>   
>   static int read_hvictl(CPURISCVState *env, int csrno, target_ulong *val)
>   {
> +    RISCVException ret;
> +
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       *val = env->hvictl;
>       return RISCV_EXCP_NONE;
>   }
>   
>   static int write_hvictl(CPURISCVState *env, int csrno, target_ulong val)
>   {
> +    RISCVException ret = RISCV_EXCP_NONE;
> +
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       env->hvictl = val & HVICTL_VALID_MASK;
>       return RISCV_EXCP_NONE;
>   }
> @@ -3081,41 +3235,105 @@ static int write_hvipriox(CPURISCVState *env, int first_index,
>   
>   static int read_hviprio1(CPURISCVState *env, int csrno, target_ulong *val)
>   {
> +    RISCVException ret;
> +
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       return read_hvipriox(env, 0, env->hviprio, val);
>   }
>   
>   static int write_hviprio1(CPURISCVState *env, int csrno, target_ulong val)
>   {
> +    RISCVException ret;
> +
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       return write_hvipriox(env, 0, env->hviprio, val);
>   }
>   
>   static int read_hviprio1h(CPURISCVState *env, int csrno, target_ulong *val)
>   {
> +    RISCVException ret;
> +
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       return read_hvipriox(env, 4, env->hviprio, val);
>   }
>   
>   static int write_hviprio1h(CPURISCVState *env, int csrno, target_ulong val)
>   {
> +    RISCVException ret;
> +
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       return write_hvipriox(env, 4, env->hviprio, val);
>   }
>   
>   static int read_hviprio2(CPURISCVState *env, int csrno, target_ulong *val)
>   {
> +    RISCVException ret;
> +
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       return read_hvipriox(env, 8, env->hviprio, val);
>   }
>   
>   static int write_hviprio2(CPURISCVState *env, int csrno, target_ulong val)
>   {
> +    RISCVException ret;
> +
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       return write_hvipriox(env, 8, env->hviprio, val);
>   }
>   
>   static int read_hviprio2h(CPURISCVState *env, int csrno, target_ulong *val)
>   {
> +    RISCVException ret;
> +
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       return read_hvipriox(env, 12, env->hviprio, val);
>   }
>   
>   static int write_hviprio2h(CPURISCVState *env, int csrno, target_ulong val)
>   {
> +    RISCVException ret;
> +
> +    /* Check if smstateen is enabled and this access is allowed */
> +    ret = smstateen_aia_acc_ok(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       return write_hvipriox(env, 12, env->hviprio, val);
>   }
>   


