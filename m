Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78306E77188
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 13:08:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tXgeh-0005bs-MF; Tue, 14 Jan 2025 08:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tXgeW-0005XO-Sh
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 08:08:21 -0500
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tXgeU-0001zd-56
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 08:08:16 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-7231e2ac9e4so1142230a34.0
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2025 05:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736860092; x=1737464892; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0CHqtPvt3LZZuIyf8SFhofuwCMSuT2eDxjB5jqkyswo=;
 b=V6Mgrqb2AgDSBbY6su8vYtvGal96FdQ9RRgPSShI3ELOn9zGOPQWReASXfwG3NJY/K
 y8xzwz3WCDkewJuP1JkNjc7xgTTzV/2iNHFf7v0ab3g45Z8k3K/JFTK5Ut3/fB+0UGtt
 ulNdIuuK4F8nGCJNMAHdAR146IYT4H9btBazm3r0rDWa+28zMV4vHGuwiMJbNGo6LO4N
 mZ210k4H9kgA7R/KIFwAd6y3d+6DoqVGyKqz6VLSlNc+ddqgrkI7FyZ/TNnRT51OAJQL
 9jlLbJTD560gO70OByy7jNaeR7AFsX4hvTpSS7gJRCGNAGrEMNnsMiM/vlb+Hl4bJ9zO
 nqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736860092; x=1737464892;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0CHqtPvt3LZZuIyf8SFhofuwCMSuT2eDxjB5jqkyswo=;
 b=gXvYrRQ8kqrHPYSclI1diHyrQCTuuqXKBuImu3y2JNMdaGCv/6uZU3afcJABnhEmft
 e8LMfXspwdj1122xUaYzWOZ+Wkx0UJshP7J0/rWgUIrIIl9gDAbKjTnSAbxRUqvhG0A1
 sdW+6XcV0qYAHNePK5cUJfMP2+iBVjtWjCiisVb4aMjL7uW6VMv9N+umEcmxQ1UYSjWx
 qWKJtvQrVlFdPQXEWBNXFmDZP9f3Wlf9Z2k0QBNBOVEk28gOxZtjln0NU/bI/IsfPQ8r
 Ll4lLSMWHBoWTIMAXpHfPrhpzBNEf/35vjg8Ez4B49bsG9x+Z5DVVVqXaoOqyt0cgQME
 OKiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdmuJelrVGK0WaiyORkvejD9dutOiLRQXs8fjDn5Bels9UisoOqKa8Ryez3oe47vnDqxde/ikpTZiV@nongnu.org
X-Gm-Message-State: AOJu0YwEnc4dg41+7PHEYMxb8Tv0341YW9Dhx5Zlk2UVszY7xmkGHtjF
 A8cuaDMv2babPqgg+nM4K/fCtQ6gBhOhblyXzweuITD1QJfLnL6z3UY+i/f4kE8=
X-Gm-Gg: ASbGnct1UwxvLlCC0TFnoHUv5OgQnqRReA7AAdpgvuGLJZTgyY6YBECFCTLzf26IAF9
 pViARPzg2maw3snpPWTzytfo0KxIgI28YIpn4RIvn7q1OdQpUFcoBiIqZp1B/UxG6CpZCgeJrmh
 KSAn6Q4mWDyQ9HTiKtuZMPJGweLZPSYpdyP2Ke6x8edavPzsmfauQ5KTzBnVH17hk7w5NKkx+V0
 VveGxOc4uzCNNcb+V41DbnMbRuPsro39PFWlqsBkQac2WeSLps58xgoM8+2Go2DVvPsbtbg
X-Google-Smtp-Source: AGHT+IEwhuldlpffjiQRJblz18f7v4MSkpZhZkZ7ynnWMnQZWY2Sc9oqqng46odyT5/4laWqJbI+dw==
X-Received: by 2002:a05:6830:6610:b0:716:a95d:9ef with SMTP id
 46e09a7af769-721e2e000d6mr16590862a34.2.1736860091391; 
 Tue, 14 Jan 2025 05:08:11 -0800 (PST)
Received: from [192.168.68.110] ([189.110.107.205])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f88266e273sm4209793eaf.26.2025.01.14.05.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 05:08:10 -0800 (PST)
Message-ID: <72c3e437-1a2c-49e8-90ed-61ce1b1f5342@ventanamicro.com>
Date: Tue, 14 Jan 2025 10:08:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] hw/intc/riscv_aplic: Remove redundant masking of
 hart_idx in riscv_aplic_msi_send()
To: Huang Borong <huangborong@bosc.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20250114025320.52696-1-huangborong@bosc.ac.cn>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250114025320.52696-1-huangborong@bosc.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x336.google.com
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



On 1/13/25 11:53 PM, Huang Borong wrote:
> The line "hart_idx &= APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);" was removed
> because the same operation is performed later in the address calculation.
> This change improves code clarity and avoids unnecessary operations.
> 
> Signed-off-by: Huang Borong <huangborong@bosc.ac.cn>
> ---
>   hw/intc/riscv_aplic.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index 4866649115..0974c6a5db 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -421,7 +421,6 @@ static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
>               APLIC_xMSICFGADDRH_HHXW_MASK;
>   
>       group_idx = hart_idx >> lhxw;
> -    hart_idx &= APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);

It is worth noticing that this will change 'hart_idx' in the qemu_log_mask() in the
end:

     if (result != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: MSI write failed for "
                       "hart_index=%d guest_index=%d eiid=%d\n",
                       __func__, hart_idx, guest_idx, eiid);
     }


But I believe 'hart_idx' in that context should be the original 'hart_idx' parameter,
not the masked value like we're doing today.


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   
>       addr = msicfgaddr;
>       addr |= ((uint64_t)(msicfgaddrH & APLIC_xMSICFGADDRH_BAPPN_MASK)) << 32;


