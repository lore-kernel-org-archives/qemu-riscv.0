Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FA9E95A91
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:45:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpohW-0003Ee-PH; Mon, 09 Oct 2023 07:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qpohP-0003C4-7w
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 07:45:26 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qpohK-0003SR-TT
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 07:45:22 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c888b3a25aso24762815ad.0
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 04:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696851917; x=1697456717; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zKb2aKX4CLD6Ew2M9iC0C3mSXpMGaBVquPB3fmU9qD4=;
 b=RU14rrqVN8UNaY+hdPgR1Inp4UfRs1YipEIcZRLAXZEs2GIqK4R8ag5lIut0whfJ5q
 VJZEOJFZr+SP/C/KvD/TH+kJ/3fuNSROy1n7oy8rmo1QnnlsVQqe4v+uFjp35J93ti8v
 oZjrKRqF72Qz9lnbjaNIxcHneNt/rv5DekVjJ3QSWVx+B8eGYTOHzcaSWYS3tUYy8Ea6
 demTeh6bqEQaS6zC6dl0jeFdvf9mBu+33OGMt6LHu/9iodDVyScpjFStZwtBJ836Mc0P
 UpKQbptN1DSF/vPvRQmK45ER56w3SXFwD5JZ/V5Ao76erG2YAxlFR819OQIcb/AjdIPS
 cOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696851917; x=1697456717;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zKb2aKX4CLD6Ew2M9iC0C3mSXpMGaBVquPB3fmU9qD4=;
 b=LhfAkAooRR7sT5DDclL+teiACC561U7F2Fus/NaaonBzaVffAjuRC0j4HGdKSdXy+T
 V9C+SGF7UO2T9QAgLYEliJYyQLN02RE06HE2jPEZG48u7Lr041eHbQpZca2LVgh8kLbN
 RHMRwfs6mbNiSdcvfrkTTCkYHHT/OUHrHR/D0pGgVGXXqFGiEF7lYwYXVT+m1xk2PK9+
 XngMv4EhMH2dcnxD3gGfgtaRgF03WByMAzAOfdbZ19Z1K7W3Uj8CIcxpCEuoYBkSGEHq
 +Ogh8Gg7hATA9so9/aZXHcG76EuDyTol/FDhOkGYbxtPhdgkh6E2fJkPOF7oB65NnR1s
 hlHA==
X-Gm-Message-State: AOJu0YxHKSBaBcRGUjcuSrWqlik6e55iZE+8/Lvkpla7RCc+7YcnYVpT
 g4458BWXBJ9gnrTaff/djljSBw==
X-Google-Smtp-Source: AGHT+IFa11AjuUkJnTUTXxtXatdTIen7b5LmmZ1n4unasP9q5vSj87A1+L224A2pwsWeTmflCO8YNw==
X-Received: by 2002:a17:903:32c3:b0:1c6:1d3d:b412 with SMTP id
 i3-20020a17090332c300b001c61d3db412mr14206454plr.30.1696851917311; 
 Mon, 09 Oct 2023 04:45:17 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.42.196])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a17090322c700b001c726147a46sm9340195plg.234.2023.10.09.04.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 04:45:16 -0700 (PDT)
Message-ID: <62989764-b943-4223-9da9-c6d77d69ef86@ventanamicro.com>
Date: Mon, 9 Oct 2023 08:45:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] target/riscv: Use env_archcpu() in [check_]nanbox()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Cameron Esfahani <dirty@apple.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
References: <20231009110239.66778-1-philmd@linaro.org>
 <20231009110239.66778-3-philmd@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231009110239.66778-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x630.google.com
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



On 10/9/23 08:02, Philippe Mathieu-Daudé wrote:
> When CPUArchState* is available (here CPURISCVState*), we
> can use the fast env_archcpu() macro to get ArchCPU* (here
> RISCVCPU*). The QOM cast RISCV_CPU() macro will be slower
> when building with --enable-qom-cast-debug.
> 
> Inspired-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/internals.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index b5f823c7ec..8239ae83cc 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -87,7 +87,7 @@ enum {
>   static inline uint64_t nanbox_s(CPURISCVState *env, float32 f)
>   {
>       /* the value is sign-extended instead of NaN-boxing for zfinx */
> -    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +    if (env_archcpu(env)->cfg.ext_zfinx) {
>           return (int32_t)f;
>       } else {
>           return f | MAKE_64BIT_MASK(32, 32);
> @@ -97,7 +97,7 @@ static inline uint64_t nanbox_s(CPURISCVState *env, float32 f)
>   static inline float32 check_nanbox_s(CPURISCVState *env, uint64_t f)
>   {
>       /* Disable NaN-boxing check when enable zfinx */
> -    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +    if (env_archcpu(env)->cfg.ext_zfinx) {
>           return (uint32_t)f;
>       }
>   
> @@ -113,7 +113,7 @@ static inline float32 check_nanbox_s(CPURISCVState *env, uint64_t f)
>   static inline uint64_t nanbox_h(CPURISCVState *env, float16 f)
>   {
>       /* the value is sign-extended instead of NaN-boxing for zfinx */
> -    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +    if (env_archcpu(env)->cfg.ext_zfinx) {
>           return (int16_t)f;
>       } else {
>           return f | MAKE_64BIT_MASK(16, 48);
> @@ -123,7 +123,7 @@ static inline uint64_t nanbox_h(CPURISCVState *env, float16 f)
>   static inline float16 check_nanbox_h(CPURISCVState *env, uint64_t f)
>   {
>       /* Disable nanbox check when enable zfinx */
> -    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +    if (env_archcpu(env)->cfg.ext_zfinx) {
>           return (uint16_t)f;
>       }
>   

