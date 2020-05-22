Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbzGv-0002ik-Ja
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 00:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jbzGq-0002gp-3X
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 00:26:56 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jbzGp-0001aG-9h
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 00:26:55 -0400
Received: by mail-pg1-x542.google.com with SMTP id u35so4424709pgk.6
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 21:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6t60OdTEj/+df3YqBoi4RRSuD0MFWy3jgFZjTOxrC5Y=;
 b=ABjzplJhJ7v2EY8T2PgfadwVYMYTpiHXzRtnQiQkyE4tHYiLWv6q11Iga0HDgro8op
 sFg13WEznnn/nDw8bLQbIqm1rIJe/JWLZokpnzC9Ne5TzC0dYt0/u+1bOTs3mLemDtZG
 iJKQ27PM4/Tvbix1SectJRTOYh9omaCRJULwouNn8ck/B82K3A3vc5QqNNCMiG76SK5z
 IM3lazPWmdYRW7Q1nzdK5neqLhXPvv62pjemgG7+93b2a0f7x6XD6aUvUcTK6C8nZ70P
 9a/ylK595DV60+amKQnC5UdYL5c9GumoHzc4Xxyuf/yRWzI8nP4lHu5tyaJW6GiDf2JC
 rqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6t60OdTEj/+df3YqBoi4RRSuD0MFWy3jgFZjTOxrC5Y=;
 b=GETG/JFtDo+yxp8XqvJFgr2GbpIgZ4ZgyJLEpeN34wk6hwTyrZLGwtCna+4ye+6kQZ
 cqZKspu09bb/pST5teJihiUXybaS4h0DGrBYvXVI4TkXZsJwLGeq5SrWdovsW0C7cvse
 0PIylo8Wir0M7LLISFe9RgFBUlUJXyd/KPaWw/coaPJFbSH+iUFTN9KGk7Z4ZM/oDCzI
 mEewAL7Ci0DdIF6URhkqyCIZ/BsHvPSAgi8NiEz5h82LyX1LdoRBLOVTNjEt+hQH+yPo
 e6IVVhNr8B7A8K5I8MjCxSUxUfO5j8OakgcnF6En9UMWRRS6XCHUu4wTtwqbEQL4IXJH
 1rkA==
X-Gm-Message-State: AOAM531SO4nmH9CjkgE9ARU915lBl9ma1ebkM6lGWhtsBwL0KuEKqiTC
 2Ru95QYRekqwR9BPKw9sH5tsVQ==
X-Google-Smtp-Source: ABdhPJyH7IulLdrBCc4zXIN9Yv0wCSv7AC2Yz2CgZMKL/CyQ70uJA/LgBzwbW61NL8Ezx4Mta1z1RQ==
X-Received: by 2002:a17:90b:2396:: with SMTP id
 mr22mr2264422pjb.118.1590121613947; 
 Thu, 21 May 2020 21:26:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id q17sm5064573pfq.117.2020.05.21.21.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 21:26:53 -0700 (PDT)
Subject: Re: [PATCH v3 11/11] hw/semihosting: Make the feature depend of TCG, 
 and allow to disable it
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
 <20200521195911.19685-12-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <36db7554-dcc0-6b8c-e7b7-628c105d8fc7@linaro.org>
Date: Thu, 21 May 2020 21:26:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200521195911.19685-12-philmd@redhat.com>
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
X-List-Received-Date: Fri, 22 May 2020 04:26:56 -0000

On 5/21/20 12:59 PM, Philippe Mathieu-Daudé wrote:
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
> index 0000000000..035592dd86
> --- /dev/null
> +++ b/target/arm/Kconfig
> @@ -0,0 +1,2 @@
> +config SEMIHOSTING
> +    default y if TCG

Did you answer my question about replicating the TCG test?  If you did, I
missed it...


r~

