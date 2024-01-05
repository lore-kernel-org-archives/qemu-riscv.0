Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCADC47074
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 02:53:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLaKW-0004et-V7; Thu, 04 Jan 2024 21:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLaKU-0004bW-Vc; Thu, 04 Jan 2024 21:53:02 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLaKT-0000UR-ES; Thu, 04 Jan 2024 21:53:02 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-4676dc16009so321280137.2; 
 Thu, 04 Jan 2024 18:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704423180; x=1705027980; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bkm/1r8pH1/tjxwn4ABPGiuvYkFb3WjqjfE2lwSHBw4=;
 b=QKRjAY5JGGgbLBDHtvB4KasAS3b2N6l60CY7LW9AhvcHUhCF3YCqmWL8aS9GVMNple
 oFY7LCObJv1tXler+OCfVIHenHT/WUREpkwAsW63t+I5Xx7xJqWSdiAJgFrhsTg0rUKT
 dtWuTrEpgq02+8I4IfcjtzjPH+lmYXoNyFn5uduh8UIRRXVq/iqImvmAuuyO5l2S5H4N
 1jh7r76akz1aD0EIBUnKXN6NT0gLml0kmrwYiGQOSldRpZbIx4yLoGYWhVgH7wheJqXE
 RGRXeALftAgNZXwa/z15xqpQM4Xwt8Ufgite2nuwHlVijoeLgqC7vE+6W5z+qKslSyDs
 paHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704423180; x=1705027980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bkm/1r8pH1/tjxwn4ABPGiuvYkFb3WjqjfE2lwSHBw4=;
 b=TlUHzxUlae2GlFVJtGewQcz2ePeIaQ6XG2n3kyEQKf2Tzj4NZG3aJYrpL1Z7HEUgNp
 ufAKHJeCwfNVErPQQ63mWBG7sNlOYfaGfzkkrcxVtj6A0GaoTCNTUPewi2XvUvRFU3aK
 GSe/18JcdCFncQMrDwbRcsd7mwLF9morpkqx2nKRzrolp5t09YjDRjhnzABFAtZ0dnkz
 uREbGlyTPpWU1eB562F8TQe0asUFf6/tqPDgZcIa1Crn6Mr7tR9TsefRwnA6ucKL0J2L
 7rxjMYqpV4UGZHcnvgsxQSnZh1v5uPbGNVhYk5E/kGMBi5P9oYt7dLzgIszubDfr1MkF
 yARw==
X-Gm-Message-State: AOJu0YzLWx83u9unoC6gE6YMaktJTwymrC8CZBUTyFjIV3bo0A+P6xUl
 e1P21E40payv0DoxkZ34RDjgZDYuXTUBfDjjehs=
X-Google-Smtp-Source: AGHT+IExA3LmKyMour6MZklxvQLBi40SAYlLTPHiVdhS4WnGpkSj0QqABWWtAC+vf4vGBOq/VMfvJL9/PmxkgRHwpxs=
X-Received: by 2002:a05:6102:5595:b0:466:f511:d410 with SMTP id
 dc21-20020a056102559500b00466f511d410mr963022vsb.10.1704423180031; Thu, 04
 Jan 2024 18:53:00 -0800 (PST)
MIME-Version: 1.0
References: <20231226040500.82813-1-luxu.kernel@bytedance.com>
In-Reply-To: <20231226040500.82813-1-luxu.kernel@bytedance.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 12:52:34 +1000
Message-ID: <CAKmqyKM1wmimumA84rf_a_0owD6syJorcaXW=nSJLnEXW3pFPQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix mcycle/minstret increment behavior
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, lihangjing@bytedance.com, 
 xieyongji@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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

On Tue, Dec 26, 2023 at 3:29=E2=80=AFPM Xu Lu <luxu.kernel@bytedance.com> w=
rote:
>
> The mcycle/minstret counter's stop flag is mistakenly updated on a copy
> on stack. Thus the counter increments even when the CY/IR bit in the
> mcountinhibit register is set. This commit corrects its behavior.
>
> Fixes: 3780e33732f88 (target/riscv: Support mcycle/minstret write operati=
on)
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fde7ce1a5336..c50a33397c51 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -907,11 +907,11 @@ static int write_mhpmcounterh(CPURISCVState *env, i=
nt csrno, target_ulong val)
>  static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulon=
g *val,
>                                           bool upper_half, uint32_t ctr_i=
dx)
>  {
> -    PMUCTRState counter =3D env->pmu_ctrs[ctr_idx];
> -    target_ulong ctr_prev =3D upper_half ? counter.mhpmcounterh_prev :
> -                                         counter.mhpmcounter_prev;
> -    target_ulong ctr_val =3D upper_half ? counter.mhpmcounterh_val :
> -                                        counter.mhpmcounter_val;
> +    PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
> +    target_ulong ctr_prev =3D upper_half ? counter->mhpmcounterh_prev :
> +                                         counter->mhpmcounter_prev;
> +    target_ulong ctr_val =3D upper_half ? counter->mhpmcounterh_val :
> +                                        counter->mhpmcounter_val;
>
>      if (get_field(env->mcountinhibit, BIT(ctr_idx))) {
>          /*
> @@ -919,12 +919,12 @@ static RISCVException riscv_pmu_read_ctr(CPURISCVSt=
ate *env, target_ulong *val,
>           * stop the icount counting. Just return the counter value writt=
en by
>           * the supervisor to indicate that counter was not incremented.
>           */
> -        if (!counter.started) {
> +        if (!counter->started) {
>              *val =3D ctr_val;
>              return RISCV_EXCP_NONE;
>          } else {
>              /* Mark that the counter has been stopped */
> -            counter.started =3D false;
> +            counter->started =3D false;
>          }
>      }
>
> --
> 2.20.1
>
>

