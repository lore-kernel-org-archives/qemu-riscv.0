Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbzEk-0007an-1G
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 00:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jbzEh-0007Xn-Sa
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 00:24:43 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:36517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jbzEg-0001Et-FD
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 00:24:43 -0400
Received: by mail-pg1-x543.google.com with SMTP id c75so4427715pga.3
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 21:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SLX5aUjyhwSpXMrIOBG3YzlEuSkp8wTIA0mN4lHrymk=;
 b=zgUeBjLpxbxJGnkrsCaI4+/stpGitER/GPo+Kjlu1iEHNh/Z8qgvC+Am2yqw734vKY
 yuU5foJk26eqD3l27KjYQhDBRHjhXfmA0FcqP9S6gqH206zIQLbsc9FqjQHTcJcKq+/T
 n0SEdv1uOFhN4Kj9UjHjD3E+C+6z/VIomN3JlTn0y5H0Q8lGnTnh0KCMWTukBHpQi4us
 JE/lPcGsze4bkBX67xCqQ1ZqjX724Jt1SFXVa2jhgRaNkE6yIYtJF4eGJiMIUhjy31Jj
 EtRvrqKvu+vcLd48aPQD9hPRYv/qtz0Bhez5juznQtiSwBfeiX8EUjdUc5j4WEdaSKwO
 2hjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SLX5aUjyhwSpXMrIOBG3YzlEuSkp8wTIA0mN4lHrymk=;
 b=g4jOnrSYku4aN5qDV5q0qE7SSguVPUEQ9DgNhysaeH8+1UmGkSkOj/k+Zl6djfeJPF
 WPs3qgjwonCMhbyolqY9vBhFvL/9l//WuI7hSK88VyTtwuiP19GIVsrvsF3tSX9EmzBr
 p9AkOieoO/o7eCW8Cg7LHLdX/TlwBrZn/7gMPKAXuhvcZs4om9cY4PPL3/2+gR4XRlB3
 vN0iyZA8quMz3AUB9j26GAyiSDXi//q9hc/tMcnZbWtdYOWJTxXR+dQBKY95GCu4L/+g
 pAp8EhMDOKIpBiwtq3zJqO+haAdVDpys4n+k3LESloM5XH9n1qby1P0zBWTJnpwMVBqP
 gA7A==
X-Gm-Message-State: AOAM533w1GTAcpN2X6e9OqWPLloulYpIMK1DaZPyKPFyDakerK3yMpJG
 8KnQxdzwSAwAATISVBUQ0yXMKA==
X-Google-Smtp-Source: ABdhPJxUDUK2nvpu7o+yHeDH397TSEOPvLdpguUeDy4kCHqYgi8xtmKnbcaZg9vNENzs8OYuu74F7Q==
X-Received: by 2002:a62:c9:: with SMTP id 192mr701238pfa.43.1590121480915;
 Thu, 21 May 2020 21:24:40 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id j21sm3845954pfn.202.2020.05.21.21.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 21:24:40 -0700 (PDT)
Subject: Re: [PATCH v3 09/11] rules.mak: Add base-arch() rule
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
References: <20200521195911.19685-1-philmd@redhat.com>
 <20200521195911.19685-10-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ccd78343-795e-8874-e4f3-bb6861ea64f0@linaro.org>
Date: Thu, 21 May 2020 21:24:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200521195911.19685-10-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
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
X-List-Received-Date: Fri, 22 May 2020 04:24:44 -0000

On 5/21/20 12:59 PM, Philippe Mathieu-Daudé wrote:
> +		$(if $(findstring risc,$1),risc,\

Eh?  riscv{32,64} vs openrisc.

> +		$(if $(findstring x86,$1),i386,\

Do we really not need an exact match for x86_64?

> +		$(if $(findstring aarch64,$1),arm,$1)))))))

Exact match?


r~

