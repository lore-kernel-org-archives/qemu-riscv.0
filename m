Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbA24-0003EG-T5
	for mharc-qemu-riscv@gnu.org; Tue, 19 May 2020 17:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jbA23-0003B4-8T
 for qemu-riscv@nongnu.org; Tue, 19 May 2020 17:44:15 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:32999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jbA22-0000qX-EW
 for qemu-riscv@nongnu.org; Tue, 19 May 2020 17:44:14 -0400
Received: by mail-pg1-x542.google.com with SMTP id s10so445491pgm.0
 for <qemu-riscv@nongnu.org>; Tue, 19 May 2020 14:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9QcMFgsFvzqpgsVcZKpwWLbbm/tGcQLwiZS5izOUzYE=;
 b=vd9MBlZtV+8wTXdpyza/bAuEjRjZYzHCAB8h81RBR/znISaOjbHq4Bh7dQBkBcl8H8
 LtWYqnj3+U2OBkvWxECfrIzcpergK7GFxDlqNDRghvJesCwi/Jl3Ji8CP7VgYvuQaeyY
 AaKbkCGSQRbjktlZU/KExpExN4J3wrBZIBZ68WhhJ+oZHiNomMmjewRZPDSjZJJO+kCH
 zmFaDwyb4yn3ZYGQMit8nC/pO2ncvP97ZtGFdNoof8p5jrmKyGmBVtGHZVYqF3ekm9EJ
 Youi9H6HnO5RK9icMjuXJ8pQJTUkxNaBCYkJLphFSEKHc4P7XNPrZHtDGwvMth5gUKvT
 UKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9QcMFgsFvzqpgsVcZKpwWLbbm/tGcQLwiZS5izOUzYE=;
 b=ssTr9qOp7i218MH3mvLR2+JhHU4d9H6/RbiSA1J8sMk1OLP/pLm2qZUEuINiewXMJh
 smsJiSG7j2aD6veb04KlCZPBfm2hFaX3McWDRs5XXgfssu8Yn6Mn+bsNSStoiHrYmoet
 q/bjL2XSc0iyBQJL/h9szsevql4RNINgKpuRjNNKhaz1wCQbPytlmgE6o4E0j/E1JJGD
 VoikPN3kNkM+tgKM2Je/6s4tUXzBPnBY+p/FCjdpWyBrEo+otclWlZx6c8cvEKgPoQiW
 XBYJJj6kcchU8r/YuonWqNlLMbD7CFQNsh6XlwrJnBmNogsdTZzwL+iC7sCCXe7UaILx
 mr1w==
X-Gm-Message-State: AOAM5314PezoCsJmcx5JXUd1MJfCGYkmZhdQ7bGdprTZfTLmLEFY2/o+
 H/jawr0uSY5KsYU/1+JyKVFtHA==
X-Google-Smtp-Source: ABdhPJxMz3+ZBlNd7xQLhdXPca2Mk3IOo3Ssmjn+oEFlna4w+C+N6H/Qi078VtaJAl/Mn2IE8U9k2w==
X-Received: by 2002:a63:e14d:: with SMTP id h13mr1080448pgk.321.1589924652927; 
 Tue, 19 May 2020 14:44:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id l192sm355847pfd.169.2020.05.19.14.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2020 14:44:12 -0700 (PDT)
Subject: Re: [PATCH v2 10/10] hw/semihosting: Make the feature depend of TCG, 
 and allow to disable it
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Walle <michael@walle.cc>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
References: <20200515170804.5707-1-philmd@redhat.com>
 <20200515170804.5707-11-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a67da86e-8486-9fea-ae1c-db65bf5c4acc@linaro.org>
Date: Tue, 19 May 2020 14:44:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515170804.5707-11-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 19 May 2020 21:44:15 -0000

On 5/15/20 10:08 AM, Philippe Mathieu-Daudé wrote:
> +++ b/hw/semihosting/Kconfig
> @@ -1,3 +1,5 @@
>  
> +# default is 'n'
>  config SEMIHOSTING
> -       bool
> +    bool
> +    depends on TCG
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> new file mode 100644
> index 0000000000..3224cac4ad
> --- /dev/null
> +++ b/target/arm/Kconfig
> @@ -0,0 +1,2 @@
> +config SEMIHOSTING
> +    default y if TCG

Do you really have to duplicate the TCG condition?


r~

