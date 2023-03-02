Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXfha-0002Tq-5f
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 04:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXfhJ-0002H1-8T; Thu, 02 Mar 2023 04:58:04 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pXfhH-0004Ye-Bu; Thu, 02 Mar 2023 04:58:00 -0500
Received: by mail-ed1-x52f.google.com with SMTP id cw28so16116142edb.5;
 Thu, 02 Mar 2023 01:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jTxxxHJHtIf9LULf+x8M0I67Yg5n3yE/af+39fWWzdA=;
 b=NDmAQgmO+tSphPgy/y3+KkZ1aTd80N42AtGeSUB8UA6Ijw4LBxx23ZPN6YSMV8h5NW
 u36lsq5DBD9KJ0MdjJMoLKr3TrAmH495VWTEjwRg1KsSFwWSX5kaxwqNYaMXXIyMCjjl
 T6kh8pTuw2JuAdByy8yJfsy8RUy49o0POntFKAimiWioPxxc7QncjpWLfncF/RPNa3dH
 sml0+gHZK1BHiL2howZgW0HrqHOyaQobjpwcMfeftk/zVxJm9JEd1bFYvd+FyIqRzBJD
 UBDlEiggPWlfGLQRU7Lm1F/Pwg8HIrcjZ7Iu96mmHOnk4aMqpLYPdv1XFhztAIPeSQe8
 Gx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jTxxxHJHtIf9LULf+x8M0I67Yg5n3yE/af+39fWWzdA=;
 b=uBGBt2MZWGK8HAeJHNkfoZ2VAE2GGV67wJ7ZkYicH1VT/evhnGdeHH5qKw1EGfvHcG
 QnPclSFwPMmm6+Gb06FjLOQV5Emx7cyd52c1WFZOMaDiNeSQITZCsJZdNKmX02JV9SXW
 j2eypFuN6uxU+Bos5ify7AvA3zt3ThV9nUdaoD/G6tbjsysxWKJOlVK2XFOC+GMf07Sd
 ZQBzAIcUfpBJtyEGBpLIYfT2hDln63OBMr4YYCZsdPRdrV7osJP/uSy3qTfTtNW7LCKI
 NjPSMzxSMWJ3wElEYiOub3Qhkm3Yo/EUwD8qfgdZzG+7m+s7T4SWt+cCPXqsOwCbltwm
 e8xg==
X-Gm-Message-State: AO0yUKXRtM1FD2udadFxNuRlNAskRTpcNPwyvwRxJkAFZVXE1MvX/HxI
 ddFqEOChsP7oUD/bQn281Wev39S/DopajNMOno0=
X-Google-Smtp-Source: AK7set9cACSQ2V3oUj/KRFF8WywWgX8I4pOaTOyJa9kia5xRqKNz8xZFlA69iPKS0iQVLn4nGT3g6lvpHVfEQlhd3lI=
X-Received: by 2002:a50:a695:0:b0:4bc:2776:5b61 with SMTP id
 e21-20020a50a695000000b004bc27765b61mr2887352edc.6.1677751075658; Thu, 02 Mar
 2023 01:57:55 -0800 (PST)
MIME-Version: 1.0
References: <20230302091406.407824-1-dbarboza@ventanamicro.com>
 <20230302091406.407824-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230302091406.407824-2-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 2 Mar 2023 17:57:44 +0800
Message-ID: <CAEUhbmXuECx1Ka9Mmvm_Y6DCvX55Grmmt1s3idbY7UDpQokn=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hw/riscv/virt.c: add cbo[mz]-block-size fdt
 properties
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 Ben Dooks <ben.dooks@codethink.co.uk>, Anup Patel <apatel@ventanamicro.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 02 Mar 2023 09:58:08 -0000

On Thu, Mar 2, 2023 at 5:16=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> From: Anup Patel <apatel@ventanamicro.com>
>
> The cbom-block-size fdt property property is used to inform the OS about
> the blocksize in bytes for the Zicbom cache operations. Linux documents
> it in Documentation/devicetree/bindings/riscv/cpus.yaml
> as:
>
>   riscv,cbom-block-size:
>     $ref: /schemas/types.yaml#/definitions/uint32
>     description:
>       The blocksize in bytes for the Zicbom cache operations.
>
> cboz-block-size has the same role but for the Zicboz extension, i.e.
> informs the size in bytes for Zicboz cache operations. Linux support
> for it is under review/approval in [1]. Patch 3 of that series describes
> cboz-block-size as:
>
>   riscv,cboz-block-size:
>     $ref: /schemas/types.yaml#/definitions/uint32
>     description:
>       The blocksize in bytes for the Zicboz cache operations.
>
> [1] https://lore.kernel.org/all/20230224162631.405473-1-ajones@ventanamic=
ro.com/
>
> Cc: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/virt.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

