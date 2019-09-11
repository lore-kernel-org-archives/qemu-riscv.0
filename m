Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8BAI-00021G-6t
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 18:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41068)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i8BAF-00020N-Ht
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 18:32:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i8BAE-00063O-7K
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 18:32:39 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:41998)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i8BAE-00063D-2O
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 18:32:38 -0400
Received: by mail-qt1-x842.google.com with SMTP id c17so8000163qtv.9
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 15:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sivu36cH7Xseu597XdT8OApYiI7Cp7qF6DgK2C8aQSU=;
 b=bHwFAtTr2IFBVwFr3aN0llMblxTOM88hJgkpKh2FjwyjYa+6iGp79uL/tFeRDRX8XT
 YmoBORDoGqSSMoQc2eEt+uxyIme0E9PsE4clGvUgDy5l99rcLfyUFL5R7Qa1YT6Svi6+
 iMv0qPJHQUY+GegDsWIBD8IBhzCf17i2/HeCC4WIMvq29yNl7ht03OEM3nojAWwcy2kZ
 84PDV7LICb0FqmudbTKyazWodXBoCTb/hKK6bCBJWMihQFjWJM9fT7UtSrwI95gUrRY8
 SieJfHp8xgXvBDPTQH5u9SXgXJBzEBXTGo0szSjOo7N05YqngRwF4qkPjVerzDURdWbZ
 yenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sivu36cH7Xseu597XdT8OApYiI7Cp7qF6DgK2C8aQSU=;
 b=iULlSU/uJDrE0gHMOLYlzSAM7iaaK02iMXwfRDfWElKZNZcT6wMdrRHH7SYzVYzwBF
 Wd4linxOmZJiMB0E+JLBKNMufKfz5uyZapnbp8k7vbBioLuV/QHkBQaNng97GZI1rYSe
 iDTxiWHVBfZl2gfY5P2SSEEgSuiJ/e6gaZPbINJX5+kDJhPhzl+f9iQpsfVNQoTSevJB
 UWVkNEqrt4qUbUYoNFmK2pbx8ytuoIwsLySJYxOCgToyTtrcJz411VY89HbvuMrPLaXk
 8vppalJXBwDvLhbxXGZ6T/GHqm8xYMae0Jzfe1eV0Gnl7osDgDAx5OzwD9aAg5nhHj1U
 eP6A==
X-Gm-Message-State: APjAAAVnHmWxjJ79wRONn4idpnjAgmDsos5Rqz4GJElqz7uno9g94yQ7
 +HZOhOAH/F1ISiOa5gSdy6U+Lw==
X-Google-Smtp-Source: APXvYqx3rZ9Tc2eBC1xZTZqQ1tRZZ5+9k94jnnuKfO9maawFvg+AOjh1wHNXCvRKontL5EUdfG4jzw==
X-Received: by 2002:ac8:67ce:: with SMTP id r14mr39065685qtp.338.1568241156985; 
 Wed, 11 Sep 2019 15:32:36 -0700 (PDT)
Received: from [172.20.5.51] ([67.69.50.154])
 by smtp.gmail.com with ESMTPSA id h29sm14019397qtb.46.2019.09.11.15.32.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 15:32:36 -0700 (PDT)
To: liuzhiwei <zhiwei_liu@c-sky.com>, Alistair.Francis@wdc.com,
 palmer@sifive.com, sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 riku.voipio@iki.fi, laurent@vivier.eu, wenmeng_zhang@c-sky.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-2-git-send-email-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2a802977-2f73-1857-1fe3-c9571ed1b34f@linaro.org>
Date: Wed, 11 Sep 2019 18:32:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568183141-67641-2-git-send-email-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 01/17] RISC-V: add vfp
 field in CPURISCVState
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
X-List-Received-Date: Wed, 11 Sep 2019 22:32:40 -0000

On 9/11/19 2:25 AM, liuzhiwei wrote:
>      uint64_t fpr[32]; /* assume both F and D extensions */
> +
> +    /* vector coprocessor state.  */
> +    struct {
> +        union VECTOR {
> +            float64  f64[VUNIT(64)];
> +            float32  f32[VUNIT(32)];
> +            float16  f16[VUNIT(16)];
> +            uint64_t u64[VUNIT(64)];
> +            int64_t  s64[VUNIT(64)];
> +            uint32_t u32[VUNIT(32)];
> +            int32_t  s32[VUNIT(32)];
> +            uint16_t u16[VUNIT(16)];
> +            int16_t  s16[VUNIT(16)];
> +            uint8_t  u8[VUNIT(8)];
> +            int8_t   s8[VUNIT(8)];
> +        } vreg[32];
> +        target_ulong vxrm;
> +        target_ulong vxsat;
> +        target_ulong vl;
> +        target_ulong vstart;
> +        target_ulong vtype;
> +        float_status fp_status;
> +    } vfp;

Is there a good reason why you're putting all of these into a sub-structure?
And more, a sub-structure whose name, vfp, looks like it is copied from ARM?

Why are the vxrm, vxsat, vl, vstart, vtype fields sized target_ulong?  I would
think that most could be uint32_t.  Although I suppose frm is also target_ulong
and need not be...

Why are you adding a new fp_status field?  The new vector floating point
instructions set the exact same fflags exception bits as normal fp instructions.


r~

