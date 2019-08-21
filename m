Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0HSn-00078W-3E
	for mharc-qemu-riscv@gnu.org; Tue, 20 Aug 2019 23:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46311)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1i0HSj-00073G-Np
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2019 23:39:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1i0HSh-0000F0-CP
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2019 23:39:05 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:43702)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1i0HSd-000099-Cm; Tue, 20 Aug 2019 23:38:59 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06875435|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.0852348-0.00798114-0.906784; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03302; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=8; RT=8; SR=0;
 TI=SMTPD_---.FFdpZ73_1566358728; 
Received: from 172.16.28.187(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.FFdpZ73_1566358728)
 by smtp.aliyun-inc.com(10.147.40.233);
 Wed, 21 Aug 2019 11:38:52 +0800
To: Chih-Min Chao <chihmin.chao@sifive.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <0141541d-43ff-98d8-e9d4-4a2fdcfdcf36@c-sky.com>
 <CAKmqyKPr0V6acB2-Y+N1-aoj-5LSofwi=Jz=u6KFJN1fPUWjzA@mail.gmail.com>
 <2b741fb0-0f12-0f07-a516-9cc23abc0b6e@c-sky.com>
 <CAEiOBXU1SbdgJdsn_Cvny4=7NTxE+XQPrQQn6NevBxwB8Wox5w@mail.gmail.com>
From: liuzhiwei <zhiwei_liu@c-sky.com>
Message-ID: <8e288bee-75ee-5bd6-e085-d1679d1d1a1b@c-sky.com>
Date: Wed, 21 Aug 2019 11:33:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAEiOBXU1SbdgJdsn_Cvny4=7NTxE+XQPrQQn6NevBxwB8Wox5w@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------607755F6E004FB3866553E75"
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 121.197.200.217
Subject: Re: [Qemu-riscv] [Qemu-devel] RISCV: when will the CLIC be ready?
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
X-List-Received-Date: Wed, 21 Aug 2019 03:39:07 -0000

This is a multi-part message in MIME format.
--------------607755F6E004FB3866553E75
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2019/8/20 上午12:38, Chih-Min Chao wrote:
>
>
> On Mon, Aug 19, 2019 at 9:47 PM liuzhiwei <zhiwei_liu@c-sky.com 
> <mailto:zhiwei_liu@c-sky.com>> wrote:
>
>
>     On 2019/8/17 上午1:29, Alistair Francis wrote:
>     > On Thu, Aug 15, 2019 at 8:39 PM liuzhiwei<zhiwei_liu@c-sky.com
>     <mailto:zhiwei_liu@c-sky.com>> wrote:
>     >> Hi, Palmer
>     >>
>     >> When Michael Clark still was the maintainer of RISCV QEMU, he
>     wrote in the mail list, "the CLIC interrupt controller is under
>     testing,
>     >> and will be included in QEMU 3.1 or 3.2". It is pity that the
>     CLIC is not in
>     >> included even in QEMU 4.1.0.
>     > I see that there is a CLIC branch available here:
>     > https://github.com/riscv/riscv-qemu/pull/157
>     >
>     > It looks like all of the work is in a single commit
>     >
>     (https://github.com/riscv/riscv-qemu/pull/157/commits/206d9ac339feb9ef2c325402a00f0f45f453d019)
>     > and that most of the other commits in the PR have already made
>     it into
>     > master.
>     >
>     > Although the CLIC commit is very large it doesn't seem impossible to
>     > manually pull out the CLIC bits and apply it onto master.
>     >
>     > Do you know the state of the CLIC model? If it's working it
>     shouldn't
>     > be too hard to rebase the work and get the code into mainline.
>     >
>     > Alistair
>     >
>     Hi,  Alistair
>
>     In my opinion, the CLIC code almost works.
>
>     Last year when my workmate ported an RTOS, I once read the CLIC
>     specification and used the CLIC model code. It worked through  all
>     the tests after fixed two bugs. I also had sent the patch to
>     Michael, but without response(maybe a wrong email address).
>
>     diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>     index 7bf6cbc..95d80ab 100644
>     --- a/target/riscv/cpu_helper.c
>     +++ b/target/riscv/cpu_helper.c
>     @@ -505,6 +505,9 @@ static target_ulong
>     riscv_intr_pc(CPURISCVState *env,
>           if (!(async || clic)) {
>               return tvec & ~0b11;
>           }
>     +    if (clic) {
>     +        cause &= 0x3ff;
>     +    }
>
>           /* bits [1:0] encode mode; 0 = direct, 1 = vectored, 2 >=
>     reserved */
>           switch (mode1) {
>     @@ -645,6 +648,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>               riscv_cpu_set_mode(env, PRV_M);
>           }
>
>     +    if (clic) {
>     +        env->exccode = 0;
>     +    }
>           /* NOTE: it is not necessary to yield load reservations
>     here. It is only
>              necessary for an SC from "another hart" to cause a load
>     reservation
>              to be yielded. Refer to the memory consistency model
>     section of the
>
>     After that, the specification has updated and the code may
>     changed. I didn't pull new code again.
>
>     If the CLIC model may merged into the mainline, and no body
>     maintain the code, I'd like to work on it, fixing the bugs and
>     updating the code according to latest specification.
>
>     Best Regards,
>     Zhiwei
>
>     >> As we have cpus using CLIC, I have to use the out of tree qemu
>     code in SIFIVE
>     >> a long time. Could you tell me when it will be upstreamed?
>     >>
>     >> Best Regards
>     >> Zhiwei
>     >>
>
>
> Hi Zhiwei,
>
> I think what Alistair point out is the latest clic version (or 
> https://github.com/riscv/riscv-qemu/tree/riscv-qemu-3.1). The two 
> versions, on pull request and 3.1 branch, should be similar.
> As far as I know, there is no concrete plan on CLIC patch in short term.
> It is good to know that the clic patch has been run with real RTOS.
> It is also great if you could update the implementation to latest spec 
> and send the patch again.
>
> chihmin

Hi chihmin,

Thanks for your reminding and approval. I will pull the latest clic 
version code and send the patch about two or three weeks later.

The RTOS is Rhino,  which is the kernel of 
AliOS-Things(https://github.com/alibaba/AliOS-Things).

It is also the kernel of YOC(https://cop.c-sky.com).

Best Regards
Zhiwei


--------------607755F6E004FB3866553E75
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2019/8/20 上午12:38, Chih-Min Chao
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEiOBXU1SbdgJdsn_Cvny4=7NTxE+XQPrQQn6NevBxwB8Wox5w@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Mon, Aug 19, 2019 at 9:47
            PM liuzhiwei &lt;<a href="mailto:zhiwei_liu@c-sky.com"
              target="_blank" moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><br>
            On 2019/8/17 上午1:29, Alistair Francis wrote:<br>
            &gt; On Thu, Aug 15, 2019 at 8:39 PM liuzhiwei&lt;<a
              href="mailto:zhiwei_liu@c-sky.com" target="_blank"
              moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt; 
            wrote:<br>
            &gt;&gt; Hi, Palmer<br>
            &gt;&gt;<br>
            &gt;&gt; When Michael Clark still was the maintainer of
            RISCV QEMU, he wrote in the mail list, "the CLIC interrupt
            controller is under testing,<br>
            &gt;&gt; and will be included in QEMU 3.1 or 3.2". It is
            pity that the CLIC is not in<br>
            &gt;&gt; included even in QEMU 4.1.0.<br>
            &gt; I see that there is a CLIC branch available here:<br>
            &gt; <a href="https://github.com/riscv/riscv-qemu/pull/157"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/riscv/riscv-qemu/pull/157</a><br>
            &gt;<br>
            &gt; It looks like all of the work is in a single commit<br>
            &gt; (<a
href="https://github.com/riscv/riscv-qemu/pull/157/commits/206d9ac339feb9ef2c325402a00f0f45f453d019"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/riscv/riscv-qemu/pull/157/commits/206d9ac339feb9ef2c325402a00f0f45f453d019</a>)<br>
            &gt; and that most of the other commits in the PR have
            already made it into<br>
            &gt; master.<br>
            &gt;<br>
            &gt; Although the CLIC commit is very large it doesn't seem
            impossible to<br>
            &gt; manually pull out the CLIC bits and apply it onto
            master.<br>
            &gt;<br>
            &gt; Do you know the state of the CLIC model? If it's
            working it shouldn't<br>
            &gt; be too hard to rebase the work and get the code into
            mainline.<br>
            &gt;<br>
            &gt; Alistair<br>
            &gt;<br>
            Hi,  Alistair<br>
            <br>
            In my opinion, the CLIC code almost works.<br>
            <br>
            Last year when my workmate ported an RTOS, I once read the
            CLIC specification and used the CLIC model code. It worked
            through  all the tests after fixed two bugs. I also had sent
            the patch to Michael, but without response(maybe a wrong
            email address).<br>
            <br>
            diff --git a/target/riscv/cpu_helper.c
            b/target/riscv/cpu_helper.c<br>
            index 7bf6cbc..95d80ab 100644<br>
            --- a/target/riscv/cpu_helper.c<br>
            +++ b/target/riscv/cpu_helper.c<br>
            @@ -505,6 +505,9 @@ static target_ulong
            riscv_intr_pc(CPURISCVState *env,<br>
                  if (!(async || clic)) {<br>
                      return tvec &amp; ~0b11;<br>
                  }<br>
            +    if (clic) {<br>
            +        cause &amp;= 0x3ff;<br>
            +    }<br>
            <br>
                  /* bits [1:0] encode mode; 0 = direct, 1 = vectored, 2
            &gt;= reserved */<br>
                  switch (mode1) {<br>
            @@ -645,6 +648,9 @@ void riscv_cpu_do_interrupt(CPUState
            *cs)<br>
                      riscv_cpu_set_mode(env, PRV_M);<br>
                  }<br>
            <br>
            +    if (clic) {<br>
            +        env-&gt;exccode = 0;<br>
            +    }<br>
                  /* NOTE: it is not necessary to yield load
            reservations here. It is only<br>
                     necessary for an SC from "another hart" to cause a
            load reservation<br>
                     to be yielded. Refer to the memory consistency
            model section of the<br>
            <br>
            After that, the specification has updated and the code may
            changed. I didn't pull new code again.<br>
            <br>
            If the CLIC model may merged into the mainline, and no body
            maintain the code, I'd like to work on it, fixing the bugs
            and updating the code according to latest specification.<br>
            <br>
            Best Regards,<br>
            Zhiwei<br>
            <br>
            &gt;&gt; As we have cpus using CLIC, I have to use the out
            of tree qemu code in SIFIVE<br>
            &gt;&gt; a long time. Could you tell me when it will be
            upstreamed?<br>
            &gt;&gt;<br>
            &gt;&gt; Best Regards<br>
            &gt;&gt; Zhiwei<br>
            &gt;&gt;<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>Hi Zhiwei,</div>
          <div><br>
          </div>
          <div>I think what Alistair point out is the latest clic
            version (or <a
              href="https://github.com/riscv/riscv-qemu/tree/riscv-qemu-3.1"
              target="_blank" moz-do-not-send="true">https://github.com/riscv/riscv-qemu/tree/riscv-qemu-3.1</a>). 
            The two versions, on pull request and 3.1 branch, should be
            similar.</div>
        </div>
      </div>
    </blockquote>
    <blockquote type="cite"
cite="mid:CAEiOBXU1SbdgJdsn_Cvny4=7NTxE+XQPrQQn6NevBxwB8Wox5w@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>As far as I know, there is no concrete plan on CLIC patch
            in short term.  <br>
            It is good to know that the clic patch has been run with
            real RTOS.</div>
          <div>It is also great if you could update the implementation
            to latest spec and send the patch again.</div>
          <div><br>
          </div>
          <div>chihmin</div>
        </div>
      </div>
    </blockquote>
    <p>Hi chihmin,</p>
    <p>Thanks for your reminding and approval. I will pull the latest
      clic version code and send the patch about two or three weeks
      later.</p>
    <p>The RTOS is Rhino,  which is the kernel of
      AliOS-Things(<a class="moz-txt-link-freetext" href="https://github.com/alibaba/AliOS-Things">https://github.com/alibaba/AliOS-Things</a>). <br>
    </p>
    <p>It is also the kernel of YOC(<a class="moz-txt-link-freetext" href="https://cop.c-sky.com">https://cop.c-sky.com</a>).</p>
    <p>Best Regards<br>
      Zhiwei</p>
  </body>
</html>

--------------607755F6E004FB3866553E75--

