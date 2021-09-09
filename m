Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mODXm-0001jD-Tv
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 02:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mODXf-0001er-2R; Thu, 09 Sep 2021 02:28:11 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:42603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mODXc-0007T7-Ga; Thu, 09 Sep 2021 02:28:10 -0400
Received: by mail-il1-x12a.google.com with SMTP id s16so827251ilo.9;
 Wed, 08 Sep 2021 23:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8XYP1uDQVr2iszW9f34SnI4qBV68GIX3C5O5KMwElMo=;
 b=NXzObhyy5ZaEqDzf+WbUbxkqvXHbMDHQU5MnncqD2v1erTpdyirppUlTdeDQhsZntT
 bsKTwwcwVydltnLsP9awkY9J7nBGXAl0IcrfqOANQmoc/WKHWjz/aJra1Bb6Onh4VIxR
 1Q6+9FacQhYbxn7gZDPj4MQqopP1kU7bRJiIrJEJxgqNjSDgWoCQsP8fSgBYzPqc1Iln
 aIUGXa/JzuWlRtyOZLqyL5ecj+B3oDSwvXWx7Ow3sfU6Svvt0s2wA9LpJWqAgqZuK/VV
 sgF+cnBWy0BvhC8Iq8dzd9TNYDCSdFJarK1LHcbgCnYKtb+hFK8oxtvAajeBSnlmypRd
 SGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8XYP1uDQVr2iszW9f34SnI4qBV68GIX3C5O5KMwElMo=;
 b=yuhKUSXO3w/2JTIhFW1Tq2beUasNARVKyv6r0G1q75GjLkyT0Khi6aqoRfAcbqipCU
 FcodwZK7RfAc3qKA1kl9fvXtx34oH1LLKvEJQQTLYanl4+bM24LBgnrn7bdNVqhsU7ru
 PHx4rzpoyxKKlggPygJ/DH4sggD+ZX3lvnI7LdRgBrxdconkG0QpuCqx1o4XWLfYBmRz
 iH+Qf0bEfU0/t0Sti2g4lHr9M2iamHHwY6YXI5Vt1I5V28l4qTFFQDy+SZ7AqsXAYN85
 9Q9sgY4d6+/KRiX4O0YIVyCEOsiTAgm7CAfmCXYEHRlUK6OCrbnuCLSOBa999HHIh62D
 +ySA==
X-Gm-Message-State: AOAM530IWdDa5WmKQiSZ+1vRcXoNabm9BgLzs8TcM/MawrIienKyq88d
 tV3ipTI7S06LkJ+jxqtsI9AW5v6ErrSJOT0n1vA=
X-Google-Smtp-Source: ABdhPJwLRFGhhiSuhX9d3QgPqWIJdIBE/WU6v9rhw6uroyWJV1IyDZJKGjqSR8hNIWyHoDKAE/KTUMLtKpsVjgaPQyk=
X-Received: by 2002:a92:280f:: with SMTP id l15mr1091453ilf.74.1631168886897; 
 Wed, 08 Sep 2021 23:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210826151332.32753-1-ruinland@andestech.com>
 <CAKmqyKPY=Q61x7gf_0S1-B66VMpZCFx1r5ENJG0J5FNX6NLz0w@mail.gmail.com>
 <YTW6ADQMBcs5csXv@ruinland-x1c>
 <CAKmqyKPu9MK0KRycXzcnb=pH_OjB1mCKzw8uhb2vSZAwxraAfg@mail.gmail.com>
 <YTXFGWBhpJ3gdxxb@ruinland-x1c>
 <CAKmqyKM2erOYCOqbT7rKmbQig5HC2Q_3hk2xHBDMbFG9ipx06A@mail.gmail.com>
 <YTcdJBgP5PY+56wU@ruinland-x1c>
In-Reply-To: <YTcdJBgP5PY+56wU@ruinland-x1c>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Sep 2021 16:27:39 +1000
Message-ID: <CAKmqyKM8b9nSctDDaSCEbmeGmi4nROodPtpYwbndER_wVH4BBw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] riscv: Adding custom CSR related Kconfig options
To: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>,
 Dylan Jhong <dylan@andestech.com>, guoren@linux.alibaba.com, 
 ycliang@andestech.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 09 Sep 2021 06:28:11 -0000

On Tue, Sep 7, 2021 at 6:05 PM Ruinland ChuanTzu Tsai
<ruinland@andestech.com> wrote:
>
> Hi Alistair,
>
> Thanks for the comment.
>
> On Mon, Sep 06, 2021 at 05:55:25PM +1000, Alistair Francis wrote:
> > On Mon, Sep 6, 2021 at 5:37 PM Ruinland ChuanTzu Tsai
> > <ruinland@andestech.com> wrote:
> > >
> > > Hi Alistair,
> > >
> > > So glad to hear from you.
> > >
> > > On Mon, Sep 06, 2021 at 05:05:16PM +1000, Alistair Francis wrote:
> > > > On Mon, Sep 6, 2021 at 4:49 PM Ruinland ChuanTzu Tsai
> > > > <ruinland@andestech.com> wrote:
> > > > >
> > > > >
> > > > > Hi Alistair,
> > > > >
> > > > > Thanks for the heads up about the upcoming unification of RISC-V 32/64 targets.
> > > > > Yet I have several concerns and would like to have some brainstorming regarding
> > > > > such topics - -
> > > >
> > > > No worries, I'm happy to discuss.
> > > >
> > > > >
> > > > > That is, could you elaborate more about the "runtime check/switch" which you
> > > > > mentioned in the previous e-mail :
> > > > > https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg02154.html
> > > > > I'm not quite following the context.
> > > >
> > > > Yep, so something along the lines of this in `riscv_csrrw()`
> > > >
> > > > if (cpu == "MyCustomCPU") {
> > > >     my_custom_csr[csrno].read();
> > > > }
> > > >
> > > > So we check if using the CPU then apply extra CSR accesses.
> > > >
> > > > > If we don't have a way to toggle which (vendor) cores, which will be used,
> > > > > during compile time, it means that we have to build all the vendor code and
> > > > > link them all together; and we might have the chance to encounter collision on
> > > > > csrno between different vendors.
> > > >
> > > > I don't see how they will collide as we will only act on 1, based on
> > > > the CPU we are using.
> > >
> > > AFAIK, we need to put CSR number into `target/riscv/cpu_bits.h`, and they are
> > > exposed to the global and let others to use it. With my current design, which I
> > > have sent out by RFC patch series v3, I introduced an abstraction layer,
> > > `custom_cpu_bits.h`, which will toggle diffenet set of custom CSR number.
> > >
> > > If we teardown the Kconfig, all symbols will be exposed and then it could have
> > > a high chance to collide with each other.
> >
> > I guess this depends on what you are trying to do.
> >
> > We could have non public CSRs. So each CPU could have it's own custom
> > version of `riscv_csr_operations csr_ops[CSR_TABLE_SIZE]` which is in
> > it's own C file. We then just add a switch case to CSR accesses and if
> > using CPU "customcpu" then we check the `custom_cpu_csr_ops` table.
> > NOTE: That we can do something smarter than a switch, but you get the
> > point. We can implement a read/write function for every element in the
> > array, with the default just triggering an illegal instruction.
>
> One thing I would like to discuss here.
>
> Firstly, I'm not quite sure how the picture of non-public CSR looks like.
> Is it suggested that non-standard CSR number shall not be exposed ?
>
> I know that we should focus on custom CSR part, yet I need to make sure
> that if following logic is permitted to appear in `target/riscv/trans_insn` :
>
> trans_vendor_A_insn_blah(...) {
>     riscv_csrrw(env, CSR_VENDOR_A_CUSTOM, r, n, write_mask);
>     }
>
> As far as I know, csr number is not presented as a C++ enum, which we
> can access via csr::custom::vendora::foobar, so it's a globally exposed
> macro with possiblilty of collision.
>
> IMHO, the key is that are we permitted to have a uniform interface to access
> CSR, either standard or vendor designed ones, in other parts of QEMU.

I think we could still do that.

As an example the WDC Swerv EL2 core
(https://github.com/chipsalliance/Cores-SweRV-EL2/blob/master/docs/RISC-V_SweRV_EL2_PRM.pdf)
has a custom power management CSR called mpmc. The code below is
completely untested (it won't compile), but wouldn't something like
this do what you want?

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00..bf0c0b733c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -509,4 +509,6 @@ void riscv_set_csr_ops(int csrno,
riscv_csr_operations *ops);

 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);

+void wdc_swerv_el2_cpu_init(Object *obj);
+
 #endif /* RISCV_CPU_H */

We expose a public init function for the vendor CPUS

diff --git a/target/riscv/vendor/swerv_el2.h b/target/riscv/vendor/swerv_el2.h
new file mode 100644
index 0000000000..ab392ed757
--- /dev/null
+++ b/target/riscv/vendor/swerv_el2.h
@@ -0,0 +1 @@
+#define CSR_MPMC        0x7C6

The CSRs are in their own header file.


diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 096e3003aa..fd6efee239 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -789,6 +789,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
+    DEFINE_CPU("WDC-SweRV-El2",                 wdc_swerv_el2_cpu_init),
 #elif defined(TARGET_RISCV64)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),

We expose the CPU

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ba9818f6a5..d78234842d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1440,6 +1440,11 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
+    /* TODO: Don't hard code name check */
+    if (cpu->custom_csrs) {
+        cpu->custom_csrs[csrno].op(env, csrno, ret_value, new_value,
write_mask);
+    }
+
     if (write_mask && read_only) {
         return RISCV_EXCP_ILLEGAL_INST;
     }

We have a change in the CSR handler to call custom CSRs if they exist

diff --git a/target/riscv/vendor/swerv_el2.c b/target/riscv/vendor/swerv_el2.c
new file mode 100644
index 0000000000..5d1cb3678e
--- /dev/null
+++ b/target/riscv/vendor/swerv_el2.c
@@ -0,0 +1,30 @@
+static RISCVException read_mpmc(CPURISCVState *env, int csrno,
+                                target_ulong *val)
+{
+    *val = env->mpmc;
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mpmc(CPURISCVState *env, int csrno,
+                                 target_ulong val)
+{
+    env->mpmc = val;
+
+    return RISCV_EXCP_NONE;
+}
+
+/* Control and Status Register function table */
+riscv_csr_operations swerv_el2_ops[CSR_TABLE_SIZE] = {
+    [CSR_MPMC]     = { "swerv-el2-mpmc",   any,     read_mpmc,  write_mpmc },
+}
+
+void wdc_swerv_el2_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(env);
+
+    cpu->custom_csrs = swerv_el2_ops;
+    /* TODO: Set MISA */
+    set_priv_version(env, PRIV_VERSION_1_10_0);
+}

All of the CPU logic is hidden away in it's own file.

diff --git a/target/riscv/insn_trans/trans_wdc_swerv_el2.c.inc
b/target/riscv/insn_trans/trans_wdc_swerv_el2.c.inc
new file mode 100644
index 0000000000..fba11bee13
--- /dev/null
+++ b/target/riscv/insn_trans/trans_wdc_swerv_el2.c.inc
@@ -0,0 +1,3 @@
+trans_wdc_special_ins(...) {
+    riscv_csrrw(env, CSR_MPMC, r, n, write_mask);
+}

We can also add instructions in their own file. The higher level
decode tree will select these if required as Richard mentioned.

We do have to be careful with names, but I think we can just prefix
functions with the CPU name and we should be ok.

>
>
> > I guess that assumes that each CSR access is self contained. For
> > example if changing a custom CSR changes a core part of the
> > target/riscv code this won't really work.
> >
> > On the other hand I'm not convinced we want vendor changes to affect
> > the core target/riscv code. Ideally all vendor code can be kept in
> > it's own file and it's fully self contained. That won't work for
> > everything, but it should work for enough use cases. We can even have
> > a custom vendor state that the vendor code can use (it can also change
> > the CPU state).
> >
> > Does that make sense?
>
> In general, I agree with the point that vendor code should be self-contained.
> Yet I have doubts that with the current design of CPU model, are we able to
> unify the targets and in the meanwhile to keep things tight and neat ?
>
> The execution flow will be bonded to have a shared instruction decoder/
> translator and a shared handler for CSR (i.e. riscv_csrrw). It's not like we
> get to choose what decoder we want to use or which CSR table we will be
> using at xxx_cpu_init(). If we choose to use runtime check/diversion of all of
> these parts, the overhead might be tremendous.

I don't see why it should be that bad.

We can then check to see if any custom CSR table or instruction
decoder exists. If there isn't we just wasted a few instructions to
perform the check, but if there is we can then run the custom logic.

>
> Surely we should be focusing on CSR part for now, and just as you said, CSR
> is not that perforamnce-centric.
>
> Yet if we take a look at `configs/targets`, still we're having 6 MIPS32/64
> linux-user targets, 4 ARM32/64 linux-user targets and 4 PPC32/64 linux-user
> targets.

RISC-V also has 4, but we shouldn't be adding any new ones.

>
> I guess it will be a very long journey to merge all the variants.
>
> >
> > >
> > > >
> > > > >
> > > > > Secondly, I'm not quite sure about how we're going to merge decode tree files
> > > > > across RV32 and RV64. Vendor-designed custom instruction would have a different
> > > > > encoding scheme on bitfields for RV32 and RV64. Currently, we (Andes) are using
> > > > > different decodetree sources for gen32 and gen64 in `target/riscv/meson.build`.
> > > >
> > > > Ok, so custom instructions are a whole different problem. I think we
> > > > should leave that for now and focus on CSRs.
> > > >
> > > > A quick look though and I suspect we could do a similar CPU check in
> > > > decode_opc(). Dealing with the decodetree will be problematic though.
> > > >
> > > > > I'm preparing the patch to demonstrate such hiccups.
> > > > >
> > > > > As far as I know, there's no control flow logic for decodetree to parse
> > > > > decodetree files differently. (e.g. ifdef XLEN == 32 then blah, blah).
> > > > >
> > > > > To meet in the halfway, maybe after the grand unification on RV32/64, we can
> > > > > still confine vendor custom logic (i.e. instrucions and CSRs) to be toggled by
> > > > > whether a certain vendor cpu model is selected ?
> > > >wtih  the d
> > > > I honestly don't see a scenario where that happens. The maintenance
> > > > overhead and confusion of changing the CPUs at build time is too high.
> > > >
> > > > I also don't think we should need that for CSR accesses. Custom
> > > > instructions are a whole different can of worms.
> > >
> > > IMHO, custom CSR and custom instructions are two sides of a same coin in some
> > > way. Let me explain it with an example - -
> > >
> > > Andes has a custom instruction called `EXEC.IT`, which is a 16-bit long com-
> > > pressed instruction. By executing such instrcution, an instruction table
> > > reside in a particular address specified by a custom CSR called uitb will be
> > > fetch, decode and execute. By doing so, the code size could be reduced.
> >
> > Hmmm... This is a much more complex use case than I was expecting. I
> > have been thinking more about custom CSRs to set a timer or control
> > the interrupt controller.
> >
> > Something like what you described is going to be a lot more work.
> >
> > In your case though I think we can still focus on the CSR aspect
> > first. Once that is sorted we can then look at the instruction part.
>
> Just like the mentioned question above , I'm wondering if we can assume
> riscv_csrrw() to be a general interface for accessing all the CSRs ?

It will be for guest accesses.

Things become tricky when you have knock on effects though, where a
custom CSR can affect the standard running of the machine. In that
case maybe we can override the generic instruction or set some state
in the CPU to have the desired outcome.

Alistair

