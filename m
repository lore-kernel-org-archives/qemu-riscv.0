Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppdHJ-0002uO-Qg
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 19:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppdHI-0002oI-72; Thu, 20 Apr 2023 19:01:24 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppdHG-0004CM-Le; Thu, 20 Apr 2023 19:01:23 -0400
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-44066390652so324812e0c.1; 
 Thu, 20 Apr 2023 16:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682031679; x=1684623679;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rhk1YC1qUZfsi1ec8+Aj0S5fbwOkgvmWaduabBepsRU=;
 b=b/roN69pbAeco24GbYmppTuqEak2+ZoRkOfufMnJumYs8BVOsSMmnTN744LPQwqtAF
 /yA91lyOksevQI6byeVlE+kSgsrdyzKhoJFBw8mVNcWZZRkT9OXe7F/1TLwBPU/V7iAS
 lPH6yaHpZq7JwMFx+Bf8d3s/5kAHGdsnb7eutlA7s1cVOnjznYXlFyGTgbWBLj8fP9GA
 fKs4Xgoim/ls4eOrUX/3KtOx/ZQih8F01UD5NiL3fMvQu7017XvAjEMYpvg8c6DSlIfW
 zMgaGZZLg9C8v3ENPoJLu7n4dyC6W7UM1Um9GTVcTTSIHWQl4yayCqnPsWUmcP/TPN+l
 Cddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682031679; x=1684623679;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rhk1YC1qUZfsi1ec8+Aj0S5fbwOkgvmWaduabBepsRU=;
 b=FddCMLg5FknMLknP1dGlnUmXdQ7q9Ggvp0TVQMr+3pU7LBU2GE4J7h+8zOZvQJnqzr
 OKt7p9HGw41kmfwUnUXp8Bn+y9V4r20p7TNCPlzF5fGg/xusOYADgk6V99zwlDwDrhF/
 MqLqBfLU/5Uzw2yCyEjSfdVT0cboKYA1Z0+a4oahrwxDS4WT8fJpomsxSuUtT9VtfBEG
 sNe4qeJuAB1PbtbSwK50QsVxDDOo/IZd8y7FbGc/9jO+soJw9fsGvRCcKDSjTS5is1sF
 AUZ6na6cknF9+eVMZqRe2FxH1OKdVD5h4DjNlhkVv4IFB/4loQVuR/c9zpC4zBJDY1jA
 WMrw==
X-Gm-Message-State: AAQBX9dE+Aqlkb89/gc7yfFxjmbIlgdxt2dOENakFtX9yj8J77VYchkD
 9pZz93XG+7u3QDM6WWkRDZbRpn30Lkctl87EU30=
X-Google-Smtp-Source: AKy350awR3OnAwJqZqWosmO/ufwDmfmi5tJmnrRUw9IyHqT6wnSnag6aFpt1z91tphn77wZPAapHTqi1dJZngaE1Q4E=
X-Received: by 2002:a1f:4f83:0:b0:43f:bcdf:b60e with SMTP id
 d125-20020a1f4f83000000b0043fbcdfb60emr165668vkb.0.1682031678759; Thu, 20 Apr
 2023 16:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230420092100.177464-1-dbarboza@ventanamicro.com>
 <20230420092100.177464-6-dbarboza@ventanamicro.com>
In-Reply-To: <20230420092100.177464-6-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 Apr 2023 09:00:52 +1000
Message-ID: <CAKmqyKORdoVtSP72qbOcCAge_YGQFx31gqDL84UZL44Fdw7yvQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 05/12] target/riscv: Mask the implicitly enabled
 extensions in isa_string based on priv version
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 20 Apr 2023 23:01:24 -0000

On Thu, Apr 20, 2023 at 7:23=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> From: Weiwei Li <liweiwei@iscas.ac.cn>
>
> Using implicitly enabled extensions such as Zca/Zcf/Zcd instead of their
> super extensions can simplify the extension related check. However, they
> may have higher priv version than their super extensions. So we should ma=
sk
> them in the isa_string based on priv version to make them invisible to us=
er
> if the specified priv version is lower than their minimal priv version.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index dd35cf378f..9bb0e6b180 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1721,7 +1721,8 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, cha=
r **isa_str,
>      int i;
>
>      for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> -        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
> +        if (cpu->env.priv_ver >=3D isa_edata_arr[i].min_version &&
> +            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
>              new =3D g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
>              g_free(old);
>              old =3D new;
> --
> 2.40.0
>
>

