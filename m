Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCAjw-0007VD-Gf
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 19:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCAju-0007T8-M6
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 19:58:30 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:33607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCAjs-0004cA-Ff
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 19:58:30 -0400
Received: by mail-pj1-x1032.google.com with SMTP id np15so40733pjb.0
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 16:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gIrjLz/WZNqiwA0pGwBTIya9EXCQAeOV4Ox98+rP3z4=;
 b=oQaDF9tTUUGRloKnU/xlFghJ+SIjcsqXmGnzxuMxJVDEGNEy6UTGkXigifSlWlJawr
 eCGWja4B/bdHTsMIh+7gZSx/BemNlsVZlqdmRYxo2i2a77kITlIardO/J8FP4xFyiEov
 uzsJo2/dh4HuP9oM/sbxLUl3Mryn98QTpD1F7y1r0ZcCzOYVc7m7q1EyG+BV9r6RVB5l
 Vg3FbUqHLSgx4oGBbNBGPH2XBBG9aiwmrpiMb6UBIO4G5znma6PGGylFlHjJINKVFBkn
 rK47OHtYjg0nCi9PJ/CvIlukk6QNjxIYSLiwgypptmJ/s/OAYrliVn3C27lhll24weHC
 cfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gIrjLz/WZNqiwA0pGwBTIya9EXCQAeOV4Ox98+rP3z4=;
 b=XdVo2xNf1BpyUr5RYJpwV4DqD9wWVHZYRZDxecVA0kCGgdNVx/QA1eMbtfjJUfiuQi
 xDXXFNlDyRc31tdWzJ07ueuoNsvg6tVavnmpcRJ24dhAf394cQ+ddUrZ90k12W9p0Rcu
 hPCp/4oq0pqMYHsE4wtMUjf7X6MQpCvZrCmHHYOGINmkFHTTUDYIZR3TNlznWbXtAklW
 b9BBDdGs6kG2TeLOOecCK6mAcBIoqp4VunFuz/1OSppEOuQlvRP/PHy68QBmW/e0yImf
 FhpvKq8mSvJgWbxc8TWbFyZuzyrOH8uFKyo/MgnsdQSknil2Fs7kpdMTeUT+fAeKzkUP
 bKqQ==
X-Gm-Message-State: AOAM530IxM6SyMR+Nv24QegYnXNgPBdI5Hy912YiisssJquAeC+O57A1
 1aTQ1eNSGfCWglgZD64qMNxDIA==
X-Google-Smtp-Source: ABdhPJwgqAgfEQDUp0OtOcFIehrPMTM54LDlrAXvRsKmXTjELXoFfBJJDn5u/dHkVUlb9yIl/+eNKw==
X-Received: by 2002:a17:90a:a50d:: with SMTP id
 a13mr4597363pjq.180.1598745507088; 
 Sat, 29 Aug 2020 16:58:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t19sm3853868pfq.179.2020.08.29.16.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 16:58:26 -0700 (PDT)
Subject: Re: [RFC v4 55/70] target/riscv: rvv-1.0: single-width floating-point
 reduction
From: Richard Henderson <richard.henderson@linaro.org>
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-56-frank.chang@sifive.com>
 <d94182cc-8846-9eb6-6a93-87968d0d32c1@linaro.org>
Message-ID: <2cbf253f-8fe1-d840-50f1-582767bf600c@linaro.org>
Date: Sat, 29 Aug 2020 16:58:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d94182cc-8846-9eb6-6a93-87968d0d32c1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 23:58:30 -0000

On 8/29/20 4:50 PM, Richard Henderson wrote:
> It doesn't actually say anything about the way in which we've implemented the
> *_noprop functions.

Ho hum.  It seems v2.2 has changed fmin/fmax for the fpu as well.

We really should fix that too...


r~

