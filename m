Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuWnI-0005zJ-EW
	for mharc-qemu-riscv@gnu.org; Wed, 30 Dec 2020 03:25:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sylvain.pelissier@gmail.com>)
 id 1kuWnG-0005xj-8e; Wed, 30 Dec 2020 03:25:18 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sylvain.pelissier@gmail.com>)
 id 1kuWnD-00043w-Ek; Wed, 30 Dec 2020 03:25:18 -0500
Received: by mail-ej1-x632.google.com with SMTP id d17so20979689ejy.9;
 Wed, 30 Dec 2020 00:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=WQ8bLW7cr5KTrvIry59MV6MtdzFLx/Pgowc2nu7UzM4=;
 b=kokY6ff3xzKJDWci1kOn2PelBp6wnrJ9woVzkywGvTNJiaS+VT4ja8z22Qv9m1NbBG
 zsiiKV37MLfMlD0QOZ3RmSj1uwrpkgcvN0BOwSrBiVv3jws7qYm0Y6JSqNUyaWRBDHrP
 3YJBjKUE9xEHeaCOIXouI3obpCatre+zpLot2Lqjm+p2e+YmzCs6eD00oQAg/y/vSRxY
 aBZNyE0mBvjpcJXnmvLgISWsikKSjwZGwoZnqzx/I4RATAv4dgxJkCbsas3sMXQMEvm7
 ChLNvd8+Ak3aY8T+DBDwgMegAXvr+Wn38lkvbFvWaEOze1aVw3PWNKtb4C5UZOBQtUDO
 fqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=WQ8bLW7cr5KTrvIry59MV6MtdzFLx/Pgowc2nu7UzM4=;
 b=Kt6VoAZKlpNJkUhY9pCSvccdii5BO5F3T+pxnMN+JY8IgXvc4Sd4MzT8rp/WlzuPd6
 tMezTrTgjRQzDaKhrWyHYI9Feo8dJSjYkKVHA/mhzvj5LQPKfUNK41w8gquXtbTBpmar
 8TPHuokHg/bcPBWNh0zxbrK9yuy5Qxi1KJUvpWdjq42GdlPubD3ezuwuIAwGxFqvsEav
 1HQOlRDkP+cOoU+KuDzJeZANJdKV0NknnYbZe8jVkPcKlHgZcqhGGQE/PQ/SK8xGJGOA
 Wbqt5mq33+E+oT+VpRyEgTMVeK71+UXYYQLD35ecLg7V32yVgsvGYM1AEr+FD/OKpFQz
 sa5Q==
X-Gm-Message-State: AOAM530XQZie8sz4pTg0W5+cIAEL9WpHJsxq5OsDwMlU+t93MNl8nxJf
 0RrKUGcI+ef2iMkB3PAccBj3pTzGhhHOHnG0IT91wVsv64+6sg==
X-Google-Smtp-Source: ABdhPJwVKRgw2pm0mrB0cBbzIwnTjzrimfu8dvWCP7Ucz95SuS0FhPMcCxIBCTpIO6MnAwRZWjKv4tfyyaD0A2ZwYSc=
X-Received: by 2002:a17:906:518a:: with SMTP id
 y10mr49740268ejk.323.1609316713219; 
 Wed, 30 Dec 2020 00:25:13 -0800 (PST)
MIME-Version: 1.0
From: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Date: Wed, 30 Dec 2020 09:25:02 +0100
Message-ID: <CAOkUe-BGMmUTtY8bdTgi2Vrmq-pL2O36bY_kmE5rfbv0SQTJmA@mail.gmail.com>
Subject: [PATCH v2] gdb: riscv: Add target description
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000005c81105b7aa3fbd"
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
X-List-Received-Date: Wed, 30 Dec 2020 08:25:18 -0000

--00000000000005c81105b7aa3fbd
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

--00000000000005c81105b7aa3fbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Target description is not currently implemented in RISC-V =
architecture. Thus GDB won&#39;t set it properly when attached. The patch i=
mplements the target description response.<br><br>Signed-off-by: Sylvain Pe=
lissier &lt;<a href=3D"mailto:sylvain.pelissier@gmail.com">sylvain.pelissie=
r@gmail.com</a>&gt;<br>---<br>=C2=A0target/riscv/cpu.c | 13 +++++++++++++<b=
r>=C2=A01 file changed, 13 insertions(+)<br><br>diff --git a/target/riscv/c=
pu.c b/target/riscv/cpu.c<br>index 254cd83f8b..ed4971978b 100644<br>--- a/t=
arget/riscv/cpu.c<br>+++ b/target/riscv/cpu.c<br>@@ -556,6 +556,18 @@ stati=
c Property riscv_cpu_properties[] =3D {<br>=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_=
END_OF_LIST(),<br>=C2=A0};<br>=C2=A0<br>+static gchar *riscv_gdb_arch_name(=
CPUState *cs)<br>+{<br>+ =C2=A0 =C2=A0RISCVCPU *cpu =3D RISCV_CPU(cs);<br>+=
 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu-&gt;env;<br>+<br>+ =C2=A0 =C2=
=A0if (riscv_cpu_is_32bit(env)) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return g_=
strdup(&quot;riscv:rv32&quot;);<br>+ =C2=A0 =C2=A0} else {<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return g_strdup(&quot;riscv:rv64&quot;);<br>+ =C2=A0 =C2=
=A0}<br>+}<br>+<br>=C2=A0static void riscv_cpu_class_init(ObjectClass *c, v=
oid *data)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0RISCVCPUClass *mcc =3D RISCV_C=
PU_CLASS(c);<br>@@ -591,6 +603,7 @@ static void riscv_cpu_class_init(Object=
Class *c, void *data)<br>=C2=A0 =C2=A0 =C2=A0/* For now, mark unmigratable:=
 */<br>=C2=A0 =C2=A0 =C2=A0cc-&gt;vmsd =3D &amp;vmstate_riscv_cpu;<br>=C2=
=A0#endif<br>+ =C2=A0 =C2=A0cc-&gt;gdb_arch_name =3D riscv_gdb_arch_name;<b=
r>=C2=A0#ifdef CONFIG_TCG<br>=C2=A0 =C2=A0 =C2=A0cc-&gt;tcg_initialize =3D =
riscv_translate_init;<br>=C2=A0 =C2=A0 =C2=A0cc-&gt;tlb_fill =3D riscv_cpu_=
tlb_fill;<br>-- <br>2.25.1</div>

--00000000000005c81105b7aa3fbd--

