Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFF6C25B74
	for <qemu-riscv@archiver.kernel.org>; Fri, 17 May 2024 01:55:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s7moV-0006kR-2w; Thu, 16 May 2024 21:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1s7moO-0006jz-2E
 for qemu-riscv@nongnu.org; Thu, 16 May 2024 21:55:08 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1s7moJ-0001AW-4i
 for qemu-riscv@nongnu.org; Thu, 16 May 2024 21:55:07 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56e1f3462caso4300161a12.3
 for <qemu-riscv@nongnu.org>; Thu, 16 May 2024 18:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1715910901; x=1716515701; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wzQF9Co6B7yLYxEUebyYO0CK8hK8yoOHP7cb3cL4fTU=;
 b=cwCO1o+dkD9D5E0hEIrqWqIIFh+WHio5aEddbcW1TktMUF29/NohJFFOKxRUwiGpo9
 2YfnVnvH+bU+Pw+7cnNodcvM2Ts89dZ67qF8EXRTLqYcwDuvwgjNSh3RmlXUCozvKkd1
 +Q2Oni2T98vB1qWIoAyOTajKCqbCeRP5pMoflKpyqC+faN9y0FhmvZfOcAdfe+KM+J69
 xn2sc0Y+MqrJRMQODIGaw2IqhzbHu+/yRSCYLiB4AtbxMZG2S1vaqqowvdQcws3DZcQf
 WJ1UYXW3tjuep+NZCoOTLqep2jVMbgNiX4gBi+goJrAMb6AKHPKMFInOyLB+kFIviEz6
 kL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715910901; x=1716515701;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wzQF9Co6B7yLYxEUebyYO0CK8hK8yoOHP7cb3cL4fTU=;
 b=hIJvVVG5oK0iNc2AwCwMj1wZykvFMLay9joAX1g3slNAsIcwOQ4vJD34NjUVW+OHIV
 tt9U2Yb/+VjVS6T4I55XVegSCyeFy3/QhlZzZTXVMvnM9vyB/8Ihfnqjg45VAEqIcTXK
 mD5E5tMiJcgxpa701sqpvR/xc0EPkvsQgFNvGbtw6n6fvYw6+mCqjKe5rg91+L51zU8r
 pFJxOsVj1SYwsUJNMWIzSIxAAhhG/oy7c7W95k+/B8+Xvm6dIoo7wj7kzUtqKIlcnDbK
 rOfuT72rvbVZX3s2NrkESdfGyNE2QQaDjk5WDBh0S0Q6U6s4n1vo8FwkNFH9IeIY7RuL
 sKRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgMaxDAXYqryMFgcEcU8smhfzO3na+erWv79QyhCPgqGxODwRWqG7SzNgUFjvBgw8nk0AqeTnjAQayL4DlvA3uutaFAzo=
X-Gm-Message-State: AOJu0YzNpqlJkdOIGxjWzl/1a0HEjZR53Yzp4bajlWPN+b7j9+7vGle4
 2OlvyLlRKYd0SPZAlqMAeq3M8uAO14SL+u0hLvNtLXxsz3jyaKKd0jS+/AduesuVvjVTxMAG0Az
 gMG/Oz5tnLEHDl3Y+PBORskWTfTnp7gCh0HqQjw==
X-Google-Smtp-Source: AGHT+IF468Fyi5DAak5fHpKeZ7c0Vbt3JcMgsxXqyR3LOizDjey+g69BollHX+BMLrScHSNzs6tiTrkwFBDw/N2VazM=
X-Received: by 2002:a50:d55e:0:b0:574:f09a:e7aa with SMTP id
 4fb4d7f45d1cf-574f09ae8dbmr5462760a12.21.1715910901015; Thu, 16 May 2024
 18:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240516123336.63534-1-jerry.zhangjian@sifive.com>
In-Reply-To: <20240516123336.63534-1-jerry.zhangjian@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 17 May 2024 09:54:50 +0800
Message-ID: <CAE_xrPgGWMRbqskqhLBA7_G4iQ=2sUY0jUCTckMNoYcdAmgcAQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: zvbb implies zvkb
To: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, max.chou@sifive.com, 
 paul.walmsley@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b8cb3306189ca393"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=frank.chang@sifive.com; helo=mail-ed1-x534.google.com
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

--000000000000b8cb3306189ca393
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Thu, May 16, 2024 at 8:34=E2=80=AFPM Jerry Zhang Jian <jerry.zhangjian@s=
ifive.com>
wrote:

> - According to RISC-V crypto spec, Zvkb extension is a proper subset of
> the Zvbb extension.
>
> - Reference:
> https://github.com/riscv/riscv-crypto/blob/1769c2609bf4535632e0c0fd715778=
f212bb272e/doc/vector/riscv-crypto-vector-zvkb.adoc?plain=3D1#L10
>
> Signed-off-by: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
> ---
>  target/riscv/tcg/tcg-cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 40054a391a..f1a1306ab2 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -658,6 +658,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu=
,
> Error **errp)
>          cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbc), true);
>      }
>
> +    if (cpu->cfg.ext_zvbb) {
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkb), true);
> +    }
> +
>      /*
>       * In principle Zve*x would also suffice here, were they supported
>       * in qemu
> --
> 2.42.0
>
>

--000000000000b8cb3306189ca393
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 16, 2024 at 8:34=E2=
=80=AFPM Jerry Zhang Jian &lt;<a href=3D"mailto:jerry.zhangjian@sifive.com"=
>jerry.zhangjian@sifive.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">- According to RISC-V crypto spec, Zvkb extensio=
n is a proper subset of the Zvbb extension.<br>
<br>
- Reference: <a href=3D"https://github.com/riscv/riscv-crypto/blob/1769c260=
9bf4535632e0c0fd715778f212bb272e/doc/vector/riscv-crypto-vector-zvkb.adoc?p=
lain=3D1#L10" rel=3D"noreferrer" target=3D"_blank">https://github.com/riscv=
/riscv-crypto/blob/1769c2609bf4535632e0c0fd715778f212bb272e/doc/vector/risc=
v-crypto-vector-zvkb.adoc?plain=3D1#L10</a><br>
<br>
Signed-off-by: Jerry Zhang Jian &lt;<a href=3D"mailto:jerry.zhangjian@sifiv=
e.com" target=3D"_blank">jerry.zhangjian@sifive.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/tcg/tcg-cpu.c | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c<br>
index 40054a391a..f1a1306ab2 100644<br>
--- a/target/riscv/tcg/tcg-cpu.c<br>
+++ b/target/riscv/tcg/tcg-cpu.c<br>
@@ -658,6 +658,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, =
Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFS=
ET(ext_zvbc), true);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (cpu-&gt;cfg.ext_zvbb) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ex=
t_zvkb), true);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * In principle Zve*x would also suffice here, were the=
y supported<br>
=C2=A0 =C2=A0 =C2=A0 * in qemu<br>
-- <br>
2.42.0<br>
<br>
</blockquote></div>

--000000000000b8cb3306189ca393--

