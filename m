Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iA8hY-0000jE-Fq
	for mharc-qemu-riscv@gnu.org; Tue, 17 Sep 2019 04:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53594)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1iA8hV-0000fj-DB
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2019 04:19:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1iA8hT-0002Xf-SL
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2019 04:19:05 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:42198)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1iA8hP-0002N0-Lm; Tue, 17 Sep 2019 04:19:00 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.04608306|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.120959-0.00373632-0.875304; FP=0|0|0|0|0|-1|-1|-1;
 HT=e01a16384; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=11; RT=11; SR=0;
 TI=SMTPD_---.FW9xxlT_1568708326; 
Received: from 172.16.28.186(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.FW9xxlT_1568708326) by smtp.aliyun-inc.com(10.147.40.2);
 Tue, 17 Sep 2019 16:18:48 +0800
To: Chih-Min Chao <chihmin.chao@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, riku.voipio@iki.fi,
 laurent@vivier.eu, wenmeng_zhang@c-sky.com,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-2-git-send-email-zhiwei_liu@c-sky.com>
 <CAEiOBXUveMJGpavU7_zK0UTdNniQvnXnw5MvE-hu7yHCSw8MPQ@mail.gmail.com>
From: liuzhiwei <zhiwei_liu@c-sky.com>
Message-ID: <6c7b73cc-a4ae-8b0a-b6b1-c578549aa2f4@c-sky.com>
Date: Tue, 17 Sep 2019 16:09:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAEiOBXUveMJGpavU7_zK0UTdNniQvnXnw5MvE-hu7yHCSw8MPQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------FB2274E6EE2E54AEA569EDFE"
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 121.197.200.217
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 01/17] RISC-V: add vfp
 field in CPURISCVState
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
X-List-Received-Date: Tue, 17 Sep 2019 08:19:07 -0000

This is a multi-part message in MIME format.
--------------FB2274E6EE2E54AEA569EDFE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2019/9/11 下午10:51, Chih-Min Chao wrote:
>
>
> On Wed, Sep 11, 2019 at 2:35 PM liuzhiwei <zhiwei_liu@c-sky.com 
> <mailto:zhiwei_liu@c-sky.com>> wrote:
>
>     From: LIU Zhiwei <zhiwei_liu@c-sky.com <mailto:zhiwei_liu@c-sky.com>>
>
>     Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com
>     <mailto:zhiwei_liu@c-sky.com>>
>     ---
>      target/riscv/cpu.h | 28 ++++++++++++++++++++++++++++
>      1 file changed, 28 insertions(+)
>
>     diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>     index 0adb307..c992b1d 100644
>     --- a/target/riscv/cpu.h
>     +++ b/target/riscv/cpu.h
>     @@ -93,9 +93,37 @@ typedef struct CPURISCVState CPURISCVState;
>
>      #include "pmp.h"
>
>     +#define VLEN 128
>     +#define VUNIT(x) (VLEN / x)
>     +
>      struct CPURISCVState {
>          target_ulong gpr[32];
>          uint64_t fpr[32]; /* assume both F and D extensions */
>     +
>     +    /* vector coprocessor state.  */
>     +    struct {
>     +        union VECTOR {
>     +            float64  f64[VUNIT(64)];
>     +            float32  f32[VUNIT(32)];
>     +            float16  f16[VUNIT(16)];
>     +            uint64_t u64[VUNIT(64)];
>     +            int64_t  s64[VUNIT(64)];
>     +            uint32_t u32[VUNIT(32)];
>     +            int32_t  s32[VUNIT(32)];
>     +            uint16_t u16[VUNIT(16)];
>     +            int16_t  s16[VUNIT(16)];
>     +            uint8_t  u8[VUNIT(8)];
>     +            int8_t   s8[VUNIT(8)];
>     +        } vreg[32];
>     +        target_ulong vxrm;
>     +        target_ulong vxsat;
>     +        target_ulong vl;
>     +        target_ulong vstart;
>     +        target_ulong vtype;
>     +        float_status fp_status;
>     +    } vfp;
>     +
>     +    bool         foflag;
>          target_ulong pc;
>          target_ulong load_res;
>          target_ulong load_val;
>     -- 
>     2.7.4
>
>
> Could  the VLEN be configurable in cpu initialization but not fixed in 
> compilation phase ?

Yes,  it's important that VLEN is configurable to support different 
types of cpu.

> Take the integer element as example  and the difference should be the 
> stride of vfp.vreg[x] isn't continuous
>
>     struct {
>         union VECTOR {
>             uint64_t *u64;
>             uint16_t *u16;
>             uint8_t  *u8;
>         } vreg[32];
>     } vfp;
>
>    initialization
>     int vlen = 256;  //parameter from cpu command line option
>     int elem = vlen / 8;
>     int size = elem * 32;
>
>     uint8_t *mem = malloc(size)
>     for (int idx = 0; idx < 32; ++idx) {
>         vfp.vreg[idx].u64 = (void *)&mem[idx * elem];
>         vfp.vreg[idx].u32 = (void *)&mem[idx * elem];
>         vfp.vreg[idx].u16 = (void *)&mem[idx * elem];
>    }
>
>   chihmin

It's a good idea. I will accept it.

Thanks for review.

Zhiwei


--------------FB2274E6EE2E54AEA569EDFE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2019/9/11 下午10:51, Chih-Min Chao
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEiOBXUveMJGpavU7_zK0UTdNniQvnXnw5MvE-hu7yHCSw8MPQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Sep 11, 2019 at 2:35
            PM liuzhiwei &lt;<a href="mailto:zhiwei_liu@c-sky.com"
              target="_blank" moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">From: LIU Zhiwei &lt;<a
              href="mailto:zhiwei_liu@c-sky.com" target="_blank"
              moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt;<br>
            <br>
            Signed-off-by: LIU Zhiwei &lt;<a
              href="mailto:zhiwei_liu@c-sky.com" target="_blank"
              moz-do-not-send="true">zhiwei_liu@c-sky.com</a>&gt;<br>
            ---<br>
             target/riscv/cpu.h | 28 ++++++++++++++++++++++++++++<br>
             1 file changed, 28 insertions(+)<br>
            <br>
            diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
            index 0adb307..c992b1d 100644<br>
            --- a/target/riscv/cpu.h<br>
            +++ b/target/riscv/cpu.h<br>
            @@ -93,9 +93,37 @@ typedef struct CPURISCVState
            CPURISCVState;<br>
            <br>
             #include "pmp.h"<br>
            <br>
            +#define VLEN 128<br>
            +#define VUNIT(x) (VLEN / x)<br>
            +<br>
             struct CPURISCVState {<br>
                 target_ulong gpr[32];<br>
                 uint64_t fpr[32]; /* assume both F and D extensions */<br>
            +<br>
            +    /* vector coprocessor state.  */<br>
            +    struct {<br>
            +        union VECTOR {<br>
            +            float64  f64[VUNIT(64)];<br>
            +            float32  f32[VUNIT(32)];<br>
            +            float16  f16[VUNIT(16)];<br>
            +            uint64_t u64[VUNIT(64)];<br>
            +            int64_t  s64[VUNIT(64)];<br>
            +            uint32_t u32[VUNIT(32)];<br>
            +            int32_t  s32[VUNIT(32)];<br>
            +            uint16_t u16[VUNIT(16)];<br>
            +            int16_t  s16[VUNIT(16)];<br>
            +            uint8_t  u8[VUNIT(8)];<br>
            +            int8_t   s8[VUNIT(8)];<br>
            +        } vreg[32];<br>
            +        target_ulong vxrm;<br>
            +        target_ulong vxsat;<br>
            +        target_ulong vl;<br>
            +        target_ulong vstart;<br>
            +        target_ulong vtype;<br>
            +        float_status fp_status;<br>
            +    } vfp;<br>
            +<br>
            +    bool         foflag;<br>
                 target_ulong pc;<br>
                 target_ulong load_res;<br>
                 target_ulong load_val;<br>
            -- <br>
            2.7.4<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>Could  the VLEN be configurable in cpu initialization but
            not fixed in compilation phase ?</div>
        </div>
      </div>
    </blockquote>
    <p>Yes,  it's important that VLEN is configurable to support
      different types of cpu.<br>
    </p>
    <blockquote type="cite"
cite="mid:CAEiOBXUveMJGpavU7_zK0UTdNniQvnXnw5MvE-hu7yHCSw8MPQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>Take the integer element as example  and the difference
            should be the stride of vfp.vreg[x] isn't continuous</div>
          <div><br>
          </div>
          <div>    struct {<br>
                    union VECTOR {<br>
                        uint64_t *u64;<br>
                        uint16_t *u16;<br>
                        uint8_t  *u8;<br>
                    } vreg[32];<br>
                } vfp;  <br>
          </div>
          <div><br>
          </div>
          <div>   initialization</div>
          <div> </div>
              int vlen = 256;  //parameter from cpu command line option<br>
              int elem = vlen / 8;<br>
              int size = elem * 32;<br>
          <br>
              uint8_t *mem = malloc(size)<br>
              for (int idx = 0; idx &lt; 32; ++idx) {<br>
                  vfp.vreg[idx].u64 = (void *)&amp;mem[idx * elem];<br>
                  vfp.vreg[idx].u32 = (void *)&amp;mem[idx * elem];<br>
          <div>        vfp.vreg[idx].u16 = (void *)&amp;mem[idx * elem];<br>
          </div>
          <div>   }</div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote>
    <blockquote type="cite"
cite="mid:CAEiOBXUveMJGpavU7_zK0UTdNniQvnXnw5MvE-hu7yHCSw8MPQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>  chihmin</div>
        </div>
      </div>
    </blockquote>
    <p>It's a good idea. I will accept it. <br>
    </p>
    <p>Thanks for review.</p>
    <p>Zhiwei<br>
    </p>
  </body>
</html>

--------------FB2274E6EE2E54AEA569EDFE--

