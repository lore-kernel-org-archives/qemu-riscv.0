Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p602W-0002bz-7p
	for mharc-qemu-riscv@gnu.org; Thu, 15 Dec 2022 21:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1p602S-0002bc-Gc
 for qemu-riscv@nongnu.org; Thu, 15 Dec 2022 21:01:28 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1p602Q-0006Rz-QY
 for qemu-riscv@nongnu.org; Thu, 15 Dec 2022 21:01:28 -0500
Received: by mail-lf1-x134.google.com with SMTP id 1so1311332lfz.4
 for <qemu-riscv@nongnu.org>; Thu, 15 Dec 2022 18:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bpT2VxaqzE+ebvVqyUdNG1r1J2GHyLskyB8LZMUFvCg=;
 b=lKK06erl4KLkwD8OTtriVvZqefs4RU4MtQnRPFoT4QJb4tCgf/RETiGbt1KMYSS5gr
 glEquNwHyA3mQORL9ZU6xDGwgQC4gJEhiNmy6Ai3O/yQTvwo4UKrhXNjKSaqXcatq7JR
 5v+uW293df5eXNeL4PqO9FAuDILrKKUsx5UzZN9VES43aTLRjbwMv0yS0JhwlFOGoPCo
 Mb3OVnG1RbGWjyLQnY3Au5RGfXC6tm1ThroORBCJLHNqXK7va8ZvIMBsDay+S9b3G1ve
 6iDwQurgEgl0SkszacFPN7M8CxzkjIhcdkLm6WVUxrxE9eLxMhwqTPkRFbwaoEUmTZOx
 amLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bpT2VxaqzE+ebvVqyUdNG1r1J2GHyLskyB8LZMUFvCg=;
 b=ieqQIIP4jv4NkQW9ZE2wvdrpHJEGqR+cEsx60QUjb5jtOHosW48z1Y2rxz/JsI0gbd
 KlQ/KqsEJASaGKF5bE/O8A/AGmUMoZLT1YgrtwBVCVLitVS0YEp6LCqz61Z1DRl9dc6y
 526m6Eyk5L+zCMf9Q4+IlRv3+ckmxgL06Jrk5O+2wRO9v9UTMGnhFzmKWmHso/B3RCJA
 docD7Nvh7WdKCQSUFHKpelM/+yT2JNKP4YEg+aqdMlgt6vfL8mc5eP4DrPosqbmCxWcO
 I14OYe3qJWrLleNbfi3RTh53X1Rjerxn+AtvVYQfHiX3WULFHVz3d+2kJiFeQRxDjbxe
 i4tQ==
X-Gm-Message-State: ANoB5pkdd3LLn2QABMnUB43ZvxlqDZfZH8qglNWELeCTJFOPqhT4nvPD
 8DMN0IIYJlRnI/AVkZ2UfVVzmNWyOcinyftw
X-Google-Smtp-Source: AA0mqf6IvdyCxz3bYaD/c2tXoPOX1n9p/mW6a0rF9smbZ9Gbg6LkqACROXJ00XSJidTvcET4oJmAEA==
X-Received: by 2002:ac2:4c51:0:b0:4a4:8a04:4b37 with SMTP id
 o17-20020ac24c51000000b004a48a044b37mr11429526lfk.32.1671156084151; 
 Thu, 15 Dec 2022 18:01:24 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41]) by smtp.gmail.com with ESMTPSA id
 x17-20020ac259d1000000b0049e9122bd0esm73375lfn.114.2022.12.15.18.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 18:01:23 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id g7so1306386lfv.5;
 Thu, 15 Dec 2022 18:01:23 -0800 (PST)
X-Received: by 2002:ac2:44c6:0:b0:4b5:7640:1a with SMTP id
 d6-20020ac244c6000000b004b57640001amr6455033lfm.140.1671156082892; 
 Thu, 15 Dec 2022 18:01:22 -0800 (PST)
MIME-Version: 1.0
References: <tencent_60E46E9E0EA5052F26E07A56520177BE0008@qq.com>
In-Reply-To: <tencent_60E46E9E0EA5052F26E07A56520177BE0008@qq.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 16 Dec 2022 10:01:12 +0800
X-Gmail-Original-Message-ID: <CANzO1D0du4TSza=-bnqZ+N9cGVfZ6P4xwYaiJg6doTzo7_MdYg@mail.gmail.com>
Message-ID: <CANzO1D0du4TSza=-bnqZ+N9cGVfZ6P4xwYaiJg6doTzo7_MdYg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/cpu.c: Fix elen check
To: Elta <503386372@qq.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, palmer <palmer@dabbelt.com>, 
 "alistair.francis" <alistair.francis@wdc.com>,
 "bin.meng" <bin.meng@windriver.com>, qemu-riscv <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000af689805efe858b3"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 16 Dec 2022 02:01:28 -0000

--000000000000af689805efe858b3
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Thu, Dec 15, 2022 at 11:09 PM Elta <503386372@qq.com> wrote:

> Should be cpu->cfg.elen in range [8, 64].
>
> Signed-off-by: Dongxue Zhang <elta.era@gmail.com>
> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d14e95c9dc..1e8032c969 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -870,7 +870,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error
> **errp)
>                          "Vector extension ELEN must be power of 2");
>                  return;
>              }
> -            if (cpu->cfg.elen > 64 || cpu->cfg.vlen < 8) {
> +            if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
>                  error_setg(errp,
>                          "Vector extension implementation only supports
> ELEN "
>                          "in the range [8, 64]");
> --
> 2.17.1
>
>

--000000000000af689805efe858b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 15, 2022 at 11:09 PM=
 Elta &lt;<a href=3D"mailto:503386372@qq.com">503386372@qq.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>Sho=
uld be cpu-&gt;cfg.elen in range [8, 64].</div><div><br></div><div>Signed-o=
ff-by: Dongxue Zhang &lt;<a href=3D"mailto:elta.era@gmail.com" target=3D"_b=
lank">elta.era@gmail.com</a>&gt;</div><div>---</div><div>=C2=A0target/riscv=
/cpu.c | 2 +-</div><div>=C2=A01 file changed, 1 insertion(+), 1 deletion(-)=
</div><div><br></div><div>diff --git a/target/riscv/cpu.c b/target/riscv/cp=
u.c</div><div>index d14e95c9dc..1e8032c969 100644</div><div>--- a/target/ri=
scv/cpu.c</div><div>+++ b/target/riscv/cpu.c</div><div>@@ -870,7 +870,7 @@ =
static void riscv_cpu_realize(DeviceState *dev, Error **errp)</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;Vector extension ELEN must be power of 2&quot;);</div><d=
iv>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}</div><div>-=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.elen &gt; 64 || cpu-&gt=
;cfg.vlen &lt; 8) {</div><div>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (cpu-&gt;cfg.elen &gt; 64 || cpu-&gt;cfg.elen &lt; 8) {</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp,</di=
v><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;Vector extension implementation only supports=
 ELEN &quot;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;in the range [8, 64]&quot;);</d=
iv><div>--=C2=A0</div><div>2.17.1</div></div><div><br></div></blockquote></=
div>

--000000000000af689805efe858b3--

