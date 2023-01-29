Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pLxJh-0004Wc-Um
	for mharc-qemu-riscv@gnu.org; Sat, 28 Jan 2023 21:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pLxJf-0004W4-P3; Sat, 28 Jan 2023 21:21:11 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pLxJe-00038A-9h; Sat, 28 Jan 2023 21:21:11 -0500
Received: by mail-ed1-x52d.google.com with SMTP id n6so5331211edo.9;
 Sat, 28 Jan 2023 18:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qwLDTk9CmgoO7XlG9QyaEWRrleW3MOLcZ5s2N37WJPc=;
 b=St+XqyCOoWmjCrzyI1xbLUaYhVjGgFJz6B8b2rlsnlbvAFtn5IpDYvsupKr2qvbNXw
 QfzCjMX6Iw2VXr9uusIrpkrALBda/pjYQtxYEE07hhNH1eH/aTaRXHza4hiYc/Lqhqll
 RDrUS03vEC4tPHA/qThySDBWUq5vONpq6VUugvwXDd04iMfaRbfL5wQvENCIc2OGiQsI
 Nl4IXg+grkUUuaUy1d+mk8Oso9ivHlaczW49jw5nMejoeBzK9SXesMo6YTj0PmgbtbAP
 EPFH80gCHWIByYc/q9GRLL5jn6eGUPBhKbgYEwe9cOHzVJjQTj0wofyvhuLqCgfyX/3b
 faHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qwLDTk9CmgoO7XlG9QyaEWRrleW3MOLcZ5s2N37WJPc=;
 b=0k5kbdlp13fTr4riyl7c6hoI9IiBzpkVJOPSXjkNSivPjin8w/HZSL3vdBboqwQ7wG
 ElhiDEtceW/N+NUltAiJuF11SQo8Ee7e7tgKGKOkM6DpHbT8ODPpbt5lou54mJDk74oI
 xR5OnwLDMt/uWLv641z8rca3xr/PrDF/Cb2/Dl5YB4Mwq1C39DG+1ABte58wqg/D12l6
 ifuwbe58g3ZAJjj8orMATja+fjY380hcRzNLta2t1IhQJQFf3Tu0wIyFmvdXu1f/x2YT
 kLJaspj/d12yQyheT2yvYqRXH6H6NaXYVfDa7j/A5xpwbzT0jdOjWOhLYiIqaKzOygSi
 yK6A==
X-Gm-Message-State: AO0yUKWhKlDtIh5dkAVMd6EZt1wJMyyMX4IxURLSszhYnQbBF2uCKsV+
 CTYJC/FU7t8XphSCzFlRzfjOdQuPqFed+hIyCfI=
X-Google-Smtp-Source: AK7set9o7VEQmtIOUBKFHvBQLqmHFwbed+QD+86s/khPeSGRl23rBzkV8C8NeNy/0+miw4AVmswZu/rTTLtAGEWBEvw=
X-Received: by 2002:aa7:ca48:0:b0:4a2:3637:568 with SMTP id
 j8-20020aa7ca48000000b004a236370568mr186240edt.83.1674958867404; Sat, 28 Jan
 2023 18:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20230126135219.1054658-1-dbarboza@ventanamicro.com>
 <20230126135219.1054658-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230126135219.1054658-2-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 29 Jan 2023 10:20:56 +0800
Message-ID: <CAEUhbmUyG1_6Aea-kt_dWNvqJtFMojuuUwABBOe4oPrecwLdOw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] hw/riscv/boot.c: calculate fdt size after
 fdt_pack()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52d.google.com
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
X-List-Received-Date: Sun, 29 Jan 2023 02:21:12 -0000

Hi Daniel,

On Thu, Jan 26, 2023 at 9:53 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> fdt_pack() can change the fdt size, meaning that fdt_totalsize() can
> contain a now deprecated (bigger) value.

The commit message is a bit confusing.

The original code in this patch does not call fdt_pack(). So not sure
where the issue of "deprecated (bigger) value" happens?

>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 3172a76220..a563b7482a 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -287,8 +287,13 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>  {
>      uint64_t temp, fdt_addr;
>      hwaddr dram_end = dram_base + mem_size;
> -    int ret, fdtsize = fdt_totalsize(fdt);
> +    int ret = fdt_pack(fdt);
> +    int fdtsize;
>
> +    /* Should only fail if we've built a corrupted tree */
> +    g_assert(ret == 0);
> +
> +    fdtsize = fdt_totalsize(fdt);
>      if (fdtsize <= 0) {
>          error_report("invalid device-tree");
>          exit(1);

Regards,
Bin

