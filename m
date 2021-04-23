Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZkR3-0007v6-VC
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 21:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZkR2-0007tk-E5
 for qemu-riscv@nongnu.org; Thu, 22 Apr 2021 21:16:44 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZkQz-0003mX-IR
 for qemu-riscv@nongnu.org; Thu, 22 Apr 2021 21:16:44 -0400
Received: by mail-pf1-x436.google.com with SMTP id m11so33003738pfc.11
 for <qemu-riscv@nongnu.org>; Thu, 22 Apr 2021 18:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O/kCEpTC4yHiCkbdHvM/Imm+Gi/Aq1a3B/+HkgrDKXc=;
 b=M3Lw0lUQne+7WlSZFuaG93xSzzfshNbxK4sDm20IwhQAZp4BF8hJ5C4MMCHhLjLvv8
 9jI6309DEIcsKgwyVxkLL5KVzT7do0OyODHC9ooahEAUqa8CAnMtxfF9ulPFnAfmorhz
 p5O+g6IpYRgvLSVkLJ2yTZHpaRpVC06zHv68efvHqpNysWbu/N3IQaIOZD6LstUlxz37
 20BC9X6Ch64VtyfEe6bld7yGO0FmCLMAmg/sCXZarghNQ6bO8HcoepSJDW3K5dOsx7Hn
 Ad9JzNsaqEC2iq9sN6iG2hpzfQ+aQ9HiS5QkaVutYWuEBcNgdZwy45sd/l176g03l1h1
 eFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O/kCEpTC4yHiCkbdHvM/Imm+Gi/Aq1a3B/+HkgrDKXc=;
 b=tLyCeuk4HCQM+VToY7eKvMk3EcqalIyh4JS9h5T1jmZFehm8OecA2/Ia2FcRjnjk+l
 7w9r79Hf0/zg+q4Im6rcxavyfWNcammPEno95yYvkp5p0dlQiTfVFPJJFaYPy9eUFPhf
 MzCv5QAbzDkPJLtP5mjMMmoayXHwLJ+NeY6neDK75tj9LM+pVv/sYedn/Kn6GsOvUw/C
 MSIPCEwxva0Vf1BlfGYX/Q7/HK6Thi42hgMzjYJRBeZ9M9F8iPqJzlPdF8Y6+r8LVsdI
 kH6ypiL5BbzgHpwovv66LtXENmc7Z22VQxX1FP3r1bY5SqsrmRnOw1M/HjlV9zJ7oDUJ
 xEmA==
X-Gm-Message-State: AOAM5328w2JLPTf6s7yNbLYGSIei4v6BfIvHg2I2KfqeLTAYMDbWG6Hm
 R8rsVAfLdJT6vLjXQnwDyoL6sg==
X-Google-Smtp-Source: ABdhPJz3Wf9w+T/8dyk814laKSEVojaBGL+YfzQD3LTcq/vfJiXitDcCA4VerGfCJqP9dIAmW26mNw==
X-Received: by 2002:a63:231c:: with SMTP id j28mr1377352pgj.165.1619140600079; 
 Thu, 22 Apr 2021 18:16:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id t21sm2988123pfg.211.2021.04.22.18.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 18:16:39 -0700 (PDT)
Subject: Re: [PATCH v6 08/18] cpu/{avr, lm32,
 moxie}: Set DeviceClass vmsd field (not CPUClass one)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-riscv@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Claudio Fontana <cfontana@suse.de>,
 qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Michael Walle <michael@walle.cc>, Anthony Green <green@moxielogic.com>
References: <20210422193902.2644064-1-f4bug@amsat.org>
 <20210422193902.2644064-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eeaa99ae-da4f-d76d-127e-18a8857de8df@linaro.org>
Date: Thu, 22 Apr 2021 18:16:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422193902.2644064-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-List-Received-Date: Fri, 23 Apr 2021 01:16:44 -0000

On 4/22/21 12:38 PM, Philippe Mathieu-Daudé wrote:
> See rationale in previous commit. Targets should use the vmsd field
> of DeviceClass, not CPUClass. As migration is not important on the
> avr/lm32/moxie targets, break the migration compatibility and set
> the DeviceClass vmsd field.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/avr/cpu.c   | 2 +-
>   target/lm32/cpu.c  | 2 +-
>   target/moxie/cpu.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)

Do you not have to increment the vmstate versions?

Though I can't see how the version numbers would even get compared, since we're 
looking for them in different locations?


r~

