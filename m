Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdJIh-0005Jc-5L
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 17:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdJIf-0005JK-EE
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 17:39:05 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:34778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdJIc-0004nr-SL
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 17:39:04 -0400
Received: by mail-pl1-x631.google.com with SMTP id g5so17082113plg.1
 for <qemu-riscv@nongnu.org>; Wed, 20 Oct 2021 14:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FKRax0ivor2c0zWVzZ2tOdN49LbJnIo3ensOS5Z0PqY=;
 b=XTnHfzUv+4HgpVnZxOMFEkdbN2Z7lARXI+PJ9yUXof0t0ckWic4tY1iMWt1rrSlhS1
 Pas6lG7YVwg0drrzBaAXYRDfHEUgpDTOVvY+pA1bwbyI6CfxG+RgQs5R4nP0l86D+gkL
 Ia4UxviR6yyk3x96jppvQviHY9bvQ2FGrjAFjFHnRN3W4V4acFbhkeJwrPMmEC/ndDsz
 W/gal2i1dWVskg62l/tJYIAI/KzMu3cV3zjaCKWZzMcTwdWubhEskfMqx+hWwbu8cCct
 +R/mUnpYXFVMYhmdjnkS1trKt5ocb/bbkNm5OtT+3Ly1PnT9PKSz6cCbEHNFknTmvBJ3
 9jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FKRax0ivor2c0zWVzZ2tOdN49LbJnIo3ensOS5Z0PqY=;
 b=EmJEs68EClKQ1tXhbmOk7VI17IotHlNsilwMhBtmt6EEfs1NeKskdIGXjFxXfsyW4T
 29pnk8XQYHbQO6F5ii9Cgd0rhvV2T0FSwL6gO9swm/fZO/gc+qU3sOQUERkP+VU5PX6b
 BqoSJ1/9AWgF6bKz+WeFtlfcl0dFpH+Zept4aj7MUtmDIayyrG6B9ZI/QkElZJEgg64T
 5ZVWXa/Cgj3VOErxuRHi8q1AYfXDKvpEuhXilMupKY/cZ2pDoOnItU2giN4xW3zLnCAL
 bKC2OMmKxUBlDzjeV9XCXOmuWP9PJvvcWnp6u5QB05/VCqqj4kSzo0OnTlff8pzoh4N/
 TshA==
X-Gm-Message-State: AOAM53156fS7jMK9ugXJiQLYoEIm7ZwG+h4Jgc/y9C4V6vuU4jDLOxde
 LtF1+gnAsZrRQb4tPq6/dikm0A==
X-Google-Smtp-Source: ABdhPJxy9aBNwi6B6bG2mBy9gStql8PGnXUjl4bZDfbCptuvrkRjlqv1O1mfvpLRKT39mpJgSbrFsA==
X-Received: by 2002:a17:90b:3cc:: with SMTP id
 go12mr1702206pjb.127.1634765941003; 
 Wed, 20 Oct 2021 14:39:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y17sm3701495pfi.206.2021.10.20.14.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 14:38:59 -0700 (PDT)
Subject: Re: [PATCH v3 16/21] target/riscv: adding high part of some csrs
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-17-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8feb78f9-d9a9-0434-a987-cca07162a994@linaro.org>
Date: Wed, 20 Oct 2021 14:38:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-17-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 20 Oct 2021 21:39:05 -0000

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> +    /* Upper 64-bits of 128-bit CSRs */
> +    uint64_t mtvech;
> +    uint64_t mscratchh;
> +    uint64_t mepch;
> +    uint64_t satph;
> +    uint64_t mstatush;

Needs adding to the same machine.c subsection as the gprs.
Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

