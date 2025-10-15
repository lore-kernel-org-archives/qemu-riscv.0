Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF2ECCD184
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 03:37:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8sJu-0006Rl-6L; Tue, 14 Oct 2025 23:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8sJs-0006RG-Nh
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 23:36:56 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8sJq-0004XE-GK
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 23:36:56 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-6353e91a04aso6417134d50.2
 for <qemu-riscv@nongnu.org>; Tue, 14 Oct 2025 20:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760499410; x=1761104210; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dOJa5dAemTev4Uz8NZdQRrOF0mfQI5ZIzajG1m3vCNk=;
 b=Q+1GOPSDollrPPx/xgV7N5hFBe1TN9Mp6Bwc8fSzmgWbxcTt/LRuUv45PlR8Go7dLv
 juioaHv0i03gv9MjkPBGBoEECE0s6iQw5LmqTsZfAXJe5nllEv+6ijeayCbkiiioQMoV
 Cay/9917LGJC3snyx1zWcAcluDIR24pYaxsuNutnwu3s2vVGzKYH73QePfPcp7XiZXPM
 gc4oV+mfec6RVo5tKfs93nbX54Yn2D3d5wDFqusXE8a2axUYNRQKf/Q8iQ10RoPSDvgM
 BsCI32xQdydQYMsde54h04cYlXNlv9jOIvRt2OE7ci+S8/GAIPQY8U7zB44h8SnBGbxF
 fDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760499410; x=1761104210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dOJa5dAemTev4Uz8NZdQRrOF0mfQI5ZIzajG1m3vCNk=;
 b=kpZ0QbimZBHOPPOvH1zFSmy8DRTu+a3xN1wT6U17YWOi9HHukQ5e8RTxfW9d1+9diZ
 oq7Mhjy/uwGhq/XWiDKALMG8xUIxQqNhoDbTVIVoMF7x5D9JoBla0h6a6piKP+bbeMH4
 1OAthFZ6pxNytkVzsYfobwJFekwWtG7aDG7HXWPxsrWl78UBxSF4QEfdQy/qNkVZcskN
 ocyHnS/BikIjMHI5JyuNC396C24pSlk8oqjfZih8ncZcIxNRml6WF3wM6tdQ8NZAfQjT
 40AZW+RlHZCAqIfQ+U8AEBiMw4EPRXFJ8mxqskWjONhWitKZPxJ2CFNepuiFo8QRJQfg
 3Skg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKblzFiADT7Mvm7JHjy69doEEQdWjqgSfY/9jV3qSWXBi3HtDtyUXvJ1kpZncDbBLPYdVj7hiZADC8@nongnu.org
X-Gm-Message-State: AOJu0YwmsCqwtfjWCkNUp4ba6GConESfjZ5/IPfJeBdKLk3emVchWn4G
 cwrI7V2k6lRFYwBZFDCghSldVWIDsjsI6tNv0jGKOBUUj7WuOHGKoY9ZssFlgHOuQxuVmzuzpZ4
 BzQwj2nRDZ8EnaFvUUaaMOLWydbI63cs=
X-Gm-Gg: ASbGncucmxeb4OU6dEL+CsuVx+3wKJmIA4TlwjBV0d0Zk93JCj58YNfFOaIXv7Vh5/Q
 gjuazop/MaAomchAtAdrLdRjwyubVVhwTHAd0EqF4ja0JF98SSfHoz1K/NpMpKQ/v9UQDSFW2BR
 xAwf/3Y9xCEuSiaPv2ay+H6im6skZpQzZ5i93IrAd/Tei/f8L1MKQZm8S9TQ9sIhcP4bWdlH45X
 ULrxLuOLlqTExB5nK8Rf9V0YlEB+Fsdk1BZwd+/P4RWNFkKCaRvfiUNizmuJ9Z9ClU=
X-Google-Smtp-Source: AGHT+IGrENmNmtwm/dX35G+69kFX8oAz+K1GXYcJwY5O/bYdnEdog9y4N4ca9pql9fn4mhA58KHyR8pXdRtkPAuD/CI=
X-Received: by 2002:a05:690c:4a0c:b0:780:fdbb:5265 with SMTP id
 00721157ae682-780fdbb5de0mr334804317b3.19.1760499409821; Tue, 14 Oct 2025
 20:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251003104443.51501-1-djordje.todorovic@htecgroup.com>
 <20251003104443.51501-3-djordje.todorovic@htecgroup.com>
In-Reply-To: <20251003104443.51501-3-djordje.todorovic@htecgroup.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Oct 2025 13:36:22 +1000
X-Gm-Features: AS18NWD2d44Au1cj75AIooclTBgZYYwmHAqWXsRgvExNey_bq4wwlpXSxWZIMhg
Message-ID: <CAKmqyKP=Lu_1kq98LzuykGC=FK0-28OKtR=Pwixqg034NR3wLQ@mail.gmail.com>
Subject: Re: [PATCH v10 02/13] target/riscv: Add cpu_set_exception_base
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>, 
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>, 
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>,
 "philmd@linaro.org" <philmd@linaro.org>, 
 "thuth@redhat.com" <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=alistair23@gmail.com; helo=mail-yx1-xb136.google.com
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

On Fri, Oct 3, 2025 at 8:45=E2=80=AFPM Djordje Todorovic
<Djordje.Todorovic@htecgroup.com> wrote:
>
> Add a new function, so we can change reset vector from platforms
> during runtime.
>
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 15 +++++++++++++++
>  target/riscv/cpu.h |  4 ++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d055ddf462..d42cf9d70e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -73,6 +73,21 @@ bool riscv_cpu_option_set(const char *optname)
>      return g_hash_table_contains(general_user_opts, optname);
>  }
>
> +#ifndef CONFIG_USER_ONLY
> +/* This is used in runtime only. */
> +void cpu_set_exception_base(int vp_index, target_ulong address)
> +{
> +    CPUState *cpu_state =3D qemu_get_cpu(vp_index);

We usually use `CPUState *cs` in QEMU

> +    if (cpu_state =3D=3D NULL) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "cpu_set_exception_base: invalid vp_index: %u",
> +                      vp_index);
> +    }
> +    RISCVCPU *vp =3D RISCV_CPU(cpu_state);

This should be `RISCVCPU *cpu` and should be defined at the top of the func=
tion

Otherwise

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +    vp->env.resetvec =3D address;
> +}
> +#endif
> +
>  static void riscv_cpu_cfg_merge(RISCVCPUConfig *dest, const RISCVCPUConf=
ig *src)
>  {
>  #define BOOL_FIELD(x) dest->x |=3D src->x;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4a862da615..34751bd414 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -672,6 +672,10 @@ G_NORETURN void riscv_raise_exception(CPURISCVState =
*env,
>  target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>  void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>
> +#ifndef CONFIG_USER_ONLY
> +void cpu_set_exception_base(int vp_index, target_ulong address);
> +#endif
> +
>  FIELD(TB_FLAGS, MEM_IDX, 0, 3)
>  FIELD(TB_FLAGS, FS, 3, 2)
>  /* Vector flags */
> --
> 2.34.1

