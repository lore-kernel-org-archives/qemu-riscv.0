Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kx6NO-0007Nf-5F
	for mharc-qemu-riscv@gnu.org; Wed, 06 Jan 2021 05:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sylvain.pelissier@gmail.com>)
 id 1kx6NM-0007L3-1U; Wed, 06 Jan 2021 05:49:12 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:41234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sylvain.pelissier@gmail.com>)
 id 1kx6NK-00083y-5H; Wed, 06 Jan 2021 05:49:11 -0500
Received: by mail-ej1-x632.google.com with SMTP id ce23so4393023ejb.8;
 Wed, 06 Jan 2021 02:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rYxrkY1Vg1qhjgyKGXyH+TpXbM370Q0d0V9Y74JKT6I=;
 b=CFFlzue96V4QAu0E6KZC0p5PwZVSmkWF5/RINTMZYZbu9DkjL4D84H+CkhuucUIHvR
 +mx7Ajcp0EYbWWcmjs8JokSK270ynwtngvK0etZyfH+BVfAQ1DEunexyN6kOBi6gmPGj
 E+0qm5Z52j3sj25yBSCBgwITQRneojuGxpJP8PIBo+aqLEw4l8Jq4zoQURFfHzHgMzZX
 x4aS/bqqz1rOxjj8DmK3fL0CPKSNdbEVIuhim65ywTjGkmiRpuaf9Kd+N+xSnY73Mjr1
 LFUF1OfPdV9AtMlMuXr74XHYGXjdVZI3hM76u/umWZ1wi5TAJ6TlvUk88YpIFQSNVlMw
 LI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rYxrkY1Vg1qhjgyKGXyH+TpXbM370Q0d0V9Y74JKT6I=;
 b=LixZh7dwA+lWPxv9I1oDr90hZai/0jsovkehE+7v76jHTnSeDSvbzXLDHw5DpE+Vb5
 e/7NEIm3+teic0fKo0fWZVH3ULozvqluPgQgNocdhVHcuvNV5g6zAS07hSoqdnwS60KY
 aaYymNNWI/wtBjuYOOTQSrqP/+TQozZIFbxFKHLhV1d7RW8BTkIp7dVHeoDnc2zrcvQB
 HDUj1To28mp6S0thooNSqeNWdtzeb9xw4pV4Nk3ZRNe0b2jfmX9uUEHhh4v0NTTsae1a
 ECNmO4EdlPyL0vjT0qce3frS/rY1EP+J3suM5p6saN5zHdXT3tJDt6MZEYMBlcmde6ZD
 H83w==
X-Gm-Message-State: AOAM5327D542BvtXHj57Akvu3MkWiw1SKdKGLUV3rfCk/eegbACbUrDX
 H7gV9v8Jg0cCOgyhEJg5Y+JuoHWSTvgBNHgoXGM=
X-Google-Smtp-Source: ABdhPJzltZ+R+5A4mBSKJus0Lvyaym1GXxBwXB3lH3HGV0JktvhofNrBrjLUiKpk9uDgXA80q174YXwQMZUCWtEZjY4=
X-Received: by 2002:a17:906:d9cf:: with SMTP id
 qk15mr2587859ejb.453.1609930148372; 
 Wed, 06 Jan 2021 02:49:08 -0800 (PST)
MIME-Version: 1.0
References: <CAOkUe-BGMmUTtY8bdTgi2Vrmq-pL2O36bY_kmE5rfbv0SQTJmA@mail.gmail.com>
 <CAKmqyKO-7x9Ea9xKuAAm5Z0b8zLr0Xqhrwya43iqByhxjeDCGw@mail.gmail.com>
In-Reply-To: <CAKmqyKO-7x9Ea9xKuAAm5Z0b8zLr0Xqhrwya43iqByhxjeDCGw@mail.gmail.com>
From: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Date: Wed, 6 Jan 2021 11:48:57 +0100
Message-ID: <CAOkUe-AqC4UXOPZeX+uyXqucF12AaW_76oDqgn6EE-PomckYjA@mail.gmail.com>
Subject: Re: [PATCH v2] gdb: riscv: Add target description
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009b65d805b8391276"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=sylvain.pelissier@gmail.com; helo=mail-ej1-x632.google.com
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
X-List-Received-Date: Wed, 06 Jan 2021 10:49:12 -0000

--0000000000009b65d805b8391276
Content-Type: text/plain; charset="UTF-8"

Hello,

I may have made an error by copy pasting the comment into the file. I sent
a new v3 with git send-email. I hope it is fine now.
Regards

Sylvain

On Tue, 5 Jan 2021 at 22:03, Alistair Francis <alistair23@gmail.com> wrote:

> On Wed, Dec 30, 2020 at 12:26 AM Sylvain Pelissier
> <sylvain.pelissier@gmail.com> wrote:
> >
> > Target description is not currently implemented in RISC-V architecture.
> Thus GDB won't set it properly when attached. The patch implements the
> target description response.
> >
> > Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
>
> Hello,
>
> This patch fails to apply. How did you send the email?
>
> Alistair
>
> > ---
> >  target/riscv/cpu.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 254cd83f8b..ed4971978b 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -556,6 +556,18 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > +static gchar *riscv_gdb_arch_name(CPUState *cs)
> > +{
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > +    CPURISCVState *env = &cpu->env;
> > +
> > +    if (riscv_cpu_is_32bit(env)) {
> > +        return g_strdup("riscv:rv32");
> > +    } else {
> > +        return g_strdup("riscv:rv64");
> > +    }
> > +}
> > +
> >  static void riscv_cpu_class_init(ObjectClass *c, void *data)
> >  {
> >      RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
> > @@ -591,6 +603,7 @@ static void riscv_cpu_class_init(ObjectClass *c,
> void *data)
> >      /* For now, mark unmigratable: */
> >      cc->vmsd = &vmstate_riscv_cpu;
> >  #endif
> > +    cc->gdb_arch_name = riscv_gdb_arch_name;
> >  #ifdef CONFIG_TCG
> >      cc->tcg_initialize = riscv_translate_init;
> >      cc->tlb_fill = riscv_cpu_tlb_fill;
> > --
> > 2.25.1
>

--0000000000009b65d805b8391276
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I may have made an error by copy=
 pasting the comment into the file. I sent a new v3 with git send-email. I =
hope it is fine now.</div><div>Regards</div><div><br></div><div>Sylvain</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, 5 Jan 2021 at 22:03, Alistair Francis &lt;<a href=3D"mailto:alist=
air23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Wed, Dec 30, 2020 at 12:26 AM Sylva=
in Pelissier<br>
&lt;<a href=3D"mailto:sylvain.pelissier@gmail.com" target=3D"_blank">sylvai=
n.pelissier@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Target description is not currently implemented in RISC-V architecture=
. Thus GDB won&#39;t set it properly when attached. The patch implements th=
e target description response.<br>
&gt;<br>
&gt; Signed-off-by: Sylvain Pelissier &lt;<a href=3D"mailto:sylvain.pelissi=
er@gmail.com" target=3D"_blank">sylvain.pelissier@gmail.com</a>&gt;<br>
<br>
Hello,<br>
<br>
This patch fails to apply. How did you send the email?<br>
<br>
Alistair<br>
<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu.c | 13 +++++++++++++<br>
&gt;=C2=A0 1 file changed, 13 insertions(+)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index 254cd83f8b..ed4971978b 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -556,6 +556,18 @@ static Property riscv_cpu_properties[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; +static gchar *riscv_gdb_arch_name(CPUState *cs)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt; +=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (riscv_cpu_is_32bit(env)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup(&quot;riscv:rv32&quot;);<=
br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup(&quot;riscv:rv64&quot;);<=
br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static void riscv_cpu_class_init(ObjectClass *c, void *data)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RISCVCPUClass *mcc =3D RISCV_CPU_CLASS(c);<br>
&gt; @@ -591,6 +603,7 @@ static void riscv_cpu_class_init(ObjectClass *c, v=
oid *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* For now, mark unmigratable: */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cc-&gt;vmsd =3D &amp;vmstate_riscv_cpu;<br>
&gt;=C2=A0 #endif<br>
&gt; +=C2=A0 =C2=A0 cc-&gt;gdb_arch_name =3D riscv_gdb_arch_name;<br>
&gt;=C2=A0 #ifdef CONFIG_TCG<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cc-&gt;tcg_initialize =3D riscv_translate_init;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 cc-&gt;tlb_fill =3D riscv_cpu_tlb_fill;<br>
&gt; --<br>
&gt; 2.25.1<br>
</blockquote></div>

--0000000000009b65d805b8391276--

