Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pND4y-0007LV-21
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 08:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pND3S-00065R-LA
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 08:21:47 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pND3N-00047F-0a
 for qemu-riscv@nongnu.org; Wed, 01 Feb 2023 08:21:34 -0500
Received: by mail-lj1-x22c.google.com with SMTP id t12so19327454lji.13
 for <qemu-riscv@nongnu.org>; Wed, 01 Feb 2023 05:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rFFADaYv4RMRZci0kU485Cfrcm6FCC0H2psqZLwK+Lg=;
 b=le3s0VPp7peRiMG3z6IRJ4UgIaemTeGjkjAG7wV9sV0zFkHeNvRt8rIdtNkKmeccbB
 PKg+BVq1u+1mfTDP7yTr78TX4dJWu+AO3CuHd63O4gv1mIKIKpNK7Eozr60EOhFsbxhh
 7IkLI0e5APw10ho8FwOQV4tYhY04V/Z3DVudfl0GJsmNy60fRI/FVKphznheeW2vS8k1
 xCyWR59Ps6a6pSH99AGMpPOAd8sZtwD0xZIphUfvvfEbuT6BXOfgDoDu2MVIuZwq5XJr
 /hSP5yaCe07NRGnlTcdXdLvuk/v0xwARdMLgeQZidwaz+5dySDgh9rIGsbNos0ecvFpd
 5uJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rFFADaYv4RMRZci0kU485Cfrcm6FCC0H2psqZLwK+Lg=;
 b=J0cPMoCsj86A3TRQHjU6eH9C89CAniei0UKiZPZ6jGdDGOXQGOYY8j6aJTuzt7dcWs
 psCEyFCA1XA24llHND8JdlI7pp71eZFy6aJ9M/Nb/AxSmpUyU1KhQX+RofHhupxwppVv
 kn3LzrbZUQPTNB5w9KVYYA1s71rhtdIPQfQGNxVUbezOTyHuXb5r9cXEZIErWcpTDqKm
 We6X/fWW4MfHWgnDMHNgAhkA+EUvuuOtohnAMA2cc5qdRa2cLjsPmKkRK4JDfwzkODlr
 Nxr3ajWPGaFWn4BUJeN5QB0ThGkSU208O9B/7Q95d67s9LbXcD8B4+wIp5ek7aTQkj3V
 6/AA==
X-Gm-Message-State: AO0yUKUAmCHF0PSnaHwrhE1uRI1i2znir/lNgQRUTXPZR6r3ShjKAVyL
 /dt4aFLIgm5IlpKsEWmoQSua4zpCJD30x2JVlkHknpdhKeXH2BeDGfFEyqLBl23ZdvXA1MsZJlg
 o6Pjp4hKemwse8IK4prsbM0g1O8nLE3q/eOJZg3CnK2EbGWOCTzZPn+TwduM5VC6Gc2n5ZHhmuW
 Q=
X-Google-Smtp-Source: AK7set9jqZAT4hJR+LPzu1lC/jfrSPMSTvd33O1FDI9LC4NE3PjMoUZSlD6AqkHyAlT6JJWFoRYW9Q==
X-Received: by 2002:a2e:8045:0:b0:290:5a39:9156 with SMTP id
 p5-20020a2e8045000000b002905a399156mr461307ljg.10.1675257690666; 
 Wed, 01 Feb 2023 05:21:30 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 s4-20020a05651c200400b0028ea7b5d04asm1050357ljo.129.2023.02.01.05.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 05:21:29 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id b3so29267404lfv.2;
 Wed, 01 Feb 2023 05:21:29 -0800 (PST)
X-Received: by 2002:a05:6512:4010:b0:4d5:76af:f890 with SMTP id
 br16-20020a056512401000b004d576aff890mr401587lfb.228.1675257689284; Wed, 01
 Feb 2023 05:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20230131133906.1956228-1-alexghiti@rivosinc.com>
 <20230131133906.1956228-3-alexghiti@rivosinc.com>
In-Reply-To: <20230131133906.1956228-3-alexghiti@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 1 Feb 2023 21:21:17 +0800
X-Gmail-Original-Message-ID: <CANzO1D0WH1T9YuJokFJp8gc9dkDTKUtD+YN+tvp6bZir=NRQPA@mail.gmail.com>
Message-ID: <CANzO1D0WH1T9YuJokFJp8gc9dkDTKUtD+YN+tvp6bZir=NRQPA@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] riscv: Change type of valid_vm_1_10_[32|64] to bool
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Bin Meng <bmeng@tinylab.org>
Content-Type: multipart/alternative; boundary="0000000000007a24dc05f3a353fa"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=frank.chang@sifive.com; helo=mail-lj1-x22c.google.com
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
X-List-Received-Date: Wed, 01 Feb 2023 13:21:49 -0000

--0000000000007a24dc05f3a353fa
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Tue, Jan 31, 2023 at 10:29 PM Alexandre Ghiti <alexghiti@rivosinc.com>
wrote:

> This array is actually used as a boolean so swap its current char type
> to a boolean and at the same time, change the type of validate_vm to
> bool since it returns valid_vm_1_10_[32|64].
>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> ---
>  target/riscv/csr.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0db2c233e5..6b157806a5 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1117,16 +1117,16 @@ static const target_ulong hip_writable_mask =
> MIP_VSSIP;
>  static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP |
> MIP_VSEIP;
>  static const target_ulong vsip_writable_mask = MIP_VSSIP;
>
> -static const char valid_vm_1_10_32[16] = {
> -    [VM_1_10_MBARE] = 1,
> -    [VM_1_10_SV32] = 1
> +static const bool valid_vm_1_10_32[16] = {
> +    [VM_1_10_MBARE] = true,
> +    [VM_1_10_SV32] = true
>  };
>
> -static const char valid_vm_1_10_64[16] = {
> -    [VM_1_10_MBARE] = 1,
> -    [VM_1_10_SV39] = 1,
> -    [VM_1_10_SV48] = 1,
> -    [VM_1_10_SV57] = 1
> +static const bool valid_vm_1_10_64[16] = {
> +    [VM_1_10_MBARE] = true,
> +    [VM_1_10_SV39] = true,
> +    [VM_1_10_SV48] = true,
> +    [VM_1_10_SV57] = true
>  };
>
>  /* Machine Information Registers */
> @@ -1209,7 +1209,7 @@ static RISCVException read_mstatus(CPURISCVState
> *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> -static int validate_vm(CPURISCVState *env, target_ulong vm)
> +static bool validate_vm(CPURISCVState *env, target_ulong vm)
>  {
>      if (riscv_cpu_mxl(env) == MXL_RV32) {
>          return valid_vm_1_10_32[vm & 0xf];
> @@ -2648,7 +2648,8 @@ static RISCVException read_satp(CPURISCVState *env,
> int csrno,
>  static RISCVException write_satp(CPURISCVState *env, int csrno,
>                                   target_ulong val)
>  {
> -    target_ulong vm, mask;
> +    target_ulong mask;
> +    bool vm;
>
>      if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
>          return RISCV_EXCP_NONE;
> --
> 2.37.2
>
>
>

--0000000000007a24dc05f3a353fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 31, 2023 at 10:29 PM=
 Alexandre Ghiti &lt;<a href=3D"mailto:alexghiti@rivosinc.com">alexghiti@ri=
vosinc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">This array is actually used as a boolean so swap its current cha=
r type<br>
to a boolean and at the same time, change the type of validate_vm to<br>
bool since it returns valid_vm_1_10_[32|64].<br>
<br>
Suggested-by: Andrew Jones &lt;<a href=3D"mailto:ajones@ventanamicro.com" t=
arget=3D"_blank">ajones@ventanamicro.com</a>&gt;<br>
Signed-off-by: Alexandre Ghiti &lt;<a href=3D"mailto:alexghiti@rivosinc.com=
" target=3D"_blank">alexghiti@rivosinc.com</a>&gt;<br>
Reviewed-by: Andrew Jones &lt;<a href=3D"mailto:ajones@ventanamicro.com" ta=
rget=3D"_blank">ajones@ventanamicro.com</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng@tinylab.org" target=3D"_b=
lank">bmeng@tinylab.org</a>&gt;<br>
---<br>
=C2=A0target/riscv/csr.c | 21 +++++++++++----------<br>
=C2=A01 file changed, 11 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 0db2c233e5..6b157806a5 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -1117,16 +1117,16 @@ static const target_ulong hip_writable_mask =3D MIP=
_VSSIP;<br>
=C2=A0static const target_ulong hvip_writable_mask =3D MIP_VSSIP | MIP_VSTI=
P | MIP_VSEIP;<br>
=C2=A0static const target_ulong vsip_writable_mask =3D MIP_VSSIP;<br>
<br>
-static const char valid_vm_1_10_32[16] =3D {<br>
-=C2=A0 =C2=A0 [VM_1_10_MBARE] =3D 1,<br>
-=C2=A0 =C2=A0 [VM_1_10_SV32] =3D 1<br>
+static const bool valid_vm_1_10_32[16] =3D {<br>
+=C2=A0 =C2=A0 [VM_1_10_MBARE] =3D true,<br>
+=C2=A0 =C2=A0 [VM_1_10_SV32] =3D true<br>
=C2=A0};<br>
<br>
-static const char valid_vm_1_10_64[16] =3D {<br>
-=C2=A0 =C2=A0 [VM_1_10_MBARE] =3D 1,<br>
-=C2=A0 =C2=A0 [VM_1_10_SV39] =3D 1,<br>
-=C2=A0 =C2=A0 [VM_1_10_SV48] =3D 1,<br>
-=C2=A0 =C2=A0 [VM_1_10_SV57] =3D 1<br>
+static const bool valid_vm_1_10_64[16] =3D {<br>
+=C2=A0 =C2=A0 [VM_1_10_MBARE] =3D true,<br>
+=C2=A0 =C2=A0 [VM_1_10_SV39] =3D true,<br>
+=C2=A0 =C2=A0 [VM_1_10_SV48] =3D true,<br>
+=C2=A0 =C2=A0 [VM_1_10_SV57] =3D true<br>
=C2=A0};<br>
<br>
=C2=A0/* Machine Information Registers */<br>
@@ -1209,7 +1209,7 @@ static RISCVException read_mstatus(CPURISCVState *env=
, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
-static int validate_vm(CPURISCVState *env, target_ulong vm)<br>
+static bool validate_vm(CPURISCVState *env, target_ulong vm)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return valid_vm_1_10_32[vm &amp; 0xf];<br=
>
@@ -2648,7 +2648,8 @@ static RISCVException read_satp(CPURISCVState *env, i=
nt csrno,<br>
=C2=A0static RISCVException write_satp(CPURISCVState *env, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong val)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 target_ulong vm, mask;<br>
+=C2=A0 =C2=A0 target_ulong mask;<br>
+=C2=A0 =C2=A0 bool vm;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!riscv_feature(env, RISCV_FEATURE_MMU)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
-- <br>
2.37.2<br>
<br>
<br>
</blockquote></div>

--0000000000007a24dc05f3a353fa--

