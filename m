Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbA0K-0000Ky-Ee
	for mharc-qemu-riscv@gnu.org; Tue, 19 May 2020 17:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jbA0I-0000HC-WA
 for qemu-riscv@nongnu.org; Tue, 19 May 2020 17:42:27 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jbA0H-0000TA-SD
 for qemu-riscv@nongnu.org; Tue, 19 May 2020 17:42:26 -0400
Received: by mail-pf1-x441.google.com with SMTP id b190so514008pfg.6
 for <qemu-riscv@nongnu.org>; Tue, 19 May 2020 14:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nw6O/vTT+E8Mxtuq9SAx4g0rj9wiZLc+1sIiGwNLVkA=;
 b=R0aa1j7WkOY2GiiHQX+/mXzmvb7PlqA7REwJ59dpfjz0wH2HVMoyX9Z0ndpUXuHK+Q
 /KWjZVitCqxCcveFVsyxWV/sYCuTwTijV4RL0JGZw0XPgKjWOIk9VSRBh85osFWB+J3l
 VEW0UhmXn8xZjsfK5tcyIClZCOuoWjOk7wfU90bTbt7qKEqmgAOa77runt4l+R/G7DjO
 wMcjHx4kk5DG2nnI5DTJJ315ZiO9WjO454KIehB4oV1uxZHA8X+PNwX0RkayewQP9NxS
 rRzQZfo1I5kYj7kBiNKCFK4uKoR+szMThqGoiMiQ6+lE45SnogQFl+oZUYcCqbxT5RVQ
 IPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nw6O/vTT+E8Mxtuq9SAx4g0rj9wiZLc+1sIiGwNLVkA=;
 b=gqEpBHbKCGp6TYzTUyDGVcMms/xdZ+1LYY45KyHXfhYqj3zIX4jPXpkMMza+y/Kxkj
 9MdQGsy+oeJ6kDcjEG2t+MtbyWGUhJEEqEkkbsIx0ZOPWcMk1x83NoaIHKkpK7BMYbQs
 BrDgQoIVbucVWmutE/ID13E4yPMkF3hb3h2dIDlsyju1os4+20AuJtuJeH4CtR4hNZyh
 0/f2VzMTiCK0SeLwwLFwGVwrT4QaPiVLZfBvt8qnSlfG03CaUU6ssQs3c3xHc6xA48t3
 Hx/CEaL0WbB+ymstEgfbujThOIehfx7yzkyT0lLm4NuckkLBALE1gNjKhi3AoSwCCHtc
 TVtg==
X-Gm-Message-State: AOAM53130nAai+CdXJ17T8NIsyX+XGf9b7f/2MC2nW4pBcDafuo/bsTm
 skD7PkZi5V0bEUPqbIxCUXFmqg==
X-Google-Smtp-Source: ABdhPJxnavV4hRyjr6rJbh9w41mz0XHfZeDzrjVDcsA4BK6TEInttraXpc0uqBFmOxNqZ+dmpunDBw==
X-Received: by 2002:a65:614b:: with SMTP id o11mr1059106pgv.443.1589924544588; 
 Tue, 19 May 2020 14:42:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s102sm379040pjb.57.2020.05.19.14.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2020 14:42:23 -0700 (PDT)
Subject: Re: [PATCH v2 09/10] Makefile: Allow target-specific optional Kconfig
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
 <20200515170804.5707-10-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81f9e132-1709-e67b-9cac-8d7707ad47e3@linaro.org>
Date: Tue, 19 May 2020 14:42:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515170804.5707-10-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
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
X-List-Received-Date: Tue, 19 May 2020 21:42:27 -0000

On 5/15/20 10:08 AM, Philippe Mathieu-Daudé wrote:
> Allow use of target-specific Kconfig file.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


