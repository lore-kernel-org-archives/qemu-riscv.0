Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCC0CCF9F8
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 12:21:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vFtYY-0001t1-NC; Mon, 03 Nov 2025 07:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vFtYW-0001qw-8m
 for qemu-riscv@nongnu.org; Mon, 03 Nov 2025 07:21:04 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vFtYM-0005f0-5n
 for qemu-riscv@nongnu.org; Mon, 03 Nov 2025 07:21:03 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-3401314d845so5704066a91.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Nov 2025 04:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1762172447; x=1762777247; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r5d3Wh8oVEEFgOQK5yGrVs/okJ1AvJqd+6XS87n2UT4=;
 b=a1nBimvu4b8qa0cwfCEGuEjPcTrfbGKGzOw2L1IR+EkTVoX2rvBjWI7c+tGcacd05G
 eMpcupYMNi8iN34WCDQj8z2Ijy7BMd4e19sf5Qoq8NgU5nZ55zgZdGUqAuM0/4rROxIu
 n+J0JjoBzNiFkfryYlwyRQ882AOgnvDICBr1Jc0w5IncF7OzSlwtTi0x8kjTqymhTAyr
 mFvNRpEB8rDx/4R6dLHyj1tkzsw8OgJqe6xmMZuLrtyNiWg88XkNZrjSNPXqpNEYZFQn
 uCfKgCsC5mcZmbSf40nH0smCcezKs01wD9ptc2hnuPEu44exWPi+73SnA1wlsfMVhxg7
 bb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762172447; x=1762777247;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r5d3Wh8oVEEFgOQK5yGrVs/okJ1AvJqd+6XS87n2UT4=;
 b=H/9M1slGMLHY9/DqZGVPB94cqyyKsBGdflrmoWYAANBjG5sdkeRemI4qD1bFur6fSb
 qcf4xqipIOWax38gpXpxp2w0EXKx3yAHNx7Y04cjpLxmgqPyB2nXuM3WHQxPWUsj58Ke
 4ZPNdTG6yI2xiW0sjoclg+AVJlGzDyfL83tdfmQT2eePlh5oeA2VF23VoNtF90p7vc0R
 RJatTBEOsCQ2Resm2umGUhUpAeIWQQs9vM/1Iwi44q1nqZTHe1Yr9jKlWHNHjrr28RHf
 74zD28xN8eqfTDzR2rIAvS4I6S84kjf4GF5TZ6kqnNZ6mftM3D2tvqsu3DM2m/QwPHHd
 d+dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSKVKaVixvIGO21/fEn7FTLKfDf7tIUnwBh8A2hOY66XI/9+IJkECvqjoGzy8ASWj8rOlRG4yzu4+Y@nongnu.org
X-Gm-Message-State: AOJu0YzN1qr+auXEZAGqBeKo3b1bRvPv5Xkc6p4Ut4OoTwJzAdjrKlHH
 0zPCSu3D3z6pBqE/4mzUCAt35eNztecUUjkOUVBZ8tMi9OggqgpNs5/1urGFDd3JecM=
X-Gm-Gg: ASbGncsCgsiV0t7ZUvOWA1NVo94WnYMdUrg3cD5ff+3Eb2eYClWGLTC70lfoSSMNxqh
 J/BQFItCnzoZ5zlyUUaB096HHqu8clEyucMJ6r2h2MES3k+5+zaLZ3kYo9U4gbMxubuWVIdQoam
 7DIRsEUiYvP7MiHMuQh6WIjzeeo09bZB1JqVx6VBIWKy/UCDxEcPzTzyyeZAMCpr74S0XFdTMdC
 DgUJxke5+52/afbaH+v5zrhJixbGukeDUmRC6UiEnpOCRjJTKRUHXr8wgdmsllKDfct7o8Q75Wg
 hyh9LZu2LICPY08NeIvldNr7vEKeBhO5eirXiHMO17Fx8XgErFnQ3Qa89uXITSErcp5gO3+XDQV
 FcDLGrmUVZZ5i+XGpzeHtHMYqxwBTDbQwf/5jqZ7LJn6JttUG28QPjCHdAtQS8Jow2xlE0Du4b4
 6SnqLGb/2NlHwe
X-Google-Smtp-Source: AGHT+IFtukZ5uEIJ6kzigTHjFiqyoSviIh/4YGLnu4ZdZaDqW30Q4J4SpEC+QP16K5OWVZdQ2NU3HA==
X-Received: by 2002:a17:90a:dfd0:b0:341:194:5e82 with SMTP id
 98e67ed59e1d1-341019461a8mr5966010a91.30.1762172447195; 
 Mon, 03 Nov 2025 04:20:47 -0800 (PST)
Received: from [192.168.68.110] ([187.101.65.79])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b96078aee39sm7860884a12.1.2025.11.03.04.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 04:20:46 -0800 (PST)
Message-ID: <3e3e3617-5b8b-442f-adea-068ef636515f@ventanamicro.com>
Date: Mon, 3 Nov 2025 09:20:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] system/physmem: Remove the assertion of
 page-aligned section number
To: Jim Shu <jim.shu@sifive.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Yoshinori Sato
 <yoshinori.sato@nifty.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20251021155548.584543-1-jim.shu@sifive.com>
 <20251021155548.584543-3-jim.shu@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251021155548.584543-3-jim.shu@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1035.google.com
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



On 10/21/25 12:55 PM, Jim Shu wrote:
> The physical section number is no longer ORed into the IOTLB entries
> together with a page-aligned pointer, so it no longer needs to be
> page-aligned.
> 
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> ---

If you go with my idea of sending patch 1 apart from this series, as a bug fix,
this patch would go along with it.


Thanks,

Daniel

>   system/physmem.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/system/physmem.c b/system/physmem.c
> index c163d6b856..23d9b92954 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -1305,12 +1305,6 @@ static subpage_t *subpage_init(FlatView *fv, hwaddr base);
>   static uint16_t phys_section_add(PhysPageMap *map,
>                                    MemoryRegionSection *section)
>   {
> -    /* The physical section number is ORed with a page-aligned
> -     * pointer to produce the iotlb entries.  Thus it should
> -     * never overflow into the page-aligned value.
> -     */
> -    assert(map->sections_nb < TARGET_PAGE_SIZE);
> -
>       if (map->sections_nb == map->sections_nb_alloc) {
>           map->sections_nb_alloc = MAX(map->sections_nb_alloc * 2, 16);
>           map->sections = g_renew(MemoryRegionSection, map->sections,


