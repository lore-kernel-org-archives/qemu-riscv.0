Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABD3C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 07:34:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLeiL-0002hN-1A; Fri, 05 Jan 2024 02:33:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rLeiJ-0002gd-HT; Fri, 05 Jan 2024 02:33:55 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rLeiH-0003V5-WA; Fri, 05 Jan 2024 02:33:55 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-555e07761acso1585287a12.0; 
 Thu, 04 Jan 2024 23:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704440032; x=1705044832; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hQgr/BM6wDwe9Ikg5ZNdn6Ng7bGApbQT7S3s2q2ALv4=;
 b=W/kMkOuHeHq39j6DTvTsQ6ET/tOnYpOy9fUVgZ98e36ZVfmMlXidX2MO+Drxpt5T4M
 4wtuVIafYTmCqXGr+0MsGokqo2mEEJbvVrPT+Uh9NQyuXNUqVNYqEyQR5Guv09O2GoBu
 G23ze+t/L+X9G2hifqhGRyVTy+O2OdV1+pUcDNXwnU2PXy0VSmD6PyI0VDsHmsJ89tS2
 KTBjkKzcr6fhdSG9KV4hqLC09xI4HAQbmuyhrNK1RZ2WPkn/D61OF7tvHZZFH7Jqzhnq
 WVBvuuMe7MjKoKJHhdQaJ/zKY81WgRY8Mf6IR8Efbol91hUFBZexWZsxkMH15UfgbayJ
 +b5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704440032; x=1705044832;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hQgr/BM6wDwe9Ikg5ZNdn6Ng7bGApbQT7S3s2q2ALv4=;
 b=DVYEk4tf3yam+9NLYhUaJizhWF4yJ9EpZdemQB/T8zQCMUUf0xX5MLkYHGytnM1iPb
 5DbrrnuEQfRXLY8/yLkesJnpCxFHmgF1Kip/FtiWwvTeyHvgPKUSZ/PrXk1XQknH63qr
 ljuJjb5ONvHdIdQkzrFOrkIh2Z9Q+V3mAj+B9gbxTGscMsfI50yhyCZW3z+VDdpfVobS
 ece7cKlgaSMcklops6JkFPlDpKR31YY7BwCoTOLtf/QWXK3wT0jVssgs5qhy9AAkPOWK
 0DVkQgeA3BI0Tucz2Aq1Shks7M1CemKx7GYi6J8Yi88/fEx06+Iy6j7hXb4thfq6Y1Q5
 9PEA==
X-Gm-Message-State: AOJu0Yzz/BnJmX2V7lp1aVpqG0JQuoH9Wx8UJz9kUhJ9X2RrifG16Bya
 uKtCJKlOKGo7atYlI1C1r9Gmv7Hly9gKUH7TjzU=
X-Google-Smtp-Source: AGHT+IGphGAXFL7Ouhq2fbkIFEBTDJks1dSl0ITRMwxPjx49GFMoDA4pIan6k7aaXF8MiO5WIl5gFYYSToy4P4IFaLw=
X-Received: by 2002:a50:cd91:0:b0:54c:4837:7d26 with SMTP id
 p17-20020a50cd91000000b0054c48377d26mr698164edi.101.1704440031821; Thu, 04
 Jan 2024 23:33:51 -0800 (PST)
MIME-Version: 1.0
References: <20240103185716.1790546-1-me@deliversmonkey.space>
 <20240103185716.1790546-4-me@deliversmonkey.space>
 <CAKC1njQwWxwSeGKVMUtUVmTkWEO-Z8zL8O20VmC+NJvUQNj94w@mail.gmail.com>
In-Reply-To: <CAKC1njQwWxwSeGKVMUtUVmTkWEO-Z8zL8O20VmC+NJvUQNj94w@mail.gmail.com>
From: Alexey Baturo <baturo.alexey@gmail.com>
Date: Fri, 5 Jan 2024 10:33:40 +0300
Message-ID: <CAFukJ-CSS2QPmP5xKxRS=VaXBNy_-pv24w-ovnmxcXxOD9jrZA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] target/riscv: Add helper functions to calculate
 current number of masked bits for pointer masking
To: Deepak Gupta <debug@rivosinc.com>
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com, 
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a34370060e2ddeab"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000a34370060e2ddeab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think you're right, thanks.
I'll add a check for M-mode as well and I guess I'll have to rename the
function.
Any ideas on the proper and self-describing name?

Thanks

=D0=BF=D1=82, 5 =D1=8F=D0=BD=D0=B2. 2024=E2=80=AF=D0=B3. =D0=B2 03:46, Deep=
ak Gupta <debug@rivosinc.com>:

> On Wed, Jan 3, 2024 at 10:59=E2=80=AFAM Alexey Baturo <baturo.alexey@gmai=
l.com>
> wrote:
> > +
> > +bool riscv_cpu_bare_mode(CPURISCVState *env)
> > +{
> > +    int satp_mode =3D 0;
> > +#ifndef CONFIG_USER_ONLY
> > +    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> > +        satp_mode =3D get_field(env->satp, SATP32_MODE);
> > +    } else {
> > +        satp_mode =3D get_field(env->satp, SATP64_MODE);
> > +    }
> > +#endif
> > +    return (satp_mode =3D=3D VM_1_10_MBARE);
> > +}
> > +
>
> Assume the CPU was in S or U with satp =3D non-bare mode but then a
> transfer to M-mode happened.
> In that case, even though the CPU is in M mode, the above function
> will return non-bare mode and enforce
> signed extension on M mode pointer masking (if enabled).
>
> right or am I missing something here?
>

--000000000000a34370060e2ddeab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think you&#39;re right, thanks.<div>I&#39;ll add a check=
 for M-mode as well and I guess I&#39;ll have to rename the function.</div>=
<div>Any ideas on the proper and self-describing name?</div><div><br></div>=
<div>Thanks<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">=D0=BF=D1=82, 5 =D1=8F=D0=BD=D0=B2. 2024=E2=80=AF=D0=B3. =D0=B2 03=
:46, Deepak Gupta &lt;<a href=3D"mailto:debug@rivosinc.com" target=3D"_blan=
k">debug@rivosinc.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Wed, Jan 3, 2024 at 10:59=E2=80=AFAM Alexey Baturo &lt;<a=
 href=3D"mailto:baturo.alexey@gmail.com" target=3D"_blank">baturo.alexey@gm=
ail.com</a>&gt; wrote:<br>
&gt; +<br>
&gt; +bool riscv_cpu_bare_mode(CPURISCVState *env)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int satp_mode =3D 0;<br>
&gt; +#ifndef CONFIG_USER_ONLY<br>
&gt; +=C2=A0 =C2=A0 if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 satp_mode =3D get_field(env-&gt;satp, SAT=
P32_MODE);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 satp_mode =3D get_field(env-&gt;satp, SAT=
P64_MODE);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 return (satp_mode =3D=3D VM_1_10_MBARE);<br>
&gt; +}<br>
&gt; +<br>
<br>
Assume the CPU was in S or U with satp =3D non-bare mode but then a<br>
transfer to M-mode happened.<br>
In that case, even though the CPU is in M mode, the above function<br>
will return non-bare mode and enforce<br>
signed extension on M mode pointer masking (if enabled).<br>
<br>
right or am I missing something here?<br>
</blockquote></div></div></div>

--000000000000a34370060e2ddeab--

