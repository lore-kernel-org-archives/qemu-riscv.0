Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843A9CAC5A7
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 11:54:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v0f6z-00037q-1a; Mon, 22 Sep 2025 07:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v0f6u-00036p-UV
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 07:53:37 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v0f6p-0006oC-Qt
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 07:53:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so1526198f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Sep 2025 04:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758542008; x=1759146808; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aydqedx3UbOsIFySW+Eedt12tVAnD9OxnMPugMxOd9M=;
 b=GB0BT84PQfd7GBfc4JRvlE/8RejJqHIHAx5iKmviu8mWNvh/OT4FLT4aCosxcfv7LJ
 1rR9i0DKPVA9sctS3FhUkTSrEVv42JkVq5U50kg/8CdTy97Cut6Kw04QJYi9yd+PQLo0
 kiEEX/hUvGqMKSaCx52jKRHCY3dgAIjDo7eyN7IahfgDyO9Qm0FKHxg2UIjJYJZ87rxY
 PoLG3JWhMweJQqHFxXfCw1MoOS1FS5fKqNKqdXPoqu5/U4pYuNsipQLAyuDYGo1TRh0g
 7IlN4C9PkTHtOgzWLn6SC/du4fD7LaQt6h+ZQJ4atVU0vbn4tPD18KUSGYsdbz7lJqe9
 Uczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758542008; x=1759146808;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aydqedx3UbOsIFySW+Eedt12tVAnD9OxnMPugMxOd9M=;
 b=W6StX9ukmHUnv0PYh2bb91fdxQ/qclDl4JZaUR8S3vkGYQuMtXWsvx3mdDTKna1+t9
 Wcq2623xvbLjr6HeO6+yyXwhTrAw2mKzu6Iehe2rNnuMuOgoBFOFbV0hl6e8W5q/uvq0
 s7sjcaC8WmHJIri33WrfUebBcYm6MRiFqlD74U7Yilx+gA+7zbJMGIpE2Qra9WGX5vye
 i3/b+vKh6KuibWiOljVUEPImMoAkfK5SbMZVRAoJi9mC0dPNUba8ilmRr1q57bLt72pG
 PQP6ZQ6iqhSjRt0xAOClofnypeIbHZEU7lnHC48BDatIRirX4JePGTgd/bcvM8qDadk5
 B2zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEVEqDTOULRCp58m0HkKARR/xiBLHw7tIP6R9y3+ad+b6HwaLiNYMVn5mwy+lhhnDnBr7xpHQptjFE@nongnu.org
X-Gm-Message-State: AOJu0YyBY5oVbFwZGQQ2RopfT0kInuev5Kf0bSaU4ifgbBh9j0nF7fE9
 KnyX70TY9sK+5Ernn+bRNXwpwTUyoyP1vtFn8NFt0qXkfFl0D8qL+/i9io9R8m0LXGY=
X-Gm-Gg: ASbGncsuR3UvIa8AtVttZjCCyqEzTKcUnRgdQ0n6KfjJ9smdxWUC10LJ9Ty+r2iPKsr
 ozmNRLiDbXDdysc9vNabG2fEITtq45KHyG8zHxHkWbLejX9+dvFqZ5gUDOL9eF8brE9y+irTDcy
 04nz0mObBp59LOlj84Djl84pAhn5PccHmCPB65i2O+FRSR3B9eU7KUVQW7pLfQ7WxoEGz0+0XTA
 5aj5y1LuNSyNhQNpdyOgcHSUf/gxw0M3Ir+QquUWcJDdvpCucHPVQCrG1ybjfb8rO6AMScXJ56H
 Xd/eq30SPzHCliM6cs5YMszOSdZMFAlNccMAxtZGPT4y+tA2Dux+PmIGjCJE4QabXTssf+tJn30
 Arqkin6cfYRcvtNp/Gn6gEpXm+YuOFjSPm2/7QVeWsgUAmZ5OhC2cHQ+SHL5/eKrwKpjb7+ubY6
 kv
X-Google-Smtp-Source: AGHT+IFSwl8owYxa6DjZDb7MEa6bNqmZahDuiT3iD9glVhybcHoA9L9tzieugcch9quusGcdUWFJHw==
X-Received: by 2002:a05:6000:381:b0:400:1bbb:d279 with SMTP id
 ffacd0b85a97d-4001bbbd375mr2099760f8f.39.1758542007632; 
 Mon, 22 Sep 2025 04:53:27 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee07407fa3sm19520400f8f.21.2025.09.22.04.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 04:53:27 -0700 (PDT)
Message-ID: <935cfb4b-1990-4ca8-91a2-b9b96b503c42@linaro.org>
Date: Mon, 22 Sep 2025 13:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/25] semihosting/arm-compat-semi: replace target_ulong
 with vaddr
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
 <20250922093711.2768983-13-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250922093711.2768983-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 22/9/25 11:36, Alex Bennée wrote:
> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Message-ID: <20250822150058.18692-10-pierrick.bouvier@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   semihosting/arm-compat-semi.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 6725dcf4ba7..29cdab66f73 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -123,7 +123,7 @@ static GuestFD console_out_gf;
>    */
>   
>   typedef struct LayoutInfo {
> -    target_ulong rambase;
> +    vaddr rambase;

This is what the subject describes. Most of the other changes aren't.

>       size_t ramsize;
>       hwaddr heapbase;
>       hwaddr heaplimit;
> @@ -214,7 +214,7 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
>    * global, and we assume that the guest takes care of avoiding any races.
>    */
>   #ifndef CONFIG_USER_ONLY
> -static target_ulong syscall_err;
> +static uint64_t syscall_err;
>   
>   #include "semihosting/uaccess.h"
>   #endif
> @@ -260,8 +260,8 @@ static void common_semi_rw_cb(CPUState *cs, uint64_t ret, int err)
>   {
>       /* Recover the original length from the third argument. */
>       CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
> -    target_ulong args = common_semi_arg(cs, 1);
> -    target_ulong arg2;
> +    uint64_t args = common_semi_arg(cs, 1);
> +    uint64_t arg2;
>       GET_ARG(2);
>   
>       if (err) {
> @@ -300,9 +300,9 @@ static void common_semi_seek_cb(CPUState *cs, uint64_t ret, int err)
>    * is defined by GDB's remote protocol and is not target-specific.)
>    * We put this on the guest's stack just below SP.
>    */
> -static target_ulong common_semi_flen_buf(CPUState *cs)
> +static uint64_t common_semi_flen_buf(CPUState *cs)
>   {
> -    target_ulong sp = common_semi_stack_bottom(cs);
> +    vaddr sp = common_semi_stack_bottom(cs);
>       return sp - 64;
>   }
>   
> @@ -389,9 +389,9 @@ void semihosting_arm_compatible_init(void)
>   void do_common_semihosting(CPUState *cs)
>   {
>       CPUArchState *env = cpu_env(cs);
> -    target_ulong args;
> -    target_ulong arg0, arg1, arg2, arg3;
> -    target_ulong ul_ret;
> +    uint64_t args;
> +    uint64_t arg0, arg1, arg2, arg3;
> +    uint64_t ul_ret;
>       char * s;
>       int nr;
>       int64_t elapsed;
> @@ -462,7 +462,7 @@ void do_common_semihosting(CPUState *cs)
>   
>       case TARGET_SYS_WRITEC:
>           /*
> -         * FIXME: the byte to be written is in a target_ulong slot,
> +         * FIXME: the byte to be written is in a uint64_t slot,
>            * which means this is wrong for a big-endian guest.
>            */
>           semihost_sys_write_gf(cs, common_semi_dead_cb,
> @@ -688,7 +688,7 @@ void do_common_semihosting(CPUState *cs)
>   
>       case TARGET_SYS_HEAPINFO:
>           {
> -            target_ulong retvals[4];
> +            uint64_t retvals[4];
>               int i;
>   #ifdef CONFIG_USER_ONLY
>               TaskState *ts = get_task_state(cs);


