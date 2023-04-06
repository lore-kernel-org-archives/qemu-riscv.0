Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkEvi-0004RD-8g
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 22:00:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkEvN-00048d-Tm; Wed, 05 Apr 2023 22:00:30 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkEvM-0004nJ-BH; Wed, 05 Apr 2023 22:00:29 -0400
Received: by mail-ua1-x92b.google.com with SMTP id ay14so26923820uab.13;
 Wed, 05 Apr 2023 19:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680746427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g5rtZEiakVXWZ296s8AeJfUPss9RIMCPFcvSnf3xMHE=;
 b=dsaVWdnNY80rSOcfw2A7kwz2/wNqe0kKFedHjLeuKJjTkbLopGrxjUJuXuk+Z+XwKN
 u6UKd32GodL06OYmUdTCo0ZpGHQsi03Bgp9Js/FG+dUrCw+N1oNzFcneU1JWyf+Ol/MH
 So8Fsrx/zSqHzoFxVCcr4f/YwNxFRiMWRrJwG6KkGiQaEOOXXyd9XKMR8hzdbNKDOuTa
 86gVf5/ZyKBEfEurewNfQ2BjdZmMLqwMpXQ2VmhRscX+xfn1jAjWDvUlXq328HuQen3R
 I0Wjks0MJPOTQh9yH92lzd9ikAiCN32uvOG3J2Lkm9vzBfom1XXE7/6WtO4545FYT3P4
 t/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680746427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g5rtZEiakVXWZ296s8AeJfUPss9RIMCPFcvSnf3xMHE=;
 b=No1eGq7S0OYudTBJeQPV2HXiYAn2h472xUh3CEWlLE67Pvm3t11DjNlbSM+nwDhpzM
 fGODsJCCs9dMB9hihLsbVorE9PIKt0lF14IrR8gFMkzqJEp54+mc/4FB4x45NFrCq4sy
 aswGJNmcF/s7DAfTrA53z5Bu23o37bCpBc3SYeeF1njpeqyhrMc1TjNyn5YBpRtFeAuF
 8+59kRmsqPi83gNWIz2DDG9V/bM06G2EHceSRqiDS7iUtP9u8wlW/8XB8zoeDGn7zqSA
 QTaaEkbhxVl7oHYNDAkVAw0Gyfa7CE5LTZenrU0YnHQ8qSBMKgSqlFimQIlWA4Vrikuy
 WcFA==
X-Gm-Message-State: AAQBX9f3JPcf7GnPwR9CZ01F7xn75Y2rr9wvJ/3cEafS55MwpUDQPj0e
 MCCnQDAaeI5uu3of69rlg8hoDZHBgbYNFdeSDfU=
X-Google-Smtp-Source: AKy350ZK1xj4r2wlU46ZgVsMZ0fXuAYm5rRxjVK/RNPq7azmVELrS+SLZDJI6CFiBPPPMLVOu9whks6DOZCNiTMVbCo=
X-Received: by 2002:a1f:b244:0:b0:439:ab95:c2b1 with SMTP id
 b65-20020a1fb244000000b00439ab95c2b1mr3732069vkf.0.1680746426992; Wed, 05 Apr
 2023 19:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
 <20230329200856.658733-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230329200856.658733-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 12:00:01 +1000
Message-ID: <CAKmqyKMq6oMPKEWDCN57Duneoba56Si0FC=0w_Qis6B3eG471w@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] target/riscv/cpu.c: remove set_vext_version()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 02:00:31 -0000

On Thu, Mar 30, 2023 at 6:09=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This setter is doing nothing else but setting env->vext_ver. Assign the
> value directly.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 610e55cb04..19e0a6a902 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -245,11 +245,6 @@ static void set_priv_version(CPURISCVState *env, int=
 priv_ver)
>      env->priv_ver =3D priv_ver;
>  }
>
> -static void set_vext_version(CPURISCVState *env, int vext_ver)
> -{
> -    env->vext_ver =3D vext_ver;
> -}
> -
>  #ifndef CONFIG_USER_ONLY
>  static uint8_t satp_mode_from_str(const char *satp_mode_str)
>  {
> @@ -827,7 +822,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, =
RISCVCPUConfig *cfg,
>          qemu_log("vector version is not specified, "
>                   "use the default value v1.0\n");
>      }
> -    set_vext_version(env, vext_version);
> +    env->vext_ver =3D vext_version;
>  }
>
>  /*
> --
> 2.39.2
>
>

