Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nfEUU-0002EV-V2
	for mharc-qemu-riscv@gnu.org; Fri, 15 Apr 2022 01:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nfEUQ-0002Dy-3k
 for qemu-riscv@nongnu.org; Fri, 15 Apr 2022 01:27:27 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nfEUN-0007HZ-VK
 for qemu-riscv@nongnu.org; Fri, 15 Apr 2022 01:27:25 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 z6-20020a17090a398600b001cb9fca3210so7579009pjb.1
 for <qemu-riscv@nongnu.org>; Thu, 14 Apr 2022 22:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JT6vTnq/Pe82P9vd3QHFgqGZvPvWmQVBdNC/yLFQBBg=;
 b=a7eiyHg+fOIRr2KQDyzBhF5nKlqxM5ttBbLLjQVJb9RhOrXftjpJo00R8iAcTJdYyw
 Oqm6SpnIthZAv0d3ENHfmZfi51ZFGr0E2IUxTxYGU4IVAJ10eEueGVyaltXdAXrCNJ29
 BHfh8ZunbPCCgXx+/WB3OurUTsJ33X+wL+Cz+t4dgC04pg8FIyOSRjb5KbiRj76kf6MZ
 S/OjK3jBAdsM7LNiOy3y+9wjkWiipaLdAxWrNiYif9a7QpkCvdcnXKRt0T/WyrAmZJ6r
 ikmRxQQMZMSSlOK4hTaIcjEZWmmANT7HIwrxxADFt2HvzvsZ7JsDAt2R73TwE9OhiYje
 9l6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JT6vTnq/Pe82P9vd3QHFgqGZvPvWmQVBdNC/yLFQBBg=;
 b=X8xmGf/hzzCDbSesL+iHSjctkwfbaO1+ethEqflTKEHsacoTtVQtinqRqLCcVCQHBE
 X+P87Q6REzRSU8hEFU1Pn9x9jtD8654Q1rGN3yRaRQxrEBjl3djBW8123YeKPjqtZrDz
 9fHORerNnXjtQBsVD8yukJjzSa/VCrgajkH5F21FAL5lB1bN3STc7kGahw9qnBN14EmD
 0f+wotnpbVAJBPVfP/eGYGxGtOe5xvYkJTCcW3zK1LcdlRuimgYxCNGAxzztQhBUzGRS
 EqhT3vkNdf8obPHlGntJhpBMqfKdBUsY1uaTMOhw62C3cl8sYhs2PXKcq/3LcEbW05eO
 UoFg==
X-Gm-Message-State: AOAM531q4EwwOZ+8t2pizsUvVC1RHfIwL/Egegh7ci4V31nqOMZ+OHSq
 7LqW5PNSUMEQ8tYMmUpiOizvaRWh0pcE+A==
X-Google-Smtp-Source: ABdhPJxR5hE6jYXZGKEb2a1Jin74IJ0WXD1l4kWSM4WOZ20vs7u1l9M40o+9oeqiXrzvcuRKZkpXBA==
X-Received: by 2002:a17:903:2451:b0:158:6d0d:bdb3 with SMTP id
 l17-20020a170903245100b001586d0dbdb3mr21273027pls.61.1650000440421; 
 Thu, 14 Apr 2022 22:27:20 -0700 (PDT)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com.
 [209.85.215.170]) by smtp.gmail.com with ESMTPSA id
 bm27-20020a656e9b000000b0039e5d327f78sm3460936pgb.44.2022.04.14.22.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 22:27:19 -0700 (PDT)
Received: by mail-pg1-f170.google.com with SMTP id k29so6530497pgm.12;
 Thu, 14 Apr 2022 22:27:19 -0700 (PDT)
X-Received: by 2002:a65:4b84:0:b0:382:65ea:bb10 with SMTP id
 t4-20020a654b84000000b0038265eabb10mr5072478pgq.50.1650000439056; Thu, 14 Apr
 2022 22:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220414155510.1364147-1-niklas.cassel@wdc.com>
In-Reply-To: <20220414155510.1364147-1-niklas.cassel@wdc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 15 Apr 2022 13:27:07 +0800
X-Gmail-Original-Message-ID: <CANzO1D0-0nh6uyxexRpL534r9A2w0Ricngdv8cFyzUd95AnrQQ@mail.gmail.com>
Message-ID: <CANzO1D0-0nh6uyxexRpL534r9A2w0Ricngdv8cFyzUd95AnrQQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: fix DT property mmu-type when CPU mmu
 option is disabled
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000000ca2cf05dcaaaa4f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 15 Apr 2022 05:27:27 -0000

--0000000000000ca2cf05dcaaaa4f
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 14, 2022 at 11:57 PM Niklas Cassel via <qemu-devel@nongnu.org>
wrote:

> The device tree property "mmu-type" is currently exported as either
> "riscv,sv32" or "riscv,sv48".
>
> However, the riscv cpu device tree binding [1] has a specific value
> "riscv,none" for a HART without a MMU.
>
> Set the device tree property "mmu-type" to "riscv,none" when the CPU mmu
> option is disabled using rv32,mmu=off or rv64,mmu=off.
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/riscv/cpus.yaml?h=v5.17
>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  hw/riscv/virt.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index da50cbed43..3be6be9ad3 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -230,8 +230,14 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,
> int socket,
>          cpu_name = g_strdup_printf("/cpus/cpu@%d",
>              s->soc[socket].hartid_base + cpu);
>          qemu_fdt_add_subnode(mc->fdt, cpu_name);
> -        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> -            (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
> +        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> +                          RISCV_FEATURE_MMU)) {
> +            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> +                                    (is_32_bit) ? "riscv,sv32" :
> "riscv,sv48");
> +        } else {
> +            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> +                                    "riscv,none");
> +        }
>          name = riscv_isa_string(&s->soc[socket].harts[cpu]);
>          qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
>          g_free(name);
> --
> 2.35.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--0000000000000ca2cf05dcaaaa4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Apr 14, 2022 at 11:57 PM Niklas Casse=
l via &lt;<a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The=
 device tree property &quot;mmu-type&quot; is currently exported as either<=
br>
&quot;riscv,sv32&quot; or &quot;riscv,sv48&quot;.<br>
<br>
However, the riscv cpu device tree binding [1] has a specific value<br>
&quot;riscv,none&quot; for a HART without a MMU.<br>
<br>
Set the device tree property &quot;mmu-type&quot; to &quot;riscv,none&quot;=
 when the CPU mmu<br>
option is disabled using rv32,mmu=3Doff or rv64,mmu=3Doff.<br>
<br>
[1] <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git/tree/Documentation/devicetree/bindings/riscv/cpus.yaml?h=3Dv5.17" re=
l=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/linux/ker=
nel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/riscv/cpu=
s.yaml?h=3Dv5.17</a><br>
<br>
Signed-off-by: Niklas Cassel &lt;<a href=3D"mailto:niklas.cassel@wdc.com" t=
arget=3D"_blank">niklas.cassel@wdc.com</a>&gt;<br>
---<br>
=C2=A0hw/riscv/virt.c | 10 ++++++++--<br>
=C2=A01 file changed, 8 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c<br>
index da50cbed43..3be6be9ad3 100644<br>
--- a/hw/riscv/virt.c<br>
+++ b/hw/riscv/virt.c<br>
@@ -230,8 +230,14 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, =
int socket,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_name =3D g_strdup_printf(&quot;/cpus/=
cpu@%d&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;soc[socket].hartid_ba=
se + cpu);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_fdt_add_subnode(mc-&gt;fdt, cpu_name=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(mc-&gt;fdt, cpu_name, =
&quot;mmu-type&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (is_32_bit) ? &quot;riscv,sv32&q=
uot; : &quot;riscv,sv48&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_feature(&amp;s-&gt;soc[socket].harts=
[cpu].env,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 RISCV_FEATURE_MMU)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(mc-&gt;f=
dt, cpu_name, &quot;mmu-type&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (is_32_bit) ? &quot;ri=
scv,sv32&quot; : &quot;riscv,sv48&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(mc-&gt;f=
dt, cpu_name, &quot;mmu-type&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;riscv,none&quot;=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D riscv_isa_string(&amp;s-&gt;soc[=
socket].harts[cpu]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_fdt_setprop_string(mc-&gt;fdt, cpu_n=
ame, &quot;riscv,isa&quot;, name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(name);<br>
-- <br>
2.35.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&gt;=C2=A0</di=
v></div></div>

--0000000000000ca2cf05dcaaaa4f--

