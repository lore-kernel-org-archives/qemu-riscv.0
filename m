Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLm9h-0002c4-8j
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 09:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oLm9c-0002Zz-R3; Wed, 10 Aug 2022 09:53:49 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:46480 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oLm9W-0002Ei-Mo; Wed, 10 Aug 2022 09:53:48 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-01 (Coremail) with SMTP id qwCowABHTJBXuPNiSBebBw--.25743S2;
 Wed, 10 Aug 2022 21:53:28 +0800 (CST)
Subject: Re: [PATCH v8 3/3] target/riscv: Add vstimecmp support
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20220804014240.2514957-1-atishp@rivosinc.com>
 <20220804014240.2514957-4-atishp@rivosinc.com>
 <c8406f96-4bf7-aee0-71f0-3758c6ed4c97@iscas.ac.cn>
 <CAHBxVyE+mHSaDHEOS+4RwL+qCY4WLNuxUguSmL5p9m-OkbMQCA@mail.gmail.com>
 <63ae4839-9bf4-2c9d-8bd4-e9ea4bbab939@iscas.ac.cn>
 <CAHBxVyFRa+jO99SnvNPwbjGxcDtpxFvroJM=agerijTwz8Mx-Q@mail.gmail.com>
 <6d272bf2-325f-f87c-e55b-22731424c443@iscas.ac.cn>
 <CAHBxVyGCv8h07FjO7-1GJq6SZDZ4URNr2STDV_ReU3PGRUJu2Q@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <af187421-bd5f-d76a-dfbe-9297603469b2@iscas.ac.cn>
Date: Wed, 10 Aug 2022 21:53:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHBxVyGCv8h07FjO7-1GJq6SZDZ4URNr2STDV_ReU3PGRUJu2Q@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------54424C9C2A94FBDA52238D5D"
Content-Language: en-US
X-CM-TRANSID: qwCowABHTJBXuPNiSBebBw--.25743S2
X-Coremail-Antispam: 1UD129KBjvAXoW3KFW7GrWkKw18AF45ZF47Jwb_yoW8XFy5Xo
 WfK3WrZr45Jw109r1qyr1Utry3Wr18JrsFqr4DKFy3JF1xXr15J34xtry7t3y2qryxGr48
 X3WUWFyUZFW8Aryrn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYS7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2
 z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67
 IIx4CEVc8vx2IErcIFxwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAYIcxG
 8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
 0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
 17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
 C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUSsjbUUUUU=
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Aug 2022 13:53:49 -0000

This is a multi-part message in MIME format.
--------------54424C9C2A94FBDA52238D5D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/8/10 下午1:45, Atish Kumar Patra 写道:
>
>
> On Tue, Aug 9, 2022 at 6:33 PM Weiwei Li <liweiwei@iscas.ac.cn 
> <mailto:liweiwei@iscas.ac.cn>> wrote:
>
>
>     在 2022/8/10 上午3:34, Atish Kumar Patra 写道:
>>
>>
>>
>>     On Tue, Aug 9, 2022 at 12:01 AM Weiwei Li <liweiwei@iscas.ac.cn
>>     <mailto:liweiwei@iscas.ac.cn>> wrote:
>>
>>
>>         在 2022/8/9 上午1:20, Atish Kumar Patra 写道:
>>>
>>>
>>>         On Sun, Aug 7, 2022 at 6:50 PM Weiwei Li
>>>         <liweiwei@iscas.ac.cn <mailto:liweiwei@iscas.ac.cn>> wrote:
>>>
>>>
>>>             在 2022/8/4 上午9:42, Atish Patra 写道:
>>>             > vstimecmp CSR allows the guest OS or to program the
>>>             next guest timer
>>>             > interrupt directly. Thus, hypervisor no longer need to
>>>             inject the
>>>             > timer interrupt to the guest if vstimecmp is used.
>>>             This was ratified
>>>             > as a part of the Sstc extension.
>>>             >
>>>             > Signed-off-by: Atish Patra <atishp@rivosinc.com
>>>             <mailto:atishp@rivosinc.com>>
>>>             > ---
>>>             >   target/riscv/cpu.h         |  4 ++
>>>             >   target/riscv/cpu_bits.h    |  4 ++
>>>             >   target/riscv/cpu_helper.c  | 11 ++--
>>>             >   target/riscv/csr.c         | 102
>>>             ++++++++++++++++++++++++++++++++++++-
>>>             >   target/riscv/machine.c     |  1 +
>>>             >   target/riscv/time_helper.c | 16 ++++++
>>>             >   6 files changed, 133 insertions(+), 5 deletions(-)
>>>             >
>>>             > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>>             > index 4cda2905661e..1fd382b2717f 100644
>>>             > --- a/target/riscv/cpu.h
>>>             > +++ b/target/riscv/cpu.h
>>>             > @@ -312,6 +312,8 @@ struct CPUArchState {
>>>             >       /* Sstc CSRs */
>>>             >       uint64_t stimecmp;
>>>             >
>>>             > +    uint64_t vstimecmp;
>>>             > +
>>>             >       /* physical memory protection */
>>>             >       pmp_table_t pmp_state;
>>>             >       target_ulong mseccfg;
>>>             > @@ -366,6 +368,8 @@ struct CPUArchState {
>>>             >
>>>             >       /* Fields from here on are preserved across CPU
>>>             reset. */
>>>             >       QEMUTimer *stimer; /* Internal timer for S-mode
>>>             interrupt */
>>>             > +    QEMUTimer *vstimer; /* Internal timer for VS-mode
>>>             interrupt */
>>>             > +    bool vstime_irq;
>>>             >
>>>             >       hwaddr kernel_addr;
>>>             >       hwaddr fdt_addr;
>>>             > diff --git a/target/riscv/cpu_bits.h
>>>             b/target/riscv/cpu_bits.h
>>>             > index ac17cf1515c0..095dab19f512 100644
>>>             > --- a/target/riscv/cpu_bits.h
>>>             > +++ b/target/riscv/cpu_bits.h
>>>             > @@ -257,6 +257,10 @@
>>>             >   #define CSR_VSIP 0x244
>>>             >   #define CSR_VSATP  0x280
>>>             >
>>>             > +/* Sstc virtual CSRs */
>>>             > +#define CSR_VSTIMECMP  0x24D
>>>             > +#define CSR_VSTIMECMPH 0x25D
>>>             > +
>>>             >   #define CSR_MTINST 0x34a
>>>             >   #define CSR_MTVAL2 0x34b
>>>             >
>>>             > diff --git a/target/riscv/cpu_helper.c
>>>             b/target/riscv/cpu_helper.c
>>>             > index 650574accf0a..1e4faa84e839 100644
>>>             > --- a/target/riscv/cpu_helper.c
>>>             > +++ b/target/riscv/cpu_helper.c
>>>             > @@ -345,8 +345,9 @@ uint64_t
>>>             riscv_cpu_all_pending(CPURISCVState *env)
>>>             >   {
>>>             >       uint32_t gein = get_field(env->hstatus,
>>>             HSTATUS_VGEIN);
>>>             >       uint64_t vsgein = (env->hgeip & (1ULL << gein))
>>>             ? MIP_VSEIP : 0;
>>>             > +    uint64_t vstip = (env->vstime_irq) ? MIP_VSTIP : 0;
>>>             >
>>>             > -    return (env->mip | vsgein) & env->mie;
>>>             > +    return (env->mip | vsgein | vstip) & env->mie;
>>>             >   }
>>>             >
>>>             >   int riscv_cpu_mirq_pending(CPURISCVState *env)
>>>             > @@ -605,7 +606,7 @@ uint64_t
>>>             riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask,
>>>             uint64_t value)
>>>             >   {
>>>             >       CPURISCVState *env = &cpu->env;
>>>             >       CPUState *cs = CPU(cpu);
>>>             > -    uint64_t gein, vsgein = 0, old = env->mip;
>>>             > +    uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
>>>             >       bool locked = false;
>>>             >
>>>             >       if (riscv_cpu_virt_enabled(env)) {
>>>             > @@ -613,6 +614,10 @@ uint64_t
>>>             riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask,
>>>             uint64_t value)
>>>             >           vsgein = (env->hgeip & (1ULL << gein)) ?
>>>             MIP_VSEIP : 0;
>>>             >       }
>>>             >
>>>             > +    /* No need to update mip for VSTIP */
>>>             > +    mask = ((mask == MIP_VSTIP) && env->vstime_irq) ?
>>>             0 : mask;
>>>             > +    vstip = env->vstime_irq ? MIP_VSTIP : 0;
>>>             > +
>>>             >       if (!qemu_mutex_iothread_locked()) {
>>>             >           locked = true;
>>>             >  qemu_mutex_lock_iothread();
>>>             > @@ -620,7 +625,7 @@ uint64_t
>>>             riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask,
>>>             uint64_t value)
>>>             >
>>>             >       env->mip = (env->mip & ~mask) | (value & mask);
>>>             >
>>>             > -    if (env->mip | vsgein) {
>>>             > +    if (env->mip | vsgein | vstip) {
>>>             >           cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>>>             >       } else {
>>>             >           cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
>>>             > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>             > index e18b000700e4..9da4d6515e7b 100644
>>>             > --- a/target/riscv/csr.c
>>>             > +++ b/target/riscv/csr.c
>>>             > @@ -829,17 +829,100 @@ static RISCVException
>>>             sstc(CPURISCVState *env, int csrno)
>>>             >       return smode(env, csrno);
>>>             >   }
>>>             >
>>>             > +static RISCVException sstc_hmode(CPURISCVState *env,
>>>             int csrno)
>>>             > +{
>>>             > +    CPUState *cs = env_cpu(env);
>>>             > +    RISCVCPU *cpu = RISCV_CPU(cs);
>>>             > +
>>>             > +    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
>>>             > +        return RISCV_EXCP_ILLEGAL_INST;
>>>             > +    }
>>>             > +
>>>             > +    if (env->priv == PRV_M) {
>>>             > +        return RISCV_EXCP_NONE;
>>>             > +    }
>>>             > +
>>>             > +    if (!(get_field(env->mcounteren, COUNTEREN_TM) &
>>>             > + get_field(env->menvcfg, MENVCFG_STCE))) {
>>>             > +        return RISCV_EXCP_ILLEGAL_INST;
>>>             > +    }
>>>             > +
>>>             > +    if (riscv_cpu_virt_enabled(env)) {
>>>             > +        if (!(get_field(env->hcounteren, COUNTEREN_TM) &
>>>             > + get_field(env->henvcfg, HENVCFG_STCE))) {
>>>             > +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>>             > +        }
>>>             > +    }
>>>             > +
>>>
>>>             I think this check on hcounteren and henvcfg should be
>>>             added to sstc
>>>             predicate, not here.
>>>
>>>             Even though hcounteren and henvcfg finally controls the
>>>             access of
>>>             vstimecmp, however
>>>
>>>
>>>         We don't need to check hcounteren while accessing scountern.
>>>         Thus it will be an unnecessary
>>>         check there. Predicate function check should do the required
>>>         sanity check required only for that specific CSR.
>>>         That's why, I think it is the correct place.
>>
>>         Sorry. It seems have no relationship with "check hcounteren
>>         while accessing scountern".
>>
>>
>>
>>         As the sstc spec (Section 2.2 and Chapter 3) states:
>>
>>         /"In addition, when the TM bit in the hcounteren register is
>>         clear, attempts to access the vstimecmp register (//*via*//*
>>         *//*stimecmp*//) while executing in VS-mode will cause a
>>         virtual instruction exception if the same bit in mcounteren is//
>>         //1. When this bit is set, access to the vstimecmp register
>>         (if implemented) is permitted in VS-mode."/
>>
>>         /"When STCE in menvcfg is one but STCE in henvcfg is zero, an
>>         attempt to //*access stimecmp *//(really vstimecmp)//
>>         //when V = 1 raises a virtual instruction exception, and
>>         VSTIP in hip reverts to its defined behavior as if this//
>>         //extension is not implemented."/
>>
>>         Both of them have stated the control is for stimecmp even
>>         though the final access is for vstimecmp just like
>>
>>         your following modification for read/write_stimecmp.
>>
>>
>>     We can further simplify to remove sstc_hmode completely. After
>>     moving this bit to sstc predicate function, it is enough for
>>     vstimecmp as well.
>
>     Sorry. I cannot get your idea. Do you mean they share the same
>     predicate? They seem different:
>
>     Vstimecmp is under is control of menvcfg and mcounteren. And
>     stimecmp is additionally controlled by senvcfg and scuonteren.
>
>
> stimecmp is under control of menvcfg & mcounteren while vstimecmp is 
> controlled by henvcfg & hcountern. senvcfg doesn't have a STCE bit.
> so vstimecmp predicate function should do the following things:
>
> - hmode check
> - sstc extension availability
> - menvcfg/mcounteren
> As vstimecmp can be accessed by HS mode/M mode only while VS mode 
> access stimecmp (which is translated to vstimecmp if V=1)
>
> Thus stimecmp predicate function will do the following things:
> - smode check
> - sstc extension availability
> - menvcfg/mcounteren
> - henvcfg/hcountern (if V=1)
>
> That's why I was suggesting that we can simplify two predicate 
> functions where only mode check will be different (based on CSR value).

Yeah, I agree.  It's acceptable to me to share the same predicate(by 
return hmode() or smode() based on csrno) if you insist.

Regards,

Weiwei Li

>     On the other hand, Vstimecmp is a Hypervisor CSR(checked by
>     hmode), stimecmp is Supervisor CSR(checked by smode).
>
>     Regards,
>
>     Weiwei Li
>
>>
>>         From the  other hand,  direct access for VS CSRs (including
>>         vstimecmp) from VS/VU mode is never allowed,
>>
>>         which is checked in riscv_csrrw_check.
>>
>>         Regards,
>>
>>         Weiwei Li
>>
>>>             it controls it via stimecmp.
>>>
>>>             > +    return hmode(env, csrno);
>>>             > +}
>>>             > +
>>>             > +static RISCVException read_vstimecmp(CPURISCVState
>>>             *env, int csrno,
>>>             > +     target_ulong *val)
>>>             > +{
>>>             > +    *val = env->vstimecmp;
>>>             > +
>>>             > +    return RISCV_EXCP_NONE;
>>>             > +}
>>>             > +
>>>             > +static RISCVException read_vstimecmph(CPURISCVState
>>>             *env, int csrno,
>>>             > +     target_ulong *val)
>>>             > +{
>>>             > +    *val = env->vstimecmp >> 32;
>>>             > +
>>>             > +    return RISCV_EXCP_NONE;
>>>             > +}
>>>             > +
>>>             > +static RISCVException write_vstimecmp(CPURISCVState
>>>             *env, int csrno,
>>>             > +     target_ulong val)
>>>             > +{
>>>             > +    RISCVCPU *cpu = env_archcpu(env);
>>>             > +
>>>             > +    if (riscv_cpu_mxl(env) == MXL_RV32) {
>>>             > +        env->vstimecmp = deposit64(env->vstimecmp, 0,
>>>             32, (uint64_t)val);
>>>             > +    } else {
>>>             > +        env->vstimecmp = val;
>>>             > +    }
>>>             > +
>>>             > + riscv_timer_write_timecmp(cpu, env->vstimer,
>>>             env->vstimecmp,
>>>             > + env->htimedelta, MIP_VSTIP);
>>>             > +
>>>             > +    return RISCV_EXCP_NONE;
>>>             > +}
>>>             > +
>>>             > +static RISCVException write_vstimecmph(CPURISCVState
>>>             *env, int csrno,
>>>             > +     target_ulong val)
>>>             > +{
>>>             > +    RISCVCPU *cpu = env_archcpu(env);
>>>             > +
>>>             > +    env->vstimecmp = deposit64(env->vstimecmp, 32,
>>>             32, (uint64_t)val);
>>>             > + riscv_timer_write_timecmp(cpu, env->vstimer,
>>>             env->vstimecmp,
>>>             > + env->htimedelta, MIP_VSTIP);
>>>             > +
>>>             > +    return RISCV_EXCP_NONE;
>>>             > +}
>>>             > +
>>>             >   static RISCVException read_stimecmp(CPURISCVState
>>>             *env, int csrno,
>>>             >      target_ulong *val)
>>>             >   {
>>>             > -    *val = env->stimecmp;
>>>             > +    if (riscv_cpu_virt_enabled(env)) {
>>>             > +        *val = env->vstimecmp;
>>>             > +    } else {
>>>             > +        *val = env->stimecmp;
>>>             > +    }
>>>             > +
>>>             >       return RISCV_EXCP_NONE;
>>>             >   }
>>>             >
>>>             >   static RISCVException read_stimecmph(CPURISCVState
>>>             *env, int csrno,
>>>             >      target_ulong *val)
>>>             >   {
>>>             > -    *val = env->stimecmp >> 32;
>>>             > +    if (riscv_cpu_virt_enabled(env)) {
>>>             > +        *val = env->vstimecmp >> 32;
>>>             > +    } else {
>>>             > +        *val = env->stimecmp >> 32;
>>>             > +    }
>>>             > +
>>>             >       return RISCV_EXCP_NONE;
>>>             >   }
>>>             >
>>>             > @@ -848,6 +931,10 @@ static RISCVException
>>>             write_stimecmp(CPURISCVState *env, int csrno,
>>>             >   {
>>>             >       RISCVCPU *cpu = env_archcpu(env);
>>>             >
>>>             > +    if (riscv_cpu_virt_enabled(env)) {
>>>             > +        return write_vstimecmp(env, csrno, val);
>>>             > +    }
>>>             > +
>>>             >       if (riscv_cpu_mxl(env) == MXL_RV32) {
>>>             >           env->stimecmp = deposit64(env->stimecmp, 0,
>>>             32, (uint64_t)val);
>>>             >       } else {
>>>             > @@ -864,6 +951,10 @@ static RISCVException
>>>             write_stimecmph(CPURISCVState *env, int csrno,
>>>             >   {
>>>             >       RISCVCPU *cpu = env_archcpu(env);
>>>             >
>>>             > +    if (riscv_cpu_virt_enabled(env)) {
>>>             > +        return write_vstimecmph(env, csrno, val);
>>>             > +    }
>>>             > +
>>>             >       env->stimecmp = deposit64(env->stimecmp, 32, 32,
>>>             (uint64_t)val);
>>>             >  riscv_timer_write_timecmp(cpu, env->stimer,
>>>             env->stimecmp, 0, MIP_STIP);
>>>             >
>>>             > @@ -1801,6 +1892,7 @@ static RISCVException
>>>             rmw_mip64(CPURISCVState *env, int csrno,
>>>             >       if (csrno != CSR_HVIP) {
>>>             >           gin = get_field(env->hstatus, HSTATUS_VGEIN);
>>>             >           old_mip |= (env->hgeip & ((target_ulong)1 <<
>>>             gin)) ? MIP_VSEIP : 0;
>>>             > +        old_mip |= env->vstime_irq ? MIP_VSTIP : 0;
>>>             >       }
>>>             >
>>>             >       if (ret_val) {
>>>             > @@ -3661,6 +3753,12 @@ riscv_csr_operations
>>>             csr_ops[CSR_TABLE_SIZE] = {
>>>             >            .min_priv_ver = PRIV_VERSION_1_12_0 },
>>>             >       [CSR_STIMECMPH] = { "stimecmph", sstc,
>>>             read_stimecmph, write_stimecmph,
>>>             >            .min_priv_ver = PRIV_VERSION_1_12_0 },
>>>             > +    [CSR_VSTIMECMP] = { "vstimecmp", sstc_hmode,
>>>             read_vstimecmp,
>>>             > +           write_vstimecmp,
>>>
>>>             Please align with last line. The same to other similar
>>>             lines.
>>>
>>>
>>>         Sure. I will fix that.
>>>
>>>             Regards,
>>>
>>>             Weiwei Li
>>>
>>>             > +           .min_priv_ver = PRIV_VERSION_1_12_0 },
>>>             > +    [CSR_VSTIMECMPH] = { "vstimecmph", sstc_hmode,
>>>             read_vstimecmph,
>>>             > +           write_vstimecmph,
>>>             > +           .min_priv_ver = PRIV_VERSION_1_12_0 },
>>>             >
>>>             >       /* Supervisor Protection and Translation */
>>>             >       [CSR_SATP]     = { "satp",    smode, read_satp, 
>>>                write_satp  },
>>>             > diff --git a/target/riscv/machine.c
>>>             b/target/riscv/machine.c
>>>             > index 622fface484e..4ba55705d147 100644
>>>             > --- a/target/riscv/machine.c
>>>             > +++ b/target/riscv/machine.c
>>>             > @@ -92,6 +92,7 @@ static const VMStateDescription
>>>             vmstate_hyper = {
>>>             >  VMSTATE_UINTTL(env.hgeie, RISCVCPU),
>>>             >  VMSTATE_UINTTL(env.hgeip, RISCVCPU),
>>>             >  VMSTATE_UINT64(env.htimedelta, RISCVCPU),
>>>             > + VMSTATE_UINT64(env.vstimecmp, RISCVCPU),
>>>             >
>>>             >  VMSTATE_UINTTL(env.hvictl, RISCVCPU),
>>>             >  VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
>>>             > diff --git a/target/riscv/time_helper.c
>>>             b/target/riscv/time_helper.c
>>>             > index f3fb5eac7b7b..8cce667dfd47 100644
>>>             > --- a/target/riscv/time_helper.c
>>>             > +++ b/target/riscv/time_helper.c
>>>             > @@ -22,6 +22,14 @@
>>>             >   #include "time_helper.h"
>>>             >   #include "hw/intc/riscv_aclint.h"
>>>             >
>>>             > +static void riscv_vstimer_cb(void *opaque)
>>>             > +{
>>>             > +    RISCVCPU *cpu = opaque;
>>>             > +    CPURISCVState *env = &cpu->env;
>>>             > +    env->vstime_irq = 1;
>>>             > +    riscv_cpu_update_mip(cpu, MIP_VSTIP,
>>>             BOOL_TO_MASK(1));
>>>             > +}
>>>             > +
>>>             >   static void riscv_stimer_cb(void *opaque)
>>>             >   {
>>>             >       RISCVCPU *cpu = opaque;
>>>             > @@ -47,10 +55,16 @@ void
>>>             riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
>>>             >            * If we're setting an stimecmp value in the
>>>             "past",
>>>             >            * immediately raise the timer interrupt
>>>             >            */
>>>             > +        if (timer_irq == MIP_VSTIP) {
>>>             > +            env->vstime_irq = 1;
>>>             > +        }
>>>             >  riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
>>>             >           return;
>>>             >       }
>>>             >
>>>             > +    if (timer_irq == MIP_VSTIP) {
>>>             > +        env->vstime_irq = 0;
>>>             > +    }
>>>             >       /* Clear the [V]STIP bit in mip */
>>>             >       riscv_cpu_update_mip(cpu, timer_irq,
>>>             BOOL_TO_MASK(0));
>>>             >
>>>             > @@ -95,4 +109,6 @@ void riscv_timer_init(RISCVCPU *cpu)
>>>             >       env->stimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>>>             &riscv_stimer_cb, cpu);
>>>             >       env->stimecmp = 0;
>>>             >
>>>             > +    env->vstimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>>>             &riscv_vstimer_cb, cpu);
>>>             > +    env->vstimecmp = 0;
>>>             >   }
>>>

--------------54424C9C2A94FBDA52238D5D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/8/10 下午1:45, Atish Kumar Patra
      写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAHBxVyGCv8h07FjO7-1GJq6SZDZ4URNr2STDV_ReU3PGRUJu2Q@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue, Aug 9, 2022 at 6:33
            PM Weiwei Li &lt;<a href="mailto:liweiwei@iscas.ac.cn"
              moz-do-not-send="true">liweiwei@iscas.ac.cn</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote">
            <div>
              <p><br>
              </p>
              <div>在 2022/8/10 上午3:34, Atish Kumar Patra 写道:<br>
              </div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div dir="ltr"><br>
                  </div>
                  <div dir="ltr">
                    <div dir="ltr"><br>
                    </div>
                    <br>
                    <div class="gmail_quote">
                      <div dir="ltr" class="gmail_attr">On Tue, Aug 9,
                        2022 at 12:01 AM Weiwei Li &lt;<a
                          href="mailto:liweiwei@iscas.ac.cn"
                          target="_blank" moz-do-not-send="true">liweiwei@iscas.ac.cn</a>&gt;
                        wrote:<br>
                      </div>
                      <blockquote class="gmail_quote">
                        <div>
                          <p><br>
                          </p>
                          <div>在 2022/8/9 上午1:20, Atish Kumar Patra 写道:<br>
                          </div>
                          <blockquote type="cite">
                            <div dir="ltr">
                              <div dir="ltr"><br>
                              </div>
                              <br>
                              <div class="gmail_quote">
                                <div dir="ltr" class="gmail_attr">On
                                  Sun, Aug 7, 2022 at 6:50 PM Weiwei Li
                                  &lt;<a
                                    href="mailto:liweiwei@iscas.ac.cn"
                                    target="_blank"
                                    moz-do-not-send="true">liweiwei@iscas.ac.cn</a>&gt;
                                  wrote:<br>
                                </div>
                                <blockquote class="gmail_quote"><br>
                                  在 2022/8/4 上午9:42, Atish Patra 写道:<br>
                                  &gt; vstimecmp CSR allows the guest OS
                                  or to program the next guest timer<br>
                                  &gt; interrupt directly. Thus,
                                  hypervisor no longer need to inject
                                  the<br>
                                  &gt; timer interrupt to the guest if
                                  vstimecmp is used. This was ratified<br>
                                  &gt; as a part of the Sstc extension.<br>
                                  &gt;<br>
                                  &gt; Signed-off-by: Atish Patra &lt;<a
                                    href="mailto:atishp@rivosinc.com"
                                    target="_blank"
                                    moz-do-not-send="true">atishp@rivosinc.com</a>&gt;<br>
                                  &gt; ---<br>
                                  &gt;   target/riscv/cpu.h         | 
                                   4 ++<br>
                                  &gt;   target/riscv/cpu_bits.h    | 
                                   4 ++<br>
                                  &gt;   target/riscv/cpu_helper.c  | 
                                  11 ++--<br>
                                  &gt;   target/riscv/csr.c         |
                                  102
                                  ++++++++++++++++++++++++++++++++++++-<br>
                                  &gt;   target/riscv/machine.c     | 
                                   1 +<br>
                                  &gt;   target/riscv/time_helper.c | 
                                  16 ++++++<br>
                                  &gt;   6 files changed, 133
                                  insertions(+), 5 deletions(-)<br>
                                  &gt;<br>
                                  &gt; diff --git a/target/riscv/cpu.h
                                  b/target/riscv/cpu.h<br>
                                  &gt; index 4cda2905661e..1fd382b2717f
                                  100644<br>
                                  &gt; --- a/target/riscv/cpu.h<br>
                                  &gt; +++ b/target/riscv/cpu.h<br>
                                  &gt; @@ -312,6 +312,8 @@ struct
                                  CPUArchState {<br>
                                  &gt;       /* Sstc CSRs */<br>
                                  &gt;       uint64_t stimecmp;<br>
                                  &gt;   <br>
                                  &gt; +    uint64_t vstimecmp;<br>
                                  &gt; +<br>
                                  &gt;       /* physical memory
                                  protection */<br>
                                  &gt;       pmp_table_t pmp_state;<br>
                                  &gt;       target_ulong mseccfg;<br>
                                  &gt; @@ -366,6 +368,8 @@ struct
                                  CPUArchState {<br>
                                  &gt;   <br>
                                  &gt;       /* Fields from here on are
                                  preserved across CPU reset. */<br>
                                  &gt;       QEMUTimer *stimer; /*
                                  Internal timer for S-mode interrupt */<br>
                                  &gt; +    QEMUTimer *vstimer; /*
                                  Internal timer for VS-mode interrupt
                                  */<br>
                                  &gt; +    bool vstime_irq;<br>
                                  &gt;   <br>
                                  &gt;       hwaddr kernel_addr;<br>
                                  &gt;       hwaddr fdt_addr;<br>
                                  &gt; diff --git
                                  a/target/riscv/cpu_bits.h
                                  b/target/riscv/cpu_bits.h<br>
                                  &gt; index ac17cf1515c0..095dab19f512
                                  100644<br>
                                  &gt; --- a/target/riscv/cpu_bits.h<br>
                                  &gt; +++ b/target/riscv/cpu_bits.h<br>
                                  &gt; @@ -257,6 +257,10 @@<br>
                                  &gt;   #define CSR_VSIP           
                                  0x244<br>
                                  &gt;   #define CSR_VSATP         
                                   0x280<br>
                                  &gt;   <br>
                                  &gt; +/* Sstc virtual CSRs */<br>
                                  &gt; +#define CSR_VSTIMECMP     
                                   0x24D<br>
                                  &gt; +#define CSR_VSTIMECMPH     
                                  0x25D<br>
                                  &gt; +<br>
                                  &gt;   #define CSR_MTINST         
                                  0x34a<br>
                                  &gt;   #define CSR_MTVAL2         
                                  0x34b<br>
                                  &gt;   <br>
                                  &gt; diff --git
                                  a/target/riscv/cpu_helper.c
                                  b/target/riscv/cpu_helper.c<br>
                                  &gt; index 650574accf0a..1e4faa84e839
                                  100644<br>
                                  &gt; --- a/target/riscv/cpu_helper.c<br>
                                  &gt; +++ b/target/riscv/cpu_helper.c<br>
                                  &gt; @@ -345,8 +345,9 @@ uint64_t
                                  riscv_cpu_all_pending(CPURISCVState
                                  *env)<br>
                                  &gt;   {<br>
                                  &gt;       uint32_t gein =
                                  get_field(env-&gt;hstatus,
                                  HSTATUS_VGEIN);<br>
                                  &gt;       uint64_t vsgein =
                                  (env-&gt;hgeip &amp; (1ULL &lt;&lt;
                                  gein)) ? MIP_VSEIP : 0;<br>
                                  &gt; +    uint64_t vstip =
                                  (env-&gt;vstime_irq) ? MIP_VSTIP : 0;<br>
                                  &gt;   <br>
                                  &gt; -    return (env-&gt;mip |
                                  vsgein) &amp; env-&gt;mie;<br>
                                  &gt; +    return (env-&gt;mip | vsgein
                                  | vstip) &amp; env-&gt;mie;<br>
                                  &gt;   }<br>
                                  &gt;   <br>
                                  &gt;   int
                                  riscv_cpu_mirq_pending(CPURISCVState
                                  *env)<br>
                                  &gt; @@ -605,7 +606,7 @@ uint64_t
                                  riscv_cpu_update_mip(RISCVCPU *cpu,
                                  uint64_t mask, uint64_t value)<br>
                                  &gt;   {<br>
                                  &gt;       CPURISCVState *env =
                                  &amp;cpu-&gt;env;<br>
                                  &gt;       CPUState *cs = CPU(cpu);<br>
                                  &gt; -    uint64_t gein, vsgein = 0,
                                  old = env-&gt;mip;<br>
                                  &gt; +    uint64_t gein, vsgein = 0,
                                  vstip = 0, old = env-&gt;mip;<br>
                                  &gt;       bool locked = false;<br>
                                  &gt;   <br>
                                  &gt;       if
                                  (riscv_cpu_virt_enabled(env)) {<br>
                                  &gt; @@ -613,6 +614,10 @@ uint64_t
                                  riscv_cpu_update_mip(RISCVCPU *cpu,
                                  uint64_t mask, uint64_t value)<br>
                                  &gt;           vsgein = (env-&gt;hgeip
                                  &amp; (1ULL &lt;&lt; gein)) ?
                                  MIP_VSEIP : 0;<br>
                                  &gt;       }<br>
                                  &gt;   <br>
                                  &gt; +    /* No need to update mip for
                                  VSTIP */<br>
                                  &gt; +    mask = ((mask == MIP_VSTIP)
                                  &amp;&amp; env-&gt;vstime_irq) ? 0 :
                                  mask;<br>
                                  &gt; +    vstip = env-&gt;vstime_irq ?
                                  MIP_VSTIP : 0;<br>
                                  &gt; +<br>
                                  &gt;       if
                                  (!qemu_mutex_iothread_locked()) {<br>
                                  &gt;           locked = true;<br>
                                  &gt;         
                                   qemu_mutex_lock_iothread();<br>
                                  &gt; @@ -620,7 +625,7 @@ uint64_t
                                  riscv_cpu_update_mip(RISCVCPU *cpu,
                                  uint64_t mask, uint64_t value)<br>
                                  &gt;   <br>
                                  &gt;       env-&gt;mip = (env-&gt;mip
                                  &amp; ~mask) | (value &amp; mask);<br>
                                  &gt;   <br>
                                  &gt; -    if (env-&gt;mip | vsgein) {<br>
                                  &gt; +    if (env-&gt;mip | vsgein |
                                  vstip) {<br>
                                  &gt;           cpu_interrupt(cs,
                                  CPU_INTERRUPT_HARD);<br>
                                  &gt;       } else {<br>
                                  &gt;           cpu_reset_interrupt(cs,
                                  CPU_INTERRUPT_HARD);<br>
                                  &gt; diff --git a/target/riscv/csr.c
                                  b/target/riscv/csr.c<br>
                                  &gt; index e18b000700e4..9da4d6515e7b
                                  100644<br>
                                  &gt; --- a/target/riscv/csr.c<br>
                                  &gt; +++ b/target/riscv/csr.c<br>
                                  &gt; @@ -829,17 +829,100 @@ static
                                  RISCVException sstc(CPURISCVState
                                  *env, int csrno)<br>
                                  &gt;       return smode(env, csrno);<br>
                                  &gt;   }<br>
                                  &gt;   <br>
                                  &gt; +static RISCVException
                                  sstc_hmode(CPURISCVState *env, int
                                  csrno)<br>
                                  &gt; +{<br>
                                  &gt; +    CPUState *cs = env_cpu(env);<br>
                                  &gt; +    RISCVCPU *cpu =
                                  RISCV_CPU(cs);<br>
                                  &gt; +<br>
                                  &gt; +    if (!cpu-&gt;cfg.ext_sstc ||
                                  !env-&gt;rdtime_fn) {<br>
                                  &gt; +        return
                                  RISCV_EXCP_ILLEGAL_INST;<br>
                                  &gt; +    }<br>
                                  &gt; +<br>
                                  &gt; +    if (env-&gt;priv == PRV_M) {<br>
                                  &gt; +        return RISCV_EXCP_NONE;<br>
                                  &gt; +    }<br>
                                  &gt; +<br>
                                  &gt; +    if
                                  (!(get_field(env-&gt;mcounteren,
                                  COUNTEREN_TM) &amp;<br>
                                  &gt; +         
                                  get_field(env-&gt;menvcfg,
                                  MENVCFG_STCE))) {<br>
                                  &gt; +        return
                                  RISCV_EXCP_ILLEGAL_INST;<br>
                                  &gt; +    }<br>
                                  &gt; +<br>
                                  &gt; +    if
                                  (riscv_cpu_virt_enabled(env)) {<br>
                                  &gt; +        if
                                  (!(get_field(env-&gt;hcounteren,
                                  COUNTEREN_TM) &amp;<br>
                                  &gt; +             
                                  get_field(env-&gt;henvcfg,
                                  HENVCFG_STCE))) {<br>
                                  &gt; +            return
                                  RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
                                  &gt; +        }<br>
                                  &gt; +    }<br>
                                  &gt; +<br>
                                  <br>
                                  I think this check on hcounteren and
                                  henvcfg should be added to sstc <br>
                                  predicate, not here.<br>
                                  <br>
                                  Even though hcounteren and henvcfg
                                  finally controls the access of  <br>
                                  vstimecmp, however<br>
                                  <br>
                                </blockquote>
                                <div><br>
                                </div>
                                <div>We don't need to check hcounteren
                                  while accessing scountern. Thus it
                                  will be an unnecessary</div>
                                <div>check there. Predicate function
                                  check should do the required sanity
                                  check required only for that specific
                                  CSR.</div>
                                <div>That's why, I think it is the
                                  correct place.</div>
                              </div>
                            </div>
                          </blockquote>
                          <p>Sorry. It seems have no relationship with
                            "check hcounteren while accessing
                            scountern". <br>
                          </p>
                          <p> </p>
                        </div>
                      </blockquote>
                      <div><br>
                      </div>
                      <div> <br>
                      </div>
                      <blockquote class="gmail_quote">
                        <div>
                          <p>As the sstc spec (Section 2.2 and Chapter
                            3) states:</p>
                          <p><i>"In addition, when the TM bit in the
                              hcounteren register is clear, attempts to
                              access the vstimecmp register (</i><i><b>via</b></i><i><b><br>
                              </b></i><i><b>stimecmp</b></i><i>) while
                              executing in VS-mode will cause a virtual
                              instruction exception if the same bit in
                              mcounteren is</i><i><br>
                            </i><i>1. When this bit is set, access to
                              the vstimecmp register (if implemented) is
                              permitted in VS-mode."</i></p>
                          <p><i>"When STCE in menvcfg is one but STCE in
                              henvcfg is zero, an attempt to </i><i><b>access
                                stimecmp </b></i><i>(really vstimecmp)</i><i><br>
                            </i><i>when V = 1 raises a virtual
                              instruction exception, and VSTIP in hip
                              reverts to its defined behavior as if this</i><i><br>
                            </i><i>extension is not implemented."</i></p>
                          <p>Both of them have stated the control is for
                            stimecmp even though the final access is for
                            vstimecmp just like</p>
                          <p>your following modification for
                            read/write_stimecmp. </p>
                        </div>
                      </blockquote>
                      <div><br>
                      </div>
                      <div>
                        <div>We can further simplify to remove
                          sstc_hmode completely. After moving this bit
                          to sstc predicate function, it is enough for
                          vstimecmp as well. <br>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </blockquote>
              <p>Sorry. I cannot get your idea. Do you mean they share
                the same predicate? They seem different: <br>
              </p>
              <p>Vstimecmp is under is control of menvcfg and
                mcounteren. And stimecmp is additionally controlled by
                senvcfg and scuonteren.</p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>stimecmp is under control of menvcfg &amp; mcounteren
            while vstimecmp is controlled by henvcfg &amp; hcountern.
            senvcfg doesn't have a STCE bit.</div>
          <div>so vstimecmp predicate function should do the following
            things:</div>
          <div><br>
          </div>
          <div>- hmode check</div>
          <div>- sstc extension availability</div>
          <div>- menvcfg/mcounteren </div>
          <div> </div>
          <div>As vstimecmp can be accessed by HS mode/M mode only while
            VS mode access stimecmp (which is translated to vstimecmp if
            V=1)</div>
          <div><br>
          </div>
          <div>Thus stimecmp predicate function will do the following
            things:</div>
          <div>
            <div>- smode check</div>
            <div>- sstc extension availability</div>
            <div>- menvcfg/mcounteren </div>
            - henvcfg/hcountern (if V=1)</div>
          <div><br>
          </div>
          <div>That's why I was suggesting that we can simplify two
            predicate functions where only mode check will be different
            (based on CSR value).</div>
        </div>
      </div>
    </blockquote>
    <p>Yeah, I agree.  It's acceptable to me to share the same 
      predicate(by return hmode() or smode() based on csrno) if you
      insist.</p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type="cite"
cite="mid:CAHBxVyGCv8h07FjO7-1GJq6SZDZ4URNr2STDV_ReU3PGRUJu2Q@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <blockquote class="gmail_quote">
            <div>
              <p>On the other hand, Vstimecmp is a Hypervisor
                CSR(checked by hmode), stimecmp is Supervisor
                CSR(checked by smode).<br>
              </p>
              <p>Regards,</p>
              <p>Weiwei Li<br>
              </p>
              <blockquote type="cite">
                <div dir="ltr">
                  <div dir="ltr">
                    <div class="gmail_quote">
                      <div> </div>
                      <blockquote class="gmail_quote">
                        <div>
                          <p> <br>
                          </p>
                          <p>From the  other hand,  direct access for VS
                            CSRs (including vstimecmp) from VS/VU mode
                            is never allowed,<br>
                          </p>
                          <p>which is checked in riscv_csrrw_check. </p>
                        </div>
                      </blockquote>
                      <blockquote class="gmail_quote">
                        <div>
                          <p> </p>
                          <p>Regards,</p>
                          <p>Weiwei Li  <br>
                          </p>
                          <blockquote type="cite">
                            <div dir="ltr">
                              <div class="gmail_quote">
                                <div> </div>
                                <blockquote class="gmail_quote"> it
                                  controls it via stimecmp.<br>
                                  <br>
                                  &gt; +    return hmode(env, csrno);<br>
                                  &gt; +}<br>
                                  &gt; +<br>
                                  &gt; +static RISCVException
                                  read_vstimecmp(CPURISCVState *env, int
                                  csrno,<br>
                                  &gt; +                               
                                      target_ulong *val)<br>
                                  &gt; +{<br>
                                  &gt; +    *val = env-&gt;vstimecmp;<br>
                                  &gt; +<br>
                                  &gt; +    return RISCV_EXCP_NONE;<br>
                                  &gt; +}<br>
                                  &gt; +<br>
                                  &gt; +static RISCVException
                                  read_vstimecmph(CPURISCVState *env,
                                  int csrno,<br>
                                  &gt; +                               
                                      target_ulong *val)<br>
                                  &gt; +{<br>
                                  &gt; +    *val = env-&gt;vstimecmp
                                  &gt;&gt; 32;<br>
                                  &gt; +<br>
                                  &gt; +    return RISCV_EXCP_NONE;<br>
                                  &gt; +}<br>
                                  &gt; +<br>
                                  &gt; +static RISCVException
                                  write_vstimecmp(CPURISCVState *env,
                                  int csrno,<br>
                                  &gt; +                               
                                      target_ulong val)<br>
                                  &gt; +{<br>
                                  &gt; +    RISCVCPU *cpu =
                                  env_archcpu(env);<br>
                                  &gt; +<br>
                                  &gt; +    if (riscv_cpu_mxl(env) ==
                                  MXL_RV32) {<br>
                                  &gt; +        env-&gt;vstimecmp =
                                  deposit64(env-&gt;vstimecmp, 0, 32,
                                  (uint64_t)val);<br>
                                  &gt; +    } else {<br>
                                  &gt; +        env-&gt;vstimecmp = val;<br>
                                  &gt; +    }<br>
                                  &gt; +<br>
                                  &gt; +   
                                  riscv_timer_write_timecmp(cpu,
                                  env-&gt;vstimer, env-&gt;vstimecmp,<br>
                                  &gt; +                             
                                  env-&gt;htimedelta, MIP_VSTIP);<br>
                                  &gt; +<br>
                                  &gt; +    return RISCV_EXCP_NONE;<br>
                                  &gt; +}<br>
                                  &gt; +<br>
                                  &gt; +static RISCVException
                                  write_vstimecmph(CPURISCVState *env,
                                  int csrno,<br>
                                  &gt; +                               
                                      target_ulong val)<br>
                                  &gt; +{<br>
                                  &gt; +    RISCVCPU *cpu =
                                  env_archcpu(env);<br>
                                  &gt; +<br>
                                  &gt; +    env-&gt;vstimecmp =
                                  deposit64(env-&gt;vstimecmp, 32, 32,
                                  (uint64_t)val);<br>
                                  &gt; +   
                                  riscv_timer_write_timecmp(cpu,
                                  env-&gt;vstimer, env-&gt;vstimecmp,<br>
                                  &gt; +                             
                                  env-&gt;htimedelta, MIP_VSTIP);<br>
                                  &gt; +<br>
                                  &gt; +    return RISCV_EXCP_NONE;<br>
                                  &gt; +}<br>
                                  &gt; +<br>
                                  &gt;   static RISCVException
                                  read_stimecmp(CPURISCVState *env, int
                                  csrno,<br>
                                  &gt;                                 
                                       target_ulong *val)<br>
                                  &gt;   {<br>
                                  &gt; -    *val = env-&gt;stimecmp;<br>
                                  &gt; +    if
                                  (riscv_cpu_virt_enabled(env)) {<br>
                                  &gt; +        *val =
                                  env-&gt;vstimecmp;<br>
                                  &gt; +    } else {<br>
                                  &gt; +        *val = env-&gt;stimecmp;<br>
                                  &gt; +    }<br>
                                  &gt; +<br>
                                  &gt;       return RISCV_EXCP_NONE;<br>
                                  &gt;   }<br>
                                  &gt;   <br>
                                  &gt;   static RISCVException
                                  read_stimecmph(CPURISCVState *env, int
                                  csrno,<br>
                                  &gt;                                 
                                       target_ulong *val)<br>
                                  &gt;   {<br>
                                  &gt; -    *val = env-&gt;stimecmp
                                  &gt;&gt; 32;<br>
                                  &gt; +    if
                                  (riscv_cpu_virt_enabled(env)) {<br>
                                  &gt; +        *val = env-&gt;vstimecmp
                                  &gt;&gt; 32;<br>
                                  &gt; +    } else {<br>
                                  &gt; +        *val = env-&gt;stimecmp
                                  &gt;&gt; 32;<br>
                                  &gt; +    }<br>
                                  &gt; +<br>
                                  &gt;       return RISCV_EXCP_NONE;<br>
                                  &gt;   }<br>
                                  &gt;   <br>
                                  &gt; @@ -848,6 +931,10 @@ static
                                  RISCVException
                                  write_stimecmp(CPURISCVState *env, int
                                  csrno,<br>
                                  &gt;   {<br>
                                  &gt;       RISCVCPU *cpu =
                                  env_archcpu(env);<br>
                                  &gt;   <br>
                                  &gt; +    if
                                  (riscv_cpu_virt_enabled(env)) {<br>
                                  &gt; +        return
                                  write_vstimecmp(env, csrno, val);<br>
                                  &gt; +    }<br>
                                  &gt; +<br>
                                  &gt;       if (riscv_cpu_mxl(env) ==
                                  MXL_RV32) {<br>
                                  &gt;           env-&gt;stimecmp =
                                  deposit64(env-&gt;stimecmp, 0, 32,
                                  (uint64_t)val);<br>
                                  &gt;       } else {<br>
                                  &gt; @@ -864,6 +951,10 @@ static
                                  RISCVException
                                  write_stimecmph(CPURISCVState *env,
                                  int csrno,<br>
                                  &gt;   {<br>
                                  &gt;       RISCVCPU *cpu =
                                  env_archcpu(env);<br>
                                  &gt;   <br>
                                  &gt; +    if
                                  (riscv_cpu_virt_enabled(env)) {<br>
                                  &gt; +        return
                                  write_vstimecmph(env, csrno, val);<br>
                                  &gt; +    }<br>
                                  &gt; +<br>
                                  &gt;       env-&gt;stimecmp =
                                  deposit64(env-&gt;stimecmp, 32, 32,
                                  (uint64_t)val);<br>
                                  &gt;     
                                   riscv_timer_write_timecmp(cpu,
                                  env-&gt;stimer, env-&gt;stimecmp, 0,
                                  MIP_STIP);<br>
                                  &gt;   <br>
                                  &gt; @@ -1801,6 +1892,7 @@ static
                                  RISCVException rmw_mip64(CPURISCVState
                                  *env, int csrno,<br>
                                  &gt;       if (csrno != CSR_HVIP) {<br>
                                  &gt;           gin =
                                  get_field(env-&gt;hstatus,
                                  HSTATUS_VGEIN);<br>
                                  &gt;           old_mip |=
                                  (env-&gt;hgeip &amp; ((target_ulong)1
                                  &lt;&lt; gin)) ? MIP_VSEIP : 0;<br>
                                  &gt; +        old_mip |=
                                  env-&gt;vstime_irq ? MIP_VSTIP : 0;<br>
                                  &gt;       }<br>
                                  &gt;   <br>
                                  &gt;       if (ret_val) {<br>
                                  &gt; @@ -3661,6 +3753,12 @@
                                  riscv_csr_operations
                                  csr_ops[CSR_TABLE_SIZE] = {<br>
                                  &gt;                                 
                                             .min_priv_ver =
                                  PRIV_VERSION_1_12_0 },<br>
                                  &gt;       [CSR_STIMECMPH] = {
                                  "stimecmph", sstc, read_stimecmph,
                                  write_stimecmph,<br>
                                  &gt;                                 
                                             .min_priv_ver =
                                  PRIV_VERSION_1_12_0 },<br>
                                  &gt; +    [CSR_VSTIMECMP] = {
                                  "vstimecmp", sstc_hmode,
                                  read_vstimecmp,<br>
                                  &gt; +                               
                                            write_vstimecmp,<br>
                                  <br>
                                  Please align with last line. The same
                                  to other similar lines.<br>
                                  <br>
                                </blockquote>
                                <div><br>
                                </div>
                                <div>Sure. I will fix that.</div>
                                <div> <br>
                                </div>
                                <blockquote class="gmail_quote">
                                  Regards,<br>
                                  <br>
                                  Weiwei Li<br>
                                  <br>
                                  &gt; +                               
                                            .min_priv_ver =
                                  PRIV_VERSION_1_12_0 },<br>
                                  &gt; +    [CSR_VSTIMECMPH] = {
                                  "vstimecmph", sstc_hmode,
                                  read_vstimecmph,<br>
                                  &gt; +                               
                                            write_vstimecmph,<br>
                                  &gt; +                               
                                            .min_priv_ver =
                                  PRIV_VERSION_1_12_0 },<br>
                                  &gt;   <br>
                                  &gt;       /* Supervisor Protection
                                  and Translation */<br>
                                  &gt;       [CSR_SATP]     = { "satp", 
                                     smode, read_satp,     write_satp   
                                   },<br>
                                  &gt; diff --git
                                  a/target/riscv/machine.c
                                  b/target/riscv/machine.c<br>
                                  &gt; index 622fface484e..4ba55705d147
                                  100644<br>
                                  &gt; --- a/target/riscv/machine.c<br>
                                  &gt; +++ b/target/riscv/machine.c<br>
                                  &gt; @@ -92,6 +92,7 @@ static const
                                  VMStateDescription vmstate_hyper = {<br>
                                  &gt;         
                                   VMSTATE_UINTTL(env.hgeie, RISCVCPU),<br>
                                  &gt;         
                                   VMSTATE_UINTTL(env.hgeip, RISCVCPU),<br>
                                  &gt;         
                                   VMSTATE_UINT64(env.htimedelta,
                                  RISCVCPU),<br>
                                  &gt; +       
                                  VMSTATE_UINT64(env.vstimecmp,
                                  RISCVCPU),<br>
                                  &gt;   <br>
                                  &gt;         
                                   VMSTATE_UINTTL(env.hvictl, RISCVCPU),<br>
                                  &gt;         
                                   VMSTATE_UINT8_ARRAY(env.hviprio,
                                  RISCVCPU, 64),<br>
                                  &gt; diff --git
                                  a/target/riscv/time_helper.c
                                  b/target/riscv/time_helper.c<br>
                                  &gt; index f3fb5eac7b7b..8cce667dfd47
                                  100644<br>
                                  &gt; --- a/target/riscv/time_helper.c<br>
                                  &gt; +++ b/target/riscv/time_helper.c<br>
                                  &gt; @@ -22,6 +22,14 @@<br>
                                  &gt;   #include "time_helper.h"<br>
                                  &gt;   #include
                                  "hw/intc/riscv_aclint.h"<br>
                                  &gt;   <br>
                                  &gt; +static void
                                  riscv_vstimer_cb(void *opaque)<br>
                                  &gt; +{<br>
                                  &gt; +    RISCVCPU *cpu = opaque;<br>
                                  &gt; +    CPURISCVState *env =
                                  &amp;cpu-&gt;env;<br>
                                  &gt; +    env-&gt;vstime_irq = 1;<br>
                                  &gt; +    riscv_cpu_update_mip(cpu,
                                  MIP_VSTIP, BOOL_TO_MASK(1));<br>
                                  &gt; +}<br>
                                  &gt; +<br>
                                  &gt;   static void
                                  riscv_stimer_cb(void *opaque)<br>
                                  &gt;   {<br>
                                  &gt;       RISCVCPU *cpu = opaque;<br>
                                  &gt; @@ -47,10 +55,16 @@ void
                                  riscv_timer_write_timecmp(RISCVCPU
                                  *cpu, QEMUTimer *timer,<br>
                                  &gt;            * If we're setting an
                                  stimecmp value in the "past",<br>
                                  &gt;            * immediately raise
                                  the timer interrupt<br>
                                  &gt;            */<br>
                                  &gt; +        if (timer_irq ==
                                  MIP_VSTIP) {<br>
                                  &gt; +            env-&gt;vstime_irq =
                                  1;<br>
                                  &gt; +        }<br>
                                  &gt;         
                                   riscv_cpu_update_mip(cpu, timer_irq,
                                  BOOL_TO_MASK(1));<br>
                                  &gt;           return;<br>
                                  &gt;       }<br>
                                  &gt;   <br>
                                  &gt; +    if (timer_irq == MIP_VSTIP)
                                  {<br>
                                  &gt; +        env-&gt;vstime_irq = 0;<br>
                                  &gt; +    }<br>
                                  &gt;       /* Clear the [V]STIP bit in
                                  mip */<br>
                                  &gt;       riscv_cpu_update_mip(cpu,
                                  timer_irq, BOOL_TO_MASK(0));<br>
                                  &gt;   <br>
                                  &gt; @@ -95,4 +109,6 @@ void
                                  riscv_timer_init(RISCVCPU *cpu)<br>
                                  &gt;       env-&gt;stimer =
                                  timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                  &amp;riscv_stimer_cb, cpu);<br>
                                  &gt;       env-&gt;stimecmp = 0;<br>
                                  &gt;   <br>
                                  &gt; +    env-&gt;vstimer =
                                  timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                  &amp;riscv_vstimer_cb, cpu);<br>
                                  &gt; +    env-&gt;vstimecmp = 0;<br>
                                  &gt;   }<br>
                                  <br>
                                </blockquote>
                              </div>
                            </div>
                          </blockquote>
                        </div>
                      </blockquote>
                    </div>
                  </div>
                </div>
              </blockquote>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------54424C9C2A94FBDA52238D5D--


