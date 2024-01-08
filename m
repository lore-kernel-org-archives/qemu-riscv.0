Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1851C47074
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 00:43:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMdj7-0007XR-KL; Sun, 07 Jan 2024 19:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rMdj3-0007WV-SG; Sun, 07 Jan 2024 19:42:46 -0500
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rMdiz-0003Er-H7; Sun, 07 Jan 2024 19:42:44 -0500
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-467010c1c72so843277137.0; 
 Sun, 07 Jan 2024 16:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704674560; x=1705279360; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/YieroAu1/k0iYDoqTvoj21wLi6W/2h6d4dWR97K0o=;
 b=GRGuzF1oiFrKhorS18MAwogous7rynJS1cbUKBRcERoHxhmpoF4htPFPxPcMQ7whub
 0Lo62nVpQrC3zYO42auhiiS3ALoG43FIv3gdOJUUqr72XNjFUfXADKPxpD+Swpu0lUpu
 L8zGvUlsGu41PJObMhdqcnukQYrPSj4icjtKe4IyQv8zlAk07Jlb5PSsu7TZ9nrCtcZu
 w7ZVwi//yPbvfiux30ND3whyGY+SmoYjenmTrHdbIHMMXqw/05j7o25R60DTDLL6I3eC
 eJwio0E0mAD5/f3EJDdK/lCaRMFnnVXuCtdOndu6xDw1YH1KPdBELUIF/SND26m+w2HB
 KylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704674560; x=1705279360;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/YieroAu1/k0iYDoqTvoj21wLi6W/2h6d4dWR97K0o=;
 b=VxefoQGOXBn1WcknrM8RQs3ghLiMbylLCW8sYGXbZZtISs1g+Mp296CKK7tvIClTce
 7NoCQPKVy4+1n+Cruaz3q1K0LS9tTT/nnw88wbT/8yEx4hW7knyce6wEn/XR/8HAe739
 0pJeSCY/WRLFQJ7rTo4iqI5odmbD2YI+EW2sIATSqgVrmVfWsUpen+UfguJUUdKSkKAe
 PKBKOk5VNROQ7K5E+ru+cJxpUCZiPEVLcGHSxYP/HLSp6K//geXK4nRDXXA2rD3ESXPu
 OqBuoHOXN/6/pLL0tUfsIl5H+lJR9K5iQ/r6+w6FJz3EJeBZ0t7jPfBtwosbFUhAD4jW
 veqQ==
X-Gm-Message-State: AOJu0Yzea7zm/Jaz64gaVRcmJQTjFsiNJYmdlIMVzZfmK+mTI+9bGjtG
 wiNZumKj8UKpXpZcnPKWyGwRCVlaB4J7+nYykK0=
X-Google-Smtp-Source: AGHT+IEGYcDhimvTX7C66iiOB79fLhjYDjERnSMLT9u6tlT75oICoiB8D4SRh3lnJ92LPDc/gheVJxWuotWS3jEUoTc=
X-Received: by 2002:a05:6102:2745:b0:467:993e:2663 with SMTP id
 p5-20020a056102274500b00467993e2663mr3439935vsu.8.1704674559960; Sun, 07 Jan
 2024 16:42:39 -0800 (PST)
MIME-Version: 1.0
References: <20231220153205.11072-1-ivan.klokov@syntacore.com>
In-Reply-To: <20231220153205.11072-1-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Jan 2024 10:42:14 +1000
Message-ID: <CAKmqyKMpoqMXW_vH0f9nb9q5=UUeb37Onr4f1pk6VVp3cR_QpA@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: pmp: Ignore writes when RW=01 and MML=0
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Dec 21, 2023 at 1:32=E2=80=AFAM Ivan Klokov <ivan.klokov@syntacore.=
com> wrote:
>
> This patch changes behavior on writing RW=3D01 to pmpcfg with MML=3D0.
> RWX filed is form of collective WARL with the combination of
> pmpcfg.RW=3D01 remains reserved for future standard use.
>
> According to definition of WARL writing the CSR has no other side
> effect. But current implementation change architectural state and
> change system behavior. After writing we will get unreadable-unwriteble
> region regardless on the previous state.
>
> On the other side WARL said that we should read legal value and nothing
> says about what we should write. Current behavior change system state
> regardless of whether we read this register or not.
>
> Fixes: ac66f2f0 ("target/riscv: pmp: Ignore writes when RW=3D01")
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 162e88a90a..c0b814699e 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -126,7 +126,7 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_=
t pmp_index, uint8_t val)
>              /* If !mseccfg.MML then ignore writes with encoding RW=3D01 =
*/
>              if ((val & PMP_WRITE) && !(val & PMP_READ) &&
>                  !MSECCFG_MML_ISSET(env)) {
> -                val &=3D ~(PMP_WRITE | PMP_READ);
> +                return false;
>              }
>              env->pmp_state.pmp[pmp_index].cfg_reg =3D val;
>              pmp_update_rule_addr(env, pmp_index);
> --
> 2.34.1
>
>

