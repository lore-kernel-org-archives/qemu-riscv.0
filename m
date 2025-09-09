Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430F4CA0FED
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 12:45:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uvxiz-0001wG-60; Tue, 09 Sep 2025 08:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uvxit-0001vB-Aa
 for qemu-riscv@nongnu.org; Tue, 09 Sep 2025 08:45:24 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uvxil-0001M3-Ln
 for qemu-riscv@nongnu.org; Tue, 09 Sep 2025 08:45:21 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-24b1622788dso38213265ad.2
 for <qemu-riscv@nongnu.org>; Tue, 09 Sep 2025 05:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1757421911; x=1758026711; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K2SAzTTWEn0NzP+tNQNUpX1Y95kG27tn9rny0UcROJ4=;
 b=J0Heb+HrrOxuDqIhM0zB5zAzqnQCKwIwf1z1klHQ5PRBfjowvQAtXuX/btbQSsLx2x
 tzRmRK2FaiZHbPoYmH6rxOokXfTawDydgloVrnllAuDTtcPxYwWN7HnaBRVcsyJueBeg
 msAmjtndMM8w26htbvopQG9wdMKcyHmbO8T20BxGQZ+dnO5pXrm2r5rA9FCjA0lALERl
 i3IhUaKF3zsIzJtK7pqgp+Cl9TgFvwjBluth4lJRE8bgqFgKYt/lg6/AYkHtP7+t/nKg
 S+V0chdhXvYI/GYtlZt5rDjrY7NQRpERZ/wSVue67AlDCwvwuVeqluCla6U4ersbgwrZ
 XDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757421911; x=1758026711;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K2SAzTTWEn0NzP+tNQNUpX1Y95kG27tn9rny0UcROJ4=;
 b=Id5ylHr9PrjKVgF+iwoGGXSx2Xn9oM21IjOo3j0JVQRkcY9mVfnK9PYoLbHH9HW3l3
 oTAWFiDnwbauVtao1YI9fcoB3W7NG9JhTwG4eDbzJLfRKQvz5kqkYYgDbhA2Lzbrbx3s
 gF4SuIKPxm+6PZ3yZckJaGiHfAi1/rhNFhmx4BpzK5Eza4MvEbFfUDmY3dlK/uVB/1Eu
 T1rxUstNeNu7rn08HzSadeMPwcWmiGRGfJaWz/VO27FuFNKlRuoCjz1bgan9Y/OWcFY/
 fHt2ZaKTToDThaaCMS/MjrF2GlmOEUODuvjy1zPUEPkgbgExVYNUZWdLtuPuli9OF4ZQ
 888A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS19sph3PujNzrZ7pgKeLBuGh5TR0bDJ7KhdL5DxPjZv+ZvySXNjnGqZFaHN4hoJtxI5qnaJ58G/kI@nongnu.org
X-Gm-Message-State: AOJu0YwKdWHyY2W4smqw9pGxk6RcOcpc7w0ER9vhEAnhgCoyw3jAcdM+
 z4J707RxDFFLeF1b9P84d6RyEwTvu09ZXS8Ptkd0czx4Wvruf70E8+f+BdOUZzkfUVU=
X-Gm-Gg: ASbGncsfgb9SmcMGp/zSudpPSSs3hjnJozggOM4vY1fBYATGHzms523fsDVCY0RZ/Fx
 IlZisdZGZ6hZZYkGM4GAHNJYLMj7do2S3T7Z9MIr46ezFCWBKB1WQTGX5VzN/ZTeBVAr7Q05S+a
 OMxzMNKqWpBBn2+5HzeSS5dr6q+ra7MLdTnwFdyGEjiGvIGwWgVc67JAHnTdlePZfvSpjo8Id52
 huh5W70Wsudtly8NUlZFCTAti6oe7klhDfKiNFBruKCyiVf47g5In73LaE5v2yuTCXkVbG1DuWw
 cQj4d73hYVpClueMgoMCmZC74UUcvWjTlydnhZRNSXoizI04gZNu6hAmpgEDZLiymDaXNZ7gmWD
 pVtbpHgklJnKRdy3UZ8pSahs70SJftSPxVNvOLUiZnfvzrWc=
X-Google-Smtp-Source: AGHT+IH9ZZZtJphhszcCMvJo1n/OFeU9b/+QXhJF0p3WgljJ9nL2jlniuADQ5HQOY+cCpFHryqJttQ==
X-Received: by 2002:a17:902:d510:b0:24e:9e47:2327 with SMTP id
 d9443c01a7336-25170f37b63mr163658605ad.30.1757421911141; 
 Tue, 09 Sep 2025 05:45:11 -0700 (PDT)
Received: from [192.168.68.110] ([187.10.187.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-252184a16c2sm87663885ad.38.2025.09.09.05.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 05:45:10 -0700 (PDT)
Message-ID: <aa5ea2e9-8d01-4d45-99fc-efa5e6061c8b@ventanamicro.com>
Date: Tue, 9 Sep 2025 09:45:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hw/intc: Save timers array in RISC-V mtimer VMState
To: TANG Tiancheng <lyndra@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
References: <20250909-timers-v1-0-7ee18a9d8f4b@linux.alibaba.com>
 <20250909-timers-v1-2-7ee18a9d8f4b@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250909-timers-v1-2-7ee18a9d8f4b@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
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



On 9/9/25 6:46 AM, TANG Tiancheng wrote:
> The current 'timecmp' field in vmstate_riscv_mtimer is insufficient to keep
> timers functional after migration.
> 
> If an mtimer's entry in 'mtimer->timers' is active at the time the snapshot
> is taken, it means riscv_aclint_mtimer_write_timecmp() has written to
> 'mtimecmp' and scheduled a timer into QEMU's main loop 'timer_list'.
> 
> During snapshot save, these active timers must also be migrated; otherwise,
> after snapshot load there is no mechanism to restore 'mtimer->timers' back
> into the 'timer_list', and any pending timer events would be lost.
> 
> QEMU's migration framework commonly uses VMSTATE_TIMER_xxx macros to save
> and restore 'QEMUTimer' variables. However, 'timers' is a pointer array
> with variable length, and vmstate.h did not previously provide a helper
> macro for such type.
> 
> This commit adds a new macro, 'VMSTATE_TIMER_PTR_VARRAY', to handle saving
> and restoring a variable-length array of 'QEMUTimer *'. We then use this
> macro to migrate the 'mtimer->timers' array, ensuring that timer events
> remain scheduled correctly after snapshot load.
> 
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> ---

LGTM but I wonder if changing one of the VMSTATE_TIMER_xxxx macros to accept
variable length arrays is better than creating a new macro that only RISC-V
cares about. Creating a new macro surely is easier and less messier than
changing all existing callers though ...

I'll let the migration folks weight in. Thanks,

Daniel



>   hw/intc/riscv_aclint.c      |  6 ++++--
>   include/migration/vmstate.h | 14 ++++++++++++++
>   2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index 318a9c8248432a8cd4c3f3fa990739917ecf7ca1..9f4c36e965e2aa379d75c0a9f656177f0dd82a45 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -323,13 +323,15 @@ static void riscv_aclint_mtimer_reset_enter(Object *obj, ResetType type)
>   
>   static const VMStateDescription vmstate_riscv_mtimer = {
>       .name = "riscv_mtimer",
> -    .version_id = 2,
> -    .minimum_version_id = 2,
> +    .version_id = 3,
> +    .minimum_version_id = 3,
>       .fields = (const VMStateField[]) {
>               VMSTATE_UINT64(time_delta, RISCVAclintMTimerState),
>               VMSTATE_VARRAY_UINT32(timecmp, RISCVAclintMTimerState,
>                                     num_harts, 0,
>                                     vmstate_info_uint64, uint64_t),
> +            VMSTATE_TIMER_PTR_VARRAY(timers, RISCVAclintMTimerState,
> +                                     num_harts),
>               VMSTATE_END_OF_LIST()
>           }
>   };
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 1ff7bd9ac425ba67cd5ca7ad97bcf570f9e19abe..255e403e5a103188712425d95a719d181e1a7202 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -522,6 +522,16 @@ extern const VMStateInfo vmstate_info_qlist;
>       .offset     = vmstate_offset_array(_s, _f, _type*, _n),          \
>   }
>   
> +#define VMSTATE_VARRAY_OF_POINTER_UINT32(_field, _state, _field_num, _version, _info, _type) { \
> +    .name       = (stringify(_field)),                                    \
> +    .version_id = (_version),                                             \
> +    .num_offset = vmstate_offset_value(_state, _field_num, uint32_t),     \
> +    .info       = &(_info),                                               \
> +    .size       = sizeof(_type),                                          \
> +    .flags      = VMS_VARRAY_UINT32 | VMS_ARRAY_OF_POINTER | VMS_POINTER, \
> +    .offset     = vmstate_offset_pointer(_state, _field, _type),          \
> +}
> +
>   #define VMSTATE_STRUCT_SUB_ARRAY(_field, _state, _start, _num, _version, _vmsd, _type) { \
>       .name       = (stringify(_field)),                                     \
>       .version_id = (_version),                                              \
> @@ -1035,6 +1045,10 @@ extern const VMStateInfo vmstate_info_qlist;
>   #define VMSTATE_TIMER_PTR_ARRAY(_f, _s, _n)                              \
>       VMSTATE_ARRAY_OF_POINTER(_f, _s, _n, 0, vmstate_info_timer, QEMUTimer *)
>   
> +#define VMSTATE_TIMER_PTR_VARRAY(_f, _s, _f_n)                        \
> +VMSTATE_VARRAY_OF_POINTER_UINT32(_f, _s, _f_n, 0, vmstate_info_timer, \
> +                                                        QEMUTimer *)
> +
>   #define VMSTATE_TIMER_TEST(_f, _s, _test)                             \
>       VMSTATE_SINGLE_TEST(_f, _s, _test, 0, vmstate_info_timer, QEMUTimer)
>   
> 


