Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuW8R-0000Bs-Lf
	for mharc-qemu-riscv@gnu.org; Wed, 30 Dec 2020 02:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sylvain.pelissier@gmail.com>)
 id 1kuW8P-0000B6-Ry; Wed, 30 Dec 2020 02:43:05 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sylvain.pelissier@gmail.com>)
 id 1kuW8N-0001ZL-UF; Wed, 30 Dec 2020 02:43:05 -0500
Received: by mail-ej1-x62a.google.com with SMTP id g20so20970175ejb.1;
 Tue, 29 Dec 2020 23:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sNXJIheqruGF+MzYZKYf6nU73TSEzWxlDdTECQXnOsc=;
 b=OsghoqpigfHbXTOafiAuyYQEMJ1dklmXhUksHBSc7Cg0OS5e1kXTfebfj9gW5dY+hL
 Kg0Fa1hjOIHd3KXrIzrR42SK0uUj26QUtrWEGBwGbLceEMKv3aOOei+ZklGkH8nt1xzi
 /xXgTLtvy5ZYZrMofx5cMCD8y/JWLUzZxstjoKygR6oyZrJMSNo06rpFsQod4d8ZKip+
 Gl4+d449Jg7ob1KNFzuyA/n3d/1FrYnXwrMN2xgSlIwH+TYCgmyTsgKrpOhQP6EKKG27
 1PHYOMhUrXTyku3Yh1Fl2+HyZAfPmDBedGCuK3T1SwuGGIyeipvHUdn6YUvdcwnegkO8
 L2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sNXJIheqruGF+MzYZKYf6nU73TSEzWxlDdTECQXnOsc=;
 b=k38+/eRvvVVeeMlshNjwXxczakeAdd+hpyNkYbo2yFZ2U8eL5NfAbZY3K9XhglyVos
 /KP2XwpMcZgzH6+J6EYp+bD4LPXPBCePDpWgBEKoV7qjUaifn/dao44VbDNaVSXXA3zY
 QomQOYyDfi6WYIPjbiNdibEsTxvpFAXWEoLMTa8IU0oGgYwPlUfE2UV/GGrdqsibEbdR
 5xOonoxpR410OGEznpYbb3uZ1Tbsmnoa9TojlfVRWsGjtxxy5y9I/MOEqEEQFUJ0WRAt
 FeGuOaQoIX6NxNZ+Ed6LEzpYSmmwN2b+sYw5lBlhTl84dhVkEat6PRFghJd6fs4JBLMX
 GnkA==
X-Gm-Message-State: AOAM531ytXlv9MfD4LVG3nrOyEHPiNeJ9ObfREer9xFoKdFkVzyWN3z7
 kDeNbNtC4oQmrNlLKhbZOYRdyU+Em3h739yeI/c=
X-Google-Smtp-Source: ABdhPJzKAHjwr0jNIpbq//nCMYOjw1x0LJdXEAd+hWRXNvPdNEBIRh5Y2gFVfFWsF/2iY/KNv7LQvd6pN5uE3nnjPTQ=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr48521836ejr.482.1609314176999; 
 Tue, 29 Dec 2020 23:42:56 -0800 (PST)
MIME-Version: 1.0
References: <CAOkUe-DTG1yU-z4SF-+nBeEJUWdx5gctLMSNp8f1+_7FpWG4aA@mail.gmail.com>
 <CAEUhbmV5oMNW3fS7v81vgB-j0NbAnRnMB-ehm5BT8rk4uWGdYg@mail.gmail.com>
 <CAOkUe-BWEVpzwHLPzUMzuUK12RQdUds-tCEWcyhrZeWDh9AaHw@mail.gmail.com>
 <CAEUhbmWcNqNMzipVvYMgVsJH7dTwZv8qMYFdpzvCSNRGVH0NsA@mail.gmail.com>
In-Reply-To: <CAEUhbmWcNqNMzipVvYMgVsJH7dTwZv8qMYFdpzvCSNRGVH0NsA@mail.gmail.com>
From: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Date: Wed, 30 Dec 2020 08:42:46 +0100
Message-ID: <CAOkUe-DyJLEiHK4hmxEtfVwTV_3rb-RXAgRS2Ojtk5krctVBGA@mail.gmail.com>
Subject: Re: [PATCH] gdb: riscv: Add target description
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: multipart/alternative; boundary="000000000000da258d05b7a9a767"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=sylvain.pelissier@gmail.com; helo=mail-ej1-x62a.google.com
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
X-List-Received-Date: Wed, 30 Dec 2020 07:43:06 -0000

--000000000000da258d05b7a9a767
Content-Type: text/plain; charset="UTF-8"

Target description is not currently implemented in RISC-V architecture.
Thus GDB won't set it properly when attached. The patch implements the
target description response.

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

On Wed, 30 Dec 2020 at 01:26, Bin Meng <bmeng.cn@gmail.com> wrote:

> Hi Sylvain,
>
> On Wed, Dec 30, 2020 at 12:37 AM Sylvain Pelissier
> <sylvain.pelissier@gmail.com> wrote:
> >
> > Thank you for your remark here is the new patch:
>
> This should not be put into the commit message.
>
> Previous commit message is missing.
>
> >
> > Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
> > ---
> >  target/riscv/cpu.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
>
> Regards,
> Bin
>

--000000000000da258d05b7a9a767
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Target description is not currently implemented in RI=
SC-V architecture. Thus GDB won&#39;t set it properly when attached. The pa=
tch implements the target description response.<br><br>Signed-off-by: Sylva=
in Pelissier &lt;<a href=3D"mailto:sylvain.pelissier@gmail.com">sylvain.pel=
issier@gmail.com</a>&gt;<br>---<br>=C2=A0target/riscv/cpu.c | 13 ++++++++++=
+++<br>=C2=A01 file changed, 13 insertions(+)<br><br>diff --git a/target/ri=
scv/cpu.c b/target/riscv/cpu.c<br>index 254cd83f8b..ed4971978b 100644<br>--=
- a/target/riscv/cpu.c<br>+++ b/target/riscv/cpu.c<br>@@ -556,6 +556,18 @@ =
static Property riscv_cpu_properties[] =3D {<br>=C2=A0 =C2=A0 =C2=A0DEFINE_=
PROP_END_OF_LIST(),<br>=C2=A0};<br>=C2=A0<br>+static gchar *riscv_gdb_arch_=
name(CPUState *cs)<br>+{<br>+ =C2=A0 =C2=A0RISCVCPU *cpu =3D RISCV_CPU(cs);=
<br>+ =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu-&gt;env;<br>+<br>+ =C2=
=A0 =C2=A0if (riscv_cpu_is_32bit(env)) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn g_strdup(&quot;riscv:rv32&quot;);<br>+ =C2=A0 =C2=A0} else {<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0return g_strdup(&quot;riscv:rv64&quot;);<br>+ =C2=
=A0 =C2=A0}<br>+}<br>+<br>=C2=A0static void riscv_cpu_class_init(ObjectClas=
s *c, void *data)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0RISCVCPUClass *mcc =3D =
RISCV_CPU_CLASS(c);<br>@@ -591,6 +603,7 @@ static void riscv_cpu_class_init=
(ObjectClass *c, void *data)<br>=C2=A0 =C2=A0 =C2=A0/* For now, mark unmigr=
atable: */<br>=C2=A0 =C2=A0 =C2=A0cc-&gt;vmsd =3D &amp;vmstate_riscv_cpu;<b=
r>=C2=A0#endif<br>+ =C2=A0 =C2=A0cc-&gt;gdb_arch_name =3D riscv_gdb_arch_na=
me;<br>=C2=A0#ifdef CONFIG_TCG<br>=C2=A0 =C2=A0 =C2=A0cc-&gt;tcg_initialize=
 =3D riscv_translate_init;<br>=C2=A0 =C2=A0 =C2=A0cc-&gt;tlb_fill =3D riscv=
_cpu_tlb_fill;<br>-- <br>2.25.1</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, 30 Dec 2020 at 01:26, Bin Meng=
 &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Sylvain,<br=
>
<br>
On Wed, Dec 30, 2020 at 12:37 AM Sylvain Pelissier<br>
&lt;<a href=3D"mailto:sylvain.pelissier@gmail.com" target=3D"_blank">sylvai=
n.pelissier@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Thank you for your remark here is the new patch:<br>
<br>
This should not be put into the commit message.<br>
<br>
Previous commit message is missing.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Sylvain Pelissier &lt;<a href=3D"mailto:sylvain.pelissi=
er@gmail.com" target=3D"_blank">sylvain.pelissier@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu.c | 13 +++++++++++++<br>
&gt;=C2=A0 1 file changed, 13 insertions(+)<br>
&gt;<br>
<br>
Regards,<br>
Bin<br>
</blockquote></div>

--000000000000da258d05b7a9a767--

