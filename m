Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUeRM-0007Mc-7k
	for mharc-qemu-riscv@gnu.org; Mon, 19 Oct 2020 19:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUeR9-0007Km-Ge
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2020 19:19:33 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:40912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUeR5-0008UK-5M
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2020 19:19:30 -0400
Received: by mail-pj1-x1042.google.com with SMTP id j8so57217pjy.5
 for <qemu-riscv@nongnu.org>; Mon, 19 Oct 2020 16:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XZbyhQGZdaoUeQwkWb6o6aGxcF2rkEztvcTQoIWH4uE=;
 b=Nhvb3SffknGY7sijupVvF7owMWwThL0FL8GQfhjhOUAtHaITlG2YoGhgiIPjBxX5vG
 sL1/N1iP/Zc1fZZN7xKj3n/JrBb25vekzdTd0MjrnS8GUU6GCRQUxVnal6pkydhiE5jq
 kh0myQ/B1hI2NBo782A3OLTZ6bpQb/R3SnnvrJLsUEjUMOM4e6da9ZuTBjyECGM6JPIs
 KAxgEI7rbKoFVDRGv9/FO8XlOaaLM/UThSf13JDXO5XMKuozorR7RScmYY7xkTXHcRG7
 PT9N+Z92KisWdBWizuqeL7ys+yRg3Z56tdpupALEMdD/97BYuP1zvFjsZ3BkJmlh79RV
 V5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XZbyhQGZdaoUeQwkWb6o6aGxcF2rkEztvcTQoIWH4uE=;
 b=ro6FOWr7bCvaOUpGLVNDfoIrpF3raytKc0wz6NAP2iXnBDePMoU3BLhCLEET2QQPMW
 /1/pvaukQ+6uvulp/c5JUCJbvWC+TsaRu5hpEAZOdP8oZe133y4dli4jYXNsKIbYIX2/
 UF4SujdCC6DmG1F06OUjSNtvI9OihmTuACAYmBikKvppDbzHb19I8vESIJUblcaA3Ct4
 UsIcz4emmenFS+9WgGf9RLKkwsWqWV4o7ccFSgA0bmmPzNW9AKetMUb31tNohs4kl70s
 hKAHdoX2Qxx5QWTLxnXKVnqQgELe+Wb6MfdlIk3P0a3y06VJWi3tF6j9AsbatOEv6IWr
 1xAQ==
X-Gm-Message-State: AOAM530W7iuEOLzgjey45d+x3FBUtf86e/F8FoCdCVIW/c2Ih0YLv+W4
 UIadjLz0eWxh3UlGLatyNNXzHbiGDrtZOw==
X-Google-Smtp-Source: ABdhPJzzU1gKQmw/fXSYgHC4NRb1jMpaedfQKz+sLAzd3gkVl+hlPFrnn8K74COHkzJOlO3fcneTcw==
X-Received: by 2002:a17:90b:3649:: with SMTP id
 nh9mr109203pjb.123.1603149565605; 
 Mon, 19 Oct 2020 16:19:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g22sm52588pfh.147.2020.10.19.16.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 16:19:24 -0700 (PDT)
Subject: Re: [PATCH v2 5/9] tcg: add const hints for code pointers
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "open list:RISC-V TCG target" <qemu-riscv@nongnu.org>,
 Stefan Weil <sw@weilnetz.de>,
 "open list:S390 TCG target" <qemu-s390x@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 "open list:AArch64 TCG target" <qemu-arm@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhc@lemote.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
References: <20201019013928.72770-1-j@getutm.app>
 <20201019013928.72770-6-j@getutm.app>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30c59d7a-a11f-5d9b-4dcc-eb8cf120a4cb@linaro.org>
Date: Mon, 19 Oct 2020 16:19:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019013928.72770-6-j@getutm.app>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 19 Oct 2020 23:19:33 -0000

On 10/18/20 6:39 PM, Joelle van Dyne wrote:
> From: osy <osy86@users.noreply.github.com>
> 
> We will introduce mirror mapping for JIT segment with separate RX and RW
> access. Adding 'const' hints will make it easier to identify read-only
> accesses and allow us to easier catch bugs at compile time in the future.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>

Are you "osy"?  We do need S-o-b with real names from all contributors to the
patch.

The patch is bigger than I would like, but it all appears to be strongly
connected, and I don't see where it could be split.  I'm inclined to
cherry-pick this patch out now to avoid carrying it around.  So if I can either
fix the --author to you, or we can get a s-o-b from the author, I'll do that.


r~

