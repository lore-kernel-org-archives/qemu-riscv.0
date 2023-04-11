Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm5bA-0008F1-JR
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 00:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm5b8-0008Ee-FQ; Tue, 11 Apr 2023 00:27:14 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm5b7-0002pN-0C; Tue, 11 Apr 2023 00:27:14 -0400
Received: by mail-ua1-x92e.google.com with SMTP id o2so4800010uao.11;
 Mon, 10 Apr 2023 21:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681187231; x=1683779231;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RLns8lP5FhLyG+0iuNUij5IuX5TAhh+F5QSLo0GQknE=;
 b=MSsp9JbClrW08s59js0CSIVzTYGV/VCv9n8byFa5PBUemgTiYb+xWamAzXdrAzIKZ4
 k+/p/cPMuYKNppV13IiAI9HYPOOxmkzpp/CW+V5LvjG9o0B7OKVIOwspDDoOAHRP43HV
 Y5Z2bZKj5NxW+SCQRDYRyb6+M4x8BgeNolNHiqma/apI8JxDb2muZ9u1KJ2rtzBUNX/X
 wthaq12uWTk18L92zp193enxH1qHfQghhiCW52QYzMs4tuiSYCMpwLhU403Gneu3DrDW
 SAajtQTl/w6AJEvEjb9MLbnT8/zxdVzq1ykei0vt4AETyDOxtnCYTX/o99eT2zp0uH9H
 eCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681187231; x=1683779231;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RLns8lP5FhLyG+0iuNUij5IuX5TAhh+F5QSLo0GQknE=;
 b=CoRGq/3+vYf9nxj6VC4WFOR+WhuZ8mT5Tb4HNNggik0gTTa4YCzv5Reih7bXOlUqBU
 Hbg7oHBu6nbkY7d8zLjO+zVh5iQjSglKyeBO9QEkcZ2tpQFzk4xwnNlzwzyEerRMxdqS
 Xh9NGD8SX4vjMG+hr0K8JAr4fAiMaZcY/INn1gXgTJ0wLdaehhWjABrMCzBDE1+jLnrO
 6/KhOTl3cdpZ8Pg2XlKFXC0sbpLyGBTc9RcQx6SFES64RV14JFebei2P+6YCt205pGr9
 wUb5KxvaENQP2PH7XrHgEaYYut/nhnyl/rg2KpYMLmM4MnpVlzd6jGBCiP5wC+1kFo1d
 SypQ==
X-Gm-Message-State: AAQBX9feqLSERV+tdWqQ6KM9qNDhCQehe2xPZvKE7JQt+G0pam/nhEHX
 oraoKkNAsg3JYjxvkVsmN2nr9l4cNeytMTOh1JU=
X-Google-Smtp-Source: AKy350Ye+CndCRkf1BUjgDa6LXWBnqQh3LAQvDoTGe83EvRlHInBN6pmBG2Ou6iWDv8iVBIoezVzVVDTmvUM4CUbpS0=
X-Received: by 2002:a1f:910b:0:b0:406:6b94:c4fe with SMTP id
 t11-20020a1f910b000000b004066b94c4femr5370317vkd.0.1681187231292; Mon, 10 Apr
 2023 21:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-20-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-20-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 14:26:45 +1000
Message-ID: <CAKmqyKMqMfkmobTojXcJqU1toG-bK9sRP4MxQDor2+m8zBfceg@mail.gmail.com>
Subject: Re: [PATCH v6 19/25] target/riscv: Hoist pbmte and hade out of the
 level loop
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 11 Apr 2023 04:27:15 -0000

On Sat, Mar 25, 2023 at 9:56=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These values are constant for every level of pte lookup.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 833ea6d3fa..00f70a3dd5 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -870,6 +870,14 @@ static int get_physical_address(CPURISCVState *env, =
hwaddr *physical,
>          return TRANSLATE_FAIL;
>      }
>
> +    bool pbmte =3D env->menvcfg & MENVCFG_PBMTE;
> +    bool hade =3D env->menvcfg & MENVCFG_HADE;
> +
> +    if (first_stage && two_stage && riscv_cpu_virt_enabled(env)) {
> +        pbmte =3D pbmte && (env->henvcfg & HENVCFG_PBMTE);
> +        hade =3D hade && (env->henvcfg & HENVCFG_HADE);
> +    }
> +
>      int ptshift =3D (levels - 1) * ptidxbits;
>      int i;
>
> @@ -930,14 +938,6 @@ restart:
>              return TRANSLATE_FAIL;
>          }
>
> -        bool pbmte =3D env->menvcfg & MENVCFG_PBMTE;
> -        bool hade =3D env->menvcfg & MENVCFG_HADE;
> -
> -        if (first_stage && two_stage && riscv_cpu_virt_enabled(env)) {
> -            pbmte =3D pbmte && (env->henvcfg & HENVCFG_PBMTE);
> -            hade =3D hade && (env->henvcfg & HENVCFG_HADE);
> -        }
> -
>          if (riscv_cpu_sxl(env) =3D=3D MXL_RV32) {
>              ppn =3D pte >> PTE_PPN_SHIFT;
>          } else if (pbmte || cpu->cfg.ext_svnapot) {
> --
> 2.34.1
>
>

