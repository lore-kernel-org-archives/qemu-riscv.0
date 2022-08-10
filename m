Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLkov-0002JJ-96
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 08:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkot-0002Ds-JB
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 08:28:19 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkos-0002lq-22
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 08:28:19 -0400
Received: by mail-wr1-x434.google.com with SMTP id j7so17602710wrh.3
 for <qemu-riscv@nongnu.org>; Wed, 10 Aug 2022 05:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=t8nZ21QBoIE3muUsD8yEsXo6tW6EUTtAFupwkvuEGSA=;
 b=e6WO8r8/Hf1Q8zlWjiN0wvxkw4t13pwYBjmAHW45HdRwQQBGeV+stlw6shMdbYJkco
 O72Va7RIXq0RY9CmG0hLLXeoB/2VPnWa8jOG8h6mWNdX3TlD744xtNq3f5lQRcqH+uzt
 x8GVoo/VYCF7kgViwnygdbDovzEZtmNh0nHaiCGy46fl/IKOaLBAHVL+iUSSyjSaSyAJ
 5uSVfZ+4Hjny9eCsbmIUFvhcNJ7EhhwAVUwwIgD3KCaR6s6Kyps8s6NDkVrYgrCSiCTo
 l8HBrenSxmO1+0swLXFIH5DU8rgqub8xP/kmnbwC9IzEQY0zIxNrlrAWhummVmxqcD8W
 V++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=t8nZ21QBoIE3muUsD8yEsXo6tW6EUTtAFupwkvuEGSA=;
 b=rWzWWjD3UDFGgtxdQkZK58XCex72+3Gqdy3Xgkj1dOzAM+EbC3pU6h50LezWEb5Ut4
 sVL5BAPF3I+Wyqz98LN8+jzL8QfTVZ6kLdiYWH0ZPJ0wARLLLT5PlVCM9r7ak+lPO545
 eCz1UKZ2yDNKmZZa6n6eVduMHdrJeFsUSFN3U3tbhpiGGsIv8PLLKFSCJHTddV/9z2LB
 v6uy9FfjjHK0tmbqQD3+DMTQK5wwmOo0Ccd44lIGE0xZgpgjtvl5vANgNHFnE0umSawf
 OM2C2msuaEd3sG5icL2m6vLnigzgrMhP4Y4JBkGOqGSz5sNV6mqAJ2aycOLJU8j5P9Cd
 fqbA==
X-Gm-Message-State: ACgBeo0ar/Z6K60bpHf2thYJY+r6+Ihjg6m/bZgH4luo06iqnYACXvtC
 MrWoCdjbS+AwCIPNDT1GtjvjOg==
X-Google-Smtp-Source: AA6agR7Rn6mn7wqGOf2234+z3bF1WYE6OqweGDrHl4aMryzAcmE4ofn52dt4wi3kJtokVzeB8pPZWQ==
X-Received: by 2002:a5d:64a4:0:b0:220:b43e:d600 with SMTP id
 m4-20020a5d64a4000000b00220b43ed600mr16903522wrp.27.1660134496474; 
 Wed, 10 Aug 2022 05:28:16 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 c10-20020adffb4a000000b0021f1ec8776fsm15829553wrs.61.2022.08.10.05.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 05:28:15 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:28:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 2/6] hw/core: don't check return on
 qemu_fdt_setprop_string_array()
Message-ID: <20220810122814.yg6rz7jnr7mqxatx@kamzik>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-3-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809185639.750345-3-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 10 Aug 2022 12:28:19 -0000

On Tue, Aug 09, 2022 at 07:56:36PM +0100, Ben Dooks wrote:
> The qemu_fdt_setprop_string_array() does not return error codes and
> will call exit() if any of the fdt calls fails (and should print an
> error with the node being altered). This is done to prepare for the
> change for qemu_fdt_setprop_strings() helper which does not return
> any error codes (hw/core/guest-loader.c is the only place where an
> return is checked).
> 
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

