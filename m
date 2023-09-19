Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DFCCD3437
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 04:41:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiSXk-0004qS-0g; Tue, 19 Sep 2023 00:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qiSXj-0004qB-5m; Tue, 19 Sep 2023 00:40:59 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qiSXh-00056p-LV; Tue, 19 Sep 2023 00:40:58 -0400
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-7a8b522ae46so1147309241.0; 
 Mon, 18 Sep 2023 21:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695098456; x=1695703256; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nthpnj9MPowcHvclaktB1MqE/wDyioa80MVV1fMXY7w=;
 b=C9pvnBucoLwRT/auB5jrIHem5ikFLOGGGT7YW175UBGblJigkQNT7CaGAYvqip7qL9
 D+mIlZ6Af/4R1Y3RUDDM5+4lLG3FewpzIlhkQZ3X00vpEa1Q4lK/9D1m7V8Kzxm3zdYJ
 cILhX62FwCd/ZVNF95cafifXbGc8AoKfcpqXkpGRMCzV3ZgCfn375pBRw/e8QEcen0YO
 7UoAg3SnVKjTPdBWx1SSu+05XVLde1IW0JTjIKSx76Rnv9GsL6VaNqiEUiE3TlWxv6s9
 1Lqceu90SJ7QrBO/yTXGOpqFB/tz04C+CUWLEZ0AFsetmtrVPGTpmEDHdWD5mV8gH9jl
 KGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695098456; x=1695703256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nthpnj9MPowcHvclaktB1MqE/wDyioa80MVV1fMXY7w=;
 b=p4nbFaBABk185Du+mpDv5vk1uV1yDCEY6SGIY+n1PnfWCsu3+c90E71Ozm0JueiJ8L
 C4xGjV5kaPaIlE6nKhiKyETFfEdHaL0qikWorvy266UcvhH578OfnxZBVZXOqdTMt7Uy
 hRjDPoiBRDvKBrWab9dO7ZplwRnxbyY/fU48lPEGvBm1fNFyMCJlltg8jnSthkHDwBwF
 FAaDp+I3gl/spyjMGfaI9r6+XKHW6z5stccbA/RXl0kNlQPj87CGy/TKRiIloO88ztKq
 xVymEuP/HrbzlHtlZ77F2NbgHwxj9vzrglx5ECHYCAzvBQNjIyPxXRdhBv9CpZ56aA/G
 u+9Q==
X-Gm-Message-State: AOJu0Yx2ZtlR+T0HC+F9VMYnIeY+UFuuc0NlEbL2ki9hcB7PLnztQpNl
 0EL9OcAV1CcVm1f0+Ve8e0wPRfRsfDwBeTmGNFnw5MxYWpKhvhB7
X-Google-Smtp-Source: AGHT+IG1D4p822whTsOoZ2NjkecNzTN6wV0aGEydUNl6buOcrAE/eHzAYODs3fupAeNn/F+4unByUHsykb/RzlRqXGE=
X-Received: by 2002:a05:6102:4ac:b0:44d:590d:28a6 with SMTP id
 r12-20020a05610204ac00b0044d590d28a6mr9251160vsa.27.1695098455958; Mon, 18
 Sep 2023 21:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230907062440.1174224-1-mchitale@ventanamicro.com>
In-Reply-To: <20230907062440.1174224-1-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Sep 2023 14:40:29 +1000
Message-ID: <CAKmqyKOTmQ_PJTvCoKJJon_zEkKEsM7AoP7LEz9Dtq4MJR95Ug@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: pmp: Clear pmp/smepmp bits on reset
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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

On Thu, Sep 7, 2023 at 4:25=E2=80=AFPM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> As per the Priv and Smepmp specifications, certain bits such as the 'L'
> bit of pmp entries and mseccfg.MML can only be cleared upon reset and it
> is necessary to do so to allow 'M' mode firmware to correctly reinitializ=
e
> the pmp/smpemp state across reboots.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 11 +++++++++++
>  target/riscv/pmp.c | 10 ++++++++++
>  target/riscv/pmp.h |  1 +
>  3 files changed, 22 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0843461660..77ed653b8d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -896,6 +896,17 @@ static void riscv_cpu_reset_hold(Object *obj)
>      }
>      /* mmte is supposed to have pm.current hardwired to 1 */
>      env->mmte |=3D (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
> +
> +    /*
> +     * Clear mseccfg and unlock all the PMP entries upon reset.
> +     * This is allowed as per the priv and smepmp specifications.
> +     * and is needed to clear stale entries across reboots.
> +     */
> +    if (riscv_cpu_cfg(env)->ext_smepmp) {

Does this compile? ext_smepmp doesn't seem to exist

Alistair

> +        env->mseccfg =3D 0;
> +    }
> +
> +    pmp_unlock_entries(env);
>  #endif
>      env->xl =3D riscv_cpu_mxl(env);
>      riscv_cpu_update_mask(env);
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 3f6c8cf08d..f3eb6e6585 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -131,6 +131,16 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32=
_t pmp_index, uint8_t val)
>      return false;
>  }
>
> +void pmp_unlock_entries(CPURISCVState *env)
> +{
> +    uint32_t pmp_num =3D pmp_get_num_rules(env);
> +    int i;
> +
> +    for (i =3D 0; i < pmp_num; i++) {
> +        env->pmp_state.pmp[i].cfg_reg &=3D ~PMP_LOCK;
> +    }
> +}
> +
>  static void pmp_decode_napot(target_ulong a, target_ulong *sa,
>                               target_ulong *ea)
>  {
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index cf5c99f8e6..2c5ec3cdf1 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -81,6 +81,7 @@ void pmp_update_rule_addr(CPURISCVState *env, uint32_t =
pmp_index);
>  void pmp_update_rule_nums(CPURISCVState *env);
>  uint32_t pmp_get_num_rules(CPURISCVState *env);
>  int pmp_priv_to_page_prot(pmp_priv_t pmp_priv);
> +void pmp_unlock_entries(CPURISCVState *env);
>
>  #define MSECCFG_MML_ISSET(env) get_field(env->mseccfg, MSECCFG_MML)
>  #define MSECCFG_MMWP_ISSET(env) get_field(env->mseccfg, MSECCFG_MMWP)
> --
> 2.34.1
>
>

