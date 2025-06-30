Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9D7C8302D
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 11:51:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uWD2U-0006pM-S9; Mon, 30 Jun 2025 07:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uWD2T-0006p3-WA
 for qemu-riscv@nongnu.org; Mon, 30 Jun 2025 07:51:10 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uWD2Q-00086X-U6
 for qemu-riscv@nongnu.org; Mon, 30 Jun 2025 07:51:09 -0400
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-4a7f61ea32aso79445451cf.3
 for <qemu-riscv@nongnu.org>; Mon, 30 Jun 2025 04:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1751284263; x=1751889063; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3RzLEaOXHmqUWkuQ3zmz/OCZ3SVN88BhJM0B53/UOLw=;
 b=AesiSkUGILUNdKTCdv2R8Yipqp0vHz2SUzlO4J0VQ/jB0Uf4p3qNrL0odEM2tdeDOP
 mKO0G/8uld1Z1CB+JN/9YFxsH0abkO8u6Pf/M6pgrkzsJZvdVNzT5gCtP6Cp0aekIe6m
 pQ4XwmWEKIWjsbN1cCTAl1G9/snsKofUVYX96AggeDOuib+6cmFmqRL/kwNxJRJTrMnf
 LqkDKTbAjiWzAkeKd4W4yzpQImLqtE+PYcNs1n2Re201tSOxfFxdywHdCkWo606D4cE6
 +fxp/5ojQyQHXk/iX0FMfHtncAyJVQ18+XHzwbmznOcaU6lAzLAZhyN7tlfVgBlz9HwC
 379Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751284263; x=1751889063;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3RzLEaOXHmqUWkuQ3zmz/OCZ3SVN88BhJM0B53/UOLw=;
 b=XnsBrepZFLUIlz+bXcxxba9SlTjtPd23cy3Po5Y4D+6i5ADRBlU4YGQNAmbPUYYvf0
 sjrO2Awul3kzkzZsQJFUyBrkvzcQMqvYIBPQFepwsJZ66YAPp57vfKDC03SuCYFz7ufc
 XvrBmTwLVUSs6n42HVPhUmBQ8eerDq/fWu+hUCLkWuDJSlSH7yrrsh5wc2qzXHlkhk6I
 a8XW/CcwUwY8tlv6W5a2NIEZdijTLTJxKcJ7oLJ952g9QuDkJMtkF3Hor7+iE7sttdJ2
 00+evHDSm2VwVzpji///1dbrdF1EeV8ihViHYxDNWtgEwYnzIuYDXxkfZKAAUEBjK+RG
 OwGw==
X-Gm-Message-State: AOJu0Ywgk2THeOP+CoZR7LGNz6YkQqFMBVMfGwgfM6TLgCYdaQoWFtRt
 li9mCzeyGldDjKaO4reU0oV4lxHcSRw1DyaIJd6VNNPGkSIXlix9o98FwGRK+Q6XuK0=
X-Gm-Gg: ASbGncuWCifXkreQoRUQTG06546fyZKpC+MSsU6SchcfEjzXqpI5cI6cbMJnqxE5aEm
 R2TB7eWrf/NdU4ldlcJWaTHuO8N6PHOGSLBgwa20wZNwyaVauEV2FtXBAZNMSQEVB2/DeIp0Czr
 VujdsQRcUetb73GTpI1vaTEy+r0ezkknyHExYeO6zcRIiB3okOwq1MXTVu+5nx6CnIaDXF7zFmC
 QCxc66lmkL3/XSuyO2u/MuTpLVP1pvjFqqUcs/VCYvudUuTaXBC8EfMowDUhbuII2xUJcsfMbAP
 7xdYEyBFtJY9cj3RQ7sHkXmmKHJxupXgd/0od/2s7MWMlpbuEZiBujKM0xrQt2yb+mNNEewUYtg
 =
X-Google-Smtp-Source: AGHT+IGJrDBNwrqFd706CH0KhcFMn/UT9+yb9CNIRfGhIdoN21cJoz/IVxaSBMdE5Emq79PzMfLGLw==
X-Received: by 2002:a05:622a:296:b0:4a6:f6e6:7693 with SMTP id
 d75a77b69052e-4a7fc9d8522mr193028571cf.6.1751284263134; 
 Mon, 30 Jun 2025 04:51:03 -0700 (PDT)
Received: from [192.168.68.110] ([179.93.20.232])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a7fc55c396sm57333521cf.50.2025.06.30.04.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 04:51:02 -0700 (PDT)
Message-ID: <dc3ca3fd-1159-4186-acbf-ddd38276c33c@ventanamicro.com>
Date: Mon, 30 Jun 2025 08:50:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] target/riscv: Add cpu_set_exception_base
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>
References: <20250625141732.59084-1-djordje.todorovic@htecgroup.com>
 <20250625141732.59084-3-djordje.todorovic@htecgroup.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250625141732.59084-3-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-qt1-x830.google.com
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



On 6/25/25 11:18 AM, Djordje Todorovic wrote:
> Add a new function, so we can change reset vector from platforms
> during runtime.
> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> ---
>   target/riscv/cpu.h       | 4 ++++
>   target/riscv/translate.c | 8 ++++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 229ade9ed9..fba0b0506b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -656,6 +656,10 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
>   target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>   void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>   
> +#ifndef CONFIG_USER_ONLY
> +void cpu_set_exception_base(int vp_index, target_ulong address);
> +#endif
> +
>   FIELD(TB_FLAGS, MEM_IDX, 0, 3)
>   FIELD(TB_FLAGS, FS, 3, 2)
>   /* Vector flags */
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index d7a6de02df..c3fbae7cfe 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1427,3 +1427,11 @@ void riscv_translate_init(void)
>       load_val = tcg_global_mem_new(tcg_env, offsetof(CPURISCVState, load_val),
>                                "load_val");
>   }
> +
> +#ifndef CONFIG_USER_ONLY
> +void cpu_set_exception_base(int vp_index, target_ulong address)
> +{
> +    RISCVCPU *vp = RISCV_CPU(qemu_get_cpu(vp_index));
> +    vp->env.resetvec = address;
> +}

Sorry to not noticing this in v3 but I don't think this code belongs here. There's
no translation related code being done. This code is better placed in
target/riscv/cpu.c.

Also, qemu_get_cpu() can return NULL. Given that you handled the NULL cases in patch 1
to support sparse IDs I believe it would be consistent to do the same here for
the sake of future users of this API.


Thanks,

Daniel

> +#endif


