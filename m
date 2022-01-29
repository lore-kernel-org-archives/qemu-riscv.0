Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nDd7o-0000rQ-I9
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jan 2022 21:06:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <angell1518@163.com>)
 id 1nDd7l-0000qt-3W; Fri, 28 Jan 2022 21:05:57 -0500
Received: from m12-12.163.com ([220.181.12.12]:13710)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <angell1518@163.com>)
 id 1nDd7c-0004Se-8S; Fri, 28 Jan 2022 21:05:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=TCB06
 sVUfIRWebuSV6MdMFoLQT8X7+mduur1j0cw71k=; b=ByM6FPXbgW8EWdMTpvxRZ
 nnPDJQFZm7bc4sHO8mjJ6kd0ckVY8x+NYZBjkhtl99WLPfwVR24gD0zgx6z9A3wy
 Vsf9krMGosQ7MF++WFjDjj0fAJkSvKMiLCbRyt/KYvLrLWRBruN7mbyn1cenl9Qt
 lfINUYbYbiunt1R3N0BBQg=
Received: from [192.168.0.107] (unknown [180.156.147.178])
 by smtp8 (Coremail) with SMTP id DMCowADHqaxJnfRhK_HHAA--.15174S2;
 Sat, 29 Jan 2022 09:50:02 +0800 (CST)
Subject: Re: [RFC 4/5] target/riscv: Add *envcfg* CSRs support
To: Atish Patra <atishp@atishpatra.org>, Weiwei Li <liweiwei@iscas.ac.cn>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>,
 Atish Patra <atishp@rivosinc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20220120200735.2739543-1-atishp@rivosinc.com>
 <20220120200735.2739543-5-atishp@rivosinc.com>
 <91dbc7a1-f23f-709b-82e8-10e4c96e4482@iscas.ac.cn>
 <CAOnJCULp6LDNcJ6eh04Yz3rpgj-e5_Z-bV6OVGB9gK0maBdiUg@mail.gmail.com>
From: angell1518 <angell1518@163.com>
Message-ID: <2626a869-bf63-c9f3-625c-864a0451f827@163.com>
Date: Sat, 29 Jan 2022 09:50:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCULp6LDNcJ6eh04Yz3rpgj-e5_Z-bV6OVGB9gK0maBdiUg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------978D2F9B6C42AF1DCF40170A"
Content-Language: en-US
X-CM-TRANSID: DMCowADHqaxJnfRhK_HHAA--.15174S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gry7ur4kCrW5WrWkXF1DZFb_yoW3uw48pF
 1UuF98G3yktFyIq3Z3Gry5WF13Aw1xGanxZws7C3yktF45GrWrKFnFgrsxJrW8Wa95Gr1j
 va1qkr13Cr4DZa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziF1v3UUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: pdqjvzjorvimi6rwjhhfrp/1tbiKwqXJFQHbdp7igAAsH
Received-SPF: pass client-ip=220.181.12.12; envelope-from=angell1518@163.com;
 helo=m12-12.163.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 29 Jan 2022 02:05:58 -0000

This is a multi-part message in MIME format.
--------------978D2F9B6C42AF1DCF40170A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/1/29 上午9:28, Atish Patra 写道:
>
>
> On Wed, Jan 26, 2022 at 12:37 AM Weiwei Li <liweiwei@iscas.ac.cn 
> <mailto:liweiwei@iscas.ac.cn>> wrote:
>
>
>     在 2022/1/21 上午4:07, Atish Patra 写道:
>     > The RISC-V privileged specification v1.12 defines few execution
>     > environment configuration CSRs that can be used enable/disable
>     > extensions per privilege levels.
>     >
>     > Add the basic support for these CSRs.
>     >
>     > Signed-off-by: Atish Patra <atishp@rivosinc.com
>     <mailto:atishp@rivosinc.com>>
>     > ---
>     >   target/riscv/cpu.h      |  8 ++++
>     >   target/riscv/cpu_bits.h | 31 +++++++++++++++
>     >   target/riscv/csr.c      | 84
>     +++++++++++++++++++++++++++++++++++++++++
>     >   target/riscv/machine.c  | 26 +++++++++++++
>     >   4 files changed, 149 insertions(+)
>     >
>     > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>     > index 7f87917204c5..b9462300a472 100644
>     > --- a/target/riscv/cpu.h
>     > +++ b/target/riscv/cpu.h
>     > @@ -264,6 +264,14 @@ struct CPURISCVState {
>     >       target_ulong spmbase;
>     >       target_ulong upmmask;
>     >       target_ulong upmbase;
>     > +
>     > +    /* CSRs for execution enviornment configuration */
>     > +
>     > +    target_ulong menvcfg;
>     > +    target_ulong menvcfgh;
>
>     I think we needn't maintain seperate menvcfg and menvcfgh, just use
>     "uint64_t menvcfg" as the way of mstatus.
>
>
> unlike mstatush, menvcfgh/henvcfgh will be accessed directly to do runtime
> predicate for stimecmp/vstimecmp.
>
> We have to do the 32 bit shifting during every check which makes the 
> code hard to read
> at the cost of 2 ulongs.
>
> IMO, having separate variables is much simpler.

Do you mean check STCE/VSTCE bit in menvcfg/henvcfg?

If so, I think use a simple "uint64_t menvcfg/henvcfg" may be better,  
then we can only check the 63 bit of them.

Or we should decide where to get this bit from(mencvfg/henvcfg, or 
mencfgh/henvcfgh) based on the MXLEN/HSXLEN.

Regards,

Weiwei Li

>
>     Similar to  henvcfg and henvcfg.
>
>     > +    target_ulong senvcfg;
>     > +    target_ulong henvcfg;
>     > +    target_ulong henvcfgh;
>     >   #endif
>     >
>     >       float_status fp_status;
>     > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>     > index f6f90b5cbd52..afb237c2313b 100644
>     > --- a/target/riscv/cpu_bits.h
>     > +++ b/target/riscv/cpu_bits.h
>     > @@ -177,6 +177,9 @@
>     >   #define CSR_STVEC           0x105
>     >   #define CSR_SCOUNTEREN      0x106
>     >
>     > +/* Supervisor Configuration CSRs */
>     > +#define CSR_SENVCFG         0x10A
>     > +
>     >   /* Supervisor Trap Handling */
>     >   #define CSR_SSCRATCH        0x140
>     >   #define CSR_SEPC            0x141
>     > @@ -204,6 +207,10 @@
>     >   #define CSR_HTIMEDELTA      0x605
>     >   #define CSR_HTIMEDELTAH     0x615
>     >
>     > +/* Hypervisor Configuration CSRs */
>     > +#define CSR_HENVCFG         0x60A
>     > +#define CSR_HENVCFGH        0x61A
>     > +
>     >   /* Virtual CSRs */
>     >   #define CSR_VSSTATUS        0x200
>     >   #define CSR_VSIE            0x204
>     > @@ -218,6 +225,10 @@
>     >   #define CSR_MTINST          0x34a
>     >   #define CSR_MTVAL2          0x34b
>     >
>     > +/* Machine Configuration CSRs */
>     > +#define CSR_MENVCFG         0x30A
>     > +#define CSR_MENVCFGH        0x31A
>     > +
>     >   /* Enhanced Physical Memory Protection (ePMP) */
>     >   #define CSR_MSECCFG         0x747
>     >   #define CSR_MSECCFGH        0x757
>     > @@ -578,6 +589,26 @@ typedef enum RISCVException {
>     >   #define PM_EXT_CLEAN    0x00000002ULL
>     >   #define PM_EXT_DIRTY    0x00000003ULL
>     >
>     > +/* Execution enviornment configuration bits */
>     > +#define MENVCFG_FIOM                       (1 << 0)
>     > +#define MENVCFG_CBE                        0x30000ULL
>     > +#define MENVCFG_CBCFE                      (1 << 6)
>     > +#define MENVCFG_CBZE                       (1 << 7)
>     > +#define MENVCFG_PBMTE                      (1 << 62)
>     > +#define MENVCFG_STCE                       (1 << 63)
>     > +
>     > +#define SENVCFG_FIOM  MENVCFG_FIOM
>     > +#define SENVCFG_CBE                        MENVCFG_CBE
>     > +#define SENVCFG_CBCFE MENVCFG_CBCFE
>     > +#define SENVCFG_CBZE  MENVCFG_CBZE
>     > +
>     > +#define HENVCFG_FIOM  MENVCFG_FIOM
>     > +#define HENVCFG_CBE                        MENVCFG_CBE
>     > +#define HENVCFG_CBCFE MENVCFG_CBCFE
>     > +#define HENVCFG_CBZE  MENVCFG_CBZE
>     > +#define HENVCFG_PBMTE MENVCFG_PBMTE
>     > +#define HENVCFG_STCE  MENVCFG_STCE
>     > +
>     >   /* Offsets for every pair of control bits per each priv level */
>     >   #define XS_OFFSET    0ULL
>     >   #define U_OFFSET     2ULL
>     > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>     > index e66bf2201857..a4bbae7a1bbd 100644
>     > --- a/target/riscv/csr.c
>     > +++ b/target/riscv/csr.c
>     > @@ -853,6 +853,77 @@ static RISCVException
>     write_mtval(CPURISCVState *env, int csrno,
>     >       return RISCV_EXCP_NONE;
>     >   }
>     >
>     > +/* Execution environment configuration setup */
>     > +static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
>     > +                                 target_ulong *val)
>     > +{
>     > +    *val = env->menvcfg;
>     > +    return RISCV_EXCP_NONE;
>     > +}
>     > +
>     > +static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
>     > +                                  target_ulong val)
>     > +{
>     > +    env->menvcfg = val;
>     > +    return RISCV_EXCP_NONE;
>     > +}
>     > +
>     > +static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
>     > +                                 target_ulong *val)
>     > +{
>     > +    *val = env->menvcfgh;
>     > +    return RISCV_EXCP_NONE;
>     > +}
>     > +
>     > +static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
>     > +                                  target_ulong val)
>     > +{
>     > +    env->menvcfgh = val;
>     > +    return RISCV_EXCP_NONE;
>     > +}
>     > +
>     > +static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
>     > +                                 target_ulong *val)
>     > +{
>     > +    *val = env->senvcfg;
>     > +    return RISCV_EXCP_NONE;
>     > +}
>     > +
>     > +static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
>     > +                                  target_ulong val)
>     > +{
>     > +    env->senvcfg = val;
>     > +    return RISCV_EXCP_NONE;
>     > +}
>     > +
>     > +static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
>     > +                                 target_ulong *val)
>     > +{
>     > +    *val = env->henvcfg;
>     > +    return RISCV_EXCP_NONE;
>     > +}
>     > +
>     > +static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>     > +                                  target_ulong val)
>     > +{
>     > +    env->henvcfg = val;
>     > +    return RISCV_EXCP_NONE;
>     > +}
>     > +
>     > +static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
>     > +                                 target_ulong *val)
>     > +{
>     > +    *val = env->henvcfgh;
>     > +    return RISCV_EXCP_NONE;
>     > +}
>     > +
>     > +static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
>     > +                                  target_ulong val)
>     > +{
>     > +    env->henvcfgh = val;
>     > +    return RISCV_EXCP_NONE;
>     > +}
>     > +
>     >   static RISCVException rmw_mip(CPURISCVState *env, int csrno,
>     >                                 target_ulong *ret_value,
>     >                                 target_ulong new_value,
>     target_ulong write_mask)
>     > @@ -2054,6 +2125,19 @@ riscv_csr_operations
>     csr_ops[CSR_TABLE_SIZE] = {
>     >       [CSR_MTVAL]    = { "mtval",    any,  read_mtval,  
>     write_mtval    },
>     >       [CSR_MIP]      = { "mip",      any,  NULL, NULL, rmw_mip 
>           },
>     >
>     > +    /* Execution environment configuration */
>     > +    [CSR_MENVCFG]  = { "menvcfg",  any,  read_menvcfg, 
>     write_menvcfg, NULL,
>     > +                                            NULL, NULL,
>     PRIV_VERSION_1_12_0},
>     > +    [CSR_MENVCFGH] = { "menvcfgh", any32,  read_menvcfgh,
>     write_menvcfgh, NULL,
>     > +                                            NULL, NULL,
>     PRIV_VERSION_1_12_0},
>     > +    [CSR_SENVCFG]  = { "senvcfg",  smode,  read_senvcfg, 
>     write_senvcfg, NULL,
>     > +                                            NULL, NULL,
>     PRIV_VERSION_1_12_0},
>     > +    [CSR_HENVCFG]  = { "henvcfg",  hmode,  read_henvcfg,
>     write_henvcfg, NULL,
>     > +                                            NULL, NULL,
>     PRIV_VERSION_1_12_0},
>     > +    [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh,
>     write_henvcfgh, NULL,
>     > +                                            NULL, NULL,
>     PRIV_VERSION_1_12_0},
>     > +
>     > +
>     Two new lines here.
>
>
> Fixed it. Thanks.
>
>     >       /* Supervisor Trap Setup */
>     >       [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,   
>     write_sstatus, NULL,
>     >  read_sstatus_i128                 },
>     > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>     > index 13b9ab375b95..59479a999b87 100644
>     > --- a/target/riscv/machine.c
>     > +++ b/target/riscv/machine.c
>     > @@ -185,6 +185,31 @@ static const VMStateDescription
>     vmstate_rv128 = {
>     >       }
>     >   };
>     >
>     > +/* TODO: henvcfg need both hyper_needed & envcfg_needed */
>     > +static bool envcfg_needed(void *opaque)
>     > +{
>     > +    RISCVCPU *cpu = opaque;
>     > +    CPURISCVState *env = &cpu->env;
>     > +
>     > +    return (env->priv_ver >= PRIV_VERSION_1_12_0 ? 1 : 0);
>     > +}
>     > +
>     > +static const VMStateDescription vmstate_envcfg = {
>     > +    .name = "cpu/envcfg",
>     > +    .version_id = 1,
>     > +    .minimum_version_id = 1,
>     > +    .needed = envcfg_needed,
>     > +    .fields = (VMStateField[]) {
>     > +        VMSTATE_UINTTL(env.menvcfg, RISCVCPU),
>     > +        VMSTATE_UINTTL(env.menvcfgh, RISCVCPU),
>     > +        VMSTATE_UINTTL(env.senvcfg, RISCVCPU),
>     > +        VMSTATE_UINTTL(env.henvcfg, RISCVCPU),
>     > +        VMSTATE_UINTTL(env.henvcfgh, RISCVCPU),
>     > +
>     > +        VMSTATE_END_OF_LIST()
>     > +    }
>     > +};
>     > +
>     >   const VMStateDescription vmstate_riscv_cpu = {
>     >       .name = "cpu",
>     >       .version_id = 3,
>     > @@ -240,6 +265,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>     >           &vmstate_vector,
>     >           &vmstate_pointermasking,
>     >           &vmstate_rv128,
>     > +        &vmstate_envcfg,
>     >           NULL
>     >       }
>     >   };
>
>     Regards,
>
>     Weiwei Li
>
>
>
>
> -- 
> Regards,
> Atish

--------------978D2F9B6C42AF1DCF40170A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/1/29 上午9:28, Atish Patra 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAOnJCULp6LDNcJ6eh04Yz3rpgj-e5_Z-bV6OVGB9gK0maBdiUg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Jan 26, 2022 at
            12:37 AM Weiwei Li &lt;<a href="mailto:liweiwei@iscas.ac.cn"
              moz-do-not-send="true">liweiwei@iscas.ac.cn</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><br>
            在 2022/1/21 上午4:07, Atish Patra 写道:<br>
            &gt; The RISC-V privileged specification v1.12 defines few
            execution<br>
            &gt; environment configuration CSRs that can be used
            enable/disable<br>
            &gt; extensions per privilege levels.<br>
            &gt;<br>
            &gt; Add the basic support for these CSRs.<br>
            &gt;<br>
            &gt; Signed-off-by: Atish Patra &lt;<a
              href="mailto:atishp@rivosinc.com" target="_blank"
              moz-do-not-send="true">atishp@rivosinc.com</a>&gt;<br>
            &gt; ---<br>
            &gt;   target/riscv/cpu.h      |  8 ++++<br>
            &gt;   target/riscv/cpu_bits.h | 31 +++++++++++++++<br>
            &gt;   target/riscv/csr.c      | 84
            +++++++++++++++++++++++++++++++++++++++++<br>
            &gt;   target/riscv/machine.c  | 26 +++++++++++++<br>
            &gt;   4 files changed, 149 insertions(+)<br>
            &gt;<br>
            &gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
            &gt; index 7f87917204c5..b9462300a472 100644<br>
            &gt; --- a/target/riscv/cpu.h<br>
            &gt; +++ b/target/riscv/cpu.h<br>
            &gt; @@ -264,6 +264,14 @@ struct CPURISCVState {<br>
            &gt;       target_ulong spmbase;<br>
            &gt;       target_ulong upmmask;<br>
            &gt;       target_ulong upmbase;<br>
            &gt; +<br>
            &gt; +    /* CSRs for execution enviornment configuration */<br>
            &gt; +<br>
            &gt; +    target_ulong menvcfg;<br>
            &gt; +    target_ulong menvcfgh;<br>
            <br>
            I think we needn't maintain seperate menvcfg and menvcfgh,
            just use <br>
            "uint64_t menvcfg" as the way of mstatus.<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>unlike mstatush, menvcfgh/henvcfgh will be accessed
            directly to do runtime</div>
          <div>predicate for stimecmp/vstimecmp.</div>
          <div> <br>
            We have to do the 32 bit shifting during every check which
            makes the code hard to read</div>
          <div>at the cost of 2 ulongs.</div>
          <div><br>
            IMO, having separate variables is much simpler.</div>
        </div>
      </div>
    </blockquote>
    <p>Do you mean check STCE/VSTCE bit in menvcfg/henvcfg? <br>
    </p>
    <p>If so, I think use a simple "uint64_t menvcfg/henvcfg" may be
      better,  then we can only check the 63 bit of them.</p>
    <p>Or we should decide where to get this bit from(mencvfg/henvcfg,
      or mencfgh/henvcfgh) based on the MXLEN/HSXLEN.</p>
    <p>Regards,</p>
    <p>Weiwei Li</p>
    <blockquote type="cite"
cite="mid:CAOnJCULp6LDNcJ6eh04Yz3rpgj-e5_Z-bV6OVGB9gK0maBdiUg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            Similar to  henvcfg and henvcfg.<br>
            <br>
            &gt; +    target_ulong senvcfg;<br>
            &gt; +    target_ulong henvcfg;<br>
            &gt; +    target_ulong henvcfgh;<br>
            &gt;   #endif<br>
            &gt;   <br>
            &gt;       float_status fp_status;<br>
            &gt; diff --git a/target/riscv/cpu_bits.h
            b/target/riscv/cpu_bits.h<br>
            &gt; index f6f90b5cbd52..afb237c2313b 100644<br>
            &gt; --- a/target/riscv/cpu_bits.h<br>
            &gt; +++ b/target/riscv/cpu_bits.h<br>
            &gt; @@ -177,6 +177,9 @@<br>
            &gt;   #define CSR_STVEC           0x105<br>
            &gt;   #define CSR_SCOUNTEREN      0x106<br>
            &gt;   <br>
            &gt; +/* Supervisor Configuration CSRs */<br>
            &gt; +#define CSR_SENVCFG         0x10A<br>
            &gt; +<br>
            &gt;   /* Supervisor Trap Handling */<br>
            &gt;   #define CSR_SSCRATCH        0x140<br>
            &gt;   #define CSR_SEPC            0x141<br>
            &gt; @@ -204,6 +207,10 @@<br>
            &gt;   #define CSR_HTIMEDELTA      0x605<br>
            &gt;   #define CSR_HTIMEDELTAH     0x615<br>
            &gt;   <br>
            &gt; +/* Hypervisor Configuration CSRs */<br>
            &gt; +#define CSR_HENVCFG         0x60A<br>
            &gt; +#define CSR_HENVCFGH        0x61A<br>
            &gt; +<br>
            &gt;   /* Virtual CSRs */<br>
            &gt;   #define CSR_VSSTATUS        0x200<br>
            &gt;   #define CSR_VSIE            0x204<br>
            &gt; @@ -218,6 +225,10 @@<br>
            &gt;   #define CSR_MTINST          0x34a<br>
            &gt;   #define CSR_MTVAL2          0x34b<br>
            &gt;   <br>
            &gt; +/* Machine Configuration CSRs */<br>
            &gt; +#define CSR_MENVCFG         0x30A<br>
            &gt; +#define CSR_MENVCFGH        0x31A<br>
            &gt; +<br>
            &gt;   /* Enhanced Physical Memory Protection (ePMP) */<br>
            &gt;   #define CSR_MSECCFG         0x747<br>
            &gt;   #define CSR_MSECCFGH        0x757<br>
            &gt; @@ -578,6 +589,26 @@ typedef enum RISCVException {<br>
            &gt;   #define PM_EXT_CLEAN    0x00000002ULL<br>
            &gt;   #define PM_EXT_DIRTY    0x00000003ULL<br>
            &gt;   <br>
            &gt; +/* Execution enviornment configuration bits */<br>
            &gt; +#define MENVCFG_FIOM                       (1 &lt;&lt;
            0)<br>
            &gt; +#define MENVCFG_CBE                        0x30000ULL<br>
            &gt; +#define MENVCFG_CBCFE                      (1 &lt;&lt;
            6)<br>
            &gt; +#define MENVCFG_CBZE                       (1 &lt;&lt;
            7)<br>
            &gt; +#define MENVCFG_PBMTE                      (1 &lt;&lt;
            62)<br>
            &gt; +#define MENVCFG_STCE                       (1 &lt;&lt;
            63)<br>
            &gt; +<br>
            &gt; +#define SENVCFG_FIOM                     
             MENVCFG_FIOM<br>
            &gt; +#define SENVCFG_CBE                        MENVCFG_CBE<br>
            &gt; +#define SENVCFG_CBCFE                     
            MENVCFG_CBCFE<br>
            &gt; +#define SENVCFG_CBZE                     
             MENVCFG_CBZE<br>
            &gt; +<br>
            &gt; +#define HENVCFG_FIOM                     
             MENVCFG_FIOM<br>
            &gt; +#define HENVCFG_CBE                        MENVCFG_CBE<br>
            &gt; +#define HENVCFG_CBCFE                     
            MENVCFG_CBCFE<br>
            &gt; +#define HENVCFG_CBZE                     
             MENVCFG_CBZE<br>
            &gt; +#define HENVCFG_PBMTE                     
            MENVCFG_PBMTE<br>
            &gt; +#define HENVCFG_STCE                     
             MENVCFG_STCE<br>
            &gt; +<br>
            &gt;   /* Offsets for every pair of control bits per each
            priv level */<br>
            &gt;   #define XS_OFFSET    0ULL<br>
            &gt;   #define U_OFFSET     2ULL<br>
            &gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
            &gt; index e66bf2201857..a4bbae7a1bbd 100644<br>
            &gt; --- a/target/riscv/csr.c<br>
            &gt; +++ b/target/riscv/csr.c<br>
            &gt; @@ -853,6 +853,77 @@ static RISCVException
            write_mtval(CPURISCVState *env, int csrno,<br>
            &gt;       return RISCV_EXCP_NONE;<br>
            &gt;   }<br>
            &gt;   <br>
            &gt; +/* Execution environment configuration setup */<br>
            &gt; +static RISCVException read_menvcfg(CPURISCVState *env,
            int csrno,<br>
            &gt; +                                 target_ulong *val)<br>
            &gt; +{<br>
            &gt; +    *val = env-&gt;menvcfg;<br>
            &gt; +    return RISCV_EXCP_NONE;<br>
            &gt; +}<br>
            &gt; +<br>
            &gt; +static RISCVException write_menvcfg(CPURISCVState
            *env, int csrno,<br>
            &gt; +                                  target_ulong val)<br>
            &gt; +{<br>
            &gt; +    env-&gt;menvcfg = val;<br>
            &gt; +    return RISCV_EXCP_NONE;<br>
            &gt; +}<br>
            &gt; +<br>
            &gt; +static RISCVException read_menvcfgh(CPURISCVState
            *env, int csrno,<br>
            &gt; +                                 target_ulong *val)<br>
            &gt; +{<br>
            &gt; +    *val = env-&gt;menvcfgh;<br>
            &gt; +    return RISCV_EXCP_NONE;<br>
            &gt; +}<br>
            &gt; +<br>
            &gt; +static RISCVException write_menvcfgh(CPURISCVState
            *env, int csrno,<br>
            &gt; +                                  target_ulong val)<br>
            &gt; +{<br>
            &gt; +    env-&gt;menvcfgh = val;<br>
            &gt; +    return RISCV_EXCP_NONE;<br>
            &gt; +}<br>
            &gt; +<br>
            &gt; +static RISCVException read_senvcfg(CPURISCVState *env,
            int csrno,<br>
            &gt; +                                 target_ulong *val)<br>
            &gt; +{<br>
            &gt; +    *val = env-&gt;senvcfg;<br>
            &gt; +    return RISCV_EXCP_NONE;<br>
            &gt; +}<br>
            &gt; +<br>
            &gt; +static RISCVException write_senvcfg(CPURISCVState
            *env, int csrno,<br>
            &gt; +                                  target_ulong val)<br>
            &gt; +{<br>
            &gt; +    env-&gt;senvcfg = val;<br>
            &gt; +    return RISCV_EXCP_NONE;<br>
            &gt; +}<br>
            &gt; +<br>
            &gt; +static RISCVException read_henvcfg(CPURISCVState *env,
            int csrno,<br>
            &gt; +                                 target_ulong *val)<br>
            &gt; +{<br>
            &gt; +    *val = env-&gt;henvcfg;<br>
            &gt; +    return RISCV_EXCP_NONE;<br>
            &gt; +}<br>
            &gt; +<br>
            &gt; +static RISCVException write_henvcfg(CPURISCVState
            *env, int csrno,<br>
            &gt; +                                  target_ulong val)<br>
            &gt; +{<br>
            &gt; +    env-&gt;henvcfg = val;<br>
            &gt; +    return RISCV_EXCP_NONE;<br>
            &gt; +}<br>
            &gt; +<br>
            &gt; +static RISCVException read_henvcfgh(CPURISCVState
            *env, int csrno,<br>
            &gt; +                                 target_ulong *val)<br>
            &gt; +{<br>
            &gt; +    *val = env-&gt;henvcfgh;<br>
            &gt; +    return RISCV_EXCP_NONE;<br>
            &gt; +}<br>
            &gt; +<br>
            &gt; +static RISCVException write_henvcfgh(CPURISCVState
            *env, int csrno,<br>
            &gt; +                                  target_ulong val)<br>
            &gt; +{<br>
            &gt; +    env-&gt;henvcfgh = val;<br>
            &gt; +    return RISCV_EXCP_NONE;<br>
            &gt; +}<br>
            &gt; +<br>
            &gt;   static RISCVException rmw_mip(CPURISCVState *env, int
            csrno,<br>
            &gt;                                 target_ulong
            *ret_value,<br>
            &gt;                                 target_ulong new_value,
            target_ulong write_mask)<br>
            &gt; @@ -2054,6 +2125,19 @@ riscv_csr_operations
            csr_ops[CSR_TABLE_SIZE] = {<br>
            &gt;       [CSR_MTVAL]    = { "mtval",    any,  read_mtval, 
              write_mtval    },<br>
            &gt;       [CSR_MIP]      = { "mip",      any,  NULL,   
            NULL, rmw_mip        },<br>
            &gt;   <br>
            &gt; +    /* Execution environment configuration */<br>
            &gt; +    [CSR_MENVCFG]  = { "menvcfg",  any,   
             read_menvcfg,  write_menvcfg, NULL,<br>
            &gt; +                                            NULL,
            NULL, PRIV_VERSION_1_12_0},<br>
            &gt; +    [CSR_MENVCFGH] = { "menvcfgh", any32, 
             read_menvcfgh, write_menvcfgh, NULL,<br>
            &gt; +                                            NULL,
            NULL, PRIV_VERSION_1_12_0},<br>
            &gt; +    [CSR_SENVCFG]  = { "senvcfg",  smode, 
             read_senvcfg,  write_senvcfg, NULL,<br>
            &gt; +                                            NULL,
            NULL, PRIV_VERSION_1_12_0},<br>
            &gt; +    [CSR_HENVCFG]  = { "henvcfg",  hmode, 
             read_henvcfg, write_henvcfg, NULL,<br>
            &gt; +                                            NULL,
            NULL, PRIV_VERSION_1_12_0},<br>
            &gt; +    [CSR_HENVCFGH] = { "henvcfgh", hmode32,
            read_henvcfgh, write_henvcfgh, NULL,<br>
            &gt; +                                            NULL,
            NULL, PRIV_VERSION_1_12_0},<br>
            &gt; +<br>
            &gt; +<br>
            Two new lines here.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Fixed it. Thanks.</div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            &gt;       /* Supervisor Trap Setup */<br>
            &gt;       [CSR_SSTATUS]    = { "sstatus",    smode,
            read_sstatus,    write_sstatus, NULL,<br>
            &gt;                                               
             read_sstatus_i128                 },<br>
            &gt; diff --git a/target/riscv/machine.c
            b/target/riscv/machine.c<br>
            &gt; index 13b9ab375b95..59479a999b87 100644<br>
            &gt; --- a/target/riscv/machine.c<br>
            &gt; +++ b/target/riscv/machine.c<br>
            &gt; @@ -185,6 +185,31 @@ static const VMStateDescription
            vmstate_rv128 = {<br>
            &gt;       }<br>
            &gt;   };<br>
            &gt;   <br>
            &gt; +/* TODO: henvcfg need both hyper_needed &amp;
            envcfg_needed */<br>
            &gt; +static bool envcfg_needed(void *opaque)<br>
            &gt; +{<br>
            &gt; +    RISCVCPU *cpu = opaque;<br>
            &gt; +    CPURISCVState *env = &amp;cpu-&gt;env;<br>
            &gt; +<br>
            &gt; +    return (env-&gt;priv_ver &gt;= PRIV_VERSION_1_12_0
            ? 1 : 0);<br>
            &gt; +}<br>
            &gt; +<br>
            &gt; +static const VMStateDescription vmstate_envcfg = {<br>
            &gt; +    .name = "cpu/envcfg",<br>
            &gt; +    .version_id = 1,<br>
            &gt; +    .minimum_version_id = 1,<br>
            &gt; +    .needed = envcfg_needed,<br>
            &gt; +    .fields = (VMStateField[]) {<br>
            &gt; +        VMSTATE_UINTTL(env.menvcfg, RISCVCPU),<br>
            &gt; +        VMSTATE_UINTTL(env.menvcfgh, RISCVCPU),<br>
            &gt; +        VMSTATE_UINTTL(env.senvcfg, RISCVCPU),<br>
            &gt; +        VMSTATE_UINTTL(env.henvcfg, RISCVCPU),<br>
            &gt; +        VMSTATE_UINTTL(env.henvcfgh, RISCVCPU),<br>
            &gt; +<br>
            &gt; +        VMSTATE_END_OF_LIST()<br>
            &gt; +    }<br>
            &gt; +};<br>
            &gt; +<br>
            &gt;   const VMStateDescription vmstate_riscv_cpu = {<br>
            &gt;       .name = "cpu",<br>
            &gt;       .version_id = 3,<br>
            &gt; @@ -240,6 +265,7 @@ const VMStateDescription
            vmstate_riscv_cpu = {<br>
            &gt;           &amp;vmstate_vector,<br>
            &gt;           &amp;vmstate_pointermasking,<br>
            &gt;           &amp;vmstate_rv128,<br>
            &gt; +        &amp;vmstate_envcfg,<br>
            &gt;           NULL<br>
            &gt;       }<br>
            &gt;   };<br>
            <br>
            Regards,<br>
            <br>
            Weiwei Li<br>
            <br>
            <br>
          </blockquote>
        </div>
        <br clear="all">
        <div><br>
        </div>
        -- <br>
        <div dir="ltr" class="gmail_signature">
          <div dir="ltr">Regards,
            <div>Atish</div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------978D2F9B6C42AF1DCF40170A--


