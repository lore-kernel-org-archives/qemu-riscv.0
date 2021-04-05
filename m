Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lTRrp-00052X-GC
	for mharc-qemu-riscv@gnu.org; Mon, 05 Apr 2021 12:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alek.frohlich@gmail.com>)
 id 1lTRmO-0002vX-Ie
 for qemu-riscv@nongnu.org; Mon, 05 Apr 2021 12:08:44 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:37807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alek.frohlich@gmail.com>)
 id 1lTRmM-0006PN-HH
 for qemu-riscv@nongnu.org; Mon, 05 Apr 2021 12:08:44 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so11823822otr.4
 for <qemu-riscv@nongnu.org>; Mon, 05 Apr 2021 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=MNxv98ezek59O+mXmwCrjTw9UDIlojcjYnGfeqmiBWs=;
 b=tSZxrAhNHBGYtg6lhirZ41nt6UiKQRrxboYUWcS199WLFjcSz8z3gKJill1oTwzFe5
 5J4gQCrBnnqGIq8eUrR3r7fqzUZtVILf0yX7xNmsOFv6Qdgtf0l5z8N+DrH4LwM5tffm
 5xnM3MbONZZ+I1vR5zVxSuZxxvrouJP69/UVe+RFsO+uoO5E6FznxJHwjfRm3CXKEOPt
 k14w0nTaQcsjKddIoJHfc/M6yNneOXOZNWdyiptk7w6djaR6YR+720U9B7uZpven1KRv
 0BoWz+ALyR5DYH//pXPo8xlSpemHzELy5AjK+Ju6FnSaqb9j0xPVNLoRgdN2wuRPC5X9
 Kx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MNxv98ezek59O+mXmwCrjTw9UDIlojcjYnGfeqmiBWs=;
 b=uccy2aCHAfFX6ZDXVuwl6bORAACPL0WqBy0PwKW8rgV+3k/0wgS4DSSOh3bfiOJjvR
 9PVMC78YZx9mJEO5Jc0gyfRp7GIKqkod8WlyPTBAdpGaVV78aCr+m0F69O78LZGi/pSv
 GzpVoO65KRb4/qMknMQF20HHSodhryVHa83SzS8mnB6hEzlECVuZMfvLQK+wKMHKA6sd
 sgiX9I+Em/FyJuoii1zVSgUzqV3mS9NdMLbFj+yrg2gu+pBLuNYgnrFTYTzPxlCwi08q
 2lVUmCfmUIPjB5kJ13r8b1Bn8SheFXOiNIPytqYClvMJ4Q0i45EdVNuJPOzm4h1aYQlw
 LM0Q==
X-Gm-Message-State: AOAM532b+F93DqXcFoeXzcAhQj+3VKyWN/jq7ovfHuxMk4GqTNPsCOPb
 NuLsOoSDNBiPPPqv9BeSRyomFhdQBf87AtEn9YcqeWjzkaIlrg==
X-Google-Smtp-Source: ABdhPJx9r9gVy8EyHF5XlHM/zEZd7X7uTdPJrHjZ8Q8fZgmaixyPFgovKoVxz576n3O9eDmNMaiqiwXl+t8KZPODxUA=
X-Received: by 2002:a9d:4048:: with SMTP id o8mr22417530oti.152.1617638920542; 
 Mon, 05 Apr 2021 09:08:40 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Alek_Fr=C3=B6hlich?= <alek.frohlich@gmail.com>
Date: Mon, 5 Apr 2021 13:08:29 -0300
Message-ID: <CABkyU4UkLY8D_kAH_p=P5TPiWcQ-NiJ_1JSsc_X1e=_1xOCcuQ@mail.gmail.com>
Subject: Handling Timer Interrupts in Supervisor Mode (machine virt)
To: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003bde8e05bf3be9bd"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=alek.frohlich@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 05 Apr 2021 12:14:20 -0400
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
X-List-Received-Date: Mon, 05 Apr 2021 16:08:44 -0000

--0000000000003bde8e05bf3be9bd
Content-Type: text/plain; charset="UTF-8"

Hello all,

I am implementing a C++ Micro Kernel for RISCV, and I am having trouble to
arrive at a good solution for the handling of timer interrupts.

I'd desire to run the entire system (after its setup phase) in
supervisor/user mode, but, as it seems, there is no way to make the CLINT
generate STI interrupt requests so that mideleg can automatically forward
them to the S-mode handler pointed by stvec.

I took this conclusion based on two pieces of evidence:

   1. The RISCV privileged specification (version 1.10) lets it be
   understood that the bit MTI (on MIP) is hardwired to the comparison (mtime
   >= mtimecmp)?
   2. The QEMU implementation of Sifive's CLINT doesn't perform any tests
   (e.g., "am I configured to cause S-Mode IRQs"?) before issuing a MTI
   request (see this
   <https://github.com/qemu/qemu/blob/25d75c99b2e5941c67049ee776efdb226414f4c6/hw/intc/sifive_clint.c#L54>
   )

Then, the only solution I found was to always let the STI bit on SIP turned
on and to let a M-mode handler turn the corresponding SIE bit (the S-mode
handler is responsible for clearing this bit so as to avoid looping on STI
IRQs).

This is not very satisfying; are there any other alternatives that would
allow my kernel to have a preemptive scheduler without the need of ever
switching back to M-mode?

After all, switching to M-mode after the setup has all kinds of
unnecessary complications; to name one, consider the scenario where the
M-mode handler has to save some of the process' context before being able
to perform its task (this is currently the case; I've left a picture of my
actual M-mode handler below). In this scenario, a stack must be used; but
which stack? $sp, at the time the handler starts executing, points to a
virtual address that, in my case, isn't even valid physical memory. Hence,
one must also set aside a kernel stack for handling M-mode interrupts.

Of course, later when I have syscalls implemented, there will be another
need for such kstack; however, that is only to illustrate my point.

[Handler; how would you even take advantage of __attribute__((interrupt))
if you had to fiddle with $sp before saving context?]

extern "C" [[gnu::interrupt, gnu::aligned(4)]] void _mmode_forward() {
Reg id = CPU::mcause();
if((id & IC::INT_MASK) == CLINT::IRQ_MAC_TIMER) {
Timer::reset();
CPU::sie(CPU::STI);
}
Reg interrupt_id = 1 << ((id & IC::INT_MASK) - 2);
if(CPU::int_enabled() && (CPU::sie() & (interrupt_id)))
CPU::mip(interrupt_id);
}


[Flags]
-machine virt -cpu rv32gcsu-v1.10.0 -smp $(CPUS) -m $(MEM_SIZE)k -serial
mon:stdio -bios none -nographic -no-reboot -kernel

Where, for now, CPUS=1 and MEM_SIZE ends up totalling 128Mb.

Thanks very much for your attention,
Alek Frohlich.

ps: I was not sure if this was the correct medium to post this question; if
it was not, I apologize.
ps2: If needed, I can attach the current version of the kernel I mentioned.

--0000000000003bde8e05bf3be9bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<div><br></div><div>I am implementing a C++ Micr=
o Kernel for RISCV, and I am having trouble to arrive at a good solution fo=
r the handling of timer interrupts.</div><div><br></div><div>I&#39;d desire=
 to run the entire system (after its setup phase) in supervisor/user mode, =
but, as it seems, there is no way to make the CLINT generate STI interrupt =
requests so that mideleg can automatically forward them to the S-mode handl=
er pointed by stvec.</div><div><br></div><div>I took this conclusion based =
on two pieces of evidence:</div><div><ol><li>The RISCV privileged specifica=
tion (version 1.10) lets it be understood that the bit MTI (on MIP) is hard=
wired to the comparison=C2=A0(mtime &gt;=3D mtimecmp)?</li><li>The QEMU imp=
lementation of Sifive&#39;s CLINT doesn&#39;t perform any tests (e.g., &quo=
t;am I configured to cause S-Mode IRQs&quot;?) before issuing a MTI request=
 (see <a href=3D"https://github.com/qemu/qemu/blob/25d75c99b2e5941c67049ee7=
76efdb226414f4c6/hw/intc/sifive_clint.c#L54">this</a>)</li></ol></div><div>=
Then, the only solution I found was to always let the STI bit on SIP turned=
 on and to let a M-mode handler turn the corresponding SIE bit (the S-mode =
handler is responsible for clearing this bit so as to avoid looping on STI =
IRQs).</div><div><br></div><div>This is not very satisfying; are there any =
other alternatives that would allow my kernel to have a preemptive schedule=
r without the need of ever switching back to M-mode?</div><div><br></div><d=
iv>After all, switching to M-mode after the setup has all kinds of unnecess=
ary=C2=A0complications; to name one, consider the scenario where the M-mode=
 handler has to save some of the process&#39; context before being able to =
perform its task (this is currently the case; I&#39;ve left a picture of my=
 actual M-mode handler below). In this scenario, a stack must be used; but =
which stack? $sp, at the time the handler starts executing, points to a vir=
tual address that, in my case, isn&#39;t even valid physical memory. Hence,=
 one must also set aside a kernel stack for handling M-mode interrupts.</di=
v><div><br></div><div>Of course, later when I have syscalls implemented, th=
ere will be another need for such kstack; however, that is only to illustra=
te my point.</div><div><br></div><div>[Handler; how would you even take adv=
antage of __attribute__((interrupt)) if you had to fiddle with $sp before s=
aving context?]</div><div><br></div><div><div style=3D"color:rgb(212,212,21=
2);background-color:rgb(30,30,30);font-family:&quot;Droid Sans Mono&quot;,m=
onospace,monospace,&quot;Droid Sans Fallback&quot;;font-size:14px;line-heig=
ht:19px;white-space:pre"><div><span style=3D"color:rgb(86,156,214)">extern<=
/span> <span style=3D"color:rgb(206,145,120)">&quot;C&quot;</span> [[<span =
style=3D"color:rgb(78,201,176)">gnu</span>::<span style=3D"color:rgb(78,201=
,176)">interrupt</span>, <span style=3D"color:rgb(78,201,176)">gnu</span>::=
<span style=3D"color:rgb(78,201,176)">aligned</span>(4)]] <span style=3D"co=
lor:rgb(86,156,214)">void</span> <span style=3D"color:rgb(220,220,170)">_mm=
ode_forward</span>() {</div><div>    <span style=3D"color:rgb(78,201,176)">=
Reg</span> <span style=3D"color:rgb(156,220,254)">id</span> =3D <span style=
=3D"color:rgb(78,201,176)">CPU</span>::<span style=3D"color:rgb(220,220,170=
)">mcause</span>();</div><div>    <span style=3D"color:rgb(197,134,192)">if=
</span>((<span style=3D"color:rgb(156,220,254)">id</span> &amp; <span style=
=3D"color:rgb(78,201,176)">IC</span>::INT_MASK) =3D=3D <span style=3D"color=
:rgb(78,201,176)">CLINT</span>::IRQ_MAC_TIMER) {</div><div>        <span st=
yle=3D"color:rgb(78,201,176)">Timer</span>::<span style=3D"color:rgb(220,22=
0,170)">reset</span>();</div><div>        <span style=3D"color:rgb(78,201,1=
76)">CPU</span>::<span style=3D"color:rgb(220,220,170)">sie</span>(<span st=
yle=3D"color:rgb(78,201,176)">CPU</span>::STI);</div><div>    }</div><div> =
   <span style=3D"color:rgb(78,201,176)">Reg</span> <span style=3D"color:rg=
b(156,220,254)">interrupt_id</span> =3D <span style=3D"color:rgb(181,206,16=
8)">1</span> &lt;&lt; ((<span style=3D"color:rgb(156,220,254)">id</span> &a=
mp; <span style=3D"color:rgb(78,201,176)">IC</span>::INT_MASK) - <span styl=
e=3D"color:rgb(181,206,168)">2</span>);</div><div>    <span style=3D"color:=
rgb(197,134,192)">if</span>(<span style=3D"color:rgb(78,201,176)">CPU</span=
>::<span style=3D"color:rgb(220,220,170)">int_enabled</span>() &amp;&amp; (=
<span style=3D"color:rgb(78,201,176)">CPU</span>::<span style=3D"color:rgb(=
220,220,170)">sie</span>() &amp; (<span style=3D"color:rgb(156,220,254)">in=
terrupt_id</span>)))</div><div>        <span style=3D"color:rgb(78,201,176)=
">CPU</span>::<span style=3D"color:rgb(220,220,170)">mip</span>(<span style=
=3D"color:rgb(156,220,254)">interrupt_id</span>);</div><div>}</div></div></=
div><div><br></div><div><br></div><div>[Flags]</div><div>-machine virt -cpu=
 rv32gcsu-v1.10.0 -smp $(CPUS) -m $(MEM_SIZE)k -serial mon:stdio -bios none=
 -nographic -no-reboot -kernel<br></div><div><br></div><div>Where, for now,=
 CPUS=3D1 and MEM_SIZE ends up totalling 128Mb.</div><div><br></div><div>Th=
anks very much for your attention,</div><div>Alek Frohlich.</div><div><br><=
/div><div>ps: I was not sure if this was the correct medium to post this qu=
estion; if it was not, I apologize.</div><div>ps2: If needed, I can attach =
the current version of the kernel I mentioned.</div></div>

--0000000000003bde8e05bf3be9bd--

