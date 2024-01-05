Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD3FC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 03:26:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLaqY-0001FP-Mw; Thu, 04 Jan 2024 22:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLaqW-0001Eb-Ss; Thu, 04 Jan 2024 22:26:08 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLaqV-0007Os-9V; Thu, 04 Jan 2024 22:26:08 -0500
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3bbd6e37af4so840790b6e.1; 
 Thu, 04 Jan 2024 19:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704425165; x=1705029965; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bkm/1r8pH1/tjxwn4ABPGiuvYkFb3WjqjfE2lwSHBw4=;
 b=LCo6OM+8s890K3/q2l4AvE2e8PgDpxw7mD4I/mBSwbLr6VdzdzJUsfc71QQpeKi1Qj
 n25zvI2V7LENBHSH8K8oPaHZgLpFE8oCzIjGyi1UUK4+t4LiTxBJh9167HeUOfHRyzyD
 v7ElzECtD6ECLmajma5/4naX69TZU0Wk5lT/ijiLlYqazCeHjBZ1XgmHeOVduGMBMaO/
 LGK1Co8tkTglWeiU4/pNar7d6jHS888a7G0uQp9ZHwzv1qbeVKuHuodt0IcmuRxOfe+e
 c70fWK0JtSACtcF757kz4huJzP/Cy0KRQGBXByYT3OP3f2pL+XcVC/xF6y5ZlIIGVqWE
 36xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704425165; x=1705029965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bkm/1r8pH1/tjxwn4ABPGiuvYkFb3WjqjfE2lwSHBw4=;
 b=bkEMusdS/q6mt+k8R8yQCdxeYltQDi4nR9/iHa41EdzbJC8QoO5t204oSYa3Xxjtc7
 r1yo1TeNh9e9cnjIE+9wwCZ4krZG5vuCmXK3+OYvfSBtMIBZLiFgVQ7cv8tlFcsU0UoM
 ikl9P7D5ZjGOHy1Hm0hheXLM/1sVWIPyYtKiEJRJcMEZ8VNVu6+vklBziXpHXXJtfe83
 +Gsv64if2jV4kqStSUVGbh5lgFa4gQ2geTD5UR/3/vIJHi6XOhMt840LwNQZ+vXclRMd
 ybBRuj9qacW0vI0sSLbTHfzJ5a+AWZi13goN+Z8rY3usRCrUVAlZYqELnoW4HnVGYgF1
 zwiw==
X-Gm-Message-State: AOJu0YxuNq652UGbw7Q6NtYgNnTTZ9sYNWxqDOGhxIwLIHxPGUwG7Dbe
 XfWhvHEl3UiCGNlUBQXY9etn8uz88GWxqNdzT6k=
X-Google-Smtp-Source: AGHT+IHphwB6RAABKdUDTErh2wTsFwM0TOpfhf+TIXmIiLpD7tJYkvCvC0jdeL+np2oUd0diQ5tU1n8nfNNhf2em46Q=
X-Received: by 2002:a05:6808:4488:b0:3ba:d14:b846 with SMTP id
 eq8-20020a056808448800b003ba0d14b846mr1746907oib.82.1704425165459; Thu, 04
 Jan 2024 19:26:05 -0800 (PST)
MIME-Version: 1.0
References: <20231226040500.82813-1-luxu.kernel@bytedance.com>
In-Reply-To: <20231226040500.82813-1-luxu.kernel@bytedance.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 13:25:39 +1000
Message-ID: <CAKmqyKOEy0=ADKvmN9m60bzL=VYBm8tU6sHZ8JU0RHhQ+ni_5A@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix mcycle/minstret increment behavior
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, lihangjing@bytedance.com, 
 xieyongji@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x231.google.com
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

