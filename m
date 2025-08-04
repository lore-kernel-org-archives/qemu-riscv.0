Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1374C87FCB
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 22:44:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uj3uq-0002CB-1e; Mon, 04 Aug 2025 18:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj3uG-000221-DC
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 18:43:49 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj3uD-0003qn-F5
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 18:43:48 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-24049d16515so29699265ad.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 15:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754347424; x=1754952224; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8sn06oDs9DeCnEOpA36nFRdaDNe3BvouVSVNqYHrrMc=;
 b=y3/0mMXOT6Fu302e54tv0bi2loabko3KBOD1+Qg+x6EBYPnTRLjWKPkWSzMyzpWGEQ
 vDbXdEOW7Czxk9TgbdlvjAYOtf3YFxuLJGFWSxuSOAmSnA0Ol4gtNkumvj2Oe2Lz7Knt
 g6DVUbkipcsXQxBC/HTXApqnC83vF+3AxfpGPkxbXgvJ+XDUzY0+Q9dWHjjOz3t0ahum
 elr4PdSHGp/Yn4u8XyxHY4HlBZiLoXuaOUm5RoLJaXhxRMfgR55J+7Al0Dx2Xxsw6qNl
 gkfe38nOTKLI3sRmrFDHTTVufRNT8rEUA3YmZ3/JrTcGRZnrPxF/4nzUlggigl5eHrL9
 6h0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754347424; x=1754952224;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8sn06oDs9DeCnEOpA36nFRdaDNe3BvouVSVNqYHrrMc=;
 b=lKsXBART31WFjk9tJJA0EDhZJ00i/46oMbSshRLnWc1vzjPtX4XpR+LbANTWvB9x6r
 qLODFoJ04H4AEVPiR2vO7+IZvcAjAwtBFTscuL08qUE7sRW870u7CUyUqYZzyi3K4KWf
 aXlnJzkoM5nWYL0GfMaHSfTdrpxsVFOOG8MdZoXEjF+lbzrNhy2cfzebGxZn0gouWtVV
 VUaLQFVJ3bTKilTK4zd+hcA7gT9/dx0M6Wc/GVGNPWELH1cwBMVr3jdp7LGPFi+6xHkz
 9LeQEEhqs7W4lls3qXJdPmHyx6r6v0D3EUhTTazwItLYogmIaebKY+mZRRM63a0J3Nig
 be6w==
X-Gm-Message-State: AOJu0Yz7mA0y4uBunHBLlzBioNJUpAU/RfhcaQpRazhh8tZzHgkFFm6H
 6x+hQPymEJhrxLyNS3KJmkpPueFy6Y0MGVaZyvVRGOSYvw2X3i3B2NeFDC4VlJbJ7OA=
X-Gm-Gg: ASbGncsvp2jv5cSZgs+o/pd6FgmkGcjjs87SQ+dPV1dPW/s1veYG991ku8sL3Zn3zWm
 /OQYWsNiPj83JCvWjC+zZOx9EfqPchh/9VdOBFtUrcV7R0R7N0satIr4mj+sETleNgSNGzy0nHs
 82CCmPBmJrI1/YRsMZcc0LwiR2w5WO6ntQD+rmoZKRf8dICRNzrORC5+s/a2SaNDiJ/5apwOqIT
 qq0mnbfU9fJVfPNzlvbtnxITD7Uli7f5cajqZ/eMdevOBI1ctHfuYc8o8vn8FNLMlDbzDUhJkb+
 AVq/teUuzOwRIdlq1bMtla6YnQrLjIrgRSaz3LTam97ihEahxcG2ZAGSRshgCkKKp9upVk7FBFw
 tT/mPaqX4WcADhkGE48eLNoIIA0I24Lj7drs=
X-Google-Smtp-Source: AGHT+IHqBOGU26KiM30/Bpq7wP8OjuWKTMYsYwbRWPyO8L1h/C1CDXl6pjHCma2VWvOP7FTxpfEg4w==
X-Received: by 2002:a17:902:f54f:b0:23f:df56:c74c with SMTP id
 d9443c01a7336-24246f5e4abmr149500795ad.14.1754347423943; 
 Mon, 04 Aug 2025 15:43:43 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f22788sm119253965ad.74.2025.08.04.15.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 15:43:43 -0700 (PDT)
Message-ID: <a0d42e44-428a-4ad1-a027-81585819c260@linaro.org>
Date: Mon, 4 Aug 2025 15:43:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] semihosting/arm-compat-semi: replace
 target_ulong with uint64_t
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
 <20250804183950.3147154-10-pierrick.bouvier@linaro.org>
 <ca38be54-ec29-4fcd-be02-0aa526258920@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <ca38be54-ec29-4fcd-be02-0aa526258920@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
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

On 8/4/25 3:42 PM, Philippe Mathieu-Daudé wrote:
> Hi Pierrick,
> 
> On 4/8/25 20:39, Pierrick Bouvier wrote:
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    semihosting/arm-compat-semi.c | 24 ++++++++++++------------
>>    1 file changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
>> index c03096b253d..f593239cc9a 100644
>> --- a/semihosting/arm-compat-semi.c
>> +++ b/semihosting/arm-compat-semi.c
>> @@ -123,7 +123,7 @@ static GuestFD console_out_gf;
>>     */
>>    
>>    typedef struct LayoutInfo {
>> -    target_ulong rambase;
>> +    vaddr rambase;
> 
> Subject says uint64_t but code use vaddr, is that expected?
>

I didn't update description since last version, indeed, should be vaddr.

>>        size_t ramsize;
>>        hwaddr heapbase;
>>        hwaddr heaplimit;
> 
> 
>> @@ -300,9 +300,9 @@ static void common_semi_seek_cb(CPUState *cs, uint64_t ret, int err)
>>     * is defined by GDB's remote protocol and is not target-specific.)
>>     * We put this on the guest's stack just below SP.
>>     */
>> -static target_ulong common_semi_flen_buf(CPUState *cs)
>> +static uint64_t common_semi_flen_buf(CPUState *cs)
>>    {
>> -    target_ulong sp = common_semi_stack_bottom(cs);
>> +    vaddr sp = common_semi_stack_bottom(cs);
> 
> Ditto.
> 
>>        return sp - 64;
>>    }
> 


