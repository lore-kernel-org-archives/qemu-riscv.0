Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLkwS-0001iH-MJ
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 08:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkvp-0001c8-6t
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 08:35:46 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkvn-0004Nq-P6
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 08:35:28 -0400
Received: by mail-wr1-x434.google.com with SMTP id n4so15823463wrp.10
 for <qemu-riscv@nongnu.org>; Wed, 10 Aug 2022 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=YwtBVSDaKQeD+dN5ZmEHae/j9nsXNIDRS5w7dEnlKtY=;
 b=ZqRnYZM3W+kmRmGp+0Z8uJjsNreHR5DeAl6HqYfJqUZO6Ybi1NeWbJg2iTk1vrkyDX
 vprkydeEIzmmGBuOfYoGlj0M3FOgBGOxOPeCLu+dnVi9dFBPKQ4WPnSbVFU1hkXbmBWs
 YkWCwc123NTrNfvpiFOsP79khSdQ0kwb8JFSlCuuauaxdtZYot+NH41NhL3h+PkcN+0v
 98P/0zhFEh0McodrG2vQHKe9WSN/Qiqv4bm7OEYPRmIlk5eN13KXFpYD1W8m3TW7sQse
 xld1/85R1+MlfSSpQlxStyu7SHme5uLWaqJoolJc+u9yA6Z76HdIpCY0+h8KGGlhmgfF
 y0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=YwtBVSDaKQeD+dN5ZmEHae/j9nsXNIDRS5w7dEnlKtY=;
 b=pAVgwJY+N5Wu7xq5Ceclfq+L/g8pRCTVeLDdKfjS6CsFaYQvdQJ/HHO67TppQv2nWq
 70w5u3vqIkOgSA9qDpsbH0440B0fZdHAFYAvkmfh+c+QovHLbXDNtzw1Hfv9o4Ntln6X
 V8FJ+uASlCmNUJZE/uUsOjm0vF3rlgbuWGtQb4rDguEoZHRD2qQg6oH4Qk8X3MNcYk11
 0hnp3aW95cszR/p+DB+6tBmsIyCdHtwMjK6MdoeU5gfGFafnCEUNwNfA905G+2rzN3Cp
 vS05q6vAzXaqM5Mej9zTBwx0wVZNupplRWFYSpLJyiSrFcUq1K29+cp8rc9NcGCfFo0j
 SDqA==
X-Gm-Message-State: ACgBeo3hkzx9A36arBSYxfosMdxtfT2wES5s7d1vY2CfdSkOTp7mvVz7
 qCDdtx9giED2PAT9iI7lTHC4LQ==
X-Google-Smtp-Source: AA6agR5EDJeVb/QlUBQrvnTeXdzHoA1nB9gGNrTp9yRN5+LBpbOegSAuVzQtKVcWiwnV0O3u/GgRlQ==
X-Received: by 2002:a5d:5483:0:b0:220:6b87:8f79 with SMTP id
 h3-20020a5d5483000000b002206b878f79mr17554240wrv.17.1660134926304; 
 Wed, 10 Aug 2022 05:35:26 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c35cc00b003a319bd3278sm2474717wmq.40.2022.08.10.05.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 05:35:25 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:35:24 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 4/6] hw/core: use qemu_fdt_setprop_strings()
Message-ID: <20220810123524.2fgqfsr4vrrjqjke@kamzik>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-5-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809185639.750345-5-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x434.google.com
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
X-List-Received-Date: Wed, 10 Aug 2022 12:35:49 -0000

On Tue, Aug 09, 2022 at 07:56:38PM +0100, Ben Dooks wrote:
> Change to using the qemu_fdt_setprop_strings() helper in
> hw/core code.
> 
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> ---
>  hw/core/guest-loader.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
> index c61ebc4144..7b8e32e06f 100644
> --- a/hw/core/guest-loader.c
> +++ b/hw/core/guest-loader.c
> @@ -56,18 +56,15 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
>      qemu_fdt_setprop(fdt, node, "reg", &reg_attr, sizeof(reg_attr));
>  
>      if (s->kernel) {
> -        const char *compat[2] = { "multiboot,module", "multiboot,kernel" };
> -        qemu_fdt_setprop_string_array(fdt, node, "compatible",
> -                                      (char **) &compat,
> -                                      ARRAY_SIZE(compat));
> +        qemu_fdt_setprop_strings(fdt, node, "compatible",
> +                                 "multiboot,module", "multiboot,kernel");
> +
>          if (s->args) {
>              qemu_fdt_setprop_string(fdt, node, "bootargs", s->args);
>          }
>      } else if (s->initrd) {
> -        const char *compat[2] = { "multiboot,module", "multiboot,ramdisk" };
> -        qemu_fdt_setprop_string_array(fdt, node, "compatible",
> -                                      (char **) &compat,
> -                                      ARRAY_SIZE(compat));
> +        qemu_fdt_setprop_strings(fdt, node, "compatible",
> +                                 "multiboot,module", "multiboot,ramdisk");
>      }
>  }
>  
> -- 
> 2.35.1
> 
>


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

