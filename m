Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CDCC02194
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 15:37:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tgQO1-0005i1-UA; Fri, 07 Feb 2025 10:35:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tgQNq-0005Tz-Bq
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 10:35:12 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tgQNn-0004ko-58
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 10:35:09 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-21f4a4fbb35so23188955ad.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Feb 2025 07:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1738942504; x=1739547304; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JL6HX0/rUgVOcxkk5vAabK9dtF8gasDai0xn6kwNf/0=;
 b=U5GNoRhzpC4yju1x80Yb4QAOfPKYw4r5nR9hcfCDbvdFkcL9iuQ/0A5vbWFn7oYmeD
 2cmHakGMDirOAeHlth5/OWdiuv0268vPMtlgvDiQyTVRLu+8KSyQbYX6h4y299NKGSE+
 WK0BKzpe1zYVs+RgljYLUM/fMRsxSu/CwEe5toi/iwA7BXaG+zYBh8vBcGT993rXbqMd
 Q6N77wrxyzPCE7JkTH7/II9FsepGVl+4hJpyT5Bp/9F6ZLHXkxBbWUIMh0nNN+ovqmRy
 gmSn7g003PGsb4ENkRMirzQxZbQ3Ku93zSHBBGVl5AB/Af4noDgXGSpwPpeCqnaBNdUv
 WNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738942504; x=1739547304;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JL6HX0/rUgVOcxkk5vAabK9dtF8gasDai0xn6kwNf/0=;
 b=irUsxv8BjZLVPSNaOCQFp9m0Qv0u8fRpl91Z8FHVhYTU9jUGw7A9obPRSzg89813y3
 SkcSgxpkJ5t50uu4hGyAA6PGnJMh53bla7Hymwoo9JKGBXyUqKiEdlYj3B8p9F/Mbzpo
 WCqx/oEEDLxB2dU7L8bSmfKHdIupQrfI3bueLYZ7Q2+/V2DrjXIU6SmyBPJf2w0evTXU
 GjhXrytq68txKPmPj8eDS2KhzE1LZ3g9lnbijX3kPVXH1Ke+VM6CIQMSV4e+LXhmagjm
 oXAcddM6mN4b+FWZNS07Axl34MdlFQgTo1+IMJB/ZDN+To5W8Be0HE7RURnSSfekrBak
 0tDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtnRkapKOVcmJBmmCuxRgdj5+K81wlgYRiKC04EAMygffkz/9LwktEaL8m6fD1MZuuTfdG6nBeY0Le@nongnu.org
X-Gm-Message-State: AOJu0Yx315I3cgd98RaQ7FL1HSvvxBnZJpegt6tAXPfpsiiyJarM5Qpo
 LxEmTm2wmi8byVgaTwj1JG5hOYtw51YsjVjuJmtSaMS/Rz0z0znRuWHbd5TXmL8=
X-Gm-Gg: ASbGncvgwAgUKbOgk+hEIc3v/GXamUEiyF9BynFGeqp26Fzm4Tu5X/8R5YCESsn51zN
 ukjLrTd/yNVZRuLwMgPdOhTGpIl/120MSJPHPY+rGdqlFfNSqTJdX0UAA0OYRqtbWoxC9XBCoby
 0HQgwRTWK/xg6qUG9wKXUg6M5DKZDkyL1XShUhQDv7A/FxV0ViqIQqzcaqsGMh7r1x5+DzHCyde
 JATNtNNTrPTnGfujxBfxeUgaNH8qm6rRP5H1wGSQkrh2BnLiI57XBmem1KSBxjZj0Z0bp2qm34i
 CZF2CoXupMyAt7WtnQRNcCqG06oUvQajJb36nn/NT5VjpAN8DcRaD8eQOZhOpJdB
X-Google-Smtp-Source: AGHT+IEg6TOgRbngSBxCtjXHpnQ5Uxj1dtAD59nwxTVtH8DBEiy+2pyGG6fbo45a7em/6DU7v01whA==
X-Received: by 2002:a17:902:cf04:b0:216:5db1:5dc1 with SMTP id
 d9443c01a7336-21f4f0ef803mr54542665ad.1.1738942504312; 
 Fri, 07 Feb 2025 07:35:04 -0800 (PST)
Received: from [192.168.68.110] (201-69-66-42.dial-up.telesp.net.br.
 [201.69.66.42]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f36560d6csm32052135ad.92.2025.02.07.07.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 07:35:03 -0800 (PST)
Message-ID: <8f551680-6553-42b1-9307-d4b56e7bc2a5@ventanamicro.com>
Date: Fri, 7 Feb 2025 12:34:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix minor whitespace issue in
 riscv_cpu_properties
To: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
References: <20250207152823.265068-1-rbradford@rivosinc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250207152823.265068-1-rbradford@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Ccing qemu-trivial and Michael
  
On 2/7/25 12:28 PM, Rob Bradford wrote:
> The mvendorid/mimpid/marchid properties have the wrong amount of
> whitespace ahead of them.
> 
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3d4bd157d2..cca24b9f1f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2844,9 +2844,9 @@ static const Property riscv_cpu_properties[] = {
>       {.name = "cbop_blocksize", .info = &prop_cbop_blksize},
>       {.name = "cboz_blocksize", .info = &prop_cboz_blksize},
>   
> -     {.name = "mvendorid", .info = &prop_mvendorid},
> -     {.name = "mimpid", .info = &prop_mimpid},
> -     {.name = "marchid", .info = &prop_marchid},
> +    {.name = "mvendorid", .info = &prop_mvendorid},
> +    {.name = "mimpid", .info = &prop_mimpid},
> +    {.name = "marchid", .info = &prop_marchid},
>   
>   #ifndef CONFIG_USER_ONLY
>       DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),


