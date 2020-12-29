Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuHzn-0005rR-G1
	for mharc-qemu-riscv@gnu.org; Tue, 29 Dec 2020 11:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sylvain.pelissier@gmail.com>)
 id 1kuHzk-0005r4-SB; Tue, 29 Dec 2020 11:37:12 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:46862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sylvain.pelissier@gmail.com>)
 id 1kuHzh-00021D-Ca; Tue, 29 Dec 2020 11:37:11 -0500
Received: by mail-ed1-x532.google.com with SMTP id b73so13051704edf.13;
 Tue, 29 Dec 2020 08:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2XT2FdV5wWIy/gTC3KJ+nwVAuXNYihAu5Q3n90B8RKw=;
 b=i3u0h2ysY19JrO9kfr0QTLVj2evGA26yTPfOOMJORBY21sBSpqO8rH/+g7Ad9iz5cl
 WOOt4L9YZ8hJde9d7lZ6E9njFDE/EF6C2dMmynGAgd5nGlFeUHkYgOSzY7TUFQEczkLD
 5Y6aTJERss78cnLhATHDWmkoaex2mAQN5v6fCCnXf7du+PuFrMjXwIGr4og1Z0rnkXTp
 uMDf11aj2qDxAdcLG8JMoaEuuwiWIwOw2SH+g9HlDvCcQN4deepKc56Als0JET3MIP0s
 PZuAFSsxQPk6rqKrIwx3p1XN1IKd9sFWuxwkFnwjMxBobvWtFfw+HgdlIj02NdaWXOIJ
 zmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2XT2FdV5wWIy/gTC3KJ+nwVAuXNYihAu5Q3n90B8RKw=;
 b=NetWVzd54GsrwRyz8kjP5tSxQI5nFQ1Zu3Dns1csSj2ufb3mzbawrKE5w+vQg4dwvS
 OUJNotCK6horfcu5lpTPeUJx65+k5YVvs/Px1yoS3qWxEkw+y7YEVTI771XEliiuAwK8
 CZh01kS0XTufi2gE2k5EOg5OZ9HR7s1EIs3rX2zdOXDAiqJbTI/Ir/MVOswycX8bI9z2
 wT3hNhPoj7u608jS9QB0DnoAEDZE37xXgUIuMW3I1dZZySeJ5ZI2PvEC4bh6O5QAu1SQ
 qULv31R5XKgfByIEuQT1aLOgb3Vn0gWRCESwK7muVtRt4/TyAU7SL3qZ6EZJpAp3dJtE
 v8JA==
X-Gm-Message-State: AOAM530Cdxz30o1KCX+crUUNOkI/0LmECnM0+INmEu2tef9Je0rq1LX5
 4Q1MaTee139Y7IUyJ1siQKiDbk2x7um7gr68UnY=
X-Google-Smtp-Source: ABdhPJz/l2PGiFQPF6H9suh+lcfNDUS/pCElZTrd3BMyMdS3KUmFsQqtK3dM62eed+/yPwCnyVcvA/fXBFBRPgEKreA=
X-Received: by 2002:aa7:dc0d:: with SMTP id b13mr46979854edu.170.1609259826415; 
 Tue, 29 Dec 2020 08:37:06 -0800 (PST)
MIME-Version: 1.0
References: <CAOkUe-DTG1yU-z4SF-+nBeEJUWdx5gctLMSNp8f1+_7FpWG4aA@mail.gmail.com>
 <CAEUhbmV5oMNW3fS7v81vgB-j0NbAnRnMB-ehm5BT8rk4uWGdYg@mail.gmail.com>
In-Reply-To: <CAEUhbmV5oMNW3fS7v81vgB-j0NbAnRnMB-ehm5BT8rk4uWGdYg@mail.gmail.com>
From: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Date: Tue, 29 Dec 2020 17:36:55 +0100
Message-ID: <CAOkUe-BWEVpzwHLPzUMzuUK12RQdUds-tCEWcyhrZeWDh9AaHw@mail.gmail.com>
Subject: Re: [PATCH] gdb: riscv: Add target description
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: multipart/alternative; boundary="0000000000004e0a8b05b79d00ba"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=sylvain.pelissier@gmail.com; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Tue, 29 Dec 2020 16:37:13 -0000

--0000000000004e0a8b05b79d00ba
Content-Type: text/plain; charset="UTF-8"

Thank you for your remark here is the new patch:

Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
---
 target/riscv/cpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 254cd83f8b..ed4971978b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -556,6 +556,18 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };

+static gchar *riscv_gdb_arch_name(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
+    if (riscv_cpu_is_32bit(env)) {
+        return g_strdup("riscv:rv32");
+    } else {
+        return g_strdup("riscv:rv64");
+    }
+}
+
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
@@ -591,6 +603,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void
*data)
     /* For now, mark unmigratable: */
     cc->vmsd = &vmstate_riscv_cpu;
 #endif
+    cc->gdb_arch_name = riscv_gdb_arch_name;
 #ifdef CONFIG_TCG
     cc->tcg_initialize = riscv_translate_init;
     cc->tlb_fill = riscv_cpu_tlb_fill;
-- 
2.25.1

Regards

Sylvain

On Tue, 29 Dec 2020 at 05:11, Bin Meng <bmeng.cn@gmail.com> wrote:

> On Thu, Dec 24, 2020 at 1:09 AM Sylvain Pelissier
> <sylvain.pelissier@gmail.com> wrote:
> >
> > Target description is not currently implemented in RISC-V architecture.
> Thus GDB won't set it properly when attached. The patch implements the
> target description response.
> >
> > Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
> > ---
> >  target/riscv/cpu.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 254cd83f8b..489d66038c 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -556,6 +556,15 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > +static gchar *riscv_gdb_arch_name(CPUState *cs)
> > +{
> > +    #ifdef TARGET_RISCV64
>
> Use riscv_cpu_is_32bit() instead of #ifdefs
>
> > +        return g_strdup("riscv:rv64");
> > +    #else
> > +        return g_strdup("riscv:rv32");
> > +    #endif
> > +}
> > +
> >  static void riscv_cpu_class_init(ObjectClass *c, void *data)
> >  {
> >      RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
> > @@ -591,6 +600,7 @@ static void riscv_cpu_class_init(ObjectClass *c,
> void *data)
> >      /* For now, mark unmigratable: */
> >      cc->vmsd = &vmstate_riscv_cpu;
> >  #endif
> > +    cc->gdb_arch_name = riscv_gdb_arch_name;
> >  #ifdef CONFIG_TCG
> >      cc->tcg_initialize = riscv_translate_init;
> >      cc->tlb_fill = riscv_cpu_tlb_fill;
> > --
>
> Regards,
> Bin
>

--0000000000004e0a8b05b79d00ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you for your remark here is the new patch:</div=
><div><br></div><div>Signed-off-by: Sylvain Pelissier &lt;<a href=3D"mailto=
:sylvain.pelissier@gmail.com">sylvain.pelissier@gmail.com</a>&gt;<br>---<br=
>=C2=A0target/riscv/cpu.c | 13 +++++++++++++<br>=C2=A01 file changed, 13 in=
sertions(+)<br><br>diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>=
index 254cd83f8b..ed4971978b 100644<br>--- a/target/riscv/cpu.c<br>+++ b/ta=
rget/riscv/cpu.c<br>@@ -556,6 +556,18 @@ static Property riscv_cpu_properti=
es[] =3D {<br>=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>=C2=A0};<br=
>=C2=A0<br>+static gchar *riscv_gdb_arch_name(CPUState *cs)<br>+{<br>+ =C2=
=A0 =C2=A0RISCVCPU *cpu =3D RISCV_CPU(cs);<br>+ =C2=A0 =C2=A0CPURISCVState =
*env =3D &amp;cpu-&gt;env;<br>+<br>+ =C2=A0 =C2=A0if (riscv_cpu_is_32bit(en=
v)) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return g_strdup(&quot;riscv:rv32&quot=
;);<br>+ =C2=A0 =C2=A0} else {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return g_str=
dup(&quot;riscv:rv64&quot;);<br>+ =C2=A0 =C2=A0}<br>+}<br>+<br>=C2=A0static=
 void riscv_cpu_class_init(ObjectClass *c, void *data)<br>=C2=A0{<br>=C2=A0=
 =C2=A0 =C2=A0RISCVCPUClass *mcc =3D RISCV_CPU_CLASS(c);<br>@@ -591,6 +603,=
7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)<br>=C2=A0=
 =C2=A0 =C2=A0/* For now, mark unmigratable: */<br>=C2=A0 =C2=A0 =C2=A0cc-&=
gt;vmsd =3D &amp;vmstate_riscv_cpu;<br>=C2=A0#endif<br>+ =C2=A0 =C2=A0cc-&g=
t;gdb_arch_name =3D riscv_gdb_arch_name;<br>=C2=A0#ifdef CONFIG_TCG<br>=C2=
=A0 =C2=A0 =C2=A0cc-&gt;tcg_initialize =3D riscv_translate_init;<br>=C2=A0 =
=C2=A0 =C2=A0cc-&gt;tlb_fill =3D riscv_cpu_tlb_fill;<br>-- <br>2.25.1</div>=
<div><br></div><div>Regards</div><div><br></div><div>Sylvain<br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tu=
e, 29 Dec 2020 at 05:11, Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com"=
>bmeng.cn@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Thu, Dec 24, 2020 at 1:09 AM Sylvain Pelissier<br>
&lt;<a href=3D"mailto:sylvain.pelissier@gmail.com" target=3D"_blank">sylvai=
n.pelissier@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Target description is not currently implemented in RISC-V architecture=
. Thus GDB won&#39;t set it properly when attached. The patch implements th=
e target description response.<br>
&gt;<br>
&gt; Signed-off-by: Sylvain Pelissier &lt;<a href=3D"mailto:sylvain.pelissi=
er@gmail.com" target=3D"_blank">sylvain.pelissier@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu.c | 10 ++++++++++<br>
&gt;=C2=A0 1 file changed, 10 insertions(+)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index 254cd83f8b..489d66038c 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -556,6 +556,15 @@ static Property riscv_cpu_properties[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; +static gchar *riscv_gdb_arch_name(CPUState *cs)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 #ifdef TARGET_RISCV64<br>
<br>
Use riscv_cpu_is_32bit() instead of #ifdefs<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup(&quot;riscv:rv64&quot;);<=
br>
&gt; +=C2=A0 =C2=A0 #else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup(&quot;riscv:rv32&quot;);<=
br>
&gt; +=C2=A0 =C2=A0 #endif<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static void riscv_cpu_class_init(ObjectClass *c, void *data)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RISCVCPUClass *mcc =3D RISCV_CPU_CLASS(c);<br>
&gt; @@ -591,6 +600,7 @@ static void riscv_cpu_class_init(ObjectClass *c, v=
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
<br>
Regards,<br>
Bin<br>
</blockquote></div>

--0000000000004e0a8b05b79d00ba--

