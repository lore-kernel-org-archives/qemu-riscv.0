Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D44EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 11:58:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEqI6-0000D8-Fu; Thu, 29 Jun 2023 07:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qEqI6-0000Ca-0R
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 07:58:26 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qEqI3-0003Zq-Jd
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 07:58:25 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3141316b253so600675f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 04:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688039902; x=1690631902;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ruZ6QsU0PKPCMMGaM6GX634go4cak7oYBC7Hnk4aLAY=;
 b=G6IAF4rUw/+11/EOyiEj9hkEQEl8yaLw0BidyLzdVVi3AWoWNq0SOGsoHp3xr7YIrx
 tR6NnmbSyZuxKIxxxAau6CO26/G13BiAE/dk0qJd7tOHDXfODVEO+JSk5GE0pt6nG2A5
 RfGMQwbiEoAAfeiSlkw5BO0K8MYBpY0xdPxp0gENCa0PqFJHJv/6xjAfw2Dnm876YNqF
 xSn0wbpnkLviuk8uEyF5tKMU8Zf6GNCbtbG/9foYjioA2+/zho7OxVr7hlLCbzXk0BBw
 aPiA9I9yvqxeCyJpCX5ZKkHs66+hxstHsI7R07jqHcUdWbblawVLEkOnEbkx+SNzlax6
 3Tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688039902; x=1690631902;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ruZ6QsU0PKPCMMGaM6GX634go4cak7oYBC7Hnk4aLAY=;
 b=Pq0WmI6pVSeTqbkIVaDH9hJRXKTKUGEhXMrdswvT8Sv3ZeqMvK+jBi2/e+S6A4hiBb
 uC3HqZE938i3A//mhrY751vgvPebrlSd1HjJEVMaZLJOL13ROaDrfIZX6XbmSYXZsYiT
 mS6LjY6iNv9SLh5xkadmA9bBr6qSiSmJXd6TxU2Lzh69IAQn0nlwMavRizrABkHFx8LO
 SqpnJtntiXBm4shuV3wWlbpZzOjvdnyNhnsXqRIWVxdNmWP9nkRWl1f5UUdzbjdbcA/S
 zP/dMAt9ATVh6bBZ7X+Q1N3N9MC0ZiQ5fKjQ9PmHe5vclc7f7dwkCko5+cgM+BN2IDi6
 06FA==
X-Gm-Message-State: AC+VfDwspVjxu8FqbhhB1Jza8EEGF6UyhrRpK2JAWyUYOeRStNvIYLmd
 T2hHHXTw7solmNa18H+r5qq5MQ==
X-Google-Smtp-Source: ACHHUZ6dpyj+F3W9/wXaotv0BgNahbTEQevINC8UXfoqpj8ko+xg5slSCl1VtRaeR1RGrKI6q+NZxQ==
X-Received: by 2002:a5d:4b06:0:b0:313:f8de:1ff6 with SMTP id
 v6-20020a5d4b06000000b00313f8de1ff6mr7389313wrq.51.1688039901700; 
 Thu, 29 Jun 2023 04:58:21 -0700 (PDT)
Received: from [192.168.1.208] ([139.47.41.96])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a0560001a4f00b00313f676832bsm9483891wry.93.2023.06.29.04.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 04:58:21 -0700 (PDT)
Message-ID: <7becd84c-0e13-4fad-ecc2-77b44fe79979@linaro.org>
Date: Thu, 29 Jun 2023 13:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 05/38] crypto/aes: Add constants for ShiftRows,
 InvShiftRows
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-6-richard.henderson@linaro.org>
 <CAMj1kXFWDMijy6eTCBwCbygJHyBpS6PqaU=1d5OeE6h_v4=-zg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAMj1kXFWDMijy6eTCBwCbygJHyBpS6PqaU=1d5OeE6h_v4=-zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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

On 6/29/23 12:21, Ard Biesheuvel wrote:
>> +/* AES ShiftRows, for complete unrolling. */
>> +enum {
>> +    AES_SH_0 = 0x0,
>> +    AES_SH_1 = 0x5,
>> +    AES_SH_2 = 0xa,
>> +    AES_SH_3 = 0xf,
>> +    AES_SH_4 = 0x4,
>> +    AES_SH_5 = 0x9,
>> +    AES_SH_6 = 0xe,
>> +    AES_SH_7 = 0x3,
>> +    AES_SH_8 = 0x8,
>> +    AES_SH_9 = 0xd,
>> +    AES_SH_A = 0x2,
>> +    AES_SH_B = 0x7,
>> +    AES_SH_C = 0xc,
>> +    AES_SH_D = 0x1,
>> +    AES_SH_E = 0x6,
>> +    AES_SH_F = 0xb,
>> +};
>> +
> 
> We might simplify this further by doing
> 
> #define AES_SH(n)  (((n) * 5) % 16)
> #define AES_ISH(n)  (((n) * 13) % 16)

Thanks.  I should have noticed, but

   s'_{r,c} = s_{r,(c+r)%4}

didn't make an impression and I assumed the table was non-regular.


r~

