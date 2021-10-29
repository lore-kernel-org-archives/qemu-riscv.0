Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgXdK-0004WM-B9
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 15:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXdD-0004U5-2h
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 15:33:39 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:45684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXdB-0001QH-BM
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 15:33:38 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so8034012pjb.4
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 12:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=+s/IRz5EWWlmxcuxXMOW7Rd5KX2kProwuaZ+5xjF3yE=;
 b=CMYydc7IytB0fH9NcPOxE3PdEdiWgPFYj+AcdMhXM1auwkYkW9zKm4w4Xxf0cCd5Nm
 2prjZlf1hRrEAIKhpzFA0M4pcmYzmNaKsAHnTUdzOfln8w6dr0gMDOUFfxSzN0ZUMdW2
 imO4EamvcHSOPIKth3d8/0AKHkNJQuF2fNLCprD3yJH9clQ8P4vBCH1WRYQUn/EXs8eN
 STc+DEdtx/tSQgy0jbk2XQlUTlGFQOZZtnm59Wkm4SDF0k0xTsAWfj2Mm9oECqtxbah/
 JKkE32leO9LZtzSQLvmi+ZrPOwkjf+YsZ7Z8BJSYLeFE7A69Mx0r7HpPq0tkk1e49cAj
 kdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+s/IRz5EWWlmxcuxXMOW7Rd5KX2kProwuaZ+5xjF3yE=;
 b=HGbkQGrFk4HuCfsDJuECRlosr3EBtJPEvAFftg6CrJ8M77z10QZb0wp6XaObBSSAIV
 WfsU0cA9I+Yp0YgziPUrTjDzYq8qhGwaKbrKEANCsvN+dGJ46b0T+8uQLUVxtXFUpuF9
 Y/+6dLUjykUkrTxy9SVOOSxUl38DTv5z262B0ft/IAMBOvdK7R/mmXSjsPSJEEJiTBh0
 7A+VwnmmfGud0JrzFGbj5kiNq90iO67z38zbMFSKxhN1lvvVJC9TniCumCnhJngArl/w
 vzoZ+pSqbpkw+/jsVBGpMFFnx+6/g7nl4AsH5Mu52LOmrxAZKBXpoSghip8Mqaq84WHT
 LOLA==
X-Gm-Message-State: AOAM531bUZ1EhPrvf8wolw0yx83a5S0z8FhJWg6zgOLIpmu/KTpxxdJS
 MDod1i+vwwAjmqoUhwC2bniVZ695EV0GOQ==
X-Google-Smtp-Source: ABdhPJzo7X5p+lsrkMvWqoA6jQ3Gz05/kuPwoHJG6VoawCjsPxx9DfZw1Af0uBC96h/1Wv4/osLD9g==
X-Received: by 2002:a17:90a:b288:: with SMTP id
 c8mr13394552pjr.67.1635536015876; 
 Fri, 29 Oct 2021 12:33:35 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id qe17sm7725892pjb.39.2021.10.29.12.33.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 12:33:35 -0700 (PDT)
Subject: Re: [PATCH 5/5] hw/core: tcg-cpu-ops.h: Update comments of
 debug_check_watchpoint()
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211029152535.2055096-1-bin.meng@windriver.com>
 <20211029152535.2055096-6-bin.meng@windriver.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1b3e2421-7ffc-f0bd-be53-2ca989e0ca0d@linaro.org>
Date: Fri, 29 Oct 2021 12:33:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029152535.2055096-6-bin.meng@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Oct 2021 19:33:41 -0000

On 10/29/21 8:25 AM, Bin Meng wrote:
> This is now used by RISC-V as well. Update the comments.
> 
> Signed-off-by: Bin Meng<bin.meng@windriver.com>
> 
> ---
> 
>   include/hw/core/tcg-cpu-ops.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

