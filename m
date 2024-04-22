Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1225C4345F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 13:02:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rytJG-0000Yq-Go; Mon, 22 Apr 2024 09:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1rytJ9-0000YM-4q
 for qemu-riscv@nongnu.org; Mon, 22 Apr 2024 09:02:07 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1rytJ5-0000C8-Vk
 for qemu-riscv@nongnu.org; Mon, 22 Apr 2024 09:02:06 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-349a31b2babso651995f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Apr 2024 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713790920; x=1714395720;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=msJIZBAlNSRvum4JVDHS8jLA1sUyfGdrKRHLEguwhEU=;
 b=muZwCi3Nac/CLnQPwsY0WT75520vjeA5f49fZ2Jeoki3ppCo1dTB+CNVgD+k9XrJmv
 /B4Bb57eyDwog6PkIw8FEoeaI/dXbeXtaIEEQr86E87LVxniQ7RHveHpmGj+ntBSbRVx
 ZjLoywAAFw2XPU3Fy7xgE5L8Xl5BRA8tNZM+s6P4IX81XYoPubQo1T8GBz6Zs+kmnNGR
 ylobgpWRWhVP6BICNO8mbXYt7P9HOO8YcxRiIiX+jtMiNAnyg1ys+MaRQ1eMrHHsoxfH
 UCYISEMlycsEe0yV2q3VVWnanq+YQcc0Eq333DBNneSNgS2dfREapeM9MH/zzey63xXD
 wtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713790920; x=1714395720;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=msJIZBAlNSRvum4JVDHS8jLA1sUyfGdrKRHLEguwhEU=;
 b=h8nPIBvYsjyTHR38DwOBHU5Vpt3F/CN+HziolH8aXNCpeMCmctTaYbQIXN0v7yRqWn
 Z2hpMlANT7uibCfMiKQbtLY9pZLnh0ywrG3d+hg6+PB1VTyidH5TfU8tn7jKxLPi6KVy
 DS7ZMcu51ixFJ2wYxDSd1aoVhHOx8VtN3SLON9Crs8cwPzCwhBuFogJ/WkQH4qR5hh7R
 wxLLZRDd1gpgQ0QKNt/2sfALYCE4plZ+uuZz5xnie8X0CfZ14i845rhmwC+1jp0UC+Kh
 XfARvREiItE5imHS8IwqmFJrU3whSj2Z5aEiB19LkJw+GwVGTqYMY6sIggkstJUxHtsG
 MT9A==
X-Gm-Message-State: AOJu0Yz+/MwJilQQ9GWhueGiMRdFLyQ2XOQNNoyLXe5fmwSwHpUnpwoV
 0to8OKue0xy8Nc1St90UBDz3tK5CTKopcP/IDsNT/29tClZYu1uftA1pEeLmCLQ=
X-Google-Smtp-Source: AGHT+IFK81k8uPi2VWArzTS61C9PYgxnGWb72u0mhGETeimKHXhztYOcDgcxHxuBa50U7zhpnWBzHQ==
X-Received: by 2002:a5d:4a90:0:b0:34a:ce2:e2c9 with SMTP id
 o16-20020a5d4a90000000b0034a0ce2e2c9mr6171329wrq.3.1713790920385; 
 Mon, 22 Apr 2024 06:02:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:9f43:3ca4:162c:d540?
 ([2a01:e0a:999:a3a0:9f43:3ca4:162c:d540])
 by smtp.gmail.com with ESMTPSA id
 w14-20020adfee4e000000b00343d6c7240fsm11925679wro.35.2024.04.22.06.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 06:01:59 -0700 (PDT)
Message-ID: <bdc875c7-4581-4608-a76d-3e3469a8bc9a@rivosinc.com>
Date: Mon, 22 Apr 2024 15:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] target/riscv: change RISCV_EXCP_SEMIHOST
 exception number
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Ved Shanbhogue
 <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
References: <20240418133916.1442471-1-cleger@rivosinc.com>
 <20240418133916.1442471-2-cleger@rivosinc.com>
 <CAKmqyKOcYwAgEnV-gyUYu19dLCKx94-rMoaE5m-8FB0fq7AL+g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAKmqyKOcYwAgEnV-gyUYu19dLCKx94-rMoaE5m-8FB0fq7AL+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=cleger@rivosinc.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



On 22/04/2024 05:25, Alistair Francis wrote:
> On Thu, Apr 18, 2024 at 11:40 PM Clément Léger <cleger@rivosinc.com> wrote:
>>
>> The double trap specification defines the double trap exception number
>> to be 16 which is actually used by the internal semihosting one. Change
>> it to some other value.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Hi Alistair,

Ved actually told me that even 17 is reserved so I'll move the semihost
one to 63, which is in a range designated for custom use.

Regards,

Clément

> 
> Alistair
> 
>> ---
>>  target/riscv/cpu_bits.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>> index fc2068ee4d..9ade72ff31 100644
>> --- a/target/riscv/cpu_bits.h
>> +++ b/target/riscv/cpu_bits.h
>> @@ -670,7 +670,7 @@ typedef enum RISCVException {
>>      RISCV_EXCP_INST_PAGE_FAULT = 0xc, /* since: priv-1.10.0 */
>>      RISCV_EXCP_LOAD_PAGE_FAULT = 0xd, /* since: priv-1.10.0 */
>>      RISCV_EXCP_STORE_PAGE_FAULT = 0xf, /* since: priv-1.10.0 */
>> -    RISCV_EXCP_SEMIHOST = 0x10,
>> +    RISCV_EXCP_SEMIHOST = 0x11,
>>      RISCV_EXCP_INST_GUEST_PAGE_FAULT = 0x14,
>>      RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT = 0x15,
>>      RISCV_EXCP_VIRT_INSTRUCTION_FAULT = 0x16,
>> --
>> 2.43.0
>>
>>

