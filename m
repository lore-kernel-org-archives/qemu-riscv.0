Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386D5CA1009
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 16:53:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1utqjr-0004LK-Aq; Wed, 03 Sep 2025 12:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1utqjn-0004I5-1L
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 12:53:35 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1utqjl-0007RF-1q
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 12:53:34 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-24622df0d95so1217715ad.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Sep 2025 09:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1756918411; x=1757523211; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4cG4f9JgMDGnqH3OmMRaNeWvcJJZQ4otU2Q4xxdEaeY=;
 b=MdvqgDzn6EIhnojsZSgki93tyE8H59lENFAY1H2nY8+qJrdTkwJEtgb0SbLw+gBFi7
 stiUANu0Y0TAcMhucv2EzUmOvCFgryuQRrSduDRoCvD3eMVq9wuI9g2gR8/UAVVN0XjF
 k6oqu71QIP4VVI9SlJ/x/TRWVjL62Lr2nEztPwb82CN0CDKwBrNwbhUPAWeR/mngDjuT
 /JyWnG/EswDT0T0X4uxD2zybfhUfICg6XlaRoiIi06XyjeU74LZmhwENNTz3peWrwId3
 P7ZfQ0G1wzszJLLdQ6KF7WRKPbb5DhLMSrCbrhhNe2DOW232oGELonK+YPs/lH5NQyuU
 0MKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756918411; x=1757523211;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4cG4f9JgMDGnqH3OmMRaNeWvcJJZQ4otU2Q4xxdEaeY=;
 b=m2h0KYqsGvOLBE46jqvMwkQMdFNpai7m3YvYb+3n3xeba51ExTEEykx8FiJ6t0JFtt
 eOqY8TiVSBO5eJZRn59rUdr5G2Qc9+v+SReXdT9nQQBWuv4j5sFN8kjNMICGMEvNNbGt
 +E/WbsDtxBKe+WpDSPpA7NIstKSwOrMSBf04xHJeXJJaftu3d4hKuoTSh9Wd2SExC52Q
 gGq1eGgfJXwEtxufDdAG80OVPw1/ZtQ2/NA6YJkdlbBiUZuyD3jMKWpJjEYU95XVKddb
 dCKrSFVvipCErwyDSFwFxsv06oTpsvG4MKHo9IsdBJiot0om0wbqEJLWafTmNKMKcbZL
 gVkA==
X-Gm-Message-State: AOJu0Yyu2z9Z7zdVI6VTGMlo0jMy1ztOk8sG5oCTpwAPsDCNnnuhnlk0
 Io1wkh7r5EzALcdmPTTEc8EcT9aPG9GRXzQQHRS79gvrayVuPrQDr5FcZjM+UzQOa3Q=
X-Gm-Gg: ASbGnctcUk+GvjEomViDWLRjxNz+2lzEXFd5wB0j0f6C3/3Nmj1ydNzLc1qifpASzxu
 KiZHcLE0Ump63qSSfK3I/4vxFtfKucFN12DYfPGqO8V2IIUZUB6vVc7ne27QXbOb2XTxLsixFwW
 BpHv1ff4JhtlB7r9GF0mbMA3bNnmhsyfcBoJ5fRCY8cnD2zpCvr+iutEZL77bDNbHJneEHHy1qj
 pNhaqheAYrztzUDF4KnySpm1ZX0aQWQyeV2r//mzNuGN0am+XYWHHMcaiusKa6NeNrnnjwUHNMR
 xdJ0x3wa6d+eLSyStfWkGWez0avhUtmnYz+FUNRybdVq4Tb6laF8TqkG8wtwkKgmNAa9xhjxUvO
 OOByIVvr91gQf7XJ0ebSli0PmuoWYBBez1m9f
X-Google-Smtp-Source: AGHT+IG7LllPmrR4osGLxY+5SrQesUCxtCydiv2rCTODLd4H1Ny03lo6wedl+ATL+VLUUOd3Aqpwhw==
X-Received: by 2002:a17:903:186:b0:249:1bac:eefb with SMTP id
 d9443c01a7336-24944b1fe75mr194529145ad.54.1756918411239; 
 Wed, 03 Sep 2025 09:53:31 -0700 (PDT)
Received: from [192.168.68.110] ([187.10.187.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24b1589e480sm51902225ad.130.2025.09.03.09.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 09:53:30 -0700 (PDT)
Message-ID: <e9ff707e-baf1-472b-b762-eae9d958b14a@ventanamicro.com>
Date: Wed, 3 Sep 2025 13:53:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] riscv: add all available CSRs to 'info registers'
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
References: <20250623172119.997166-1-dbarboza@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250623172119.997166-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
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

Ping

On 6/23/25 2:21 PM, Daniel Henrique Barboza wrote:
> Hi,
> 
> The output of HMP 'info registers', implemented by the cpu_dump_state
> callback, returns way less CSRs than what we have available in the
> default rv64 CPU with default options.
> 
> This series changes the callback to add all available non-vector CSRs
> when issuing 'info registers'. The vector CSRs are being handled by
> another patch [1].
> 
> Patches based on alistair/riscv-to-apply.next.
> 
> [1] https://lore.kernel.org/qemu-riscv/20250623145306.991562-1-dbarboza@ventanamicro.com/
> 
> 
> Daniel Henrique Barboza (3):
>    target/riscv/cpu: add riscv_dump_csr() helper
>    target/riscv/cpu: print all FPU CSRs in riscv_cpu_dump_state()
>    target/riscv: print all available CSRs in riscv_cpu_dump_state()
> 
>   target/riscv/cpu.c | 107 +++++++++++++++++----------------------------
>   target/riscv/cpu.h |   2 +
>   target/riscv/csr.c |  18 ++++++++
>   3 files changed, 61 insertions(+), 66 deletions(-)
> 


