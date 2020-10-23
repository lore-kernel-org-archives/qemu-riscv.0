Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kW6jP-0003pE-QN
	for mharc-qemu-riscv@gnu.org; Fri, 23 Oct 2020 19:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kW6jO-0003p3-Hc; Fri, 23 Oct 2020 19:44:22 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:34580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kW6jM-0003yP-Js; Fri, 23 Oct 2020 19:44:22 -0400
Received: by mail-il1-x142.google.com with SMTP id p9so3030683ilr.1;
 Fri, 23 Oct 2020 16:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IuoUmRPA3BlqLb89JJDiAwlXFIFcPIh9PjYdR7XIV3Q=;
 b=S5uSEepR4/XVCg6W3bzIWG0Q/kfSbBmcKg1mn0azlNf+o8C6K47XwZEBn5cPfQNaLD
 PqSrNJD5pMQP9kLq/EdINC4/2XCa+jdK//wND17couoZXs6D/rxKTuTNZdBa2iCkPlHv
 fIUuFipS8KQe/+d7eckImwXbI5Ho3xa4sHrWGMkSD22KHZxX6spEQpeDB6NpSF61chpV
 eP+Zrukg3zZrtCRlqjCR8pcp9YO0FOACBzrXRe2Op6zgKiPQgRYb7iIrnIBS/vvgPkPP
 nrE+H1WP5uuDj5jTT4hJsJCnd2y4C2vwtu1PolFrLBe7TToD3nEKssuwVQj2xqDpXN8R
 IblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IuoUmRPA3BlqLb89JJDiAwlXFIFcPIh9PjYdR7XIV3Q=;
 b=Q/ZfhQGhPwAu+BeHP9EvYgMFaGY44FxT7rJ7l3jINy4h/xk+NqOc90o/sCzHuGWY8g
 Ru4Wayb5yrRyTYr3kqQb3wks8sEoYdUVJdmP+wJsjRxZkGuoOaRpheBsQPzZgkjTJPW+
 gNElMFk5nJ8OYDZqR/6ZJMgAPKOHsN8qRuxgI38KxetimvBp0RNbF6DOsfKC3ffz7uPD
 uY5OtnV7AVFtrYs5Ysp4JkmlbEmrRcsejJQ4pES0JdDFRLdNPqdKR6S3eJzrURBM2i8W
 lL+yX0Mr39Z/3TNPEhiSW+/qgJzo/oLomuG1cJywDy9FCDv7wfZ1JmhTXtOBSKV+tiju
 mYkw==
X-Gm-Message-State: AOAM532lGYkAJ8p9Mc4EFe8CEbP0kFmdTHlSx+iQft+KgfdgQUor2sBu
 TCjfdf32T0YVQFw78pDSkwMtWCrUtdYbXzcCHu4=
X-Google-Smtp-Source: ABdhPJx4ZAzfv7T1nuzy7SP8E1/4TeSDT43uNo9g2NV/vHNOadP1Ez6mgq3os3AWIcw4yBGOXgJfwdF1RXHuUeFyayw=
X-Received: by 2002:a05:6e02:c:: with SMTP id
 h12mr3821869ilr.177.1603496659157; 
 Fri, 23 Oct 2020 16:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201022053225.2596110-1-anup.patel@wdc.com>
In-Reply-To: <20201022053225.2596110-1-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Oct 2020 16:32:32 -0700
Message-ID: <CAKmqyKPfFLDQFR=BkTnV-M471d7ApT8OMAY8swiCwAXaTXG-8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/riscv: sifive_u: Allow passing custom DTB
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Fri, 23 Oct 2020 23:44:22 -0000

On Wed, Oct 21, 2020 at 10:33 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> Extend sifive_u machine to allow passing custom DTB using "-dtb"
> command-line parameter. This will help users pass modified DTB
> or Linux SiFive DTB to sifive_u machine.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 6ad975d692..554e38abf0 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -100,14 +100,25 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>      int cpu;
>      uint32_t *cells;
>      char *nodename;
> +    const char *dtb_filename;
>      char ethclk_names[] = "pclk\0hclk";
>      uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
>      uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
>
> -    fdt = s->fdt = create_device_tree(&s->fdt_size);
> -    if (!fdt) {
> -        error_report("create_device_tree() failed");
> -        exit(1);
> +    dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
> +    if (dtb_filename) {
> +        fdt = s->fdt = load_device_tree(dtb_filename, &s->fdt_size);
> +        if (!fdt) {
> +            error_report("load_device_tree() failed");
> +            exit(1);
> +        }
> +        goto update_bootargs;
> +    } else {
> +        fdt = s->fdt = create_device_tree(&s->fdt_size);
> +        if (!fdt) {
> +            error_report("create_device_tree() failed");
> +            exit(1);
> +        }
>      }
>
>      qemu_fdt_setprop_string(fdt, "/", "model", "SiFive HiFive Unleashed A00");
> @@ -390,13 +401,14 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>
>      qemu_fdt_add_subnode(fdt, "/chosen");
>      qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
> -    if (cmdline) {
> -        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
> -    }
> -
>      qemu_fdt_setprop_string(fdt, "/aliases", "serial0", nodename);
>
>      g_free(nodename);
> +
> +update_bootargs:
> +    if (cmdline) {
> +        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
> +    }
>  }
>
>  static void sifive_u_machine_reset(void *opaque, int n, int level)
> --
> 2.25.1
>
>

