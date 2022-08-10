Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLkgj-0002Wt-9v
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 08:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkgh-0002Sc-IP
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 08:19:51 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:42743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkgf-00014V-SR
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 08:19:51 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 s11-20020a1cf20b000000b003a52a0945e8so891774wmc.1
 for <qemu-riscv@nongnu.org>; Wed, 10 Aug 2022 05:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=2Jipa5cCVLQr1pCuJwLIKcVPQhTtTjmjFqhQGp0LHLA=;
 b=J8SUt/TIcIDwqF6kQXBizFPsBqrkCvyKaZok+fZwUpDbKmjO43mpwj8uEM461HnXwX
 cnFV+Oq7EfFEVVsdwL1UfbAaNkWvAbHdVXLuevaOBBPI3k0+Ken2ABcyfJSE8VcOnkYx
 1JaeYqozp8v8ASzuPFwy+LalBlPA5mx+RjvgZnl/HLDMkuxTvbwazxGWguMJRhtrLSsB
 0kcA58ihmPwQvHhcVN3YXZ1ho+ixcovgFabFhJmf0prdepDo8x3b5+dMM2W7GtkgqrkT
 chKXQqeMsycPjBw82zxK/34/j9WNsKik/bT7usUW+ldGQqRKAcv/KVIKUgdKbP+X80h1
 WIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=2Jipa5cCVLQr1pCuJwLIKcVPQhTtTjmjFqhQGp0LHLA=;
 b=6MEc0L9jwnektPH5GUw/oBDaoGWBi2epRw/6gf0AdgrWeCEgtB4weNcD+REU9mq10y
 YVYVaZuDttz8ia5y69jc6TAWFzmDhPI1PYoJAgJc8ZYzsxCtEMcmWmWuX217L7l2NLfF
 6AOIcT2Jw/gLcdxHZEz2HggqfdG7c2H84Kub/esv4XW3Hw5mTESMFavgT/BEyiCh1pJz
 6STWIRd/V/ymtHt6GEhdcsxwXVWGRpT73smbx7m3uldusK+XTeCRKRIDfEf02gqmE9Ik
 8JgeoJdXdaGQZeN9PKgRaPoxxcXzGtByop7ERzrsskJGkpqQ9zoo6ff+I5sJ3GnjtU7K
 aiHg==
X-Gm-Message-State: ACgBeo0VhmeKkUQQUpxXDBHRB8O9av3GiEMfDVH7nHHeA6z+2b/f321c
 BY9cfom5Ma8n7D6V6aafzVl8eg==
X-Google-Smtp-Source: AA6agR5GyGgwHx6fuQBW07XOGgbEKTsPVvgePKSLJAjpU77hGbSz7ASw15hvLNtwqiUDS3A42ID1xQ==
X-Received: by 2002:a05:600c:350:b0:3a5:3473:1c23 with SMTP id
 u16-20020a05600c035000b003a534731c23mr2344563wmd.9.1660133984409; 
 Wed, 10 Aug 2022 05:19:44 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a1c4304000000b003a5a5069107sm2150830wma.24.2022.08.10.05.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 05:19:43 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:19:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 1/6] device_tree: add qemu_fdt_setprop_strings() helper
Message-ID: <20220810121942.rlegpjuprzj3qsvd@kamzik>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-2-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809185639.750345-2-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 10 Aug 2022 12:19:51 -0000

On Tue, Aug 09, 2022 at 07:56:35PM +0100, Ben Dooks wrote:
> Add a helper to set a property from a set of strings
> to reduce the following code:
> 
>     static const char * const clint_compat[2] = {
>         "sifive,clint0", "riscv,clint0"
>     };
> 
>     qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
>         (char **)&clint_compat, ARRAY_SIZE(clint_compat));
> 
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> ---
> v4:
>  - go back to the non-return call, no-one is using the result
> v3;
>  - fix return value for the call
>  - add better help text
> v2:
>  - fix node/path in comment
> ---
>  include/sysemu/device_tree.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index ef060a9759..d5c05b5ebb 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -87,6 +87,25 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
>  int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
>                                    const char *prop, char **array, int len);
>  
> +/**
> + * qemu_fdt_setprop_strings: set a property from a set of strings
> + *
> + * @fdt: pointer to the dt blob
> + * @path: node name
> + * @prop: property array
> + *
> + * This is a helper for the qemu_fdt_setprop_string_array() function
> + * which takes a va-arg set of strings instead of having to setup a
> + * single use string array.
> + */
> +#define qemu_fdt_setprop_strings(fdt, path, prop, ...)          \
> +    do {                                                        \
> +        static const char * const __strs[] = { __VA_ARGS__ };   \

           ^^ We don't want that static there. That'll keep the storage
	   for each invocation and require that __VA_ARGS__ are always
	   constants only.

	   I'd drop the const's too since __strs is only used for a
	   single call where it immediately gets the const's cast'ed
	   away.

> +        qemu_fdt_setprop_string_array(fdt, path, prop,          \
> +                (char **)&__strs, ARRAY_SIZE(__strs));          \

                   ^^ And then this can just be __strs

> +     } while(0)
> +
> +
>  int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
>                               const char *property,
>                               const char *target_node_path);
> -- 
> 2.35.1
> 
> 

Thanks,
drew

