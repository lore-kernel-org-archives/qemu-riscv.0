Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lb4SA-00021g-PM
	for mharc-qemu-riscv@gnu.org; Mon, 26 Apr 2021 12:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lb4Rw-0001xi-Uk; Mon, 26 Apr 2021 12:51:10 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lb4Rv-0007nb-0b; Mon, 26 Apr 2021 12:51:08 -0400
Received: by mail-wr1-x430.google.com with SMTP id e5so27954322wrg.7;
 Mon, 26 Apr 2021 09:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VaLP2NqkUrm2QZV4VAYgWNe7cOSrZHnz0W/0W6GKOKU=;
 b=O/W0X0XsuWUaFNzF+sgVBhYS0eMi6XEkjLchY/Ccxq/TLqa0fzDjsH7oUpz0CpYJkW
 JiQH0fZ4koSXuYae0dxQY+3X7iwYMNHxcyzps5gLJ4Pppv53kBQhGN/lxNyhiNwD5qS9
 L6IYN4a+NM5p9oqVmtgldqjDBcDC36dd+p/4d9RJLHkE+b9SumZ78maP92yOEXLAvgoO
 +9mwxoKKOoRmlDa1N5wHRPzWgzGYTGjgq5nqtNyakkoD+cGV/g/ZvvulNMhBWeuYMgJk
 5Rh4OL7JzoCPXdCYPrey3JxQfkpXNPh9fdn8NfrWe+sEMknO+qPG/vq1xkmIk5utWqJ3
 udfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VaLP2NqkUrm2QZV4VAYgWNe7cOSrZHnz0W/0W6GKOKU=;
 b=V7LYesmGR/gSQIyTcGjgH2U5GEdlEc/COJHN3/4fMxBdAHbJChaGjY9PqmsSR5E6xX
 q48LLQsvbHSwVNXbS0JznRvx4cCpz/HxmMxXIhNU9GlbDyrkp+TN4Ag4gW5GInZOKaqe
 iGWd/jlS0q1QUDGIJ4ASyaCsX66tPeqirhek7DZ77tNjYQtas2809EGEHEGRZHX3EHSv
 7fXUYKa2yVhhgCypbi37XdXhf8RocHDJpuoLPBTHlIJDMBJU2wcASNwG1MqBOjVKvgNo
 KelXhpKlBwnYycta77GwkTJQ9EAksjo1lbIcAFWHNJz4hD/ltRdJTVce9F3J1b4pW4l2
 dYOQ==
X-Gm-Message-State: AOAM5312D4qH1DRWRkkrav1nJEAQzBSW6EIYC30ZIIl5W9byoMFlV1Pt
 EeP2YyYCjtEO8goPX2RtNXQ=
X-Google-Smtp-Source: ABdhPJw/7dU/DxSJvfuETVu0GVHROKtBbeXK4hNRrWzaAngV/6JN37XznqZO4XBiY0bi9TDZEOxvfw==
X-Received: by 2002:a05:6000:114e:: with SMTP id
 d14mr24090726wrx.281.1619455861212; 
 Mon, 26 Apr 2021 09:51:01 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y5sm676722wrm.61.2021.04.26.09.50.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 09:51:00 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v6 06/18] cpu: Assert DeviceClass::vmsd is NULL on user
 emulation
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Guan Xuetao <gxt@mprc.pku.edu.cn>
References: <20210422193902.2644064-1-f4bug@amsat.org>
 <20210422193902.2644064-7-f4bug@amsat.org> <YIbnKL8wiR7afBbj@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6c1a7a88-e7ff-14d1-e072-c576d57b7ea5@amsat.org>
Date: Mon, 26 Apr 2021 18:50:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIbnKL8wiR7afBbj@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 26 Apr 2021 16:51:21 -0000

On 4/26/21 6:15 PM, Dr. David Alan Gilbert wrote:
> * Philippe Mathieu-Daudé (f4bug@amsat.org) wrote:
>> Migration is specific to system emulation.
>>
>> Restrict current DeviceClass::vmsd to sysemu using #ifdef'ry,
>> and assert in cpu_exec_realizefn() that dc->vmsd not set under
>> user emulation.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  cpu.c                  | 1 +
>>  target/sh4/cpu.c       | 5 +++--
>>  target/unicore32/cpu.c | 4 ++++
>>  target/xtensa/cpu.c    | 4 +++-
>>  4 files changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/cpu.c b/cpu.c
>> index bfbe5a66f95..4fed04219df 100644
>> --- a/cpu.c
>> +++ b/cpu.c
>> @@ -138,6 +138,7 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>>  #endif /* CONFIG_TCG */
>>  
>>  #ifdef CONFIG_USER_ONLY
>> +    assert(qdev_get_vmsd(DEVICE(cpu)) == NULL);
> 
> Why not make that:
>    assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
>           qdev_get_vmsd(DEVICE(cpu)->unmigratable)
> 
> then you don't have to worry about the changes below.

Thanks for the tip! For my defense the VMStateDescription
fields aren't documented at all ;)

> 
> Dave
> 
>>      assert(cc->vmsd == NULL);
>>  #else
>>      if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {

