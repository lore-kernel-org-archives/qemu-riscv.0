Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34ACECAC5B5
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 00:49:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v324a-00086U-BL; Sun, 28 Sep 2025 20:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v324Y-00085t-0b
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 20:48:58 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v324O-0003Dk-Kb
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 20:48:57 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b3b27b50090so236032666b.0
 for <qemu-riscv@nongnu.org>; Sun, 28 Sep 2025 17:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759106920; x=1759711720; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1FuQ3gqrZu3wFxEKLP/t2Zn/923IEv86jm1SwODhMIg=;
 b=ijyGW7yeGOdnS0Ivms0MPQp94j7tL4FcvlPXv2rpGzrjrC7nwfoIT/geqNjN31r9Xc
 BxCkvHrVuMNPz+appfkM7R7+TAqOBIlV02l0ZNa2F0iCfUnjdo73CWHZynGB3hAUrVvz
 +jh/VrAH/LdsmxQ318Fiffvp2yzW0a+07usZsPMPAn0I1U1oWJyaLQz7JBrNDUai+ak0
 /9t/fO+Js/CbhLuIJNN7tIZsPguRm9X7eqaPJYaAs9FzNxBTkNdiObs3M7iVHJWfftUh
 4IlTXrdo9uLJuTjZ8m0zgD9Hig40RUXQ4jNki3tY29830RT0Bn9PNnhxGyCmSJzeu8Lt
 B2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759106920; x=1759711720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1FuQ3gqrZu3wFxEKLP/t2Zn/923IEv86jm1SwODhMIg=;
 b=uHNmWA1GFRa/ZTAcjHd7xs/LFXZHsZlku4L1ezhJtOcl/HaUvQK2PAJxYPpTMTk4cE
 u4vJH9hCJP0H5A2TDA4K7jhZc4acntPFcIWAz173h0drynuL5184C2ln68lKbff5Tg9s
 Z2O7K1RBjl/UoxvwROeZQoGGiMlBKMiZWt6RvpkfebXRsq1meBWTPWhh3Nd9ENrQcDos
 TLsol3os5QqSOezM3XhBJalvkFq6zqyxuS5ch8ZJ75IQ72apZ97bY2DHXCRGNcZUh4+c
 fFqzDM1nm7mS1SIy+yrMs4uLiVAbUpkJ2oVDzGnBp3THm9/G4pkTIHCJZRq7Gd/wCF8A
 b76g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvzKnE6RwFIt5FXMWcPb5cI+XIkjdCk/iBAGcGJKdpqoUJTOliySvfCXtCLn62w0KHqR2eCmLfsNWp@nongnu.org
X-Gm-Message-State: AOJu0Yybw+ya081JuJYD6ZdZC6qrJXHvR+VibxcpeNeHn8R/eU+Wq+g4
 5rdjzB1eiRHVUidYEcCuiVfkReSD9bkZqBLftxuy/FN4EY6b3XV2NwYAq/TuzVXGxY5TGUJLYNU
 zwOxUXzCSJOmdZtS3t2FFqipyxYDy5Ok=
X-Gm-Gg: ASbGnctXYIxZgQOYu5/JqcA+oAz1tOcvMwfTtsqftvUPVKKnbpgC8Z509i7A5QwLT0h
 u5i59541Cwn5rgmvzc/YToRrEP7J7ZEn+q5mW4PAr1CRHjyBlTY5nu9BiExJgC/n/R9yqhx1HNT
 qjSdev73BRwxL5EQiVVSF5j2zCDVhzX94fNwRwdKOIUYkclh3+p8Ug0Afz+ciCxTLiM89j9YubH
 AeXkC6dwV+INj7yDyGvbz3Ms3M+i8MqMYnZ55wnM6un5Zb5
X-Google-Smtp-Source: AGHT+IE7tq0w67WJh8Pea89OWUcIrpAjMBd715KyLKouePsMX7610vPl1gPomdlYT0kl8kVlEVaTpxljyXEs8DwyRcI=
X-Received: by 2002:a17:907:6eab:b0:b3d:c47c:7cd4 with SMTP id
 a640c23a62f3a-b3dc47cab70mr296996966b.42.1759106920025; Sun, 28 Sep 2025
 17:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250924074818.230010-1-jim.shu@sifive.com>
 <20250924074818.230010-3-jim.shu@sifive.com>
In-Reply-To: <20250924074818.230010-3-jim.shu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Sep 2025 10:48:13 +1000
X-Gm-Features: AS18NWAApGyjWnIrnrMY84C9bx_y2UiT3GW7IYXyp-ol99Bp963zUnrexP0-eqU
Message-ID: <CAKmqyKPaPtLhKzZ2pJDVjPP8xENfC02YHOOMuLq0v0g+_N2J7A@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] target/riscv: Fix SSP CSR error handling in VU/VS
 mode
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Sep 24, 2025 at 5:49=E2=80=AFPM Jim Shu <jim.shu@sifive.com> wrote:
>
> In VU/VS mode, accessing $ssp CSR will trigger the virtual instruction
> exception instead of illegal instruction exception if SSE is disabled
> via xenvcfg CSRs.
>
> This is from RISC-V CFI v1.0 spec ch2.2.4. Shadow Stack Pointer
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 8842e07a73..0299a214ef 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -204,6 +204,8 @@ static RISCVException cfi_ss(CPURISCVState *env, int =
csrno)
>  #if !defined(CONFIG_USER_ONLY)
>          if (env->debugger) {
>              return RISCV_EXCP_NONE;
> +        } else if (env->virt_enabled) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
>  #endif
>          return RISCV_EXCP_ILLEGAL_INST;
> --
> 2.43.0
>
>

