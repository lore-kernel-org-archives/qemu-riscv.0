Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFZTl-0000B9-IT
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 06:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFZTk-000099-03
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 06:41:12 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFZTc-0000AL-Sf
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 06:41:07 -0500
Received: by mail-wm1-x32f.google.com with SMTP id g10so10893991wmo.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Jan 2023 03:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jwTeo3ZkkxI+L+of6rcWdga3jb4dqhIZoBJkzpl+m3g=;
 b=USROVS1BnmiHm/9acqM+GJyIU8S/06ZWVF2CGncEYVUvPoDEyaUk5uB8XuTFXsZVQQ
 1sNYOwQmF7lzMN18hUGLL0C9r3qO0Xqq5h4TVJwFUW6Z8dMyhcr32Anl+FprPbXYcDJ3
 z2GH9Wu0/ZG94Ebej+Nf9gZ/aCCv2Jzad2/HkFt75uQ++0Vi8Jp/RI4KvyspwOwSCFKK
 RlRZeH5IJaAiZ/ArPvlz3tZLdYQMLhmdZ2SOC26dxqeLeG+aMzxoSb9CHpt9zfyZlhRz
 AwSyzinGOTaF9uIxXtElNOFvEfiBWy5gdScbpGVj0Tfr+8hkGF8hySwRqIPsLYkKPXwM
 owFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jwTeo3ZkkxI+L+of6rcWdga3jb4dqhIZoBJkzpl+m3g=;
 b=un3XXyioQI5KsnDOVzi749pbxevGe/RZrgoK1d1Lepf8xFV7ZdD8WaPLlQ0NFU3NWN
 VPqGZD2l7Zs3DBZf6+7O3/ruL//hnz8SNKptAeGVmmr6t08RS48i9qs5p6DxPLW+toMV
 p73or8LyHq8sJHuXjMbUBqgq4GC8kqP+/L8IwL97CVG+ZVTQyP2vab3lg2RiJQ9GHFv/
 wT/bSscR8zTky4NikxjQCB/iqDhS9xEHItujWVPVxffuJH/zuvk+BtDpq57CewGHhQ/p
 qkXhtVuEvwxjjsJY8faXOlX0ItruqZSrKnhD7st1QYiae4vyPhC8tls8wx1K9yT6gy/G
 L1pg==
X-Gm-Message-State: AFqh2kpD5+nhpNa6lK+k0pq3txzDXNQ3ZQHlFsf0RsFbchVNHfN+TxVM
 CRywmdxaXkvSH3Zcg0hczQK+ZQ==
X-Google-Smtp-Source: AMrXdXtz0RIqxYLTnD227I9Av/KU93A2tiVTe54bZiiF8yaNzeOlwwRK26WHPClaoP8T/2/Ln0N2gA==
X-Received: by 2002:a05:600c:3545:b0:3d9:a145:9ab with SMTP id
 i5-20020a05600c354500b003d9a14509abmr32835792wmq.39.1673437263364; 
 Wed, 11 Jan 2023 03:41:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c4f8900b003d96b8e9bcasm25007665wmq.32.2023.01.11.03.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 03:41:02 -0800 (PST)
Message-ID: <4aa7f3f1-551e-edf3-c1e1-1604fc42d3f4@linaro.org>
Date: Wed, 11 Jan 2023 12:41:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 14/36] tcg: Add basic data movement for TCGv_i128
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230108023719.2466341-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 11 Jan 2023 11:41:12 -0000

On 8/1/23 03:36, Richard Henderson wrote:
> Add code generation functions for data movement between
> TCGv_i128 (mov) and to/from TCGv_i64 (concat, extract).
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg-op.h |  4 ++++
>   tcg/tcg-internal.h   | 13 +++++++++++++
>   tcg/tcg-op.c         | 20 ++++++++++++++++++++
>   3 files changed, 37 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


