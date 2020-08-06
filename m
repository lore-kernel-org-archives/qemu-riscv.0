Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3kGG-0001Eg-LY
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 14:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3kGF-0001Cm-1R
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 14:05:03 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3kGC-0006SM-Nu
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 14:05:02 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ep8so7091016pjb.3
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 11:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+oJonRURUKUDUwdxnAqYI1jrChZDjkViIux/TCKIeQk=;
 b=EqTYvkSuthyKtToL+4o+EbxJmlT4GswtfbgX26/SnO5n2dtCLMT3jDUckc+oj8apNR
 SkzVI1SFMCePBFxrFYVhtKUrDWxLhTU1f3R+oHnVjfmyyU2av84XttGdmP0OnWEpBiFZ
 k6wFwa9lV/p7kzA2wcBJadgzWVBBx/uRy80tcLbe23Vl5f9j7ISqZlSpOVIzS4E14mMI
 x9sX5bA954GJHublLAQAgtdTPMZFWLC3R8iOyJGOYomOcfyq+9DrGbnfqlan3JHOBjkr
 LSe+U0sNdvhD+iF+SVk3/KJyHJSr6TzHDAOgJkmIvRGhrPkJsBA9WYlacoGXnCd0+Jz6
 xXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+oJonRURUKUDUwdxnAqYI1jrChZDjkViIux/TCKIeQk=;
 b=hs4T1nu9B3zTSfqLhwS7/pWPAryq1uMSBRASHG8pvUDjyfN8q7xTWSf/mXbTgndq6s
 hbOqy8QZRrakXCUO2TE5AvslITGcf3/pjvf9VhrH6NYS8c+idsnyM9QrG8PzNEyyQcn6
 YlGf1SkrII96sheeRih1r6N8UIDdhwEja8wMsK7WAp7MhljHYmgX09XOU7LHJ5cmph5Z
 pX7V/BhRAn4w+SI+t5o08go07E7+TYEyivtSRFBLVaf5xqsuG3T0lcDsAbOWeQYpZZEW
 AN0Cx2yN52V9P/YBUc8vuQA2McqR2zpTQsesCx2NZlii4RVgVrzDONKoYgeWr8x65/qC
 K4+g==
X-Gm-Message-State: AOAM5324FETdbsWHhAcHexJSYQzHjqggpIq0Ekzx6RI5vFpSmxBQqSH1
 F8MvZpsAjKX/OZ/byyYo6rvd7Q==
X-Google-Smtp-Source: ABdhPJwkEHbfJBARNqiDUn7vbLXfLsvlJqUfalUXoPOvqV8kQ/s399RvEdxH7yAI+bIdZxn2Zp8Sfw==
X-Received: by 2002:a17:902:b902:: with SMTP id
 bf2mr9193809plb.100.1596737099007; 
 Thu, 06 Aug 2020 11:04:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g9sm8951508pfr.172.2020.08.06.11.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 11:04:58 -0700 (PDT)
Subject: Re: [RFC v3 05/71] target/riscv: rvv-1.0: introduce writable misa.v
 field
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200806104709.13235-1-frank.chang@sifive.com>
 <20200806104709.13235-6-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <88180ccf-6a24-56e4-0be4-3a27ea452a21@linaro.org>
Date: Thu, 6 Aug 2020 11:04:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806104709.13235-6-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 06 Aug 2020 18:05:03 -0000

On 8/6/20 3:46 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Implementations may have a writable misa.v field. Analogous to the way
> in which the floating-point unit is handled, the mstatus.vs field may
> exist even if misa.v is clear.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

