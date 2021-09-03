Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMFai-0004TR-99
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFaY-0004R8-EI
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:15:02 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFaW-0004Mk-SD
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:15:02 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z4so306615wrr.6
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4eHHYFkoRaMsvUTt4qW8qWzKOCRjBx/Npk4Tb094AvQ=;
 b=cLO22hnYLpEg/1RD0FCiO3YdVJ9j79J1/7mkf4AG2YXIXe2aFGD359ZxjySxf7C/iF
 tzfinMqq37GvKuJlfgORv3JQsLRcmYumsBYo2QPaZMoawXGhFMbSYBGnHCvKL0IbQik1
 45MV1RijIs6tVAHVpo7wuxRVTGnn6P3tAg9pOxmHYSpWbVd9DiYxU9bQGzq/RI9TejCi
 IuFmIe0QtC8F7fLOeMyaxPg7y3lcT3EAD/GnAD/B9pA4KX7M04jhATDZ7A8/fr7gbEdx
 fOoED7iAFaPcN+AM1JnCIYtXX45hgsKvOLuQ5XpA+AqILLfo9hIxUKs545+6dSzo6DRU
 0nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4eHHYFkoRaMsvUTt4qW8qWzKOCRjBx/Npk4Tb094AvQ=;
 b=ghbdOBx7jIx0Yf0AEuS6ngqWFaBB/tJP6NdOVmAG63nGdrDq58Rc1UD2nB38RY8X5H
 FGOlk00rlSBCPdfAD95dMRFf8nwB+O/K9AK6W7kbxpNcwX83wLFEe6a+0SfI5tGnrxic
 etmf+i2kzxyScJoFKBTxLDrgMDPXkw23lGuXCOKoXc2c8WBwOz8733/nrnZcocicXaN3
 l1xUVX36G+EjLq4ORJbl+/5cs+TSI0AlwNdDVQk5wqDodOuArQj3imq8nfvJpMZM0/XI
 okpFC9z7TwWgpLDG1VkQ0g1VQ2dMCsClCJK+5MFlCrbpForFV/4H9oseDD9g8UrlbCaW
 zY7g==
X-Gm-Message-State: AOAM5335zIE6Sq6Y7ppKieV9P/+XVjjSnmX3Z0XBwm2/tKREC5gSuzNx
 GBWbZ1WgYFdPYL95785owE9LjQ==
X-Google-Smtp-Source: ABdhPJyHZZGXFXfUxy0q9drjOdzklbpmSyqwplr6BLWUGT4wjUUKjoKaSTakGLOyf3y9u9KCe6dQnw==
X-Received: by 2002:a5d:6cc9:: with SMTP id c9mr814056wrc.12.1630700099566;
 Fri, 03 Sep 2021 13:14:59 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id l124sm343991wml.8.2021.09.03.13.14.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:14:59 -0700 (PDT)
Subject: Re: [PATCH v3 04/30] sysemu: Introduce AccelOpsClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <ehabkost@redhat.com>, 
 Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, qemu-s390x@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Laurent Vivier <laurent@vivier.eu>,
 Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
 Wenchao Wang <wenchao.wang@intel.com>, xen-devel@lists.xenproject.org,
 Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Colin Xu <colin.xu@intel.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Stafford Horne <shorne@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d97a0dbf-842c-5d90-e4d9-c2faa5d618cc@linaro.org>
Date: Fri, 3 Sep 2021 22:14:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-List-Received-Date: Fri, 03 Sep 2021 20:15:02 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Introduce an accelerator-specific has_work() handler.
> Eventually call it from cpu_has_work().
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/sysemu/accel-ops.h | 5 +++++
>   softmmu/cpus.c             | 3 +++
>   2 files changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

