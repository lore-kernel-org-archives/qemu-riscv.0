Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1miaeK-0002TO-Fk
	for mharc-qemu-riscv@gnu.org; Thu, 04 Nov 2021 07:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1miaeJ-0002Qw-2E; Thu, 04 Nov 2021 07:11:15 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:36457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1miaeH-0004dU-53; Thu, 04 Nov 2021 07:11:14 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id d10so13585446ybe.3;
 Thu, 04 Nov 2021 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nRmH3xLz6Ta446MJ0F1cvpbp8RaPNMR4UMUFwZsRnP8=;
 b=o4d/TUTdYB+APD6oE+eHi+SOS4SKZB8XIAAt4kl5+01bHR7Fs/0VZGex42hnUURlJZ
 rE1Or5GV8+2BQe7LrQE6uUKVVBa/5/qCd1Ar1scwwH1GM9x5iFUCwfKblvgE9A5W7tOs
 vgcw39+4RpKtpqiSOEVjsS2WYtQ06kd1gdrADoJntYcQJtvYLEmsTVYPRBNXVNke2521
 dhrXzryixcvWAcaii4hM9aYGfzdGreE9j0B7JIEndbhPlbuqAZuJKfD3h2wFNnnwH5zE
 vLKC5VHQVjkCHxQMLGo/5+BhQMm8v2WU1aHmaa3it4RfpmR342txeTb1rH09XNZqp+Ra
 b6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nRmH3xLz6Ta446MJ0F1cvpbp8RaPNMR4UMUFwZsRnP8=;
 b=y4VWC1eek3pXy1W3rKvdlurWq6Csjs9Dmd8OlixyfYoWg4dIaYz99YC3j2D0CzClMv
 eszidA6/3vMyMLdja78tFaUkJs3AZOM2Czq9kN7OkW5fySZ2YxTnALyobi9NiHEkeJQ6
 KMP1wR17lqBapBWf6PJToIg3ENCs6Uo8n9+gB+DKl//mHZtIGlqYlqscfs56tn6W7jCR
 +3CZVvaAub8xMKFEgWtHoZEoKXWyOP6ENuanSfalgia1rgPJMosb15BB3D93AasomD2f
 iHu0S4CNOpSjCXwSpIeZwVtqQSlYtArwvo1rZyqJ0PRJsmmilDmZ02qQ7cFgruHTDfzF
 FKTA==
X-Gm-Message-State: AOAM532opg1oWeJSf9u3E6vBf/orYuIzQiBJ4tFHyzwARH9Xv4nupuQr
 u3T52rhpq6MweCvRxIDy/VpVEh50ssKieuMFu8J4sroUuuw=
X-Google-Smtp-Source: ABdhPJwU7T7B9jMDl89TQnYthk0muwdmF1CRk1Bb7UvKFVppPsBGR21UP1fbWXyX2UOXasKr7bTlKroHhgcX7bwcDOE=
X-Received: by 2002:a25:258c:: with SMTP id l134mr29827271ybl.40.1636024268760; 
 Thu, 04 Nov 2021 04:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211025195601.245631-1-atish.patra@wdc.com>
 <20211025195601.245631-4-atish.patra@wdc.com>
In-Reply-To: <20211025195601.245631-4-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 4 Nov 2021 19:10:57 +0800
Message-ID: <CAEUhbmVVM7YOOaoax1JWuO-wHWCZN+FO42CyiaDKNLwbBaR7Eg@mail.gmail.com>
Subject: Re: [ PATCH v3 03/10] target/riscv: pmu: Rename the counters
 extension to pmu
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
X-List-Received-Date: Thu, 04 Nov 2021 11:11:15 -0000

On Tue, Oct 26, 2021 at 4:02 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> The PMU counters are supported via cpu config "Counters" which doesn't
> indicate the correct purpose of those counters.
>
> Rename the config property to pmu to indicate that these counters
> are performance monitoring counters. This aligns with cpu options for
> ARM architecture as well.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  target/riscv/cpu.c | 2 +-
>  target/riscv/cpu.h | 2 +-
>  target/riscv/csr.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1d69d1887e63..3b55f5ed0036 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -598,7 +598,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
> -    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> +    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 9e55b2f5b170..ebc1a8754032 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -294,7 +294,7 @@ struct RISCVCPU {
>          bool ext_zbb;
>          bool ext_zbc;
>          bool ext_zbs;
> -        bool ext_counters;
> +        bool ext_pmu;
>          bool ext_ifencei;
>          bool ext_icsr;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index de484c74d3b4..c486eeaffeb8 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -64,7 +64,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      int ctr_index;
>
> -    if (!cpu->cfg.ext_counters) {
> +    if (!cpu->cfg.ext_pmu) {
>          /* The Counters extensions is not enabled */

%s/Counters extensions/PMU extension

>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> --

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

