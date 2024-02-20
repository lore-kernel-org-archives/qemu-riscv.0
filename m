Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC3EC48BC4
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 11:54:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rcOha-0005Xi-FC; Tue, 20 Feb 2024 06:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcOhU-0005Vn-Pn
 for qemu-riscv@nongnu.org; Tue, 20 Feb 2024 06:54:17 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcOhT-000782-52
 for qemu-riscv@nongnu.org; Tue, 20 Feb 2024 06:54:16 -0500
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d0e520362cso54246581fa.2
 for <qemu-riscv@nongnu.org>; Tue, 20 Feb 2024 03:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708430052; x=1709034852; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fc+Ydkj43ti6ghsHqBog9q3KSL9s+s1cxBKBoztaLn8=;
 b=NiaqeEMNegq+0CBLDdnRUzm4pttimDxWrjOOYxlNsHOUzqJ3AoxCm4hG/LMDnUxPEd
 zaSbVRHBgRVddRpAyIUII3nrZb4O5EYltl70kIliTnGfBixvYvyjmpH/P0g9bLJnnNDH
 VMNztdFvZunf7TgzfZHQkqJb4jEI1HLvTkrnLpc5FWBsRRq2WM7UbDgz5WYmBRCrLYQv
 BViZhtE6G8fbGRTeGikD5gBbugCyCaCGTXCP2YDzI+1099E5sFfJlv5AJBFNjMcTgheN
 6jizbZShrvWbGI57Yq3i22XW/s+j/08iwhsGIjyVe65sQIcmt9qiXLrwSGmeYG5VxvuB
 aKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708430052; x=1709034852;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fc+Ydkj43ti6ghsHqBog9q3KSL9s+s1cxBKBoztaLn8=;
 b=UrLLzyEsatHZ6tPbcqUX7DgWEl5DWc6perKaxND2Cylc9NVNeaddqJRiqYg7KmacrO
 dLHV0KGnYg55NML1b7FChzkEjEje2Q6fYQ/O2vd5X4YLoK5BJHgMM4fAcmVuao4zp+Ei
 oSayS2ffaO+96PE0hklTBYjUrqphDEi1GwqrLEO2/7Up9BovuOCnzTXANoXi/s/axPzt
 BexN+Fc4uMEUhq63bEqbr4jja9bRkbBRnbgCuyX8mTTOGZHFwi7zYmj5Qk0+ui2I65vN
 Kbe01T8nwXyJt2JEvpUucvaYB8KijPAYkS5aJ3OW7YC+J1y9+GQ9PCJZYZ3vFRhzf+vx
 RxcQ==
X-Gm-Message-State: AOJu0YxXHwmlm18aQOJlN7m194GPoTBiC56nRRk3g5KD5U3/g/XefvTo
 rDt5yuGJfHJtvGQh0LejuahYFxgnR6R3G0l2S11brrHXozraxDMmKjxnL4fSBfg=
X-Google-Smtp-Source: AGHT+IEWxvVS3EkUp+QVY+IeiN5/NcfdZjMSjG9g6qso74zFb5wyZHvN1fsCCtRw3WHKlku0nrFDiw==
X-Received: by 2002:a2e:9b11:0:b0:2d2:3f1d:92ec with SMTP id
 u17-20020a2e9b11000000b002d23f1d92ecmr2868618lji.40.1708430052375; 
 Tue, 20 Feb 2024 03:54:12 -0800 (PST)
Received: from [192.168.69.100] (mek33-h02-176-184-23-7.dsl.sta.abo.bbox.fr.
 [176.184.23.7]) by smtp.gmail.com with ESMTPSA id
 l14-20020a7bc44e000000b00411d1ce4f9dsm14151504wmi.34.2024.02.20.03.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 03:54:11 -0800 (PST)
Message-ID: <e150b9d8-589b-44cd-9524-b862e50f16fa@linaro.org>
Date: Tue, 20 Feb 2024 12:54:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Add missing include guard in pmu.h
Content-Language: en-US
To: frank.chang@sifive.com, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240220110907.10479-1-frank.chang@sifive.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240220110907.10479-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 20/2/24 12:08, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Add missing include guard in pmu.h to avoid the problem of double
> inclusion.
> 

In case it needs to be backported to stable releases:

Fixes: 3780e33732 ("target/riscv: Support mcycle/minstret write operation")

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/pmu.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> index 505fc850d3..7c0ad661e0 100644
> --- a/target/riscv/pmu.h
> +++ b/target/riscv/pmu.h
> @@ -16,6 +16,9 @@
>    * this program.  If not, see <http://www.gnu.org/licenses/>.
>    */
>   
> +#ifndef RISCV_PMU_H
> +#define RISCV_PMU_H
> +
>   #include "cpu.h"
>   #include "qapi/error.h"
>   
> @@ -31,3 +34,5 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
>   void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name);
>   int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
>                             uint32_t ctr_idx);
> +
> +#endif /* RISCV_PMU_H */


