Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZkJB-00057z-9i
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 21:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZkJA-00057s-GT
 for qemu-riscv@nongnu.org; Thu, 22 Apr 2021 21:08:36 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZkJ8-0007r7-VV
 for qemu-riscv@nongnu.org; Thu, 22 Apr 2021 21:08:36 -0400
Received: by mail-pl1-x636.google.com with SMTP id p16so20477081plf.12
 for <qemu-riscv@nongnu.org>; Thu, 22 Apr 2021 18:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MUA1k1tQg1EnwA+MIy/CWrOl/o5O27lSJomM1qJOaAs=;
 b=pnT/8bjsgEEWxFHCr+twW7LgZKTX/tnYgXMyGZQXPlkoJjszgQuw8iiG4f0WO/rLWc
 cqdCtwRTLIzn8tCtei10iObK9KlCP1xusdV/yWOGIz677PVV0SoH6kLJo/YQk/zFDVQR
 4355nYtorcncwkXXerHTBrQpY2XH7WkEjaT3zhomIaIHUbIDqxXdwTljBQnbyRHkJlxI
 Jc6WDBys67O1H001a6xLJa+VCcL8FHxn+QPLWEyAjZN613eOHq3hytpqSs5q/8lwqVCj
 VYGRMlT91oN+08vUAFktAVKBdSp9H8AiJqWtSbOsRkSbLprWc5iPNyGGDn6gFaHMtgBO
 kogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MUA1k1tQg1EnwA+MIy/CWrOl/o5O27lSJomM1qJOaAs=;
 b=UpmdMksjQbDgKa1a4O/AGC6FdxPyrCYoPIKaNyZH0zfaBTuJqnKzHKRrFMN4SISB5q
 o2ci4+GtMfoCF3hcu3xPkcZsd8nz1OSLXunNSsfVQFjQDoEpk7AKbc98q95hWTBPBVut
 TDVIGLrdw8ChrmPbV1D7+jOH1MIBEOca0LHQAR4fCQBMq7omTeKSrp97ttCt668F4alv
 oX3MwUkch8hFcaRnOOhQj59Ob4/QHuJD99n7Q4bx9GZ8JZmU2OygJTN7vgO+npKm3pWv
 KIXBhYc0SwXS7mBnhVUevWPOJZzmyOytTnD76Wd52dV9RLTrsnLaQjnlUZM0Q2guQs4e
 ohAA==
X-Gm-Message-State: AOAM533+o5buJlnKSQEo3fKJa1SBpkAh5i86oPMad44v+OUtNtq5k9/I
 gdzkuu2o3ItV9Kke8GM4s1wRuw==
X-Google-Smtp-Source: ABdhPJxGOvIcSIF5Jqhe7xh9GM1aUQkj3fgXPD9lv9BUXEpYHw4QHt7964el1U7xGaPF6efxrv+lOA==
X-Received: by 2002:a17:90a:5b0a:: with SMTP id
 o10mr2838923pji.82.1619140113294; 
 Thu, 22 Apr 2021 18:08:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w7sm3095480pff.208.2021.04.22.18.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 18:08:32 -0700 (PDT)
Subject: Re: [PATCH v6 06/18] cpu: Assert DeviceClass::vmsd is NULL on user
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-riscv@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Claudio Fontana <cfontana@suse.de>,
 qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>
References: <20210422193902.2644064-1-f4bug@amsat.org>
 <20210422193902.2644064-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f53ad5da-3016-229f-9bb0-f6c8f06f4a36@linaro.org>
Date: Thu, 22 Apr 2021 18:08:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422193902.2644064-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 23 Apr 2021 01:08:36 -0000

On 4/22/21 12:38 PM, Philippe Mathieu-Daudé wrote:
> Migration is specific to system emulation.
> 
> Restrict current DeviceClass::vmsd to sysemu using #ifdef'ry,
> and assert in cpu_exec_realizefn() that dc->vmsd not set under
> user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   cpu.c                  | 1 +
>   target/sh4/cpu.c       | 5 +++--
>   target/unicore32/cpu.c | 4 ++++
>   target/xtensa/cpu.c    | 4 +++-
>   4 files changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

