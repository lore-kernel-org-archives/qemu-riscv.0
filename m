Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAPnG-0004TM-D5
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 00:15:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAPn7-0004Sp-EO; Thu, 20 Jan 2022 00:15:21 -0500
Received: from out28-73.mail.aliyun.com ([115.124.28.73]:33983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAPn3-0007Hk-DH; Thu, 20 Jan 2022 00:15:20 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06875585|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_news_journal|0.103039-0.00124655-0.895715;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=9; SR=0; TI=SMTPD_---.Mfi16w6_1642655707; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Mfi16w6_1642655707)
 by smtp.aliyun-inc.com(10.147.41.121);
 Thu, 20 Jan 2022 13:15:07 +0800
Subject: Re: [PATCH v7 21/22] target/riscv: Enable uxl field write
To: Alistair Francis <alistair23@gmail.com>, anup@brainfault.org
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, guoren@linux.alibaba.com,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
 <20220119051824.17494-22-zhiwei_liu@c-sky.com>
 <CAKmqyKP=NNEVDDGrbSEeWLfLyX_+=Ao0yWJ9RtyazyycGHM3+w@mail.gmail.com>
 <508b3d54-0641-cab2-c153-8f2bb76c79ed@c-sky.com>
 <CAKmqyKNMvkCX2=V0kRQXKV3_1B6Y61gFOWrpWJ1JPXYm_8a5uQ@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <03d00d3e-528c-bb51-75b5-8fbf4ef1e529@c-sky.com>
Date: Thu, 20 Jan 2022 13:15:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNMvkCX2=V0kRQXKV3_1B6Y61gFOWrpWJ1JPXYm_8a5uQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------08211B6F381E325BF2B950E3"
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.73; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-73.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 20 Jan 2022 05:15:25 -0000

This is a multi-part message in MIME format.
--------------08211B6F381E325BF2B950E3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alistair,

Do you mind share you test method?

I follow the xvisor document on 
https://github.com/xvisor/xvisor/blob/v0.3.1/docs/riscv/riscv64-qemu.txt. 
But it can't run even on QEMU master branch.
It blocks on OpenSBI.

liuzw@b12e0231:/mnt/ssd/liuzw/git/xvisor$  qemu-system-riscv64 -cpu rv64,h=true -M virt -m 512M -nographic -bios ../opensbi/build/platform/generic/firmware/fw_jump.bin  -kernel ./build/vmm.bin -initrd ./build/disk.img -append 'vmm.bootcmd="vfs mount initrd /;vfs run /boot.xscript;vfs cat /system/banner.txt"'

OpenSBI v1.0-2-g6dde435

    ____                    _____ ____ _____

   / __ \                  / ____|  _ \_   _|

  | |  | |_ __   ___ _ __ | (___ | |_) || |

  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |

  | |__| | |_) |  __/ | | |____) | |_) || |_

   \____/| .__/ \___|_| |_|_____/|____/_____|

         | |

         |_|

Platform Name             : riscv-virtio,qemu

Platform Features         : medeleg

Platform HART Count       : 1

Platform IPI Device       : aclint-mswi

Platform Timer Device     : aclint-mtimer @ 10000000Hz

Platform Console Device   : uart8250

Platform HSM Device       : ---

Platform Reboot Device    : sifive_test

Platform Shutdown Device  : sifive_test

Firmware Base             : 0x80000000

Firmware Size             : 252 KB

Runtime SBI Version       : 0.3

Domain0 Name              : root

Domain0 Boot HART         : 0

Domain0 HARTs             : 0*

Domain0 Region00          : 0x0000000002000000-0x000000000200ffff (I)

Domain0 Region01          : 0x0000000080000000-0x000000008003ffff ()

Domain0 Region02          : 0x0000000000000000-0xffffffffffffffff (R,W,X)

Domain0 Next Address      : 0x0000000080200000

Domain0 Next Arg1         : 0x0000000082200000

Domain0 Next Mode         : S-mode

Domain0 SysReset          : yes

Boot HART ID              : 0

Boot HART Domain          : root

Boot HART ISA             : rv64imafdcsuh

Boot HART Features        : scounteren,mcounteren,time

Boot HART PMP Count       : 16

Boot HART PMP Granularity : 4

Boot HART PMP Address Bits: 54

Boot HART MHPM Count      : 0

Boot HART MIDELEG         : 0x0000000000000666

Boot HART MEDELEG         : 0x0000000000f0b509

QEMU: Terminated


Thanks,
Zhiwei

On 2022/1/20 上午11:29, Alistair Francis wrote:
> On Thu, Jan 20, 2022 at 12:12 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>
>> On 2022/1/20 上午8:35, Alistair Francis wrote:
>>> On Wed, Jan 19, 2022 at 3:34 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>>> ---
>>>>    target/riscv/csr.c | 17 ++++++++++++-----
>>>>    1 file changed, 12 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>> index b11d92b51b..90f78eca65 100644
>>>> --- a/target/riscv/csr.c
>>>> +++ b/target/riscv/csr.c
>>>> @@ -572,6 +572,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>>>>    {
>>>>        uint64_t mstatus = env->mstatus;
>>>>        uint64_t mask = 0;
>>>> +    RISCVMXL xl = riscv_cpu_mxl(env);
>>>>
>>>>        /* flush tlb on mstatus fields that affect VM */
>>>>        if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
>>>> @@ -583,21 +584,22 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>>>>            MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
>>>>            MSTATUS_TW | MSTATUS_VS;
>>>>
>>>> -    if (riscv_cpu_mxl(env) != MXL_RV32) {
>>>> +    if (xl != MXL_RV32) {
>>>>            /*
>>>>             * RV32: MPV and GVA are not in mstatus. The current plan is to
>>>>             * add them to mstatush. For now, we just don't support it.
>>>>             */
>>>>            mask |= MSTATUS_MPV | MSTATUS_GVA;
>>>> +        if ((val & MSTATUS64_UXL) != 0) {
>>>> +            mask |= MSTATUS64_UXL;
>>>> +        }
>>>>        }
>>>>
>>>>        mstatus = (mstatus & ~mask) | (val & mask);
>>>>
>>>> -    RISCVMXL xl = riscv_cpu_mxl(env);
>>>>        if (xl > MXL_RV32) {
>>>> -        /* SXL and UXL fields are for now read only */
>>>> +        /* SXL field is for now read only */
>>>>            mstatus = set_field(mstatus, MSTATUS64_SXL, xl);
>>>> -        mstatus = set_field(mstatus, MSTATUS64_UXL, xl);
>>> This change causes:
>>>
>>> ERROR:../target/riscv/translate.c:295:get_gpr: code should not be reached
>>>
>>> to assert when running an Xvisor (Hypervisor extension) guest on the
>>> 64-bit virt machine.
>> Hi Alistair,
>>
>> I am  almost sure that there is an UXL  field write error in Xvisor.
> You are probably right, but a guest bug like that shouldn't be able to
> crash QEMU
>
>> I guess there is an write_sstatus instruction that  writes a 0 to
>> SSTATUS64_UXL.
>>
>> We can fix it on Xvisor. But before that, we should also give more
>> strict constraints on SSTATUS64_UXL write.
>>
>> +        if ((val & SSTATUS64_UXL) != 0) {
>> +            mask |= SSTATUS64_UXL;
>> +        }
>> -        mask |= SSTATUS64_UXL;
>>
>>
>> I will send v8 patch set later for you to test later.
> Thanks!
>
> Alistair
>
>>
>> Thanks,
>> Zhiwei
>>
>>> Alistair

--------------08211B6F381E325BF2B950E3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Alistair,</p>
    <p>Do you mind share you test method?</p>
    <p> I follow the xvisor document on
<a class="moz-txt-link-freetext" href="https://github.com/xvisor/xvisor/blob/v0.3.1/docs/riscv/riscv64-qemu.txt">https://github.com/xvisor/xvisor/blob/v0.3.1/docs/riscv/riscv64-qemu.txt</a>.
      But it can't run even on QEMU master branch.<br>
      It blocks on OpenSBI.</p>
    <pre>liuzw@b12e0231:/mnt/ssd/liuzw/git/xvisor$  qemu-system-riscv64 -cpu rv64,h=true -M virt -m 512M -nographic -bios ../opensbi/build/platform/generic/firmware/fw_jump.bin  -kernel ./build/vmm.bin -initrd ./build/disk.img -append 'vmm.bootcmd="vfs mount initrd /;vfs run /boot.xscript;vfs cat /system/banner.txt"' </pre>
    <pre>OpenSBI v1.0-2-g6dde435</pre>
    <pre>   ____                    _____ ____ _____</pre>
    <pre>  / __ \                  / ____|  _ \_   _|</pre>
    <pre> | |  | |_ __   ___ _ __ | (___ | |_) || |</pre>
    <pre> | |  | | '_ \ / _ \ '_ \ \___ \|  _ &lt; | |</pre>
    <pre> | |__| | |_) |  __/ | | |____) | |_) || |_</pre>
    <pre>  \____/| .__/ \___|_| |_|_____/|____/_____|</pre>
    <pre>        | |</pre>
    <pre>        |_|</pre>
    <pre>
Platform Name             : riscv-virtio,qemu</pre>
    <pre>Platform Features         : medeleg</pre>
    <pre>Platform HART Count       : 1</pre>
    <pre>Platform IPI Device       : aclint-mswi</pre>
    <pre>Platform Timer Device     : aclint-mtimer @ 10000000Hz</pre>
    <pre>Platform Console Device   : uart8250</pre>
    <pre>Platform HSM Device       : ---</pre>
    <pre>Platform Reboot Device    : sifive_test</pre>
    <pre>Platform Shutdown Device  : sifive_test</pre>
    <pre>Firmware Base             : 0x80000000</pre>
    <pre>Firmware Size             : 252 KB</pre>
    <pre>Runtime SBI Version       : 0.3</pre>
    <pre>
Domain0 Name              : root</pre>
    <pre>Domain0 Boot HART         : 0</pre>
    <pre>Domain0 HARTs             : 0*</pre>
    <pre>Domain0 Region00          : 0x0000000002000000-0x000000000200ffff (I)</pre>
    <pre>Domain0 Region01          : 0x0000000080000000-0x000000008003ffff ()</pre>
    <pre>Domain0 Region02          : 0x0000000000000000-0xffffffffffffffff (R,W,X)</pre>
    <pre>Domain0 Next Address      : 0x0000000080200000</pre>
    <pre>Domain0 Next Arg1         : 0x0000000082200000</pre>
    <pre>Domain0 Next Mode         : S-mode</pre>
    <pre>Domain0 SysReset          : yes</pre>
    <pre>
Boot HART ID              : 0</pre>
    <pre>Boot HART Domain          : root</pre>
    <pre>Boot HART ISA             : rv64imafdcsuh</pre>
    <pre>Boot HART Features        : scounteren,mcounteren,time</pre>
    <pre>Boot HART PMP Count       : 16</pre>
    <pre>Boot HART PMP Granularity : 4</pre>
    <pre>Boot HART PMP Address Bits: 54</pre>
    <pre>Boot HART MHPM Count      : 0</pre>
    <pre>Boot HART MIDELEG         : 0x0000000000000666</pre>
    <pre>Boot HART MEDELEG         : 0x0000000000f0b509</pre>
    <pre>QEMU: Terminated</pre>
    <p><br>
    </p>
    <p>Thanks,<br>
      Zhiwei<br>
    </p>
    <div class="moz-cite-prefix">On 2022/1/20 上午11:29, Alistair Francis
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAKmqyKNMvkCX2=V0kRQXKV3_1B6Y61gFOWrpWJ1JPXYm_8a5uQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Thu, Jan 20, 2022 at 12:12 PM LIU Zhiwei <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@c-sky.com">&lt;zhiwei_liu@c-sky.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

On 2022/1/20 上午8:35, Alistair Francis wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Wed, Jan 19, 2022 at 3:34 PM LIU Zhiwei <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@c-sky.com">&lt;zhiwei_liu@c-sky.com&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Signed-off-by: LIU Zhiwei <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@c-sky.com">&lt;zhiwei_liu@c-sky.com&gt;</a>
Reviewed-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
Reviewed-by: Alistair Francis <a class="moz-txt-link-rfc2396E" href="mailto:alistair.francis@wdc.com">&lt;alistair.francis@wdc.com&gt;</a>
---
  target/riscv/csr.c | 17 ++++++++++++-----
  1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b11d92b51b..90f78eca65 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -572,6 +572,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
  {
      uint64_t mstatus = env-&gt;mstatus;
      uint64_t mask = 0;
+    RISCVMXL xl = riscv_cpu_mxl(env);

      /* flush tlb on mstatus fields that affect VM */
      if ((val ^ mstatus) &amp; (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
@@ -583,21 +584,22 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
          MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
          MSTATUS_TW | MSTATUS_VS;

-    if (riscv_cpu_mxl(env) != MXL_RV32) {
+    if (xl != MXL_RV32) {
          /*
           * RV32: MPV and GVA are not in mstatus. The current plan is to
           * add them to mstatush. For now, we just don't support it.
           */
          mask |= MSTATUS_MPV | MSTATUS_GVA;
+        if ((val &amp; MSTATUS64_UXL) != 0) {
+            mask |= MSTATUS64_UXL;
+        }
      }

      mstatus = (mstatus &amp; ~mask) | (val &amp; mask);

-    RISCVMXL xl = riscv_cpu_mxl(env);
      if (xl &gt; MXL_RV32) {
-        /* SXL and UXL fields are for now read only */
+        /* SXL field is for now read only */
          mstatus = set_field(mstatus, MSTATUS64_SXL, xl);
-        mstatus = set_field(mstatus, MSTATUS64_UXL, xl);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">This change causes:

ERROR:../target/riscv/translate.c:295:get_gpr: code should not be reached

to assert when running an Xvisor (Hypervisor extension) guest on the
64-bit virt machine.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hi Alistair,

I am  almost sure that there is an UXL  field write error in Xvisor.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You are probably right, but a guest bug like that shouldn't be able to
crash QEMU

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
I guess there is an write_sstatus instruction that  writes a 0 to
SSTATUS64_UXL.

We can fix it on Xvisor. But before that, we should also give more
strict constraints on SSTATUS64_UXL write.

+        if ((val &amp; SSTATUS64_UXL) != 0) {
+            mask |= SSTATUS64_UXL;
+        }
-        mask |= SSTATUS64_UXL;


I will send v8 patch set later for you to test later.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks!

Alistair

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

Thanks,
Zhiwei

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Alistair
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------08211B6F381E325BF2B950E3--

