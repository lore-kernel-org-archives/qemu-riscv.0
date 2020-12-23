Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ks7bP-0002KI-VU
	for mharc-qemu-riscv@gnu.org; Wed, 23 Dec 2020 12:07:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sylvain.pelissier@gmail.com>)
 id 1ks701-00088U-Aa; Wed, 23 Dec 2020 11:28:29 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:38810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sylvain.pelissier@gmail.com>)
 id 1ks6zz-0006FY-Pp; Wed, 23 Dec 2020 11:28:29 -0500
Received: by mail-ed1-x52d.google.com with SMTP id cw27so16751065edb.5;
 Wed, 23 Dec 2020 08:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=tp6cAhQ6bC+F9AdbGmF40NgniF1lEuyW8r53rI/N8IU=;
 b=V7A013Faw3pNvERhCEfeGSpUsjSwG6r5sKy9exZG9U4rY+peKhY63CG8OORdUm0r39
 YgfzccKzzJFa33icLC1Gq9W80aTirOqj1yq9L7DiQUo/p2Vhfv8gRgVHTIdZwe9jBQQo
 mTqp0bRL/cJN893UB5XzXzuOIxNvDPOwFIRJSS3GTJXKe3TG63/LwcRcgKB7pxq5R8mc
 YCRk5Q+nm6moRX7nIWe6coDrLiLWS9N5uB3I/Y3+D6AqAvjXfMoUtmdooiLGCK6YHvWE
 nqqBMr+V5Ep6uk++D3fylLuIeI589RMUhCuFnvLVaiTg5ILg0MW7HJ/JzFDjk3f1+Gsa
 1dEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=tp6cAhQ6bC+F9AdbGmF40NgniF1lEuyW8r53rI/N8IU=;
 b=GBC8nczr77xg4Hd3CdwsBnjlL7lFifNeqV2H8xJOueMSB5wdsbhC/Rq5QypZFeXyRZ
 EFf57P0romBwMneV8DvHEA1E/5Uc1KwmQdU6lS6zFngRH5F9PgkMbV7uV/f10nzZAfIx
 hR7jF3tCpJIQodPsfIjkPVIUnYzOhE6RH/2SB1Q3FaOqk1kJaEJExv8+3BlMm5OEP6K6
 sZVvET/RgqzzDPPTnL3pJffB0cJGzbVPe/kAPt6a95D65lGO7hhA7VxlwdE3Kf3XhkmV
 mV8v3cj2B0gXaR5FGS4tIE2/SIzqRhO9XYRmlLV5YD9pVigGQXIrIMcdkh/TE/h87U2v
 HT2A==
X-Gm-Message-State: AOAM533JXSHNckcLS2gB597x/AFm7uPpu1ualS1FtQNTa51W94plQsKp
 zsvqT73oXjaJipWt4qitFgTBwYCKShFfEolHBHlMKI0rtHV9OPLT
X-Google-Smtp-Source: ABdhPJw22FaUFN/xLPF3zT5RxluO4CiPxt0zlMqkOK4CQXLs5dm+v8XKoyOPyFDUD8jLMpTu/SfKU5i2uOXwlk+4OeE=
X-Received: by 2002:aa7:d5d2:: with SMTP id d18mr26168140eds.126.1608740904744; 
 Wed, 23 Dec 2020 08:28:24 -0800 (PST)
MIME-Version: 1.0
From: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Date: Wed, 23 Dec 2020 17:28:13 +0100
Message-ID: <CAOkUe-DTG1yU-z4SF-+nBeEJUWdx5gctLMSNp8f1+_7FpWG4aA@mail.gmail.com>
Subject: [PATCH] gdb: riscv: Add target description
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: multipart/alternative; boundary="00000000000029bb1505b7242e5f"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=sylvain.pelissier@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 23 Dec 2020 12:07:06 -0500
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
X-List-Received-Date: Wed, 23 Dec 2020 16:28:29 -0000

--00000000000029bb1505b7242e5f
Content-Type: text/plain; charset="UTF-8"

Target description is not currently implemented in RISC-V architecture.
Thus GDB won't set it properly when attached. The patch implements the
target description response.

Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
---
 target/riscv/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 254cd83f8b..489d66038c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -556,6 +556,15 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };

+static gchar *riscv_gdb_arch_name(CPUState *cs)
+{
+    #ifdef TARGET_RISCV64
+        return g_strdup("riscv:rv64");
+    #else
+        return g_strdup("riscv:rv32");
+    #endif
+}
+
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
@@ -591,6 +600,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void
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

--00000000000029bb1505b7242e5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Target description is not currently implemented in RI=
SC-V architecture. Thus GDB won&#39;t set it properly when attached. The pa=
tch implements the target description response.<br></div><div><br></div><di=
v>Signed-off-by: Sylvain Pelissier &lt;<a href=3D"mailto:sylvain.pelissier@=
gmail.com">sylvain.pelissier@gmail.com</a>&gt;<br>---<br>=C2=A0target/riscv=
/cpu.c | 10 ++++++++++<br>=C2=A01 file changed, 10 insertions(+)<br><br>dif=
f --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>index 254cd83f8b..489d=
66038c 100644<br>--- a/target/riscv/cpu.c<br>+++ b/target/riscv/cpu.c<br>@@=
 -556,6 +556,15 @@ static Property riscv_cpu_properties[] =3D {<br>=C2=A0 =
=C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>=C2=A0};<br>=C2=A0<br>+static gc=
har *riscv_gdb_arch_name(CPUState *cs)<br>+{<br>+ =C2=A0 =C2=A0#ifdef TARGE=
T_RISCV64<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return g_strdup(&quot;riscv:rv64&=
quot;);<br>+ =C2=A0 =C2=A0#else<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return g_st=
rdup(&quot;riscv:rv32&quot;);<br>+ =C2=A0 =C2=A0#endif<br>+}<br>+<br>=C2=A0=
static void riscv_cpu_class_init(ObjectClass *c, void *data)<br>=C2=A0{<br>=
=C2=A0 =C2=A0 =C2=A0RISCVCPUClass *mcc =3D RISCV_CPU_CLASS(c);<br>@@ -591,6=
 +600,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)<br>=
=C2=A0 =C2=A0 =C2=A0/* For now, mark unmigratable: */<br>=C2=A0 =C2=A0 =C2=
=A0cc-&gt;vmsd =3D &amp;vmstate_riscv_cpu;<br>=C2=A0#endif<br>+ =C2=A0 =C2=
=A0cc-&gt;gdb_arch_name =3D riscv_gdb_arch_name;<br>=C2=A0#ifdef CONFIG_TCG=
<br>=C2=A0 =C2=A0 =C2=A0cc-&gt;tcg_initialize =3D riscv_translate_init;<br>=
=C2=A0 =C2=A0 =C2=A0cc-&gt;tlb_fill =3D riscv_cpu_tlb_fill;<br>-- <br>2.25.=
1</div><div><br></div></div>

--00000000000029bb1505b7242e5f--

