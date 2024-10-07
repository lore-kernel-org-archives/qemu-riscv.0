Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526C1CFB45E
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 19:59:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sxtt2-0004Fn-OR; Mon, 07 Oct 2024 15:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sxtt0-0004FT-W7
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2024 15:59:19 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sxtsz-000084-Ja
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2024 15:59:18 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-208cf673b8dso53329835ad.3
 for <qemu-riscv@nongnu.org>; Mon, 07 Oct 2024 12:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728331156; x=1728935956; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PoKniJff+wVUIN87t65LfQ48WeHv5d2U7P/Jalyr6+E=;
 b=rdN1BN+yKAgGYhB249sd96XI6r36xd20gIy8E3wHhU3aQ0Ba4P1dhjCwq5Opnk+XMB
 2rnx3ca9czY8jKGmLGhylbS09lnHYGMCaA/0d4R3J1J+vNQXByvCbnl+xPGugKBUaxXu
 22IdT7FfDgSGqW3ZX+TrTiPINksyxCzz1vmGJLWpz1gkXUxuCHqIN7L3cxYcXLZEFsoW
 7PZnsZf1FDJilgCM/UQg1hOv7kzbI15S2SsdHTqqrBaEFNrCTh06aRjTmJPEwRUkjX7Z
 cgInPKhK/sF7Qxij9ptP2aoj0oJIEZEWrdE4eBaePeoRPwBTtXGMHJGv2VB0+dO+7n+D
 Hbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728331156; x=1728935956;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PoKniJff+wVUIN87t65LfQ48WeHv5d2U7P/Jalyr6+E=;
 b=TbXs6EeARzi8742e8CInojquEIeQPjaXd0Ct+2pIJIA03oemuGDMPJgJpz8MP3oPhe
 QgFM9jbyCvEDYkImfBjPBlOpnQeTB9ezQme95hqN08QryohVdNUFsN6MgA3Yd9sMXh8/
 fQ1JjcYfKsIpPvk8qqM1EwMulQ5pK2qle/yCunP2biVPrj6yrs6NzhZ3CW2z7cwEDGit
 bb5XHKRkB/jM1LP7Nt6wSdyyaUDCzOuA9pe9/VkZLDl/wtI8OPZdO58+sg8w+6reAREC
 HYqN/nJpWRw4umM942A28rQ6G6ABBTTVExwxnEU63gv3yVL5jm02gTtdxgjlPhQLzuoS
 pbqw==
X-Gm-Message-State: AOJu0YzSKf3OL+ab6CDvE+JcB+4S7Ck6ye1vxRCIO+9sN8kc2Ocwz3KZ
 NG2EhfnY2onagRKSaK2hvuwXtFuiAcLA43S4RDpiWdkcTydOjgTEP3xjNHQSyJE=
X-Google-Smtp-Source: AGHT+IG0U9OzN7opGgE00v/F1+qKUDBTqAzoxZXgFimc9ZcTfFPSzObfgGLkOu9LBZ+LFNLAU+1uTw==
X-Received: by 2002:a17:903:18e:b0:20b:7dda:1fd7 with SMTP id
 d9443c01a7336-20bff03c34bmr192008775ad.48.1728331156213; 
 Mon, 07 Oct 2024 12:59:16 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.163])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c13939e08sm43317355ad.146.2024.10.07.12.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 12:59:15 -0700 (PDT)
Message-ID: <1f6b7c0c-b6be-4363-9489-1eade0025f1d@linaro.org>
Date: Mon, 7 Oct 2024 16:59:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/25] target/sh4: Use explicit little-endian LD/ST API
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-ppc@nongnu.org
References: <20241004163042.85922-1-philmd@linaro.org>
 <20241004163042.85922-14-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241004163042.85922-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 4/10/24 13:30, Philippe Mathieu-Daudé wrote:
> Since commit 73ceb12960e ("Remove the unused sh4eb target")
> we only build the SH4 architecture for little endianness.
> Directly use the little-endian LD/ST API.
> 
> Mechanical change using:
> 
>    $ end=le; \
>      for acc in uw w l q tul; do \
>        sed -i -e "s/ld${acc}_p(/ld${acc}_${end}_p(/" \
>               -e "s/st${acc}_p(/st${acc}_${end}_p(/" \
>          $(git grep -wlE '(ld|st)t?u?[wlq]_p' target/sh4/); \
>      done
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/sh4/gdbstub.c | 36 ++++++++++++++++++------------------
>   1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/target/sh4/gdbstub.c b/target/sh4/gdbstub.c
> index 75926d4e049..194be1d5db3 100644
> --- a/target/sh4/gdbstub.c
> +++ b/target/sh4/gdbstub.c
> @@ -80,59 +80,59 @@ int superh_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)

As rth probably noticed, this is is wrong for the
sh4eb-linux-user target which we still build.

