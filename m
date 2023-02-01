Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pND79-0000AR-TQ
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 08:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pND6c-0007uS-Rd
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 08:24:57 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pND5r-0004a8-Rq
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 08:24:09 -0500
Received: by mail-lf1-x12b.google.com with SMTP id x40so29184704lfu.12
 for <qemu-riscv@nongnu.org>; Wed, 01 Feb 2023 05:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lS2CvRnhHoLVexaa0r8i5N4BCfxWMaqXPJGrSY94m3A=;
 b=XNKBHOPubJrNVb4yQ/Ljd5mhjN9G1DRNPtpNXYsOsdwv6g03EDI7qV5nUd/+m6tX99
 EC49f0bPlw3fmZ6bIU7k5KRU4u+WPM0UBhv1oMWgc+UFw7+81iVmR+EwcKPBVUFfkfvs
 Y19TKGr2jw8kyFY9qNXKch2B/zI4/ipCT0sv0Cc6Hff2YM5jU279nHWesdmhHLoANcK0
 e72+FaolMbi9vxJtLBebRgJySPKkibuLc/jYV72UUMO+BmXN/RdKWr27Vw1ZuGUUJ4kc
 nrpq9iZmbyUxG10HgRer/oofJ5NjcMjieK/A0/yjJB1TV+sF4IVr1mFes5sgVSQ8OgC5
 37QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lS2CvRnhHoLVexaa0r8i5N4BCfxWMaqXPJGrSY94m3A=;
 b=1aO/rulF0n7etjgec5HtmCACNQodnttawEhz6bDAOHExxNs3FKJT9ukHaKZCjm+dW/
 CdBTm5fn+cHlGYi4RFCzSgUuolow0QMo23Xri0XFJ6cRlJujt7FTnZVmfVyx1OiWd19u
 4wt4MHTrhDfkABvzknom+i7nHYPCoOpHjfWdotPXPvgEFa0MBx2PetH7KchAV5AU+FJv
 nF5SLa3xFQPihdkedLjw72zKBjD6WGKwC4Fij4b1BFvkCetIK92W1Xs2used2tG5RJFA
 MkJG1PS8FrWYZSVqHJ9YOtIlfiF7OSoPeuq3gCWKtemJwW8aqCA8jGdmIedUKUCY3iwU
 stxg==
X-Gm-Message-State: AO0yUKUEU9JpjM3Lgw//BOUqU5+MepcZHl55WGiYQPRZXmhczrHvvuBR
 EwrZdUw9JyFqoOAqga57oGyb1/us3OVimvqhVfO+ROhd2sv1EbqQm4Z/x6UaAhDnujWrDonMKqb
 jHYDAPE+nKc06ZPdBYepJWmAOnSFkGpU2cRtLqkfnBbM/7e7YVtnkAk/etX8LNvg1/0ij+6eyAE
 Wavg==
X-Google-Smtp-Source: AK7set+eiPewEGZCeMyjTruBEfJc3rdgvSOieu4IXyJFpGwxwC0nFol9b2IuiaV0vb4DhdoW0n6jHA==
X-Received: by 2002:ac2:4903:0:b0:4b5:6649:eb6c with SMTP id
 n3-20020ac24903000000b004b56649eb6cmr436652lfi.25.1675257845796; 
 Wed, 01 Feb 2023 05:24:05 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 y20-20020ac24474000000b004d57d1c6ee7sm1167384lfl.248.2023.02.01.05.24.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 05:24:05 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id x40so29184589lfu.12;
 Wed, 01 Feb 2023 05:24:04 -0800 (PST)
X-Received: by 2002:a19:6a11:0:b0:4d8:6127:6dcb with SMTP id
 u17-20020a196a11000000b004d861276dcbmr328391lfu.145.1675257844456; Wed, 01
 Feb 2023 05:24:04 -0800 (PST)
MIME-Version: 1.0
References: <20230131133906.1956228-1-alexghiti@rivosinc.com>
 <20230131133906.1956228-6-alexghiti@rivosinc.com>
In-Reply-To: <20230131133906.1956228-6-alexghiti@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 1 Feb 2023 21:23:52 +0800
X-Gmail-Original-Message-ID: <CANzO1D1s5_7F9D5h=RSy5JgceyLpObWsyPuhtNT58mLsLxrpzA@mail.gmail.com>
Message-ID: <CANzO1D1s5_7F9D5h=RSy5JgceyLpObWsyPuhtNT58mLsLxrpzA@mail.gmail.com>
Subject: Re: [PATCH v9 5/5] riscv: Correctly set the device-tree entry
 'mmu-type'
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Bin Meng <bmeng@tinylab.org>
Content-Type: multipart/alternative; boundary="000000000000b9e36e05f3a35cd9"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 01 Feb 2023 13:25:03 -0000

--000000000000b9e36e05f3a35cd9
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Tue, Jan 31, 2023 at 10:36 PM Alexandre Ghiti <alexghiti@rivosinc.com>
wrote:

> The 'mmu-type' should reflect what the hardware is capable of so use the
> new satp_mode field in RISCVCPUConfig to do that.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> ---
>  hw/riscv/virt.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 94ff2a1584..48d034a5f7 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -228,7 +228,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,
> int socket,
>      int cpu;
>      uint32_t cpu_phandle;
>      MachineState *mc = MACHINE(s);
> -    char *name, *cpu_name, *core_name, *intc_name;
> +    uint8_t satp_mode_max;
> +    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
>
>      for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
>          cpu_phandle = (*phandle)++;
> @@ -236,14 +237,14 @@ static void create_fdt_socket_cpus(RISCVVirtState
> *s, int socket,
>          cpu_name = g_strdup_printf("/cpus/cpu@%d",
>              s->soc[socket].hartid_base + cpu);
>          qemu_fdt_add_subnode(mc->fdt, cpu_name);
> -        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> -                          RISCV_FEATURE_MMU)) {
> -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> -                                    (is_32_bit) ? "riscv,sv32" :
> "riscv,sv48");
> -        } else {
> -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> -                                    "riscv,none");
> -        }
> +
> +        satp_mode_max = satp_mode_max_from_map(
> +                            s->soc[socket].harts[cpu].cfg.satp_mode.map);
> +        sv_name = g_strdup_printf("riscv,%s",
> +                                  satp_mode_str(satp_mode_max,
> is_32_bit));
> +        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
> +        g_free(sv_name);
> +
>          name = riscv_isa_string(&s->soc[socket].harts[cpu]);
>          qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
>          g_free(name);
> --
> 2.37.2
>
>
>

--000000000000b9e36e05f3a35cd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 31, 2023 at 10:36 PM=
 Alexandre Ghiti &lt;<a href=3D"mailto:alexghiti@rivosinc.com">alexghiti@ri=
vosinc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The &#39;mmu-type&#39; should reflect what the hardware is capab=
le of so use the<br>
new satp_mode field in RISCVCPUConfig to do that.<br>
<br>
Signed-off-by: Alexandre Ghiti &lt;<a href=3D"mailto:alexghiti@rivosinc.com=
" target=3D"_blank">alexghiti@rivosinc.com</a>&gt;<br>
Reviewed-by: Andrew Jones &lt;<a href=3D"mailto:ajones@ventanamicro.com" ta=
rget=3D"_blank">ajones@ventanamicro.com</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng@tinylab.org" target=3D"_b=
lank">bmeng@tinylab.org</a>&gt;<br>
---<br>
=C2=A0hw/riscv/virt.c | 19 ++++++++++---------<br>
=C2=A01 file changed, 10 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c<br>
index 94ff2a1584..48d034a5f7 100644<br>
--- a/hw/riscv/virt.c<br>
+++ b/hw/riscv/virt.c<br>
@@ -228,7 +228,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, i=
nt socket,<br>
=C2=A0 =C2=A0 =C2=A0int cpu;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t cpu_phandle;<br>
=C2=A0 =C2=A0 =C2=A0MachineState *mc =3D MACHINE(s);<br>
-=C2=A0 =C2=A0 char *name, *cpu_name, *core_name, *intc_name;<br>
+=C2=A0 =C2=A0 uint8_t satp_mode_max;<br>
+=C2=A0 =C2=A0 char *name, *cpu_name, *core_name, *intc_name, *sv_name;<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (cpu =3D s-&gt;soc[socket].num_harts - 1; cpu &gt;=
=3D 0; cpu--) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_phandle =3D (*phandle)++;<br>
@@ -236,14 +237,14 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,=
 int socket,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_name =3D g_strdup_printf(&quot;/cpus/=
cpu@%d&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;soc[socket].hartid_ba=
se + cpu);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_fdt_add_subnode(mc-&gt;fdt, cpu_name=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_feature(&amp;s-&gt;soc[socket].harts=
[cpu].env,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 RISCV_FEATURE_MMU)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(mc-&gt;f=
dt, cpu_name, &quot;mmu-type&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (is_32_bit) ? &quot;ri=
scv,sv32&quot; : &quot;riscv,sv48&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(mc-&gt;f=
dt, cpu_name, &quot;mmu-type&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;riscv,none&quot;=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 satp_mode_max =3D satp_mode_max_from_map(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;soc[socket].harts[cpu].cfg.satp_mode.map);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sv_name =3D g_strdup_printf(&quot;riscv,%s&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 satp_mode_str(satp_mode_max, =
is_32_bit));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(mc-&gt;fdt, cpu_name, =
&quot;mmu-type&quot;, sv_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(sv_name);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D riscv_isa_string(&amp;s-&gt;soc[=
socket].harts[cpu]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_fdt_setprop_string(mc-&gt;fdt, cpu_n=
ame, &quot;riscv,isa&quot;, name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(name);<br>
-- <br>
2.37.2<br>
<br>
<br>
</blockquote></div>

--000000000000b9e36e05f3a35cd9--

