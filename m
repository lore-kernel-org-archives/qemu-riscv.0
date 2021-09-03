Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMFcR-0007RE-4N
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 16:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFcQ-0007No-6R
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:16:58 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFcA-0005ir-J3
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 16:16:57 -0400
Received: by mail-wr1-x429.google.com with SMTP id z4so311708wrr.6
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 13:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ksvR3vXBtwALfl0I6bUYOq6zF1YdgeJMV8dFDRL1P+g=;
 b=F+LmEPrSCssgf1eqjM+WBloAvOVq2tL7NMyM6LZCHirhU39DXiDO2uLD9ug3iNaHCK
 qAQxo2bwgbel/l5ZzJa4uPRl/EqjN0sQA7XIe3XklYehe60QyUJs5qg1vnpnfs/LYzJ8
 F50mpECSrD9JTS8cWWsDSVPn2dEFp7h2GfA9zAOn6e5EfN/aiCylKqANnhUX+0GyzxMA
 5YbCx/uH9oIK3BVZImpikPWK6g5wC7VESYux9bpW/knmD2hNngQDnsSLtz91Hsh54IH+
 4JT7IufJEjtYH/tbJ32xqBZvfx5N5H001O4TnBoFg7L9NuRj3KiL2d3ZfaMPEXO0z6EN
 fEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ksvR3vXBtwALfl0I6bUYOq6zF1YdgeJMV8dFDRL1P+g=;
 b=UoPDQPjfq+3Pa0StJP1kMbLcLWmGokKyj9JTWz/ePsJZEk87XwFgrDdq7CN6IGWOp9
 pCsTind5MyCye4ikIKCVVwgNwbZHFQNhG2/Y+VKYtoZgyXIViGCtIgdaii/xfG2NbLfP
 YQdZbC6BmBhpGcf1NGyP6smB8a6/XCu7kkR4ABtcCcv9hm/rVqfv3wKknWRR4GMb4YKD
 k61FD7ZPjTGkAN0ZZlTDctLbQHeqKVv9ub9ZTHcKaNAZAuFpLi7CxV6kdQh49rFIfojf
 xcbdmbkokiGn+6E19oVC/bVnDYDfDE3AigR2l0Y7H+NbXsMtqAUQPjLP0s5mub5cCmTw
 bkrA==
X-Gm-Message-State: AOAM532yHx0l1GD/ccex5WGRNfn1T6cCI8iiR5l/SqHAnZORI2WxrYP9
 ahi7hKfi9zD9NlHG1r9AL24k8g==
X-Google-Smtp-Source: ABdhPJzV+oCZLVl1R3jywIXOYAACRgU/ouMC2nXN7qXT1ry456hLKIT4YtHfUNsVqaTI8qbV2+dfAA==
X-Received: by 2002:adf:eb4a:: with SMTP id u10mr794817wrn.11.1630700201045;
 Fri, 03 Sep 2021 13:16:41 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id b18sm201319wrr.89.2021.09.03.13.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:16:40 -0700 (PDT)
Subject: Re: [PATCH v3 06/30] accel/whpx: Implement AccelOpsClass::has_work()
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
 <20210902161543.417092-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7d58bfa-20f7-502b-f307-9ed8f9f4def6@linaro.org>
Date: Fri, 3 Sep 2021 22:16:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Sep 2021 20:16:58 -0000

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Implement WHPX has_work() handler in AccelOpsClass and
> remove it from cpu_thread_is_idle() since cpu_has_work()
> is already called.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   softmmu/cpus.c                    | 4 +---
>   target/i386/whpx/whpx-accel-ops.c | 6 ++++++
>   2 files changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

