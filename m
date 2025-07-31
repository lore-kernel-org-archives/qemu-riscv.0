Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE13C87FD2
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 23:33:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhclv-0005LB-Qn; Thu, 31 Jul 2025 19:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhclu-0005JA-Ju
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 19:33:14 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhclt-0001ws-0j
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 19:33:14 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-7425bd5a83aso276417b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Jul 2025 16:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754004791; x=1754609591; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cusbk8h4iXm2jR5tUfzKzP0NPQDw0lyh5JXYtf2oG1Q=;
 b=Ll0i/fv+PVOVuSpWwiYesNdhoMmYWcYf6cV8ltGHaDmiYW0aEcBU1cICAuS9bWbWWV
 /1NJp1BgEZguM6jWHfQ6JxFkQ5p4mvQAlMn0Y8PREeqVKAWNv3oQJX6QkxCen8Ei2+ik
 /HqwD3wGAwy9ZqSo5Sx+wuAowqp8BaxIRi6mZbneCH+Tgc8K4OMLpEyLMoxlfhhrTLSR
 By7i8TdhhZ/nHh3Oi3091L/q72FljAWOO2NbrEpqjSaQjZ/r/GxjYZ4cZQB6ZHhbKFrX
 F8PVKKiM3Ip/bZvcSudNQObR18FqDmN7VCYN3Eii/62bx95dNx7vQcbA2pNwFlF831lW
 COsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754004791; x=1754609591;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cusbk8h4iXm2jR5tUfzKzP0NPQDw0lyh5JXYtf2oG1Q=;
 b=YH7d4DHuHX/D/DbCXVjjiFt8V2mVhxkUe6DYg6D1DNtZ7Vmlgg3kKw6SZ31uFw5vYi
 6JhRlRZzwxgG+qncgu+/CaokohUVjgSEc4RXCRHWiZp63kxf9Qv4cwerO4WupmVgVLtx
 EPpGjDVtSnWg/C5edLCtmY4Nt3nOr2ptfg0qBUhP9i2nArxPfnv19R5pMktQktXUiEoI
 k6lvwoSkId7/UZX0iB2w2+NYraFImyvLbYIMhKNdOd5awGBuJipyv4/p+yRSM8amjtau
 yL6BpGy5sKcDdu4zyIHTS8nwCatx/GtW+zKEPoC1u2daZqmuB4E3rhrKVZGAF6MgHmjA
 R9Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXIeMcG2CAGnflcAtzj4vTDKf3TgcQAmzBiVrK9lAxN+g2eGzEFmf4ZsolJ1+gY+axCFl47sudyEgq@nongnu.org
X-Gm-Message-State: AOJu0Yw5pldv9cG/hXapIWZx+7fqkvqXaZHlEc3ipJgmuE52rWFm112f
 jThRcn7VEC6+7QJZchTln4oE48HtTLP2PNn2uWtwNopz9iQOu71hB3oxzIJcaeDCxIE=
X-Gm-Gg: ASbGncuxUGBswAaJCDzWDcwraVv1vDo+Vgk1AmcTz+WNH1sgrnQE+W6vCqbNVa3pClC
 trMyhCrcUmj3K92j77h55mw0YECGKuYZqeRT4F2GkTBGNjNq2w3jRCqk8X88EY3mozofimHcp4a
 rsk4lZvy+l/OiGHXun11JIL61Y4nfD60DNNbWsWqendhpNDNpzUcl7A7MZzJwRb2AQ/YWFAbsgW
 a4yePDpZDpW8FSq/htVzTvaMmpqr2CHrqXr+GgmQBAgf5/+WNR1giimkhftZVXGXgYAXzO0IA5j
 erdY1/KX3GDwvHHEOnnk7ij8b0MlVKS3aDI7DbKXC9YL8ZN4JJkRgNX7dOVMseuglB1b3TAs+Yd
 41I7G3J1v4DBpVUIlAp3haWq6vonY1msUfFlNcXdo
X-Google-Smtp-Source: AGHT+IE0faJ0bvCbjT88WZLV1nk3Sr71QsshSqen+buVnpZcVgDt4ETUiyf3r7lzcJeNZIXYqZH40A==
X-Received: by 2002:a05:6a20:a128:b0:23d:de52:a5f0 with SMTP id
 adf61e73a8af0-23dde52afe7mr4502206637.42.1754004791148; 
 Thu, 31 Jul 2025 16:33:11 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfd8f8dsm2581563b3a.104.2025.07.31.16.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 16:33:10 -0700 (PDT)
Message-ID: <311fb2d2-b8b2-4b1d-aea6-429fe55f8217@linaro.org>
Date: Fri, 1 Aug 2025 09:33:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] semihosting/arm-compat-semi: replace target_ulong
 with uint64_t
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
 <20250730220621.1142496-8-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250730220621.1142496-8-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/31/25 08:06, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   semihosting/arm-compat-semi.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index e5a665d604b..e3b520631b3 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -123,7 +123,7 @@ GuestFD console_out_gf;
>    */
>   
>   typedef struct LayoutInfo {
> -    target_ulong rambase;
> +    uint64_t rambase;

vaddr.


> @@ -300,9 +300,9 @@ static void common_semi_seek_cb(CPUState *cs, uint64_t ret, int err)
>    * is defined by GDB's remote protocol and is not target-specific.)
>    * We put this on the guest's stack just below SP.
>    */
> -static target_ulong common_semi_flen_buf(CPUState *cs)
> +static uint64_t common_semi_flen_buf(CPUState *cs)
>   {
> -    target_ulong sp = common_semi_stack_bottom(cs);
> +    uint64_t sp = common_semi_stack_bottom(cs);
>       return sp - 64;
>   }
>   

vaddr.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

