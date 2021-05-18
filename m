Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lisxb-0002T8-4S
	for mharc-qemu-riscv@gnu.org; Tue, 18 May 2021 02:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lisxV-0002PS-OP; Tue, 18 May 2021 02:12:02 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:44010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lisxG-0004qJ-O1; Tue, 18 May 2021 02:11:59 -0400
Received: by mail-il1-x129.google.com with SMTP id m1so6438530ilg.10;
 Mon, 17 May 2021 23:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XrXDX6jicIz+JNviJVv92l6+AMoxqWkr9y7Z0QTI/iE=;
 b=iCbIgWEES92dxpiwA2SVJOsUka0kBGXZuscq0Y1qTCDw1her6nHq5XV7zUwUURd03/
 IRwTzYTfuppM+W37cDqdeq+s6jY8EORUqJWZVEVqwC1zrUXosJCe3spAOqjvUCZQ88ma
 +X5tef7Vc6c0OL6eaNir2Ei9y/31sRhj/fVrkYfRlXLANJOpUQ76uOSMLwVCz4FrYKb3
 Vfs5cxZPjJfFQoECp6Z/qC075IoIz+bEkIL1aUaEMQ/CavDpJ+UgYhXXnDzSVeUuRNbG
 5Oh+zgHqi71eXfXu40ncbM9ApTORjXFltVj5hCHhIvo+eoKVuVg4qGF+1LHHZxUUAA6e
 xC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XrXDX6jicIz+JNviJVv92l6+AMoxqWkr9y7Z0QTI/iE=;
 b=tDVPN5PI3NSBQ4rmiTzoqoOG1lzMbdpGjFumuiQTkSCd5AHmetb82EE9aZVTBoHk+N
 Q/MkgEmelvQQPUmDL+bHabQHuRDLe2AXeda70hz1IWhc9NkGFYUekUKwJ/5sCx3QnGw3
 PM7D6lgECkeyMhFif5NJgGnMP+QEsXkkFDvjokYzuGu0z4jwTdxFgS+DLgb8Gi7YJxl/
 WiUU3sYCYn3zqTt1Y5hHeF0CqFtLEIaakWtzH/P+0ZbnnApQsdptPAoXe5ohsYI08/da
 o2IYWmo+K4q93z/RrIPVM6A8hNj8Of76n3Sh8JJsSGugDhH0d+iCSG2xdFLcHN1mZS46
 rHRw==
X-Gm-Message-State: AOAM532PwurUnxwcP5XuYpaOFr4G0jpHj+/ActUrTRTKqbE3xTm23vhA
 Gd+/y2VlHNAZO0Oa7/SiETt/mnFGjN+DIZ/fero=
X-Google-Smtp-Source: ABdhPJxS6QOm79chwQRTIA8OpAsjDrZbDjmVBHacx2A4gfP93KLcF82T1VnryRfT3DlbpSRp9fMHLTNuHcrAN79ARVs=
X-Received: by 2002:a05:6e02:dcf:: with SMTP id
 l15mr2809755ilj.227.1621318303033; 
 Mon, 17 May 2021 23:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210517070851.857841-1-f4bug@amsat.org>
In-Reply-To: <20210517070851.857841-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 May 2021 16:11:16 +1000
Message-ID: <CAKmqyKNB4Tb2sMg9B17s3Ad_TZy9MY02_JRPS-1r1C1mjvq1bw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Remove obsolete 'CPU unmigratable' comment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
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
X-List-Received-Date: Tue, 18 May 2021 06:12:04 -0000

On Mon, May 17, 2021 at 5:09 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> The RISCV CPU is migratable since commit f7697f0e629
> ("target/riscv: Add basic vmstate description of CPU"),
> so remove an obsolete comment which is now incorrect.
>
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3191fd00822..d459e8427e2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -638,7 +638,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void=
 *data)
>      cc->disas_set_info =3D riscv_cpu_disas_set_info;
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_debug =3D riscv_cpu_get_phys_page_debug;
> -    /* For now, mark unmigratable: */
>      cc->vmsd =3D &vmstate_riscv_cpu;
>      cc->write_elf64_note =3D riscv_cpu_write_elf64_note;
>      cc->write_elf32_note =3D riscv_cpu_write_elf32_note;
> --
> 2.26.3
>
>

