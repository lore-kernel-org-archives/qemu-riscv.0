Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxQ4g-0001sq-B2
	for mharc-qemu-riscv@gnu.org; Sun, 27 Jun 2021 04:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxQ4e-0001s9-EC
 for qemu-riscv@nongnu.org; Sun, 27 Jun 2021 04:23:28 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxQ4b-0007EO-BP
 for qemu-riscv@nongnu.org; Sun, 27 Jun 2021 04:23:27 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so8318997pjn.1
 for <qemu-riscv@nongnu.org>; Sun, 27 Jun 2021 01:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5i9IUgBfT6NaVGKfHVWUsW8gsCLvhr7FPh7VMw6JEeM=;
 b=jS4QkjhNd70UPbfJ6XMZPSGCwtDXzq6oXWaLDS8397HYeIawMzulB87upzGVJsHBvm
 WplRYrvyOPxA2N5Dv2B4V0O98L73pGQEK28Ka1oZGF/3qWT8gMp/X757na96vNWGc1AH
 5CzSlIR7CfV9WQ+E1XuHb5ezHkhmufLM6W/gy7dRI2mPxw4Ez+xyDz2SxvFSF6WmJLji
 k1Gm3LfWyZ5YFSYTu2ZtIL5Q7UxqyBSsW7WVQ5zmnVCPYC1oQjAj9soCb5j47l49nhow
 4PU7Zgmv2qWqQNgLHzJAEFUn3eAZGFsvmC0iVvg5LKGduvTnSulTWNNQxjdypQTKU7Mb
 tlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5i9IUgBfT6NaVGKfHVWUsW8gsCLvhr7FPh7VMw6JEeM=;
 b=XRbhQYXA/9UAE7ooc+8rcOj6Ua4YjChzarFvO9XWodIfSQD5OUHLja1LaJ3DuXuh5Q
 ImdbJQ5EyTEIPFJx++BkJi5aOTqlTEH5M7Ze+En5KNl1z4dbkH7s2KA4cer98n9TBvCr
 37m036ytgwNWxR9Juu5vNFdXnPQbrn9XCDNdBzu0YoMAXabHIiVHXTgx+h/tTE3oUVJy
 AGbRUihX37mjMK2VFUonVq2i68eXLs/sgoJ9f1yVCQqcK2Ag0O1Rb29YIHS3IG4dlRzH
 831hJCEw+jSUNrm3GxmfnGx6eGljILgkTG8xNkgg3SJay5GZ77qTGZns/vktxPAOhmuU
 bQVA==
X-Gm-Message-State: AOAM533SVO1fGFXTXb76bpKqAxol+Y/JKDvn+IkwAEo+vfInA0cO8MQb
 GcZ541vNb2uihPqSz9ZwDkwL6g==
X-Google-Smtp-Source: ABdhPJwNw8cqVAqI0vYNGLv5jb7VEnS8+DwbgVGueOFM8bD4SyqMSOlx2iEnZsp6nW0s/M7VjcSFAQ==
X-Received: by 2002:a17:90a:1b42:: with SMTP id
 q60mr30829204pjq.8.1624782203856; 
 Sun, 27 Jun 2021 01:23:23 -0700 (PDT)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com.
 [209.85.216.53])
 by smtp.gmail.com with ESMTPSA id z27sm10872216pfg.91.2021.06.27.01.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 01:23:23 -0700 (PDT)
Received: by mail-pj1-f53.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so8302675pjo.3; 
 Sun, 27 Jun 2021 01:23:22 -0700 (PDT)
X-Received: by 2002:a17:90a:6be6:: with SMTP id
 w93mr20759803pjj.171.1624782202542; 
 Sun, 27 Jun 2021 01:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-3-zhiwei_liu@c-sky.com>
 <CANzO1D0kMsGwXWMHZrSQQdX3yDAScE6_psJPK+854TvWx4tW=A@mail.gmail.com>
In-Reply-To: <CANzO1D0kMsGwXWMHZrSQQdX3yDAScE6_psJPK+854TvWx4tW=A@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 27 Jun 2021 16:23:10 +0800
X-Gmail-Original-Message-ID: <CANzO1D1FEfVrRwC-QT=BGqnpbTWSOMtMq5mt2W07u-E1Y7F_3A@mail.gmail.com>
Message-ID: <CANzO1D1FEfVrRwC-QT=BGqnpbTWSOMtMq5mt2W07u-E1Y7F_3A@mail.gmail.com>
Subject: Re: [RFC PATCH 02/11] target/riscv: Update CSR xintthresh in CLIC mode
To: Frank Chang <frank.chang@sifive.com>
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="000000000000051fd705c5bb162d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sun, 27 Jun 2021 08:23:28 -0000

--000000000000051fd705c5bb162d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Frank Chang <frank.chang@sifive.com> =E6=96=BC 2021=E5=B9=B46=E6=9C=8827=E6=
=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8A=E5=8D=881:23=E5=AF=AB=E9=81=93=EF=BC=9A

> LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
>> The interrupt-level threshold (xintthresh) CSR holds an 8-bit field
>> for the threshold level of the associated privilege mode.
>>
>> For horizontal interrupts, only the ones with higher interrupt levels
>> than the threshold level are allowed to preempt.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>>
>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
>

Sorry, recall that mintthresh description is vague in v0.8 CLIC spec[1].
If mintthresh is a CLIC memory-mapped register in v0.8 CLIC.
Then I think you should restrict the CSR accesses to mintthresh and
sintthresh when CLIC is v0.8.

[1] https://github.com/riscv/riscv-fast-interrupt/blob/74f86c3858/clic.adoc

Regards,
Frank Chang


>
>
>> ---
>>  target/riscv/cpu.h      |  2 ++
>>  target/riscv/cpu_bits.h |  2 ++
>>  target/riscv/csr.c      | 28 ++++++++++++++++++++++++++++
>>  3 files changed, 32 insertions(+)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 1a44ca62c7..a5eab26a69 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -160,6 +160,7 @@ struct CPURISCVState {
>>
>>      uint32_t miclaim;
>>      uint32_t mintstatus; /* clic-spec */
>> +    target_ulong mintthresh; /* clic-spec */
>>
>>      target_ulong mie;
>>      target_ulong mideleg;
>> @@ -173,6 +174,7 @@ struct CPURISCVState {
>>      target_ulong stvec;
>>      target_ulong sepc;
>>      target_ulong scause;
>> +    target_ulong sintthresh; /* clic-spec */
>>
>>      target_ulong mtvec;
>>      target_ulong mepc;
>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>> index c4ce6ec3d9..9447801d22 100644
>> --- a/target/riscv/cpu_bits.h
>> +++ b/target/riscv/cpu_bits.h
>> @@ -166,6 +166,7 @@
>>  #define CSR_MTVAL           0x343
>>  #define CSR_MIP             0x344
>>  #define CSR_MINTSTATUS      0x346 /* clic-spec-draft */
>> +#define CSR_MINTTHRESH      0x347 /* clic-spec-draft */
>>
>>  /* Legacy Machine Trap Handling (priv v1.9.1) */
>>  #define CSR_MBADADDR        0x343
>> @@ -185,6 +186,7 @@
>>  #define CSR_STVAL           0x143
>>  #define CSR_SIP             0x144
>>  #define CSR_SINTSTATUS      0x146 /* clic-spec-draft */
>> +#define CSR_SINTTHRESH      0x147 /* clic-spec-draft */
>>
>>  /* Legacy Supervisor Trap Handling (priv v1.9.1) */
>>  #define CSR_SBADADDR        0x143
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 320b18ab60..4c31364967 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -746,6 +746,18 @@ static int read_mintstatus(CPURISCVState *env, int
>> csrno, target_ulong *val)
>>      return 0;
>>  }
>>
>> +static int read_mintthresh(CPURISCVState *env, int csrno, target_ulong
>> *val)
>> +{
>> +    *val =3D env->mintthresh;
>> +    return 0;
>> +}
>> +
>> +static int write_mintthresh(CPURISCVState *env, int csrno, target_ulong
>> val)
>> +{
>> +    env->mintthresh =3D val;
>> +    return 0;
>> +}
>> +
>>  /* Supervisor Trap Setup */
>>  static int read_sstatus(CPURISCVState *env, int csrno, target_ulong *va=
l)
>>  {
>> @@ -912,6 +924,18 @@ static int read_sintstatus(CPURISCVState *env, int
>> csrno, target_ulong *val)
>>      return 0;
>>  }
>>
>> +static int read_sintthresh(CPURISCVState *env, int csrno, target_ulong
>> *val)
>> +{
>> +    *val =3D env->sintthresh;
>> +    return 0;
>> +}
>> +
>> +static int write_sintthresh(CPURISCVState *env, int csrno, target_ulong
>> val)
>> +{
>> +    env->sintthresh =3D val;
>> +    return 0;
>> +}
>> +
>>  /* Supervisor Protection and Translation */
>>  static int read_satp(CPURISCVState *env, int csrno, target_ulong *val)
>>  {
>> @@ -1666,9 +1690,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
>>
>>      /* Machine Mode Core Level Interrupt Controller */
>>      [CSR_MINTSTATUS] =3D { "mintstatus", clic,  read_mintstatus },
>> +    [CSR_MINTTHRESH] =3D { "mintthresh", clic,  read_mintthresh,
>> +                         write_mintthresh },
>>
>>      /* Supervisor Mode Core Level Interrupt Controller */
>>      [CSR_SINTSTATUS] =3D { "sintstatus", clic,  read_sintstatus },
>> +    [CSR_SINTTHRESH] =3D { "sintthresh", clic,  read_sintthresh,
>> +                         write_sintthresh },
>>
>>  #endif /* !CONFIG_USER_ONLY */
>>  };
>> --
>> 2.25.1
>>
>>
>>

--000000000000051fd705c5bb162d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Frank Chang &lt;<a href=3D"mailto:frank.c=
hang@sifive.com">frank.chang@sifive.com</a>&gt; =E6=96=BC 2021=E5=B9=B46=E6=
=9C=8827=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8A=E5=8D=881:23=E5=AF=AB=E9=81=
=93=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a=
 href=3D"mailto:zhiwei_liu@c-sky.com" target=3D"_blank">zhiwei_liu@c-sky.co=
m</a>&gt; =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=97=A5 =E9=80=B1=E4=BA=94 =
=E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The interrupt-=
level threshold (xintthresh) CSR holds an 8-bit field<br>
for the threshold level of the associated privilege mode.<br>
<br>
For horizontal interrupts, only the ones with higher interrupt levels<br>
than the threshold level are allowed to preempt.<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br></blockquote><div><br></div><d=
iv>Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" t=
arget=3D"_blank">frank.chang@sifive.com</a>&gt;</div></div></div></blockquo=
te><div><br></div><div>Sorry, recall that=C2=A0mintthresh description is va=
gue in v0.8 CLIC spec[1].</div><div>If mintthresh is a CLIC memory-mapped r=
egister in v0.8 CLIC.</div><div>Then I think you should restrict the CSR ac=
cesses to mintthresh=C2=A0and sintthresh when CLIC is v0.8.</div><div><br><=
/div><div>[1]=C2=A0<a href=3D"https://github.com/riscv/riscv-fast-interrupt=
/blob/74f86c3858/clic.adoc" target=3D"_blank">https://github.com/riscv/risc=
v-fast-interrupt/blob/74f86c3858/<span class=3D"gmail-il">clic</span>.adoc<=
/a><br></div><div><br></div><div>Regards,</div><div>Frank Chang</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
---<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0target/riscv/cpu_bits.h |=C2=A0 2 ++<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 28 +++++++++++++++++++++++++=
+++<br>
=C2=A03 files changed, 32 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 1a44ca62c7..a5eab26a69 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -160,6 +160,7 @@ struct CPURISCVState {<br>
<br>
=C2=A0 =C2=A0 =C2=A0uint32_t miclaim;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t mintstatus; /* clic-spec */<br>
+=C2=A0 =C2=A0 target_ulong mintthresh; /* clic-spec */<br>
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mie;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mideleg;<br>
@@ -173,6 +174,7 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0target_ulong stvec;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong sepc;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong scause;<br>
+=C2=A0 =C2=A0 target_ulong sintthresh; /* clic-spec */<br>
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mtvec;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mepc;<br>
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
index c4ce6ec3d9..9447801d22 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -166,6 +166,7 @@<br>
=C2=A0#define CSR_MTVAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x343<br>
=C2=A0#define CSR_MIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x344<=
br>
=C2=A0#define CSR_MINTSTATUS=C2=A0 =C2=A0 =C2=A0 0x346 /* clic-spec-draft *=
/<br>
+#define CSR_MINTTHRESH=C2=A0 =C2=A0 =C2=A0 0x347 /* clic-spec-draft */<br>
<br>
=C2=A0/* Legacy Machine Trap Handling (priv v1.9.1) */<br>
=C2=A0#define CSR_MBADADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x343<br>
@@ -185,6 +186,7 @@<br>
=C2=A0#define CSR_STVAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x143<br>
=C2=A0#define CSR_SIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x144<=
br>
=C2=A0#define CSR_SINTSTATUS=C2=A0 =C2=A0 =C2=A0 0x146 /* clic-spec-draft *=
/<br>
+#define CSR_SINTTHRESH=C2=A0 =C2=A0 =C2=A0 0x147 /* clic-spec-draft */<br>
<br>
=C2=A0/* Legacy Supervisor Trap Handling (priv v1.9.1) */<br>
=C2=A0#define CSR_SBADADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x143<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 320b18ab60..4c31364967 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -746,6 +746,18 @@ static int read_mintstatus(CPURISCVState *env, int csr=
no, target_ulong *val)<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
+static int read_mintthresh(CPURISCVState *env, int csrno, target_ulong *va=
l)<br>
+{<br>
+=C2=A0 =C2=A0 *val =3D env-&gt;mintthresh;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int write_mintthresh(CPURISCVState *env, int csrno, target_ulong va=
l)<br>
+{<br>
+=C2=A0 =C2=A0 env-&gt;mintthresh =3D val;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
=C2=A0/* Supervisor Trap Setup */<br>
=C2=A0static int read_sstatus(CPURISCVState *env, int csrno, target_ulong *=
val)<br>
=C2=A0{<br>
@@ -912,6 +924,18 @@ static int read_sintstatus(CPURISCVState *env, int csr=
no, target_ulong *val)<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
+static int read_sintthresh(CPURISCVState *env, int csrno, target_ulong *va=
l)<br>
+{<br>
+=C2=A0 =C2=A0 *val =3D env-&gt;sintthresh;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int write_sintthresh(CPURISCVState *env, int csrno, target_ulong va=
l)<br>
+{<br>
+=C2=A0 =C2=A0 env-&gt;sintthresh =3D val;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
=C2=A0/* Supervisor Protection and Translation */<br>
=C2=A0static int read_satp(CPURISCVState *env, int csrno, target_ulong *val=
)<br>
=C2=A0{<br>
@@ -1666,9 +1690,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0/* Machine Mode Core Level Interrupt Controller */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MINTSTATUS] =3D { &quot;mintstatus&quot;, clic,=C2=
=A0 read_mintstatus },<br>
+=C2=A0 =C2=A0 [CSR_MINTTHRESH] =3D { &quot;mintthresh&quot;, clic,=C2=A0 r=
ead_mintthresh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0write_mintthresh },<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Supervisor Mode Core Level Interrupt Controller */<b=
r>
=C2=A0 =C2=A0 =C2=A0[CSR_SINTSTATUS] =3D { &quot;sintstatus&quot;, clic,=C2=
=A0 read_sintstatus },<br>
+=C2=A0 =C2=A0 [CSR_SINTTHRESH] =3D { &quot;sintthresh&quot;, clic,=C2=A0 r=
ead_sintthresh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0write_sintthresh },<br>
<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0};<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000051fd705c5bb162d--

