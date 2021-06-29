Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ly3uF-00032k-KW
	for mharc-qemu-riscv@gnu.org; Mon, 28 Jun 2021 22:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ly3uD-00030L-UQ; Mon, 28 Jun 2021 22:55:21 -0400
Received: from out28-147.mail.aliyun.com ([115.124.28.147]:52070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ly3uA-0002me-3Z; Mon, 28 Jun 2021 22:55:21 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07503009|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_enroll_verification|0.0223785-0.00201383-0.975608;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KZZ2wBT_1624935312; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KZZ2wBT_1624935312)
 by smtp.aliyun-inc.com(10.147.40.233);
 Tue, 29 Jun 2021 10:55:12 +0800
Subject: Re: [RFC PATCH 09/11] target/riscv: Update CSR mclicbase in CLIC mode
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-10-zhiwei_liu@c-sky.com>
 <CANzO1D3WGPPUB2XUq3XSO3DYFb8D_bN9rtt_uvq3QaUuE9fAaQ@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <36a8a691-90f2-6d67-8273-643955405429@c-sky.com>
Date: Tue, 29 Jun 2021 10:54:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANzO1D3WGPPUB2XUq3XSO3DYFb8D_bN9rtt_uvq3QaUuE9fAaQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------409BCC876F838B7A7D585CB1"
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.147; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-147.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Tue, 29 Jun 2021 02:55:22 -0000

This is a multi-part message in MIME format.
--------------409BCC876F838B7A7D585CB1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021/6/26 下午11:31, Frank Chang wrote:
> LIU Zhiwei <zhiwei_liu@c-sky.com <mailto:zhiwei_liu@c-sky.com>> 於 
> 2021年4月9日 週五 下午3:52寫道：
>
>     The machine mode mclicbase CSR is an XLEN-bit read-only register
>     providing
>     the base address of CLIC memory mapped registers.
>
>     Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com
>     <mailto:zhiwei_liu@c-sky.com>>
>     ---
>      hw/intc/riscv_clic.c | 1 +
>      target/riscv/cpu.h   | 1 +
>      2 files changed, 2 insertions(+)
>
>     diff --git a/hw/intc/riscv_clic.c b/hw/intc/riscv_clic.c
>     index 8ad534c506..e902dd4062 100644
>     --- a/hw/intc/riscv_clic.c
>     +++ b/hw/intc/riscv_clic.c
>     @@ -715,6 +715,7 @@ static void riscv_clic_realize(DeviceState
>     *dev, Error **errp)
>                                               &cpu->env, 1);
>              qdev_connect_gpio_out(dev, i, irq);
>              cpu->env.clic = clic;
>     +        cpu->env.mclicbase = clic->mclicbase;
>          }
>      }
>
>     diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>     index b5fd796f98..b0b8565649 100644
>     --- a/target/riscv/cpu.h
>     +++ b/target/riscv/cpu.h
>     @@ -162,6 +162,7 @@ struct CPURISCVState {
>          uint32_t miclaim;
>          uint32_t mintstatus; /* clic-spec */
>          target_ulong mintthresh; /* clic-spec */
>     +    target_ulong mclicbase; /* clic-spec */
>
>          target_ulong mie;
>          target_ulong mideleg;
>     -- 
>     2.25.1
>
>
>
> Is it because current spec doesn't specify the number of mclicbase CSR 
> (0x3??)
> so you are not adding it into csr.c?

Yes.

Thanks,
Zhiwei

>
> If so,
>
> Reviewed-by: Frank Chang <frank.chang@sifive.com 
> <mailto:frank.chang@sifive.com>>

--------------409BCC876F838B7A7D585CB1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021/6/26 下午11:31, Frank Chang
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANzO1D3WGPPUB2XUq3XSO3DYFb8D_bN9rtt_uvq3QaUuE9fAaQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">LIU Zhiwei &lt;<a
            href="mailto:zhiwei_liu@c-sky.com" moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt;
          於 2021年4月9日 週五 下午3:52寫道：<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">The machine mode
            mclicbase CSR is an XLEN-bit read-only register providing<br>
            the base address of CLIC memory mapped registers.<br>
            <br>
            Signed-off-by: LIU Zhiwei &lt;<a
              href="mailto:zhiwei_liu@c-sky.com" target="_blank"
              moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt;<br>
            ---<br>
             hw/intc/riscv_clic.c | 1 +<br>
             target/riscv/cpu.h   | 1 +<br>
             2 files changed, 2 insertions(+)<br>
            <br>
            diff --git a/hw/intc/riscv_clic.c b/hw/intc/riscv_clic.c<br>
            index 8ad534c506..e902dd4062 100644<br>
            --- a/hw/intc/riscv_clic.c<br>
            +++ b/hw/intc/riscv_clic.c<br>
            @@ -715,6 +715,7 @@ static void
            riscv_clic_realize(DeviceState *dev, Error **errp)<br>
                                                      &amp;cpu-&gt;env,
            1);<br>
                     qdev_connect_gpio_out(dev, i, irq);<br>
                     cpu-&gt;env.clic = clic;<br>
            +        cpu-&gt;env.mclicbase = clic-&gt;mclicbase;<br>
                 }<br>
             }<br>
            <br>
            diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
            index b5fd796f98..b0b8565649 100644<br>
            --- a/target/riscv/cpu.h<br>
            +++ b/target/riscv/cpu.h<br>
            @@ -162,6 +162,7 @@ struct CPURISCVState {<br>
                 uint32_t miclaim;<br>
                 uint32_t mintstatus; /* clic-spec */<br>
                 target_ulong mintthresh; /* clic-spec */<br>
            +    target_ulong mclicbase; /* clic-spec */<br>
            <br>
                 target_ulong mie;<br>
                 target_ulong mideleg;<br>
            -- <br>
            2.25.1<br>
            <br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>Is it because current spec doesn't specify the number of
            mclicbase CSR (0x3??)</div>
          <div>so you are not adding it into csr.c?</div>
        </div>
      </div>
    </blockquote>
    <p>Yes.</p>
    <p>Thanks,<br>
      Zhiwei<br>
    </p>
    <blockquote type="cite"
cite="mid:CANzO1D3WGPPUB2XUq3XSO3DYFb8D_bN9rtt_uvq3QaUuE9fAaQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>If so,</div>
          <div><br>
          </div>
          <div>Reviewed-by: Frank Chang &lt;<a
              href="mailto:frank.chang@sifive.com"
              moz-do-not-send="true">frank.chang@sifive.com</a>&gt;</div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------409BCC876F838B7A7D585CB1--

