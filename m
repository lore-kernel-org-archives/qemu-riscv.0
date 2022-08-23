Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQZRd-0000pN-Qz
	for mharc-qemu-riscv@gnu.org; Tue, 23 Aug 2022 15:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oQZRa-0000oa-0G
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 15:20:10 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oQZRU-0003E3-VQ
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 15:20:09 -0400
Received: by mail-pf1-x42f.google.com with SMTP id x15so13475892pfp.4
 for <qemu-riscv@nongnu.org>; Tue, 23 Aug 2022 12:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=TQKGZ/a3XQa12CnmwVBsi1elK++BC8O561g6lJ6kILE=;
 b=jXAcFGU0mPOo7CLQEyAYyWMWPH20PJLOQblVSt6c4T1zA5N8l2gLG50L0pv4tdaSwi
 rFL27tzoaO7hVWVyF/fqBIiF2GNbzvqAd5VPVBS7Pt4Oc8cY87SxMl648oSjXkNVbjJH
 NNHvOBD29V0meUH2Q/Dp0vuVzi/2dKfua/rQQiAFZ5YXTo1/ydlqwPrJLsUZKbXapT5I
 Cp9AHiOpSp7SQXKV+SToHyUUqBSWPCZEQGUNavdpropY5cSRyeJcpHFyQEngIYOCwgvP
 ahQ1IVFArAx6na1LzYr2pZF+CconwFxEUG1pcdAzJvndj7x89ZrSYKcUpl8mm668q1L2
 WfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=TQKGZ/a3XQa12CnmwVBsi1elK++BC8O561g6lJ6kILE=;
 b=rHYp4R5clehK/rbM2gwRcDm1P83VRCjBmQqv/g4bEz/a7paI9hj5e0OSGlNR08SQkd
 DrhttcPwvIOWCCLLIi3fmVI0yKpAkAyf/9+OJq0br3I7Xd1jQl3zmiQkD4BzrtHg5ePz
 +1RZtqIV1W5IwFA+bTjDL3bBThkzp/TXAhLmrFfck4lmQtXHhA6bLOlQIz2qg0L//ysA
 tOTtIOQTPygqkB5m/uxFhIcAgML2P+IWNlMLF0SX04QeA/TpqqNc3mwa1MQ6OYOPvMtZ
 19h+LEIRgBFlTTjSOxH5W+i2VwLQxrruWqGrqmTmd4Dice1ZEHBKiEYL6aKQ27ul0ezo
 FMWQ==
X-Gm-Message-State: ACgBeo3u1fQiwUegEgv7asWRSeJWTvsvXdk0aLmIrHBWNK2n2E7km1HC
 SaRY9zjg92AgoXi+6pqVnh6GvjdoT4sy1eQhr74uaw==
X-Google-Smtp-Source: AA6agR5YyDzYaHNf+Ly/Fge8xQMSKYt0FBCOfGpkLGM5+XWDhXi2HsCplvMU1pLHn9RRHGG+i7x9GMcnmJLPmbfslUM=
X-Received: by 2002:aa7:93a8:0:b0:536:8b59:c3bc with SMTP id
 x8-20020aa793a8000000b005368b59c3bcmr11886952pff.15.1661282396200; Tue, 23
 Aug 2022 12:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220816232321.558250-1-atishp@rivosinc.com>
 <20220816232321.558250-4-atishp@rivosinc.com>
 <CAKmqyKOZzv6gxn7ntaK=FXKe5KosN4oJFJf55n_F7rsKz2TZWw@mail.gmail.com>
In-Reply-To: <CAKmqyKOZzv6gxn7ntaK=FXKe5KosN4oJFJf55n_F7rsKz2TZWw@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 23 Aug 2022 12:19:45 -0700
Message-ID: <CAHBxVyHSOCtG+aJMRe5_Som+Y1DfyEDyCje458eGDnAaLCfMrA@mail.gmail.com>
Subject: Re: [PATCH v13 3/6] target/riscv: Add few cache related PMU events
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000018f79b05e6ed7303"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 23 Aug 2022 19:20:10 -0000

--00000000000018f79b05e6ed7303
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 22, 2022 at 5:38 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Wed, Aug 17, 2022 at 9:24 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > From: Atish Patra <atish.patra@wdc.com>
> >
> > Qemu can monitor the following cache related PMU events through
> > tlb_fill functions.
> >
> > 1. DTLB load/store miss
> > 3. ITLB prefetch miss
> >
> > Increment the PMU counter in tlb_fill function.
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> This patch causes a number of test failures.
>
> On some boots I see lots of these errors printed:
>
> qemu-system-riscv64: GLib: g_hash_table_lookup: assertion 'hash_table
> != NULL' failed
>
> and I'm unable to boot Linux.
>
> The command line is:
>
> qemu-system-riscv64 \
>     -machine sifive_u \
>     -serial mon:stdio -serial null -nographic \
>     -append "root=/dev/ram rw highres=off console=ttySIF0 ip=dhcp
> earlycon=sbi" \
>     -smp 5 \
>     -d guest_errors \
>     -kernel ./images/qemuriscv64/Image \
>     -initrd ./images/qemuriscv64/buildroot/rootfs.cpio \
>     -bios default -m 256M
>
> I see that faiulre with the 5.19-rc7 kernel and OpenSBI 1.1.
>
> I also see the same messages on other machines when running baremetal
> code. I'm going to drop these patches from my tree
>
>
Sorry for the breakage.  This should fix the issue. We just need to add few
sanity checks
for the platforms that don't support these events.

diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index ad33b81b2ea0..0a473010cadd 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -187,6 +187,9 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum
riscv_pmu_event_idx event_idx)
     CPURISCVState *env = &cpu->env;
     gpointer value;

+    if (!cpu->cfg.pmu_num)
+        return 0;
+
     value = g_hash_table_lookup(cpu->pmu_event_ctr_map,
                                 GUINT_TO_POINTER(event_idx));
     if (!value) {
@@ -221,6 +224,9 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVState
*env,
     }

     cpu = RISCV_CPU(env_cpu(env));
+    if (!cpu->pmu_event_ctr_map)
+        return false;
+
     event_idx = RISCV_PMU_EVENT_HW_INSTRUCTIONS;
     ctr_idx = GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
                                GUINT_TO_POINTER(event_idx)));
@@ -243,6 +249,9 @@ bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,
uint32_t target_ctr)
     }

     cpu = RISCV_CPU(env_cpu(env));
+    if (!cpu->pmu_event_ctr_map)
+        return false;
+
     event_idx = RISCV_PMU_EVENT_HW_CPU_CYCLES;
     ctr_idx = GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
                                GUINT_TO_POINTER(event_idx)));
@@ -280,7 +289,7 @@ int riscv_pmu_update_event_map(CPURISCVState *env,
uint64_t value,
     uint32_t event_idx;
     RISCVCPU *cpu = RISCV_CPU(env_cpu(env));

-    if (!riscv_pmu_counter_valid(cpu, ctr_idx)) {
+    if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->pmu_event_ctr_map)
{
         return -1;
     }

Should I respin the series or send this as a fix ?

Alistair
>
> > ---
> >  target/riscv/cpu_helper.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 1e4faa84e839..81948b37dd9a 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -21,11 +21,13 @@
> >  #include "qemu/log.h"
> >  #include "qemu/main-loop.h"
> >  #include "cpu.h"
> > +#include "pmu.h"
> >  #include "exec/exec-all.h"
> >  #include "instmap.h"
> >  #include "tcg/tcg-op.h"
> >  #include "trace.h"
> >  #include "semihosting/common-semi.h"
> > +#include "cpu_bits.h"
> >
> >  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
> >  {
> > @@ -1188,6 +1190,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs,
> vaddr addr,
> >      cpu_loop_exit_restore(cs, retaddr);
> >  }
> >
> > +
> > +static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType
> access_type)
> > +{
> > +    enum riscv_pmu_event_idx pmu_event_type;
> > +
> > +    switch (access_type) {
> > +    case MMU_INST_FETCH:
> > +        pmu_event_type = RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS;
> > +        break;
> > +    case MMU_DATA_LOAD:
> > +        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS;
> > +        break;
> > +    case MMU_DATA_STORE:
> > +        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS;
> > +        break;
> > +    default:
> > +        return;
> > +    }
> > +
> > +    riscv_pmu_incr_ctr(cpu, pmu_event_type);
> > +}
> > +
> >  bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >                          MMUAccessType access_type, int mmu_idx,
> >                          bool probe, uintptr_t retaddr)
> > @@ -1286,6 +1310,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr
> address, int size,
> >              }
> >          }
> >      } else {
> > +        pmu_tlb_fill_incr_ctr(cpu, access_type);
> >          /* Single stage lookup */
> >          ret = get_physical_address(env, &pa, &prot, address, NULL,
> >                                     access_type, mmu_idx, true, false,
> false);
> > --
> > 2.25.1
> >
> >
>

--00000000000018f79b05e6ed7303
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 22, 2022 at 5:38 PM Alist=
air Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Wed, Aug 17, 2022 at 9:24 AM Atish Patra &lt;<a href=3D"mailto:atishp@r=
ivosinc.com" target=3D"_blank">atishp@rivosinc.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.com" target=3D=
"_blank">atish.patra@wdc.com</a>&gt;<br>
&gt;<br>
&gt; Qemu can monitor the following cache related PMU events through<br>
&gt; tlb_fill functions.<br>
&gt;<br>
&gt; 1. DTLB load/store miss<br>
&gt; 3. ITLB prefetch miss<br>
&gt;<br>
&gt; Increment the PMU counter in tlb_fill function.<br>
&gt;<br>
&gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@w=
dc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt; Tested-by: Heiko Stuebner &lt;<a href=3D"mailto:heiko@sntech.de" targe=
t=3D"_blank">heiko@sntech.de</a>&gt;<br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.com" =
target=3D"_blank">atish.patra@wdc.com</a>&gt;<br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" =
target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
<br>
This patch causes a number of test failures.<br>
<br>
On some boots I see lots of these errors printed:<br>
<br>
qemu-system-riscv64: GLib: g_hash_table_lookup: assertion &#39;hash_table<b=
r>
!=3D NULL&#39; failed<br>
<br>
and I&#39;m unable to boot Linux.<br>
<br>
The command line is:<br>
<br>
qemu-system-riscv64 \<br>
=C2=A0 =C2=A0 -machine sifive_u \<br>
=C2=A0 =C2=A0 -serial mon:stdio -serial null -nographic \<br>
=C2=A0 =C2=A0 -append &quot;root=3D/dev/ram rw highres=3Doff console=3DttyS=
IF0 ip=3Ddhcp<br>
earlycon=3Dsbi&quot; \<br>
=C2=A0 =C2=A0 -smp 5 \<br>
=C2=A0 =C2=A0 -d guest_errors \<br>
=C2=A0 =C2=A0 -kernel ./images/qemuriscv64/Image \<br>
=C2=A0 =C2=A0 -initrd ./images/qemuriscv64/buildroot/rootfs.cpio \<br>
=C2=A0 =C2=A0 -bios default -m 256M<br>
<br>
I see that faiulre with the 5.19-rc7 kernel and OpenSBI 1.1.<br>
<br>
I also see the same messages on other machines when running baremetal<br>
code. I&#39;m going to drop these patches from my tree<br>
<br></blockquote><div><br></div><div>Sorry for the breakage.=C2=A0 This sho=
uld fix the issue. We just need to add few sanity checks</div><div>for the =
platforms that don&#39;t support these events.</div><div><br></div><div>dif=
f --git a/target/riscv/pmu.c b/target/riscv/pmu.c<br>index ad33b81b2ea0..0a=
473010cadd 100644<br>--- a/target/riscv/pmu.c<br>+++ b/target/riscv/pmu.c<b=
r>@@ -187,6 +187,9 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_=
event_idx event_idx)<br>=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu=
-&gt;env;<br>=C2=A0 =C2=A0 =C2=A0gpointer value;<br>=C2=A0<br>+ =C2=A0 =C2=
=A0if (!cpu-&gt;cfg.pmu_num)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>+=
<br>=C2=A0 =C2=A0 =C2=A0value =3D g_hash_table_lookup(cpu-&gt;pmu_event_ctr=
_map,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GUINT_TO_POINTER(event_=
idx));<br>=C2=A0 =C2=A0 =C2=A0if (!value) {<br>@@ -221,6 +224,9 @@ bool ris=
cv_pmu_ctr_monitor_instructions(CPURISCVState *env,<br>=C2=A0 =C2=A0 =C2=A0=
}<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0cpu =3D RISCV_CPU(env_cpu(env));<br>+ =
=C2=A0 =C2=A0if (!cpu-&gt;pmu_event_ctr_map)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return false;<br>+<br>=C2=A0 =C2=A0 =C2=A0event_idx =3D RISCV_PMU_EVENT_=
HW_INSTRUCTIONS;<br>=C2=A0 =C2=A0 =C2=A0ctr_idx =3D GPOINTER_TO_UINT(g_hash=
_table_lookup(cpu-&gt;pmu_event_ctr_map,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 GUINT_TO_POINTER(event_idx)));<br>@@ -243,6 +249,9 @@ bool riscv_pmu=
_ctr_monitor_cycles(CPURISCVState *env, uint32_t target_ctr)<br>=C2=A0 =C2=
=A0 =C2=A0}<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0cpu =3D RISCV_CPU(env_cpu(env)=
);<br>+ =C2=A0 =C2=A0if (!cpu-&gt;pmu_event_ctr_map)<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return false;<br>+<br>=C2=A0 =C2=A0 =C2=A0event_idx =3D RISCV_PMU=
_EVENT_HW_CPU_CYCLES;<br>=C2=A0 =C2=A0 =C2=A0ctr_idx =3D GPOINTER_TO_UINT(g=
_hash_table_lookup(cpu-&gt;pmu_event_ctr_map,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 GUINT_TO_POINTER(event_idx)));<br>@@ -280,7 +289,7 @@ int ris=
cv_pmu_update_event_map(CPURISCVState *env, uint64_t value,<br>=C2=A0 =C2=
=A0 =C2=A0uint32_t event_idx;<br>=C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D RISC=
V_CPU(env_cpu(env));<br>=C2=A0<br>- =C2=A0 =C2=A0if (!riscv_pmu_counter_val=
id(cpu, ctr_idx)) {<br>+ =C2=A0 =C2=A0if (!riscv_pmu_counter_valid(cpu, ctr=
_idx) || !cpu-&gt;pmu_event_ctr_map) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return -1;<br>=C2=A0 =C2=A0 =C2=A0}<br></div><div>=C2=A0</div><div>Shoul=
d I respin the series or send this as a fix ?</div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Alistair<br>
<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu_helper.c | 25 +++++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 25 insertions(+)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
&gt; index 1e4faa84e839..81948b37dd9a 100644<br>
&gt; --- a/target/riscv/cpu_helper.c<br>
&gt; +++ b/target/riscv/cpu_helper.c<br>
&gt; @@ -21,11 +21,13 @@<br>
&gt;=C2=A0 #include &quot;qemu/log.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/main-loop.h&quot;<br>
&gt;=C2=A0 #include &quot;cpu.h&quot;<br>
&gt; +#include &quot;pmu.h&quot;<br>
&gt;=C2=A0 #include &quot;exec/exec-all.h&quot;<br>
&gt;=C2=A0 #include &quot;instmap.h&quot;<br>
&gt;=C2=A0 #include &quot;tcg/tcg-op.h&quot;<br>
&gt;=C2=A0 #include &quot;trace.h&quot;<br>
&gt;=C2=A0 #include &quot;semihosting/common-semi.h&quot;<br>
&gt; +#include &quot;cpu_bits.h&quot;<br>
&gt;<br>
&gt;=C2=A0 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)<br>
&gt;=C2=A0 {<br>
&gt; @@ -1188,6 +1190,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs=
, vaddr addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cpu_loop_exit_restore(cs, retaddr);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +<br>
&gt; +static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType access=
_type)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 enum riscv_pmu_event_idx pmu_event_type;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (access_type) {<br>
&gt; +=C2=A0 =C2=A0 case MMU_INST_FETCH:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmu_event_type =3D RISCV_PMU_EVENT_CACHE_=
ITLB_PREFETCH_MISS;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case MMU_DATA_LOAD:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmu_event_type =3D RISCV_PMU_EVENT_CACHE_=
DTLB_READ_MISS;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case MMU_DATA_STORE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmu_event_type =3D RISCV_PMU_EVENT_CACHE_=
DTLB_WRITE_MISS;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 riscv_pmu_incr_ctr(cpu, pmu_event_type);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type, int mmu_idx,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 bool probe, uintptr_t retaddr)<br>
&gt; @@ -1286,6 +1310,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr addr=
ess, int size,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmu_tlb_fill_incr_ctr(cpu, access_type);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Single stage lookup */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D get_physical_address(env, &a=
mp;pa, &amp;prot, address, NULL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0access_type, =
mmu_idx, true, false, false);<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--00000000000018f79b05e6ed7303--

