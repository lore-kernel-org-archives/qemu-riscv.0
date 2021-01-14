Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l097z-0003hX-Rr
	for mharc-qemu-riscv@gnu.org; Thu, 14 Jan 2021 15:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l097t-0003gT-Tx; Thu, 14 Jan 2021 15:21:50 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:36205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l097p-0005st-Qg; Thu, 14 Jan 2021 15:21:49 -0500
Received: by mail-io1-xd36.google.com with SMTP id u26so13840687iof.3;
 Thu, 14 Jan 2021 12:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YaNE/paPh8P8JAilnJJhopKtZL3pGsaUN3JTvq/VNM8=;
 b=d6BzTin1vm3lVOD2b9CmfMoW+an/hfwu/KxzqXt5T45qCa7z8wVMa9BA7g+33qarQb
 p1beSR7wKfSZifwgJRYLS2t/v9gnj3i42vayaG9HDGdOzyu3xwKOO1so71FpTqM/IN84
 wV4BuZHcDRkCoiB+XWDXfXQxl0y955+FZ5BQG8/3QdM+7sAJrAehpwEjDY3Vt56IOv2B
 Aj9+lt8ZxooKlDJf7BwUP/gpKC0B5ieVbLffXg+PSz54hTLRFcu6banEnRssBRtd/yJS
 7KMf1PZ/kg6SxOAIoekBkIZKaXxo8IufHNg7IjcaS3TNDQyA6zI9FLPAWrA8whu2brmk
 uubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YaNE/paPh8P8JAilnJJhopKtZL3pGsaUN3JTvq/VNM8=;
 b=R0k1ykohdAQXIFRLeWM/KszfJJE8U0/z3GwdEMMAnD1hu3AZzE7YQXo6ocaURXriQ1
 68P/OoT5mssQYLtqaYlXCa1V9a8NR4ZDfIdlnl/ALq1+5To1kig8uIySEDzXSFPwgWqs
 NERRk6JOvS649RPRqtNkWYyF9TtmH0RacsNB5K8SS7YZ5dUftA5/8Q9e1i9g8xEk/DiD
 hEORJ9izGc0ZpjsbI+1kS5CxoNan58Mh07t5sI790wswr/I6ExIi50cbx2JoyeYbHuRu
 cUaGNt67/VQrvrJ3UE9iHEd4wOl4oeHA0jy6CGceVXifSZ8rYmuAEEkiOl7DwKgP3CuI
 azAA==
X-Gm-Message-State: AOAM532tHTrh5K0i3wHgbVK7mi2JWHhqVaCkIwTfhh4s7mfswC52LRLv
 dFw7EQyIeaGOTgzWzW7zbmfjTqvMJkPow97PbhT0UlTewYU=
X-Google-Smtp-Source: ABdhPJygQ9RC50bXbgIJrSUpkdBU81xfXa/FOqIh7NIR+YccQhmYjyw02aElbGeRgz4HL1PKz7+UH5932/1+D2XGFE4=
X-Received: by 2002:a05:6e02:194f:: with SMTP id
 x15mr8345818ilu.177.1610655704268; 
 Thu, 14 Jan 2021 12:21:44 -0800 (PST)
MIME-Version: 1.0
References: <20210109143637.29645-1-bmeng.cn@gmail.com>
In-Reply-To: <20210109143637.29645-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 14 Jan 2021 12:21:18 -0800
Message-ID: <CAKmqyKNVYvy8syVR530CLR6H_JpKO5_GrZpq4JJeCOYH6D+=Lg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: sifive_u: Use SIFIVE_U_CPU for
 mc->default_cpu_type
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Thu, 14 Jan 2021 20:21:50 -0000

On Sat, Jan 9, 2021 at 6:37 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> SIFIVE_U_CPU is conditionally set to SIFIVE_U34 or SIFIVE_U54, hence
> there is no need to use #idef to set the mc->default_cpu_type.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_u.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index f5c400dd44..e083510e0e 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -628,11 +628,7 @@ static void sifive_u_machine_class_init(ObjectClass *oc, void *data)
>      mc->init = sifive_u_machine_init;
>      mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
>      mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
> -#if defined(TARGET_RISCV32)
> -    mc->default_cpu_type = TYPE_RISCV_CPU_SIFIVE_U34;
> -#elif defined(TARGET_RISCV64)
> -    mc->default_cpu_type = TYPE_RISCV_CPU_SIFIVE_U54;
> -#endif
> +    mc->default_cpu_type = SIFIVE_U_CPU;
>      mc->default_cpus = mc->min_cpus;
>
>      object_class_property_add_bool(oc, "start-in-flash",
> --
> 2.25.1
>
>

