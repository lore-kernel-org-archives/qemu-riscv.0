Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZkMa-0006TN-EM
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 21:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZkMY-0006SV-BZ
 for qemu-riscv@nongnu.org; Thu, 22 Apr 2021 21:12:06 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZkMU-0001ad-0V
 for qemu-riscv@nongnu.org; Thu, 22 Apr 2021 21:12:06 -0400
Received: by mail-pg1-x52a.google.com with SMTP id f29so34073664pgm.8
 for <qemu-riscv@nongnu.org>; Thu, 22 Apr 2021 18:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s61FUzi5MNtP7sS0CZaRB6auNAi0yi/CgDF7ndajXxQ=;
 b=dg/KYH0tHKcAcOmLAx9qvJBWirmHdAHgGbCQB+AH7S+9q72qtRPka36hRVEibGKGTr
 siPI3AwMGowb6fedgsrKQJKTO8pNR+rt0aUUbuJugnOOdB0tRrCqRM9vyAj2nLtCCrY2
 /yQmDjfzth16m+4XnkFTVI9Hjo97r4kKB5+rCaASnwh+km1kVmdwlz8NzyxxDkl+hsZL
 e/W9BwRfEv4HVHGFYqGyqWtO6UcaW7m+SeQcF5LtnZXLZXYbpJq4OYmp6Tt16fwA3o3n
 LEW/cFg8CoNVTdr6dhH4iVmbKmN6U2VT7bzn51Ho9ZWK7twoAlU11Z92p6G2AHun/sqm
 lIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s61FUzi5MNtP7sS0CZaRB6auNAi0yi/CgDF7ndajXxQ=;
 b=hKBYjIPJkrsr5LGC+t6k8857MZ6Dr+itNNlFgmLOh0jxxpysVMRk7IliNLnemHgvc0
 Ep1i2Lc9Mh6TbndhUc0jOi2Ms5K7Of4b/ZILmTmJV88nOkokazVYxAl6KJpWVdFxmvdg
 bGEzVjNuKf9i5gu/mwnjIqTahiSSJ4U/TfzLB8X92so/BGo1BL9pu5TNxxjoCZN+G5tc
 BKAXJi7td7r8d8k5QggqWCz2IKGNizYdGlvW1EQMFal0Xi4PcFhXUMvi6+Fin5lTbu7q
 80DIkGB8Rdmdr98vHZfvwIlMb9cWSc8lNTRWcgKh1R96RYX7DZ3+P/8qsiRebFdkhRDP
 9TfA==
X-Gm-Message-State: AOAM531Co8reoeIp0pYSMQnSczVOgHQTLtvxSzO52x6prpbP3TORKCFO
 kQ1CvbAcJz9n64SuB6R2djzVJw==
X-Google-Smtp-Source: ABdhPJzhy4f+ydv2RTXueL0sG8fI8pNKbRCixkAYTmYt6sJJEMAa2kzmTdDnOZu9HXaQ4w9IE0A0Yg==
X-Received: by 2002:a63:164a:: with SMTP id 10mr1468413pgw.186.1619140320489; 
 Thu, 22 Apr 2021 18:12:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id ge22sm3131427pjb.53.2021.04.22.18.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 18:12:00 -0700 (PDT)
Subject: Re: [PATCH v6 07/18] cpu: Rename CPUClass vmsd -> legacy_vmsd
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-riscv@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Claudio Fontana <cfontana@suse.de>,
 qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Walle <michael@walle.cc>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Anthony Green <green@moxielogic.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20210422193902.2644064-1-f4bug@amsat.org>
 <20210422193902.2644064-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0b26363b-d778-2fee-89f1-7d9ace40d052@linaro.org>
Date: Thu, 22 Apr 2021 18:11:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422193902.2644064-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Fri, 23 Apr 2021 01:12:06 -0000

On 4/22/21 12:38 PM, Philippe Mathieu-Daudé wrote:
> Quoting Peter Maydell [*]:
> 
>    There are two ways to handle migration for
>    a CPU object:
> 
>    (1) like any other device, so it has a dc->vmsd that covers
>    migration for the whole object. As usual for objects that are a
>    subclass of a parent that has state, the first entry in the
>    VMStateDescription field list is VMSTATE_CPU(), which migrates
>    the cpu_common fields, followed by whatever the CPU's own migration
>    fields are.
> 
>    (2) a backwards-compatible mechanism for CPUs that were
>    originally migrated using manual "write fields to the migration
>    stream structures". The on-the-wire migration format
>    for those is based on the 'env' pointer (which isn't a QOM object),
>    and the cpu_common part of the migration data is elsewhere.
> 
>    cpu_exec_realizefn() handles both possibilities:
> 
>    * for type 1, dc->vmsd is set and cc->vmsd is not,
>      so cpu_exec_realizefn() does nothing, and the standard
>      "register dc->vmsd for a device" code does everything needed
> 
>    * for type 2, dc->vmsd is NULL and so we register the
>      vmstate_cpu_common directly to handle the cpu-common fields,
>      and the cc->vmsd to handle the per-CPU stuff
> 
>    You can't change a CPU from one type to the other without breaking
>    migration compatibility, which is why some guest architectures
>    are stuck on the cc->vmsd form. New targets should use dc->vmsd.
> 
> To avoid new targets to start using type (2), rename cc->vmsd as
> cc->legacy_vmsd. The correct field to implement is dc->vmsd (the
> DeviceClass one).
> 
> See also commit b170fce3dd0 ("cpu: Register VMStateDescription
> through CPUState") for historic background.
> 
> [*]https://www.mail-archive.com/qemu-devel@nongnu.org/msg800849.html
> 
> Cc: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/core/cpu.h           |  5 +++--
>   cpu.c                           | 12 ++++++------
>   target/arm/cpu.c                |  2 +-
>   target/avr/cpu.c                |  2 +-
>   target/i386/cpu.c               |  2 +-
>   target/lm32/cpu.c               |  2 +-
>   target/mips/cpu.c               |  2 +-
>   target/moxie/cpu.c              |  2 +-
>   target/riscv/cpu.c              |  2 +-
>   target/s390x/cpu.c              |  2 +-
>   target/sparc/cpu.c              |  2 +-
>   target/ppc/translate_init.c.inc |  2 +-
>   12 files changed, 19 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

