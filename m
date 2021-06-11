Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrcyW-0007Iw-U5
	for mharc-qemu-riscv@gnu.org; Fri, 11 Jun 2021 04:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrcyS-0007Hb-F5; Fri, 11 Jun 2021 04:57:08 -0400
Received: from out28-197.mail.aliyun.com ([115.124.28.197]:56998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrcyM-0008Fh-Kp; Fri, 11 Jun 2021 04:57:08 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07608247|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0363156-0.00118501-0.962499;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KQvvmVa_1623401813; 
Received: from 172.27.117.59(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQvvmVa_1623401813)
 by smtp.aliyun-inc.com(10.147.41.138);
 Fri, 11 Jun 2021 16:56:54 +0800
Subject: Re: [RFC PATCH 08/11] target/riscv: Update CSR xnxti in CLIC mode
To: Frank Chang <0xc0de0125@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-9-zhiwei_liu@c-sky.com>
 <CANzO1D1jotPbDxJj3ZxJZ7BdT0je64A9DAudEfm8=-m4DQFzoA@mail.gmail.com>
 <f3523b14-c13d-edf8-61e4-d251691130e0@c-sky.com>
 <CANzO1D00w9YBQC=nFaXVaR6ESpOvySEJkoeR5C9cPi=g667s8Q@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <b638f0ad-5b9e-60b3-5d5d-c7ea14172ef8@c-sky.com>
Date: Fri, 11 Jun 2021 16:56:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANzO1D00w9YBQC=nFaXVaR6ESpOvySEJkoeR5C9cPi=g667s8Q@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------04D761E664E387DB3F5F0ED5"
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.197; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-197.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 11 Jun 2021 08:57:10 -0000

This is a multi-part message in MIME format.
--------------04D761E664E387DB3F5F0ED5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/11/21 4:42 PM, Frank Chang wrote:
> LIU Zhiwei <zhiwei_liu@c-sky.com <mailto:zhiwei_liu@c-sky.com>> 於 
> 2021年6月11日 週五 下午4:30寫道：
>
>
>     On 6/11/21 4:15 PM, Frank Chang wrote:
>>     LIU Zhiwei <zhiwei_liu@c-sky.com <mailto:zhiwei_liu@c-sky.com>> 於
>>     2021年4月9日 週五 下午3:52寫道：
>>
>>         The CSR can be used by software to service the next
>>         horizontal interrupt
>>         when it has greater level than the saved interrupt context
>>         (held in xcause`.pil`) and greater level than the interrupt
>>         threshold of
>>         the corresponding privilege mode,
>>
>>         Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com
>>         <mailto:zhiwei_liu@c-sky.com>>
>>         ---
>>          target/riscv/cpu_bits.h |  16 ++++++
>>          target/riscv/csr.c      | 114
>>         ++++++++++++++++++++++++++++++++++++++++
>>          2 files changed, 130 insertions(+)
>>
>>         diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>>         index 7922097776..494e41edc9 100644
>>         --- a/target/riscv/cpu_bits.h
>>         +++ b/target/riscv/cpu_bits.h
>>         @@ -166,6 +166,7 @@
>>          #define CSR_MCAUSE          0x342
>>          #define CSR_MTVAL           0x343
>>          #define CSR_MIP             0x344
>>         +#define CSR_MNXTI           0x345 /* clic-spec-draft */
>>          #define CSR_MINTSTATUS      0x346 /* clic-spec-draft */
>>          #define CSR_MINTTHRESH      0x347 /* clic-spec-draft */
>>
>>         @@ -187,6 +188,7 @@
>>          #define CSR_SCAUSE          0x142
>>          #define CSR_STVAL           0x143
>>          #define CSR_SIP             0x144
>>         +#define CSR_SNXTI           0x145 /* clic-spec-draft */
>>          #define CSR_SINTSTATUS      0x146 /* clic-spec-draft */
>>          #define CSR_SINTTHRESH      0x147 /* clic-spec-draft */
>>
>>         @@ -596,10 +598,24 @@
>>          #define MINTSTATUS_SIL  0x0000ff00 /* sil[7:0] */
>>          #define MINTSTATUS_UIL  0x000000ff /* uil[7:0] */
>>
>>         +/* mcause */
>>         +#define MCAUSE_MINHV  0x40000000 /* minhv */
>>         +#define MCAUSE_MPP  0x30000000 /* mpp[1:0] */
>>         +#define MCAUSE_MPIE 0x08000000 /* mpie */
>>         +#define MCAUSE_MPIL 0x00ff0000 /* mpil[7:0] */
>>         +#define MCAUSE_EXCCODE  0x00000fff /* exccode[11:0] */
>>         +
>>          /* sintstatus */
>>          #define SINTSTATUS_SIL  0x0000ff00 /* sil[7:0] */
>>          #define SINTSTATUS_UIL  0x000000ff /* uil[7:0] */
>>
>>         +/* scause */
>>         +#define SCAUSE_SINHV  0x40000000 /* sinhv */
>>         +#define SCAUSE_SPP  0x10000000 /* spp */
>>         +#define SCAUSE_SPIE 0x08000000 /* spie */
>>         +#define SCAUSE_SPIL 0x00ff0000 /* spil[7:0] */
>>         +#define SCAUSE_EXCCODE  0x00000fff /* exccode[11:0] */
>>         +
>>          /* MIE masks */
>>          #define MIE_SEIE                           (1 << IRQ_S_EXT)
>>          #define MIE_UEIE                           (1 << IRQ_U_EXT)
>>         diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>         index e12222b77f..72cba080bf 100644
>>         --- a/target/riscv/csr.c
>>         +++ b/target/riscv/csr.c
>>         @@ -774,6 +774,80 @@ static int rmw_mip(CPURISCVState *env,
>>         int csrno, target_ulong *ret_value,
>>              return 0;
>>          }
>>
>>         +static bool get_xnxti_status(CPURISCVState *env)
>>         +{
>>         +    CPUState *cs = env_cpu(env);
>>         +    int clic_irq, clic_priv, clic_il, pil;
>>         +
>>         +    if (!env->exccode) { /* No interrupt */
>>         +        return false;
>>         +    }
>>         +    /* The system is not in a CLIC mode */
>>         +    if (!riscv_clic_is_clic_mode(env)) {
>>         +        return false;
>>         +    } else {
>>         + riscv_clic_decode_exccode(env->exccode, &clic_priv, &clic_il,
>>         +                                  &clic_irq);
>>         +
>>         +        if (env->priv == PRV_M) {
>>         +            pil = MAX(get_field(env->mcause, MCAUSE_MPIL),
>>         env->mintthresh);
>>         +        } else if (env->priv == PRV_S) {
>>         +            pil = MAX(get_field(env->scause, SCAUSE_SPIL),
>>         env->sintthresh);
>>         +        } else {
>>         +            qemu_log_mask(LOG_GUEST_ERROR,
>>         +                          "CSR: rmw xnxti with unsupported
>>         mode\n");
>>         +            exit(1);
>>         +        }
>>         +
>>         +        if ((clic_priv != env->priv) || /* No horizontal
>>         interrupt */
>>         +            (clic_il <= pil) || /* No higher level interrupt */
>>         + (riscv_clic_shv_interrupt(env->clic, clic_priv, cs->cpu_index,
>>         +                                      clic_irq))) { /* CLIC
>>         vector mode */
>>         +            return false;
>>         +        } else {
>>         +            return true;
>>         +        }
>>         +    }
>>         +}
>>         +
>>         +static int rmw_mnxti(CPURISCVState *env, int csrno,
>>         target_ulong *ret_value,
>>         +                     target_ulong new_value, target_ulong
>>         write_mask)
>>         +{
>>         +    int clic_priv, clic_il, clic_irq;
>>         +    bool ready;
>>         +    CPUState *cs = env_cpu(env);
>>         +    if (write_mask) {
>>         +        env->mstatus |= new_value & (write_mask & 0b11111);
>>         +    }
>>         +
>>         +    qemu_mutex_lock_iothread();
>>
>>
>>     Hi Zhiwei,
>>
>>     May I ask what's the purpose to request the BQL here with
>>     /qemu_mutex_lock_iothread()/?
>>     Is there any critical data we need to protect in /rmw_mnxti()/?
>>     As far I see, /rmw_mnxti()/ won't call /cpu_interrupt()/ which
>>     need BQL to be held before calling.
>>     Am I missing anything?
>     In my opinion, if you read or write any  MMIO register, you need
>     to hold the BQL. As you can quickly see,
>     it calls riscv_clic_clean_pending. That's why it should hold the BQL.
>
>     Zhiwei
>
>
> Oh, I see.
> The MMIO register reads and writes should also be protected by BQL.
> Thanks for the explanation.

I am glad to know that you are reviewing this patch set. As Sifive 
implements the initial v0.7 CLIC, I think you may need this patch set 
for your SOC.
If you like to, I am happy to see that you connect this patch set to 
your SOC, and resend it again. I can also provide the qtest of this 
patch set if you need.

As you may see, the v6.1 soft freeze will come in July. I am afraid I 
can't upstream a new SOC in so short time.

Zhiwei

>
> Regards,
> Frank Chang
>
>>
>>     Regard,
>>     Frank Chang
>>
>>         +    ready = get_xnxti_status(env);
>>         +    if (ready) {
>>         + riscv_clic_decode_exccode(env->exccode, &clic_priv, &clic_il,
>>         +                                  &clic_irq);
>>         +        if (write_mask) {
>>         +            bool edge = riscv_clic_edge_triggered(env->clic,
>>         clic_priv,
>>         + cs->cpu_index, clic_irq);
>>         +            if (edge) {
>>         + riscv_clic_clean_pending(env->clic, clic_priv,
>>         +  cs->cpu_index, clic_irq);
>>         +            }
>>         +            env->mintstatus = set_field(env->mintstatus,
>>         + MINTSTATUS_MIL, clic_il);
>>         +            env->mcause = set_field(env->mcause,
>>         MCAUSE_EXCCODE, clic_irq);
>>         +        }
>>         +        if (ret_value) {
>>         +            *ret_value = (env->mtvt & ~0x3f) +
>>         sizeof(target_ulong) * clic_irq;
>>         +        }
>>         +    } else {
>>         +        if (ret_value) {
>>         +            *ret_value = 0;
>>         +        }
>>         +    }
>>         +    qemu_mutex_unlock_iothread();
>>         +    return 0;
>>         +}
>>         +
>>          static int read_mintstatus(CPURISCVState *env, int csrno,
>>         target_ulong *val)
>>          {
>>              *val = env->mintstatus;
>>         @@ -982,6 +1056,44 @@ static int rmw_sip(CPURISCVState *env,
>>         int csrno, target_ulong *ret_value,
>>              return ret;
>>          }
>>
>>         +static int rmw_snxti(CPURISCVState *env, int csrno,
>>         target_ulong *ret_value,
>>         +                     target_ulong new_value, target_ulong
>>         write_mask)
>>         +{
>>         +    int clic_priv, clic_il, clic_irq;
>>         +    bool ready;
>>         +    CPUState *cs = env_cpu(env);
>>         +    if (write_mask) {
>>         +        env->mstatus |= new_value & (write_mask & 0b11111);
>>         +    }
>>         +
>>         +    qemu_mutex_lock_iothread();
>>         +    ready = get_xnxti_status(env);
>>         +    if (ready) {
>>         + riscv_clic_decode_exccode(env->exccode, &clic_priv, &clic_il,
>>         +                                  &clic_irq);
>>         +        if (write_mask) {
>>         +            bool edge = riscv_clic_edge_triggered(env->clic,
>>         clic_priv,
>>         + cs->cpu_index, clic_irq);
>>         +            if (edge) {
>>         + riscv_clic_clean_pending(env->clic, clic_priv,
>>         +  cs->cpu_index, clic_irq);
>>         +            }
>>         +            env->mintstatus = set_field(env->mintstatus,
>>         + MINTSTATUS_SIL, clic_il);
>>         +            env->scause = set_field(env->scause,
>>         SCAUSE_EXCCODE, clic_irq);
>>         +        }
>>         +        if (ret_value) {
>>         +            *ret_value = (env->stvt & ~0x3f) +
>>         sizeof(target_ulong) * clic_irq;
>>         +        }
>>         +    } else {
>>         +        if (ret_value) {
>>         +            *ret_value = 0;
>>         +        }
>>         +    }
>>         +    qemu_mutex_unlock_iothread();
>>         +    return 0;
>>         +}
>>         +
>>          static int read_sintstatus(CPURISCVState *env, int csrno,
>>         target_ulong *val)
>>          {
>>              target_ulong mask = SINTSTATUS_SIL | SINTSTATUS_UIL;
>>         @@ -1755,6 +1867,7 @@ riscv_csr_operations
>>         csr_ops[CSR_TABLE_SIZE] = {
>>
>>              /* Machine Mode Core Level Interrupt Controller */
>>              [CSR_MTVT] = { "mtvt", clic,  read_mtvt, write_mtvt      },
>>         +    [CSR_MNXTI] = { "mnxti", clic,  NULL,  NULL, rmw_mnxti   },
>>              [CSR_MINTSTATUS] = { "mintstatus", clic, read_mintstatus },
>>              [CSR_MINTTHRESH] = { "mintthresh", clic, read_mintthresh,
>>                                   write_mintthresh },
>>         @@ -1766,6 +1879,7 @@ riscv_csr_operations
>>         csr_ops[CSR_TABLE_SIZE] = {
>>
>>              /* Supervisor Mode Core Level Interrupt Controller */
>>              [CSR_STVT] = { "stvt", clic,  read_stvt, write_stvt       },
>>         +    [CSR_SNXTI] = { "snxti", clic,  NULL,  NULL, rmw_snxti   },
>>
>>          #endif /* !CONFIG_USER_ONLY */
>>          };
>>         -- 
>>         2.25.1
>>
>>

--------------04D761E664E387DB3F5F0ED5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/11/21 4:42 PM, Frank Chang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANzO1D00w9YBQC=nFaXVaR6ESpOvySEJkoeR5C9cPi=g667s8Q@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">LIU Zhiwei &lt;<a
            href="mailto:zhiwei_liu@c-sky.com" moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt;
          於 2021年6月11日 週五 下午4:30寫道：<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div>
              <p><br>
              </p>
              <div>On 6/11/21 4:15 PM, Frank Chang wrote:<br>
              </div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div dir="ltr">LIU Zhiwei &lt;<a
                      href="mailto:zhiwei_liu@c-sky.com" target="_blank"
                      moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt;
                    於 2021年4月9日 週五 下午3:52寫道：<br>
                  </div>
                  <div class="gmail_quote">
                    <blockquote class="gmail_quote" style="margin:0px
                      0px 0px 0.8ex;border-left:1px solid
                      rgb(204,204,204);padding-left:1ex">The CSR can be
                      used by software to service the next horizontal
                      interrupt<br>
                      when it has greater level than the saved interrupt
                      context<br>
                      (held in xcause`.pil`) and greater level than the
                      interrupt threshold of<br>
                      the corresponding privilege mode,<br>
                      <br>
                      Signed-off-by: LIU Zhiwei &lt;<a
                        href="mailto:zhiwei_liu@c-sky.com"
                        target="_blank" moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt;<br>
                      ---<br>
                       target/riscv/cpu_bits.h |  16 ++++++<br>
                       target/riscv/csr.c      | 114
                      ++++++++++++++++++++++++++++++++++++++++<br>
                       2 files changed, 130 insertions(+)<br>
                      <br>
                      diff --git a/target/riscv/cpu_bits.h
                      b/target/riscv/cpu_bits.h<br>
                      index 7922097776..494e41edc9 100644<br>
                      --- a/target/riscv/cpu_bits.h<br>
                      +++ b/target/riscv/cpu_bits.h<br>
                      @@ -166,6 +166,7 @@<br>
                       #define CSR_MCAUSE          0x342<br>
                       #define CSR_MTVAL           0x343<br>
                       #define CSR_MIP             0x344<br>
                      +#define CSR_MNXTI           0x345 /*
                      clic-spec-draft */<br>
                       #define CSR_MINTSTATUS      0x346 /*
                      clic-spec-draft */<br>
                       #define CSR_MINTTHRESH      0x347 /*
                      clic-spec-draft */<br>
                      <br>
                      @@ -187,6 +188,7 @@<br>
                       #define CSR_SCAUSE          0x142<br>
                       #define CSR_STVAL           0x143<br>
                       #define CSR_SIP             0x144<br>
                      +#define CSR_SNXTI           0x145 /*
                      clic-spec-draft */<br>
                       #define CSR_SINTSTATUS      0x146 /*
                      clic-spec-draft */<br>
                       #define CSR_SINTTHRESH      0x147 /*
                      clic-spec-draft */<br>
                      <br>
                      @@ -596,10 +598,24 @@<br>
                       #define MINTSTATUS_SIL                   
                       0x0000ff00 /* sil[7:0] */<br>
                       #define MINTSTATUS_UIL                   
                       0x000000ff /* uil[7:0] */<br>
                      <br>
                      +/* mcause */<br>
                      +#define MCAUSE_MINHV                     
                       0x40000000 /* minhv */<br>
                      +#define MCAUSE_MPP                       
                       0x30000000 /* mpp[1:0] */<br>
                      +#define MCAUSE_MPIE                       
                      0x08000000 /* mpie */<br>
                      +#define MCAUSE_MPIL                       
                      0x00ff0000 /* mpil[7:0] */<br>
                      +#define MCAUSE_EXCCODE                   
                       0x00000fff /* exccode[11:0] */<br>
                      +<br>
                       /* sintstatus */<br>
                       #define SINTSTATUS_SIL                   
                       0x0000ff00 /* sil[7:0] */<br>
                       #define SINTSTATUS_UIL                   
                       0x000000ff /* uil[7:0] */<br>
                      <br>
                      +/* scause */<br>
                      +#define SCAUSE_SINHV                     
                       0x40000000 /* sinhv */<br>
                      +#define SCAUSE_SPP                       
                       0x10000000 /* spp */<br>
                      +#define SCAUSE_SPIE                       
                      0x08000000 /* spie */<br>
                      +#define SCAUSE_SPIL                       
                      0x00ff0000 /* spil[7:0] */<br>
                      +#define SCAUSE_EXCCODE                   
                       0x00000fff /* exccode[11:0] */<br>
                      +<br>
                       /* MIE masks */<br>
                       #define MIE_SEIE                           (1
                      &lt;&lt; IRQ_S_EXT)<br>
                       #define MIE_UEIE                           (1
                      &lt;&lt; IRQ_U_EXT)<br>
                      diff --git a/target/riscv/csr.c
                      b/target/riscv/csr.c<br>
                      index e12222b77f..72cba080bf 100644<br>
                      --- a/target/riscv/csr.c<br>
                      +++ b/target/riscv/csr.c<br>
                      @@ -774,6 +774,80 @@ static int
                      rmw_mip(CPURISCVState *env, int csrno,
                      target_ulong *ret_value,<br>
                           return 0;<br>
                       }<br>
                      <br>
                      +static bool get_xnxti_status(CPURISCVState *env)<br>
                      +{<br>
                      +    CPUState *cs = env_cpu(env);<br>
                      +    int clic_irq, clic_priv, clic_il, pil;<br>
                      +<br>
                      +    if (!env-&gt;exccode) { /* No interrupt */<br>
                      +        return false;<br>
                      +    }<br>
                      +    /* The system is not in a CLIC mode */<br>
                      +    if (!riscv_clic_is_clic_mode(env)) {<br>
                      +        return false;<br>
                      +    } else {<br>
                      +       
                      riscv_clic_decode_exccode(env-&gt;exccode,
                      &amp;clic_priv, &amp;clic_il,<br>
                      +                                  &amp;clic_irq);<br>
                      +<br>
                      +        if (env-&gt;priv == PRV_M) {<br>
                      +            pil = MAX(get_field(env-&gt;mcause,
                      MCAUSE_MPIL), env-&gt;mintthresh);<br>
                      +        } else if (env-&gt;priv == PRV_S) {<br>
                      +            pil = MAX(get_field(env-&gt;scause,
                      SCAUSE_SPIL), env-&gt;sintthresh);<br>
                      +        } else {<br>
                      +            qemu_log_mask(LOG_GUEST_ERROR,<br>
                      +                          "CSR: rmw xnxti with
                      unsupported mode\n");<br>
                      +            exit(1);<br>
                      +        }<br>
                      +<br>
                      +        if ((clic_priv != env-&gt;priv) || /* No
                      horizontal interrupt */<br>
                      +            (clic_il &lt;= pil) || /* No higher
                      level interrupt */<br>
                      +           
                      (riscv_clic_shv_interrupt(env-&gt;clic, clic_priv,
                      cs-&gt;cpu_index,<br>
                      +                                      clic_irq)))
                      { /* CLIC vector mode */<br>
                      +            return false;<br>
                      +        } else {<br>
                      +            return true;<br>
                      +        }<br>
                      +    }<br>
                      +}<br>
                      +<br>
                      +static int rmw_mnxti(CPURISCVState *env, int
                      csrno, target_ulong *ret_value,<br>
                      +                     target_ulong new_value,
                      target_ulong write_mask)<br>
                      +{<br>
                      +    int clic_priv, clic_il, clic_irq;<br>
                      +    bool ready;<br>
                      +    CPUState *cs = env_cpu(env);<br>
                      +    if (write_mask) {<br>
                      +        env-&gt;mstatus |= new_value &amp;
                      (write_mask &amp; 0b11111);<br>
                      +    }<br>
                      +<br>
                      +    qemu_mutex_lock_iothread();<br>
                    </blockquote>
                    <div><br>
                    </div>
                    <div>Hi Zhiwei,</div>
                    <div><br>
                    </div>
                    <div>May I ask what's the purpose to request the BQL
                      here with <i>qemu_mutex_lock_iothread()</i>?</div>
                    <div>Is there any critical data we need to protect
                      in <i>rmw_mnxti()</i>?</div>
                    <div>As far I see, <i>rmw_mnxti()</i> won't call <i>cpu_interrupt()</i>
                      which need BQL to be held before calling.</div>
                    <div>Am I missing anything?</div>
                  </div>
                </div>
              </blockquote>
              <div dir="ltr">
                <div class="gmail_quote">
                  <div>In my opinion, if you read or write any  MMIO
                    register, you need to hold the BQL. As you can
                    quickly see,</div>
                  <div>it calls riscv_clic_clean_pending. That's why it
                    should hold the BQL.</div>
                  <div><br>
                  </div>
                  <div>Zhiwei<br>
                  </div>
                </div>
              </div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>Oh, I see.</div>
          <div>The MMIO register reads and writes should also be
            protected by BQL.</div>
          <div>Thanks for the explanation.</div>
        </div>
      </div>
    </blockquote>
    <p>I am glad to know that you are reviewing this patch set. As
      Sifive implements the initial v0.7 CLIC, I think you may need this
      patch set for your SOC.<br>
      If you like to, I am happy to see that you connect this patch set
      to your SOC, and resend it again. I can also provide the qtest of
      this patch set if you need.</p>
    <p>As you may see, the v6.1 soft freeze will come in July. I am
      afraid I can't upstream a new SOC in so short time. <br>
    </p>
    <p>Zhiwei<br>
    </p>
    <blockquote type="cite"
cite="mid:CANzO1D00w9YBQC=nFaXVaR6ESpOvySEJkoeR5C9cPi=g667s8Q@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>Regards,</div>
          <div>Frank Chang</div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div>
              <div dir="ltr">
                <div class="gmail_quote">
                  <div> </div>
                </div>
              </div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote">
                    <div><br>
                    </div>
                    <div>Regard,</div>
                    <div>Frank Chang</div>
                    <div> </div>
                    <blockquote class="gmail_quote" style="margin:0px
                      0px 0px 0.8ex;border-left:1px solid
                      rgb(204,204,204);padding-left:1ex"> +    ready =
                      get_xnxti_status(env);<br>
                      +    if (ready) {<br>
                      +       
                      riscv_clic_decode_exccode(env-&gt;exccode,
                      &amp;clic_priv, &amp;clic_il,<br>
                      +                                  &amp;clic_irq);<br>
                      +        if (write_mask) {<br>
                      +            bool edge =
                      riscv_clic_edge_triggered(env-&gt;clic, clic_priv,<br>
                      +                                                 
                      cs-&gt;cpu_index, clic_irq);<br>
                      +            if (edge) {<br>
                      +               
                      riscv_clic_clean_pending(env-&gt;clic, clic_priv,<br>
                      +                                       
                       cs-&gt;cpu_index, clic_irq);<br>
                      +            }<br>
                      +            env-&gt;mintstatus =
                      set_field(env-&gt;mintstatus,<br>
                      +                                       
                      MINTSTATUS_MIL, clic_il);<br>
                      +            env-&gt;mcause =
                      set_field(env-&gt;mcause, MCAUSE_EXCCODE,
                      clic_irq);<br>
                      +        }<br>
                      +        if (ret_value) {<br>
                      +            *ret_value = (env-&gt;mtvt &amp;
                      ~0x3f) + sizeof(target_ulong) * clic_irq;<br>
                      +        }<br>
                      +    } else {<br>
                      +        if (ret_value) {<br>
                      +            *ret_value = 0;<br>
                      +        }<br>
                      +    }<br>
                      +    qemu_mutex_unlock_iothread();<br>
                      +    return 0;<br>
                      +}<br>
                      +<br>
                       static int read_mintstatus(CPURISCVState *env,
                      int csrno, target_ulong *val)<br>
                       {<br>
                           *val = env-&gt;mintstatus;<br>
                      @@ -982,6 +1056,44 @@ static int
                      rmw_sip(CPURISCVState *env, int csrno,
                      target_ulong *ret_value,<br>
                           return ret;<br>
                       }<br>
                      <br>
                      +static int rmw_snxti(CPURISCVState *env, int
                      csrno, target_ulong *ret_value,<br>
                      +                     target_ulong new_value,
                      target_ulong write_mask)<br>
                      +{<br>
                      +    int clic_priv, clic_il, clic_irq;<br>
                      +    bool ready;<br>
                      +    CPUState *cs = env_cpu(env);<br>
                      +    if (write_mask) {<br>
                      +        env-&gt;mstatus |= new_value &amp;
                      (write_mask &amp; 0b11111);<br>
                      +    }<br>
                      +<br>
                      +    qemu_mutex_lock_iothread();<br>
                      +    ready = get_xnxti_status(env);<br>
                      +    if (ready) {<br>
                      +       
                      riscv_clic_decode_exccode(env-&gt;exccode,
                      &amp;clic_priv, &amp;clic_il,<br>
                      +                                  &amp;clic_irq);<br>
                      +        if (write_mask) {<br>
                      +            bool edge =
                      riscv_clic_edge_triggered(env-&gt;clic, clic_priv,<br>
                      +                                                 
                      cs-&gt;cpu_index, clic_irq);<br>
                      +            if (edge) {<br>
                      +               
                      riscv_clic_clean_pending(env-&gt;clic, clic_priv,<br>
                      +                                       
                       cs-&gt;cpu_index, clic_irq);<br>
                      +            }<br>
                      +            env-&gt;mintstatus =
                      set_field(env-&gt;mintstatus,<br>
                      +                                       
                      MINTSTATUS_SIL, clic_il);<br>
                      +            env-&gt;scause =
                      set_field(env-&gt;scause, SCAUSE_EXCCODE,
                      clic_irq);<br>
                      +        }<br>
                      +        if (ret_value) {<br>
                      +            *ret_value = (env-&gt;stvt &amp;
                      ~0x3f) + sizeof(target_ulong) * clic_irq;<br>
                      +        }<br>
                      +    } else {<br>
                      +        if (ret_value) {<br>
                      +            *ret_value = 0;<br>
                      +        }<br>
                      +    }<br>
                      +    qemu_mutex_unlock_iothread();<br>
                      +    return 0;<br>
                      +}<br>
                      +<br>
                       static int read_sintstatus(CPURISCVState *env,
                      int csrno, target_ulong *val)<br>
                       {<br>
                           target_ulong mask = SINTSTATUS_SIL |
                      SINTSTATUS_UIL;<br>
                      @@ -1755,6 +1867,7 @@ riscv_csr_operations
                      csr_ops[CSR_TABLE_SIZE] = {<br>
                      <br>
                           /* Machine Mode Core Level Interrupt
                      Controller */<br>
                           [CSR_MTVT] = { "mtvt", clic,  read_mtvt, 
                      write_mtvt      },<br>
                      +    [CSR_MNXTI] = { "mnxti", clic,  NULL,  NULL, 
                      rmw_mnxti   },<br>
                           [CSR_MINTSTATUS] = { "mintstatus", clic, 
                      read_mintstatus },<br>
                           [CSR_MINTTHRESH] = { "mintthresh", clic, 
                      read_mintthresh,<br>
                                                write_mintthresh },<br>
                      @@ -1766,6 +1879,7 @@ riscv_csr_operations
                      csr_ops[CSR_TABLE_SIZE] = {<br>
                      <br>
                           /* Supervisor Mode Core Level Interrupt
                      Controller */<br>
                           [CSR_STVT] = { "stvt", clic,  read_stvt,
                      write_stvt       },<br>
                      +    [CSR_SNXTI] = { "snxti", clic,  NULL,  NULL, 
                      rmw_snxti   },<br>
                      <br>
                       #endif /* !CONFIG_USER_ONLY */<br>
                       };<br>
                      -- <br>
                      2.25.1<br>
                      <br>
                      <br>
                    </blockquote>
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

--------------04D761E664E387DB3F5F0ED5--

