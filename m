Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7369C3DA59
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 16:50:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sVwE2-0005FM-PW; Mon, 22 Jul 2024 12:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sVwE0-000567-Mh
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2024 12:49:24 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sVwDx-0007LA-JW
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2024 12:49:24 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-70d24ee678cso881180b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jul 2024 09:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1721666958; x=1722271758; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ojd67kYJwQNwCJ7C4DJs/GgdGhSFvQnplRWu/lP131A=;
 b=MB1YZUnEBw/nasA+5UHIddjm3KtLCyswmXdLOPmEi5LuZsqvYhLjeJgyHC2bisfRxT
 n1PqaoFNXlpfXkRE/keVcJDs2tCOm75aMl6y3RfbitO9NxzIUI7zPVFBfG8mMoZFmmy3
 7IN/xBxRSvEjRbaBnRfUbKst3+fqB+Qj8hEMGdBTScmp23I2en8VdQrgORRx4TadS+I1
 4n+9sTqCsYU0wujm4y4bbZjXLwwB+apveEHEMMsfgTsM73rUP94/o2H/TumT+0eFaTti
 udFDg0X1io2vmGcDG4KDEEzK2Rwno5HzBawS/ycqJp/omKhsr+NXbMMj94IfKN8eHsf/
 ElnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721666958; x=1722271758;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ojd67kYJwQNwCJ7C4DJs/GgdGhSFvQnplRWu/lP131A=;
 b=d0UyhduSDha0RbiooSfQ2PFGXSQGZLGB3cBiOv8sNy3NsskmvG5l863qaKe1c4nUso
 1V3LQZaSmgyzbz30fcpCbV6/HCXffV+YpWtix+NkvGHqn5aehdDCIkfC8GlZ2BqqiosS
 19NcjbjJvWuWqdgWvUcfsCy4oUpK7R0gdtzV9M5EvJjZo+4c2Qi/0M+oGatbH4Ew2Uss
 7ZZuRcbE9u0pioC8qGdJx+ekbh91ILcIiclwOqKCGfsCwMYLw98lgyHuRKtrDuxhaYxc
 uI3Xr44qx4S0bdthUjGLUvx+ZCVg1RZhZqnDCgnQyeg/SnDle/vpnKF3QReeC1zMURdx
 Tshw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqHvx2l7LKqAYEbxfXbwWl5yinovX3PPR4p7LwcQkDVXYoZt+FYB4N/Cz3ndMgB/bIeNFZ+EvO2JfQhr+aN3omrZzeiuY=
X-Gm-Message-State: AOJu0Yxul7kbF8aOSBHFic54C7AUdPptToySe3JTJUyZWHqeJmIFoIbL
 VCXpXckfCh8RRHKOiu/GNKsiS42XAdXP2VeVDLKg5PZ1DVzNZ3rBfdOka60+iCs=
X-Google-Smtp-Source: AGHT+IFWc15RCjb9dB08HdxgnTQQZpVJGNH8Z4+qSSdqBJ5a7WIkTpT5xXLMYfztPhOU/QCYTspaCA==
X-Received: by 2002:a05:6a20:430e:b0:1c2:8bcc:bb09 with SMTP id
 adf61e73a8af0-1c42857336cmr6308503637.8.1721666957556; 
 Mon, 22 Jul 2024 09:49:17 -0700 (PDT)
Received: from [100.64.0.1] (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f28e87esm56848115ad.66.2024.07.22.09.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 09:49:17 -0700 (PDT)
Message-ID: <c96ad0e8-bb2b-4af3-b706-57cd93653f9d@sifive.com>
Date: Tue, 23 Jul 2024 00:49:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] target/riscv: Simplify probing in vext_ldff
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20240719010707.1319675-1-richard.henderson@linaro.org>
 <20240719010707.1319675-13-richard.henderson@linaro.org>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <20240719010707.1319675-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Reviewed-by: Max Chou <max.chou@sifive.com>

On 2024/7/19 9:07 AM, Richard Henderson wrote:
> The current pairing of tlb_vaddr_to_host with extra is either
> inefficient (user-only, with page_check_range) or incorrect
> (system, with probe_pages).
>
> For proper non-fault behaviour, use probe_access_flags with
> its nonfault parameter set to true.
>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/vector_helper.c | 31 +++++++++++++++++--------------
>   1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 1b4d5a8e37..10a52ceb5b 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -474,7 +474,6 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>             vext_ldst_elem_fn *ldst_elem,
>             uint32_t log2_esz, uintptr_t ra)
>   {
> -    void *host;
>       uint32_t i, k, vl = 0;
>       uint32_t nf = vext_nf(desc);
>       uint32_t vm = vext_vm(desc);
> @@ -493,27 +492,31 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>           }
>           addr = adjust_addr(env, base + i * (nf << log2_esz));
>           if (i == 0) {
> +            /* Allow fault on first element. */
>               probe_pages(env, addr, nf << log2_esz, ra, MMU_DATA_LOAD);
>           } else {
> -            /* if it triggers an exception, no need to check watchpoint */
>               remain = nf << log2_esz;
>               while (remain > 0) {
> +                void *host;
> +                int flags;
> +
>                   offset = -(addr | TARGET_PAGE_MASK);
> -                host = tlb_vaddr_to_host(env, addr, MMU_DATA_LOAD, mmu_index);
> -                if (host) {
> -#ifdef CONFIG_USER_ONLY
> -                    if (!page_check_range(addr, offset, PAGE_READ)) {
> -                        vl = i;
> -                        goto ProbeSuccess;
> -                    }
> -#else
> -                    probe_pages(env, addr, offset, ra, MMU_DATA_LOAD);
> -#endif
> -                } else {
> +
> +                /* Probe nonfault on subsequent elements. */
> +                flags = probe_access_flags(env, addr, offset, MMU_DATA_LOAD,
> +                                           mmu_index, true, &host, 0);
> +
> +                /*
> +                 * Stop if invalid (unmapped) or mmio (transaction may fail).
> +                 * Do not stop if watchpoint, as the spec says that
> +                 * first-fault should continue to access the same
> +                 * elements regardless of any watchpoint.
> +                 */
> +                if (flags & ~TLB_WATCHPOINT) {
>                       vl = i;
>                       goto ProbeSuccess;
>                   }
> -                if (remain <=  offset) {
> +                if (remain <= offset) {
>                       break;
>                   }
>                   remain -= offset;


