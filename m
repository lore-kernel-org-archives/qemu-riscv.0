Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGzjN-0003rm-IM
	for mharc-qemu-riscv@gnu.org; Thu, 28 Jul 2022 05:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oGzjC-0003pA-D0
 for qemu-riscv@nongnu.org; Thu, 28 Jul 2022 05:22:48 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oGzj2-0005Vo-R5
 for qemu-riscv@nongnu.org; Thu, 28 Jul 2022 05:22:38 -0400
Received: by mail-ed1-x52c.google.com with SMTP id c12so1415182ede.3
 for <qemu-riscv@nongnu.org>; Thu, 28 Jul 2022 02:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JPwBHkuUwM7uJfrda5pTrIoqF8G6kEBTtMMqdIhYQm0=;
 b=csHLs6KReP2uALM9kp0LSh3mMAmHYxdlaAxN6yHQ4VZnbnwYLiUQd6xWgH4eagGERb
 1huf4OFFCUaOR/J1uu9kzLcFX/sw2KM5lrkX0FX8cho/IPr4xUR0Vka1N+yDeedeNmPQ
 qu9RxOj9mqlnHgFhPXMmkYREkeRgJdSDLlj1pVAM1A2zDBAoB8iN50TWk9krcfa0Y78s
 Iqdcy7kWiYizQ2Dpa7gh1I5ztE+Q9d6AkA5H/HXvmc5bi1OtB7JGkNVnW7C2tfv3TS7Z
 /m1DXB6ny/q66pbV8yxkBkAa1ujWpLe00ZGbv6NIiVPVoAW5XrZIEAWDA6/vGmKogbIh
 HPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JPwBHkuUwM7uJfrda5pTrIoqF8G6kEBTtMMqdIhYQm0=;
 b=Y/0UNXZIN5ho08zPw/22kBfBRDhlMjlN7Jzyl7+ItRhC/3CMHAYUwY6KJjwjR7EkG3
 alvFQzzckjmrqn9Bft+A4vFMXJZS+l36JORcIr9GAQX2wUdvI81pURfr89G3TpN/jFoE
 2E8TCibAolRXNcsbMWy4e/55QKOVCdnOwUAmxzCnuPHNRMXHBXscFHOxBubcM3qEzSwX
 Z5HfedB24WlqJSuAlcdTZNzpR2wFtroiFtFKLphyzaQxkDrbgRYAO4d4F+Txsm6wE1dR
 t48pMSHFqbLINJKgP7XxWTkE+FU+UR9G7eVGuZuL+w/rZhBy24xh6UkTn8krVod8zLW1
 3b8g==
X-Gm-Message-State: AJIora9KfPMje2kj+AMWCS04mWauljmjmriIHV/rQ5jnmCkpoGSNsQBF
 yFMl79huMegT8jtYYSA32UQFMg==
X-Google-Smtp-Source: AGRyM1tKOVDhq5+oOS7FJ7vSWfyPR8HUnya3aAdRse5ce62af5dRgUgupXm+1ftSwRI3RDtGc9b1eA==
X-Received: by 2002:a05:6402:2b8b:b0:43a:5475:f1ae with SMTP id
 fj11-20020a0564022b8b00b0043a5475f1aemr26657984edb.363.1659000152620; 
 Thu, 28 Jul 2022 02:22:32 -0700 (PDT)
Received: from localhost (37-48-57-188.nat.epc.tmcz.cz. [37.48.57.188])
 by smtp.gmail.com with ESMTPSA id
 fm15-20020a1709072acf00b0072b14836087sm199241ejc.103.2022.07.28.02.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 02:22:32 -0700 (PDT)
Date: Thu, 28 Jul 2022 11:22:27 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 1/5] device_tree: add qemu_fdt_setprop_strings() helper
Message-ID: <20220728092227.m2v6nyy4eblcreo2@kamzik>
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-2-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727223905.624285-2-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52c.google.com
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
X-List-Received-Date: Thu, 28 Jul 2022 09:22:48 -0000

On Wed, Jul 27, 2022 at 11:39:01PM +0100, Ben Dooks wrote:
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
> index ef060a9759..83bdfe390e 100644
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
> +    ({ int __ret; do {                                          \
> +        static const char * const __strs[] = { __VA_ARGS__ };   \
> +        __ret = qemu_fdt_setprop_string_array(fdt, path, prop,  \
> +                (char **)&__strs, ARRAY_SIZE(__strs));          \
> +     } while(0); __ret; })

The do { } while (0) shouldn't be necessary inside the ({}), but I
think we should change the places that are checking the return value
of qemu_fdt_setprop_string_array() to not check the return value,
because it will always be zero. qemu_fdt_setprop_string_array() calls
qemu_fdt_setprop() which exits QEMU on error. Then, after there are
no callers checking the return value we can change this macro to

#define qemu_fdt_setprop_strings(fdt, path, prop, ...)          \
    do {                                                       \
       static const char * const __strs[] = { __VA_ARGS__ };   \
       qemu_fdt_setprop_string_array(fdt, path, prop,          \
               (char **)&__strs, ARRAY_SIZE(__strs));          \
     } while(0)


Thanks,
drew

