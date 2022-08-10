Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLtjF-00054r-1T
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 17:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oLtjE-00054U-8a; Wed, 10 Aug 2022 17:59:04 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oLtjC-0002rL-Oj; Wed, 10 Aug 2022 17:59:04 -0400
Received: by mail-pj1-x102e.google.com with SMTP id t22so16060641pjy.1;
 Wed, 10 Aug 2022 14:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xhtWj2em78Lwfjy0evJ0SD9EazqFIXKyb3M3uWhpaZc=;
 b=kpiHqj7DxqP+A85xSaobBfqJi9lKAimHQGMkOe2urI3Z4L3B6hgLa741tsRCd2WeEP
 tLXkJloskhYUF0OEAZmhoEuCx2pkbcbGbv8z4AzXCXhgE6NCpukkBIj0D3haMcOURTkT
 KDmQY+pZfrX1tbAh+z+z5lTgsYG/h6KHOXdxg9AmMQW49MbVxImtsA+vEVki0w7wYnTQ
 qncRFNr/WnTPrzQnX4OFZrXRABBmRQ6Wb7W+JGA0ifg52is0ywgcIAs4lbaa9/KY4osn
 y1ktweYb1JGp71XX/1YHKuiZiXxamMiFtrg8aniD3XXOcAVv8sBDYx3ek95Iz2OYlraW
 AFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xhtWj2em78Lwfjy0evJ0SD9EazqFIXKyb3M3uWhpaZc=;
 b=XhgLlcskXOCuCHU+Ehbe90ygW4/ccZKYipKt1WVv43qV005Rno1WlKQloznRPZ5OBU
 U8/+/L77n2CowvKUd0g3qo39dBz7x6g/UGWIgZwlbiyXYb8gYpVYD4eMx7Rhh1QPUpux
 +NY+5KML49rg3C3iKi4kOGSDi4+LPeWEpvRrQ4wWlxOe2Pg0lnEQohFfAZZF4zPJeuVG
 7utcGE5Pe4hcj4iLJkewZU1gP9QKGSJQTaQUb5pkPLEqYQa+1KNxPmolLfkRX+8d7456
 CVeAO4YPivdRz/dyfkFlA8YKlElgXs36vBzfW5GphiUA7UBH6mvBPyRU7jaMj4+BomDK
 9szQ==
X-Gm-Message-State: ACgBeo1W60Rwlm+JPEpKf3/Zc3FCoyHNqUbTo039TQG4YxFWjdkk3vV1
 x+xug8xsZJpQMlqfA1whwCzOwF8tB73Awq6dUEs=
X-Google-Smtp-Source: AA6agR5MSl+1koRqrhMvKF/HXT+BZ54QcdzZZ1mjMjBZuV0Zsihwd7tLS9wEYtulspzy/+dAKBXtntOMIyF/hBuXBUw=
X-Received: by 2002:a17:903:2291:b0:16e:cf55:5c72 with SMTP id
 b17-20020a170903229100b0016ecf555c72mr29712083plh.121.1660168740092; Wed, 10
 Aug 2022 14:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-3-qemu@ben.fluff.org>
In-Reply-To: <20220809185639.750345-3-qemu@ben.fluff.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Aug 2022 07:58:33 +1000
Message-ID: <CAKmqyKOWmiv2m-7GoYDmLh3=wLJ-jEpJy0BK-UGa08E7S_eUoA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] hw/core: don't check return on
 qemu_fdt_setprop_string_array()
To: Ben Dooks <qemu@ben.fluff.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Aug 2022 21:59:04 -0000

On Wed, Aug 10, 2022 at 5:08 AM Ben Dooks <qemu@ben.fluff.org> wrote:
>
> The qemu_fdt_setprop_string_array() does not return error codes and
> will call exit() if any of the fdt calls fails (and should print an
> error with the node being altered). This is done to prepare for the
> change for qemu_fdt_setprop_strings() helper which does not return
> any error codes (hw/core/guest-loader.c is the only place where an
> return is checked).
>
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/guest-loader.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
> index 391c875a29..c61ebc4144 100644
> --- a/hw/core/guest-loader.c
> +++ b/hw/core/guest-loader.c
> @@ -57,25 +57,17 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
>
>      if (s->kernel) {
>          const char *compat[2] = { "multiboot,module", "multiboot,kernel" };
> -        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
> -                                          (char **) &compat,
> -                                          ARRAY_SIZE(compat)) < 0) {
> -            error_setg(errp, "couldn't set %s/compatible", node);
> -            return;
> -        }
> +        qemu_fdt_setprop_string_array(fdt, node, "compatible",
> +                                      (char **) &compat,
> +                                      ARRAY_SIZE(compat));
>          if (s->args) {
> -            if (qemu_fdt_setprop_string(fdt, node, "bootargs", s->args) < 0) {
> -                error_setg(errp, "couldn't set %s/bootargs", node);
> -            }
> +            qemu_fdt_setprop_string(fdt, node, "bootargs", s->args);
>          }
>      } else if (s->initrd) {
>          const char *compat[2] = { "multiboot,module", "multiboot,ramdisk" };
> -        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
> -                                          (char **) &compat,
> -                                          ARRAY_SIZE(compat)) < 0) {
> -            error_setg(errp, "couldn't set %s/compatible", node);
> -            return;
> -        }
> +        qemu_fdt_setprop_string_array(fdt, node, "compatible",
> +                                      (char **) &compat,
> +                                      ARRAY_SIZE(compat));
>      }
>  }
>
> --
> 2.35.1
>
>

