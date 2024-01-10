Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDBFC4707B
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 11:38:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNWu8-0001ln-Th; Wed, 10 Jan 2024 06:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rNWtw-0001iZ-H2
 for qemu-riscv@nongnu.org; Wed, 10 Jan 2024 06:37:42 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rNWtu-0000Pj-PE
 for qemu-riscv@nongnu.org; Wed, 10 Jan 2024 06:37:40 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a27cd5850d6so429020066b.1
 for <qemu-riscv@nongnu.org>; Wed, 10 Jan 2024 03:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704886657; x=1705491457; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g8nO7q6AHiDXyr+J6T3+jEQHQT+n8o3GUg61YRNARHU=;
 b=mbaDcbtkSxUaH+BScfqubg/Xzz1uLcKKaFPmvjZGlOJBztB0QTp8JRloyh/veQDbqZ
 lWCotYbZI3jetJgcqSrkYyesQIW2W50XA4mQjTQ8pD6fkzmkoAQRarscYOCpd1oNuk39
 wth2T1+sSHOP7Uh5KYAHeo8b0UanqCeQiYfBXhbq08c5RWxZeFCnO7dKS+Nb3RDy0ZMa
 n52CSF6wGonu0SaEu9kixQoNRVkIkBNTsf9FduhvNFniRXxFnAjCf4exdDVKm7iXVRCc
 6BhqdLZEcbINZhpqR3V42Wf4KO3DuM6SPGfOm61dd1KRcFM3COrbk9CpyANcHGXqfvqQ
 I6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704886657; x=1705491457;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g8nO7q6AHiDXyr+J6T3+jEQHQT+n8o3GUg61YRNARHU=;
 b=faRZLT+vnGvAY2YyQwzUh9aKvwnkfni872XtMWYLX2P7PeIieNo7xqJZeGyeQzWt0K
 GljnDMUw+ocrnV5rQo1PRHpD4oCXYHYuCMZL+N2yMwQcoIXLR8Medl+RXccdwZsBCh8w
 M2DREXRM/dHeCCIe6qnn2ekk7fU/+rAF/8RVVuc2wJ346gccaEx1z8OYnXHmDQ52FenT
 4ljWmOHJlWEbkImI42Su2DpJik7udO9sq+gWJwgTSMnRwe2Hm/NBia61ETdieHr/LIXl
 lU08ivNG7Xwv4iF9Ff8W4S2NOf4+K0OIKmer/8ZgQ1ssaQ+O8kK1e/ySS/CtZxdEkrBr
 Q/Pw==
X-Gm-Message-State: AOJu0Yy+QchAzKw6eMUttdFpUncxKo8mNZU1PRNNNQuWHuvCf7veZ4sV
 WGjEDkIUXdtzUsCGZkaXd3I2P8TsG1GmCg==
X-Google-Smtp-Source: AGHT+IFFBmzRowSBzGtRiMmyKCPkknsh/nssGt1ZeYHL/xLyJByeAufHH/vPJjRbVix3HlIWbJ/Owg==
X-Received: by 2002:a17:906:a3ca:b0:a28:b74b:27ec with SMTP id
 ca10-20020a170906a3ca00b00a28b74b27ecmr483515ejb.111.1704886656864; 
 Wed, 10 Jan 2024 03:37:36 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 v27-20020a170906181b00b00a2ae0aa9002sm2004436eje.40.2024.01.10.03.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 03:37:36 -0800 (PST)
Date: Wed, 10 Jan 2024 12:37:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: qemu-riscv@nongnu.org, Conor Dooley <conor.dooley@microchip.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/2] target/riscv: use misa_mxl_max to populate isa
 string rather than TARGET_LONG_BITS
Message-ID: <20240110-aa3945e12c7bb11eeb87edfc@orel>
References: <20240110-mold-renovate-256db1b5c70e@spud>
 <20240110-eastward-sulfide-f365c89681e0@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110-eastward-sulfide-f365c89681e0@spud>
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62d.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Jan 10, 2024 at 10:25:36AM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> A cpu may not have the same xlen as the compile time target, and
> misa_mxl_max is the source of truth for what the hart supports.
> 
> Reported-by: Andrew Jones <ajones@ventanamicro.com>
> Link: https://lore.kernel.org/qemu-riscv/20240108-efa3f83dcd3997dc0af458d7@orel/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Perhaps this misa_mxl_max -> width conversion should exist as a macro?
> There's now 3 individual conversions of this type - two I added and one
> in the gdb code.

A macro is a good idea. I had to go look at Table 3.1 of the priv spec to
understand the 16 shift stuff.

> ---
>  target/riscv/cpu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8cbfc7e781..5b5da970f2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1860,7 +1860,9 @@ char *riscv_isa_string(RISCVCPU *cpu)
>      int i;
>      const size_t maxlen = sizeof("rv128") + sizeof(riscv_single_letter_exts);
>      char *isa_str = g_new(char, maxlen);
> -    char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
> +    int xlen = 16 << cpu->env.misa_mxl_max;
> +    char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", xlen);
> +
>      for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
>          if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
>              *p++ = qemu_tolower(riscv_single_letter_exts[i]);
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

