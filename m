Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0dzJ-0002HY-CW
	for mharc-qemu-riscv@gnu.org; Tue, 06 Jul 2021 01:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0dzH-0002H9-Su; Tue, 06 Jul 2021 01:51:15 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:44867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0dzG-0001MC-2b; Tue, 06 Jul 2021 01:51:15 -0400
Received: by mail-yb1-xb36.google.com with SMTP id g19so32487978ybe.11;
 Mon, 05 Jul 2021 22:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rs7CgglGZGHMEXtjP9nb8ttTdEeYUOYnRKc6v6qD+IQ=;
 b=IPZRUpyF2zp3JD551D8m3wsktqh5las08p+H0Pi2rdFrnib0jGSsMCeYJPLkr9XYos
 6kf84BWFbvSFr2XL7BWxJCo0GrXt7TW5NEPyf8tQF2WjgnpEbPxD/aBV1xfgTQMNI7Sn
 YKkU1iqp8zoXxw9TmpFV+6U9/6rzrdHE2MB2YBuXSbr4yxL3ypMfPyMeHS8llckmrVUy
 pm25erdc7Xsfh0vYVkplpu14KO5o0/F6Cz800sIfiyqmfEuxtCA9gfRmS09sIdljC7eI
 5NghoZrD4DOGCBLZRCyoJorPRA5Lzg4Mb6veTZhIkpFIq5QXkVKkTMuxn/wiITHk065B
 g+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rs7CgglGZGHMEXtjP9nb8ttTdEeYUOYnRKc6v6qD+IQ=;
 b=UiXJ2lat4ArdNPftdTKdIBSvSQ1qGnQcC/v3FcDbtgo7MtJ/ZkLKW657zCDx6gNkYA
 UQgudKyCQkICRyRTvGBxfckwuwETomaYAUYcHfgLMykbCnzGlAlLYWVDOjGKLnUitYco
 SLQ3gRKkx/kSW3UPfiVwgNi0eDk1qBjr/bVIeu9T+6Ks8ybfrURtTH8Na7QixkwYPCe4
 m6CqOGIoKV4VSKfvy+WhXXzi25Ctf6Ji08k3MIWp/9zgakfjsJDYnKVPRs5eDAFF4ZnF
 XZCbfp5vKp0cCMRMWJrdfNo39qlym4a4tQSrK9fBCg8Nb0+MWeyd90I8vujkn2k6rGYL
 HkiA==
X-Gm-Message-State: AOAM530v712GnsrbEPL0t9oJ8vzC3zcSY5VFyy9EAT/ZI2o3tfT1cBNC
 MuUFZ9enx2Y+IMg9KMU8sgMekgT4zZJ2Nt2P7BA=
X-Google-Smtp-Source: ABdhPJyMbdfd3RSlCxTj5E4OBTbXjWUp5SZ/XXXa7LU/8R9JoP2S0oQOCismOCoNk4Gjshb3Ko+eucz4JC0P5f7ZR20=
X-Received: by 2002:a25:6c04:: with SMTP id h4mr22839624ybc.122.1625550672686; 
 Mon, 05 Jul 2021 22:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210706035015.122899-1-kito.cheng@sifive.com>
In-Reply-To: <20210706035015.122899-1-kito.cheng@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 6 Jul 2021 13:51:01 +0800
Message-ID: <CAEUhbmWxsKV26wN2viPVtTLfWsbZHEghM-nGJePH7qROEp7MFg@mail.gmail.com>
Subject: Re: [PATCH v3] linux-user/elfload: Implement ELF_HWCAP for RISC-V
To: Kito Cheng <kito.cheng@sifive.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, frank.chang@sifive.com, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Jul 2021 05:51:16 -0000

On Tue, Jul 6, 2021 at 11:50 AM Kito Cheng <kito.cheng@sifive.com> wrote:
>
> Set I, M, A, F, D and C bit for hwcap if misa is set.
>
> V3 Changes:
> - Simplify logic of getting hwcap.
>
> V2 Changes:
> - Only set imafdc bits, sync with upstream linux kernel.

These changelogs should not be in the commit message, but should be
put below ---

>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> ---
>  linux-user/elfload.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 598ab8aa13..42ef2a1148 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1434,6 +1434,19 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
>  #define ELF_CLASS ELFCLASS64
>  #endif
>
> +#define ELF_HWCAP get_elf_hwcap()
> +
> +static uint32_t get_elf_hwcap(void)
> +{
> +#define MISA_BIT(EXT) (1 << (EXT - 'A'))
> +    RISCVCPU *cpu = RISCV_CPU(thread_cpu);
> +    uint32_t mask = MISA_BIT('I') | MISA_BIT('M') | MISA_BIT('A')
> +                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C');
> +
> +    return cpu->env.misa & mask;
> +#undef MISA_BIT
> +}
> +
>  static inline void init_thread(struct target_pt_regs *regs,
>                                 struct image_info *infop)
>  {

Regards,
Bin

