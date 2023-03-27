Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgpih-0005Gi-5w
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 12:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgpie-0005Af-QA
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 12:29:16 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgpid-0005Qv-AZ
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 12:29:16 -0400
Received: by mail-pg1-x52c.google.com with SMTP id y19so5505412pgk.5
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 09:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679934553;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9GLdMU2g21swwchEMxf7dbC0F9bfgrKZoxTJS3Z10qg=;
 b=IXjItaeJ1CyO+2jkpAfqVzwBgpzmUWB46DXW2VHHWy4sAuMy4ynM5L8XHoWc8bcSFA
 X87+m6RUa3m+x+NRlWyJRTIO/vQSbQhKrKTaEn1jTn6M+nukHiA/sXMDbgpJgYayv0tr
 CGlgvvlY9vBTQvAvGRFQwRo6mUzHWWk8RFrJ23sKhW1ZuNwtoQe2UHcgTlHB+ZUmtWTG
 lDxCsxGNcsZLR32PRCkHcBiaIJ2GWc0fiQEIyIEryCQZjc9t+9qXmjh/UjEvBV2I9lz4
 wghyJYsJMr2lbxOo5kn2EV/ijJO4UGcwIIsbO4bCRcsKdmHS2/KTA2bcQg7P1DzRe44U
 Zcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679934553;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9GLdMU2g21swwchEMxf7dbC0F9bfgrKZoxTJS3Z10qg=;
 b=44KlH/YpC0h4ybH8M1n/yPg10/5hrRhLv3GmH2XKcrH0H/hNO/RhHghCtBoBsnphB7
 F9fKiFNK/UueQMpuROa9ZMpbqclKuTw96cKYrL7hssLOFUGb/cSZ3MrG6ou8DsfOz5ZH
 1Zeqfqpz/yEz++pO64jr8WbgtkA44nQVzI+uAqhechojV/8aiGjTjxRQVCQRblp5tx8A
 VxGAAsNNhIXjCQUs656G6HdfHK1Fp7L/MCsAtGjEhWP4IUNzVjrSlj71O8bx37Y2J6lr
 eZ3mOnd+udYUaZbsNno430UBV/CnFQSptDb/ogdsR78cc8zR/4cX6Nuj35ZP/hxnAx7O
 AG7w==
X-Gm-Message-State: AAQBX9ch+G4gCJYCPOsHkS8Dr8/x8ZJADAEqXxrJJlpecMCqRTd0P3tl
 UMNL3FJUnvqkPqzjxrcPnimMKw==
X-Google-Smtp-Source: AKy350a2+ZjQueokxqxAylGAjmOq5YDUYqfbmXoxF/qaUk5XBWh+LEqbBFEjVqUEpNSzd8uB95g6qw==
X-Received: by 2002:a62:1a49:0:b0:625:ffed:b3d1 with SMTP id
 a70-20020a621a49000000b00625ffedb3d1mr11218895pfa.7.1679934553463; 
 Mon, 27 Mar 2023 09:29:13 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:6705:aa17:3641:e634?
 ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 x16-20020aa784d0000000b006280676b8b4sm13962932pfn.220.2023.03.27.09.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 09:29:13 -0700 (PDT)
Message-ID: <6b21f385-96fd-78f4-bdba-ed552bf2464a@linaro.org>
Date: Mon, 27 Mar 2023 09:29:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 13/25] target/riscv: Introduce mmuidx_priv
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 fei2.wu@intel.com
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-14-richard.henderson@linaro.org>
 <a4e87eab-aace-a17b-fef5-5c5b1118a561@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <a4e87eab-aace-a17b-fef5-5c5b1118a561@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 27 Mar 2023 16:29:17 -0000

On 3/26/23 19:07, LIU Zhiwei wrote:
>> +static inline int mmuidx_priv(int mmu_idx)
>> +{
>> +    int ret = mmu_idx & 3;
>> +    if (ret == MMUIdx_S_SUM) {
>> +        ret = PRV_S;
>> +    }
>> +    return ret;
>> +}
>> +
> 
> Can we remove the PRIV from the tb flags after we have this function?

No, because this is the priv of the memory operation as modified by e.g. MPRV, not the 
true cpu priv.


r~

