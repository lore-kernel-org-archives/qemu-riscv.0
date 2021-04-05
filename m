Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lTSc9-0008Ky-6O
	for mharc-qemu-riscv@gnu.org; Mon, 05 Apr 2021 13:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alek.frohlich@gmail.com>)
 id 1lTSc6-0008Hw-Ou
 for qemu-riscv@nongnu.org; Mon, 05 Apr 2021 13:02:11 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:36706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alek.frohlich@gmail.com>)
 id 1lTSc3-0004jQ-DA
 for qemu-riscv@nongnu.org; Mon, 05 Apr 2021 13:02:10 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso11987574otq.3
 for <qemu-riscv@nongnu.org>; Mon, 05 Apr 2021 10:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=pkEuCkVz5mZ7acgyoyWfj0BRUq5AKru2Xmofmvl7EmE=;
 b=bw6TK1soIpjTzUiV5d7zAR8Z3ix0gbVGo2EJ7KzNV1uXMelVrN1UKj7ycx6YkdveBf
 iqykM7uuUqsac4Gh8q+2GXxC8wVfEiRl3hNWQqhNZtAlUQQzxFIeBNY9R3fllueoom/D
 GDTHHT1+UZ975Kbm0tQnWAcsfhKsdMw18tQtLTwNix/kJrQZIGDCqmFEuZhzj2gRVp4s
 d2sNMkd/CFEMFsK+sLf8r2at8GztCcEg1skAFnEvhhtzEhL/8bgu0tvSHdnz1upqhsTQ
 w7xmnpfeGU8sA9p+f5BdqIVibtqz77JYKGRcXWosWi8tKqqx7fxYmctXwREbHDiGF4+w
 +6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=pkEuCkVz5mZ7acgyoyWfj0BRUq5AKru2Xmofmvl7EmE=;
 b=H4K0WXTv2YOa4bEemBUne7QtVAU/7lyTTDnDjGHVj/+185kv10h938H9S7Rgt7n70u
 gbXEmbN+m7qHggFVeo/01EOK4Xq/2PrvYlG8los0ROo+6I8ZzsUcBrUgOUDYtWokSNtO
 YcMt1tEJyxVAF52TTQ5I9I3vHI1cQ6gdLrD4HvRLSxVrmdAZ5KDYWg5wy0NkkfWjSyPN
 FtSQn0M5T+yWEVIgFMFPYMRGBHJVxB5CZ8HyZ4TbbTURMHOyXwtvXthqqP6Hr6y3JgLD
 xWLZryQBH3GBIP/1R/K8KKUEuHLeCRjqDjUnU93PfJzhD6tzfuYHxkoLFd37W4kElN7O
 kLkg==
X-Gm-Message-State: AOAM531d2qqFsHFInF3TCyo1SkWeEcq6dQeNdEeLpr+XWflZ3Gh8Y94p
 Lwb78DmgOdkLZnXBj8hsyKD2OyjBd9g0OpEGH4If5mq8wExG2w==
X-Google-Smtp-Source: ABdhPJzUfSPhETmn2G29QJs1WdXu93mbsLpMu6a2PcoSYmZgABZjkVAOIUgu8DQJ/QjmJnvYBEQMRANU4gFLAIfNPZc=
X-Received: by 2002:a9d:4048:: with SMTP id o8mr22596735oti.152.1617642122704; 
 Mon, 05 Apr 2021 10:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <CABkyU4UkLY8D_kAH_p=P5TPiWcQ-NiJ_1JSsc_X1e=_1xOCcuQ@mail.gmail.com>
In-Reply-To: <CABkyU4UkLY8D_kAH_p=P5TPiWcQ-NiJ_1JSsc_X1e=_1xOCcuQ@mail.gmail.com>
From: =?UTF-8?Q?Alek_Fr=C3=B6hlich?= <alek.frohlich@gmail.com>
Date: Mon, 5 Apr 2021 14:01:51 -0300
Message-ID: <CABkyU4We-B1bqw3AaUM=oRHcFUhDmbRyVZefg30DX25rzJW_GQ@mail.gmail.com>
Subject: Re: Handling Timer Interrupts in Supervisor Mode (machine virt)
To: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000018f91e05bf3ca8db"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=alek.frohlich@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 05 Apr 2021 17:02:11 -0000

--00000000000018f91e05bf3ca8db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It is also worth noting that mideleg[5] (MTI) should be delegatable
<https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/iJqwTw2hIRk/m/A6i=
o8iWWBQAJ>;
however, it is not
<https://github.com/qemu/qemu/blob/25d75c99b2e5941c67049ee776efdb226414f4c6=
/target/riscv/csr.c#L395>.
I've also tested in the qemu I have (I am using a pre compiled version; the
only thing I know is that it is v5.0 with risc32-softmmu), and

CPU::mideleg_write(CPU::MTI);

does nothing (mideleg continues to be 0 after the csrw).

Is this a bug? If it is not, then what is the reason for this?

Thanks, again,
Alek.

On Mon, Apr 5, 2021 at 1:08 PM Alek Fr=C3=B6hlich <alek.frohlich@gmail.com>
wrote:

> Hello all,
>
> I am implementing a C++ Micro Kernel for RISCV, and I am having trouble t=
o
> arrive at a good solution for the handling of timer interrupts.
>
> I'd desire to run the entire system (after its setup phase) in
> supervisor/user mode, but, as it seems, there is no way to make the CLINT
> generate STI interrupt requests so that mideleg can automatically forward
> them to the S-mode handler pointed by stvec.
>
> I took this conclusion based on two pieces of evidence:
>
>    1. The RISCV privileged specification (version 1.10) lets it be
>    understood that the bit MTI (on MIP) is hardwired to the comparison (m=
time
>    >=3D mtimecmp)?
>    2. The QEMU implementation of Sifive's CLINT doesn't perform any tests
>    (e.g., "am I configured to cause S-Mode IRQs"?) before issuing a MTI
>    request (see this
>    <https://github.com/qemu/qemu/blob/25d75c99b2e5941c67049ee776efdb22641=
4f4c6/hw/intc/sifive_clint.c#L54>
>    )
>
> Then, the only solution I found was to always let the STI bit on SIP
> turned on and to let a M-mode handler turn the corresponding SIE bit (the
> S-mode handler is responsible for clearing this bit so as to avoid loopin=
g
> on STI IRQs).
>
> This is not very satisfying; are there any other alternatives that would
> allow my kernel to have a preemptive scheduler without the need of ever
> switching back to M-mode?
>
> After all, switching to M-mode after the setup has all kinds of
> unnecessary complications; to name one, consider the scenario where the
> M-mode handler has to save some of the process' context before being able
> to perform its task (this is currently the case; I've left a picture of m=
y
> actual M-mode handler below). In this scenario, a stack must be used; but
> which stack? $sp, at the time the handler starts executing, points to a
> virtual address that, in my case, isn't even valid physical memory. Hence=
,
> one must also set aside a kernel stack for handling M-mode interrupts.
>
> Of course, later when I have syscalls implemented, there will be another
> need for such kstack; however, that is only to illustrate my point.
>
> [Handler; how would you even take advantage of __attribute__((interrupt))
> if you had to fiddle with $sp before saving context?]
>
> extern "C" [[gnu::interrupt, gnu::aligned(4)]] void _mmode_forward() {
> Reg id =3D CPU::mcause();
> if((id & IC::INT_MASK) =3D=3D CLINT::IRQ_MAC_TIMER) {
> Timer::reset();
> CPU::sie(CPU::STI);
> }
> Reg interrupt_id =3D 1 << ((id & IC::INT_MASK) - 2);
> if(CPU::int_enabled() && (CPU::sie() & (interrupt_id)))
> CPU::mip(interrupt_id);
> }
>
>
> [Flags]
> -machine virt -cpu rv32gcsu-v1.10.0 -smp $(CPUS) -m $(MEM_SIZE)k -serial
> mon:stdio -bios none -nographic -no-reboot -kernel
>
> Where, for now, CPUS=3D1 and MEM_SIZE ends up totalling 128Mb.
>
> Thanks very much for your attention,
> Alek Frohlich.
>
> ps: I was not sure if this was the correct medium to post this question;
> if it was not, I apologize.
> ps2: If needed, I can attach the current version of the kernel I mentione=
d.
>

--00000000000018f91e05bf3ca8db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It is also worth noting that mideleg[5] (MTI) <a href=3D"h=
ttps://groups.google.com/a/groups.riscv.org/g/isa-dev/c/iJqwTw2hIRk/m/A6io8=
iWWBQAJ">should be delegatable</a>; however, <a href=3D"https://github.com/=
qemu/qemu/blob/25d75c99b2e5941c67049ee776efdb226414f4c6/target/riscv/csr.c#=
L395">it is not</a>. I&#39;ve also tested in the qemu I have (I am using a =
pre compiled version; the only thing I know is that it is v5.0 with risc32-=
softmmu), and<div><br><div><div style=3D"line-height:19px"><div style=3D"co=
lor:rgb(212,212,212);font-family:&quot;Droid Sans Mono&quot;,monospace,mono=
space,&quot;Droid Sans Fallback&quot;;font-size:14px;white-space:pre;backgr=
ound-color:rgb(30,30,30)"><span style=3D"color:rgb(78,201,176)">CPU</span>:=
:<span style=3D"color:rgb(220,220,170)">mideleg_write</span>(<span style=3D=
"color:rgb(78,201,176)">CPU</span>::MTI);</div><div style=3D"line-height:19=
px"><br></div>does nothing (mideleg continues to be 0 after the csrw).</div=
></div></div><div style=3D"line-height:19px"><br></div><div style=3D"line-h=
eight:19px">Is this a bug? If it is not, then what is the reason for=C2=A0t=
his?</div><div style=3D"line-height:19px"><br></div><div style=3D"line-heig=
ht:19px">Thanks, again,</div><div style=3D"line-height:19px">Alek.</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Mon, Apr 5, 2021 at 1:08 PM Alek Fr=C3=B6hlich &lt;<a href=3D"mailto:alek.f=
rohlich@gmail.com">alek.frohlich@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hello all,<div><=
br></div><div>I am implementing a C++ Micro Kernel for RISCV, and I am havi=
ng trouble to arrive at a good solution for the handling of timer interrupt=
s.</div><div><br></div><div>I&#39;d desire to run the entire system (after =
its setup phase) in supervisor/user mode, but, as it seems, there is no way=
 to make the CLINT generate STI interrupt requests so that mideleg can auto=
matically forward them to the S-mode handler pointed by stvec.</div><div><b=
r></div><div>I took this conclusion based on two pieces of evidence:</div><=
div><ol><li>The RISCV privileged specification (version 1.10) lets it be un=
derstood that the bit MTI (on MIP) is hardwired to the comparison=C2=A0(mti=
me &gt;=3D mtimecmp)?</li><li>The QEMU implementation of Sifive&#39;s CLINT=
 doesn&#39;t perform any tests (e.g., &quot;am I configured to cause S-Mode=
 IRQs&quot;?) before issuing a MTI request (see <a href=3D"https://github.c=
om/qemu/qemu/blob/25d75c99b2e5941c67049ee776efdb226414f4c6/hw/intc/sifive_c=
lint.c#L54" target=3D"_blank">this</a>)</li></ol></div><div>Then, the only =
solution I found was to always let the STI bit on SIP turned on and to let =
a M-mode handler turn the corresponding SIE bit (the S-mode handler is resp=
onsible for clearing this bit so as to avoid looping on STI IRQs).</div><di=
v><br></div><div>This is not very satisfying; are there any other alternati=
ves that would allow my kernel to have a preemptive scheduler without the n=
eed of ever switching back to M-mode?</div><div><br></div><div>After all, s=
witching to M-mode after the setup has all kinds of unnecessary=C2=A0compli=
cations; to name one, consider the scenario where the M-mode handler has to=
 save some of the process&#39; context before being able to perform its tas=
k (this is currently the case; I&#39;ve left a picture of my actual M-mode =
handler below). In this scenario, a stack must be used; but which stack? $s=
p, at the time the handler starts executing, points to a virtual address th=
at, in my case, isn&#39;t even valid physical memory. Hence, one must also =
set aside a kernel stack for handling M-mode interrupts.</div><div><br></di=
v><div>Of course, later when I have syscalls implemented, there will be ano=
ther need for such kstack; however, that is only to illustrate my point.</d=
iv><div><br></div><div>[Handler; how would you even take advantage of __att=
ribute__((interrupt)) if you had to fiddle with $sp before saving context?]=
</div><div><br></div><div><div style=3D"color:rgb(212,212,212);background-c=
olor:rgb(30,30,30);font-family:&quot;Droid Sans Mono&quot;,monospace,monosp=
ace,&quot;Droid Sans Fallback&quot;;font-size:14px;line-height:19px;white-s=
pace:pre-wrap"><div><span style=3D"color:rgb(86,156,214)">extern</span> <sp=
an style=3D"color:rgb(206,145,120)">&quot;C&quot;</span> [[<span style=3D"c=
olor:rgb(78,201,176)">gnu</span>::<span style=3D"color:rgb(78,201,176)">int=
errupt</span>, <span style=3D"color:rgb(78,201,176)">gnu</span>::<span styl=
e=3D"color:rgb(78,201,176)">aligned</span>(4)]] <span style=3D"color:rgb(86=
,156,214)">void</span> <span style=3D"color:rgb(220,220,170)">_mmode_forwar=
d</span>() {</div><div>    <span style=3D"color:rgb(78,201,176)">Reg</span>=
 <span style=3D"color:rgb(156,220,254)">id</span> =3D <span style=3D"color:=
rgb(78,201,176)">CPU</span>::<span style=3D"color:rgb(220,220,170)">mcause<=
/span>();</div><div>    <span style=3D"color:rgb(197,134,192)">if</span>((<=
span style=3D"color:rgb(156,220,254)">id</span> &amp; <span style=3D"color:=
rgb(78,201,176)">IC</span>::INT_MASK) =3D=3D <span style=3D"color:rgb(78,20=
1,176)">CLINT</span>::IRQ_MAC_TIMER) {</div><div>        <span style=3D"col=
or:rgb(78,201,176)">Timer</span>::<span style=3D"color:rgb(220,220,170)">re=
set</span>();</div><div>        <span style=3D"color:rgb(78,201,176)">CPU</=
span>::<span style=3D"color:rgb(220,220,170)">sie</span>(<span style=3D"col=
or:rgb(78,201,176)">CPU</span>::STI);</div><div>    }</div><div>    <span s=
tyle=3D"color:rgb(78,201,176)">Reg</span> <span style=3D"color:rgb(156,220,=
254)">interrupt_id</span> =3D <span style=3D"color:rgb(181,206,168)">1</spa=
n> &lt;&lt; ((<span style=3D"color:rgb(156,220,254)">id</span> &amp; <span =
style=3D"color:rgb(78,201,176)">IC</span>::INT_MASK) - <span style=3D"color=
:rgb(181,206,168)">2</span>);</div><div>    <span style=3D"color:rgb(197,13=
4,192)">if</span>(<span style=3D"color:rgb(78,201,176)">CPU</span>::<span s=
tyle=3D"color:rgb(220,220,170)">int_enabled</span>() &amp;&amp; (<span styl=
e=3D"color:rgb(78,201,176)">CPU</span>::<span style=3D"color:rgb(220,220,17=
0)">sie</span>() &amp; (<span style=3D"color:rgb(156,220,254)">interrupt_id=
</span>)))</div><div>        <span style=3D"color:rgb(78,201,176)">CPU</spa=
n>::<span style=3D"color:rgb(220,220,170)">mip</span>(<span style=3D"color:=
rgb(156,220,254)">interrupt_id</span>);</div><div>}</div></div></div><div><=
br></div><div><br></div><div>[Flags]</div><div>-machine virt -cpu rv32gcsu-=
v1.10.0 -smp $(CPUS) -m $(MEM_SIZE)k -serial mon:stdio -bios none -nographi=
c -no-reboot -kernel<br></div><div><br></div><div>Where, for now, CPUS=3D1 =
and MEM_SIZE ends up totalling 128Mb.</div><div><br></div><div>Thanks very =
much for your attention,</div><div>Alek Frohlich.</div><div><br></div><div>=
ps: I was not sure if this was the correct medium to post this question; if=
 it was not, I apologize.</div><div>ps2: If needed, I can attach the curren=
t version of the kernel I mentioned.</div></div>
</blockquote></div>

--00000000000018f91e05bf3ca8db--

