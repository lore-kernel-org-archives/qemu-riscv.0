Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BD9CD13CF
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 01:33:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qi38I-00014l-T8; Sun, 17 Sep 2023 21:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi38E-000149-Mc; Sun, 17 Sep 2023 21:32:59 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi38D-0008VX-7w; Sun, 17 Sep 2023 21:32:58 -0400
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-49059b1ca83so1688481e0c.2; 
 Sun, 17 Sep 2023 18:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695000776; x=1695605576; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=76m7cvaZ280Me+UQsTR/RvLt5lIZvpQTxtVlDJmt9Hw=;
 b=TlvjwHvTutnc/7PZC5aXaEJBrS3/hME6NyrkTRyp9MWCu7fR3OZCAi8UZPTk0YkzMw
 RmdGm+/Pzo+iNJOCU97UEx6lOKPAt8P9/6JRDsDWFHJqCfOY4UH7e3hTeX+O14VthR3t
 WwtiHfod45GkhQDxvAz35zVq9cXTaMpdQAjR33bEb7tPveuIa85NPTap6fmVbM5wKtLT
 yI3oiaq2nBPh2YKrE7/Gvx899cf1XL5h113CY5069NKFFOn5UdReqvocOcrIFv5ASto3
 jyuViqerRu+1bwwQh9k3FbUc2AB2m4upca8OTWKNZKHZR7CHcFuihRm9oS8kjfRu9DMk
 C3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695000776; x=1695605576;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=76m7cvaZ280Me+UQsTR/RvLt5lIZvpQTxtVlDJmt9Hw=;
 b=vIo8ntSasXgcjayS3BTriNKWwKZMwgWYiMGW8LwZa/Ytq5RE/icigx6ZcavOn9OThL
 y7CUddJOZ1gWg9BjeB1aQiFhzFZ+/dktjvW0ir33zBPwx73ooDn/DNjqHr+5rl3DJbt6
 O2g26TFYYrm+95q/FBAZHHQvYcYakhlIZ90IXsszvLZWZPcKc4ZOQyNHCacIPl1oEZSK
 A5578KvIlpdzK9GUY1hNC03ZwCO0GILNWxMQLbBBzwGT+BdBWzJ9UDNLYXLIcyXRW9mA
 w7ZYEocTfnc9Z4xxSQxN8GaLgMe0G9tvv0tGxvKGC95L2Qj3xTltnkkjTasz1qgTJkUG
 5Ogg==
X-Gm-Message-State: AOJu0YxKCk5rA0e4Uza5XMSqmdYV8Hl1YeRzZbGMSBQaTmE39/DrIqSN
 WNOhKjh6+p1MXmTWQTqXdr9jgOAllDYmTsm6U1H0qTpvg+eL/w==
X-Google-Smtp-Source: AGHT+IG685SkvgfZ8JTpzXP2z+jnIjxUcyuozAPE2BY7od6XWzbhBtSDzO3SzsYoaZkhRJoiRyaOS8p9T8r5XBpqkxs=
X-Received: by 2002:a1f:4b81:0:b0:495:bd33:d1f8 with SMTP id
 y123-20020a1f4b81000000b00495bd33d1f8mr5772881vka.13.1695000775954; Sun, 17
 Sep 2023 18:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230914101751.772576-1-mchitale@ventanamicro.com>
In-Reply-To: <20230914101751.772576-1-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Sep 2023 11:32:29 +1000
Message-ID: <CAKmqyKNv+Wk6duL4Ww1QiC30O-W7kyypdd+kh3tjKDzFOy0Ybg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: pmp: Ignore writes when RW=01
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa34.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Sep 14, 2023 at 10:35=E2=80=AFPM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> As per the Priv spec: "The R, W, and X fields form a collective WARL
> field for which the combinations with R=3D0 and W=3D1 are reserved."
> However currently such writes are not ignored as ought to be. The
> combinations with RW=3D01 are allowed only when the Smepmp extension
> is enabled and mseccfg.MML is set.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  target/riscv/pmp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index f3eb6e6585..5b430be18c 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -119,6 +119,14 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32=
_t pmp_index, uint8_t val)
>          if (locked) {
>              qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - lock=
ed\n");
>          } else if (env->pmp_state.pmp[pmp_index].cfg_reg !=3D val) {
> +            /* If !mseccfg.MML then ignore writes with encoding RW=3D01 =
*/
> +            if ((val & PMP_WRITE) && !(val & PMP_READ) &&
> +                (!riscv_cpu_cfg(env)->ext_smepmp ||
> +                !MSECCFG_MML_ISSET(env))) {

MSECCFG_MML can only be set if ext_smepmp exists, so I don't think we
need both checks here

> +                val &=3D ~(PMP_WRITE | PMP_READ);
> +                val |=3D env->pmp_state.pmp[pmp_index].cfg_reg &
> +                       (PMP_WRITE | PMP_READ);

Why do we restore the previous value? It's a WARL so we should just
guarantee a legal value (which would be 0x0 I guess)

Alistair

> +            }
>              env->pmp_state.pmp[pmp_index].cfg_reg =3D val;
>              pmp_update_rule_addr(env, pmp_index);
>              return true;
> --
> 2.34.1
>
>

