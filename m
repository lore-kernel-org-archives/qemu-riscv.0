Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi97y-00008S-Rz
	for mharc-qemu-riscv@gnu.org; Wed, 03 Nov 2021 01:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mi97x-00007G-A5; Wed, 03 Nov 2021 01:48:01 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:33450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mi97v-0001EH-N1; Wed, 03 Nov 2021 01:48:00 -0400
Received: by mail-io1-xd2a.google.com with SMTP id z206so1517843iof.0;
 Tue, 02 Nov 2021 22:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jwxNwYv8ARWaS8VgnWHDl+y6DJGRA5X617HrCfRc/2U=;
 b=PLDzI4SPWLmOQX9SnZtveaHH0P8Cd8CdGjPwCjzscJnLsPu7/rplId/Z9DkM+Bywkk
 UtlNbJ2Wsq8jFsqt6cT5x/INcGfwOxdRy3HPQty61W6Ao36oUAT2pxeDEicNVvZP+xC+
 3r1xdZmmbXp1ths1T4dwB7cno5GfDkJcWn9GABTKA1HQZF9OxkEr8S3aC5ChWNnatvgR
 PTngbbKqMXTDkQy/3oKeKfH/Yxc+pU+NE1TbIhDkEz6NJOeV0kGje7HhzfysVBOX3hjX
 R+PPLQrgErVJf0MI3zhKg/WNXFmqaYZD8cDRFziUCQsqcmWbMogVgXnNZPTCRYQBy1no
 TLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jwxNwYv8ARWaS8VgnWHDl+y6DJGRA5X617HrCfRc/2U=;
 b=Y36M6FIzUP+fiEFn1qnZ5Beb2VHngbko3t4bLR/fqwdRgH22AX6knGRHJkW46ZxUIa
 phf6Ti/LSHobSLuc7Bs+Cj8kXOOsX9VUNUCt8atY8dm2URpHMsnwfE5Ft7Y1BaDi9zkN
 E7MbEk62oicyyHGoeK3wKMBtbNrGsYVkMHoVSbKTSc6jlEgN8Jk0Pi/qMFIsihBLi1rm
 jyqCp6aOe0c1Gi13ZmPowSLLiXm5EJgN4N5Rwk04EzEknxCc9+fFvpoJ6Z+Kqx7GMJk0
 g+271/01fvUSZ9hQ5bmOCMNKWIfMEHfY5IVacQZSFvt60MGsHcL9EJBXL8TXlwBK9PKG
 8oLA==
X-Gm-Message-State: AOAM531fXlIcTlX2jd5XdZhKDFCkoH9k5u4/A1az/2KYzqheqL8fQL2n
 eflK11vTMIbFV31D2JdqKcRebyDBzCwJz+mcn5I=
X-Google-Smtp-Source: ABdhPJyCpmZih30CQo9ge6u4EddenzRob79wxKMPMM4thxDhKGPwYONJT8fW+P2yZvgPMdJT4ZaliTCRFMtgh8z4j6s=
X-Received: by 2002:a05:6602:2434:: with SMTP id
 g20mr2285399iob.57.1635918478097; 
 Tue, 02 Nov 2021 22:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211025195601.245631-1-atish.patra@wdc.com>
 <20211025195601.245631-4-atish.patra@wdc.com>
In-Reply-To: <20211025195601.245631-4-atish.patra@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Nov 2021 15:47:31 +1000
Message-ID: <CAKmqyKP3EyyT2mJ79Xvsv63mX4saSYJsDyZ+6pVN00yOEcg7Rw@mail.gmail.com>
Subject: Re: [ PATCH v3 03/10] target/riscv: pmu: Rename the counters
 extension to pmu
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Wed, 03 Nov 2021 05:48:01 -0000

On Tue, Oct 26, 2021 at 6:03 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> The PMU counters are supported via cpu config "Counters" which doesn't
> indicate the correct purpose of those counters.
>
> Rename the config property to pmu to indicate that these counters
> are performance monitoring counters. This aligns with cpu options for
> ARM architecture as well.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> --
> 2.31.1
>
>

