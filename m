Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EADC7EE23
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 20:25:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q45uO-0000T8-8K; Tue, 30 May 2023 16:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45uN-0000Se-6e
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 16:25:31 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45uL-0002mf-Qd
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 16:25:30 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6af6de9fb74so3707981a34.2
 for <qemu-riscv@nongnu.org>; Tue, 30 May 2023 13:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685478328; x=1688070328;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GgLztPHIJUTPUNEKEmJf2nNCR0AjirBb0oiqqsg8yoQ=;
 b=Flk+53hSSN/+vIOezqyZXlWFMO/vFGfKkklNKeHNRYMJoL8zTDyZ4Zg449UC/YtyRt
 wEs7PVyviRiDeONMYYW7h7Yy3GxmAy+YBFm2EyG3dTaSLFsgcyDcsxJKbSxbTRv32FWY
 ifngXB3UKjcp2MTHIV35T0I77X9YbCsUzI6vqJOgxIz3cv8oe0cljFRa8r5YcjOSrXJ5
 runyXcvubXfQOqMkBkdgXr/waEzrYcFNri+E4NirtpjzZMWAefAW2NX+JybbFDGDlX3y
 A8xy02c5cIPhDEUWVkBdgTnxBYTEALMrkck+/aORX5BHyAP4WZm8BMoJVzJtf+bbyD3Y
 mzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685478328; x=1688070328;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GgLztPHIJUTPUNEKEmJf2nNCR0AjirBb0oiqqsg8yoQ=;
 b=R+0J5g9vYqxK5uhlLNYDOJJmSOlp1LP4vkK358/o22FueWsgq/6UJmIS0OlG+YKARl
 uPp1DUKG//P4igqwh8xB9ORRal1ZiqmBuix7Y83Rf+taun37ymTifYCBuzoupmVFDAxG
 EbPmTWZtZM5Bexj3ZJH+x3vKOGbBOoF35rrnsSqQXPa6zLu5ZylzrvpMFOztQhLp5/58
 1RMaA+cu3gLhil1n10jcPlwo4MR8tGt9tuB3pXkbBrJxqErNBEGgf2Wyd+ocskTkVUDj
 A96Zrt9FY5duw2sF7bAP/BiYQY/v1WE+YFL71y+EXEUv+ev6wRqwl10FZDyZweTr3JQM
 hK6w==
X-Gm-Message-State: AC+VfDy9kdK6hJwDH7TwPJLbpD4QjTCt8ml/KKOBedTeMgw1W6326ZRJ
 xQF9fzSwKymARjYMzcRgFGd3MQ==
X-Google-Smtp-Source: ACHHUZ6TjopWS5BvAwXGA5tgxH7tr/OfVtfNY9vV1ys1pR/oyDg/uEwXc+ET8HptvFgIfRRwi805vA==
X-Received: by 2002:a05:6830:1e79:b0:6af:6e7c:e7ad with SMTP id
 m25-20020a0568301e7900b006af6e7ce7admr251721otr.4.1685478328627; 
 Tue, 30 May 2023 13:25:28 -0700 (PDT)
Received: from [192.168.68.107] (200-162-225-121.static-corp.ajato.com.br.
 [200.162.225.121]) by smtp.gmail.com with ESMTPSA id
 z24-20020a9d7a58000000b006adc6abf66dsm5920334otm.6.2023.05.30.13.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 13:25:28 -0700 (PDT)
Message-ID: <e9e7d900-e851-b640-1c8a-2594c21f6aa5@ventanamicro.com>
Date: Tue, 30 May 2023 17:25:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] target/riscv: Remove check on mode for MPRV
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230529121719.179507-1-liweiwei@iscas.ac.cn>
 <20230529121719.179507-3-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230529121719.179507-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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



On 5/29/23 09:17, Weiwei Li wrote:
> Normally, MPRV can be set to 1 only in M mode (It will be cleared
> when returning to lower-privilege mode by MRET/SRET).
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index bd892c05d4..45baf95c77 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -44,7 +44,7 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>       if (!ifetch) {
>           uint64_t status = env->mstatus;
>   
> -        if (mode == PRV_M && get_field(status, MSTATUS_MPRV)) {
> +        if (get_field(status, MSTATUS_MPRV)) {

As I mentioned in patch 1 this is a good place to put this change:


-            virt = get_field(env->mstatus, MSTATUS_MPV);
+            virt = get_field(env->mstatus, MSTATUS_MPV) &&
+                   (mode != PRV_M);
              if (virt) {
                  status = env->vsstatus;



Thanks,


Daniel


>               mode = get_field(env->mstatus, MSTATUS_MPP);
>               virt = get_field(env->mstatus, MSTATUS_MPV) &&
>                      (mode != PRV_M);

