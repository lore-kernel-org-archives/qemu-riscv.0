Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBC3CD8CA8
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 07:53:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXwhh-0002uF-5r; Fri, 12 Jun 2026 03:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1wXwhY-0002to-Vi
 for qemu-riscv@nongnu.org; Fri, 12 Jun 2026 03:53:17 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1wXwhX-0003Tj-1Y
 for qemu-riscv@nongnu.org; Fri, 12 Jun 2026 03:53:16 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-beb8a08a6c8so102488966b.2
 for <qemu-riscv@nongnu.org>; Fri, 12 Jun 2026 00:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1781250793; x=1781855593; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4fIcVgXFYPBqzvJwBT5R+2Yn1/DmIdtEkQC/Et7LRhQ=;
 b=g0dGrj0haJuPg5QRsPbQs/DizBUvwlIw6rb4VX009jHtyX7cIdTWrhCF1rMbAodqW7
 XuCeh8N2B33LF5pUoGl6iN1MPOeNc0NO4mNZN6qy/kINcs/WaXfFLB5KY0PbbL3+oG3a
 DE8lu/g/d8Xy8j8CGikP/3BDAqK1EOjnWxORk/x20aglrLCyDSz44Hn6HDZ2y8Wo/Dtv
 TCpucmGS8nfdj/PIh6DtWDblLGEcA1jARLCtC2xinzQcr1SEgESlbsROtMQSpsgj+DTA
 gJ57mmzxUftcuC4yrEHknp7K3EGwhcFeDOUagLNu9yDH6Q7Sh8E1hEiFcXwFMRhhBJMK
 687A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781250793; x=1781855593;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4fIcVgXFYPBqzvJwBT5R+2Yn1/DmIdtEkQC/Et7LRhQ=;
 b=dAyVLc1YTlAGUck1iqEzoUqgOPdpIqzKP7AdNeoLIMXP+q+VV2YaQHQO7aQgeabTp+
 ozcXjcVQZkHZCamgGpjXUL3xMBS8CJkaczGs4QNhI2Y72yV/G0TiOyfw4bP051iCqPYI
 eIFWP2QtiuEi+1v2zwg7OnU5UFbsahyjvvpZJyF8PoR0OxnqBScVLSHZBEygJ8kavE+5
 MHR9uTyv6Q5l5yJdOe6RW7pgPPPxFPOq5mNCdz2lMsvhJC9sIt2zDRWzhFQQBCBbhAmY
 IuOKeQf/4+FRcznmDsAc2GzDHxiz3ocirDHNcBn7fcyuvD+/i186SMqfb+ZuEBqaCm15
 JIow==
X-Forwarded-Encrypted: i=1;
 AFNElJ/d0YNNDJpkSEoxs5pdvrG53aOGQwbczq4akQgdzZoMxtAJF6DINh4VlgBAIv6W2N9ziN4CyRdouLte@nongnu.org
X-Gm-Message-State: AOJu0YzlLxdiWfiJdslp9gdQ31lp78G9XynDerJju7VB475u7Th8TCxi
 BbwiD/xBxvvH094F/jlDFlm3QcbEXRbK0wY2p//whEJ/+0DZRvZkPVgx9NpWwq2jO/ukdV8N8Wd
 2mB6CMhzX8fi3AAxXJD4jsDQ8dB9nnl0HD75DSCW5IyNDFONvcw2qMFSI0EOTcCkABb1HoYGKTO
 P4bDrierlNfE8TLHb3N+rqQuWmmtl0H1FuyRXwYTuuhDU=
X-Gm-Gg: Acq92OHbFPi1yBBPQxBilKVHCA+HS7Y6Xdh889fc4gbpWpEMZDoM4CwLuATuddrL2/x
 K6KTzQtTzVIu2CUoaHLFxj15+BL4qvwH+rJvrwTlJbIcX6G4xvCs4rS8TGvbwz17itMj3wipwlS
 lmLTLYp6h3NNkpN42cwiilHiXglvobihzPe/t7qlcQ4lwf7IT31zQeVoYp2nqMage7I17m2eR2h
 YNqL3p70POUTB6Y3nDrVQoJhtWUtajlCDxRsWp9V5TQW9Gyy8Ms5YfK1VcAUPo4ZCNp6KQ8Zivg
 u6KHmZiEjK5grMDfUdHEZ1o+H0LXpWNPphX2PLZHL87HMOSTjh3jcvghUI7rU96jVmFV0Tix1vg
 oMytrMBbRmR6zfKgaqYBFP487Ecb9hmM1wajPUG6kva+W098MynlbpgdeG5lxgFFTAlVoVioiEZ
 fIl4GpSy1iJpLWaVbQhevXY54V7BcHHMf3TgdGCq3PSPoTqs3fveNHM5QPeOanadd6nyUNVg8=
X-Received: by 2002:a17:907:1dcd:b0:bcc:e8f:c3a8 with SMTP id
 a640c23a62f3a-bfe29227170mr52459066b.29.1781250792935; 
 Fri, 12 Jun 2026 00:53:12 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfdb511b8aasm71343066b.24.2026.06.12.00.53.12
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 00:53:12 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-bebbc325000so92849566b.0
 for <qemu-riscv@nongnu.org>; Fri, 12 Jun 2026 00:53:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ+kiK8uDsj0VBmgjI5/a9CB5s4jfaLkMXXNqF1gguy5n/5WIzPibHskM6fRqiHxzQ8zUc/jKv7w8m1+@nongnu.org
X-Received: by 2002:a17:907:96a2:b0:bef:36f3:7277 with SMTP id
 a640c23a62f3a-bfe29229916mr77631766b.23.1781250791996; Fri, 12 Jun 2026
 00:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260318185238.99143-1-luisccunha8@gmail.com>
 <20260318185238.99143-6-luisccunha8@gmail.com>
In-Reply-To: <20260318185238.99143-6-luisccunha8@gmail.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Fri, 12 Jun 2026 15:53:00 +0800
X-Gmail-Original-Message-ID: <CAMXXpfYvTWgTyc-Yn+sVUYBOAwV0oJNdu7Tgthw-XXdzjUOJqw@mail.gmail.com>
X-Gm-Features: AVVi8CdPh2UFOlFKg1PufLNqd2acMLlLtkiVPhojU7BLc4EWAuff7h6CUKad4dI
Message-ID: <CAMXXpfYvTWgTyc-Yn+sVUYBOAwV0oJNdu7Tgthw-XXdzjUOJqw@mail.gmail.com>
Subject: Re: [RFC PATCH 5/6] target/riscv: Enable SPMP support in CPU
To: luisccc <luisccunha8@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="000000000000b68398065409c4d6"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=jay.chang@sifive.com; helo=mail-ej1-x635.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--000000000000b68398065409c4d6
Content-Type: text/plain; charset="UTF-8"

>
> static int get_physical_address_spmp(CPURISCVState *env, int *prot, hwaddr
> addr,
> +                                    int size, int access_type,
> +                                    int mode)
> +{
> +    spmp_priv_t spmp_priv;
> +
> +    if (!riscv_cpu_cfg(env)->spmp) {
> +        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        return TRANSLATE_SUCCESS;
> +    }
> +
> +    if (!spmp_hart_has_privs(env, addr, size, 1 << access_type,
> &spmp_priv,
> +                            mode)) {
> +        *prot = 0;
> +        return TRANSLATE_SPMP_FAIL;
> +    }
> +
> +    *prot = spmp_priv_to_page_prot(spmp_priv);
> +
> +    return TRANSLATE_SUCCESS;
> +}
> +
> +

There is one extra blank


> @@ -1634,7 +1671,8 @@ static void raise_mmu_exception(CPURISCVState *env,
> target_ulong address,
>      case MMU_DATA_LOAD:
>          if (pmp_violation) {
>              cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
> -        } else if (two_stage && !first_stage) {
> +        } else if ((two_stage && !first_stage) ||
> +                    (env->virt_enabled && spmp_violation)) {
>
Nit: align the parameters.

>              cs->exception_index = RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT;
>          } else {
>              cs->exception_index = RISCV_EXCP_LOAD_PAGE_FAULT;
> @@ -1643,7 +1681,8 @@ static void raise_mmu_exception(CPURISCVState *env,
> target_ulong address,
>      case MMU_DATA_STORE:
>          if (pmp_violation) {
>              cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
> -        } else if (two_stage && !first_stage) {
> +        } else if ((two_stage && !first_stage) ||
> +                    (env->virt_enabled && spmp_violation)) {
>
Nit: align the parameters.

--000000000000b68398065409c4d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">static int get_physical_address_sp=
mp(CPURISCVState *env, int *prot, hwaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int size, int access_t=
ype,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int mode)<br>
+{<br>
+=C2=A0 =C2=A0 spmp_priv_t spmp_priv;<br>
+<br>
+=C2=A0 =C2=A0 if (!riscv_cpu_cfg(env)-&gt;spmp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return TRANSLATE_SUCCESS;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!spmp_hart_has_privs(env, addr, size, 1 &lt;&lt; access_=
type, &amp;spmp_priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 mode)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *prot =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return TRANSLATE_SPMP_FAIL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 *prot =3D spmp_priv_to_page_prot(spmp_priv);<br>
+<br>
+=C2=A0 =C2=A0 return TRANSLATE_SUCCESS;<br>
+}<br>
+<br>
+</blockquote><div>There is one extra blank</div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><br></blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
@@ -1634,7 +1671,8 @@ static void raise_mmu_exception(CPURISCVState *env, t=
arget_ulong address,<br>
=C2=A0 =C2=A0 =C2=A0case MMU_DATA_LOAD:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pmp_violation) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;exception_index =3D =
RISCV_EXCP_LOAD_ACCESS_FAULT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (two_stage &amp;&amp; !first_stage) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if ((two_stage &amp;&amp; !first_stage)=
 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (env=
-&gt;virt_enabled &amp;&amp; spmp_violation)) {<br></blockquote><div>Nit: a=
lign the parameters.</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;exception_index =3D =
RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;exception_index =3D =
RISCV_EXCP_LOAD_PAGE_FAULT;<br>
@@ -1643,7 +1681,8 @@ static void raise_mmu_exception(CPURISCVState *env, t=
arget_ulong address,<br>
=C2=A0 =C2=A0 =C2=A0case MMU_DATA_STORE:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pmp_violation) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;exception_index =3D =
RISCV_EXCP_STORE_AMO_ACCESS_FAULT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (two_stage &amp;&amp; !first_stage) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if ((two_stage &amp;&amp; !first_stage)=
 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (env=
-&gt;virt_enabled &amp;&amp; spmp_violation)) {<br></blockquote><div>Nit: a=
lign the parameters.=C2=A0</div></div></div>

--000000000000b68398065409c4d6--

