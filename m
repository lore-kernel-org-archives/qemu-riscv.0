Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lytAh-0008DX-Ac
	for mharc-qemu-riscv@gnu.org; Thu, 01 Jul 2021 05:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lytAe-0008CB-RN; Thu, 01 Jul 2021 05:39:44 -0400
Received: from out28-5.mail.aliyun.com ([115.124.28.5]:50551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lytAa-0007LA-Fe; Thu, 01 Jul 2021 05:39:44 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07183115|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_enroll_verification|0.444704-0.000262462-0.555034;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047190; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KahuT9m_1625132372; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KahuT9m_1625132372)
 by smtp.aliyun-inc.com(10.147.41.158);
 Thu, 01 Jul 2021 17:39:32 +0800
Subject: Re: [RFC PATCH 01/11] target/riscv: Add CLIC CSR mintstatus
To: Frank Chang <frank.chang@sifive.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-2-zhiwei_liu@c-sky.com>
 <CAKmqyKMc4TiKgJKM8nUpGR+hWAyUAdjh8bG7chBAdsXq57-V5A@mail.gmail.com>
 <20304ba9-6f87-f7b9-a24d-15d4b3d3f75a@c-sky.com>
 <CANzO1D0zjHowQp46fWmnoPB=ChUuh5-=Q+ajWxpv2yFzONP9gg@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <f1245334-cda8-b587-2d8d-dc2ada61218e@c-sky.com>
Date: Thu, 1 Jul 2021 17:38:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANzO1D0zjHowQp46fWmnoPB=ChUuh5-=Q+ajWxpv2yFzONP9gg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------5BBB9B2C501C837B9C24C1AE"
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.5; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-5.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 01 Jul 2021 09:39:45 -0000

This is a multi-part message in MIME format.
--------------5BBB9B2C501C837B9C24C1AE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021/7/1 下午4:45, Frank Chang wrote:
> LIU Zhiwei <zhiwei_liu@c-sky.com <mailto:zhiwei_liu@c-sky.com>> 於 
> 2021年4月20日 週二 上午8:49寫道：
>
>
>     On 2021/4/20 上午7:23, Alistair Francis wrote:
>     > On Fri, Apr 9, 2021 at 5:52 PM LIU Zhiwei <zhiwei_liu@c-sky.com
>     <mailto:zhiwei_liu@c-sky.com>> wrote:
>     >> CSR mintstatus holds the active interrupt level for each supported
>     >> privilege mode. sintstatus, and user, uintstatus, provide
>     restricted
>     >> views of mintstatus.
>     >>
>     >> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com
>     <mailto:zhiwei_liu@c-sky.com>>
>     >> ---
>     >>   target/riscv/cpu.h      |  2 ++
>     >>   target/riscv/cpu_bits.h | 11 +++++++++++
>     >>   target/riscv/csr.c      | 26 ++++++++++++++++++++++++++
>     >>   3 files changed, 39 insertions(+)
>     >>
>     >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>     >> index 0a33d387ba..1a44ca62c7 100644
>     >> --- a/target/riscv/cpu.h
>     >> +++ b/target/riscv/cpu.h
>     >> @@ -159,6 +159,7 @@ struct CPURISCVState {
>     >>       target_ulong mip;
>     >>
>     >>       uint32_t miclaim;
>     >> +    uint32_t mintstatus; /* clic-spec */
>     >>
>     >>       target_ulong mie;
>     >>       target_ulong mideleg;
>     >> @@ -243,6 +244,7 @@ struct CPURISCVState {
>     >>
>     >>       /* Fields from here on are preserved across CPU reset. */
>     >>       QEMUTimer *timer; /* Internal timer */
>     >> +    void *clic;       /* clic interrupt controller */
>     > This should be the CLIC type.
>
>     OK.
>
>     Actually there are many versions of CLIC in my branch as different
>     devices. But it is better to use CLIC type for the upstream version.
>
>
> Hi Alistair and Zhiwei,
>
> Replacing void *clic with RISCVCLICState *clic may create a circular loop
> because CPURISCVState is also referenced in riscv_clic.h.
>
As there is only one reference to CPURISCVState,  it is not difficult to 
get rid of it.

> However, I would like to ask what is the best approach to add
> the reference of CLIC device in CPURISCVState struct?
>
> There may be different kinds of CLIC devices.
> AFAK, there was another RFC patchset trying to add void *eclic
> for Nuclei processor into CPURISCVState struct:
> https://patchwork.kernel.org/project/qemu-devel/patch/20210507081654.11056-2-wangjunqiang@iscas.ac.cn/ 
> <https://patchwork.kernel.org/project/qemu-devel/patch/20210507081654.11056-2-wangjunqiang@iscas.ac.cn/>
>
> Is it okay to add the device reference directly into CPURISCVState 
> struct like that,
> or we should create some abstraction for these CLIC devices?
> (However, I'm not sure how big the differences are for these CLIC 
> devices...)
>
In my opinion, we should be very cautious to include this kind of code,  
although I suffer from it too.

We should only support the features defined in the specification. If 
some feature are neither defined
by the specification, nor  under the customized range specified by the 
specification,
we should review the code and exclude it from the mainline.

The standard implementation of an old, ratified  as drafted 
specification can be allowed in the mainline.
If a new specification comes,  and the old implementation can carefully 
avoid  the conflicting , it can still in
the mainline.  Otherwise, the old implementation should be obsoleted.

Thanks,
Zhiwei

> Thanks,
> Frank Chang
>
>
>     >
>     >>   };
>     >>
>     >>   OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
>     >> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>     >> index caf4599207..c4ce6ec3d9 100644
>     >> --- a/target/riscv/cpu_bits.h
>     >> +++ b/target/riscv/cpu_bits.h
>     >> @@ -165,6 +165,7 @@
>     >>   #define CSR_MCAUSE          0x342
>     >>   #define CSR_MTVAL           0x343
>     >>   #define CSR_MIP             0x344
>     >> +#define CSR_MINTSTATUS      0x346 /* clic-spec-draft */
>     >>
>     >>   /* Legacy Machine Trap Handling (priv v1.9.1) */
>     >>   #define CSR_MBADADDR        0x343
>     >> @@ -183,6 +184,7 @@
>     >>   #define CSR_SCAUSE          0x142
>     >>   #define CSR_STVAL           0x143
>     >>   #define CSR_SIP             0x144
>     >> +#define CSR_SINTSTATUS      0x146 /* clic-spec-draft */
>     >>
>     >>   /* Legacy Supervisor Trap Handling (priv v1.9.1) */
>     >>   #define CSR_SBADADDR        0x143
>     >> @@ -585,6 +587,15 @@
>     >>   #define SIP_STIP  MIP_STIP
>     >>   #define SIP_SEIP  MIP_SEIP
>     >>
>     >> +/* mintstatus */
>     >> +#define MINTSTATUS_MIL  0xff000000 /* mil[7:0] */
>     >> +#define MINTSTATUS_SIL  0x0000ff00 /* sil[7:0] */
>     >> +#define MINTSTATUS_UIL  0x000000ff /* uil[7:0] */
>     >> +
>     >> +/* sintstatus */
>     >> +#define SINTSTATUS_SIL  0x0000ff00 /* sil[7:0] */
>     >> +#define SINTSTATUS_UIL  0x000000ff /* uil[7:0] */
>     > The bit fields in the comments are out of date.
>
>     I didn't notice it.   Fix it in next version.
>
>     Thanks.
>
>     Zhiwei
>
>     >
>     > Alistair
>     >
>     >> +
>     >>   /* MIE masks */
>     >>   #define MIE_SEIE                           (1 << IRQ_S_EXT)
>     >>   #define MIE_UEIE                           (1 << IRQ_U_EXT)
>     >> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>     >> index d2585395bf..320b18ab60 100644
>     >> --- a/target/riscv/csr.c
>     >> +++ b/target/riscv/csr.c
>     >> @@ -188,6 +188,12 @@ static int pmp(CPURISCVState *env, int csrno)
>     >>   {
>     >>       return -!riscv_feature(env, RISCV_FEATURE_PMP);
>     >>   }
>     >> +
>     >> +static int clic(CPURISCVState *env, int csrno)
>     >> +{
>     >> +    return !!env->clic;
>     >> +}
>     >> +
>     >>   #endif
>     >>
>     >>   /* User Floating-Point CSRs */
>     >> @@ -734,6 +740,12 @@ static int rmw_mip(CPURISCVState *env, int
>     csrno, target_ulong *ret_value,
>     >>       return 0;
>     >>   }
>     >>
>     >> +static int read_mintstatus(CPURISCVState *env, int csrno,
>     target_ulong *val)
>     >> +{
>     >> +    *val = env->mintstatus;
>     >> +    return 0;
>     >> +}
>     >> +
>     >>   /* Supervisor Trap Setup */
>     >>   static int read_sstatus(CPURISCVState *env, int csrno,
>     target_ulong *val)
>     >>   {
>     >> @@ -893,6 +905,13 @@ static int rmw_sip(CPURISCVState *env, int
>     csrno, target_ulong *ret_value,
>     >>       return ret;
>     >>   }
>     >>
>     >> +static int read_sintstatus(CPURISCVState *env, int csrno,
>     target_ulong *val)
>     >> +{
>     >> +    target_ulong mask = SINTSTATUS_SIL | SINTSTATUS_UIL;
>     >> +    *val = env->mintstatus & mask;
>     >> +    return 0;
>     >> +}
>     >> +
>     >>   /* Supervisor Protection and Translation */
>     >>   static int read_satp(CPURISCVState *env, int csrno,
>     target_ulong *val)
>     >>   {
>     >> @@ -1644,5 +1663,12 @@ riscv_csr_operations
>     csr_ops[CSR_TABLE_SIZE] = {
>     >>       [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h", any32, 
>     read_zero },
>     >>       [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h", any32, 
>     read_zero },
>     >>       [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", any32, 
>     read_zero },
>     >> +
>     >> +    /* Machine Mode Core Level Interrupt Controller */
>     >> +    [CSR_MINTSTATUS] = { "mintstatus", clic, read_mintstatus },
>     >> +
>     >> +    /* Supervisor Mode Core Level Interrupt Controller */
>     >> +    [CSR_SINTSTATUS] = { "sintstatus", clic, read_sintstatus },
>     >> +
>     >>   #endif /* !CONFIG_USER_ONLY */
>     >>   };
>     >> --
>     >> 2.25.1
>     >>
>     >>
>

--------------5BBB9B2C501C837B9C24C1AE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021/7/1 下午4:45, Frank Chang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANzO1D0zjHowQp46fWmnoPB=ChUuh5-=Q+ajWxpv2yFzONP9gg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">LIU Zhiwei &lt;<a
            href="mailto:zhiwei_liu@c-sky.com" target="_blank"
            moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt; 於
          2021年4月20日 週二 上午8:49寫道：<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><br>
            On 2021/4/20 上午7:23, Alistair Francis wrote:<br>
            &gt; On Fri, Apr 9, 2021 at 5:52 PM LIU Zhiwei &lt;<a
              href="mailto:zhiwei_liu@c-sky.com" target="_blank"
              moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt; wrote:<br>
            &gt;&gt; CSR mintstatus holds the active interrupt level for
            each supported<br>
            &gt;&gt; privilege mode. sintstatus, and user, uintstatus,
            provide restricted<br>
            &gt;&gt; views of mintstatus.<br>
            &gt;&gt;<br>
            &gt;&gt; Signed-off-by: LIU Zhiwei &lt;<a
              href="mailto:zhiwei_liu@c-sky.com" target="_blank"
              moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt;<br>
            &gt;&gt; ---<br>
            &gt;&gt;   target/riscv/cpu.h      |  2 ++<br>
            &gt;&gt;   target/riscv/cpu_bits.h | 11 +++++++++++<br>
            &gt;&gt;   target/riscv/csr.c      | 26
            ++++++++++++++++++++++++++<br>
            &gt;&gt;   3 files changed, 39 insertions(+)<br>
            &gt;&gt;<br>
            &gt;&gt; diff --git a/target/riscv/cpu.h
            b/target/riscv/cpu.h<br>
            &gt;&gt; index 0a33d387ba..1a44ca62c7 100644<br>
            &gt;&gt; --- a/target/riscv/cpu.h<br>
            &gt;&gt; +++ b/target/riscv/cpu.h<br>
            &gt;&gt; @@ -159,6 +159,7 @@ struct CPURISCVState {<br>
            &gt;&gt;       target_ulong mip;<br>
            &gt;&gt;<br>
            &gt;&gt;       uint32_t miclaim;<br>
            &gt;&gt; +    uint32_t mintstatus; /* clic-spec */<br>
            &gt;&gt;<br>
            &gt;&gt;       target_ulong mie;<br>
            &gt;&gt;       target_ulong mideleg;<br>
            &gt;&gt; @@ -243,6 +244,7 @@ struct CPURISCVState {<br>
            &gt;&gt;<br>
            &gt;&gt;       /* Fields from here on are preserved across
            CPU reset. */<br>
            &gt;&gt;       QEMUTimer *timer; /* Internal timer */<br>
            &gt;&gt; +    void *clic;       /* clic interrupt controller
            */<br>
            &gt; This should be the CLIC type.<br>
            <br>
            OK.<br>
            <br>
            Actually there are many versions of CLIC in my branch as
            different <br>
            devices. But it is better to use CLIC type for the upstream
            version.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Hi Alistair and Zhiwei,</div>
          <div><br>
          </div>
          <div>Replacing void *clic with RISCVCLICState *clic may create
            a circular loop</div>
          <div>because CPURISCVState is also referenced in riscv_clic.h.</div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>As there is only one reference to CPURISCVState,  it is not
      difficult to get rid of it.<br>
    </p>
    <blockquote type="cite"
cite="mid:CANzO1D0zjHowQp46fWmnoPB=ChUuh5-=Q+ajWxpv2yFzONP9gg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>However, I would like to ask what is the best approach to
            add</div>
          <div>the reference of CLIC device in CPURISCVState struct?</div>
          <div><br>
          </div>
          <div>There may be different kinds of CLIC devices.</div>
          <div>AFAK, there was another RFC patchset trying to add void
            *eclic</div>
          <div>for Nuclei processor into CPURISCVState struct:</div>
          <div><a
href="https://patchwork.kernel.org/project/qemu-devel/patch/20210507081654.11056-2-wangjunqiang@iscas.ac.cn/"
              moz-do-not-send="true">https://patchwork.kernel.org/project/qemu-devel/patch/20210507081654.11056-2-wangjunqiang@iscas.ac.cn/</a><br>
          </div>
          <div><br>
          </div>
          <div>Is it okay to add the device reference directly into
            CPURISCVState struct like that,</div>
          <div>or we should create some abstraction for these CLIC
            devices?</div>
          <div>(However, I'm not sure how big the differences are for
            these CLIC devices...)<br>
          </div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>In my opinion, we should be very cautious to include this kind of
      code,  although I suffer from it too.</p>
    <p>We should only support the features defined in the specification.
      If some feature are neither defined<br>
      by the specification, nor  under the customized range specified by
      the specification,<br>
      we should review the code and exclude it from the mainline.</p>
    <p>The standard implementation of an old, ratified  as drafted
      specification can be allowed in the mainline.<br>
      If a new specification comes,  and the old implementation can
      carefully avoid  the conflicting , it can still in<br>
      the mainline.  Otherwise, the old implementation should be
      obsoleted.<br>
    </p>
    <p>Thanks,<br>
      Zhiwei<br>
    </p>
    <blockquote type="cite"
cite="mid:CANzO1D0zjHowQp46fWmnoPB=ChUuh5-=Q+ajWxpv2yFzONP9gg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>Thanks,</div>
          <div>Frank Chang</div>
          <div> <br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            &gt;<br>
            &gt;&gt;   };<br>
            &gt;&gt;<br>
            &gt;&gt;   OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,<br>
            &gt;&gt; diff --git a/target/riscv/cpu_bits.h
            b/target/riscv/cpu_bits.h<br>
            &gt;&gt; index caf4599207..c4ce6ec3d9 100644<br>
            &gt;&gt; --- a/target/riscv/cpu_bits.h<br>
            &gt;&gt; +++ b/target/riscv/cpu_bits.h<br>
            &gt;&gt; @@ -165,6 +165,7 @@<br>
            &gt;&gt;   #define CSR_MCAUSE          0x342<br>
            &gt;&gt;   #define CSR_MTVAL           0x343<br>
            &gt;&gt;   #define CSR_MIP             0x344<br>
            &gt;&gt; +#define CSR_MINTSTATUS      0x346 /*
            clic-spec-draft */<br>
            &gt;&gt;<br>
            &gt;&gt;   /* Legacy Machine Trap Handling (priv v1.9.1) */<br>
            &gt;&gt;   #define CSR_MBADADDR        0x343<br>
            &gt;&gt; @@ -183,6 +184,7 @@<br>
            &gt;&gt;   #define CSR_SCAUSE          0x142<br>
            &gt;&gt;   #define CSR_STVAL           0x143<br>
            &gt;&gt;   #define CSR_SIP             0x144<br>
            &gt;&gt; +#define CSR_SINTSTATUS      0x146 /*
            clic-spec-draft */<br>
            &gt;&gt;<br>
            &gt;&gt;   /* Legacy Supervisor Trap Handling (priv v1.9.1)
            */<br>
            &gt;&gt;   #define CSR_SBADADDR        0x143<br>
            &gt;&gt; @@ -585,6 +587,15 @@<br>
            &gt;&gt;   #define SIP_STIP                         
             MIP_STIP<br>
            &gt;&gt;   #define SIP_SEIP                         
             MIP_SEIP<br>
            &gt;&gt;<br>
            &gt;&gt; +/* mintstatus */<br>
            &gt;&gt; +#define MINTSTATUS_MIL                   
             0xff000000 /* mil[7:0] */<br>
            &gt;&gt; +#define MINTSTATUS_SIL                   
             0x0000ff00 /* sil[7:0] */<br>
            &gt;&gt; +#define MINTSTATUS_UIL                   
             0x000000ff /* uil[7:0] */<br>
            &gt;&gt; +<br>
            &gt;&gt; +/* sintstatus */<br>
            &gt;&gt; +#define SINTSTATUS_SIL                   
             0x0000ff00 /* sil[7:0] */<br>
            &gt;&gt; +#define SINTSTATUS_UIL                   
             0x000000ff /* uil[7:0] */<br>
            &gt; The bit fields in the comments are out of date.<br>
            <br>
            I didn't notice it.   Fix it in next version.<br>
            <br>
            Thanks.<br>
            <br>
            Zhiwei<br>
            <br>
            &gt;<br>
            &gt; Alistair<br>
            &gt;<br>
            &gt;&gt; +<br>
            &gt;&gt;   /* MIE masks */<br>
            &gt;&gt;   #define MIE_SEIE                           (1
            &lt;&lt; IRQ_S_EXT)<br>
            &gt;&gt;   #define MIE_UEIE                           (1
            &lt;&lt; IRQ_U_EXT)<br>
            &gt;&gt; diff --git a/target/riscv/csr.c
            b/target/riscv/csr.c<br>
            &gt;&gt; index d2585395bf..320b18ab60 100644<br>
            &gt;&gt; --- a/target/riscv/csr.c<br>
            &gt;&gt; +++ b/target/riscv/csr.c<br>
            &gt;&gt; @@ -188,6 +188,12 @@ static int pmp(CPURISCVState
            *env, int csrno)<br>
            &gt;&gt;   {<br>
            &gt;&gt;       return -!riscv_feature(env,
            RISCV_FEATURE_PMP);<br>
            &gt;&gt;   }<br>
            &gt;&gt; +<br>
            &gt;&gt; +static int clic(CPURISCVState *env, int csrno)<br>
            &gt;&gt; +{<br>
            &gt;&gt; +    return !!env-&gt;clic;<br>
            &gt;&gt; +}<br>
            &gt;&gt; +<br>
            &gt;&gt;   #endif<br>
            &gt;&gt;<br>
            &gt;&gt;   /* User Floating-Point CSRs */<br>
            &gt;&gt; @@ -734,6 +740,12 @@ static int
            rmw_mip(CPURISCVState *env, int csrno, target_ulong
            *ret_value,<br>
            &gt;&gt;       return 0;<br>
            &gt;&gt;   }<br>
            &gt;&gt;<br>
            &gt;&gt; +static int read_mintstatus(CPURISCVState *env, int
            csrno, target_ulong *val)<br>
            &gt;&gt; +{<br>
            &gt;&gt; +    *val = env-&gt;mintstatus;<br>
            &gt;&gt; +    return 0;<br>
            &gt;&gt; +}<br>
            &gt;&gt; +<br>
            &gt;&gt;   /* Supervisor Trap Setup */<br>
            &gt;&gt;   static int read_sstatus(CPURISCVState *env, int
            csrno, target_ulong *val)<br>
            &gt;&gt;   {<br>
            &gt;&gt; @@ -893,6 +905,13 @@ static int
            rmw_sip(CPURISCVState *env, int csrno, target_ulong
            *ret_value,<br>
            &gt;&gt;       return ret;<br>
            &gt;&gt;   }<br>
            &gt;&gt;<br>
            &gt;&gt; +static int read_sintstatus(CPURISCVState *env, int
            csrno, target_ulong *val)<br>
            &gt;&gt; +{<br>
            &gt;&gt; +    target_ulong mask = SINTSTATUS_SIL |
            SINTSTATUS_UIL;<br>
            &gt;&gt; +    *val = env-&gt;mintstatus &amp; mask;<br>
            &gt;&gt; +    return 0;<br>
            &gt;&gt; +}<br>
            &gt;&gt; +<br>
            &gt;&gt;   /* Supervisor Protection and Translation */<br>
            &gt;&gt;   static int read_satp(CPURISCVState *env, int
            csrno, target_ulong *val)<br>
            &gt;&gt;   {<br>
            &gt;&gt; @@ -1644,5 +1663,12 @@ riscv_csr_operations
            csr_ops[CSR_TABLE_SIZE] = {<br>
            &gt;&gt;       [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h",
            any32,  read_zero },<br>
            &gt;&gt;       [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h",
            any32,  read_zero },<br>
            &gt;&gt;       [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h",
            any32,  read_zero },<br>
            &gt;&gt; +<br>
            &gt;&gt; +    /* Machine Mode Core Level Interrupt
            Controller */<br>
            &gt;&gt; +    [CSR_MINTSTATUS] = { "mintstatus", clic, 
            read_mintstatus },<br>
            &gt;&gt; +<br>
            &gt;&gt; +    /* Supervisor Mode Core Level Interrupt
            Controller */<br>
            &gt;&gt; +    [CSR_SINTSTATUS] = { "sintstatus", clic, 
            read_sintstatus },<br>
            &gt;&gt; +<br>
            &gt;&gt;   #endif /* !CONFIG_USER_ONLY */<br>
            &gt;&gt;   };<br>
            &gt;&gt; --<br>
            &gt;&gt; 2.25.1<br>
            &gt;&gt;<br>
            &gt;&gt;<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------5BBB9B2C501C837B9C24C1AE--

